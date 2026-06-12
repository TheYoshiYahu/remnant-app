-- ----- fragment: minion_ascensionisaiah_09.sql (session403 ascension-isaiah 9) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci9 (view _session403_asci9_lookup). Sort band base 67700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-9-permitted-by-the-father
  ('ascension-isaiah', 'ascension-isaiah', 9, 5, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Beloved who permits Isaiah''s ascent is the Word who was WITH the Father — distinct in order, yet not a made thing, exactly as Ascension 9:5 names Him ''Yahuah Messiah'' before He is ''Jesus'' in the world.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 5, 'canon', 'hebrews', 1, 2, 'free', E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* The ''Lord Christ'' of 9:5 is the Son the Father speaks through and appoints — begotten and heir, ordered under the One who appointed Him.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 5, 'canon', 'john', 17, 5, 'free', E'John 17:5 — *And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* The hidden name Isaiah ''cannot hear till he has ascended'' is the glory the Son had with the Father before the world — the Formed Son asking the Father for what was already His.'),
  -- thread: ascension-isaiah-9-descent-hidden-from-the-heavens
  ('ascension-isaiah', 'ascension-isaiah', 9, 14, 'canon', '1-corinthians', 2, 8, 'free', E'1 Corinthians 2:8 — *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* Paul says exactly what 9:14 foretells: they ''slay Him not knowing who He is'' — the Lord of glory crucified by a world blind to His descent.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 14, 'canon', 'philippians', 2, 7, 'free', E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* The Son''s likeness is veiled through the heavens (9:15) just as the Formed Son empties Himself into the form of a servant — hidden, not diminished.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 15, 'canon', 'isaiah', 53, 2, 'free', E'Isaiah 53:2 — *For he shall grow up before him as a tender plant, and as a root out of a dry ground: he hath no form nor comeliness; and when we shall see him, there is no beauty that we should desire him.* The descent ''hidden even from the heavens'' lands as Isaiah''s own no-form-nor-comeliness — the prophet himself foretold the disguised coming.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 15, 'canon', 'ephesians', 4, 10, 'free', E'Ephesians 4:9-10 — *(Now that he ascended, what is it but that he also descended first into the lower parts of the earth? He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* The hidden descender of 9:15 is the same One who ascends ''far above all heavens'' — one Person veiled in coming, exalted in returning.'),
  -- thread: ascension-isaiah-9-third-day-and-the-ascent
  ('ascension-isaiah', 'ascension-isaiah', 9, 16, 'canon', 'philippians', 2, 9, 'free', E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The ascent of 9:16 is the Father''s exaltation of the Son who first descended and died — the Formed Son raised by the One above Him, not raising Himself as a co-equal.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 16, 'canon', 'hebrews', 2, 9, 'free', E'Hebrews 2:9 — *But we see Yahusha (Jesus), who was made a little lower than the angels for the suffering of death, crowned with glory and honour; that he by the grace of Elohim (God) should taste death for every man.* Plundering the angel of death (9:16) is the Son who tasted death now crowned — lowered, then crowned, in that order.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 18, 'canon', '1-timothy', 3, 16, 'free', E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* The Son ''received up into glory'' is exactly His ascent into the seventh heaven in 9:18 — manifest in flesh below, received in glory above.'),
  -- thread: ascension-isaiah-9-garments-thrones-crowns-laid-up
  ('ascension-isaiah', 'ascension-isaiah', 9, 8, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The very Enoch Isaiah sees ''in garments of the upper world'' (9:8) is the Enoch Scripture says was translated for pleasing Elohim — it ain''t new.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 10, 'canon', 'revelation', 6, 11, 'free', E'Revelation 6:11 — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* The righteous robed but not yet throned (9:10) match John''s souls given white robes and told to wait until the number is fulfilled.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 24, 'canon', 'revelation', 3, 5, 'free', E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* The garments and crowns ''laid up'' in 9:24 are promised to the overcomer — white raiment kept for those who believe, exactly as 9:26 explains.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 24, 'canon', 'colossians', 1, 5, 'free', E'Colossians 1:5 — *For the hope which is laid up for you in heaven, whereof ye heard before in the word of the truth of the gospel;* Paul uses Isaiah''s own image — the hope ''laid up in heaven'' is the garments, thrones, and crowns Isaiah literally sees laid up in 9:24.'),
  -- thread: ascension-isaiah-9-ordered-worship-father-beloved-spirit
  ('ascension-isaiah', 'ascension-isaiah', 9, 31, 'canon', 'hebrews', 1, 6, 'free', E'Hebrews 1:6 — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* Isaiah is told ''Worship this One'' (9:31) by the Father''s command — the same command Hebrews records: the Father bids the angels worship the firstbegotten Son.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 40, 'canon', 'philippians', 2, 11, 'free', E'Philippians 2:11 — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* The Beloved and the Spirit praising Elohim together (9:40) is the very order Paul guards — the Son confessed Lord but TO the glory of the Father, never co-equal collapse.'),
  ('ascension-isaiah', 'ascension-isaiah', 9, 40, 'canon', 'revelation', 5, 13, 'free', E'Revelation 5:13 — *And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever.* John keeps the same ordered two-fold praise — to Him on the throne AND to the Lamb — that Isaiah sees when the Beloved Himself worships the Great Glory in 9:40.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-9-permitted-by-the-father',
       E'The Beloved who permits the ascent has a Father — the Formed Son, ordered under the One',
       E'Isaiah is forbidden by one and permitted by Another: *And He who permitted thee, this is thy Yahuah Elohim (LORD God), Yahuah (Lord) Messiah (Christ), who will be called ''Jesus'' in the world, but His name thou canst not hear till thou hast ascended out of thy body.* (Ascension of Isaiah 9:5). The Vision names the Beloved outright — He IS the Messiah, Yahusha the Formed Son — yet the whole movement of this chapter keeps Him *ordered under* the Great Glory: He is the One who grants the ascent, but He Himself worships the Most High (9:40). It ain''t new. John opens the same way: the Word who was WITH the Father — distinct, not the Father Himself — and yet not a created thing, *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1). He is the begotten Son the Father speaks through, *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* (Hebrews 1:2), and the glory He re-takes is the glory He had before the world, when He prays *And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* (John 17:5). Not co-equal modalism, not a mere angel — the Formed Son, sent and named.',
       sv.verse_id, ev.verse_id, 'extras', 67700
  FROM _session403_asci9_lookup sv, _session403_asci9_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=9 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-9-descent-hidden-from-the-heavens',
       E'The descent hidden from the heavens — they crucified Him not knowing who He is',
       E'The angel foretells the Beloved''s descent in disguise: *And the god of that world will stretch forth his hand against the Son, and they will crucify Him on a tree, and will slay Him not knowing who He is.* (Ascension of Isaiah 9:14), *And thus His descent, as you will see, will be hidden even from the heavens, so that it will not be known who He is.* (Ascension of Isaiah 9:15). It ain''t new — Paul says the very same: the rulers were blind to the Lord of glory, *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* (1 Corinthians 2:8). The Formed Son emptied His likeness through every heaven so the powers would not know Him — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* (Philippians 2:7) — and so He came with *no form nor comeliness* (Isaiah 53:2). This is descent, not demotion: the One who came down is the One who fills all heavens, *(Now that he ascended, what is it but that he also descended first into the lower parts of the earth? He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* (Ephesians 4:9-10).',
       sv.verse_id, ev.verse_id, 'extras', 67703
  FROM _session403_asci9_lookup sv, _session403_asci9_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=14
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=9 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-9-third-day-and-the-ascent',
       E'He plunders death, rises the third day, and ascends to the seventh heaven',
       E'After the cross the angel shows the rising and return: *And when He hath plundered the angel of death, He will ascend on the third day, and he will remain in that world five hundred and forty-five days.* (Ascension of Isaiah 9:16), and the righteous ascend WITH Him: *And then many of the righteous will ascend with Him, whose spirits do not receive their garments till Yahuah (Lord) Messiah (Christ) ascend and they ascend with Him.* (Ascension of Isaiah 9:17). It ain''t new. Because the Formed Son became obedient unto death, the Father exalts Him — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* (Philippians 2:9) — the same Son made a little lower than the angels and now crowned, *But we see Yahusha (Jesus), who was made a little lower than the angels for the suffering of death, crowned with glory and honour; that he by the grace of Elohim (God) should taste death for every man.* (Hebrews 2:9). The mystery the angels see at last is the gospel itself: *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* (1 Timothy 3:16).',
       sv.verse_id, ev.verse_id, 'extras', 67706
  FROM _session403_asci9_lookup sv, _session403_asci9_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=16
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=9 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-9-garments-thrones-crowns-laid-up',
       E'Garments, thrones, and crowns laid up — Enoch and the righteous in the seventh heaven',
       E'In the seventh heaven Isaiah sees the righteous already clothed but waiting: *And there I saw Enoch and all who were with him, stript of the garments of the flesh, and I saw them in their garments of the upper world, and they were like angels, standing there in great glory.* (Ascension of Isaiah 9:8), *But they sat not on their thrones, nor were their crowns of glory on them.* (Ascension of Isaiah 9:10), and the laid-up rewards: *And I saw there many garments laid up, and many thrones and many crowns.* (Ascension of Isaiah 9:24). It ain''t new. The Enoch Isaiah names is the Enoch translated by faith, *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* (Hebrews 11:5). The white robes and the wait are John''s vision too — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* (Revelation 6:11) — and the crowns laid up are the overcomer''s, *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* (Revelation 3:5). The hope is literally ''laid up,'' *For the hope which is laid up for you in heaven, whereof ye heard before in the word of the truth of the gospel;* (Colossians 1:5).',
       sv.verse_id, ev.verse_id, 'extras', 67709
  FROM _session403_asci9_lookup sv, _session403_asci9_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=9 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-9-ordered-worship-father-beloved-spirit',
       E'The ordered worship — the Beloved and the Spirit worship the Great Glory',
       E'The climax guards the order of worship. First the Beloved is worshipped at the Father''s command: *And thereupon the angel who conducted me said to me: "Worship this One," and I worshipped and praised.* (Ascension of Isaiah 9:31). Then the angel of the Spirit on the left (9:36). But above both stands the Great Glory whom none can behold (9:37) — and the Beloved Himself worships Him: *And I saw how my Lord and the angel of the Spirit worshipped, and they both together praised Elohim (God).* (Ascension of Isaiah 9:40). This is Yoshi''s Formed-Son order exactly: the Son is worshipped at the Father''s word, yet the Son worships the Father. It ain''t new. The Father commands the heavens to bow to the firstbegotten, *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* (Hebrews 1:6); every knee bows at His name *to the glory of Elohim (God) the Father* — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* (Philippians 2:11). John''s throne-room keeps the same two-fold order, blessing to Him on the throne AND to the Lamb, *And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever.* (Revelation 5:13). Not flattened to co-equality, not denied His exaltation — the Beloved exalted by, and bowing to, the One.',
       sv.verse_id, ev.verse_id, 'extras', 67712
  FROM _session403_asci9_lookup sv, _session403_asci9_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=31
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=9 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-9-permitted-by-the-father
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Beloved who permits Isaiah''s ascent is the Word who was WITH the Father — distinct in order, yet not a made thing, exactly as Ascension 9:5 names Him ''Yahuah Messiah'' before He is ''Jesus'' in the world.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-permitted-by-the-father'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* The ''Lord Christ'' of 9:5 is the Son the Father speaks through and appoints — begotten and heir, ordered under the One who appointed Him.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-permitted-by-the-father'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 17:5 — *And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* The hidden name Isaiah ''cannot hear till he has ascended'' is the glory the Son had with the Father before the world — the Formed Son asking the Father for what was already His.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-permitted-by-the-father'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-9-descent-hidden-from-the-heavens
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 2:8 — *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* Paul says exactly what 9:14 foretells: they ''slay Him not knowing who He is'' — the Lord of glory crucified by a world blind to His descent.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-descent-hidden-from-the-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* The Son''s likeness is veiled through the heavens (9:15) just as the Formed Son empties Himself into the form of a servant — hidden, not diminished.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-descent-hidden-from-the-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:2 — *For he shall grow up before him as a tender plant, and as a root out of a dry ground: he hath no form nor comeliness; and when we shall see him, there is no beauty that we should desire him.* The descent ''hidden even from the heavens'' lands as Isaiah''s own no-form-nor-comeliness — the prophet himself foretold the disguised coming.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-descent-hidden-from-the-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 4:9-10 — *(Now that he ascended, what is it but that he also descended first into the lower parts of the earth? He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* The hidden descender of 9:15 is the same One who ascends ''far above all heavens'' — one Person veiled in coming, exalted in returning.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-descent-hidden-from-the-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-9-third-day-and-the-ascent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The ascent of 9:16 is the Father''s exaltation of the Son who first descended and died — the Formed Son raised by the One above Him, not raising Himself as a co-equal.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-third-day-and-the-ascent'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 2:9 — *But we see Yahusha (Jesus), who was made a little lower than the angels for the suffering of death, crowned with glory and honour; that he by the grace of Elohim (God) should taste death for every man.* Plundering the angel of death (9:16) is the Son who tasted death now crowned — lowered, then crowned, in that order.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-third-day-and-the-ascent'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* The Son ''received up into glory'' is exactly His ascent into the seventh heaven in 9:18 — manifest in flesh below, received in glory above.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-third-day-and-the-ascent'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-9-garments-thrones-crowns-laid-up
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The very Enoch Isaiah sees ''in garments of the upper world'' (9:8) is the Enoch Scripture says was translated for pleasing Elohim — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-garments-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 6:11 — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* The righteous robed but not yet throned (9:10) match John''s souls given white robes and told to wait until the number is fulfilled.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-garments-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* The garments and crowns ''laid up'' in 9:24 are promised to the overcomer — white raiment kept for those who believe, exactly as 9:26 explains.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-garments-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 1:5 — *For the hope which is laid up for you in heaven, whereof ye heard before in the word of the truth of the gospel;* Paul uses Isaiah''s own image — the hope ''laid up in heaven'' is the garments, thrones, and crowns Isaiah literally sees laid up in 9:24.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-garments-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-9-ordered-worship-father-beloved-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 1:6 — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* Isaiah is told ''Worship this One'' (9:31) by the Father''s command — the same command Hebrews records: the Father bids the angels worship the firstbegotten Son.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-ordered-worship-father-beloved-spirit'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:11 — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* The Beloved and the Spirit praising Elohim together (9:40) is the very order Paul guards — the Son confessed Lord but TO the glory of the Father, never co-equal collapse.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-ordered-worship-father-beloved-spirit'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 5:13 — *And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever.* John keeps the same ordered two-fold praise — to Him on the throne AND to the Lamb — that Isaiah sees when the Beloved Himself worships the Great Glory in 9:40.'
  FROM cross_reference_threads t, cross_references x, _session403_asci9_lookup sv, _session403_asci9_lookup tv
 WHERE t.slug='ascension-isaiah-9-ordered-worship-father-beloved-spirit'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=9 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

