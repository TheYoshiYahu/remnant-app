-- ----- fragment: minion_1adameve_49.sql (session253 1-adam-eve 49) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch49. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae49 (view _session253_1ae49_lookup). Sort band base 65200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae49_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-49-satan-cast-down-the-rock
  ('adam-eve-conflict', '1-adam-eve', 49, 6, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The rock hurled down to crush Adam and Eve is the first blow of the enmity Yahuah set at the garden gate, the serpent striking to destroy the seed-line before it could fill the earth.'),
  ('adam-eve-conflict', '1-adam-eve', 49, 6, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The Word names Satan a murderer who would kill Adam under the rock, the very charge the Messiah lays — a murderer from the beginning, here caught in the act on the first day outside Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 49, 6, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Satan who threw down the rock to devour Adam and Eve is the same prowling adversary the apostle warns against; the assault outside Eden is the pattern of the war that never stopped.'),
  ('adam-eve-conflict', '1-adam-eve', 49, 6, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The one who hurled the stone to crush the seed will himself be crushed underfoot — the bruised head of Genesis 3:15 answered at last in the seed he sought to bury here.'),
  -- thread: 1-adam-eve-49-satan-promised-the-godhead
  ('adam-eve-conflict', '1-adam-eve', 49, 6, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The Godhead and majesty Satan promised Adam is the same dazzling counterfeit, glory borrowed to mask a murderer''s intent under the falling rock.'),
  ('adam-eve-conflict', '1-adam-eve', 49, 6, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The works of the devil that buried Adam under the stone are the very works the Son was manifested to destroy, foretold in this same chapter''s promise of the third-day rising.'),
  -- thread: 1-adam-eve-49-laid-in-a-rock-three-days
  ('adam-eve-conflict', '1-adam-eve', 49, 8, 'canon', 'matthew', 27, 60, 'free', E'Matthew 27:60 — *And laid it in his own new tomb, which he had hewn out in the rock: and he rolled a great stone to the door of the sepulchre, and departed.* The Word''s own words — laid in a rock, a great stone rolled over — are fulfilled to the letter at Joseph''s tomb hewn out of the rock.'),
  ('adam-eve-conflict', '1-adam-eve', 49, 8, 'canon', 'matthew', 27, 66, 'free', E'Matthew 27:66 — *So they went, and made the sepulchre sure, sealing the stone, and setting a watch.* The sealing of the large stone foretold to Adam is fulfilled when the rulers seal the stone over the tomb, the deceiver''s hand again sealing the seed inside the rock.'),
  ('adam-eve-conflict', '1-adam-eve', 49, 8, 'canon', 'matthew', 12, 40, 'free', E'Matthew 12:40 — *For as Jonas was three days and three nights in the whale''s belly; so shall the Son of Adam be three days and three nights in the heart of the earth.* The three days and three nights within the rock spoken to Adam is the very sign the Messiah gives of His burial in the heart of the earth.'),
  ('adam-eve-conflict', '1-adam-eve', 49, 8, 'canon', 'jonah', 1, 17, 'free', E'Jonah 1:17 — *Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights.* The measure of three days and three nights given to Adam under the rock is the same Yahuah appointed in Jonah, the prophetic span of the buried-and-risen one.'),
  -- thread: 1-adam-eve-49-on-the-third-day-i-shall-rise
  ('adam-eve-conflict', '1-adam-eve', 49, 9, 'canon', '1-corinthians', 15, 4, 'free', E'1 Corinthians 15:4 — *And that he was buried, and that he rose again the third day according to the scriptures:* The buried-and-third-day-risen gospel Paul calls first of all is the very word spoken to Adam under the rock, rising on the third day according to the scriptures written from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 49, 9, 'canon', '1-corinthians', 15, 20, 'free', E'1 Corinthians 15:20 — *But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept.* The rising that is salvation to Adam and his descendants makes the Messiah the firstfruits, the seed raised first so that the whole seed-line may follow.'),
  ('adam-eve-conflict', '1-adam-eve', 49, 9, 'canon', 'matthew', 28, 6, 'free', E'Matthew 28:6 — *He is not here: for he is risen, as he said. Come, see the place where Yahuah (Lord) lay.* The third-day rising foretold to Adam is announced at the open rock — risen as He said, the place where He lay now empty, salvation made sure for Adam''s descendants.'),
  -- thread: 1-adam-eve-49-the-word-of-elohim-came
  ('adam-eve-conflict', '1-adam-eve', 49, 1, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes and speaks to Adam is the eternal Logos, who was in the beginning and was Elohim — no mere voice but the Saviour foretelling His own coming.'),
  ('adam-eve-conflict', '1-adam-eve', 49, 8, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who promises Adam My coming on earth is the same Word made flesh, the incarnation of the one now speaking comfort over the rock.'),
  ('adam-eve-conflict', '1-adam-eve', 49, 1, 'canon', 'hebrews', 1, 1, 'free', E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The coming of the Word to Adam is the first of those sundry times and divers manners in which Elohim spake to the fathers, the speaking that culminates in the Son.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae49_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae49_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-49-satan-cast-down-the-rock',
       E'Satan threw down the rock to kill the seed',
       E'When the dome of rock had closed over Adam and Eve, the Word unveils whose hand had loosed it: *It came from Satan, who had promised you the Godhead and majesty. It is he who threw down this rock to kill you under it, and Eve with you, and thus to prevent you from living on the earth* (1 Adam and Eve 49:6). It ain''t new — this is the serpent''s first strike at the seed of the woman, the same war Yahuah declared at the gate of the garden: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The murderer is unmasked exactly as the Master named him: *He was a murderer from the beginning, and abode not in the truth, because there is no truth in him* (John 8:44), the adversary who *as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8). Yet the bruised heel crushes the head: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 65200
  FROM _session253_1ae49_lookup sv, _session253_1ae49_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=49 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-49-satan-promised-the-godhead',
       E'Who promised you the Godhead — the deceiver unmasked',
       E'The Word strips the disguise from the tempter: *It came from Satan, who had promised you the Godhead and majesty* (1 Adam and Eve 49:6). The serpent who whispered *ye shall be as gods* still trades in the same counterfeit majesty, for *Satan himself is transformed into an angel of light* (2 Corinthians 11:14). His promises are murder dressed as glory, the lie of *a liar, and the father of it* (John 8:44) — yet the Son of Elohim was manifested for precisely this end: *that he might destroy the works of the devil* (1 John 3:8). The false godhead he offered Adam is undone by the true Word who now stands speaking mercy over him.',
       sv.verse_id, ev.verse_id, 'extras', 65203
  FROM _session253_1ae49_lookup sv, _session253_1ae49_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=49 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-49-laid-in-a-rock-three-days',
       E'Laid in a rock, sealed with a stone, three days and three nights',
       E'Here the dome of rock becomes a prophecy of the tomb. The Word reads His own passion out of Adam''s affliction: *And this sign, O Adam, will happen to Me at My coming on earth: Satan will raise the people of the Yahudim (Jews) to put Me to death; and they will lay Me in a rock, and seal a large stone over Me, and I shall remain within that rock three days and three nights* (1 Adam and Eve 49:8). It ain''t new — the sign of the sealed rock is written into the very first days outside Eden. So it came to pass: Joseph *laid it in his own new tomb, which he had hewn out in the rock: and he rolled a great stone to the door of the sepulchre, and departed* (Matthew 27:60), and the watchers went *sealing the stone, and setting a watch* (Matthew 27:66). The measure was given long before by the prophet''s three days: *so shall the Son of Adam be three days and three nights in the heart of the earth* (Matthew 12:40), even as *Jonah was in the belly of the fish three days and three nights* (Jonah 1:17).',
       sv.verse_id, ev.verse_id, 'extras', 65206
  FROM _session253_1ae49_lookup sv, _session253_1ae49_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=49 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-49-on-the-third-day-i-shall-rise',
       E'On the third day I shall rise again — salvation to Adam''s seed',
       E'The rock of death gives way to resurrection and the promise of the seed redeemed: *But on the third day I shall rise again, and it shall be salvation to you, O Adam, and to your descendants, to believe in Me* (1 Adam and Eve 49:9). The gospel is preached to the first man on the first days outside Eden — it ain''t new. Paul delivers the same as first of all: *how that Messiah (Christ) died for our sins according to the scriptures; And that he was buried, and that he rose again the third day according to the scriptures* (1 Corinthians 15:3-4), the risen one become *the firstfruits of them that slept* (1 Corinthians 15:20). At the empty rock the angel proclaims it: *He is not here: for he is risen, as he said. Come, see the place where Yahuah (Lord) lay* (Matthew 28:6). The third-day rising promised over Adam is salvation reaching back to cover the very father of the seed.',
       sv.verse_id, ev.verse_id, 'extras', 65209
  FROM _session253_1ae49_lookup sv, _session253_1ae49_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=49 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-49-the-word-of-elohim-came',
       E'The Word of Elohim came and spoke His own coming',
       E'It is the Word Himself who comes to Adam, comforts him, and unfolds the whole counsel of His incarnation, death, and rising: *Then the Word of Elohim (God) came and said* (1 Adam and Eve 49:1), and *Elohim (God) withdrew His Word from Adam* (1 Adam and Eve 49:10). This is the Logos who would be made flesh: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), and *the Word was made flesh, and dwelt among us* (John 1:14). The same who spoke to Adam in the first days is He who *at sundry times and in divers manners spake in time past unto the fathers by the prophets* (Hebrews 1:1) and now speaks of His own coming — the Saviour foretold from the first rock to the empty tomb.',
       sv.verse_id, ev.verse_id, 'extras', 65212
  FROM _session253_1ae49_lookup sv, _session253_1ae49_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=49 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-49-satan-cast-down-the-rock
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The rock hurled down to crush Adam and Eve is the first blow of the enmity Yahuah set at the garden gate, the serpent striking to destroy the seed-line before it could fill the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae49_lookup sv, _session253_1ae49_lookup tv
 WHERE t.slug='1-adam-eve-49-satan-cast-down-the-rock'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The Word names Satan a murderer who would kill Adam under the rock, the very charge the Messiah lays — a murderer from the beginning, here caught in the act on the first day outside Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae49_lookup sv, _session253_1ae49_lookup tv
 WHERE t.slug='1-adam-eve-49-satan-cast-down-the-rock'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Satan who threw down the rock to devour Adam and Eve is the same prowling adversary the apostle warns against; the assault outside Eden is the pattern of the war that never stopped.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae49_lookup sv, _session253_1ae49_lookup tv
 WHERE t.slug='1-adam-eve-49-satan-cast-down-the-rock'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The one who hurled the stone to crush the seed will himself be crushed underfoot — the bruised head of Genesis 3:15 answered at last in the seed he sought to bury here.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae49_lookup sv, _session253_1ae49_lookup tv
 WHERE t.slug='1-adam-eve-49-satan-cast-down-the-rock'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-49-satan-promised-the-godhead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The Godhead and majesty Satan promised Adam is the same dazzling counterfeit, glory borrowed to mask a murderer''s intent under the falling rock.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae49_lookup sv, _session253_1ae49_lookup tv
 WHERE t.slug='1-adam-eve-49-satan-promised-the-godhead'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The works of the devil that buried Adam under the stone are the very works the Son was manifested to destroy, foretold in this same chapter''s promise of the third-day rising.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae49_lookup sv, _session253_1ae49_lookup tv
 WHERE t.slug='1-adam-eve-49-satan-promised-the-godhead'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-49-laid-in-a-rock-three-days
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 27:60 — *And laid it in his own new tomb, which he had hewn out in the rock: and he rolled a great stone to the door of the sepulchre, and departed.* The Word''s own words — laid in a rock, a great stone rolled over — are fulfilled to the letter at Joseph''s tomb hewn out of the rock.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae49_lookup sv, _session253_1ae49_lookup tv
 WHERE t.slug='1-adam-eve-49-laid-in-a-rock-three-days'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=60
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 27:66 — *So they went, and made the sepulchre sure, sealing the stone, and setting a watch.* The sealing of the large stone foretold to Adam is fulfilled when the rulers seal the stone over the tomb, the deceiver''s hand again sealing the seed inside the rock.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae49_lookup sv, _session253_1ae49_lookup tv
 WHERE t.slug='1-adam-eve-49-laid-in-a-rock-three-days'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=66
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 12:40 — *For as Jonas was three days and three nights in the whale''s belly; so shall the Son of Adam be three days and three nights in the heart of the earth.* The three days and three nights within the rock spoken to Adam is the very sign the Messiah gives of His burial in the heart of the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae49_lookup sv, _session253_1ae49_lookup tv
 WHERE t.slug='1-adam-eve-49-laid-in-a-rock-three-days'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jonah 1:17 — *Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights.* The measure of three days and three nights given to Adam under the rock is the same Yahuah appointed in Jonah, the prophetic span of the buried-and-risen one.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae49_lookup sv, _session253_1ae49_lookup tv
 WHERE t.slug='1-adam-eve-49-laid-in-a-rock-three-days'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-49-on-the-third-day-i-shall-rise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 15:4 — *And that he was buried, and that he rose again the third day according to the scriptures:* The buried-and-third-day-risen gospel Paul calls first of all is the very word spoken to Adam under the rock, rising on the third day according to the scriptures written from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae49_lookup sv, _session253_1ae49_lookup tv
 WHERE t.slug='1-adam-eve-49-on-the-third-day-i-shall-rise'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:20 — *But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept.* The rising that is salvation to Adam and his descendants makes the Messiah the firstfruits, the seed raised first so that the whole seed-line may follow.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae49_lookup sv, _session253_1ae49_lookup tv
 WHERE t.slug='1-adam-eve-49-on-the-third-day-i-shall-rise'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 28:6 — *He is not here: for he is risen, as he said. Come, see the place where Yahuah (Lord) lay.* The third-day rising foretold to Adam is announced at the open rock — risen as He said, the place where He lay now empty, salvation made sure for Adam''s descendants.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae49_lookup sv, _session253_1ae49_lookup tv
 WHERE t.slug='1-adam-eve-49-on-the-third-day-i-shall-rise'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=28 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-49-the-word-of-elohim-came
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes and speaks to Adam is the eternal Logos, who was in the beginning and was Elohim — no mere voice but the Saviour foretelling His own coming.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae49_lookup sv, _session253_1ae49_lookup tv
 WHERE t.slug='1-adam-eve-49-the-word-of-elohim-came'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who promises Adam My coming on earth is the same Word made flesh, the incarnation of the one now speaking comfort over the rock.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae49_lookup sv, _session253_1ae49_lookup tv
 WHERE t.slug='1-adam-eve-49-the-word-of-elohim-came'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The coming of the Word to Adam is the first of those sundry times and divers manners in which Elohim spake to the fathers, the speaking that culminates in the Son.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae49_lookup sv, _session253_1ae49_lookup tv
 WHERE t.slug='1-adam-eve-49-the-word-of-elohim-came'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=49 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

