-- ----- fragment: minion_2adameve_03.sql (session253 2-adam-eve 3) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae3 (view _session253_2ae3_lookup). Sort band base 66050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-3-satan-envies-the-seed
  ('adam-eve-conflict', '2-adam-eve', 3, 1, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s envy of Adam and his strife against the marriage is the enmity at the seed sworn at the garden gate, set loose here in the seventh year outside Eden.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 1, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The envying adversary of 2 Adam & Eve 3:1 meets the verdict already sworn against him: the bruising of his head.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 8, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The murder of righteous Abel that Satan feigns to mourn in 2 Adam & Eve 3:8 was his own work, for he was a murderer from the beginning.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 1, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The seed-war Satan opens against Adam in 2 Adam & Eve 3:1 is the very work the manifested Son comes to destroy.'),
  -- thread: 2-adam-eve-3-satan-as-the-beautiful-woman
  ('adam-eve-conflict', '2-adam-eve', 3, 4, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan''s appearing to Adam in the form of a beautiful woman in 2 Adam & Eve 3:4 is the very transforming Paul names — the deceiver in a borrowed, comely shape.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 11, 'canon', '2-corinthians', 11, 3, 'free', E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The false wedding-promise pressed on Adam in 2 Adam & Eve 3:11 is the same subtilty that beguiled Eve, now turned on her husband.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 4, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The shape-shifting tempter of 2 Adam & Eve 3:4 is that old serpent whose trade is deceiving the whole world.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 12, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The flattering counsel to spend the days of youth in mirth and pleasure in 2 Adam & Eve 3:12 is the adversary stalking to devour his prey.'),
  -- thread: 2-adam-eve-3-the-word-comes-and-unmasks
  ('adam-eve-conflict', '2-adam-eve', 3, 15, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word that Elohim sends to Adam in 2 Adam & Eve 3:15 is the eternal Logos, with Elohim and Elohim from the beginning.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 15, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who comes to comfort Adam in 2 Adam & Eve 3:15 is the same who would be made flesh and dwell among men.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 15, 'canon', 'hebrews', 1, 1, 'free', E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The Word sent to Adam in 2 Adam & Eve 3:15 is Yahuah speaking to the first father, the earliest of the sundry manners He spoke of old.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 15, 'canon', 'genesis', 3, 5, 'free', E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* The Word names the woman-figure as the one that promised Adam the Godhead in 2 Adam & Eve 3:15 — the serpent''s identical first lie, that man should be as gods.'),
  -- thread: 2-adam-eve-3-many-forms-and-mercy
  ('adam-eve-conflict', '2-adam-eve', 3, 15, 'canon', 'genesis', 3, 1, 'free', E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* The serpent-form among the deceiver''s many guises in 2 Adam & Eve 3:15 is the very beast that beguiled Eve in the garden.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 15, 'enoch', '1-enoch', 19, 1, 'extras', E'1 Enoch 19:1 — *And Uriel said to me: ’Here shall stand the angels who have connected themselves with women, and their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods, here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* The many forms Satan takes to destroy Adam''s soul in 2 Adam & Eve 3:15 are the same shape-shifting by which the fallen spirits defile mankind and are worshipped as gods.'),
  ('adam-eve-conflict', '2-adam-eve', 3, 16, 'canon', 'psalms', 34, 7, 'free', E'Psalm 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* Yahuah''s delivering Adam many a time from the deceiver''s hands in 2 Adam & Eve 3:16 is the same encamping mercy that guards all who fear Him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-3-satan-envies-the-seed',
       E'Satan envies the man and strives at the seed',
       E'*As for our father Adam, at the end of seven years from the day he had been severed from his wife Eve, Satan envied him, when he saw him thus separated from her; and strove to make him live with her again* (2 Adam & Eve 3:1) — and the grief of the murdered Abel and the rejoicing over the born Seth (3:8-9) name the war out loud. It ain''t new: this is the enmity Yahuah set in the dust at the gate of the garden, *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). Every assault on Adam''s marriage and seed is the serpent striking at the seed of the woman, and the verdict is already written: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20). For this the Son was manifested — *that he might destroy the works of the devil* (1 John 3:8). And the first murder, Abel, is the first casualty of the seed-war the apostle remembers — *He was a murderer from the beginning* (John 8:44).',
       sv.verse_id, ev.verse_id, 'extras', 66050
  FROM _session253_2ae3_lookup sv, _session253_2ae3_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-3-satan-as-the-beautiful-woman',
       E'Satan transformed as a beautiful woman with a false promise',
       E'On the night of the fortieth day *Satan, the hater of all good, when he saw Adam thus alone, fasting and praying, appeared unto him in the form of a beautiful woman* (2 Adam & Eve 3:4), claiming *Elohim''s (God''s) promise to me is fulfilled; for it is He who has sent me to thee for the wedding* (3:11) — a false word of God in a borrowed shape. It ain''t new: the same beguiler who deceived Eve transforms to deceive again, *And no marvel; for Satan himself is transformed into an angel of light* (2 Corinthians 11:14), the very pattern Paul fears, *as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah* (2 Corinthians 11:3). He is *that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9), prowling *as a roaring lion* who *walketh about, seeking whom he may devour* (1 Peter 5:8).',
       sv.verse_id, ev.verse_id, 'extras', 66053
  FROM _session253_2ae3_lookup sv, _session253_2ae3_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-3-the-word-comes-and-unmasks',
       E'The Word of Elohim comes and unmasks the deceiver',
       E'Adam *prayed to Elohim (God) with a fervent heart to deliver him from her* (2 Adam & Eve 3:14), and *Then Elohim (God) sent His Word unto Adam* (3:15) — the Word who exposes that the figure is the one that promised him the Godhead and majesty, at one time in the form of a woman, another moment in the likeness of an angel, doing all only to destroy his soul. It ain''t new: this is the Logos, *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), *And the Word was made flesh, and dwelt among us* (John 1:14), the same who in old time *spake in time past unto the fathers by the prophets* (Hebrews 1:1). The promise of the Godhead the Word unmasks is the serpent''s first lie verbatim — *ye shall be as gods, knowing good and evil* (Genesis 3:5).',
       sv.verse_id, ev.verse_id, 'extras', 66056
  FROM _session253_2ae3_lookup sv, _session253_2ae3_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=14
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=3 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-3-many-forms-and-mercy',
       E'The many forms of the deceiver and the mercy that delivers',
       E'The Word tells Adam the figure shows himself at one time in the form of a woman, another moment in the likeness of an angel, on another occasion in the similitude of a serpent, and at another in the semblance of a god, doing all only to destroy his soul (2 Adam & Eve 3:15) — yet *I have delivered thee many a time from his hands; in order to show thee that I am a merciful Elohim (God)* (3:16). It ain''t new: the deceiver''s serpent-form is the garden serpent, *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made* (Genesis 3:1). The watchers of old likewise *assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods* (1 Enoch 19:1). But against him Yahuah''s mercy keeps the seed, for *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* (Psalm 34:7).',
       sv.verse_id, ev.verse_id, 'extras', 66059
  FROM _session253_2ae3_lookup sv, _session253_2ae3_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=15
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=3 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-3-satan-envies-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s envy of Adam and his strife against the marriage is the enmity at the seed sworn at the garden gate, set loose here in the seventh year outside Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-satan-envies-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The envying adversary of 2 Adam & Eve 3:1 meets the verdict already sworn against him: the bruising of his head.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-satan-envies-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The murder of righteous Abel that Satan feigns to mourn in 2 Adam & Eve 3:8 was his own work, for he was a murderer from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-satan-envies-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The seed-war Satan opens against Adam in 2 Adam & Eve 3:1 is the very work the manifested Son comes to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-satan-envies-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-3-satan-as-the-beautiful-woman
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan''s appearing to Adam in the form of a beautiful woman in 2 Adam & Eve 3:4 is the very transforming Paul names — the deceiver in a borrowed, comely shape.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-satan-as-the-beautiful-woman'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The false wedding-promise pressed on Adam in 2 Adam & Eve 3:11 is the same subtilty that beguiled Eve, now turned on her husband.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-satan-as-the-beautiful-woman'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The shape-shifting tempter of 2 Adam & Eve 3:4 is that old serpent whose trade is deceiving the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-satan-as-the-beautiful-woman'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The flattering counsel to spend the days of youth in mirth and pleasure in 2 Adam & Eve 3:12 is the adversary stalking to devour his prey.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-satan-as-the-beautiful-woman'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-3-the-word-comes-and-unmasks
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word that Elohim sends to Adam in 2 Adam & Eve 3:15 is the eternal Logos, with Elohim and Elohim from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-the-word-comes-and-unmasks'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who comes to comfort Adam in 2 Adam & Eve 3:15 is the same who would be made flesh and dwell among men.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-the-word-comes-and-unmasks'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The Word sent to Adam in 2 Adam & Eve 3:15 is Yahuah speaking to the first father, the earliest of the sundry manners He spoke of old.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-the-word-comes-and-unmasks'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* The Word names the woman-figure as the one that promised Adam the Godhead in 2 Adam & Eve 3:15 — the serpent''s identical first lie, that man should be as gods.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-the-word-comes-and-unmasks'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-3-many-forms-and-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* The serpent-form among the deceiver''s many guises in 2 Adam & Eve 3:15 is the very beast that beguiled Eve in the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-many-forms-and-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 19:1 — *And Uriel said to me: ’Here shall stand the angels who have connected themselves with women, and their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods, here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* The many forms Satan takes to destroy Adam''s soul in 2 Adam & Eve 3:15 are the same shape-shifting by which the fallen spirits defile mankind and are worshipped as gods.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-many-forms-and-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* Yahuah''s delivering Adam many a time from the deceiver''s hands in 2 Adam & Eve 3:16 is the same encamping mercy that guards all who fear Him.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae3_lookup sv, _session253_2ae3_lookup tv
 WHERE t.slug='2-adam-eve-3-many-forms-and-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

