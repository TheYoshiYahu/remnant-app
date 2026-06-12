-- ----- fragment: minion_1adameve_64.sql (session253 1-adam-eve 64) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch64. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae64 (view _session253_1ae64_lookup). Sort band base 65575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae64_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-64-earthly-bread
  ('adam-eve-conflict', '1-adam-eve', 64, 4, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* Adam''s fear of the figs in 1 Adam & Eve 64:4 is the cursed ground first tasted — earthly food that burdens the flesh he was not made to bear.'),
  ('adam-eve-conflict', '1-adam-eve', 64, 4, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* To eat the fig is to begin returning to the dust — the very dread that grips Adam and Eve in 1 Adam & Eve 64:4.'),
  ('adam-eve-conflict', '1-adam-eve', 64, 1, 'canon', 'genesis', 1, 29, 'free', E'Genesis 1:29 — *And Elohim (God) said, Behold, I have given you every herb bearing seed, which is upon the face of all the earth, and every tree, in the which is the fruit of a tree yielding seed; to you it shall be for meat.* The fig Yahuah hands them in 1 Adam & Eve 64:1 is the very fruit of the tree appointed for food from the beginning — mercy, not curse, in the gift.'),
  ('adam-eve-conflict', '1-adam-eve', 64, 4, 'jubilees', 'jubilees', 3, 25, 'extras', E'Jubilees 3:25 — *And to Adam also He said, “Because you have hearkened to the voice of your wife, and have eaten of the tree of which I commanded you that you should not eat thereof, cursed be the ground for your sake: thorns and thistles shall it bring forth to you, and you shall eat your bread in the sweat of your face, till you return to the earth from whence you were taken; for earth you are, and to earth shall you return.”* Jubilees pronounces the same curse of earthly bread that Adam now begins to taste in 1 Adam & Eve 64:4 — the restored library tells one primeval story.'),
  -- thread: 1-adam-eve-64-angel-sent-in-pity
  ('adam-eve-conflict', '1-adam-eve', 64, 5, 'canon', 'psalms', 103, 13, 'free', E'Psalm 103:13 — *Like as a father pitieth his children, so Yahuah (LORD) pitieth them that fear him.* The pity that moves Elohim to send His angel in 1 Adam & Eve 64:5 is the fatherly compassion of Yahuah toward those who fear Him.'),
  ('adam-eve-conflict', '1-adam-eve', 64, 6, 'canon', 'psalms', 103, 14, 'free', E'Psalm 103:14 — *For he knoweth our frame; he remembereth that we are dust.* The angel''s word that Adam is *now animal flesh and cannot subsist without food and drink* (64:6) is Yahuah remembering the frame of dust He Himself formed.'),
  ('adam-eve-conflict', '1-adam-eve', 64, 5, 'canon', '1-kings', 19, 7, 'free', E'1 Kings 19:7 — *And the angel of Yahuah (LORD) came again the second time, and touched him, and said, Arise and eat; because the journey is too great for thee.* As an angel was sent to feed the fainting Elijah, so an angel is sent in pity to feed Adam and Eve lest they perish in 1 Adam & Eve 64:5.'),
  ('adam-eve-conflict', '1-adam-eve', 64, 6, 'canon', 'matthew', 4, 11, 'free', E'Matthew 4:11 — *Then the devil leaveth him, and, behold, angels came and ministered unto him.* The Messiah''s wilderness fast ends as Adam''s does — with the ministering angel sent to strengthen the body — the seed of the woman tended by the same heavenly servants who fed the first man in 1 Adam & Eve 64:6.'),
  ('adam-eve-conflict', '1-adam-eve', 64, 5, 'canon', 'hebrews', 1, 14, 'free', E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* The angel Elohim sends to Adam and Eve in 1 Adam & Eve 64:5 does the very office Hebrews names — a ministering spirit serving the heirs of the promised salvation.'),
  -- thread: 1-adam-eve-64-bread-and-blood-renewed
  ('adam-eve-conflict', '1-adam-eve', 64, 7, 'canon', 'psalms', 78, 25, 'free', E'Psalm 78:25 — *Man did eat angels’ food: he sent them meat to the full.* The figs into which Elohim put *a mixture as of savory bread and blood* (64:7) are angels'' food given to the full, as the manna was to Yashar''el.'),
  ('adam-eve-conflict', '1-adam-eve', 64, 8, 'canon', 'exodus', 16, 4, 'free', E'Exodus 16:4 — *Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no.* The heaven-blessed figs that renew themselves in 1 Adam & Eve 64:8 are of one kind with the manna Yahuah rained from heaven.'),
  ('adam-eve-conflict', '1-adam-eve', 64, 8, 'canon', 'exodus', 16, 18, 'free', E'Exodus 16:18 — *And when they did mete it with an omer, he that gathered much had nothing over, and he that gathered little had no lack; they gathered every man according to his eating.* The figs that become whole again after they satisfy their hunger (64:8) are bread that exactly suffices and never fails, as the manna neither lacked nor overflowed.'),
  ('adam-eve-conflict', '1-adam-eve', 64, 8, 'canon', 'psalms', 104, 28, 'free', E'Psalm 104:28 — *That thou givest them they gather: thou openest thine hand, they are filled with good.* The figs renewed by *the power of Elohim* in 1 Adam & Eve 64:8 are the open hand of the Provider, filling His creatures with good.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae64_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae64_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-64-earthly-bread',
       E'The first earthly food — the curse of the ground tasted',
       E'Adam and Eve, who *were not accustomed to eat earthly food*, fear the figs: *They were afraid that if they ate, their stomach would be burdened and their flesh thickened, and their hearts would take to liking earthly food* (1 Adam & Eve 64:4). This is the curse of the ground felt on the very first days outside the garden — *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17), *In the sweat of thy face shalt thou eat bread* (Genesis 3:19). Yet the same Yahuah who cursed the ground had already granted its fruit for food — *I have given you every herb bearing seed... to you it shall be for meat* (Genesis 1:29) — and after the flood widened the grant: *Every moving thing that liveth shall be meat for you* (Genesis 9:3). Jubilees carries the identical sentence of the curse: *thorns and thistles shall it bring forth to you, and you shall eat your bread in the sweat of your face* (Jubilees 3:25). It ain''t new — the dread of earthly bread is the dread of mortality itself, the dust to which Adam must return.',
       sv.verse_id, ev.verse_id, 'extras', 65575
  FROM _session253_1ae64_lookup sv, _session253_1ae64_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=64 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=64 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-64-angel-sent-in-pity',
       E'The angel sent in pity — ''eat, and strengthen your bodies''',
       E'*But while they were thus seated, Elohim (God), out of pity for them, sent them His angel, so they wouldn''t perish of hunger and thirst* (1 Adam & Eve 64:5), and the angel said *eat, therefore, and strengthen your bodies; for you are now animal flesh and cannot subsist without food and drink* (1 Adam & Eve 64:6). This is the Father''s tenderness toward dust — *Like as a father pitieth his children, so Yahuah (LORD) pitieth them that fear him* (Psalm 103:13), *For he knoweth our frame; he remembereth that we are dust* (Psalm 103:14). The ministering angel who feeds the fainting saint is no new thing: to Elijah under the juniper an angel came twice — *Arise and eat; because the journey is too great for thee* (1 Kings 19:7) — and to the Messiah, after His forty-day fast in the wilderness, *angels came and ministered unto him* (Matthew 4:11). Such is their office: *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* (Hebrews 1:14). The same mercy that fed Adam feeds the seed of the woman down to the end.',
       sv.verse_id, ev.verse_id, 'extras', 65578
  FROM _session253_1ae64_lookup sv, _session253_1ae64_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=64 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=64 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-64-bread-and-blood-renewed',
       E'Bread and blood put into the figs — and the figs made whole again',
       E'*Then Adam and Eve took the figs and began to eat of them. But Elohim (God) had put into them a mixture as of savory bread and blood* (1 Adam & Eve 64:7), and what they left over *by the power of Elohim (God), the figs became whole again, because Elohim (God) blessed them* (1 Adam & Eve 64:8). Here is bread from heaven that does not fail — the pattern of the manna, the *corn of heaven*: *Man did eat angels'' food: he sent them meat to the full* (Psalm 78:25). As Yahuah said in the wilderness, *Behold, I will rain bread from heaven for you* (Exodus 16:4), and *he that gathered much had nothing over, and he that gathered little had no lack* (Exodus 16:18) — provision that exactly suffices and is renewed. It is the open hand of the Provider: *thou openest thine hand, they are filled with good* (Psalm 104:28). The blessed fig that becomes whole again foreshadows the Bread that the Messiah multiplied and that perishes not — Yahuah feeds His own from the first day to the last, and *it ain''t new*.',
       sv.verse_id, ev.verse_id, 'extras', 65581
  FROM _session253_1ae64_lookup sv, _session253_1ae64_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=64 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=64 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-64-earthly-bread
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* Adam''s fear of the figs in 1 Adam & Eve 64:4 is the cursed ground first tasted — earthly food that burdens the flesh he was not made to bear.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae64_lookup sv, _session253_1ae64_lookup tv
 WHERE t.slug='1-adam-eve-64-earthly-bread'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=64 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* To eat the fig is to begin returning to the dust — the very dread that grips Adam and Eve in 1 Adam & Eve 64:4.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae64_lookup sv, _session253_1ae64_lookup tv
 WHERE t.slug='1-adam-eve-64-earthly-bread'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=64 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:29 — *And Elohim (God) said, Behold, I have given you every herb bearing seed, which is upon the face of all the earth, and every tree, in the which is the fruit of a tree yielding seed; to you it shall be for meat.* The fig Yahuah hands them in 1 Adam & Eve 64:1 is the very fruit of the tree appointed for food from the beginning — mercy, not curse, in the gift.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae64_lookup sv, _session253_1ae64_lookup tv
 WHERE t.slug='1-adam-eve-64-earthly-bread'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=64 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 3:25 — *And to Adam also He said, “Because you have hearkened to the voice of your wife, and have eaten of the tree of which I commanded you that you should not eat thereof, cursed be the ground for your sake: thorns and thistles shall it bring forth to you, and you shall eat your bread in the sweat of your face, till you return to the earth from whence you were taken; for earth you are, and to earth shall you return.”* Jubilees pronounces the same curse of earthly bread that Adam now begins to taste in 1 Adam & Eve 64:4 — the restored library tells one primeval story.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae64_lookup sv, _session253_1ae64_lookup tv
 WHERE t.slug='1-adam-eve-64-earthly-bread'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=64 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-64-angel-sent-in-pity
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 103:13 — *Like as a father pitieth his children, so Yahuah (LORD) pitieth them that fear him.* The pity that moves Elohim to send His angel in 1 Adam & Eve 64:5 is the fatherly compassion of Yahuah toward those who fear Him.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae64_lookup sv, _session253_1ae64_lookup tv
 WHERE t.slug='1-adam-eve-64-angel-sent-in-pity'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=64 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 103:14 — *For he knoweth our frame; he remembereth that we are dust.* The angel''s word that Adam is *now animal flesh and cannot subsist without food and drink* (64:6) is Yahuah remembering the frame of dust He Himself formed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae64_lookup sv, _session253_1ae64_lookup tv
 WHERE t.slug='1-adam-eve-64-angel-sent-in-pity'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=64 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 19:7 — *And the angel of Yahuah (LORD) came again the second time, and touched him, and said, Arise and eat; because the journey is too great for thee.* As an angel was sent to feed the fainting Elijah, so an angel is sent in pity to feed Adam and Eve lest they perish in 1 Adam & Eve 64:5.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae64_lookup sv, _session253_1ae64_lookup tv
 WHERE t.slug='1-adam-eve-64-angel-sent-in-pity'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=64 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 4:11 — *Then the devil leaveth him, and, behold, angels came and ministered unto him.* The Messiah''s wilderness fast ends as Adam''s does — with the ministering angel sent to strengthen the body — the seed of the woman tended by the same heavenly servants who fed the first man in 1 Adam & Eve 64:6.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae64_lookup sv, _session253_1ae64_lookup tv
 WHERE t.slug='1-adam-eve-64-angel-sent-in-pity'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=64 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* The angel Elohim sends to Adam and Eve in 1 Adam & Eve 64:5 does the very office Hebrews names — a ministering spirit serving the heirs of the promised salvation.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae64_lookup sv, _session253_1ae64_lookup tv
 WHERE t.slug='1-adam-eve-64-angel-sent-in-pity'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=64 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-64-bread-and-blood-renewed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 78:25 — *Man did eat angels’ food: he sent them meat to the full.* The figs into which Elohim put *a mixture as of savory bread and blood* (64:7) are angels'' food given to the full, as the manna was to Yashar''el.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae64_lookup sv, _session253_1ae64_lookup tv
 WHERE t.slug='1-adam-eve-64-bread-and-blood-renewed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=64 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 16:4 — *Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no.* The heaven-blessed figs that renew themselves in 1 Adam & Eve 64:8 are of one kind with the manna Yahuah rained from heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae64_lookup sv, _session253_1ae64_lookup tv
 WHERE t.slug='1-adam-eve-64-bread-and-blood-renewed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=64 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 16:18 — *And when they did mete it with an omer, he that gathered much had nothing over, and he that gathered little had no lack; they gathered every man according to his eating.* The figs that become whole again after they satisfy their hunger (64:8) are bread that exactly suffices and never fails, as the manna neither lacked nor overflowed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae64_lookup sv, _session253_1ae64_lookup tv
 WHERE t.slug='1-adam-eve-64-bread-and-blood-renewed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=64 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 104:28 — *That thou givest them they gather: thou openest thine hand, they are filled with good.* The figs renewed by *the power of Elohim* in 1 Adam & Eve 64:8 are the open hand of the Provider, filling His creatures with good.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae64_lookup sv, _session253_1ae64_lookup tv
 WHERE t.slug='1-adam-eve-64-bread-and-blood-renewed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=64 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

