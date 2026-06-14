-- ----- fragment: minion_ephesians_03.sql (S230 Ephesians 3) -----
-- =====================================================================
-- S230 minion — EPHESIANS 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: EPHESIANS 3 (21 verses) — the mystery made known / the Gentiles
--   fellowheirs and of the same body / the manifold wisdom of Elohim / rooted
--   and grounded in love.
-- Tag: ep03 (temp view _s230_ep03_lookup).
-- Sort band: floor 7450, step 3 (7450, 7453, 7456 used; under 7475).
-- Source is ALWAYS the canon Ephesians verse; targets span Tanakh + extra-
--   canonical + NT, woven. Tiers per-row: canon target (Tanakh + NT) = 'free';
--   extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: this chapter is allusive and pastoral. The load-bearing
--   line is 3:6 — *That the Gentiles should be fellowheirs, and of the same
--   body, and partakers of his promise in Messiah (Christ) by the gospel* — the
--   nations brought INTO the one body, the commonwealth of Yashar'el (Israel),
--   the olive tree of Romans 11, NOT a new people replacing Israel. The
--   "mystery hid from ages now revealed" (3:3-9) is the regathering made known,
--   the same promise to Abraham (Genesis 12:3, 22:18 — in thy seed shall all
--   nations be blessed) opened to the grafted-in seed. "None warranted" is
--   recorded honestly for the pastoral blocks with no genuine root.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--   v.1-9   the mystery made known: Gentiles fellowheirs of the same body
--           Tanakh: Genesis 12:3 (in thee shall all families of the earth be
--                   blessed), Genesis 22:18 (in thy seed shall all the nations
--                   of the earth be blessed) — the seed-promise the mystery
--                   opens to the nations
--           Extras: none warranted (the mystery-of-wisdom extras weight carried
--                   at v.10 / Wisdom 7)
--           NT: Romans 11:17,25 (the wild olive graffed in; the fulness of the
--               Gentiles, the mystery), Colossians 1:26-27 (the mystery hid
--               from ages, made known among the Gentiles, Messiah in you)
--   v.10-11 the manifold wisdom of Elohim made known by the church
--           Tanakh: none warranted (the depth-of-wisdom doxology root is NT,
--                   Romans 11:33)
--           Extras: Wisdom of Solomon 7:22 (in her is an understanding spirit
--                   holy, one only, manifold) — the manifold wisdom re-spoken
--           NT: Romans 11:33 (O the depth of the riches both of the wisdom and
--               knowledge of Elohim), Colossians 2:2-3 (the mystery of Elohim,
--               in whom are hid all the treasures of wisdom and knowledge)
--   v.12-13 boldness and access with confidence; faint not at my tribulations
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--           (pastoral; access-by-faith carried in prose, not a load-bearing thread)
--   v.14-15 the Father of whom the whole family in heaven and earth is named
--           Tanakh: none warranted (allusive; the one-Father weight belongs to
--                   ch4's Shema thread, not forced here)
--           Extras: none warranted   NT: none warranted
--   v.16-19 strengthened in the inner man; Messiah dwell in your hearts; rooted
--           and grounded in love; the breadth, length, depth, height
--           Tanakh: Jeremiah 17:7-8 (blessed is the man that trusteth in Yahuah
--                   ... as a tree planted by the waters, and that spreadeth out
--                   her roots by the river)
--           Extras: none warranted
--           NT: Colossians 2:6-7 (rooted and built up in him, and stablished
--               in the faith)
--   v.20-21 the doxology: glory in the church throughout all ages
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--           (doxology; folded into the rooted-and-grounded thread's close in prose)
--
-- THREADS (slug -> target libraries):
--   7450 ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12  (Tanakh + NT)
--   7453 ephesians-3-the-manifold-wisdom-of-elohim-made-known-by-the-church-wisdom-of-solomon-7    (Tanakh-none + Extras + NT)
--   7456 ephesians-3-rooted-and-grounded-in-love-a-tree-planted-by-the-waters-jeremiah-17          (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s230_ep03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12
  ('canon', 'ephesians', 3, 6, 'canon', 'genesis', 12, 3, 'free', E'*And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed.* (Genesis 12:3). The mystery Paul unveils is no new thing but the promise sworn to Abram: *in thee shall all families of the earth be blessed.* When he writes *That the Gentiles should be fellowheirs, and of the same body, and partakers of his promise in Messiah (Christ) by the gospel* (Ephesians 3:6), the nations are not made a separate people but brought INTO the families blessed in Abraham — *partakers of his promise,* heirs of the covenant already given. The blessing of all families is the gathering of the nations into the one commonwealth, the promise opened, not annulled.'),
  ('canon', 'ephesians', 3, 6, 'canon', 'genesis', 22, 18, 'free', E'*And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice.* (Genesis 22:18). On Moriah Yahuah (LORD) swore the promise through the seed: *in thy seed shall all the nations of the earth be blessed.* Paul names this the mystery now made known — *the Gentiles should be fellowheirs, and of the same body, and partakers of his promise in Messiah (Christ)* (Ephesians 3:6). The seed in whom all nations are blessed is Messiah (Christ); the nations made *fellowheirs* are the families gathered into Abraham''s blessing through him, INTO the body, not in place of it.'),
  ('canon', 'ephesians', 3, 6, 'canon', 'romans', 11, 17, 'free', E'*And if some of the branches be broken off, and thou, being a wild olive tree, wert graffed in among them, and with them partakest of the root and fatness of the olive tree;* (Romans 11:17). Paul''s own figure for what he calls the mystery: the nations are *a wild olive tree* graffed *in among* the natural branches, made to *partake of the root and fatness of the olive tree.* This is exactly what *fellowheirs, and of the same body, and partakers of his promise* (Ephesians 3:6) means — the Gentiles grafted INTO the one tree, sharing the one root, never a second tree planted beside it. The mystery is the regathering of the olive tree, not its replacement.'),
  ('canon', 'ephesians', 3, 6, 'canon', 'romans', 11, 25, 'free', E'*For I would not, brethren, that ye should be ignorant of this mystery, lest ye should be wise in your own conceits; that blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in.* (Romans 11:25). Paul names the very same secret a *mystery* in both letters: here, *the fulness of the Gentiles* coming in while a partial blindness rests on Yashar''el (Israel) until *all Yashar''el (Israel) shall be saved.* In Ephesians it is *the mystery... That the Gentiles should be fellowheirs, and of the same body* (Ephesians 3:6). One mystery, one in-gathering: the nations brought in, and Yashar''el (Israel) not cast away but received — the two made one people in the one body.'),
  ('canon', 'ephesians', 3, 5, 'canon', 'colossians', 1, 26, 'free', E'*Even the mystery which hath been hid from ages and from generations, but now is made manifest to his saints:* (Colossians 1:26). The twin letter speaks Ephesians'' word almost verbatim: the mystery *hid from ages and from generations, but now is made manifest.* Paul writes that it *in other ages was not made known unto the sons of men, as it is now revealed unto his holy apostles and prophets by the Spirit* (Ephesians 3:5). The same hidden-then-revealed secret stands behind both — the long-kept counsel of Elohim (God) now unveiled to his gathered people.'),
  ('canon', 'ephesians', 3, 6, 'canon', 'colossians', 1, 27, 'free', E'*To whom Elohim (God) would make known what is the riches of the glory of this mystery among the Gentiles; which is Messiah (Christ) in you, the hope of glory:* (Colossians 1:27). Colossians spells out the content of the mystery: *the riches of the glory of this mystery among the Gentiles; which is Messiah (Christ) in you.* Ephesians names the same — *the Gentiles should be fellowheirs, and of the same body, and partakers of his promise in Messiah (Christ)* (Ephesians 3:6). The nations are not given a lesser portion but Messiah (Christ) himself dwelling among them, the whole hope of glory, as members of the one body.'),
  -- thread: ephesians-3-the-manifold-wisdom-of-elohim-made-known-by-the-church-wisdom-of-solomon-7
  ('canon', 'ephesians', 3, 10, 'apocrypha', 'the-wisdom-of-solomon', 7, 22, 'extras', E'*For wisdom, which is the worker of all things, taught me: for in her is an understanding spirit holy, one only, manifold, subtil, lively, clear, undefiled, plain, not subject to hurt, loving the thing that is good quick, which cannot be letted, ready to do good,* (Wisdom of Solomon 7:22). The restored library already named the wisdom of Yahuah (God) *manifold* — *in her is an understanding spirit holy, one only, manifold.* Paul says it is *to the intent that now unto the principalities and powers in heavenly places might be known by the church the manifold wisdom of Elohim (God)* (Ephesians 3:10). The one wisdom that is the worker of all things, of many facets, is now displayed through the gathered assembly before the powers of the heavenlies — the same manifold wisdom, unveiled in the regathering.'),
  ('canon', 'ephesians', 3, 10, 'canon', 'romans', 11, 33, 'free', E'*O the depth of the riches both of the wisdom and knowledge of Elohim (God)! how unsearchable are his judgments, and his ways past finding out!* (Romans 11:33). Paul closes the olive-tree mystery with this very cry: *the depth of the riches both of the wisdom and knowledge of Elohim (God).* It is the wisdom Ephesians says is now *known by the church the manifold wisdom of Elohim (God)* (Ephesians 3:10). The unsearchable wisdom that ordered the in-gathering of the nations and the receiving of Yashar''el (Israel) is the manifold wisdom the assembly now puts on display — one wisdom, depth past finding out, made known through the gathered people.'),
  ('canon', 'ephesians', 3, 9, 'canon', 'colossians', 2, 2, 'free', E'*That their hearts might be comforted, being knit together in love, and unto all riches of the full assurance of understanding, to the acknowledgement of the mystery of Elohim (God), and of the Father, and of Messiah (Christ);* (Colossians 2:2). The twin letter joins the same words Ephesians joins — *the mystery of Elohim (God),* hearts *knit together in love* (the rooted-and-grounded love of the next thread). Paul''s charge *to make all men see what is the fellowship of the mystery, which from the beginning of the world hath been hid in Elohim (God)* (Ephesians 3:9) is the same unveiling: the hidden counsel of Elohim (God), now acknowledged by the gathered.'),
  ('canon', 'ephesians', 3, 10, 'canon', 'colossians', 2, 3, 'free', E'*In whom are hid all the treasures of wisdom and knowledge.* (Colossians 2:3). In Messiah (Christ), says the twin letter, *are hid all the treasures of wisdom and knowledge* — and Ephesians says that *manifold wisdom of Elohim (God)* (Ephesians 3:10) is now *known by the church.* The treasures hidden in Messiah (Christ) are the treasures the assembly displays before the principalities and powers; the wisdom kept secret from ages is the wisdom now made known through the gathered body.'),
  -- thread: ephesians-3-rooted-and-grounded-in-love-a-tree-planted-by-the-waters-jeremiah-17
  ('canon', 'ephesians', 3, 17, 'canon', 'jeremiah', 17, 7, 'free', E'*Blessed is the man that trusteth in Yahuah (LORD), and whose hope Yahuah (LORD) is.* (Jeremiah 17:7). Jeremiah''s blessing falls on the one whose trust and hope are fixed in Yahuah (LORD) — the very posture Paul prays for: *That Messiah (Christ) may dwell in your hearts by faith; that ye, being rooted and grounded in love* (Ephesians 3:17). The man who trusts in Yahuah (LORD) is the man rooted in him; the faith by which Messiah (Christ) dwells in the heart is the trust on which Jeremiah pronounces the blessing.'),
  ('canon', 'ephesians', 3, 17, 'canon', 'jeremiah', 17, 8, 'free', E'*For he shall be as a tree planted by the waters, and that spreadeth out her roots by the river, and shall not see when heat cometh, but her leaf shall be green; and shall not be careful in the year of drought, neither shall cease from yielding fruit.* (Jeremiah 17:8). The one who trusts in Yahuah (LORD) is *as a tree planted by the waters, and that spreadeth out her roots by the river* — the very image Paul reaches for: *being rooted and grounded in love* (Ephesians 3:17). The roots driven down to the river that never fails in drought are the roots driven down into the love of Messiah (Christ), which passeth knowledge; the rooted tree bears its leaf green and its fruit unceasing because it draws from the living water.'),
  ('canon', 'ephesians', 3, 17, 'canon', 'colossians', 2, 7, 'free', E'*Rooted and built up in him, and stablished in the faith, as ye have been taught, abounding therein with thanksgiving.* (Colossians 2:7). The twin letter prays the same prayer in the same words: the saints *rooted and built up in him, and stablished in the faith.* Ephesians has *rooted and grounded in love* (Ephesians 3:17). The root and the foundation are one figure in both — the believer planted and built upon Messiah (Christ), grounded in love, that the whole household may stand and grow.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s230_ep03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s230_ep03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12',
       E'The mystery made known: the Gentiles fellowheirs of the same body (Genesis 12, 22; Romans 11)',
       E'Paul calls it the mystery — *How that by revelation he made known unto me the mystery* (Ephesians 3:3), the thing *which in other ages was not made known unto the sons of men, as it is now revealed unto his holy apostles and prophets by the Spirit* (Ephesians 3:5). But its content is no new institution. It is this: *That the Gentiles should be fellowheirs, and of the same body, and partakers of his promise in Messiah (Christ) by the gospel* (Ephesians 3:6) — the nations brought INTO the one body and the one promise, not made a people apart. And the promise they are made partakers of is the oldest in the covenant story: Yahuah (LORD) swore to Abram, *in thee shall all families of the earth be blessed* (Genesis 12:3), and on Moriah, *in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* (Genesis 22:18). The seed in whom all nations are blessed is Messiah (Christ); the *fellowheirs* are the families gathered into Abraham''s blessing through him. Paul''s own figure for this is the olive tree: the nations are *a wild olive tree* graffed *in among* the natural branches, made *with them* to partake *of the root and fatness of the olive tree* (Romans 11:17) — grafted IN, sharing the one root, never a second tree planted beside it. He names the very same secret a mystery there too: *that blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25), after which *all Yashar''el (Israel) shall be saved.* One mystery, one in-gathering — the nations brought in, and Yashar''el (Israel) not cast away but received. The twin letter says it almost verbatim: the mystery *hid from ages and from generations, but now is made manifest to his saints* (Colossians 1:26), *the riches of the glory of this mystery among the Gentiles; which is Messiah (Christ) in you, the hope of glory* (Colossians 1:27). The nations are given no lesser portion — Messiah (Christ) himself dwells among them, members of the one body. The mystery is the regathering of the one olive tree, the commonwealth of Yashar''el (Israel) opened, NOT the Church replacing Israel.',
       sv.verse_id, ev.verse_id, 'free', 7450
  FROM _s230_ep03_lookup sv, _s230_ep03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-3-the-manifold-wisdom-of-elohim-made-known-by-the-church-wisdom-of-solomon-7',
       E'The manifold wisdom of Elohim made known by the church (Wisdom of Solomon 7; Romans 11)',
       E'Paul lifts the eye from the assembly to the heavenlies: the mystery is unveiled *to the intent that now unto the principalities and powers in heavenly places might be known by the church the manifold wisdom of Elohim (God)* (Ephesians 3:10), *according to the eternal purpose which he purposed in HaMashiach Yahusha (Christ Jesus) our Lord* (Ephesians 3:11). The gathered people are the theatre in which the wisdom of Elohim (God) is displayed before the powers. And that wisdom is called *manifold* — of many facets, one and yet entering every age — exactly as the restored library named it: *in her is an understanding spirit holy, one only, manifold, subtil, lively, clear, undefiled* (Wisdom of Solomon 7:22), *the worker of all things.* The one wisdom of many facets is now put on show through the assembly. Paul closes the olive-tree mystery with the same wonder: *O the depth of the riches both of the wisdom and knowledge of Elohim (God)! how unsearchable are his judgments, and his ways past finding out!* (Romans 11:33) — the unsearchable wisdom that ordered the in-gathering of the nations and the receiving of Yashar''el (Israel). The twin letter joins the same threads: the *mystery of Elohim (God),* in Messiah (Christ) *are hid all the treasures of wisdom and knowledge* (Colossians 2:2-3). The wisdom kept secret from ages, hidden in Messiah (Christ), is the manifold wisdom the gathered body now makes known — to men, and before the principalities and powers of the heavenlies.',
       sv.verse_id, ev.verse_id, 'extras', 7453
  FROM _s230_ep03_lookup sv, _s230_ep03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-3-rooted-and-grounded-in-love-a-tree-planted-by-the-waters-jeremiah-17',
       E'Rooted and grounded in love: a tree planted by the waters (Jeremiah 17; Colossians 2)',
       E'Paul bows his knees and prays that the saints would *be strengthened with might by his Spirit in the inner man; That Messiah (Christ) may dwell in your hearts by faith; that ye, being rooted and grounded in love* (Ephesians 3:16-17), *may be able to comprehend with all saints what is the breadth, and length, and depth, and height; And to know the love of Messiah (Christ), which passeth knowledge* (Ephesians 3:18-19). The figure is the tree driven down to the living water. Jeremiah pronounced the blessing on the one whose trust is in Yahuah (LORD): *Blessed is the man that trusteth in Yahuah (LORD), and whose hope Yahuah (LORD) is. For he shall be as a tree planted by the waters, and that spreadeth out her roots by the river, and shall not see when heat cometh, but her leaf shall be green; and shall not be careful in the year of drought, neither shall cease from yielding fruit* (Jeremiah 17:7-8). The roots spread out to the river that never fails are the roots driven down into the love of Messiah (Christ) which passeth knowledge; the faith by which Messiah (Christ) dwells in the heart is the trust on which Jeremiah''s blessing rests. The twin letter prays the same prayer in the same words: *Rooted and built up in him, and stablished in the faith* (Colossians 2:7) — root and foundation are one figure, the believer planted and built upon Messiah (Christ). So Paul ends in doxology: *Now unto him that is able to do exceeding abundantly above all that we ask or think... Unto him be glory in the church by HaMashiach Yahusha (Christ Jesus) throughout all ages, world without end. Amen* (Ephesians 3:20-21) — the rooted tree bearing its fruit unceasing, the gathered people green in the year of drought because they draw from the love that passeth knowledge.',
       sv.verse_id, ev.verse_id, 'free', 7456
  FROM _s230_ep03_lookup sv, _s230_ep03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=3 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:3 — *in thee shall all families of the earth be blessed* the Abrahamic promise the mystery opens; the Gentiles made *fellowheirs* brought INTO the families blessed in Abraham (Ephesians 3:6).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:18 — *in thy seed shall all the nations of the earth be blessed* the Moriah oath; the seed is Messiah (Christ), the nations made *partakers of his promise* (Ephesians 3:6).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 11:17 — *a wild olive tree, wert graffed in among them... partakest of the root and fatness of the olive tree* Paul''s own figure; the Gentiles *of the same body* grafted INTO the one tree, not beside it (Ephesians 3:6).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 11:25 — *this mystery... until the fulness of the Gentiles be come in* the same secret named a mystery; the nations brought in and Yashar''el (Israel) received, the two made one (Ephesians 3:6).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Colossians 1:26 — *the mystery which hath been hid from ages and from generations, but now is made manifest* the twin letter''s near-verbatim word; *in other ages was not made known... now is revealed* (Ephesians 3:5).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Colossians 1:27 — *the riches of the glory of this mystery among the Gentiles; which is Messiah (Christ) in you, the hope of glory* the content of the mystery; the nations given Messiah (Christ) himself, members of the one body (Ephesians 3:6).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-3-the-manifold-wisdom-of-elohim-made-known-by-the-church-wisdom-of-solomon-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 7:22 — *in her is an understanding spirit holy, one only, manifold* the restored library''s own word *manifold* for the wisdom of Yahuah (God); the *manifold wisdom of Elohim (God)* now known by the church (Ephesians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-manifold-wisdom-of-elohim-made-known-by-the-church-wisdom-of-solomon-7'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 11:33 — *O the depth of the riches both of the wisdom and knowledge of Elohim (God)!* the wonder closing the olive-tree mystery; the unsearchable wisdom the assembly now displays (Ephesians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-manifold-wisdom-of-elohim-made-known-by-the-church-wisdom-of-solomon-7'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 2:2 — *the mystery of Elohim (God), and of the Father, and of Messiah (Christ)* hearts *knit together in love*; the same unveiling Paul charges *to make all men see* (Ephesians 3:9).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-manifold-wisdom-of-elohim-made-known-by-the-church-wisdom-of-solomon-7'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 2:3 — *In whom are hid all the treasures of wisdom and knowledge* the treasures hidden in Messiah (Christ); the *manifold wisdom of Elohim (God)* the assembly displays before the powers (Ephesians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-manifold-wisdom-of-elohim-made-known-by-the-church-wisdom-of-solomon-7'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-3-rooted-and-grounded-in-love-a-tree-planted-by-the-waters-jeremiah-17
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 17:7 — *Blessed is the man that trusteth in Yahuah (LORD), and whose hope Yahuah (LORD) is* the trust that roots the soul; the faith by which Messiah (Christ) dwells in the heart (Ephesians 3:17).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-rooted-and-grounded-in-love-a-tree-planted-by-the-waters-jeremiah-17'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 17:8 — *as a tree planted by the waters, and that spreadeth out her roots by the river* the very image; *rooted and grounded in love,* drawing from the love that passeth knowledge (Ephesians 3:17).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-rooted-and-grounded-in-love-a-tree-planted-by-the-waters-jeremiah-17'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 2:7 — *Rooted and built up in him, and stablished in the faith* the twin letter''s same root-and-foundation prayer; *rooted and grounded in love* (Ephesians 3:17).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-rooted-and-grounded-in-love-a-tree-planted-by-the-waters-jeremiah-17'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
