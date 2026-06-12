-- ----- fragment: minion_1adameve_60.sql (session253 1-adam-eve 60) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch60. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae60 (view _session253_1ae60_lookup). Sort band base 65475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae60_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-60-garment-of-light
  ('adam-eve-conflict', '1-adam-eve', 60, 1, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The garment of light and bright girdle Satan dons at the cave is the apostle''s angel-of-light disguise exactly.'),
  ('adam-eve-conflict', '1-adam-eve', 60, 3, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* His transforming himself "in order to deceive Adam and Eve" is the same world-deceiving serpent shown from the first days outside Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 60, 2, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Satan''s pleasant face and sweet speech are the prowling adversary seeking to devour the first family.'),
  -- thread: 1-adam-eve-60-false-creation-story
  ('adam-eve-conflict', '1-adam-eve', 60, 9, 'canon', 'genesis', 2, 21, 'free', E'Genesis 2:21 — *And Yahuah Elohim caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof.* Satan steals the true "slumber" and "side" and re-tells it of himself, the deep sleep being Yahuah''s act and not his.'),
  ('adam-eve-conflict', '1-adam-eve', 60, 13, 'canon', 'genesis', 2, 22, 'free', E'Genesis 2:22 — *And the rib, which Yahuah Elohim had taken from man, made he a woman, and brought her unto the man.* Satan''s claim to have "brought out of his side a help-meet" forges the very help-meet Yahuah alone fashioned from Adam''s rib.'),
  ('adam-eve-conflict', '1-adam-eve', 60, 6, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* "I am flesh and bones like you" is the father of lies speaking of his own, as he has from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 60, 6, 'canon', 'genesis', 3, 1, 'free', E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim had made. And he said unto the woman, Yea, hath Elohim said, Ye shall not eat of every tree of the garden?* The same subtle questioning of Elohim''s word at the tree returns as a wholesale re-writing of Elohim''s creating word at the cave.'),
  -- thread: 1-adam-eve-60-false-commission-and-tears
  ('adam-eve-conflict', '1-adam-eve', 60, 16, 'canon', 'galatians', 1, 8, 'free', E'Galatians 1:8 — *But though we, or an angel from heaven, preach any other gospel unto you than that which we have preached unto you, let him be accursed.* Satan''s counterfeit "Elohim sent me to restore you" is exactly the other gospel from a false angel of heaven that stands accursed.'),
  ('adam-eve-conflict', '1-adam-eve', 60, 28, 'canon', 'matthew', 7, 15, 'free', E'Matthew 7:15 — *Beware of false prophets, which come to you in sheep''s clothing, but inwardly they are ravening wolves.* The sweet talk and sobbing that softened their hearts is the sheep''s clothing over the ravening wolf.'),
  ('adam-eve-conflict', '1-adam-eve', 60, 27, 'canon', '2-corinthians', 11, 3, 'free', E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah.* The feigned tears that corrupt Adam and Eve''s judgment are the serpent''s subtilty beguiling them anew.'),
  ('adam-eve-conflict', '1-adam-eve', 60, 28, 'canon', 'genesis', 3, 13, 'free', E'Genesis 3:13 — *And Yahuah Elohim said unto the woman, What is this that thou hast done? And the woman said, The serpent beguiled me, and I did eat.* Believing him "true" at the cave repeats the beguiling Eve confessed at the tree.'),
  ('adam-eve-conflict', '1-adam-eve', 60, 16, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Against this very deceiver Yahuah''s seed-promise of Genesis 3:15 stands, the crushing of Satan that keeps the line of the woman.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae60_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae60_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-60-garment-of-light',
       E'Satan clad in a garment of light',
       E'Satan comes to the cave on the eighty-ninth day to break the forty days'' fast: *Then on the eighty-ninth day, Satan came to the cave, clad in a garment of light, and girt about with a bright girdle* (1 Adam & Eve 60:1), and *He thus transformed himself in order to deceive Adam and Eve* (1 Adam & Eve 60:3). It ain''t new — the apostle named this very tactic: *And no marvel; for Satan himself is transformed into an angel of light* (2 Corinthians 11:14). His face was pleasant and his speech was sweet, but the adversary is the same of old: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8). Every assault since Eden has worn a fair mask: *that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9).',
       sv.verse_id, ev.verse_id, 'extras', 65475
  FROM _session253_1ae60_lookup sv, _session253_1ae60_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=60 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=60 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-60-false-creation-story',
       E'The lie that inverts Genesis — Adam from Satan''s side',
       E'Satan fabricates a counterfeit creation-story to claim kinship with Adam: *He brought you, O Adam, out of my side... But Elohim took you in His divine hand, and placed you in a garden to the eastward* (1 Adam & Eve 60:9-10), and *For now I have brought out of his side a help-meet for him* (1 Adam & Eve 60:13). It is a sheer inversion of the truth — for it was Yahuah, not Satan, who formed and divided: *And Yahuah Elohim formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7), and *And Yahuah Elohim caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs* (Genesis 2:21). The serpent is doing again what he did at the tree, twisting Yahuah''s word: *Yea, hath Elohim said?* (Genesis 3:1). He speaks the lie of his own nature: *He was a murderer from the beginning... When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it* (John 8:44).',
       sv.verse_id, ev.verse_id, 'extras', 65478
  FROM _session253_1ae60_lookup sv, _session253_1ae60_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=60 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=60 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-60-false-commission-and-tears',
       E'The feigned commission and the false tears',
       E'Satan crowns the lie by claiming Yahuah Himself sent him to feed them of the Tree of Life and clothe them in light: *give them to eat of the fruit of the Tree of Life... and clothe them in a garment of light, and restore them to their former state of grace* (1 Adam & Eve 60:16); then he weeps to win their trust: *Then he began to cry and to sob before Adam and Eve... their hearts softened towards him; they obeyed him, for they believed he was true* (1 Adam & Eve 60:27-28). This is a false gospel preached by a false angel, and Sha''ul''s curse falls on it: *But though we, or an angel from heaven, preach any other gospel unto you than that which we have preached unto you, let him be accursed* (Galatians 1:8). It comes in disguise like the wolf: *Beware of false prophets, which come to you in sheep''s clothing, but inwardly they are ravening wolves* (Matthew 7:15). Eve once owned the pattern — *The serpent beguiled me, and I did eat* (Genesis 3:13) — yet Yahuah''s mercy keeps the seed against the deceiver, for *the Elohim of peace shall bruise Satan under your feet shortly* (Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 65481
  FROM _session253_1ae60_lookup sv, _session253_1ae60_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=60 AND sv.verse_number=16
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=60 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-60-garment-of-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The garment of light and bright girdle Satan dons at the cave is the apostle''s angel-of-light disguise exactly.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae60_lookup sv, _session253_1ae60_lookup tv
 WHERE t.slug='1-adam-eve-60-garment-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=60 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* His transforming himself "in order to deceive Adam and Eve" is the same world-deceiving serpent shown from the first days outside Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae60_lookup sv, _session253_1ae60_lookup tv
 WHERE t.slug='1-adam-eve-60-garment-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=60 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Satan''s pleasant face and sweet speech are the prowling adversary seeking to devour the first family.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae60_lookup sv, _session253_1ae60_lookup tv
 WHERE t.slug='1-adam-eve-60-garment-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=60 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-60-false-creation-story
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:21 — *And Yahuah Elohim caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof.* Satan steals the true "slumber" and "side" and re-tells it of himself, the deep sleep being Yahuah''s act and not his.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae60_lookup sv, _session253_1ae60_lookup tv
 WHERE t.slug='1-adam-eve-60-false-creation-story'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=60 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:22 — *And the rib, which Yahuah Elohim had taken from man, made he a woman, and brought her unto the man.* Satan''s claim to have "brought out of his side a help-meet" forges the very help-meet Yahuah alone fashioned from Adam''s rib.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae60_lookup sv, _session253_1ae60_lookup tv
 WHERE t.slug='1-adam-eve-60-false-creation-story'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=60 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* "I am flesh and bones like you" is the father of lies speaking of his own, as he has from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae60_lookup sv, _session253_1ae60_lookup tv
 WHERE t.slug='1-adam-eve-60-false-creation-story'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=60 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim had made. And he said unto the woman, Yea, hath Elohim said, Ye shall not eat of every tree of the garden?* The same subtle questioning of Elohim''s word at the tree returns as a wholesale re-writing of Elohim''s creating word at the cave.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae60_lookup sv, _session253_1ae60_lookup tv
 WHERE t.slug='1-adam-eve-60-false-creation-story'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=60 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-60-false-commission-and-tears
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 1:8 — *But though we, or an angel from heaven, preach any other gospel unto you than that which we have preached unto you, let him be accursed.* Satan''s counterfeit "Elohim sent me to restore you" is exactly the other gospel from a false angel of heaven that stands accursed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae60_lookup sv, _session253_1ae60_lookup tv
 WHERE t.slug='1-adam-eve-60-false-commission-and-tears'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=60 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:15 — *Beware of false prophets, which come to you in sheep''s clothing, but inwardly they are ravening wolves.* The sweet talk and sobbing that softened their hearts is the sheep''s clothing over the ravening wolf.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae60_lookup sv, _session253_1ae60_lookup tv
 WHERE t.slug='1-adam-eve-60-false-commission-and-tears'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=60 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah.* The feigned tears that corrupt Adam and Eve''s judgment are the serpent''s subtilty beguiling them anew.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae60_lookup sv, _session253_1ae60_lookup tv
 WHERE t.slug='1-adam-eve-60-false-commission-and-tears'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=60 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:13 — *And Yahuah Elohim said unto the woman, What is this that thou hast done? And the woman said, The serpent beguiled me, and I did eat.* Believing him "true" at the cave repeats the beguiling Eve confessed at the tree.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae60_lookup sv, _session253_1ae60_lookup tv
 WHERE t.slug='1-adam-eve-60-false-commission-and-tears'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=60 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Against this very deceiver Yahuah''s seed-promise of Genesis 3:15 stands, the crushing of Satan that keeps the line of the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae60_lookup sv, _session253_1ae60_lookup tv
 WHERE t.slug='1-adam-eve-60-false-commission-and-tears'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=60 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

