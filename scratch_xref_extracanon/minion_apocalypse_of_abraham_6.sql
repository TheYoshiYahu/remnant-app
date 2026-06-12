-- ----- fragment: minion_apocalypseofabraham_06.sql (session253 apocalypse-of-abraham 6) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa6 (view _session253_aoa6_lookup). Sort band base 67125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-6-stone-cannot-be-renewed
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 5, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Scripture itself records that Abraham''s rebuke in 6:5 was aimed at the very idolatry of Terah''s house.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 7, 'canon', 'psalms', 115, 5, 'free', E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* The stone Merumath of 6:7 is the Psalm''s dumb, blind idol, unable to renew even itself.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 7, 'canon', 'psalms', 115, 8, 'free', E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* Terah is made foolish (6:5) by the lifeless thing he trusts, exactly as the Psalm warns.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 7, 'canon', 'jeremiah', 10, 8, 'free', E'Jeremiah 10:8 — *But they are altogether brutish and foolish: the stock is a doctrine of vanities.* The broken stone that cannot be renewed (6:7) is Jeremiah''s vain stock, a doctrine of nothing.'),
  -- thread: apocalypse-of-abraham-6-barisat-hewn-from-the-tree
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 10, 'canon', 'isaiah', 44, 14, 'free', E'Isaiah 44:14 — *He heweth him down cedars, and taketh the cypress and the oak, which he strengtheneth for himself among the trees of the forest: he planteth an ash, and the rain doth nourish it.* The living tree Abraham mourns in 6:10 is Isaiah''s forest cedar, nourished by rain before the axe.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 10, 'canon', 'isaiah', 44, 15, 'free', E'Isaiah 44:15 — *Then shall it be for a man to burn: for he will take thereof, and warm himself; yea, he kindleth it, and baketh bread; yea, he maketh a god, and worshippeth it; he maketh it a graven image, and falleth down thereto.* The same wood that warms and bakes is hewn into Barisat the god (6:10), the prophet''s exact absurdity.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 10, 'canon', 'jeremiah', 10, 3, 'free', E'Jeremiah 10:3 — *For the customs of the people are vain: for one cutteth a tree out of the forest, the work of the hands of the workman, with the axe.* Abraham''s axe in 6:10 is Jeremiah''s axe; the custom of cutting a god from a tree is one and the same vanity.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 10, 'apocrypha', 'the-wisdom-of-solomon', 13, 13, 'extras', E'Wisdom of Solomon 13:13 — *And taking the very refuse among those which served to no use, being a crooked piece of wood, and full of knots, has carved it diligently, when he had nothing else to do, and formed it by the skill of his understanding, and fashioned it to the image of a man;* Barisat made into a god by Terah''s art (6:10) is the carpenter''s refuse-wood shaped into a deity, the same witness in the deuterocanon.'),
  -- thread: apocalypse-of-abraham-6-burnt-to-ashes-no-helper
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 11, 'canon', 'isaiah', 44, 20, 'free', E'Isaiah 44:20 — *He feedeth on ashes: a deceived heart hath turned him aside, that he cannot deliver his soul, nor say, Is there not a lie in my right hand?* Barisat reduced to ashes (6:11) is the very ash the deceived heart feeds on, unable to deliver a single soul.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 11, 'canon', 'habakkuk', 2, 18, 'free', E'Habakkuk 2:18 — *What profiteth the graven image that the maker thereof hath graven it; the molten image, and a teacher of lies, that the maker of his work trusteth therein, to make dumb idols?* Abraham''s burnt and profitless Barisat (6:11) is the prophet''s dumb idol that profits the maker nothing.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 1, 'canon', 'isaiah', 44, 2, 'free', E'Isaiah 44:2 — *Thus saith Yahuah (LORD) that made thee, and formed thee from the womb, which will help thee; Fear not, O Jacob, my servant; and thou, Jesurun, whom I have chosen.* Against the statue that cannot help his father (6:1), Isaiah sets the Maker who forms from the womb and truly helps.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 1, 'apocrypha', 'the-wisdom-of-solomon', 13, 16, 'extras', E'Wisdom of Solomon 13:16 — *For he provided for it that it might not fall, knowing that it was unable to help itself; for it is an image, and has need of help:* Abraham''s question whether the statue can help his father (6:1) is answered in the deuterocanon: the image cannot help itself, let alone anyone.'),
  -- thread: apocalypse-of-abraham-6-the-foolish-mind-of-the-idolater
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 5, 'canon', 'romans', 1, 22, 'free', E'Romans 1:22 — *Professing themselves to be wise, they became fools,* Terah, foolish in his mind for praising a god he carved (6:5), is Paul''s wise man turned fool by his own idols.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 5, 'canon', 'romans', 1, 23, 'free', E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* The folly Abraham exposes in 6:5 is the exchange of the living glory for a corruptible carved image.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 2, 'canon', 'isaiah', 44, 18, 'free', E'Isaiah 44:18 — *They have not known nor understood: for he hath shut their eyes, that they cannot see; and their hearts, that they cannot understand.* The spirit handed over to folly and ignorance (6:2) is Isaiah''s shut-eyed, uncomprehending heart of the idolater.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-6-stone-cannot-be-renewed',
       E'The stone-god that cannot be renewed',
       E'Abraham turns to his idol-maker father and names the lie outright: *O father Terah, whichever of these thou praisest as a god, thou art foolish in thy mind* (Apocalypse of Abraham 6:5) — for *if your god Merumath is changed or broken, he will not be renewed, because he is a stone* (6:7). It ain''t new. Joshua, generations later, names the very house this came out of: *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* (Joshua 24:2). The Psalm has already weighed Merumath and found him deaf: *Their idols are silver and gold, the work of men''s hands. They have mouths, but they speak not: eyes have they, but they see not* (Psalm 115:4-5) — *They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8). And the prophet calls the stock by its true name: *the stock is a doctrine of vanities* (Jeremiah 10:8). The young Abraham sees what the elders forgot: a god that cannot mend itself cannot mend you.',
       sv.verse_id, ev.verse_id, 'extras', 67125
  FROM _session253_aoa6_lookup sv, _session253_aoa6_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-6-barisat-hewn-from-the-tree',
       E'Barisat, the god hewn out of the living tree',
       E'Abraham traces Barisat back to the forest he came from: *But thy god Barisat, while he was still, before he had been prepared, rooted up upon the earth and was great and wonderful with the glory of branches and blossom, thou didst hew out with the axe, and by means of thy art he hath been made into a god* (Apocalypse of Abraham 6:10). This is Isaiah''s mockery of the idol-maker drawn to the life: *He heweth him down cedars, and taketh the cypress and the oak... he maketh a god, and worshippeth it; he maketh it a graven image, and falleth down thereto* (Isaiah 44:14-15). Jeremiah saw the same axe: *one cutteth a tree out of the forest, the work of the hands of the workman, with the axe* (Jeremiah 10:3). And the deuterocanon tells Barisat''s story almost word for word — the carpenter who *taking the very refuse among those which served to no use, being a crooked piece of wood... formed it by the skill of his understanding, and fashioned it to the image of a man* (Wisdom of Solomon 13:13). It ain''t new: a thing of branches and blossom, alive in the field, is killed by the axe and called a god.',
       sv.verse_id, ev.verse_id, 'extras', 67128
  FROM _session253_aoa6_lookup sv, _session253_aoa6_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=6 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-6-burnt-to-ashes-no-helper',
       E'Burnt to ashes, and no more — the god who cannot save',
       E'The speech ends where every idol ends: *he, Barisat himself, is burnt up by fire and reduced to ashes and is no more* (Apocalypse of Abraham 6:11) — and Abraham had already asked the question this answers: *How then can that which is made by him — manufactured statues — be a helper of my father?* (6:1). Isaiah feeds the same fire and weighs the same ash-heart: *He feedeth on ashes: a deceived heart hath turned him aside, that he cannot deliver his soul, nor say, Is there not a lie in my right hand?* (Isaiah 44:20). Habakkuk pronounces the woe: *What profiteth the graven image that the maker thereof hath graven it... to make dumb idols?* (Habakkuk 2:18). And the deuterocanon says plainly what Barisat could never do — the idol *was unable to help itself; for it is an image, and has need of help* (Wisdom of Solomon 13:16). It ain''t new: the made thing burns, but the One who *made thee, and formed thee from the womb* (Isaiah 44:2) is the living Elohim who alone can help.',
       sv.verse_id, ev.verse_id, 'extras', 67131
  FROM _session253_aoa6_lookup sv, _session253_aoa6_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=6 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-6-the-foolish-mind-of-the-idolater',
       E'Professing wisdom, the idolater becomes a fool',
       E'Abraham''s whole charge rests on one diagnosis of the mind: *whichever of these thou praisest as a god, thou art foolish in thy mind* (Apocalypse of Abraham 6:5), grieving that *the body then be subject to its soul, and the soul to the spirit, and the spirit to folly and ignorance* (6:2). Paul names this same descent of the heathen mind: *Professing themselves to be wise, they became fools* (Romans 1:22), who *changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man* (Romans 1:23). The prophet diagnoses the blinded craftsman: *They have not known nor understood: for he hath shut their eyes, that they cannot see; and their hearts, that they cannot understand* (Isaiah 44:18). It ain''t new: idolatry is first a darkening of the mind — the spirit handed over to folly — and Abraham, the youngest in the house, is the only one who has not been blinded.',
       sv.verse_id, ev.verse_id, 'extras', 67134
  FROM _session253_aoa6_lookup sv, _session253_aoa6_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=6 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-6-stone-cannot-be-renewed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Scripture itself records that Abraham''s rebuke in 6:5 was aimed at the very idolatry of Terah''s house.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-stone-cannot-be-renewed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* The stone Merumath of 6:7 is the Psalm''s dumb, blind idol, unable to renew even itself.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-stone-cannot-be-renewed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* Terah is made foolish (6:5) by the lifeless thing he trusts, exactly as the Psalm warns.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-stone-cannot-be-renewed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 10:8 — *But they are altogether brutish and foolish: the stock is a doctrine of vanities.* The broken stone that cannot be renewed (6:7) is Jeremiah''s vain stock, a doctrine of nothing.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-stone-cannot-be-renewed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-6-barisat-hewn-from-the-tree
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:14 — *He heweth him down cedars, and taketh the cypress and the oak, which he strengtheneth for himself among the trees of the forest: he planteth an ash, and the rain doth nourish it.* The living tree Abraham mourns in 6:10 is Isaiah''s forest cedar, nourished by rain before the axe.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-barisat-hewn-from-the-tree'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:15 — *Then shall it be for a man to burn: for he will take thereof, and warm himself; yea, he kindleth it, and baketh bread; yea, he maketh a god, and worshippeth it; he maketh it a graven image, and falleth down thereto.* The same wood that warms and bakes is hewn into Barisat the god (6:10), the prophet''s exact absurdity.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-barisat-hewn-from-the-tree'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 10:3 — *For the customs of the people are vain: for one cutteth a tree out of the forest, the work of the hands of the workman, with the axe.* Abraham''s axe in 6:10 is Jeremiah''s axe; the custom of cutting a god from a tree is one and the same vanity.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-barisat-hewn-from-the-tree'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 13:13 — *And taking the very refuse among those which served to no use, being a crooked piece of wood, and full of knots, has carved it diligently, when he had nothing else to do, and formed it by the skill of his understanding, and fashioned it to the image of a man;* Barisat made into a god by Terah''s art (6:10) is the carpenter''s refuse-wood shaped into a deity, the same witness in the deuterocanon.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-barisat-hewn-from-the-tree'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-6-burnt-to-ashes-no-helper
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:20 — *He feedeth on ashes: a deceived heart hath turned him aside, that he cannot deliver his soul, nor say, Is there not a lie in my right hand?* Barisat reduced to ashes (6:11) is the very ash the deceived heart feeds on, unable to deliver a single soul.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-burnt-to-ashes-no-helper'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Habakkuk 2:18 — *What profiteth the graven image that the maker thereof hath graven it; the molten image, and a teacher of lies, that the maker of his work trusteth therein, to make dumb idols?* Abraham''s burnt and profitless Barisat (6:11) is the prophet''s dumb idol that profits the maker nothing.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-burnt-to-ashes-no-helper'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:2 — *Thus saith Yahuah (LORD) that made thee, and formed thee from the womb, which will help thee; Fear not, O Jacob, my servant; and thou, Jesurun, whom I have chosen.* Against the statue that cannot help his father (6:1), Isaiah sets the Maker who forms from the womb and truly helps.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-burnt-to-ashes-no-helper'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 13:16 — *For he provided for it that it might not fall, knowing that it was unable to help itself; for it is an image, and has need of help:* Abraham''s question whether the statue can help his father (6:1) is answered in the deuterocanon: the image cannot help itself, let alone anyone.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-burnt-to-ashes-no-helper'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-6-the-foolish-mind-of-the-idolater
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:22 — *Professing themselves to be wise, they became fools,* Terah, foolish in his mind for praising a god he carved (6:5), is Paul''s wise man turned fool by his own idols.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-the-foolish-mind-of-the-idolater'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* The folly Abraham exposes in 6:5 is the exchange of the living glory for a corruptible carved image.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-the-foolish-mind-of-the-idolater'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:18 — *They have not known nor understood: for he hath shut their eyes, that they cannot see; and their hearts, that they cannot understand.* The spirit handed over to folly and ignorance (6:2) is Isaiah''s shut-eyed, uncomprehending heart of the idolater.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-the-foolish-mind-of-the-idolater'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

