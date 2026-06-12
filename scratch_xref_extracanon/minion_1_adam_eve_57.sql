-- ----- fragment: minion_1adameve_57.sql (session253 1-adam-eve 57) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch57. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae57 (view _session253_1ae57_lookup). Sort band base 65400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae57_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-57-hid-in-the-serpent
  ('adam-eve-conflict', '1-adam-eve', 57, 2, 'canon', 'genesis', 3, 4, 'free', E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die:* the lie Satan now confesses he spoke through the serpent in 1 Adam and Eve 57:2.'),
  ('adam-eve-conflict', '1-adam-eve', 57, 2, 'canon', 'genesis', 3, 13, 'free', E'Genesis 3:13 — *And Yahuah Elohim (the LORD God) said unto the woman, What is this that thou hast done? And the woman said, The serpent beguiled me, and I did eat.* Eve''s confession in the garden is the very deception Satan boasts of having worked in 1 Adam and Eve 57:2.'),
  ('adam-eve-conflict', '1-adam-eve', 57, 2, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The Messiah names the liar whose deceitful speech enticed Eve in 1 Adam and Eve 57:2.'),
  ('adam-eve-conflict', '1-adam-eve', 57, 1, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The hideous figure Adam sees in 1 Adam and Eve 57:1 is that old serpent unmasked.'),
  -- thread: 1-adam-eve-57-i-never-meant-to-keep-it
  ('adam-eve-conflict', '1-adam-eve', 57, 5, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The same masquerade that sold Adam a divine nature he never delivered in 1 Adam and Eve 57:5.'),
  ('adam-eve-conflict', '1-adam-eve', 57, 5, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Satan''s confession that he never meant to keep his promise (1 Adam and Eve 57:5) is the father of lies speaking his own.'),
  ('adam-eve-conflict', '1-adam-eve', 57, 4, 'canon', 'genesis', 3, 5, 'free', E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* The very promise of a divine nature Adam now demands back in 1 Adam and Eve 57:4 was the slick speech of the serpent in the garden.'),
  -- thread: 1-adam-eve-57-i-am-king-over-you
  ('adam-eve-conflict', '1-adam-eve', 57, 7, 'canon', 'romans', 6, 16, 'free', E'Romans 6:16 — *Know ye not, that to whom ye yield yourselves servants to obey, his servants ye are to whom ye obey; whether of sin unto death, or of obedience unto righteousness?* Satan''s claim of kingship rests on the same law — Adam obeyed him, so came under his rule in 1 Adam and Eve 57:7.'),
  ('adam-eve-conflict', '1-adam-eve', 57, 7, 'canon', 'john', 12, 31, 'free', E'John 12:31 — *Now is the judgment of this world: now shall the prince of this world be cast out.* The self-styled king of 1 Adam and Eve 57:7 is the prince whose casting-out the Messiah proclaims.'),
  ('adam-eve-conflict', '1-adam-eve', 57, 7, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The day of deliverance Satan fears in 1 Adam and Eve 57:7 is the Son manifested to destroy his rule.'),
  ('adam-eve-conflict', '1-adam-eve', 57, 6, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s gloating that whosoever takes his counsel falls with him (1 Adam and Eve 57:6) is the enmity the LORD set between the two seeds.'),
  -- thread: 1-adam-eve-57-war-and-murder-on-your-seed
  ('adam-eve-conflict', '1-adam-eve', 57, 8, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The war Satan vows on Adam''s descendants in 1 Adam and Eve 57:8 is the seed-war Yahuah Himself declared.'),
  ('adam-eve-conflict', '1-adam-eve', 57, 8, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* the same adversary multiplying war and murder on the sons of Adam in 1 Adam and Eve 57:8.'),
  ('adam-eve-conflict', '1-adam-eve', 57, 10, 'canon', 'matthew', 25, 41, 'free', E'Matthew 25:41 — *Then shall he say also unto them on the left hand, Depart from me, ye cursed, into everlasting fire, prepared for the devil and his angels:* the burning fire Satan calls home in 1 Adam and Eve 57:10 is the everlasting fire prepared for him.'),
  ('adam-eve-conflict', '1-adam-eve', 57, 9, 'jubilees', 'jubilees', 10, 8, 'extras', E'Jubilees 10:8 — *And the chief of the spirits, Mastêmâ, came and said: “Yahuah (God), Creator, let some of them remain before me, and let them hearken to my voice, and do all that I shall say to them; for if some of them are not left to me, I shall not be able to execute the power of my will on the sons of men; for these are for corruption and leading astray before my judgment, for great is the wickedness of the sons of men.”* The same will to corrupt the sons of Adam that Satan declares in 1 Adam and Eve 57:9.'),
  -- thread: 1-adam-eve-57-we-will-ask-elohim-to-deliver-us
  ('adam-eve-conflict', '1-adam-eve', 57, 12, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The deliverance Adam asks Elohim for in 1 Adam and Eve 57:12 is the bruising of Satan promised to the seed.'),
  ('adam-eve-conflict', '1-adam-eve', 57, 12, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The Son manifested to destroy the devil''s works is the answer to Adam''s plea for deliverance in 1 Adam and Eve 57:12.'),
  ('adam-eve-conflict', '1-adam-eve', 57, 12, 'canon', 'hebrews', 2, 14, 'free', E'Hebrews 2:14 — *Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same; that through death he might destroy him that had the power of death, that is, the devil;* the deliverance out of Satan''s hands that Adam asks for in 1 Adam and Eve 57:12, wrought through the death of the Seed.'),
  ('adam-eve-conflict', '1-adam-eve', 57, 11, 'canon', 'john', 12, 31, 'free', E'John 12:31 — *Now is the judgment of this world: now shall the prince of this world be cast out.* Adam''s question whether Satan truly became king over them (1 Adam and Eve 57:11) is answered by the casting-out of the prince of this world.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae57_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae57_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-57-hid-in-the-serpent',
       E'I hid myself within the serpent',
       E'Satan stands before Adam and unmasks himself with his own mouth: *"It is I, who hid myself within the serpent, and who spoke to Eve, and who enticed her until she obeyed my command. I am he who sent her, using my deceitful speech, to deceive you, until you both ate of the fruit of the tree and abandoned the command of Elohim (God)"* (1 Adam and Eve 57:2). It ain''t new — this is the same crawling enemy of the third chapter of the beginning: *And the serpent said unto the woman, Ye shall not surely die* (Genesis 3:4), and the woman''s own confession, *The serpent beguiled me, and I did eat* (Genesis 3:13). The Master named the voice behind the scales: *Ye are of your father the devil... He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it* (John 8:44). And the Revelation strips off the last disguise: *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9). The deceiver in the cave is the deceiver in the garden.',
       sv.verse_id, ev.verse_id, 'extras', 65400
  FROM _session253_1ae57_lookup sv, _session253_1ae57_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=57 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-57-i-never-meant-to-keep-it',
       E'I never thought of fulfilling my word',
       E'Adam presses the enemy for the divine nature he was promised in Eden: *"Where is the divine nature you promised to give me? Where is that slick speech of yours that you had with us at first, when we were in the garden?"* (1 Adam and Eve 57:4). Satan answers with the naked truth of every lie: *"Do you think that when I have promised one something that I would actually deliver it to him or fulfil my word? Of course not. For I myself have never even thought of obtaining what I promised"* (1 Adam and Eve 57:5). This is the angel of light exposed — the one who comes only to rob: *And no marvel; for Satan himself is transformed into an angel of light* (2 Corinthians 11:14), the liar of whom it is written, *When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it* (John 8:44). His promise was empty; only the seed of the woman keeps His word, and so the assembly is told, *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 65403
  FROM _session253_1ae57_lookup sv, _session253_1ae57_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=57 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-57-i-am-king-over-you',
       E'Because you obeyed me, I am king over you',
       E'Satan claims a throne over the man who heeded him: *"But now, O Adam, because you fell you are under my rule, and I am king over you; because you have obeyed me and have transgressed against your Elohim (God). Neither will there be any deliverance from my hands until the day promised you by your Elohim (God)"* (1 Adam and Eve 57:7). This is the iron law of obedience that Sha''ul wrote out: *Know ye not, that to whom ye yield yourselves servants to obey, his servants ye are to whom ye obey; whether of sin unto death, or of obedience unto righteousness?* (Romans 6:16). Satan''s reign is real but temporary — the Messiah called him *the prince of this world* and announced his fall: *Now is the judgment of this world: now shall the prince of this world be cast out* (John 12:31). The promised day Satan dreads is the Seed who comes to overthrow the usurper: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 65406
  FROM _session253_1ae57_lookup sv, _session253_1ae57_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=57 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-57-war-and-murder-on-your-seed',
       E'We will multiply war and murder on your descendants',
       E'Here the seed-war is declared aloud on the first day outside the garden: *"Because we do not know the day agreed on with you by your Elohim (God), nor the hour in which you shall be delivered, for that reason we will multiply war and murder on you and your descendants after you. This is our will and our good pleasure, that we may not leave one of the sons of Adam to inherit our orders in heaven"* (1 Adam and Eve 57:8-9). It ain''t new — this is the enmity of *thy seed and her seed* (Genesis 3:15) and the adversary who *as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8). The other restored books carry the same war on Adam''s children: in Jubilees the prince of the spirits begs to keep his host *for these are for corruption and leading astray before my judgment, for great is the wickedness of the sons of men* (Jubilees 10:8). And Satan''s boast that his home is burning fire (57:10) is the very sentence pronounced on him: *Then shall he say also unto them on the left hand, Depart from me, ye cursed, into everlasting fire, prepared for the devil and his angels* (Matthew 25:41).',
       sv.verse_id, ev.verse_id, 'extras', 65409
  FROM _session253_1ae57_lookup sv, _session253_1ae57_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=57 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-57-we-will-ask-elohim-to-deliver-us',
       E'We will ask Elohim to deliver us out of his hands',
       E'Against Satan''s boast of kingship, Adam turns the only direction that breaks the enemy — back to his Maker: *"Hear what he said; that he won''t fulfil any of what he told you in the garden. Did he really then become king over us? But we will ask Elohim (God), who created us, to deliver us out of his hands"* (1 Adam and Eve 57:11-12). The promised deliverance is no idle hope; it is the gospel from the foundation: *For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8), the One who *also himself likewise took part of the same; that through death he might destroy him that had the power of death, that is, the devil* (Hebrews 2:14). And the war-wearied saints are given the same word Adam reached for: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20). Adam''s prayer is the first crying-out of the seed of the woman to the God who keeps His covenant mercy.',
       sv.verse_id, ev.verse_id, 'extras', 65412
  FROM _session253_1ae57_lookup sv, _session253_1ae57_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=11
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=57 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-57-hid-in-the-serpent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die:* the lie Satan now confesses he spoke through the serpent in 1 Adam and Eve 57:2.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae57_lookup sv, _session253_1ae57_lookup tv
 WHERE t.slug='1-adam-eve-57-hid-in-the-serpent'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:13 — *And Yahuah Elohim (the LORD God) said unto the woman, What is this that thou hast done? And the woman said, The serpent beguiled me, and I did eat.* Eve''s confession in the garden is the very deception Satan boasts of having worked in 1 Adam and Eve 57:2.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae57_lookup sv, _session253_1ae57_lookup tv
 WHERE t.slug='1-adam-eve-57-hid-in-the-serpent'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The Messiah names the liar whose deceitful speech enticed Eve in 1 Adam and Eve 57:2.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae57_lookup sv, _session253_1ae57_lookup tv
 WHERE t.slug='1-adam-eve-57-hid-in-the-serpent'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The hideous figure Adam sees in 1 Adam and Eve 57:1 is that old serpent unmasked.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae57_lookup sv, _session253_1ae57_lookup tv
 WHERE t.slug='1-adam-eve-57-hid-in-the-serpent'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-57-i-never-meant-to-keep-it
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The same masquerade that sold Adam a divine nature he never delivered in 1 Adam and Eve 57:5.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae57_lookup sv, _session253_1ae57_lookup tv
 WHERE t.slug='1-adam-eve-57-i-never-meant-to-keep-it'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Satan''s confession that he never meant to keep his promise (1 Adam and Eve 57:5) is the father of lies speaking his own.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae57_lookup sv, _session253_1ae57_lookup tv
 WHERE t.slug='1-adam-eve-57-i-never-meant-to-keep-it'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* The very promise of a divine nature Adam now demands back in 1 Adam and Eve 57:4 was the slick speech of the serpent in the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae57_lookup sv, _session253_1ae57_lookup tv
 WHERE t.slug='1-adam-eve-57-i-never-meant-to-keep-it'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-57-i-am-king-over-you
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 6:16 — *Know ye not, that to whom ye yield yourselves servants to obey, his servants ye are to whom ye obey; whether of sin unto death, or of obedience unto righteousness?* Satan''s claim of kingship rests on the same law — Adam obeyed him, so came under his rule in 1 Adam and Eve 57:7.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae57_lookup sv, _session253_1ae57_lookup tv
 WHERE t.slug='1-adam-eve-57-i-am-king-over-you'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 12:31 — *Now is the judgment of this world: now shall the prince of this world be cast out.* The self-styled king of 1 Adam and Eve 57:7 is the prince whose casting-out the Messiah proclaims.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae57_lookup sv, _session253_1ae57_lookup tv
 WHERE t.slug='1-adam-eve-57-i-am-king-over-you'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The day of deliverance Satan fears in 1 Adam and Eve 57:7 is the Son manifested to destroy his rule.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae57_lookup sv, _session253_1ae57_lookup tv
 WHERE t.slug='1-adam-eve-57-i-am-king-over-you'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s gloating that whosoever takes his counsel falls with him (1 Adam and Eve 57:6) is the enmity the LORD set between the two seeds.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae57_lookup sv, _session253_1ae57_lookup tv
 WHERE t.slug='1-adam-eve-57-i-am-king-over-you'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-57-war-and-murder-on-your-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The war Satan vows on Adam''s descendants in 1 Adam and Eve 57:8 is the seed-war Yahuah Himself declared.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae57_lookup sv, _session253_1ae57_lookup tv
 WHERE t.slug='1-adam-eve-57-war-and-murder-on-your-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* the same adversary multiplying war and murder on the sons of Adam in 1 Adam and Eve 57:8.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae57_lookup sv, _session253_1ae57_lookup tv
 WHERE t.slug='1-adam-eve-57-war-and-murder-on-your-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 25:41 — *Then shall he say also unto them on the left hand, Depart from me, ye cursed, into everlasting fire, prepared for the devil and his angels:* the burning fire Satan calls home in 1 Adam and Eve 57:10 is the everlasting fire prepared for him.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae57_lookup sv, _session253_1ae57_lookup tv
 WHERE t.slug='1-adam-eve-57-war-and-murder-on-your-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 10:8 — *And the chief of the spirits, Mastêmâ, came and said: “Yahuah (God), Creator, let some of them remain before me, and let them hearken to my voice, and do all that I shall say to them; for if some of them are not left to me, I shall not be able to execute the power of my will on the sons of men; for these are for corruption and leading astray before my judgment, for great is the wickedness of the sons of men.”* The same will to corrupt the sons of Adam that Satan declares in 1 Adam and Eve 57:9.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae57_lookup sv, _session253_1ae57_lookup tv
 WHERE t.slug='1-adam-eve-57-war-and-murder-on-your-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-57-we-will-ask-elohim-to-deliver-us
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The deliverance Adam asks Elohim for in 1 Adam and Eve 57:12 is the bruising of Satan promised to the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae57_lookup sv, _session253_1ae57_lookup tv
 WHERE t.slug='1-adam-eve-57-we-will-ask-elohim-to-deliver-us'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The Son manifested to destroy the devil''s works is the answer to Adam''s plea for deliverance in 1 Adam and Eve 57:12.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae57_lookup sv, _session253_1ae57_lookup tv
 WHERE t.slug='1-adam-eve-57-we-will-ask-elohim-to-deliver-us'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 2:14 — *Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same; that through death he might destroy him that had the power of death, that is, the devil;* the deliverance out of Satan''s hands that Adam asks for in 1 Adam and Eve 57:12, wrought through the death of the Seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae57_lookup sv, _session253_1ae57_lookup tv
 WHERE t.slug='1-adam-eve-57-we-will-ask-elohim-to-deliver-us'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 12:31 — *Now is the judgment of this world: now shall the prince of this world be cast out.* Adam''s question whether Satan truly became king over them (1 Adam and Eve 57:11) is answered by the casting-out of the prince of this world.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae57_lookup sv, _session253_1ae57_lookup tv
 WHERE t.slug='1-adam-eve-57-we-will-ask-elohim-to-deliver-us'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=57 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

