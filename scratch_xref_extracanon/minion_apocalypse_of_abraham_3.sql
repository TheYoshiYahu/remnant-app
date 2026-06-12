-- ----- fragment: minion_apocalypseofabraham_03.sql (session253 apocalypse-of-abraham 3) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa3 (view _session253_aoa3_lookup). Sort band base 67050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-3-fathers-served-other-gods
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 2, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names Terah by name as the idol-server, the very father whose evil deed Abraham questions in his heart at 3:2.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 3, 'apocrypha', 'the-wisdom-of-solomon', 15, 17, 'extras', E'Wisdom of Solomon 15:17 — *For being mortal, he works a dead thing with wicked hands: for he himself is better than the things which he worshippeth: whereas he lived once, but they never.* Wisdom states Abraham''s own riddle at 3:3 — the maker is greater than the made, so it is the gods who ought to worship Terah, not Terah them.'),
  -- thread: apocalypse-of-abraham-3-the-idol-that-cannot-rise
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 5, 'canon', 'isaiah', 46, 7, 'free', E'Isaiah 46:7 — *They bear him upon the shoulder, they carry him, and set him in his place, and he standeth; from his place shall he not remove: yea, one shall cry unto him, yet can he not answer, nor save him out of his trouble.* Isaiah''s god that cannot move from its place is Merumath who fell and could not rise until Abraham and Terah lifted him (3:5).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 5, 'apocrypha', 'the-wisdom-of-solomon', 13, 16, 'extras', E'Wisdom of Solomon 13:16 — *For he provided for it that it might not fall, knowing that it was unable to help itself; for it is an image, and has need of help.* The maker must keep the idol from falling because it cannot help itself — exactly Terah propping the headless Merumath at 3:5.'),
  -- thread: apocalypse-of-abraham-3-broken-gods-cannot-save
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 6, 'canon', 'isaiah', 44, 9, 'free', E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The graven image is vanity and cannot profit — the five broken gods of 3:6 that could neither help themselves nor hurt the ass.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 6, 'canon', 'isaiah', 44, 10, 'free', E'Isaiah 44:10 — *Who hath formed a god, or molten a graven image that is profitable for nothing?* Isaiah asks why a man would form a god profitable for nothing — the very gods broken to pieces from the ass and helpless in the river at 3:6.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 6, 'canon', 'psalms', 115, 8, 'free', E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* The makers become as lifeless as the broken fragments of 3:6 that could not even rise from the river.'),
  -- thread: apocalypse-of-abraham-3-can-a-stone-hear-prayer
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 7, 'canon', 'isaiah', 44, 17, 'free', E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* A man prays "Deliver me" to carved wood — the empty prayer Abraham exposes when he asks how a stone could hear a man''s prayer at 3:7.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 7, 'canon', 'jeremiah', 10, 5, 'free', E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* The idol cannot do good or evil and must be carried — so it cannot rescue a man or reward him, the very thing Abraham concludes at 3:7.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 7, 'apocrypha', 'the-wisdom-of-solomon', 13, 10, 'extras', E'Wisdom of Solomon 13:10 — *But miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver, to shew art in, and resemblances of beasts, or a stone good for nothing, the work of an ancient hand.* "A stone good for nothing" is precisely the stone Merumath whose prayer-hearing power Abraham denies at 3:7.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-3-fathers-served-other-gods',
       E'The fathers served other gods — Terah the idol-maker',
       E'The boy Abraham walks perplexed, his heart troubled at his father''s trade: *And I said in my heart: "What evil deed is this that my father is doing? Is not he, rather, the god of his gods, since they come into existence through his chisels and lathes, and his wisdom, and is it not rather fitting that they should worship my father, since they are his work?"* (Apocalypse of Abraham 3:2-3). It ain''t new — the Tanakh names this very house. *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* (Joshua 24:2) — Terah is named, the idol-house Abraham is being called out of. And the Apocrypha turns the same lathe: *For being mortal, he works a dead thing with wicked hands: for he himself is better than the things which he worshippeth: whereas he lived once, but they never* (Wisdom of Solomon 15:17) — the maker is greater than the made, which is Abraham''s own riddle on the page.',
       sv.verse_id, ev.verse_id, 'extras', 67050
  FROM _session253_aoa3_lookup sv, _session253_aoa3_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=3 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-3-the-idol-that-cannot-rise',
       E'Merumath fell and could not rise — the god that needs help',
       E'Abraham watches the stone god collapse: *Behold, Merumath fell and could not rise in his own temple, nor could I, by myself, move him until my father came, and the two of us moved him; and as we were thus too weak, his head fell from him, and he set it upon another stone of another god, which he had made without head* (Apocalypse of Abraham 3:5). The prophets mocked this exact helplessness. *They bear him upon the shoulder, they carry him, and set him in his place, and he standeth; from his place shall he not remove: yea, one shall cry unto him, yet can he not answer, nor save him out of his trouble* (Isaiah 46:7) — the god must be carried, cannot move itself. And the Apocrypha names the absurdity straight: *For he provided for it that it might not fall, knowing that it was unable to help itself; for it is an image, and has need of help* (Wisdom of Solomon 13:16) — the maker must prop up the god that cannot prop up itself, which is Merumath fallen and headless in his own temple.',
       sv.verse_id, ev.verse_id, 'extras', 67053
  FROM _session253_aoa3_lookup sv, _session253_aoa3_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=3 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-3-broken-gods-cannot-save',
       E'Broken gods that cannot help themselves nor hurt the ass',
       E'The five gods shatter and the ass walks free: *And the other five gods were broken in pieces down from the ass, which were able neither to help themselves, nor to hurt the ass, because it had broken them to pieces; nor did their broken fragments come up out of the river* (Apocalypse of Abraham 3:6). This is the prophets'' whole indictment. *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed* (Isaiah 44:9); *Who hath formed a god, or molten a graven image that is profitable for nothing?* (Isaiah 44:10). The psalm seals it: *They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8) — a beast of burden out-survives the gods it carries, for they could neither help themselves nor rise from the river.',
       sv.verse_id, ev.verse_id, 'extras', 67056
  FROM _session253_aoa3_lookup sv, _session253_aoa3_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-3-can-a-stone-hear-prayer',
       E'Can a stone god rescue a man or hear his prayer?',
       E'Abraham reasons to the root: *And I said in my heart: "If this be so, how can Merumath, my father''s god, having the head of another stone, and himself being made of another stone, rescue a man, or hear a man''s prayer and reward him?"* (Apocalypse of Abraham 3:7). Isaiah had already exposed the prayer that goes nowhere. *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god* (Isaiah 44:17) — a man prays "Deliver me" to wood he carved. *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good* (Jeremiah 10:5) — they cannot answer, cannot save, cannot reward. The Apocrypha joins the verdict: *But miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver, to shew art in, and resemblances of beasts, or a stone good for nothing, the work of an ancient hand* (Wisdom of Solomon 13:10) — "a stone good for nothing," which is the stone Merumath Abraham now refuses.',
       sv.verse_id, ev.verse_id, 'extras', 67059
  FROM _session253_aoa3_lookup sv, _session253_aoa3_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=3 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-3-fathers-served-other-gods
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names Terah by name as the idol-server, the very father whose evil deed Abraham questions in his heart at 3:2.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-fathers-served-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 15:17 — *For being mortal, he works a dead thing with wicked hands: for he himself is better than the things which he worshippeth: whereas he lived once, but they never.* Wisdom states Abraham''s own riddle at 3:3 — the maker is greater than the made, so it is the gods who ought to worship Terah, not Terah them.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-fathers-served-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=15 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-3-the-idol-that-cannot-rise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 46:7 — *They bear him upon the shoulder, they carry him, and set him in his place, and he standeth; from his place shall he not remove: yea, one shall cry unto him, yet can he not answer, nor save him out of his trouble.* Isaiah''s god that cannot move from its place is Merumath who fell and could not rise until Abraham and Terah lifted him (3:5).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-the-idol-that-cannot-rise'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 13:16 — *For he provided for it that it might not fall, knowing that it was unable to help itself; for it is an image, and has need of help.* The maker must keep the idol from falling because it cannot help itself — exactly Terah propping the headless Merumath at 3:5.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-the-idol-that-cannot-rise'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-3-broken-gods-cannot-save
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The graven image is vanity and cannot profit — the five broken gods of 3:6 that could neither help themselves nor hurt the ass.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-broken-gods-cannot-save'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:10 — *Who hath formed a god, or molten a graven image that is profitable for nothing?* Isaiah asks why a man would form a god profitable for nothing — the very gods broken to pieces from the ass and helpless in the river at 3:6.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-broken-gods-cannot-save'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* The makers become as lifeless as the broken fragments of 3:6 that could not even rise from the river.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-broken-gods-cannot-save'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-3-can-a-stone-hear-prayer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* A man prays "Deliver me" to carved wood — the empty prayer Abraham exposes when he asks how a stone could hear a man''s prayer at 3:7.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-can-a-stone-hear-prayer'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* The idol cannot do good or evil and must be carried — so it cannot rescue a man or reward him, the very thing Abraham concludes at 3:7.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-can-a-stone-hear-prayer'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 13:10 — *But miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver, to shew art in, and resemblances of beasts, or a stone good for nothing, the work of an ancient hand.* "A stone good for nothing" is precisely the stone Merumath whose prayer-hearing power Abraham denies at 3:7.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-can-a-stone-hear-prayer'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

