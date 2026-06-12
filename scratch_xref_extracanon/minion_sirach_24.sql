-- ----- fragment: minion_ecclesiasticus_24.sql (session253 ecclesiasticus 24) -----
-- Source anchor: apocrypha/ecclesiasticus ch24. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir24 (view _session253_sir24_lookup). Sort band base 58875, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir24_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-24-wisdom-came-out-of-the-mouth
  ('apocrypha', 'ecclesiasticus', 24, 3, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word that was with Elohim is the Wisdom that came out of the mouth of the Most High in Sirach 24:3.'),
  ('apocrypha', 'ecclesiasticus', 24, 4, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Wisdom whose throne is in the cloudy pillar (Sirach 24:4) is the Word that tabernacled among us.'),
  ('apocrypha', 'ecclesiasticus', 24, 9, 'canon', 'proverbs', 8, 22, 'free', E'Proverbs 8:22 — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old.* Wisdom created from the beginning before the world (Sirach 24:9) is the same Wisdom possessed before his works of old.'),
  ('apocrypha', 'ecclesiasticus', 24, 9, 'canon', 'proverbs', 8, 30, 'free', E'Proverbs 8:30 — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him.* Wisdom that shall never fail (Sirach 24:9) is the One brought up with Yahuah before the world was.'),
  ('apocrypha', 'ecclesiasticus', 24, 5, 'canon', 'colossians', 1, 16, 'free', E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him.* Wisdom that alone compassed the circuit of heaven (Sirach 24:5) is the One by whom all things were created.'),
  -- thread: ecclesiasticus-24-the-book-of-the-covenant-the-law
  ('apocrypha', 'ecclesiasticus', 24, 23, 'canon', 'deuteronomy', 33, 4, 'free', E'Deuteronomy 33:4 — *Moses commanded us a law, even the inheritance of the congregation of Jacob.* This is the very phrase Wisdom claims for herself in Sirach 24:23 — the law which Moses commanded for an heritage to the congregations of Jacob.'),
  ('apocrypha', 'ecclesiasticus', 24, 23, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 1, 'extras', E'Baruch 4:1 — *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die.* Baruch matches Sirach 24:23: Wisdom is the book of the covenant, the law that endureth.'),
  ('apocrypha', 'ecclesiasticus', 24, 23, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 9, 'extras', E'Baruch 3:9 — *Hear, Yashar''el (Israel), the commandments of life: give ear to understand wisdom.* Baruch equates the commandments of life with wisdom, the same identity Sirach 24:23 makes between Wisdom and the law of Moses.'),
  ('apocrypha', 'ecclesiasticus', 24, 8, 'apocrypha', 'ecclesiasticus', 1, 1, 'extras', E'Ecclesiasticus 1:1 — *All wisdom comes from Yahuah (God), and is with him for ever.* Sirach''s own opening confession undergirds 24:8, where the Creator commands Wisdom to dwell in Jacob.'),
  -- thread: ecclesiasticus-24-come-to-me-eat-never-hungry
  ('apocrypha', 'ecclesiasticus', 24, 21, 'canon', 'john', 6, 35, 'free', E'John 6:35 — *And Yahusha (Jesus) said unto them, I am the bread of life: he that cometh to me shall never hunger; and he that believeth on me shall never thirst.* Yahusha answers the hunger and thirst Wisdom stirs up in Sirach 24:21 — in him alone is it filled.'),
  ('apocrypha', 'ecclesiasticus', 24, 19, 'canon', 'matthew', 11, 28, 'free', E'Matthew 11:28 — *Come unto me, all ye that labour and are heavy laden, and I will give you rest.* Yahusha''s call repeats Wisdom''s own — Come to me, all you that be desirous of me (Sirach 24:19).'),
  ('apocrypha', 'ecclesiasticus', 24, 19, 'canon', 'isaiah', 55, 1, 'free', E'Isaiah 55:1 — *Ho, every one that thirsteth, come ye to the waters, and he that hath no money; come ye, buy, and eat; yea, come, buy wine and milk without money and without price.* Isaiah''s free invitation to eat and drink stands behind Wisdom''s Come to me and fill yourselves in Sirach 24:19.'),
  ('apocrypha', 'ecclesiasticus', 24, 21, 'canon', 'revelation', 22, 17, 'free', E'Revelation 22:17 — *And the Spirit and the bride say, Come. And let him that heareth say, Come. And let him that is athirst come. And whosoever will, let him take the water of life freely.* The canon''s last call to the thirsty answers the thirst Wisdom awakens in Sirach 24:21.'),
  -- thread: ecclesiasticus-24-let-your-dwelling-be-in-jacob
  ('apocrypha', 'ecclesiasticus', 24, 8, 'canon', 'exodus', 19, 5, 'free', E'Exodus 19:5 — *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine.* The covenant-election that makes Jacob the peculiar treasure is why Wisdom is told to dwell in Jacob in Sirach 24:8.'),
  ('apocrypha', 'ecclesiasticus', 24, 12, 'canon', 'deuteronomy', 33, 3, 'free', E'Deuteronomy 33:3 — *Yea, he loved the people; all his saints are in thy hand: and they sat down at thy feet; every one shall receive of thy words.* Wisdom rooting in the honourable people, the portion of Yahuah''s inheritance (Sirach 24:12), is the people Yahuah loved and holds in his hand.'),
  -- thread: ecclesiasticus-24-covered-the-earth-as-a-cloud
  ('apocrypha', 'ecclesiasticus', 24, 10, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* Wisdom serving in the holy tabernacle (Sirach 24:10) is the Word who pitched his tabernacle in flesh and showed his glory.'),
  ('apocrypha', 'ecclesiasticus', 24, 4, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high.* The Wisdom enthroned in the cloudy pillar (Sirach 24:4) is the Son who is the brightness of the Father''s glory, upholding all things.'),
  ('apocrypha', 'ecclesiasticus', 24, 5, 'canon', 'colossians', 1, 15, 'free', E'Colossians 1:15 — *Who is the image of the invisible Elohim (God), the firstborn of every creature.* Wisdom who alone compassed the circuit of heaven (Sirach 24:5) is the image of the invisible Elohim, the firstborn of all creation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir24_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir24_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-24-wisdom-came-out-of-the-mouth',
       E'I came out of the mouth of the Most High — Wisdom the Formed Logos',
       E'Sirach''s crown: Wisdom herself speaks, *I came out of the mouth of the Most High, and covered the earth as a cloud* (Ecclesiasticus 24:3), and *He created me from the beginning before the world, and I shall never fail* (Ecclesiasticus 24:9). This is no abstraction — it is the Word brought forth out of the Father before all things. John opens with the same eternity: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), and then makes it flesh that tabernacles among us — *And the Word was made flesh, and dwelt among us... full of grace and truth* (John 1:14), the very dwelling Wisdom seeks. Proverbs personifies the same: *Yahuah (LORD) possessed me in the beginning of his way, before his works of old* (Proverbs 8:22), Wisdom *by him, as one brought up with him* (Proverbs 8:30). Paul names the One in whom this is fulfilled — *Who is the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15), *For by him were all things created* (Colossians 1:16). It ain''t new: the deuterocanon already confessed the Logos by whom all was made.',
       sv.verse_id, ev.verse_id, 'extras', 58875
  FROM _session253_sir24_lookup sv, _session253_sir24_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=24 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-24-the-book-of-the-covenant-the-law',
       E'The book of the covenant, the law which Moses commanded — Wisdom is the Torah',
       E'Then Wisdom names herself outright as the Torah: *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob* (Ecclesiasticus 24:23). The Formed Logos and the Law are one thing — Wisdom is the Torah given to Jacob. Moses said exactly this: *Moses commanded us a law, even the inheritance of the congregation of Jacob* (Deuteronomy 33:4). Baruch confesses the same identity — Wisdom is the commandments, the law that endureth: *Hear, Yashar''el (Israel), the commandments of life: give ear to understand wisdom* (Baruch 3:9), *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die* (Baruch 4:1). Sirach 1 grounds it: *All wisdom comes from Yahuah (God), and is with him for ever* (Ecclesiasticus 1:1). Torah stands — it is not a curse cast off but the very Wisdom of Elohim, the heritage of the congregations of Jacob.',
       sv.verse_id, ev.verse_id, 'extras', 58878
  FROM _session253_sir24_lookup sv, _session253_sir24_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=24 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-24-come-to-me-eat-never-hungry',
       E'Come to me, fill yourselves — they that eat me shall yet be hungry',
       E'Wisdom holds out an open invitation and a paradox: *Come to me, all you that be desirous of me, and fill yourselves with my fruits* (Ecclesiasticus 24:19), yet *They that eat me shall yet be hungry, and they that drink me shall yet be thirsty* (Ecclesiasticus 24:21) — the deeper the feeding, the deeper the longing. Yahusha takes up the same self-offer and resolves the hunger in himself: *And Yahusha (Jesus) said unto them, I am the bread of life: he that cometh to me shall never hunger; and he that believeth on me shall never thirst* (John 6:35). He echoes Wisdom''s very call — *Come unto me, all ye that labour and are heavy laden, and I will give you rest* (Matthew 11:28). Isaiah issued the invitation first: *Ho, every one that thirsteth, come ye to the waters... come, buy wine and milk without money and without price* (Isaiah 55:1), and Revelation closes the canon with it — *And let him that is athirst come. And whosoever will, let him take the water of life freely* (Revelation 22:17). It ain''t new: the gospel call to come and eat is Wisdom''s ancient cry.',
       sv.verse_id, ev.verse_id, 'extras', 58881
  FROM _session253_sir24_lookup sv, _session253_sir24_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=24 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-24-let-your-dwelling-be-in-jacob',
       E'Let your dwelling be in Jacob — Wisdom takes root in the chosen people',
       E'The Creator assigns Wisdom a home in the elect nation: *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel)* (Ecclesiasticus 24:8); she takes root *even in the portion of the inheritance of Yahuah (God)* (Ecclesiasticus 24:12). This is the same election Yahuah declared at Sinai: *if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine* (Exodus 19:5). Wisdom dwelling in Jacob is Wisdom dwelling where the Torah was given — the people loved and held in the Father''s hand: *Yea, he loved the people; all his saints are in thy hand* (Deuteronomy 33:3). Not a church displacing Israel: Wisdom''s inheritance is Yashar''el, the congregations of Jacob.',
       sv.verse_id, ev.verse_id, 'extras', 58884
  FROM _session253_sir24_lookup sv, _session253_sir24_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=24 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-24-covered-the-earth-as-a-cloud',
       E'Covered the earth as a cloud — Wisdom in the holy tabernacle',
       E'Wisdom''s dwelling is glory-cloud and sanctuary: *I dwelt in high places, and my throne is in a cloudy pillar* (Ecclesiasticus 24:4), and *In the holy tabernacle I served before him; and so was I established in Sion* (Ecclesiasticus 24:10). The cloudy pillar and the tabernacle are the Shekinah imagery of the Exodus and the temple — the same glory the Logos carried when he tabernacled in flesh: *And the Word was made flesh, and dwelt among us... full of grace and truth* (John 1:14), the visible glory of the One *being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power* (Hebrews 1:3). Wisdom in the holy tabernacle is the One in whom *all things consist* — *For by him were all things created* (Colossians 1:16). The cloud, the pillar, the tabernacle: Wisdom was never far off; she dwelt where Yahuah''s glory rested.',
       sv.verse_id, ev.verse_id, 'extras', 58887
  FROM _session253_sir24_lookup sv, _session253_sir24_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=24 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-24-wisdom-came-out-of-the-mouth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word that was with Elohim is the Wisdom that came out of the mouth of the Most High in Sirach 24:3.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-wisdom-came-out-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Wisdom whose throne is in the cloudy pillar (Sirach 24:4) is the Word that tabernacled among us.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-wisdom-came-out-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:22 — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old.* Wisdom created from the beginning before the world (Sirach 24:9) is the same Wisdom possessed before his works of old.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-wisdom-came-out-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 8:30 — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him.* Wisdom that shall never fail (Sirach 24:9) is the One brought up with Yahuah before the world was.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-wisdom-came-out-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him.* Wisdom that alone compassed the circuit of heaven (Sirach 24:5) is the One by whom all things were created.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-wisdom-came-out-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-24-the-book-of-the-covenant-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 33:4 — *Moses commanded us a law, even the inheritance of the congregation of Jacob.* This is the very phrase Wisdom claims for herself in Sirach 24:23 — the law which Moses commanded for an heritage to the congregations of Jacob.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-the-book-of-the-covenant-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Baruch 4:1 — *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die.* Baruch matches Sirach 24:23: Wisdom is the book of the covenant, the law that endureth.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-the-book-of-the-covenant-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=23
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Baruch 3:9 — *Hear, Yashar''el (Israel), the commandments of life: give ear to understand wisdom.* Baruch equates the commandments of life with wisdom, the same identity Sirach 24:23 makes between Wisdom and the law of Moses.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-the-book-of-the-covenant-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=23
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 1:1 — *All wisdom comes from Yahuah (God), and is with him for ever.* Sirach''s own opening confession undergirds 24:8, where the Creator commands Wisdom to dwell in Jacob.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-the-book-of-the-covenant-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-24-come-to-me-eat-never-hungry
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 6:35 — *And Yahusha (Jesus) said unto them, I am the bread of life: he that cometh to me shall never hunger; and he that believeth on me shall never thirst.* Yahusha answers the hunger and thirst Wisdom stirs up in Sirach 24:21 — in him alone is it filled.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-come-to-me-eat-never-hungry'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 11:28 — *Come unto me, all ye that labour and are heavy laden, and I will give you rest.* Yahusha''s call repeats Wisdom''s own — Come to me, all you that be desirous of me (Sirach 24:19).'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-come-to-me-eat-never-hungry'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 55:1 — *Ho, every one that thirsteth, come ye to the waters, and he that hath no money; come ye, buy, and eat; yea, come, buy wine and milk without money and without price.* Isaiah''s free invitation to eat and drink stands behind Wisdom''s Come to me and fill yourselves in Sirach 24:19.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-come-to-me-eat-never-hungry'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:17 — *And the Spirit and the bride say, Come. And let him that heareth say, Come. And let him that is athirst come. And whosoever will, let him take the water of life freely.* The canon''s last call to the thirsty answers the thirst Wisdom awakens in Sirach 24:21.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-come-to-me-eat-never-hungry'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-24-let-your-dwelling-be-in-jacob
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:5 — *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine.* The covenant-election that makes Jacob the peculiar treasure is why Wisdom is told to dwell in Jacob in Sirach 24:8.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-let-your-dwelling-be-in-jacob'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 33:3 — *Yea, he loved the people; all his saints are in thy hand: and they sat down at thy feet; every one shall receive of thy words.* Wisdom rooting in the honourable people, the portion of Yahuah''s inheritance (Sirach 24:12), is the people Yahuah loved and holds in his hand.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-let-your-dwelling-be-in-jacob'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-24-covered-the-earth-as-a-cloud
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* Wisdom serving in the holy tabernacle (Sirach 24:10) is the Word who pitched his tabernacle in flesh and showed his glory.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-covered-the-earth-as-a-cloud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high.* The Wisdom enthroned in the cloudy pillar (Sirach 24:4) is the Son who is the brightness of the Father''s glory, upholding all things.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-covered-the-earth-as-a-cloud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 1:15 — *Who is the image of the invisible Elohim (God), the firstborn of every creature.* Wisdom who alone compassed the circuit of heaven (Sirach 24:5) is the image of the invisible Elohim, the firstborn of all creation.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-covered-the-earth-as-a-cloud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

