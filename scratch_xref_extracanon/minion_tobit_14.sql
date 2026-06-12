-- ----- fragment: minion_tobit_14.sql (session253 tobit 14) -----
-- Source anchor: apocrypha/tobit ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob14 (view _session253_tob14_lookup). Sort band base 59925, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-14-nineveh-overthrown
  ('apocrypha', 'tobit', 14, 4, 'canon', 'jonah', 3, 4, 'free', E'Jonah 3:4 — *And Jonah began to enter into the city a day’s journey, and he cried, and said, Yet forty days, and Nineveh shall be overthrown.* This is the very word of Jonas that Tobit 14:4 names and stakes his counsel upon.'),
  ('apocrypha', 'tobit', 14, 4, 'canon', 'nahum', 1, 1, 'free', E'Nahum 1:1 — *The burden of Nineveh. The book of the vision of Nahum the Elkoshite.* A whole prophetic book is the burden against the city Tobit 14:4 says shall be overthrown.'),
  ('apocrypha', 'tobit', 14, 8, 'canon', 'nahum', 3, 7, 'free', E'Nahum 3:7 — *And it shall come to pass, that all they that look upon thee shall flee from thee, and say, Nineveh is laid waste: who will bemoan her? whence shall I seek comforters for thee?* The fulfilment Tobit 14:8 says shall surely come to pass.'),
  -- thread: tobit-14-temple-not-like-first
  ('apocrypha', 'tobit', 14, 5, 'canon', 'haggai', 2, 9, 'free', E'Haggai 2:9 — *The glory of this latter house shall be greater than of the former, saith Yahuah Tseva''ot (LORD of hosts): and in this place will I give peace, saith Yahuah Tseva''ot (LORD of hosts).* The ''temple, but not like to the first'' of Tobit 14:5 is the very latter house Haggai measures.'),
  ('apocrypha', 'tobit', 14, 5, 'canon', 'ezekiel', 37, 26, 'free', E'Ezekiel 37:26 — *Moreover I will make a covenant of peace with them; it shall be an everlasting covenant with them: and I will place them, and multiply them, and will set my sanctuary in the midst of them for evermore.* The house built ''for ever with a glorious building'' that Tobit 14:5 awaits past the fulfilled age.'),
  ('apocrypha', 'tobit', 14, 4, 'canon', 'ezekiel', 37, 28, 'free', E'Ezekiel 37:28 — *And the heathen shall know that I Yahuah (LORD) do sanctify Yashar''el (Israel), when my sanctuary shall be in the midst of them for evermore.* The desolation Tobit 14:4 names is only ''for a time''; the sanctuary''s end is everlasting.'),
  -- thread: tobit-14-scattered-gathered
  ('apocrypha', 'tobit', 14, 5, 'canon', 'ezekiel', 37, 21, 'free', E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land.* The return ''from all places of their captivity'' of Tobit 14:5 is Ezekiel''s own gathering of the scattered house.'),
  ('apocrypha', 'tobit', 14, 5, 'canon', 'zephaniah', 3, 20, 'free', E'Zephaniah 3:20 — *At that time will I bring you again, even in the time that I gather you: for I will make you a name and a praise among all people of the earth, when I turn back your captivity before your eyes, saith Yahuah (LORD).* The turning back of captivity Tobit 14:5 foresees, spoken to the dispersed by the prophet.'),
  ('apocrypha', 'tobit', 14, 7, 'canon', 'isaiah', 60, 4, 'free', E'Isaiah 60:4 — *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* The exalted, regathered people of Tobit 14:7 are Isaiah''s homecoming sons and daughters.'),
  -- thread: tobit-14-nations-bury-idols
  ('apocrypha', 'tobit', 14, 6, 'canon', 'isaiah', 2, 20, 'free', E'Isaiah 2:20 — *In that day a man shall cast his idols of silver, and his idols of gold, which they made each one for himself to worship, to the moles and to the bats.* The very burying of idols Tobit 14:6 foretells of all nations.'),
  ('apocrypha', 'tobit', 14, 6, 'canon', 'zephaniah', 3, 9, 'free', E'Zephaniah 3:9 — *For then will I turn to the people a pure language, that they may all call upon the name of Yahuah (LORD), to serve him with one consent.* The turning of all nations to fear Yahuah truly in Tobit 14:6 is the pure language that calls on His name.'),
  ('apocrypha', 'tobit', 14, 6, 'canon', 'zechariah', 8, 23, 'free', E'Zechariah 8:23 — *Thus saith Yahuah Tseva''ot (LORD of hosts); In those days it shall come to pass, that ten men shall take hold out of all languages of the nations, even shall take hold of the skirt of him that is a Yahudi (Jew), saying, We will go with you: for we have heard that Elohim (God) is with you.* The nations that turn in Tobit 14:6 lay hold of Israel to find the truth.'),
  -- thread: tobit-14-nations-praise-glorious-jerusalem
  ('apocrypha', 'tobit', 14, 7, 'canon', 'isaiah', 2, 3, 'free', E'Isaiah 2:3 — *And many people shall go and say, Come ye, and let us go up to the mountain of Yahuah (LORD), to the house of the Elohim (God) of Jacob; and he will teach us of his ways, and we will walk in his paths: for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem.* The all-nations praise of Tobit 14:7 is Isaiah''s pilgrimage to the house in glorious Jerusalem.'),
  ('apocrypha', 'tobit', 14, 7, 'canon', 'zechariah', 8, 22, 'free', E'Zechariah 8:22 — *Yea, many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem, and to pray before Yahuah (LORD).* The nations that praise Yahuah in Tobit 14:7 come to seek Him in the rebuilt city.'),
  ('apocrypha', 'tobit', 14, 5, 'canon', 'isaiah', 60, 3, 'free', E'Isaiah 60:3 — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising.* The Jerusalem built gloriously in Tobit 14:5 is Isaiah''s risen city to whose light the gentiles come.'),
  -- thread: tobit-14-keep-the-law
  ('apocrypha', 'tobit', 14, 9, 'canon', 'ezekiel', 37, 24, 'free', E'Ezekiel 37:24 — *And David my servant shall be king over them; and they all shall have one shepherd: they shall also walk in my judgments, and observe my statutes, and do them.* The law-keeping Tobit 14:9 charges his son is the very obedience the regathered house renders under one shepherd.'),
  ('apocrypha', 'tobit', 14, 9, 'canon', 'zechariah', 8, 16, 'free', E'Zechariah 8:16 — *These are the things that ye shall do; Speak ye every man the truth to his neighbour; execute the judgment of truth and peace in your gates.* The ''merciful and just'' walk Tobit 14:9 commands is Zechariah''s plain Torah for the city of truth.'),
  -- thread: tobit-14-alms-deliver-from-death
  ('apocrypha', 'tobit', 14, 11, 'canon', 'proverbs', 11, 4, 'free', E'Proverbs 11:4 — *Riches profit not in the day of wrath: but righteousness delivereth from death.* The very lesson Tobit 14:11 presses — that righteousness, not riches, delivers.'),
  ('apocrypha', 'tobit', 14, 11, 'canon', 'psalms', 41, 1, 'free', E'Psalms 41:1 — *Blessed is he that considereth the poor: Yahuah (LORD) will deliver him in time of trouble.* The almsgiver who ''considers'' the poor is delivered, as Tobit 14:11 bids his son consider what alms doeth.'),
  ('apocrypha', 'tobit', 14, 11, 'canon', 'matthew', 6, 4, 'free', E'Matthew 6:4 — *That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly.* The Messiah carries Tobit''s closing charge forward, the secret alms of Tobit 14:11 rewarded by the Father.'),
  ('apocrypha', 'tobit', 14, 10, 'canon', 'acts', 10, 4, 'free', E'Acts 10:4 — *And when he looked on him, he was afraid, and said, What is it, Yahuah (Lord)? And he said unto him, Thy prayers and thine alms are come up for a memorial before Elohim (God).* As alms saved Manasses from the snare in Tobit 14:10, so Cornelius''s alms come up as a memorial before Elohim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-14-nineveh-overthrown',
       E'Nineveh shall be overthrown — as Jonah spoke',
       E'Tobit''s deathbed faith rests on a prophet''s word already given: *Go into Media my son, for I surely believe those things which Jonas the prophet spoke of Nineve, that it shall be overthrown* (Tobit 14:4), and again *depart out of Nineve, because that those things which the prophet Jonas spoke shall surely come to pass* (Tobit 14:8). It ain''t new — Jonah had cried it in the streets: *Yet forty days, and Nineveh shall be overthrown* (Jonah 3:4). And Nahum took up the same burden against the bloody city — *The burden of Nineveh* (Nahum 1:1) — until the watchers could only say, *Nineveh is laid waste: who will bemoan her?* (Nahum 3:7). The dying man trusts the prophets because the prophets are Yahuah''s own word that does not fall.',
       sv.verse_id, ev.verse_id, 'extras', 59925
  FROM _session253_tob14_lookup sv, _session253_tob14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=14 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-14-temple-not-like-first',
       E'A temple, but not like the first — until the time be fulfilled',
       E'Tobit measures the long arc of exile and return: *Jerusalem shall be desolate, and the house of Yahuah (God) in it shall be burned, and shall be desolate for a time* (Tobit 14:4), *And that again Yahuah (God) will have mercy on them, and bring them again into the land, where they shall build a temple, but not like to the first, until the time of that age be fulfilled* (Tobit 14:5). The second house would indeed rise less in stone yet greater in glory, as Haggai promised the returning builders: *The glory of this latter house shall be greater than of the former, saith Yahuah Tseva''ot (LORD of hosts): and in this place will I give peace* (Haggai 2:9). And the everlasting sanctuary Tobit awaits past ''the time of that age'' is Ezekiel''s covenant of peace: *I will place them, and multiply them, and will set my sanctuary in the midst of them for evermore* (Ezekiel 37:26).',
       sv.verse_id, ev.verse_id, 'extras', 59928
  FROM _session253_tob14_lookup sv, _session253_tob14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=14 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-14-scattered-gathered',
       E'Our brothers scattered — gathered again to the land',
       E'Tobit sees both the scattering and the regathering of the whole house: *our brothers shall lie scattered in the earth from that good land* (Tobit 14:4), yet *afterward they shall return from all places of their captivity, and build up Jerusalem gloriously* (Tobit 14:5), and *Yahuah (God) shall exalt his people* (Tobit 14:7). This is no church replacing Israel but the two sticks made one — Ezekiel''s gathering: *I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21). Zephaniah seals it: *At that time will I bring you again, even in the time that I gather you... when I turn back your captivity before your eyes* (Zephaniah 3:20). And Isaiah names the homecoming children: *thy sons shall come from far, and thy daughters shall be nursed at thy side* (Isaiah 60:4).',
       sv.verse_id, ev.verse_id, 'extras', 59931
  FROM _session253_tob14_lookup sv, _session253_tob14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=14 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-14-nations-bury-idols',
       E'All nations shall turn and bury their idols',
       E'The dying man''s widest hope: *And all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols* (Tobit 14:6). It ain''t new — Isaiah saw the day the idols themselves are flung away: *In that day a man shall cast his idols of silver, and his idols of gold, which they made each one for himself to worship, to the moles and to the bats* (Isaiah 2:20), *And the idols he shall utterly abolish* (Isaiah 2:18). Zephaniah names the gift that makes the turning possible — a converted tongue: *For then will I turn to the people a pure language, that they may all call upon the name of Yahuah (LORD), to serve him with one consent* (Zephaniah 3:9). And Zechariah shows the nations laying hold of Israel to find the truth: *ten men shall take hold out of all languages of the nations, even shall take hold of the skirt of him that is a Yahudi (Jew), saying, We will go with you: for we have heard that Elohim (God) is with you* (Zechariah 8:23).',
       sv.verse_id, ev.verse_id, 'extras', 59934
  FROM _session253_tob14_lookup sv, _session253_tob14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=14 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-14-nations-praise-glorious-jerusalem',
       E'All nations shall praise — the glory of the rebuilt city',
       E'Tobit binds the regathered city to a worldwide praise: *build up Jerusalem gloriously, and the house of Yahuah (God) shall be built in it for ever with a glorious building* (Tobit 14:5), *So shall all nations praise Yahuah (God), and his people shall confess Yahuah (God)... and all those which love Yahuah (God) in truth and justice shall rejoice* (Tobit 14:7). This is Isaiah''s pilgrimage of the peoples to the mountain of the house: *And many people shall go and say, Come ye, and let us go up to the mountain of Yahuah (LORD)... for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem* (Isaiah 2:3). It is the strong nations seeking Him there: *Yea, many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem* (Zechariah 8:22). And it is the gentiles streaming to the city''s risen light: *And the Gentiles shall come to thy light, and kings to the brightness of thy rising* (Isaiah 60:3).',
       sv.verse_id, ev.verse_id, 'extras', 59937
  FROM _session253_tob14_lookup sv, _session253_tob14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=14 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-14-keep-the-law',
       E'Keep the law and the commandments — that it may go well',
       E'Tobit''s first charge to his son is Torah kept in exile, never law-as-curse: *But keep you the law and the commandments, and shew thyself merciful and just, that it may go well with you* (Tobit 14:9). The promised well-being is the deuteronomic blessing carried into the prophets, where the regathered house at last keeps the statutes from the heart: *they shall also walk in my judgments, and observe my statutes, and do them* (Ezekiel 37:24). And the city of truth Tobit''s son is to live toward is built on the same plain obedience: *These are the things that ye shall do; Speak ye every man the truth to his neighbour; execute the judgment of truth and peace in your gates* (Zechariah 8:16).',
       sv.verse_id, ev.verse_id, 'extras', 59940
  FROM _session253_tob14_lookup sv, _session253_tob14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=14 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-14-alms-deliver-from-death',
       E'Consider what alms doeth — and how righteousness delivers',
       E'The whole witness of Tobit closes on a single charge: *Manasses gave alms, and escaped the snares of death which they had set for him* (Tobit 14:10), *Wherefore now, my son, consider what alms doeth, and how righteousness does deliver* (Tobit 14:11). It ain''t new — Proverbs had said it in two words: *Riches profit not in the day of wrath: but righteousness delivereth from death* (Proverbs 11:4). The Psalter blesses the almsgiver: *Blessed is he that considereth the poor: Yahuah (LORD) will deliver him in time of trouble* (Psalms 41:1). And the Messiah took up Tobit''s very ethic in the Sermon: *But when thou doest alms, let not thy left hand know what thy right hand doeth: That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly* (Matthew 6:3-4) — alms that come up, as Cornelius''s did, *for a memorial before Elohim (God)* (Acts 10:4).',
       sv.verse_id, ev.verse_id, 'extras', 59943
  FROM _session253_tob14_lookup sv, _session253_tob14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=14 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-14-nineveh-overthrown
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jonah 3:4 — *And Jonah began to enter into the city a day’s journey, and he cried, and said, Yet forty days, and Nineveh shall be overthrown.* This is the very word of Jonas that Tobit 14:4 names and stakes his counsel upon.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-nineveh-overthrown'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nahum 1:1 — *The burden of Nineveh. The book of the vision of Nahum the Elkoshite.* A whole prophetic book is the burden against the city Tobit 14:4 says shall be overthrown.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-nineveh-overthrown'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='nahum' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Nahum 3:7 — *And it shall come to pass, that all they that look upon thee shall flee from thee, and say, Nineveh is laid waste: who will bemoan her? whence shall I seek comforters for thee?* The fulfilment Tobit 14:8 says shall surely come to pass.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-nineveh-overthrown'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='nahum' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-14-temple-not-like-first
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Haggai 2:9 — *The glory of this latter house shall be greater than of the former, saith Yahuah Tseva''ot (LORD of hosts): and in this place will I give peace, saith Yahuah Tseva''ot (LORD of hosts).* The ''temple, but not like to the first'' of Tobit 14:5 is the very latter house Haggai measures.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-temple-not-like-first'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:26 — *Moreover I will make a covenant of peace with them; it shall be an everlasting covenant with them: and I will place them, and multiply them, and will set my sanctuary in the midst of them for evermore.* The house built ''for ever with a glorious building'' that Tobit 14:5 awaits past the fulfilled age.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-temple-not-like-first'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:28 — *And the heathen shall know that I Yahuah (LORD) do sanctify Yashar''el (Israel), when my sanctuary shall be in the midst of them for evermore.* The desolation Tobit 14:4 names is only ''for a time''; the sanctuary''s end is everlasting.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-temple-not-like-first'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-14-scattered-gathered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land.* The return ''from all places of their captivity'' of Tobit 14:5 is Ezekiel''s own gathering of the scattered house.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-scattered-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zephaniah 3:20 — *At that time will I bring you again, even in the time that I gather you: for I will make you a name and a praise among all people of the earth, when I turn back your captivity before your eyes, saith Yahuah (LORD).* The turning back of captivity Tobit 14:5 foresees, spoken to the dispersed by the prophet.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-scattered-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 60:4 — *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* The exalted, regathered people of Tobit 14:7 are Isaiah''s homecoming sons and daughters.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-scattered-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-14-nations-bury-idols
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 2:20 — *In that day a man shall cast his idols of silver, and his idols of gold, which they made each one for himself to worship, to the moles and to the bats.* The very burying of idols Tobit 14:6 foretells of all nations.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-nations-bury-idols'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zephaniah 3:9 — *For then will I turn to the people a pure language, that they may all call upon the name of Yahuah (LORD), to serve him with one consent.* The turning of all nations to fear Yahuah truly in Tobit 14:6 is the pure language that calls on His name.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-nations-bury-idols'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 8:23 — *Thus saith Yahuah Tseva''ot (LORD of hosts); In those days it shall come to pass, that ten men shall take hold out of all languages of the nations, even shall take hold of the skirt of him that is a Yahudi (Jew), saying, We will go with you: for we have heard that Elohim (God) is with you.* The nations that turn in Tobit 14:6 lay hold of Israel to find the truth.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-nations-bury-idols'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=8 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-14-nations-praise-glorious-jerusalem
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 2:3 — *And many people shall go and say, Come ye, and let us go up to the mountain of Yahuah (LORD), to the house of the Elohim (God) of Jacob; and he will teach us of his ways, and we will walk in his paths: for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem.* The all-nations praise of Tobit 14:7 is Isaiah''s pilgrimage to the house in glorious Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-nations-praise-glorious-jerusalem'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 8:22 — *Yea, many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem, and to pray before Yahuah (LORD).* The nations that praise Yahuah in Tobit 14:7 come to seek Him in the rebuilt city.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-nations-praise-glorious-jerusalem'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 60:3 — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising.* The Jerusalem built gloriously in Tobit 14:5 is Isaiah''s risen city to whose light the gentiles come.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-nations-praise-glorious-jerusalem'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-14-keep-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:24 — *And David my servant shall be king over them; and they all shall have one shepherd: they shall also walk in my judgments, and observe my statutes, and do them.* The law-keeping Tobit 14:9 charges his son is the very obedience the regathered house renders under one shepherd.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-keep-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 8:16 — *These are the things that ye shall do; Speak ye every man the truth to his neighbour; execute the judgment of truth and peace in your gates.* The ''merciful and just'' walk Tobit 14:9 commands is Zechariah''s plain Torah for the city of truth.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-keep-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=8 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-14-alms-deliver-from-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 11:4 — *Riches profit not in the day of wrath: but righteousness delivereth from death.* The very lesson Tobit 14:11 presses — that righteousness, not riches, delivers.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 41:1 — *Blessed is he that considereth the poor: Yahuah (LORD) will deliver him in time of trouble.* The almsgiver who ''considers'' the poor is delivered, as Tobit 14:11 bids his son consider what alms doeth.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=41 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 6:4 — *That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly.* The Messiah carries Tobit''s closing charge forward, the secret alms of Tobit 14:11 rewarded by the Father.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 10:4 — *And when he looked on him, he was afraid, and said, What is it, Yahuah (Lord)? And he said unto him, Thy prayers and thine alms are come up for a memorial before Elohim (God).* As alms saved Manasses from the snare in Tobit 14:10, so Cornelius''s alms come up as a memorial before Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_tob14_lookup sv, _session253_tob14_lookup tv
 WHERE t.slug='tobit-14-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=14 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

