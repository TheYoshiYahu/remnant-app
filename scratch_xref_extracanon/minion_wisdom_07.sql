-- ----- fragment: minion_thewisdomofsolomon_07.sql (session253 the-wisdom-of-solomon 7) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis07 (view _session253_wis07_lookup). Sort band base 58150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-of-solomon-7-solomon-prayed-and-she-was-given
  ('apocrypha', 'the-wisdom-of-solomon', 7, 7, 'canon', '1-kings', 3, 9, 'free', E'1 Kings 3:9 — *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad: for who is able to judge this thy so great a people?* Wisdom of Solomon 7:7 retells in the first person the very prayer Solomon prayed at Gibeon.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 7, 'canon', '1-kings', 3, 12, 'free', E'1 Kings 3:12 — *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee, neither after thee shall any arise like unto thee.* The granting in 1 Kings is the answer to the prayer Wisdom of Solomon 7:7 voices — wisdom *came to me*.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 7, 'canon', 'james', 1, 5, 'free', E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* The same covenant pattern Wisdom of Solomon 7:7 models — ask, and the spirit of wisdom is given.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 7, 'canon', '1-corinthians', 1, 24, 'free', E'1 Corinthians 1:24 — *But unto them which are called, both Yahudim (Jews) and Greeks, Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God).* The wisdom Solomon prayed for in Wisdom of Solomon 7:7 is unveiled in the NT as a Person, the Messiah.'),
  -- thread: wisdom-of-solomon-7-the-worker-of-all-things
  ('apocrypha', 'the-wisdom-of-solomon', 7, 22, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* Wisdom of Solomon 7:22 calls her *the worker of all things* — the same agency John ascribes to the Word.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 22, 'canon', 'colossians', 1, 16, 'free', E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* the creating Wisdom of Solomon 7:22 is the Messiah by whom all was made.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 22, 'canon', 'proverbs', 8, 30, 'free', E'Proverbs 8:30 — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him;* the Formed Wisdom of Proverbs stands behind the *worker of all things* of Wisdom of Solomon 7:22.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 24, 'canon', 'colossians', 1, 17, 'free', E'Colossians 1:17 — *And he is before all things, and by him all things consist.* Wisdom *passeth and goes through all things* (Wisdom of Solomon 7:24) — the same all-pervading sustaining the NT names in Messiah.'),
  -- thread: wisdom-of-solomon-7-breath-brightness-image
  ('apocrypha', 'the-wisdom-of-solomon', 7, 26, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* the exact triad of Wisdom of Solomon 7:26 — *brightness*, *image*, upholding all — fulfilled in the Son.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 26, 'canon', 'colossians', 1, 15, 'free', E'Colossians 1:15 — *Who is the image of the invisible Elohim (God), the firstborn of every creature:* Wisdom is *the image of his goodness* (Wisdom of Solomon 7:26); Messiah is the image of the invisible Elohim.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 25, 'canon', 'hebrews', 1, 2, 'free', E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* the *breath of the power... flowing from the glory of the Almighty* (Wisdom of Solomon 7:25) is the Son by whom the worlds were made.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 26, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The *brightness of the everlasting light* (Wisdom of Solomon 7:26) is the glory beheld when the Word took flesh.'),
  -- thread: wisdom-of-solomon-7-being-but-one-makes-all-new
  ('apocrypha', 'the-wisdom-of-solomon', 7, 27, 'apocrypha', 'ecclesiasticus', 24, 3, 'extras', E'Ecclesiasticus 24:3 — *I came out of the mouth of the Most High, and covered the earth as a cloud.* Sirach''s self-praising Wisdom is the same *one* who *can do all things* in Wisdom of Solomon 7:27 — a deuterocanon self-link.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 27, 'apocrypha', 'ecclesiasticus', 24, 8, 'extras', E'Ecclesiasticus 24:8 — *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* Wisdom entering *holy souls* (Wisdom of Solomon 7:27) is the same Wisdom given her inheritance in Israel.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 27, 'apocrypha', 'the-wisdom-of-solomon', 8, 1, 'extras', E'Wisdom of Solomon 8:1 — *Wisdom reacheth from one end to another mightily: and sweetly does she order all things.* The continuation of Solomon''s own hymn: the *one* who *makes all things new* (Wisdom of Solomon 7:27) orders all things end to end.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 27, 'canon', 'john', 1, 4, 'free', E'John 1:4 — *In him was life; and the life was the light of men.* The Wisdom who *makes all things new* and enters holy souls (Wisdom of Solomon 7:27) is the life and light of John''s Logos.'),
  -- thread: wisdom-of-solomon-7-fairer-than-the-sun
  ('apocrypha', 'the-wisdom-of-solomon', 7, 29, 'canon', 'john', 1, 5, 'free', E'John 1:5 — *And the light shineth in darkness; and the darkness comprehended it not.* Wisdom *found before* the light, against whom *vice shall not prevail* (Wisdom of Solomon 7:29-30), is John''s Light the darkness cannot overcome.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 29, 'canon', 'john', 1, 9, 'free', E'John 1:9 — *That was the true Light, which lighteth every man that cometh into the world.* The Wisdom *more beautiful than the sun... found before* the light (Wisdom of Solomon 7:29) is the true Light of the Logos.'),
  ('apocrypha', 'the-wisdom-of-solomon', 7, 30, 'canon', '1-corinthians', 1, 24, 'free', E'1 Corinthians 1:24 — *But unto them which are called, both Yahudim (Jews) and Greeks, Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God).* The Wisdom against whom *vice shall not prevail* (Wisdom of Solomon 7:30) is the Messiah, the power and wisdom of Elohim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-7-solomon-prayed-and-she-was-given',
       E'I prayed, and understanding was given me',
       E'Solomon, *a mortal man, like to all*, lays bare that kings have no other beginning than any child, then turns to the one thing worth asking: *Wherefore I prayed, and understanding was given me: I called upon Yahuah (God), and the spirit of wisdom came to me* (Wisdom of Solomon 7:7). It ain''t new — this IS the night at Gibeon: Solomon asked not riches nor long life but *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad* (1 Kings 3:9), and the answer came, *lo, I have given thee a wise and an understanding heart* (1 Kings 3:12). The same open door stands in the NT: *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). And the wisdom asked for has a Name — *Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God)* (1 Corinthians 1:24).',
       sv.verse_id, ev.verse_id, 'extras', 58150
  FROM _session253_wis07_lookup sv, _session253_wis07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=7 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-7-the-worker-of-all-things',
       E'Wisdom, the worker of all things',
       E'Solomon names her office: *For wisdom, which is the worker of all things, taught me* (Wisdom of Solomon 7:22), and again, *For wisdom is more moving than any motion: she passeth and goes through all things by reason of her pureness* (Wisdom of Solomon 7:24). It ain''t new — this is the Formed Wisdom of Proverbs, who was *by him, as one brought up with him* when *Yahuah (LORD) possessed me in the beginning of his way, before his works of old* (Proverbs 8:30, 22). The NT gives her the Name: *All things were made by him; and without him was not any thing made that was made* (John 1:3), and *by him were all things created, that are in heaven, and that are in earth... all things were created by him, and for him* (Colossians 1:16). The *worker of all things* is the Logos by whom all consists.',
       sv.verse_id, ev.verse_id, 'extras', 58153
  FROM _session253_wis07_lookup sv, _session253_wis07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=22
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=7 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-7-breath-brightness-image',
       E'The breath of the power, the brightness, the image',
       E'Here is the high water mark: *For she is the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty: therefore can no defiled thing fall into her* (Wisdom of Solomon 7:25); *For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness* (Wisdom of Solomon 7:26). It ain''t new — Hebrews answers it word for word: the Son is *the brightness of his glory, and the express image of his person, and upholding all things by the word of his power* (Hebrews 1:3). Paul: *Who is the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15). And John: *the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father)* (John 1:14). The *brightness* and *image* of Wisdom is the Formed Logos made flesh.',
       sv.verse_id, ev.verse_id, 'extras', 58156
  FROM _session253_wis07_lookup sv, _session253_wis07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=7 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-7-being-but-one-makes-all-new',
       E'Being but one, she makes all things new',
       E'*And being but one, she can do all things: and remaining in herself, she makes all things new: and in all ages entering into holy souls, she makes them friends of Yahuah (God), and prophets* (Wisdom of Solomon 7:27). It ain''t new — the other restored books carry the same Wisdom. Sirach lets her speak: *I came out of the mouth of the Most High, and covered the earth as a cloud* (Ecclesiasticus 24:3), and she is given her dwelling, *Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel)* (Ecclesiasticus 24:8). The next breath of Solomon''s own song confesses her reach: *Wisdom reacheth from one end to another mightily: and sweetly does she order all things* (Wisdom of Solomon 8:1). And the NT: *In him was life; and the life was the light of men* (John 1:4) — the *one* who *makes all things new* and enters holy souls.',
       sv.verse_id, ev.verse_id, 'extras', 58159
  FROM _session253_wis07_lookup sv, _session253_wis07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=27
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=7 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-7-fairer-than-the-sun',
       E'More beautiful than the sun, the light before light',
       E'Solomon closes the chapter where John opens his Gospel: *For she is more beautiful than the sun, and above all the order of stars: being compared with the light, she is found before it* (Wisdom of Solomon 7:29); *For after this comes night: but vice shall not prevail against wisdom* (Wisdom of Solomon 7:30). It ain''t new — *And the light shineth in darkness; and the darkness comprehended it not* (John 1:5): the uncreated Light is *found before* the created light, and the night does not master it. She *chose to have her instead of light: for the light that comes from her never goes out* (Wisdom of Solomon 7:10), the same everlasting brightness — and that Light is *Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God)* (1 Corinthians 1:24), against whom no darkness prevails.',
       sv.verse_id, ev.verse_id, 'extras', 58162
  FROM _session253_wis07_lookup sv, _session253_wis07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=29
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=7 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-of-solomon-7-solomon-prayed-and-she-was-given
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 3:9 — *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad: for who is able to judge this thy so great a people?* Wisdom of Solomon 7:7 retells in the first person the very prayer Solomon prayed at Gibeon.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-solomon-prayed-and-she-was-given'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Kings 3:12 — *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee, neither after thee shall any arise like unto thee.* The granting in 1 Kings is the answer to the prayer Wisdom of Solomon 7:7 voices — wisdom *came to me*.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-solomon-prayed-and-she-was-given'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* The same covenant pattern Wisdom of Solomon 7:7 models — ask, and the spirit of wisdom is given.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-solomon-prayed-and-she-was-given'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 1:24 — *But unto them which are called, both Yahudim (Jews) and Greeks, Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God).* The wisdom Solomon prayed for in Wisdom of Solomon 7:7 is unveiled in the NT as a Person, the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-solomon-prayed-and-she-was-given'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-7-the-worker-of-all-things
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* Wisdom of Solomon 7:22 calls her *the worker of all things* — the same agency John ascribes to the Word.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-the-worker-of-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* the creating Wisdom of Solomon 7:22 is the Messiah by whom all was made.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-the-worker-of-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:30 — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him;* the Formed Wisdom of Proverbs stands behind the *worker of all things* of Wisdom of Solomon 7:22.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-the-worker-of-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 1:17 — *And he is before all things, and by him all things consist.* Wisdom *passeth and goes through all things* (Wisdom of Solomon 7:24) — the same all-pervading sustaining the NT names in Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-the-worker-of-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-7-breath-brightness-image
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* the exact triad of Wisdom of Solomon 7:26 — *brightness*, *image*, upholding all — fulfilled in the Son.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-breath-brightness-image'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Colossians 1:15 — *Who is the image of the invisible Elohim (God), the firstborn of every creature:* Wisdom is *the image of his goodness* (Wisdom of Solomon 7:26); Messiah is the image of the invisible Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-breath-brightness-image'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* the *breath of the power... flowing from the glory of the Almighty* (Wisdom of Solomon 7:25) is the Son by whom the worlds were made.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-breath-brightness-image'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The *brightness of the everlasting light* (Wisdom of Solomon 7:26) is the glory beheld when the Word took flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-breath-brightness-image'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-7-being-but-one-makes-all-new
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiasticus 24:3 — *I came out of the mouth of the Most High, and covered the earth as a cloud.* Sirach''s self-praising Wisdom is the same *one* who *can do all things* in Wisdom of Solomon 7:27 — a deuterocanon self-link.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-being-but-one-makes-all-new'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 24:8 — *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* Wisdom entering *holy souls* (Wisdom of Solomon 7:27) is the same Wisdom given her inheritance in Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-being-but-one-makes-all-new'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 8:1 — *Wisdom reacheth from one end to another mightily: and sweetly does she order all things.* The continuation of Solomon''s own hymn: the *one* who *makes all things new* (Wisdom of Solomon 7:27) orders all things end to end.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-being-but-one-makes-all-new'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=8 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 1:4 — *In him was life; and the life was the light of men.* The Wisdom who *makes all things new* and enters holy souls (Wisdom of Solomon 7:27) is the life and light of John''s Logos.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-being-but-one-makes-all-new'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-7-fairer-than-the-sun
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:5 — *And the light shineth in darkness; and the darkness comprehended it not.* Wisdom *found before* the light, against whom *vice shall not prevail* (Wisdom of Solomon 7:29-30), is John''s Light the darkness cannot overcome.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-fairer-than-the-sun'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:9 — *That was the true Light, which lighteth every man that cometh into the world.* The Wisdom *more beautiful than the sun... found before* the light (Wisdom of Solomon 7:29) is the true Light of the Logos.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-fairer-than-the-sun'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 1:24 — *But unto them which are called, both Yahudim (Jews) and Greeks, Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God).* The Wisdom against whom *vice shall not prevail* (Wisdom of Solomon 7:30) is the Messiah, the power and wisdom of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis07_lookup sv, _session253_wis07_lookup tv
 WHERE t.slug='wisdom-of-solomon-7-fairer-than-the-sun'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=7 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

