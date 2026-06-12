-- ----- fragment: minion_2adameve_05.sql (session253 2-adam-eve 5) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae5 (view _session253_2ae5_lookup). Sort band base 66100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-5-seth-holy-seed
  ('adam-eve-conflict', '2-adam-eve', 5, 1, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Seth fasting and praying from his seventh year (2 Adam & Eve 5:1) is the appointed seed himself, set in the slain Abel''s place.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 1, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Seth entreating Elohim through the night (2 Adam & Eve 5:1) is the house in which calling on the Name begins.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 3, 'canon', 'genesis', 4, 3, 'free', E'Genesis 4:3 — *And in process of time it came to pass, that Cain brought of the fruit of the ground an offering unto Yahuah (LORD).* Seth''s offering that pleased Elohim (2 Adam & Eve 5:3) is Abel''s accepted altar carried on against Cain''s rejected one.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 1, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Seth kept holy from childhood (2 Adam & Eve 5:1) is the seed of the woman that the serpent now moves to strike.'),
  -- thread: 2-adam-eve-5-angel-of-light
  ('adam-eve-conflict', '2-adam-eve', 5, 4, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan appearing to Seth as a beautiful angel girt with light (2 Adam & Eve 5:4) is exactly the transformation Paul exposes.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 5, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The fair words by which Satan begins to beguile Seth (2 Adam & Eve 5:5) are the lies of the father of lies.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 4, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The angel of light at Seth''s altar (2 Adam & Eve 5:4) is the same old serpent who deceiveth the whole world.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 5, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The smiling tempter circling the seven-year-old at his offering (2 Adam & Eve 5:5) is the adversary seeking whom he may devour.'),
  -- thread: 2-adam-eve-5-ye-shall-be-as-gods
  ('adam-eve-conflict', '2-adam-eve', 5, 11, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s boast that we all are gods (2 Adam & Eve 5:11) is the garden serpent''s lie repeated to the seed of the woman.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 9, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The false promise of a sinless world of light without offering (2 Adam & Eve 5:9) is the deception of the whole world.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 11, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Against Satan''s godless ''we all are gods'' (2 Adam & Eve 5:11), the Son of Elohim is manifested to destroy these works.'),
  -- thread: 2-adam-eve-5-mingling-the-seed
  ('adam-eve-conflict', '2-adam-eve', 5, 6, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Satan urging Seth to wed his beautiful women (2 Adam & Eve 5:6) is the very mingling Genesis 6 records of Seth''s line.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 10, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The wedding Satan calls ''no sin'' (2 Adam & Eve 5:10) bears the very fruit of giants Genesis names.'),
  ('adam-eve-conflict', '2-adam-eve', 5, 6, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The line Seth is wooed to join (2 Adam & Eve 5:6) is the wicked one''s seed-line, set apart from the righteous from the start.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-5-seth-holy-seed',
       E'Seth the appointed seed, daily before the altar',
       E'From his seventh year Seth is the holy seed kept against the serpent: *As for Seth, when he was seven years old, he knew good and evil, and was consistent in fasting and praying, and spent all his nights in entreating Elohim (God) for mercy and forgiveness.* (2 Adam & Eve 5:1) — *for he was of a fair countenance, like unto an angel of Elohim (God)* (2 Adam & Eve 5:2), *And Elohim (God) was pleased with his offering* (2 Adam & Eve 5:3). It ain''t new: Seth is the very son Yahuah set in Abel''s place — *and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew* (Genesis 4:25). With Seth''s house the worship of the Name begins — *then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26) — the way kept before Sinai. Seth''s daily offering that pleased Elohim is Abel''s accepted altar carried on in the line — *And in process of time it came to pass, that Cain brought of the fruit of the ground an offering unto Yahuah (LORD)* (Genesis 4:3). This is the seed-war from the first day outside Eden: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15).',
       sv.verse_id, ev.verse_id, 'extras', 66100
  FROM _session253_2ae5_lookup sv, _session253_2ae5_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=5 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-5-angel-of-light',
       E'Satan transformed into an angel of light',
       E'The very moment Seth steps down from the altar, the deceiver comes wearing borrowed glory: *Satan appeared unto him in the form of a beautiful angel, brilliant with light; with a staff of light in his hand, himself girt about with a girdle of light.* (2 Adam & Eve 5:4) — *He greeted Seth with a beautiful smile, and began to beguile him with fair words* (2 Adam & Eve 5:5). It ain''t new — this is the apostle''s plain warning: *And no marvel; for Satan himself is transformed into an angel of light* (2 Corinthians 11:14). He is the liar from the first day — *Ye are of your father the devil... He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it* (John 8:44) — the same old serpent: *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9). And he hunts the holy child as ever: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8).',
       sv.verse_id, ev.verse_id, 'extras', 66103
  FROM _session253_2ae5_lookup sv, _session253_2ae5_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-5-ye-shall-be-as-gods',
       E'The old Eden lie: no more sin, ye shall be gods',
       E'Satan''s offer to Seth recycles the first deception word for word: *thou shalt remain in our world, and rest from this world and the misery of it... thou shalt never bring up an offering, nor sue for mercy; for thou shalt commit no more sin nor be swayed by passions* (2 Adam & Eve 5:9), and the climax — *For in our world we have no Elohim (God); but we all are gods; we all are of the light, heavenly, powerful, strong and glorious* (2 Adam & Eve 5:11). This is the serpent''s word in the garden made plain — the promise of godhood without Yahuah, the very voice cursed in Eden: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). It ain''t new: the deceiver of the whole world is still selling the lie — *and Satan, which deceiveth the whole world* (Revelation 12:9). But the Son of Elohim was manifested for this very war — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 66106
  FROM _session253_2ae5_lookup sv, _session253_2ae5_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=5 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-5-mingling-the-seed',
       E'Satan''s daughters: the mingling of the two seed-lines',
       E'The whole aim of the deception is to mingle the holy seed with Satan''s house: *I wish thee, 0 Seth, to wed one of them... in this land there is not one woman good enough for thee* (2 Adam & Eve 5:6), and again — *if thou wilt hearken to what I say, thou shalt wed one of my daughters; for with us it is no sin so to do; neither is it reckoned animal lust* (2 Adam & Eve 5:10). It ain''t new — this is the very corruption Genesis records when Seth''s line is later drawn down: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2), *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown* (Genesis 6:4). The two seed-lines are never to be mingled — Cain''s house is the wicked one''s: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12).',
       sv.verse_id, ev.verse_id, 'extras', 66109
  FROM _session253_2ae5_lookup sv, _session253_2ae5_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=5 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-5-seth-holy-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Seth fasting and praying from his seventh year (2 Adam & Eve 5:1) is the appointed seed himself, set in the slain Abel''s place.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-seth-holy-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Seth entreating Elohim through the night (2 Adam & Eve 5:1) is the house in which calling on the Name begins.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-seth-holy-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:3 — *And in process of time it came to pass, that Cain brought of the fruit of the ground an offering unto Yahuah (LORD).* Seth''s offering that pleased Elohim (2 Adam & Eve 5:3) is Abel''s accepted altar carried on against Cain''s rejected one.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-seth-holy-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Seth kept holy from childhood (2 Adam & Eve 5:1) is the seed of the woman that the serpent now moves to strike.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-seth-holy-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-5-angel-of-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Satan appearing to Seth as a beautiful angel girt with light (2 Adam & Eve 5:4) is exactly the transformation Paul exposes.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The fair words by which Satan begins to beguile Seth (2 Adam & Eve 5:5) are the lies of the father of lies.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The angel of light at Seth''s altar (2 Adam & Eve 5:4) is the same old serpent who deceiveth the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The smiling tempter circling the seven-year-old at his offering (2 Adam & Eve 5:5) is the adversary seeking whom he may devour.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-5-ye-shall-be-as-gods
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s boast that we all are gods (2 Adam & Eve 5:11) is the garden serpent''s lie repeated to the seed of the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-ye-shall-be-as-gods'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The false promise of a sinless world of light without offering (2 Adam & Eve 5:9) is the deception of the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-ye-shall-be-as-gods'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Against Satan''s godless ''we all are gods'' (2 Adam & Eve 5:11), the Son of Elohim is manifested to destroy these works.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-ye-shall-be-as-gods'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-5-mingling-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Satan urging Seth to wed his beautiful women (2 Adam & Eve 5:6) is the very mingling Genesis 6 records of Seth''s line.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-mingling-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The wedding Satan calls ''no sin'' (2 Adam & Eve 5:10) bears the very fruit of giants Genesis names.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-mingling-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The line Seth is wooed to join (2 Adam & Eve 5:6) is the wicked one''s seed-line, set apart from the righteous from the start.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae5_lookup sv, _session253_2ae5_lookup tv
 WHERE t.slug='2-adam-eve-5-mingling-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

