-- ----- fragment: minion_hermas_16.sql (session253 hermas 16) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm16 (view _session253_herm16_lookup). Sort band base 71875, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-16-know-the-prophet-by-his-life
  ('lightfoot-apostolic-fathers', 'hermas', 16, 1, 'canon', 'matthew', 7, 15, 'free', E'Matthew 7:15 — *Beware of false prophets, which come to you in sheep’s clothing, but inwardly they are ravening wolves.* The Shepherd''s false prophet on the chair, who destroys the doubtful-minded, is the Master''s wolf in sheep''s clothing — the warning is one and the same.'),
  ('lightfoot-apostolic-fathers', 'hermas', 16, 1, 'canon', 'matthew', 7, 16, 'free', E'Matthew 7:16 — *Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?* The Shepherd''s command to test the prophet ''by his life and his works'' is the Master''s own test of fruit — you know the tree by what it bears.'),
  ('lightfoot-apostolic-fathers', 'hermas', 16, 1, 'canon', 'matthew', 7, 19, 'free', E'Matthew 7:19 — *Every tree that bringeth not forth good fruit is hewn down, and cast into the fire.* The empty prophet whose earthly spirit comes from the devil bears no good fruit, and so falls under the same sentence the Master pronounced on the fruitless tree.'),
  -- thread: hermas-16-try-the-spirits
  ('lightfoot-apostolic-fathers', 'hermas', 16, 1, 'canon', '1-john', 4, 1, 'free', E'1 John 4:1 — *Beloved, believe not every spirit, but try the spirits whether they are of Elohim (God): because many false prophets are gone out into the world.* The Shepherd''s charge to trust the Spirit from Elohim and put no trust in the earthly spirit from the devil is the apostle''s own command to try the spirits — for the false prophets are abroad in both witnesses alike.'),
  -- thread: hermas-16-the-presumptuous-prophet
  ('lightfoot-apostolic-fathers', 'hermas', 16, 1, 'canon', 'jeremiah', 23, 16, 'free', E'Jeremiah 23:16 — *Thus saith Yahuah Tseva''ot (LORD of hosts), Hearken not unto the words of the prophets that prophesy unto you: they make you vain: they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD).* The Shepherd''s empty prophet who answers out of his own emptiness is Yirmeyahu''s prophet who speaks a vision of his own heart and not out of the mouth of Yahuah.'),
  ('lightfoot-apostolic-fathers', 'hermas', 16, 1, 'canon', 'deuteronomy', 18, 21, 'free', E'Deuteronomy 18:21 — *And if thou say in thine heart, How shall we know the word which Yahuah (LORD) hath not spoken?* Hermas''s question, ''how shall a man know who is a prophet, and who a false prophet?'', is the very question Moses set before Yashar''el — it ain''t new.'),
  ('lightfoot-apostolic-fathers', 'hermas', 16, 1, 'canon', 'deuteronomy', 18, 22, 'free', E'Deuteronomy 18:22 — *When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken, but the prophet hath spoken it presumptuously: thou shalt not be afraid of him.* The Torah''s test of the prophet by whether his word stands is the same discernment the Shepherd teaches — the true word has the power of deity, the presumptuous word is empty and fails.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-16-know-the-prophet-by-his-life',
       E'Test the prophet by his life and his works — know them by their fruits',
       E'When Hermas asks how a man may tell the true prophet from the false, the Shepherd answers not by oracle but by life: *‘By his life test the man that hath the divine Spirit. In the first place, he that hath the [divine] Spirit, which is from above, is gentle and tranquil and humble-minded, and abstaineth from all wickedness and vain desire of this present world...’* And he seals it: *‘Therefore test, by his life and his works, the man who says that he is moved by the Spirit.’* (Hermas 16:1) It ain''t new — the Master gave the very same measuring-rod on the mountain: *Beware of false prophets, which come to you in sheep’s clothing, but inwardly they are ravening wolves.* (Matthew 7:15) And how is the wolf unmasked? Not by the smoothness of his word but by his fruit: *Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?* (Matthew 7:16), for *Every tree that bringeth not forth good fruit is hewn down, and cast into the fire.* (Matthew 7:19). The Shepherd''s gentle, humble, money-refusing prophet bears the fruit of the Spirit that is from above; the empty one is known the same way the Master named — by what grows from his life.',
       sv.verse_id, ev.verse_id, 'extras', 71875
  FROM _session253_herm16_lookup sv, _session253_herm16_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=16 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-16-try-the-spirits',
       E'Trust the Spirit from Elohim, try the empty spirit — believe not every spirit',
       E'The Shepherd sets two spirits before Hermas and bids him weigh them: *‘But do thou trust the Spirit that cometh from Elohim (God), and hath power; but in the earthly and empty spirit put no trust at all; for in it there is no power, for it cometh from the devil.’* The false prophet *‘speaketh also some true words; for the devil filleth him with his own spirit, if so be he shall be able to break down some of the righteous.’* (Hermas 16:1) It ain''t new — the beloved disciple gave the assembly this very discipline: *Beloved, believe not every spirit, but try the spirits whether they are of Elohim (God): because many false prophets are gone out into the world.* (1 John 4:1) The Shepherd''s warning that a lying spirit may even mix in true words, the better to break the righteous, is why Yochanan bids us not to believe every spirit but to prove them — the deceiver wears truth as a costume, and only the testing unmasks him.',
       sv.verse_id, ev.verse_id, 'extras', 71878
  FROM _session253_herm16_lookup sv, _session253_herm16_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=16 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-16-the-presumptuous-prophet',
       E'The prophet who speaks of his own heart — the presumptuous word that fails',
       E'The false prophet in Hermas has no Spirit of his own: *‘For being empty himself he giveth empty answers to empty enquirers; for whatever enquiry may be made of him, he answereth according to the emptiness of the man,’* and he *‘receiveth money for his prophesying, and if he receiveth not, he prophesieth not.’* (Hermas 16:1) It ain''t new — the prophets long before named this empty word for what it is: *Thus saith Yahuah Tseva''ot (LORD of hosts), Hearken not unto the words of the prophets that prophesy unto you: they make you vain: they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD).* (Jeremiah 23:16). And Moses gave Yashar''el the plain test for the hireling oracle — *And if thou say in thine heart, How shall we know the word which Yahuah (LORD) hath not spoken?* (Deuteronomy 18:21) — answered by the fruit of the word itself: *When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken, but the prophet hath spoken it presumptuously: thou shalt not be afraid of him.* (Deuteronomy 18:22). The Shepherd''s empty answerer is the Torah''s presumptuous prophet, the prophet of his own heart — the lie has a lineage, and so does the test that exposes it.',
       sv.verse_id, ev.verse_id, 'extras', 71881
  FROM _session253_herm16_lookup sv, _session253_herm16_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=16 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-16-know-the-prophet-by-his-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:15 — *Beware of false prophets, which come to you in sheep’s clothing, but inwardly they are ravening wolves.* The Shepherd''s false prophet on the chair, who destroys the doubtful-minded, is the Master''s wolf in sheep''s clothing — the warning is one and the same.'
  FROM cross_reference_threads t, cross_references x, _session253_herm16_lookup sv, _session253_herm16_lookup tv
 WHERE t.slug='hermas-16-know-the-prophet-by-his-life'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:16 — *Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?* The Shepherd''s command to test the prophet ''by his life and his works'' is the Master''s own test of fruit — you know the tree by what it bears.'
  FROM cross_reference_threads t, cross_references x, _session253_herm16_lookup sv, _session253_herm16_lookup tv
 WHERE t.slug='hermas-16-know-the-prophet-by-his-life'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:19 — *Every tree that bringeth not forth good fruit is hewn down, and cast into the fire.* The empty prophet whose earthly spirit comes from the devil bears no good fruit, and so falls under the same sentence the Master pronounced on the fruitless tree.'
  FROM cross_reference_threads t, cross_references x, _session253_herm16_lookup sv, _session253_herm16_lookup tv
 WHERE t.slug='hermas-16-know-the-prophet-by-his-life'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-16-try-the-spirits
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 4:1 — *Beloved, believe not every spirit, but try the spirits whether they are of Elohim (God): because many false prophets are gone out into the world.* The Shepherd''s charge to trust the Spirit from Elohim and put no trust in the earthly spirit from the devil is the apostle''s own command to try the spirits — for the false prophets are abroad in both witnesses alike.'
  FROM cross_reference_threads t, cross_references x, _session253_herm16_lookup sv, _session253_herm16_lookup tv
 WHERE t.slug='hermas-16-try-the-spirits'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-16-the-presumptuous-prophet
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 23:16 — *Thus saith Yahuah Tseva''ot (LORD of hosts), Hearken not unto the words of the prophets that prophesy unto you: they make you vain: they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD).* The Shepherd''s empty prophet who answers out of his own emptiness is Yirmeyahu''s prophet who speaks a vision of his own heart and not out of the mouth of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_herm16_lookup sv, _session253_herm16_lookup tv
 WHERE t.slug='hermas-16-the-presumptuous-prophet'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 18:21 — *And if thou say in thine heart, How shall we know the word which Yahuah (LORD) hath not spoken?* Hermas''s question, ''how shall a man know who is a prophet, and who a false prophet?'', is the very question Moses set before Yashar''el — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_herm16_lookup sv, _session253_herm16_lookup tv
 WHERE t.slug='hermas-16-the-presumptuous-prophet'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 18:22 — *When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken, but the prophet hath spoken it presumptuously: thou shalt not be afraid of him.* The Torah''s test of the prophet by whether his word stands is the same discernment the Shepherd teaches — the true word has the power of deity, the presumptuous word is empty and fails.'
  FROM cross_reference_threads t, cross_references x, _session253_herm16_lookup sv, _session253_herm16_lookup tv
 WHERE t.slug='hermas-16-the-presumptuous-prophet'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

