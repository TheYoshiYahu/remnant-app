-- ----- fragment: minion_jubilees_40.sql (session251 jubilees 40) -----
-- Source anchor: jubilees/jubilees ch40. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju40 (view _session251_ju40_lookup). Sort band base 53975, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju40_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-40-pharaoh-two-dreams
  ('jubilees', 'jubilees', 40, 1, 'canon', 'genesis', 41, 8, 'free', E'Genesis 41:8 — *And it came to pass in the morning that his spirit was troubled; and he sent and called for all the magicians of Egypt, and all the wise men thereof: and Pharaoh told them his dream; but there was none that could interpret them unto Pharaoh.* Jubilees 40:1''s interpreters and magicians who “were not able to declare” the dream is Genesis 41:8 retold.'),
  ('jubilees', 'jubilees', 40, 2, 'canon', 'genesis', 41, 14, 'free', E'Genesis 41:14 — *Then Pharaoh sent and called Joseph, and they brought him hastily out of the dungeon: and he shaved himself, and changed his raiment, and came in unto Pharaoh.* The butler''s remembering and Joseph being brought “forth from the prison” in Jubilees 40:2 is Genesis 41:14.'),
  ('jubilees', 'jubilees', 40, 3, 'canon', 'genesis', 41, 26, 'free', E'Genesis 41:26 — *The seven good kine are seven years; and the seven good ears are seven years: the dream is one.* Jubilees 40:3 (“his two dreams were one… seven years… of plenty… seven years of famine”) is Joseph''s Genesis 41:26 interpretation in brief.'),
  ('jubilees', 'jubilees', 40, 3, 'canon', 'genesis', 41, 30, 'free', E'Genesis 41:30 — *And there shall arise after them seven years of famine; and all the plenty shall be forgotten in the land of Egypt; and the famine shall consume the land.* The “seven years of famine, such a famine as has not been” of Jubilees 40:3 is Genesis 41:30 word for word in substance.'),
  -- thread: jubilees-40-spirit-of-god-favour
  ('jubilees', 'jubilees', 40, 5, 'canon', 'genesis', 41, 38, 'free', E'Genesis 41:38 — *And Pharaoh said unto his servants, Can we find such a one as this is, a man in whom the Spirit of Elohim (God) is?* Jubilees 40:5''s “such a wise and discreet man… for the spirit of Yahuah (God) is with him” is Genesis 41:38 verbatim in sense.'),
  ('jubilees', 'jubilees', 40, 6, 'canon', 'genesis', 41, 40, 'free', E'Genesis 41:40 — *Thou shalt be over my house, and according unto thy word shall all my people be ruled: only in the throne will I be greater than thou.* Pharaoh''s words in Jubilees 40:6 (“made him ruler over all his house… Only on the throne shall I be greater than you”) are Genesis 41:40 exactly.'),
  ('jubilees', 'jubilees', 40, 6, 'canon', 'genesis', 41, 42, 'free', E'Genesis 41:42 — *And Pharaoh took off his ring from his hand, and put it upon Joseph’s hand, and arrayed him in vestures of fine linen, and put a gold chain about his neck.* The ring, the byssus garments, and the gold chain of Jubilees 40:6 are the regalia of Genesis 41:42.'),
  ('jubilees', 'jubilees', 40, 5, 'canon', 'acts', 7, 10, 'free', E'Acts 7:10 — *And delivered him out of all his afflictions, and gave him favour and wisdom in the sight of Pharaoh king of Egypt; and he made him governor over Egypt and all his house.* Stephen''s “favour and wisdom… governor over Egypt” gathers Jubilees 40:5 into the NT''s witness against Israel.'),
  -- thread: jubilees-40-joseph-uprightness
  ('jubilees', 'jubilees', 40, 8, 'jubilees', 'jubilees', 39, 11, 'extras', E'Jubilees 39:11 — *And the Egyptian saw the garment of Joseph and the broken door, and heard the words of his wife, and cast Joseph into prison… and Yahuah (God) gave Joseph favour in the sight of the chief of the prison guards and compassion before him, for he saw that Yahuah (God) was with him, and that Yahuah (God) made all that he did to prosper.* The upright Joseph of Jubilees 40:8 is the same man who kept his purity in Jubilees 39:11 — “Yahuah was with him” ties the pit to the throne.'),
  ('jubilees', 'jubilees', 40, 9, 'canon', 'genesis', 39, 23, 'free', E'Genesis 39:23 — *The keeper of the prison looked not to any thing that was under his hand; because Yahuah (LORD) was with him, and that which he did, Yahuah (LORD) made it to prosper.* Jubilees 40:9''s “Yahuah (God) was with him” is Genesis 39:23 carried from the prison into the palace.'),
  ('jubilees', 'jubilees', 40, 8, 'canon', 'deuteronomy', 16, 19, 'free', E'Deuteronomy 16:19 — *Thou shalt not wrest judgment; thou shalt not respect persons, neither take a gift: for a gift doth blind the eyes of the wise, and pervert the words of the righteous.* Joseph judging “in uprightness… no respect of persons… did not accept gifts” in Jubilees 40:8 keeps the Torah''s standard of judgment before Sinai gave it.'),
  -- thread: jubilees-40-exalted-from-pit-revealer
  ('jubilees', 'jubilees', 40, 10, 'canon', 'daniel', 2, 28, 'free', E'Daniel 2:28 — *But there is a Elohim (God) in heaven that revealeth secrets, and maketh known to the king Nebuchadnezzar what shall be in the latter days. Thy dream, and the visions of thy head upon thy bed, are these.* Joseph the dream-revealer of Jubilees 40 is the same type Daniel stands in — Elohim, not Egypt''s or Babylon''s wise men, reveals the secret.'),
  ('jubilees', 'jubilees', 40, 9, 'canon', 'psalms', 105, 19, 'free', E'Psalm 105:19 — *Until the time that his word came: the word of Yahuah (LORD) tried him.* Psalm 105 reads Joseph''s rise in Jubilees 40:9 as Yahuah''s own work, the pit and prison a trial until the appointed word came.'),
  ('jubilees', 'jubilees', 40, 9, 'canon', 'psalms', 105, 21, 'free', E'Psalm 105:21 — *He made him lord of his house, and ruler of all his substance.* The exaltation of Jubilees 40 (ruler over all Egypt) is Psalm 105:21 confessing Yahuah, not Pharaoh, as the one who made him lord.'),
  ('jubilees', 'jubilees', 40, 10, 'canon', 'genesis', 45, 7, 'free', E'Genesis 45:7 — *And Elohim (God) sent me before you to preserve you a posterity in the earth, and to save your lives by a great deliverance.* The point of Joseph''s exaltation in Jubilees 40 is salvation — the righteous one raised from the pit to save many alive, the Messiah pattern Genesis 45:7 names.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju40_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju40_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-40-pharaoh-two-dreams',
       E'Pharaoh''s two dreams, the one interpretation — the seven of plenty, the seven of famine',
       E'Jubilees opens the chapter exactly where Genesis does: *And in those days Pharaoh dreamed two dreams in one night concerning a famine which was to be in all the land, and he awoke from his sleep and called all the interpreters of dreams that were in Egypt, and magicians, and told them his two dreams, and they were not able to declare (them)* (Jubilees 40:1). The Egyptian wisdom is dumb before the dream — *And it came to pass in the morning that his spirit was troubled; and he sent and called for all the magicians of Egypt, and all the wise men thereof: and Pharaoh told them his dream; but there was none that could interpret them unto Pharaoh* (Genesis 41:8). Joseph alone declares that the doubled dream is one — *And he said before Pharaoh that his two dreams were one, and he said to him: “Seven years will come (in which there will be) plenty over all the land of Egypt, and after that seven years of famine, such a famine as has not been in all the land* (Jubilees 40:3) — which Genesis tells the same: *The seven good kine are seven years; and the seven good ears are seven years: the dream is one* (Genesis 41:26). It ain''t new: Jubilees is retelling Genesis 41 line for line.',
       sv.verse_id, ev.verse_id, 'extras', 53975
  FROM _session251_ju40_lookup sv, _session251_ju40_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=40 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=40 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-40-spirit-of-god-favour',
       E'The Spirit of Elohim is with him — favour before Pharaoh, set over all Egypt',
       E'Jubilees names what made Joseph wise where the magicians failed: *And Yahuah (God) gave Joseph favour and mercy in the eyes of Pharaoh, and Pharaoh said to his servants: “We shall not find such a wise and discreet man as this man, for the spirit of Yahuah (God) is with him* (Jubilees 40:5). Genesis says it the same way: *And Pharaoh said unto his servants, Can we find such a one as this is, a man in whom the Spirit of Elohim (God) is?* (Genesis 41:38). Then the exaltation — the second chariot, the byssus, the gold chain, the ring, ruler over all his house — *And Pharaoh said unto Joseph, Thou shalt be over my house, and according unto thy word shall all my people be ruled: only in the throne will I be greater than thou* (Genesis 41:40), and *And Pharaoh took off his ring from his hand, and put it upon Joseph’s hand, and arrayed him in vestures of fine linen, and put a gold chain about his neck* (Genesis 41:42). Stephen sums the whole pattern to Israel: *And delivered him out of all his afflictions, and gave him favour and wisdom in the sight of Pharaoh king of Egypt; and he made him governor over Egypt and all his house* (Acts 7:10). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53978
  FROM _session251_ju40_lookup sv, _session251_ju40_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=40 AND sv.verse_number=5
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=40 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-40-joseph-uprightness',
       E'He judged in uprightness, no respect of persons — Yahuah was with him still',
       E'Jubilees adds the moral portrait the canon implies: *And Joseph ruled over all the land of Egypt, and all the princes of Pharaoh, and all his servants, and all who did the king’s business loved him, for he walked in uprightness, for he was without pride and arrogance, and he had no respect of persons, and did not accept gifts, but he judged in uprightness all the people of the land* (Jubilees 40:8). This is the same righteous Joseph who fled the Egyptian woman a chapter earlier — *And Yahuah (God) gave Joseph favour in the sight of the chief of the prison guards and compassion before him, for he saw that Yahuah (God) was with him, and that Yahuah (God) made all that he did to prosper* (Jubilees 39:11) — the pit and the prison did not break him. And the refrain that carries from the prison to the throne is one refrain: *And the land of Egypt was at peace before Pharaoh because of Joseph, for Yahuah (God) was with him* (Jubilees 40:9), echoing the Spirit-given uprightness Pharaoh himself confessed. The same hand that prospered him in chains exalts him over a kingdom.',
       sv.verse_id, ev.verse_id, 'extras', 53981
  FROM _session251_ju40_lookup sv, _session251_ju40_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=40 AND sv.verse_number=8
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=40 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-40-exalted-from-pit-revealer',
       E'The revealer of secrets, exalted from the pit — a Messiah type who saves many alive',
       E'When Egypt''s wisdom failed and Joseph alone declared the dream, Jubilees shows the pattern the prophets would name again: the man Elohim raises from the pit to be the revealer of what is hidden and the saviour of many. *And the king called Joseph’s name Sĕphânṭîphâns, and gave Joseph to wife the daughter of Potiphar* (Jubilees 40:10) crowns the same arc Daniel will stand in before another heathen king: *But there is a Elohim (God) in heaven that revealeth secrets, and maketh known to the king Nebuchadnezzar what shall be in the latter days* (Daniel 2:28). Psalm 105 reads the whole rise as Yahuah''s doing — *Until the time that his word came: the word of Yahuah (LORD) tried him* (Psalm 105:19) — and the purpose is salvation: *And Elohim (God) sent me before you to preserve you a posterity in the earth, and to save your lives by a great deliverance* (Genesis 45:7). The exalted-from-the-pit righteous one who saves a people alive is a Messiah type, and it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53984
  FROM _session251_ju40_lookup sv, _session251_ju40_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=40 AND sv.verse_number=9
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=40 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-40-pharaoh-two-dreams
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 41:8 — *And it came to pass in the morning that his spirit was troubled; and he sent and called for all the magicians of Egypt, and all the wise men thereof: and Pharaoh told them his dream; but there was none that could interpret them unto Pharaoh.* Jubilees 40:1''s interpreters and magicians who “were not able to declare” the dream is Genesis 41:8 retold.'
  FROM cross_reference_threads t, cross_references x, _session251_ju40_lookup sv, _session251_ju40_lookup tv
 WHERE t.slug='jubilees-40-pharaoh-two-dreams'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 41:14 — *Then Pharaoh sent and called Joseph, and they brought him hastily out of the dungeon: and he shaved himself, and changed his raiment, and came in unto Pharaoh.* The butler''s remembering and Joseph being brought “forth from the prison” in Jubilees 40:2 is Genesis 41:14.'
  FROM cross_reference_threads t, cross_references x, _session251_ju40_lookup sv, _session251_ju40_lookup tv
 WHERE t.slug='jubilees-40-pharaoh-two-dreams'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=40 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 41:26 — *The seven good kine are seven years; and the seven good ears are seven years: the dream is one.* Jubilees 40:3 (“his two dreams were one… seven years… of plenty… seven years of famine”) is Joseph''s Genesis 41:26 interpretation in brief.'
  FROM cross_reference_threads t, cross_references x, _session251_ju40_lookup sv, _session251_ju40_lookup tv
 WHERE t.slug='jubilees-40-pharaoh-two-dreams'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=40 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 41:30 — *And there shall arise after them seven years of famine; and all the plenty shall be forgotten in the land of Egypt; and the famine shall consume the land.* The “seven years of famine, such a famine as has not been” of Jubilees 40:3 is Genesis 41:30 word for word in substance.'
  FROM cross_reference_threads t, cross_references x, _session251_ju40_lookup sv, _session251_ju40_lookup tv
 WHERE t.slug='jubilees-40-pharaoh-two-dreams'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=40 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-40-spirit-of-god-favour
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 41:38 — *And Pharaoh said unto his servants, Can we find such a one as this is, a man in whom the Spirit of Elohim (God) is?* Jubilees 40:5''s “such a wise and discreet man… for the spirit of Yahuah (God) is with him” is Genesis 41:38 verbatim in sense.'
  FROM cross_reference_threads t, cross_references x, _session251_ju40_lookup sv, _session251_ju40_lookup tv
 WHERE t.slug='jubilees-40-spirit-of-god-favour'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=40 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 41:40 — *Thou shalt be over my house, and according unto thy word shall all my people be ruled: only in the throne will I be greater than thou.* Pharaoh''s words in Jubilees 40:6 (“made him ruler over all his house… Only on the throne shall I be greater than you”) are Genesis 41:40 exactly.'
  FROM cross_reference_threads t, cross_references x, _session251_ju40_lookup sv, _session251_ju40_lookup tv
 WHERE t.slug='jubilees-40-spirit-of-god-favour'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=40 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 41:42 — *And Pharaoh took off his ring from his hand, and put it upon Joseph’s hand, and arrayed him in vestures of fine linen, and put a gold chain about his neck.* The ring, the byssus garments, and the gold chain of Jubilees 40:6 are the regalia of Genesis 41:42.'
  FROM cross_reference_threads t, cross_references x, _session251_ju40_lookup sv, _session251_ju40_lookup tv
 WHERE t.slug='jubilees-40-spirit-of-god-favour'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=40 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:10 — *And delivered him out of all his afflictions, and gave him favour and wisdom in the sight of Pharaoh king of Egypt; and he made him governor over Egypt and all his house.* Stephen''s “favour and wisdom… governor over Egypt” gathers Jubilees 40:5 into the NT''s witness against Israel.'
  FROM cross_reference_threads t, cross_references x, _session251_ju40_lookup sv, _session251_ju40_lookup tv
 WHERE t.slug='jubilees-40-spirit-of-god-favour'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=40 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-40-joseph-uprightness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 39:11 — *And the Egyptian saw the garment of Joseph and the broken door, and heard the words of his wife, and cast Joseph into prison… and Yahuah (God) gave Joseph favour in the sight of the chief of the prison guards and compassion before him, for he saw that Yahuah (God) was with him, and that Yahuah (God) made all that he did to prosper.* The upright Joseph of Jubilees 40:8 is the same man who kept his purity in Jubilees 39:11 — “Yahuah was with him” ties the pit to the throne.'
  FROM cross_reference_threads t, cross_references x, _session251_ju40_lookup sv, _session251_ju40_lookup tv
 WHERE t.slug='jubilees-40-joseph-uprightness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=40 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=39 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 39:23 — *The keeper of the prison looked not to any thing that was under his hand; because Yahuah (LORD) was with him, and that which he did, Yahuah (LORD) made it to prosper.* Jubilees 40:9''s “Yahuah (God) was with him” is Genesis 39:23 carried from the prison into the palace.'
  FROM cross_reference_threads t, cross_references x, _session251_ju40_lookup sv, _session251_ju40_lookup tv
 WHERE t.slug='jubilees-40-joseph-uprightness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=40 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 16:19 — *Thou shalt not wrest judgment; thou shalt not respect persons, neither take a gift: for a gift doth blind the eyes of the wise, and pervert the words of the righteous.* Joseph judging “in uprightness… no respect of persons… did not accept gifts” in Jubilees 40:8 keeps the Torah''s standard of judgment before Sinai gave it.'
  FROM cross_reference_threads t, cross_references x, _session251_ju40_lookup sv, _session251_ju40_lookup tv
 WHERE t.slug='jubilees-40-joseph-uprightness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=40 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-40-exalted-from-pit-revealer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 2:28 — *But there is a Elohim (God) in heaven that revealeth secrets, and maketh known to the king Nebuchadnezzar what shall be in the latter days. Thy dream, and the visions of thy head upon thy bed, are these.* Joseph the dream-revealer of Jubilees 40 is the same type Daniel stands in — Elohim, not Egypt''s or Babylon''s wise men, reveals the secret.'
  FROM cross_reference_threads t, cross_references x, _session251_ju40_lookup sv, _session251_ju40_lookup tv
 WHERE t.slug='jubilees-40-exalted-from-pit-revealer'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=40 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 105:19 — *Until the time that his word came: the word of Yahuah (LORD) tried him.* Psalm 105 reads Joseph''s rise in Jubilees 40:9 as Yahuah''s own work, the pit and prison a trial until the appointed word came.'
  FROM cross_reference_threads t, cross_references x, _session251_ju40_lookup sv, _session251_ju40_lookup tv
 WHERE t.slug='jubilees-40-exalted-from-pit-revealer'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=40 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 105:21 — *He made him lord of his house, and ruler of all his substance.* The exaltation of Jubilees 40 (ruler over all Egypt) is Psalm 105:21 confessing Yahuah, not Pharaoh, as the one who made him lord.'
  FROM cross_reference_threads t, cross_references x, _session251_ju40_lookup sv, _session251_ju40_lookup tv
 WHERE t.slug='jubilees-40-exalted-from-pit-revealer'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=40 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 45:7 — *And Elohim (God) sent me before you to preserve you a posterity in the earth, and to save your lives by a great deliverance.* The point of Joseph''s exaltation in Jubilees 40 is salvation — the righteous one raised from the pit to save many alive, the Messiah pattern Genesis 45:7 names.'
  FROM cross_reference_threads t, cross_references x, _session251_ju40_lookup sv, _session251_ju40_lookup tv
 WHERE t.slug='jubilees-40-exalted-from-pit-revealer'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=40 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

