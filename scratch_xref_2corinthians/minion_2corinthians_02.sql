-- ----- fragment: minion_2corinthians_02.sql (S229 2 Corinthians 2) -----
-- =====================================================================
-- S229 minion — 2 CORINTHIANS 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 CORINTHIANS 2 (17 verses).
-- Tag: 2c02 (temp view _s229_2c02_lookup).
-- Sort band: floor 7025, step 3 (7025, 7028, 7031 used; under 7050).
-- Source is ALWAYS the canon 2 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul writes to the same divided, afflicted assembly of called-out ones at Corinth.
-- Chapter 2 is pastoral and allusive — it carries no *as-it-is-written* citation. Two load-bearing
-- pulses: (1) the forgiveness and restoration of the disciplined offender, *lest Satan should get an
-- advantage of us: for we are not ignorant of his devices* (2:11) — the same man and the same
-- adversary of 1 Corinthians 5, now to be received back so the serpent who beguiled Eve cannot devour
-- him with overmuch sorrow; (2) the triumphal procession and the incense-savour, *thanks be unto
-- Elohim (God), which always causeth us to triumph in Messiah, and maketh manifest the savour of his
-- knowledge by us in every place* (2:14), *a sweet savour of Messiah* (2:15) — the knowledge of Yahuah
-- (LORD) that shall fill the earth as the waters cover the sea (Isaiah 11:9, Habakkuk 2:14), and the
-- burnt-offering sweet savour that ascends to Yahuah (LORD) (Genesis 8:21, Exodus 29:18). No
-- replacement theology, no law-vs-grace antithesis. The savour of life and death is the same gospel
-- word working two ways in the saved and the perishing.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   I would not come again to you in heaviness; out of much affliction I wrote with tears
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (pastoral; no
--                   load-bearing parallel — the tears are Paul's own, not a quoted text)
--   v.5-11  forgive and comfort the offender, lest he be swallowed up; lest Satan get an advantage
--           Tanakh: Genesis 3:1,13 (the serpent more subtil... the serpent beguiled me — Satan's
--                   devices)   Extras: none warranted (no clean witness adds load here)
--           NT: 1 Corinthians 5:5 (deliver such an one unto Satan... that the spirit may be saved —
--               the SAME offender now restored), Matthew 18:15,21-22 (gain thy brother; forgive until
--               seventy times seven)
--   v.12-13 a door opened at Troas; no rest in my spirit, found not Titus
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (travel narrative;
--                   the open door is real but not a load-bearing quoted root)
--   v.14    God causeth us to triumph in Messiah, maketh manifest the savour of his knowledge in
--           every place
--           Tanakh: Isaiah 11:9 (the earth shall be full of the knowledge of Yahuah), Habakkuk 2:14
--                   (the earth shall be filled with the knowledge of the glory of Yahuah)
--           Extras: none warranted   NT: none warranted (the knowledge-filling root is the Tanakh)
--   v.15-16 a sweet savour of Messiah... savour of death unto death, savour of life unto life
--           Tanakh: Genesis 8:21 (Yahuah smelled a sweet savour), Exodus 29:18 (a sweet savour, an
--                   offering made by fire unto Yahuah)
--           Extras: none warranted   NT: none warranted
--   v.17    we corrupt not the word of God, but as of sincerity speak we in Messiah
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (carried in prose)
--
-- THREADS (slug -> target libraries):
--   7025 2-corinthians-2-forgive-and-restore-the-offender-lest-satan-get-an-advantage-genesis-3   (Tanakh + NT)
--   7028 2-corinthians-2-the-savour-of-his-knowledge-in-every-place-the-earth-full-of-the-knowledge-isaiah-11   (Tanakh)
--   7031 2-corinthians-2-a-sweet-savour-of-messiah-the-offering-made-by-fire-genesis-8   (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s229_2c02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-2-forgive-and-restore-the-offender-lest-satan-get-an-advantage-genesis-3
  ('canon', '2-corinthians', 2, 11, 'canon', 'genesis', 3, 1, 'free', E'*Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* (Genesis 3:1). Paul forgives the disciplined offender *lest Satan should get an advantage of us: for we are not ignorant of his devices* (2 Corinthians 2:11). The serpent''s *subtil* questioning of Eden is the oldest of those devices — the adversary works by twisting and by accusation. To leave the penitent man *swallowed up with overmuch sorrow* (2:7) would hand the serpent his advantage; so the assembly is not ignorant of his subtilty, and forgives.'),
  ('canon', '2-corinthians', 2, 11, 'canon', 'genesis', 3, 13, 'free', E'*And Yahuah Elohim (the LORD God) said unto the woman, What is this that thou hast done? And the woman said, The serpent beguiled me, and I did eat.* (Genesis 3:13). *The serpent beguiled me* — the first naming of the adversary''s craft. Paul writes *we are not ignorant of his devices* (2 Corinthians 2:11), and chief among them is this beguiling. The same serpent who deceived Eve would devour the sorrowing offender through despair; the assembly forgives and comforts him *lest perhaps such a one should be swallowed up with overmuch sorrow* (2:7), and so refuses the serpent his prey.'),
  ('canon', '2-corinthians', 2, 6, 'canon', '1-corinthians', 5, 5, 'free', E'*To deliver such an one unto Satan for the destruction of the flesh, that the spirit may be saved in the day of the Lord Yahusha (Lord Jesus).* (1 Corinthians 5:5). The discipline Paul commanded in the first letter — *deliver such an one unto Satan... that the spirit may be saved* — has done its work: *Sufficient to such a man is this punishment, which was inflicted of many* (2 Corinthians 2:6). The whole aim was never destruction but salvation; now that the man has repented, the same Paul who handed him over for the destruction of the flesh calls the assembly to *forgive him, and comfort him* (2:7), that the spirit indeed be saved.'),
  ('canon', '2-corinthians', 2, 7, 'canon', 'matthew', 18, 15, 'free', E'*Moreover if thy brother shall trespass against thee, go and tell him his fault between thee and him alone: if he shall hear thee, thou hast gained thy brother.* (Matthew 18:15). Yahusha (Jesus) made the whole purpose of discipline the gaining of a brother — *thou hast gained thy brother.* Paul walks that same path to its end: the offender has heard, and so the assembly is *contrariwise* to *forgive him, and comfort him... and confirm your love toward him* (2 Corinthians 2:7-8). The trespass that was confronted is now the brother regained.'),
  ('canon', '2-corinthians', 2, 10, 'canon', 'matthew', 18, 21, 'free', E'*Then came Peter to him, and said, Yahuah (Lord), how oft shall my brother sin against me, and I forgive him? till seven times?* (Matthew 18:21). Peter asked the limit of forgiveness; Yahusha (Jesus) answered there is none — *Until seventy times seven* (Matthew 18:22). Paul embodies that boundless forgiving: *To whom ye forgive any thing, I forgive also: for if I forgave any thing, to whom I forgave it, for your sakes forgave I it in the person of Messiah (Christ)* (2 Corinthians 2:10). He forgives not by his own measure but *in the person of Messiah,* who set no limit on the brother forgiven.'),
  -- thread: 2-corinthians-2-the-savour-of-his-knowledge-in-every-place-the-earth-full-of-the-knowledge-isaiah-11
  ('canon', '2-corinthians', 2, 14, 'canon', 'isaiah', 11, 9, 'free', E'*They shall not hurt nor destroy in all my holy mountain: for the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea.* (Isaiah 11:9). Isaiah foresaw the day when *the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea.* Paul says that knowledge is already going forth through the apostles'' ministry: Elohim (God) *maketh manifest the savour of his knowledge by us in every place* (2 Corinthians 2:14). The triumphal procession of the Messiah spreads the fragrance of the knowledge of Yahuah (LORD) — the very knowledge the prophet said would fill the earth — to every place the gospel is carried.'),
  ('canon', '2-corinthians', 2, 14, 'canon', 'habakkuk', 2, 14, 'free', E'*For the earth shall be filled with the knowledge of the glory of Yahuah (LORD), as the waters cover the sea.* (Habakkuk 2:14). Habakkuk repeats the promise: *the earth shall be filled with the knowledge of the glory of Yahuah (LORD), as the waters cover the sea.* This filling is what Paul names when he gives *thanks be unto Elohim (God), which always causeth us to triumph in Messiah, and maketh manifest the savour of his knowledge by us in every place* (2 Corinthians 2:14). The knowledge of the glory of Yahuah (LORD) that the prophets said would cover the earth is the savour the apostles diffuse — *in every place* the procession of Messiah advances.'),
  -- thread: 2-corinthians-2-a-sweet-savour-of-messiah-the-offering-made-by-fire-genesis-8
  ('canon', '2-corinthians', 2, 15, 'canon', 'genesis', 8, 21, 'free', E'*And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* (Genesis 8:21). When Noah''s burnt offering ascended, *Yahuah (LORD) smelled a sweet savour* and stayed his judgment. Paul takes up that altar-language for the gospel ministry: *we are unto Elohim (God) a sweet savour of Messiah (Christ), in them that are saved, and in them that perish* (2 Corinthians 2:15). The offering that pleased Yahuah (LORD) and turned away wrath is the figure of Messiah and of those who bear his fragrance into all the world.'),
  ('canon', '2-corinthians', 2, 15, 'canon', 'exodus', 29, 18, 'free', E'*And thou shalt burn the whole ram upon the altar: it is a burnt offering unto Yahuah (LORD): it is a sweet savour, an offering made by fire unto Yahuah (LORD).* (Exodus 29:18). The Torah''s consecration offering is *a sweet savour, an offering made by fire unto Yahuah (LORD).* Paul names the apostolic ministry with the same priestly word: *we are unto Elohim (God) a sweet savour of Messiah (Christ)* (2 Corinthians 2:15). As the ram ascended in fire and was a sweet savour to Yahuah (LORD), so the proclamation of Messiah rises as a fragrance — *to the one we are the savour of death unto death; and to the other the savour of life unto life* (2:16), the one offering smelled two ways.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-2-forgive-and-restore-the-offender-lest-satan-get-an-advantage-genesis-3',
       E'Forgive and restore the offender, lest Satan get an advantage (Genesis 3, 1 Corinthians 5, Matthew 18)',
       E'The man disciplined in the first letter has repented, and Paul turns the whole assembly to mercy: *Sufficient to such a man is this punishment, which was inflicted of many. So that contrariwise ye ought rather to forgive him, and comfort him, lest perhaps such a one should be swallowed up with overmuch sorrow. Wherefore I beseech you that ye would confirm your love toward him* (2 Corinthians 2:6-8). The discipline he had commanded was never for destruction but for salvation — *To deliver such an one unto Satan for the destruction of the flesh, that the spirit may be saved in the day of the Lord Yahusha (Lord Jesus)* (1 Corinthians 5:5) — and now that aim is reached, so the man is received back. Paul forgives without measure and not in his own name: *To whom ye forgive any thing, I forgive also: for if I forgave any thing, to whom I forgave it, for your sakes forgave I it in the person of Messiah (Christ)* (2 Corinthians 2:10). This is the very forgiving Yahusha (Jesus) taught — *if thy brother shall trespass against thee... if he shall hear thee, thou hast gained thy brother* (Matthew 18:15), and when Peter asked how oft, *I say not unto thee, Until seven times: but, Until seventy times seven* (Matthew 18:22). And there is an enemy in the matter: *lest Satan should get an advantage of us: for we are not ignorant of his devices* (2 Corinthians 2:11). The adversary''s craft is as old as the garden — *the serpent was more subtil than any beast of the field* (Genesis 3:1), and *the serpent beguiled me, and I did eat* (Genesis 3:13). To leave a penitent brother drowning in sorrow would hand the serpent the advantage; the assembly is not ignorant of his subtilty, and so it forgives, comforts, and confirms its love, refusing the accuser his prey.',
       sv.verse_id, ev.verse_id, 'free', 7025
  FROM _s229_2c02_lookup sv, _s229_2c02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-2-the-savour-of-his-knowledge-in-every-place-the-earth-full-of-the-knowledge-isaiah-11',
       E'The savour of his knowledge in every place — the earth full of the knowledge of Yahuah (Isaiah 11, Habakkuk 2)',
       E'Paul breaks into thanksgiving for the spreading gospel: *Now thanks be unto Elohim (God), which always causeth us to triumph in Messiah, and maketh manifest the savour of his knowledge by us in every place* (2 Corinthians 2:14). The image is the triumphal procession with its trail of incense — but the fragrance is *the savour of his knowledge,* carried *in every place.* That knowledge going out to all the earth is exactly what the prophets foretold of the Messiah''s reign. Isaiah, having spoken of the Branch out of Jesse upon whom rests *the spirit of knowledge and of the fear of Yahuah (LORD),* declares: *They shall not hurt nor destroy in all my holy mountain: for the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea* (Isaiah 11:9). Habakkuk says it again: *For the earth shall be filled with the knowledge of the glory of Yahuah (LORD), as the waters cover the sea* (Habakkuk 2:14). The knowledge the prophets promised would cover the earth like the sea is the very savour the apostles diffuse from place to place; the triumph of Messiah is the filling of the earth with the knowledge of Yahuah (LORD), beginning now through those he leads in his procession.',
       sv.verse_id, ev.verse_id, 'free', 7028
  FROM _s229_2c02_lookup sv, _s229_2c02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-2-a-sweet-savour-of-messiah-the-offering-made-by-fire-genesis-8',
       E'A sweet savour of Messiah — the offering made by fire (Genesis 8, Exodus 29)',
       E'Paul presses the incense-figure further: the apostles are not merely the bearers of the savour but are themselves the offering. *For we are unto Elohim (God) a sweet savour of Messiah (Christ), in them that are saved, and in them that perish: To the one we are the savour of death unto death; and to the other the savour of life unto life* (2 Corinthians 2:15-16). The phrase *sweet savour* is the altar-language of the Torah. When Noah''s burnt offering rose, *Yahuah (LORD) smelled a sweet savour* and pledged not to smite all living again (Genesis 8:21); and the consecration of the priests was *a sweet savour, an offering made by fire unto Yahuah (LORD)* (Exodus 29:18). As the burnt offering ascended in fire and pleased Yahuah (LORD), so the proclamation of Messiah rises as a fragrance before Elohim (God). And as one fire-borne savour, it is smelled two ways: life to those being saved, death to those who perish — not two offerings but one gospel, working according to the heart that receives it. *And who is sufficient for these things?* (2:16) — only those who, *as of sincerity... in the sight of Elohim (God) speak we in Messiah (Christ)* (2:17), do not corrupt the word but offer it pure as a sweet savour unto Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'free', 7031
  FROM _s229_2c02_lookup sv, _s229_2c02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-corinthians-2-forgive-and-restore-the-offender-lest-satan-get-an-advantage-genesis-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 5:5 — *deliver such an one unto Satan for the destruction of the flesh, that the spirit may be saved* the discipline aimed all along at salvation; now *Sufficient to such a man is this punishment* (2 Corinthians 2:6).'
  FROM cross_reference_threads t, cross_references x, _s229_2c02_lookup sv, _s229_2c02_lookup tv
 WHERE t.slug='2-corinthians-2-forgive-and-restore-the-offender-lest-satan-get-an-advantage-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 18:15 — *if he shall hear thee, thou hast gained thy brother* discipline''s whole aim; the assembly is *contrariwise* to *forgive him, and comfort him* (2 Corinthians 2:7).'
  FROM cross_reference_threads t, cross_references x, _s229_2c02_lookup sv, _s229_2c02_lookup tv
 WHERE t.slug='2-corinthians-2-forgive-and-restore-the-offender-lest-satan-get-an-advantage-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 18:21 — *how oft shall my brother sin against me, and I forgive him?* answered *Until seventy times seven*; Paul forgives *in the person of Messiah (Christ)* (2 Corinthians 2:10).'
  FROM cross_reference_threads t, cross_references x, _s229_2c02_lookup sv, _s229_2c02_lookup tv
 WHERE t.slug='2-corinthians-2-forgive-and-restore-the-offender-lest-satan-get-an-advantage-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:1 — *the serpent was more subtil than any beast of the field* the oldest of the adversary''s devices; *we are not ignorant of his devices* (2 Corinthians 2:11).'
  FROM cross_reference_threads t, cross_references x, _s229_2c02_lookup sv, _s229_2c02_lookup tv
 WHERE t.slug='2-corinthians-2-forgive-and-restore-the-offender-lest-satan-get-an-advantage-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 3:13 — *the serpent beguiled me, and I did eat* the first naming of his craft; the same beguiler would swallow up the offender *with overmuch sorrow* (2 Corinthians 2:7,11).'
  FROM cross_reference_threads t, cross_references x, _s229_2c02_lookup sv, _s229_2c02_lookup tv
 WHERE t.slug='2-corinthians-2-forgive-and-restore-the-offender-lest-satan-get-an-advantage-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-2-the-savour-of-his-knowledge-in-every-place-the-earth-full-of-the-knowledge-isaiah-11
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 11:9 — *the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea* the prophesied filling; manifested *the savour of his knowledge by us in every place* (2 Corinthians 2:14).'
  FROM cross_reference_threads t, cross_references x, _s229_2c02_lookup sv, _s229_2c02_lookup tv
 WHERE t.slug='2-corinthians-2-the-savour-of-his-knowledge-in-every-place-the-earth-full-of-the-knowledge-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Habakkuk 2:14 — *the earth shall be filled with the knowledge of the glory of Yahuah (LORD), as the waters cover the sea* the same promise; the triumph in Messiah that *maketh manifest the savour of his knowledge* (2 Corinthians 2:14).'
  FROM cross_reference_threads t, cross_references x, _s229_2c02_lookup sv, _s229_2c02_lookup tv
 WHERE t.slug='2-corinthians-2-the-savour-of-his-knowledge-in-every-place-the-earth-full-of-the-knowledge-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-2-a-sweet-savour-of-messiah-the-offering-made-by-fire-genesis-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:21 — *Yahuah (LORD) smelled a sweet savour* the burnt offering that turned away wrath; *we are unto Elohim (God) a sweet savour of Messiah (Christ)* (2 Corinthians 2:15).'
  FROM cross_reference_threads t, cross_references x, _s229_2c02_lookup sv, _s229_2c02_lookup tv
 WHERE t.slug='2-corinthians-2-a-sweet-savour-of-messiah-the-offering-made-by-fire-genesis-8'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 29:18 — *it is a sweet savour, an offering made by fire unto Yahuah (LORD)* the priestly consecration; the apostolic word rises the same way, *the savour of life unto life* (2 Corinthians 2:15-16).'
  FROM cross_reference_threads t, cross_references x, _s229_2c02_lookup sv, _s229_2c02_lookup tv
 WHERE t.slug='2-corinthians-2-a-sweet-savour-of-messiah-the-offering-made-by-fire-genesis-8'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
