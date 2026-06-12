-- ----- fragment: minion_thewisdomofsolomon_17.sql (session253 the-wisdom-of-solomon 17) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis17 (view _session253_wis17_lookup). Sort band base 58400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-17-darkness-felt
  ('apocrypha', 'the-wisdom-of-solomon', 17, 2, 'canon', 'exodus', 10, 21, 'free', E'Exodus 10:21 — *And Yahuah (LORD) said unto Moses, Stretch out thine hand toward heaven, that there may be darkness over the land of Egypt, even darkness which may be felt.* The plague Wisdom 17:2 expounds: a darkness so dense it imprisons, the bonds of a long night.'),
  ('apocrypha', 'the-wisdom-of-solomon', 17, 5, 'canon', 'exodus', 10, 22, 'free', E'Exodus 10:22 — *And Moses stretched forth his hand toward heaven; and there was a thick darkness in all the land of Egypt three days* — the thick night against which no fire nor star could give light (Wisdom 17:5).'),
  ('apocrypha', 'the-wisdom-of-solomon', 17, 2, 'canon', 'psalms', 105, 28, 'free', E'Psalm 105:28 — *He sent darkness, and made it dark; and they rebelled not against his word.* The Psalm names Yahuah''s own hand behind the night that fettered Egypt in Wisdom 17:2.'),
  -- thread: wisdom-17-light-in-dwellings
  ('apocrypha', 'the-wisdom-of-solomon', 17, 20, 'canon', 'exodus', 10, 23, 'free', E'Exodus 10:23 — *They saw not one another, neither rose any from his place for three days: but all the children of Yashar''el (Israel) had light in their dwellings.* The very separation Wisdom 17:20 frames — the whole world shined for the righteous while night held the oppressor.'),
  ('apocrypha', 'the-wisdom-of-solomon', 17, 20, 'canon', 'isaiah', 60, 1, 'free', E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* The clear light over the holy nation (Wisdom 17:20) is the prophetic light risen upon redeemed Yashar''el.'),
  ('apocrypha', 'the-wisdom-of-solomon', 17, 21, 'canon', 'isaiah', 60, 2, 'free', E'Isaiah 60:2 — *For, behold, the darkness shall cover the earth, and gross darkness the people: but Yahuah (LORD) shall arise upon thee, and his glory shall be seen upon thee.* The heavy night that received the wicked (Wisdom 17:21) is the gross darkness from which the elect alone are spared.'),
  -- thread: wisdom-17-chain-of-darkness
  ('apocrypha', 'the-wisdom-of-solomon', 17, 17, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s everlasting chains under darkness are Wisdom 17:17''s one chain of darkness that bound every man of Egypt.'),
  ('apocrypha', 'the-wisdom-of-solomon', 17, 16, 'enoch', '1-enoch', 10, 4, 'extras', E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ’Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The bound watcher of Enoch is the prison without iron bars (Wisdom 17:16) that Jude 6 inherits.'),
  ('apocrypha', 'the-wisdom-of-solomon', 17, 17, 'enoch', '1-enoch', 10, 5, 'extras', E'1 Enoch 10:5 — *And place upon him rough and jagged rocks, and cover him with darkness, and let him abide there for ever, and cover his face that he may not see light.* Azâzêl covered in darkness till the judgment matches the one chain of darkness from which the prisoners of Wisdom 17:17 could not escape.'),
  -- thread: wisdom-17-loved-darkness
  ('apocrypha', 'the-wisdom-of-solomon', 17, 11, 'canon', 'john', 3, 19, 'free', E'John 3:19 — *And this is the condemnation, that light is come into the world, and men loved darkness rather than light, because their deeds were evil.* The wickedness condemned by her own witness (Wisdom 17:11) is the love of darkness that is its own judgment.'),
  ('apocrypha', 'the-wisdom-of-solomon', 17, 11, 'canon', 'john', 3, 20, 'free', E'John 3:20 — *For every one that doeth evil hateth the light, neither cometh to the light, lest his deeds should be reproved.* The conscience pressed and forecasting grievous things (Wisdom 17:11) flees the light lest its deeds be reproved.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-17-darkness-felt',
       E'The darkness which may be felt',
       E'Wisdom unfolds the ninth plague as a parable of the wicked heart: *For when unrighteous men thought to oppress the holy nation; they being shut up in their houses, the prisoners of darkness, and fettered with the bonds of a long night, lay there exiled from the eternal providence.* (the Wisdom of Solomon 17:2) — and again, *No power of the fire might give them light: neither could the bright flames of the stars endure to lighten that horrible night.* (the Wisdom of Solomon 17:5). This is the very plague of Exodus: *And Yahuah (LORD) said unto Moses, Stretch out thine hand toward heaven, that there may be darkness over the land of Egypt, even darkness which may be felt.* (Exodus 10:21) — a dark so thick it was tangible, *And Moses stretched forth his hand toward heaven; and there was a thick darkness in all the land of Egypt three days* (Exodus 10:22). The Psalmist names the same hand at work: *He sent darkness, and made it dark; and they rebelled not against his word.* (Psalm 105:28). It Ain''t New — the deuterocanon is reading Torah, and the judgment is a real, felt thing.',
       sv.verse_id, ev.verse_id, 'extras', 58400
  FROM _session253_wis17_lookup sv, _session253_wis17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=17 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-17-light-in-dwellings',
       E'But the holy nation had light',
       E'Over against the imprisoned Egyptians, Wisdom sets the shining world of the righteous: *For the whole world shined with clear light, and none were hindered in their labour:* (the Wisdom of Solomon 17:20). Torah draws the same line of separation: *They saw not one another, neither rose any from his place for three days: but all the children of Yashar''el (Israel) had light in their dwellings.* (Exodus 10:23). The prophet lifts this election into the age to come — darkness for the nations, but light arising upon the chosen: *For, behold, the darkness shall cover the earth, and gross darkness the people: but Yahuah (LORD) shall arise upon thee, and his glory shall be seen upon thee.* (Isaiah 60:2), and *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* (Isaiah 60:1). The separating mercy in judgment that kept Yashar''el in light is the same that will arise upon her at the end.',
       sv.verse_id, ev.verse_id, 'extras', 58403
  FROM _session253_wis17_lookup sv, _session253_wis17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=17 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-17-chain-of-darkness',
       E'Bound with one chain of darkness',
       E'Wisdom''s most haunting image: every Egyptian, whatever his calling, dragged into a shared bondage — *For whether he were husbandman, or shepherd, or a labourer in the field, he was overtaken, and endured that necessity, which could not be avoided: for they were all bound with one chain of darkness.* (the Wisdom of Solomon 17:17), shut up *in a prison without iron bars* (the Wisdom of Solomon 17:16). The apostle Jude takes up the very phrase for the fallen watchers: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6). Jude''s source stands now restored and live — the binding of Azâzêl: *And again Yahuah (God) said to Raphael: ’Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* (1 Enoch 10:4), *and cover him with darkness, and let him abide there for ever, and cover his face that he may not see light.* (1 Enoch 10:5). One chain of darkness binds the wicked of Egypt, the rebel angels, and the unrighteous still — It Ain''t New.',
       sv.verse_id, ev.verse_id, 'extras', 58406
  FROM _session253_wis17_lookup sv, _session253_wis17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=17 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-17-loved-darkness',
       E'Wickedness condemned by her own witness',
       E'Wisdom turns the outward plague inward — the darkness is the conscience of the wicked: *For wickedness, condemned by her own witness, is very timorous, and being pressed with conscience, always forecasteth grievous things.* (the Wisdom of Solomon 17:11), and the heavy night is *an image of that darkness which should afterward receive them* (the Wisdom of Solomon 17:21). The Master names the same self-judgment of those who flee the light: *And this is the condemnation, that light is come into the world, and men loved darkness rather than light, because their deeds were evil.* (John 3:19), *For every one that doeth evil hateth the light, neither cometh to the light, lest his deeds should be reproved.* (John 3:20). Conscience condemns before the throne does; the darkness men love becomes the darkness that receives them.',
       sv.verse_id, ev.verse_id, 'extras', 58409
  FROM _session253_wis17_lookup sv, _session253_wis17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=17 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-17-darkness-felt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 10:21 — *And Yahuah (LORD) said unto Moses, Stretch out thine hand toward heaven, that there may be darkness over the land of Egypt, even darkness which may be felt.* The plague Wisdom 17:2 expounds: a darkness so dense it imprisons, the bonds of a long night.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-darkness-felt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 10:22 — *And Moses stretched forth his hand toward heaven; and there was a thick darkness in all the land of Egypt three days* — the thick night against which no fire nor star could give light (Wisdom 17:5).'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-darkness-felt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 105:28 — *He sent darkness, and made it dark; and they rebelled not against his word.* The Psalm names Yahuah''s own hand behind the night that fettered Egypt in Wisdom 17:2.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-darkness-felt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-17-light-in-dwellings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 10:23 — *They saw not one another, neither rose any from his place for three days: but all the children of Yashar''el (Israel) had light in their dwellings.* The very separation Wisdom 17:20 frames — the whole world shined for the righteous while night held the oppressor.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-light-in-dwellings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=10 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* The clear light over the holy nation (Wisdom 17:20) is the prophetic light risen upon redeemed Yashar''el.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-light-in-dwellings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 60:2 — *For, behold, the darkness shall cover the earth, and gross darkness the people: but Yahuah (LORD) shall arise upon thee, and his glory shall be seen upon thee.* The heavy night that received the wicked (Wisdom 17:21) is the gross darkness from which the elect alone are spared.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-light-in-dwellings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-17-chain-of-darkness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s everlasting chains under darkness are Wisdom 17:17''s one chain of darkness that bound every man of Egypt.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-chain-of-darkness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ’Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The bound watcher of Enoch is the prison without iron bars (Wisdom 17:16) that Jude 6 inherits.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-chain-of-darkness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=16
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:5 — *And place upon him rough and jagged rocks, and cover him with darkness, and let him abide there for ever, and cover his face that he may not see light.* Azâzêl covered in darkness till the judgment matches the one chain of darkness from which the prisoners of Wisdom 17:17 could not escape.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-chain-of-darkness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=17
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-17-loved-darkness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 3:19 — *And this is the condemnation, that light is come into the world, and men loved darkness rather than light, because their deeds were evil.* The wickedness condemned by her own witness (Wisdom 17:11) is the love of darkness that is its own judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-loved-darkness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 3:20 — *For every one that doeth evil hateth the light, neither cometh to the light, lest his deeds should be reproved.* The conscience pressed and forecasting grievous things (Wisdom 17:11) flees the light lest its deeds be reproved.'
  FROM cross_reference_threads t, cross_references x, _session253_wis17_lookup sv, _session253_wis17_lookup tv
 WHERE t.slug='wisdom-17-loved-darkness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=17 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

