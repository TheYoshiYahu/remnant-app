-- ----- fragment: minion_ignatiusphiladelphians_01.sql (session253 ignatius-philadelphians 1) -----
-- Source anchor: lightfoot-apostolic-fathers/ignatius-philadelphians ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: igphil1 (view _session253_igphil1_lookup). Sort band base 70600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_igphil1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ignatius-philadelphians-1-one-altar-one-cup
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 3, 'canon', '1-corinthians', 10, 16, 'free', E'1 Corinthians 10:16 — *The cup of blessing which we bless, is it not the communion of the blood of Messiah (Christ)? The bread which we break, is it not the communion of the body of Messiah (Christ)?* Ignatius''s one cup unto union in His blood is exactly the communion of the blood Sha''ul names.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 3, 'canon', '1-corinthians', 10, 17, 'free', E'1 Corinthians 10:17 — *For we being many are one bread, and one body: for we are all partakers of that one bread.* The one flesh and one altar of Ignatius 1:3 is the one bread, one body of the many made one.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 3, 'canon', 'ephesians', 4, 4, 'free', E'Ephesians 4:4 — *There is one body, and one Spirit, even as ye are called in one hope of your calling.* Ignatius''s one altar, one bishop, one cup is the one body of one hope already taught by Sha''ul.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 3, 'canon', 'ephesians', 4, 5, 'free', E'Ephesians 4:5 — *One Yahuah (Lord), one faith, one baptism.* The oneness Ignatius presses in the eucharist stands on the one Yahuah and one faith confessed before him.'),
  -- thread: ignatius-philadelphians-1-prophets-pointed-to-the-gospel
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 5, 'canon', 'luke', 24, 25, 'free', E'Luke 24:25 — *Then he said unto them, O fools, and slow of heart to believe all that the prophets have spoken:* Ignatius loves the prophets because they pointed to the Gospel — exactly what the risen Messiah rebukes the disciples for missing.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 5, 'canon', 'luke', 24, 27, 'free', E'Luke 24:27 — *And beginning at Moses and all the prophets, he expounded unto them in all the scriptures the things concerning himself.* The prophets pointed to the Gospel because all the scriptures, Moses included, are concerning Him.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 5, 'canon', '1-peter', 1, 11, 'free', E'1 Peter 1:11 — *Searching what, or what manner of time the Spirit of Messiah (Christ) which was in them did signify, when it testified beforehand the sufferings of Messiah (Christ), and the glory that should follow.* Ignatius''s prophets who set their hope on Him are Kepha''s prophets in whom the Spirit of Messiah testified beforehand.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 5, 'canon', 'john', 8, 56, 'free', E'John 8:56 — *Your father Abraham rejoiced to see my day: and he saw it, and was glad.* The prophets who awaited Him are joined by Avraham who saw His day afar off and rejoiced.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 5, 'canon', 'matthew', 5, 17, 'free', E'Matthew 5:17 — *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil.* Because the prophets point to the Gospel, they are fulfilled in Messiah and never abolished — the Torah and Prophets stand.'),
  -- thread: ignatius-philadelphians-1-the-door-of-the-father
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 8, 'canon', 'john', 10, 9, 'free', E'John 10:9 — *I am the door: by me if any man enter in, he shall be saved, and shall go in and out, and find pasture.* Ignatius''s door of the Father, through which the patriarchs and prophets enter, is the Messiah''s own I am the door.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 8, 'canon', 'hebrews', 11, 13, 'free', E'Hebrews 11:13 — *These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth.* Abraham, Isaac and Jacob enter Ignatius''s door by the same faith that saw the promise afar off.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 8, 'canon', 'hebrews', 11, 16, 'free', E'Hebrews 11:16 — *But now they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city.* The patriarchs who enter the door of the Father seek the city Elohim prepared — the unity of Elohim Ignatius proclaims.'),
  -- thread: ignatius-philadelphians-1-shun-division-follow-the-shepherd
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 2, 'canon', 'john', 17, 21, 'free', E'John 17:21 — *That they all may be one; as thou, Father, art in me, and I in thee, that they also may be one in us: that the world may believe that thou hast sent me.* Ignatius''s where ye are at one, they will find no place is the Messiah''s own prayer that they all may be one.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 2, 'canon', '1-corinthians', 1, 10, 'free', E'1 Corinthians 1:10 — *Now I beseech you, brethren, by the name of our Lord Yahusha HaMashiach (Lord Jesus Christ), that ye all speak the same thing, and that there be no divisions among you; but that ye be perfectly joined together in the same mind and in the same judgment.* Ignatius''s shun division echoes Sha''ul''s plea that there be no divisions among you.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 2, 'canon', 'ephesians', 4, 3, 'free', E'Ephesians 4:3 — *Endeavouring to keep the unity of the Spirit in the bond of peace.* Where ye are at one the wolves find no place — the unity Ignatius commands is the unity of the Spirit in the bond of peace.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_igphil1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_igphil1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-philadelphians-1-one-altar-one-cup',
       E'One eucharist, one cup, one altar — the body not divided',
       E'Ignatius exhorts the Philadelphians to the unity of the one table: *Be ye careful therefore to observe one eucharist (for there is one flesh of our Yahuah (Lord) Yahusha HaMashiach (Jesus Christ) and one cup unto union in His blood; there is one altar, as there is one bishop, together with the presbytery and the deacons my fellow-servants), that whatsoever ye do, ye may do it after Elohim (God)* (Ignatius to the Philadelphians 1:3). It ain''t new — Sha''ul had already named the cup and the bread as the one communion of the one body: *The cup of blessing which we bless, is it not the communion of the blood of Messiah (Christ)? The bread which we break, is it not the communion of the body of Messiah (Christ)?* (1 Corinthians 10:16), and *For we being many are one bread, and one body: for we are all partakers of that one bread* (1 Corinthians 10:17). And the sevenfold oneness of Ephesians is the very frame Ignatius preaches: *There is one body, and one Spirit, even as ye are called in one hope of your calling* (Ephesians 4:4); *One Yahuah (Lord), one faith, one baptism* (Ephesians 4:5).',
       sv.verse_id, ev.verse_id, 'extras', 70600
  FROM _session253_igphil1_lookup sv, _session253_igphil1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-philadelphians' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-philadelphians-1-prophets-pointed-to-the-gospel',
       E'The prophets pointed to the Gospel, hoped in Him, and awaited Him',
       E'Ignatius binds the prophets to the Messiah they foretold: *Yea, and we love the prophets also, because they too pointed to the Gospel in their preaching and set their hope on Him and awaited Him; in whom also having faith they were saved in the unity of Yahusha HaMashiach (Jesus Christ)* (Ignatius to the Philadelphians 1:5). This is the risen Messiah''s own teaching on the Emmaus road — that Moses and the prophets are all of Him: *Then he said unto them, O fools, and slow of heart to believe all that the prophets have spoken: Ought not Messiah (Christ) to have suffered these things, and to enter into his glory?* (Luke 24:25-26); and Kepha says the prophets searched out the very sufferings and glory: *Searching what, or what manner of time the Spirit of Messiah (Christ) which was in them did signify, when it testified beforehand the sufferings of Messiah (Christ), and the glory that should follow* (1 Peter 1:11). Avraham himself looked ahead and rejoiced: *Your father Abraham rejoiced to see my day: and he saw it, and was glad* (John 8:56). And because the prophets point to Him, they are never abolished but fulfilled: *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil* (Matthew 5:17) — the Torah and the Prophets stand, and they preach Messiah. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 70603
  FROM _session253_igphil1_lookup sv, _session253_igphil1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-philadelphians' AND ev.chapter_number=1 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-philadelphians-1-the-door-of-the-father',
       E'The door of the Father — Abraham, Isaac, Jacob, and the prophets enter in',
       E'Ignatius names the Messiah as the one gate of the patriarchs and the prophets: *He Himself being the door of the Father, through which Abraham and Isaac and Jacob enter in, and the Prophets and the Apostles and the whole Church; all these things combine in the unity of Elohim (God)* (Ignatius to the Philadelphians 1:9), adding *For the beloved Prophets in their preaching pointed to Him* (Ignatius to the Philadelphians 1:9). This is the Good Shepherd''s own word: *I am the door: by me if any man enter in, he shall be saved, and shall go in and out, and find pasture* (John 10:9). And the patriarchs Ignatius names entered that door by faith from afar, awaiting the city to come: *These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth* (Hebrews 11:13); *But now they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city* (Hebrews 11:16). Avraham, Yitschaq, and Ya''aqov enter the one door — election and the seed kept, not replaced.',
       sv.verse_id, ev.verse_id, 'extras', 70606
  FROM _session253_igphil1_lookup sv, _session253_igphil1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-philadelphians' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-philadelphians-1-shun-division-follow-the-shepherd',
       E'Shun division — where the Shepherd is, follow as sheep',
       E'Ignatius warns against schism and the wolves that scatter: *As children therefore [of the light] of the truth, shun division and wrong doctrines; and where the shepherd is, there follow ye as sheep. For many specious wolves with baneful delights lead captive the runners in Elohim''s (God''s) race; but, where ye are at one, they will find no place* (Ignatius to the Philadelphians 1:2). This is the Messiah''s high-priestly prayer for oneness: *That they all may be one; as thou, Father, art in me, and I in thee, that they also may be one in us: that the world may believe that thou hast sent me* (John 17:21); and Sha''ul''s first plea to Corinth: *Now I beseech you, brethren, by the name of our Lord Yahusha HaMashiach (Lord Jesus Christ), that ye all speak the same thing, and that there be no divisions among you; but that ye be perfectly joined together in the same mind and in the same judgment* (1 Corinthians 1:10). The bond is the one Spirit: *Endeavouring to keep the unity of the Spirit in the bond of peace* (Ephesians 4:3). The plea against division ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 70609
  FROM _session253_igphil1_lookup sv, _session253_igphil1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-philadelphians' AND ev.chapter_number=1 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ignatius-philadelphians-1-one-altar-one-cup
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 10:16 — *The cup of blessing which we bless, is it not the communion of the blood of Messiah (Christ)? The bread which we break, is it not the communion of the body of Messiah (Christ)?* Ignatius''s one cup unto union in His blood is exactly the communion of the blood Sha''ul names.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-one-altar-one-cup'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 10:17 — *For we being many are one bread, and one body: for we are all partakers of that one bread.* The one flesh and one altar of Ignatius 1:3 is the one bread, one body of the many made one.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-one-altar-one-cup'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 4:4 — *There is one body, and one Spirit, even as ye are called in one hope of your calling.* Ignatius''s one altar, one bishop, one cup is the one body of one hope already taught by Sha''ul.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-one-altar-one-cup'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 4:5 — *One Yahuah (Lord), one faith, one baptism.* The oneness Ignatius presses in the eucharist stands on the one Yahuah and one faith confessed before him.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-one-altar-one-cup'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-philadelphians-1-prophets-pointed-to-the-gospel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 24:25 — *Then he said unto them, O fools, and slow of heart to believe all that the prophets have spoken:* Ignatius loves the prophets because they pointed to the Gospel — exactly what the risen Messiah rebukes the disciples for missing.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-prophets-pointed-to-the-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 24:27 — *And beginning at Moses and all the prophets, he expounded unto them in all the scriptures the things concerning himself.* The prophets pointed to the Gospel because all the scriptures, Moses included, are concerning Him.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-prophets-pointed-to-the-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:11 — *Searching what, or what manner of time the Spirit of Messiah (Christ) which was in them did signify, when it testified beforehand the sufferings of Messiah (Christ), and the glory that should follow.* Ignatius''s prophets who set their hope on Him are Kepha''s prophets in whom the Spirit of Messiah testified beforehand.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-prophets-pointed-to-the-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 8:56 — *Your father Abraham rejoiced to see my day: and he saw it, and was glad.* The prophets who awaited Him are joined by Avraham who saw His day afar off and rejoiced.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-prophets-pointed-to-the-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=56
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 5:17 — *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil.* Because the prophets point to the Gospel, they are fulfilled in Messiah and never abolished — the Torah and Prophets stand.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-prophets-pointed-to-the-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-philadelphians-1-the-door-of-the-father
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 10:9 — *I am the door: by me if any man enter in, he shall be saved, and shall go in and out, and find pasture.* Ignatius''s door of the Father, through which the patriarchs and prophets enter, is the Messiah''s own I am the door.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-the-door-of-the-father'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:13 — *These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth.* Abraham, Isaac and Jacob enter Ignatius''s door by the same faith that saw the promise afar off.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-the-door-of-the-father'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:16 — *But now they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city.* The patriarchs who enter the door of the Father seek the city Elohim prepared — the unity of Elohim Ignatius proclaims.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-the-door-of-the-father'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-philadelphians-1-shun-division-follow-the-shepherd
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 17:21 — *That they all may be one; as thou, Father, art in me, and I in thee, that they also may be one in us: that the world may believe that thou hast sent me.* Ignatius''s where ye are at one, they will find no place is the Messiah''s own prayer that they all may be one.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-shun-division-follow-the-shepherd'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=17 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 1:10 — *Now I beseech you, brethren, by the name of our Lord Yahusha HaMashiach (Lord Jesus Christ), that ye all speak the same thing, and that there be no divisions among you; but that ye be perfectly joined together in the same mind and in the same judgment.* Ignatius''s shun division echoes Sha''ul''s plea that there be no divisions among you.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-shun-division-follow-the-shepherd'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 4:3 — *Endeavouring to keep the unity of the Spirit in the bond of peace.* Where ye are at one the wolves find no place — the unity Ignatius commands is the unity of the Spirit in the bond of peace.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-shun-division-follow-the-shepherd'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

