-- ----- fragment: minion_ecclesiasticus_41.sql (session253 ecclesiasticus 41) -----
-- Source anchor: apocrypha/ecclesiasticus ch41. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir41 (view _session253_sir41_lookup). Sort band base 59300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir41_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-41-sentence-of-death
  ('apocrypha', 'ecclesiasticus', 41, 3, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The sentence of Yahuah over all flesh that Sirach 41:3 bids us not to fear is the very dust-to-dust decree first spoken over Adam.'),
  ('apocrypha', 'ecclesiasticus', 41, 4, 'canon', 'ecclesiastes', 12, 7, 'free', E'Ecclesiastes 12:7 — *Then shall the dust return to the earth as it was: and the spirit shall return unto Elohim (God) who gave it.* As Sirach 41:4 asks why a man strives against the Most High in the grave, the Preacher answers that body returns to dust and spirit to the Elohim who gave it.'),
  ('apocrypha', 'ecclesiasticus', 41, 3, 'canon', 'hebrews', 9, 27, 'free', E'Hebrews 9:27 — *And as it is appointed unto men once to die, but after this the judgment.* The single sentence of death over all flesh in Sirach 41:3 is the same appointment the apostle sets before the judgment to come.'),
  -- thread: ecclesiasticus-41-curse-on-the-ungodly-seed
  ('apocrypha', 'ecclesiasticus', 41, 9, 'canon', 'romans', 6, 23, 'free', E'Romans 6:23 — *For the wages of sin is death; but the gift of Elohim (God) is eternal life through Yahusha HaMashiach (Jesus Christ) our Lord.* The curse that is the ungodly man''s portion in Sirach 41:9 is the wages of sin the apostle sets against the free gift of life.'),
  ('apocrypha', 'ecclesiasticus', 41, 10, 'apocrypha', 'the-wisdom-of-solomon', 2, 24, 'extras', E'Wisdom of Solomon 2:24 — *Nevertheless through envy of the devil came death into the world: and they that do hold of his side do find it.* Sirach 41:10''s ungodly who go from a curse to destruction are the ones who hold of the devil''s side and so find the death he brought into the world.'),
  -- thread: ecclesiasticus-41-a-good-name-endureth-for-ever
  ('apocrypha', 'ecclesiasticus', 41, 12, 'canon', 'proverbs', 22, 1, 'free', E'Proverbs 22:1 — *A good name is rather to be chosen than great riches, and loving favour rather than silver and gold.* Sirach 41:12 sets a good name above a thousand treasures of gold exactly as the Proverb prefers it to great riches.'),
  ('apocrypha', 'ecclesiasticus', 41, 13, 'canon', 'ecclesiastes', 7, 1, 'free', E'Ecclesiastes 7:1 — *A good name is better than precious ointment; and the day of death than the day of one''s birth.* The enduring good name of Sirach 41:13, set over a short life, is the Preacher''s name better than ointment, outlasting the day of death.'),
  -- thread: ecclesiasticus-41-hidden-wisdom-no-profit
  ('apocrypha', 'ecclesiasticus', 41, 14, 'canon', 'ecclesiastes', 12, 13, 'free', E'Ecclesiastes 12:13 — *Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man.* The wisdom Sirach 41:14 says profits nothing while hidden is the kept commandment the Preacher names as the whole duty of man.'),
  -- thread: ecclesiasticus-41-shame-rightly-placed
  ('apocrypha', 'ecclesiasticus', 41, 19, 'canon', 'proverbs', 22, 4, 'free', E'Proverbs 22:4 — *By humility and the fear of Yahuah (LORD) are riches, and honour, and life.* The shame Sirach 41:19 demands before the truth of Yahuah and his covenant is the same fear of Yahuah the Proverb rewards with honour and life.'),
  ('apocrypha', 'ecclesiasticus', 41, 18, 'canon', 'ecclesiastes', 12, 14, 'free', E'Ecclesiastes 12:14 — *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil.* The iniquity before a congregation that shames a man in Sirach 41:18 is among the secret things the Preacher says Elohim will bring into judgment.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir41_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir41_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-41-sentence-of-death',
       E'The sentence of death over all flesh',
       E'Ben Sira cries, *Fear not the sentence of death, remember them that have been before you, and that come after; for this is the sentence of Yahuah (God) over all flesh* (Ecclesiasticus 41:3) — the bitter remembrance of death (41:1) is acceptable to the weary and the needy (41:2), for none escapes the appointment of the Most High (41:4). It ain''t new: the verdict was spoken in the garden, *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return* (Genesis 3:19), and the Preacher closes the circle — *Then shall the dust return to the earth as it was: and the spirit shall return unto Elohim (God) who gave it* (Ecclesiastes 12:7). The same divine ordinance the apostle names: *And as it is appointed unto men once to die, but after this the judgment* (Hebrews 9:27).',
       sv.verse_id, ev.verse_id, 'extras', 59300
  FROM _session253_sir41_lookup sv, _session253_sir41_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=41 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=41 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-41-curse-on-the-ungodly-seed',
       E'From a curse to destruction: the ungodly and their seed',
       E'Sirach turns from death itself to the death the wicked earn: *Woe be to you, ungodly men, which have forsaken the law of the most high Yahuah (God)! for if you increase, it shall be to your destruction* (Ecclesiasticus 41:8), so that *if you be born, you shall be born to a curse: and if you die, a curse shall be your portion* (41:9), and *All that are of the earth shall turn to earth again: so the ungodly shall go from a curse to destruction* (41:10). It ain''t new: the apostle weighs the two ends in one breath — *For the wages of sin is death; but the gift of Elohim (God) is eternal life through Yahusha HaMashiach (Jesus Christ) our Lord* (Romans 6:23). And the sister-book traces death itself to its root — *Nevertheless through envy of the devil came death into the world: and they that do hold of his side do find it* (Wisdom of Solomon 2:24): the ungodly who forsake the law hold of that side and find the curse.',
       sv.verse_id, ev.verse_id, 'extras', 59303
  FROM _session253_sir41_lookup sv, _session253_sir41_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=41 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=41 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-41-a-good-name-endureth-for-ever',
       E'A good name endureth for ever',
       E'Against the blotted-out name of sinners (Ecclesiasticus 41:11), Ben Sira counsels, *Have regard to your name; for that shall continue with you above a thousand great treasures of gold* (41:12), for *A good life has but few days: but a good name endureth for ever* (41:13). It ain''t new: this is the Proverb''s own scale — *A good name is rather to be chosen than great riches, and loving favour rather than silver and gold* (Proverbs 22:1) — and the Preacher weighs it against the day of death itself: *A good name is better than precious ointment; and the day of death than the day of one''s birth* (Ecclesiastes 7:1).',
       sv.verse_id, ev.verse_id, 'extras', 59306
  FROM _session253_sir41_lookup sv, _session253_sir41_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=41 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=41 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-41-hidden-wisdom-no-profit',
       E'Hidden wisdom, hidden treasure: where is the profit?',
       E'Ben Sira charges his children, *keep discipline in peace: for wisdom that is hid, and a treasure that is not seen, what profit is in them both?* (Ecclesiasticus 41:14), and rules that *A man that hideth his foolishness is better than a man that hideth his wisdom* (41:15). It ain''t new: the Preacher gives the whole matter its end — *Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13) — the wisdom not to be hidden is the kept commandment lived out in the fear of Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 59309
  FROM _session253_sir41_lookup sv, _session253_sir41_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=41 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=41 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-41-shame-rightly-placed',
       E'Shame rightly placed: before the covenant and the congregation',
       E'Ben Sira lists the things a man ought to be ashamed of: *Of an offence before a judge and ruler; of iniquity before a congregation and people; of unjust dealing before your partner and friend* (Ecclesiasticus 41:18), and *theft in regard of the place where you sojournest, and in regard of the truth of Yahuah (God) and his covenant* (41:19) — so that the rightly-shamefaced man shall *find favour before all men* (41:24). It ain''t new: the fear that places shame aright is the fear of Yahuah the Proverb crowns — *By humility and the fear of Yahuah (LORD) are riches, and honour, and life* (Proverbs 22:4) — and the secret dealings that shame us are weighed in the judgment the Preacher foretells: *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil* (Ecclesiastes 12:14).',
       sv.verse_id, ev.verse_id, 'extras', 59312
  FROM _session253_sir41_lookup sv, _session253_sir41_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=41 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=41 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-41-sentence-of-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The sentence of Yahuah over all flesh that Sirach 41:3 bids us not to fear is the very dust-to-dust decree first spoken over Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_sir41_lookup sv, _session253_sir41_lookup tv
 WHERE t.slug='ecclesiasticus-41-sentence-of-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=41 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 12:7 — *Then shall the dust return to the earth as it was: and the spirit shall return unto Elohim (God) who gave it.* As Sirach 41:4 asks why a man strives against the Most High in the grave, the Preacher answers that body returns to dust and spirit to the Elohim who gave it.'
  FROM cross_reference_threads t, cross_references x, _session253_sir41_lookup sv, _session253_sir41_lookup tv
 WHERE t.slug='ecclesiasticus-41-sentence-of-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=41 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 9:27 — *And as it is appointed unto men once to die, but after this the judgment.* The single sentence of death over all flesh in Sirach 41:3 is the same appointment the apostle sets before the judgment to come.'
  FROM cross_reference_threads t, cross_references x, _session253_sir41_lookup sv, _session253_sir41_lookup tv
 WHERE t.slug='ecclesiasticus-41-sentence-of-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=41 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-41-curse-on-the-ungodly-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 6:23 — *For the wages of sin is death; but the gift of Elohim (God) is eternal life through Yahusha HaMashiach (Jesus Christ) our Lord.* The curse that is the ungodly man''s portion in Sirach 41:9 is the wages of sin the apostle sets against the free gift of life.'
  FROM cross_reference_threads t, cross_references x, _session253_sir41_lookup sv, _session253_sir41_lookup tv
 WHERE t.slug='ecclesiasticus-41-curse-on-the-ungodly-seed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=41 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=6 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 2:24 — *Nevertheless through envy of the devil came death into the world: and they that do hold of his side do find it.* Sirach 41:10''s ungodly who go from a curse to destruction are the ones who hold of the devil''s side and so find the death he brought into the world.'
  FROM cross_reference_threads t, cross_references x, _session253_sir41_lookup sv, _session253_sir41_lookup tv
 WHERE t.slug='ecclesiasticus-41-curse-on-the-ungodly-seed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=41 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-41-a-good-name-endureth-for-ever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 22:1 — *A good name is rather to be chosen than great riches, and loving favour rather than silver and gold.* Sirach 41:12 sets a good name above a thousand treasures of gold exactly as the Proverb prefers it to great riches.'
  FROM cross_reference_threads t, cross_references x, _session253_sir41_lookup sv, _session253_sir41_lookup tv
 WHERE t.slug='ecclesiasticus-41-a-good-name-endureth-for-ever'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=41 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 7:1 — *A good name is better than precious ointment; and the day of death than the day of one''s birth.* The enduring good name of Sirach 41:13, set over a short life, is the Preacher''s name better than ointment, outlasting the day of death.'
  FROM cross_reference_threads t, cross_references x, _session253_sir41_lookup sv, _session253_sir41_lookup tv
 WHERE t.slug='ecclesiasticus-41-a-good-name-endureth-for-ever'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=41 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-41-hidden-wisdom-no-profit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 12:13 — *Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man.* The wisdom Sirach 41:14 says profits nothing while hidden is the kept commandment the Preacher names as the whole duty of man.'
  FROM cross_reference_threads t, cross_references x, _session253_sir41_lookup sv, _session253_sir41_lookup tv
 WHERE t.slug='ecclesiasticus-41-hidden-wisdom-no-profit'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=41 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-41-shame-rightly-placed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 22:4 — *By humility and the fear of Yahuah (LORD) are riches, and honour, and life.* The shame Sirach 41:19 demands before the truth of Yahuah and his covenant is the same fear of Yahuah the Proverb rewards with honour and life.'
  FROM cross_reference_threads t, cross_references x, _session253_sir41_lookup sv, _session253_sir41_lookup tv
 WHERE t.slug='ecclesiasticus-41-shame-rightly-placed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=41 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 12:14 — *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil.* The iniquity before a congregation that shames a man in Sirach 41:18 is among the secret things the Preacher says Elohim will bring into judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_sir41_lookup sv, _session253_sir41_lookup tv
 WHERE t.slug='ecclesiasticus-41-shame-rightly-placed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=41 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

