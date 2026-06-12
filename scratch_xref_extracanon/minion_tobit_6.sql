-- ----- fragment: minion_tobit_06.sql (session253 tobit 6) -----
-- Source anchor: apocrypha/tobit ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob6 (view _session253_tob6_lookup). Sort band base 59725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-6-the-fish-by-the-river
  ('apocrypha', 'tobit', 6, 2, 'canon', 'genesis', 50, 20, 'free', E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The fish that leaped up to devour is turned, like Joseph''s harm, into the means of saving life, in Tobit 6:2.'),
  ('apocrypha', 'tobit', 6, 3, 'canon', 'ezekiel', 47, 12, 'free', E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* The fish drawn from the river to feed and to heal answers the river whose very waters and fruit are medicine, in Tobit 6:3.'),
  -- thread: tobit-6-gall-for-healing-eyes
  ('apocrypha', 'tobit', 6, 8, 'canon', 'john', 9, 11, 'free', E'John 9:11 — *He answered and said, A man that is called Yahusha made clay, and anointed mine eyes, and said unto me, Go to the pool of Siloam, and wash: and I went and washed, and I received sight.* The gall laid up to anoint whitened eyes and give sight prefigures the anointing of clay that opens the blind man''s eyes, in Tobit 6:8.'),
  ('apocrypha', 'tobit', 6, 4, 'canon', 'mark', 16, 18, 'free', E'Mark 16:18 — *They shall take up serpents; and if they drink any deadly thing, it shall not hurt them; they shall lay hands on the sick, and they shall recover.* The heart, liver, and gall kept safely for the recovery of the afflicted answer the laying on of hands by which the sick recover, in Tobit 6:4.'),
  -- thread: tobit-6-smoke-that-drives-the-demon
  ('apocrypha', 'tobit', 6, 17, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The devil that smells the smoke and flees, never to return, is the same enemy that flees before submission to Elohim, in Tobit 6:17.'),
  ('apocrypha', 'tobit', 6, 7, 'canon', 'luke', 8, 29, 'free', E'Luke 8:29 — *(For he had commanded the unclean spirit to come out of the man. For oftentimes it had caught him: and he was kept bound with chains and in fetters; and he brake the bands, and was driven of the devil into the wilderness.)* The evil spirit that troubles and vexes a man or woman until it is driven off answers the unclean spirit cast out at the Master''s command, in Tobit 6:7.'),
  -- thread: tobit-6-kinsmans-right-seed-kept
  ('apocrypha', 'tobit', 6, 12, 'canon', 'numbers', 36, 8, 'free', E'Numbers 36:8 — *And every daughter, that possesseth an inheritance in any tribe of the children of Yashar''el (Israel), shall be wife unto one of the family of the tribe of her father, that the children of Yashar''el (Israel) may enjoy every man the inheritance of his fathers.* The right of inheritance that binds Sara to her kinsman Tobias is the very statute keeping a daughter''s inheritance within her father''s tribe, in Tobit 6:12.'),
  ('apocrypha', 'tobit', 6, 11, 'canon', 'deuteronomy', 25, 5, 'free', E'Deuteronomy 25:5 — *If brethren dwell together, and one of them die, and have no child, the wife of the dead shall not marry without unto a stranger: her husband''s brother shall go in unto her, and take her to him to wife, and perform the duty of an husband''s brother unto her.* The right of Sara appertaining to Tobias as her near kinsman echoes the kinsman''s duty to raise up the dead man''s name from his own house, in Tobit 6:11.'),
  -- thread: tobit-6-bride-appointed-from-the-beginning
  ('apocrypha', 'tobit', 6, 17, 'canon', 'genesis', 24, 14, 'free', E'Genesis 24:14 — *And let it come to pass, that the damsel to whom I shall say, Let down thy pitcher, I pray thee, that I may drink; and she shall say, Drink, and I will give thy camels drink also: let the same be she that thou hast appointed for thy servant Isaac; and thereby shall I know that thou hast shewed kindness unto my master.* Sara appointed to Tobias from the beginning answers the damsel the servant prays Yahuah has appointed for Isaac, in Tobit 6:17.'),
  ('apocrypha', 'tobit', 6, 17, 'canon', 'genesis', 24, 15, 'free', E'Genesis 24:15 — *And it came to pass, before he had done speaking, that, behold, Rebekah came out, who was born to Bethuel, son of Milcah, the wife of Nahor, Abraham''s brother, with her pitcher upon her shoulder.* The appointed bride given that same night without fail mirrors Rebekah appearing before the prayer was even finished, in Tobit 6:17.'),
  ('apocrypha', 'tobit', 6, 12, 'canon', 'proverbs', 19, 14, 'free', E'Proverbs 19:14 — *House and riches are the inheritance of fathers: and a prudent wife is from Yahuah (LORD).* The fair and wise maid joined to her kinsman by the right of inheritance is the very prudent wife that is the LORD''s own gift, in Tobit 6:12.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-6-the-fish-by-the-river',
       E'The Fish Taken from the River',
       E'By the Tigris a fish leaps up to devour the young man, and the angel turns the threat into provision: *And when the young man went down to wash himself, a fish leaped out of the river, and would have devoured him.* (Tobit 6:2) *Then the angel said to him, Take the fish. And the young man laid hold of the fish, and drew it to land.* (Tobit 6:3) What rose up to destroy is laid hold of and made into food and medicine — the same turning Joseph names, *ye thought evil against me; but Elohim (God) meant it unto good* (Genesis 50:20). The waters that menace become the waters that heal in the prophet''s vision: *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* (Ezekiel 47:12) It ain''t new — the river that healeth runs from Eden to the throne.',
       sv.verse_id, ev.verse_id, 'extras', 59725
  FROM _session253_tob6_lookup sv, _session253_tob6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=6 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-6-gall-for-healing-eyes',
       E'The Gall That Opens Blind Eyes',
       E'The angel sets aside the inward parts of the fish for healing: *To whom the angel said, Open the fish, and take the heart and the liver and the gall, and put them up safely.* (Tobit 6:4) *As for the gall, it is good to anoint a man that has whiteness in his eyes, and he shall be healed.* (Tobit 6:8) This stored remedy reaches forward to old Tobit, whose blindness it will cure, and it foreshadows the anointing that opens eyes: *He answered and said, A man that is called Yahusha made clay, and anointed mine eyes, and said unto me, Go to the pool of Siloam, and wash: and I went and washed, and I received sight.* (John 9:11) The healing of the body sealed up in the fish is the same mercy the Master pours out, and the same He commits to His own: *They shall take up serpents; and if they drink any deadly thing, it shall not hurt them; they shall lay hands on the sick, and they shall recover.* (Mark 16:18) It ain''t new — Yahuah is the One who healeth.',
       sv.verse_id, ev.verse_id, 'extras', 59728
  FROM _session253_tob6_lookup sv, _session253_tob6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-6-smoke-that-drives-the-demon',
       E'The Smoke That Drives the Demon Away',
       E'The angel teaches that the heart and liver, smoked, expel the tormenting spirit: *And he said to him, Touching the heart and the liver, if a devil or an evil spirit trouble any, we must make a smoke thereof before the man or the woman, and the party shall be no more vexed.* (Tobit 6:7) *And the devil shall smell it, and flee away, and never come again any more* (Tobit 6:17) — yet the smoke is never severed from the prayer that follows it: *but when you shall come to her, rise up both of you, and pray to Yahuah (God) which is merciful* (Tobit 6:17). The fleeing of the demon is the covenant pattern: the unclean spirit cannot stand before submission to Elohim — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* (James 4:7) And the bound and vexed are set free at His word: *(For he had commanded the unclean spirit to come out of the man. For oftentimes it had caught him: and he was kept bound with chains and in fetters; and he brake the bands, and was driven of the devil into the wilderness.)* (Luke 8:29) It ain''t new — the powers of darkness flee before Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 59731
  FROM _session253_tob6_lookup sv, _session253_tob6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=6 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-6-kinsmans-right-seed-kept',
       E'The Kinsman''s Right — The Seed Kept in the Tribe',
       E'The angel claims Sara for Tobias by the law of inheritance within the kindred: *For to you does the right of her appertain, seeing you only art of her kindred.* (Tobit 6:11) *for I know that Raguel cannot marry her to another according to the law of Moses, but he shall be guilty of death, because the right of inheritance does rather appertain to you than to any other.* (Tobit 6:12) This is no novelty but Torah kept in exile — the daughters of an inheritance married within their own tribe so the lot is not removed: *And every daughter, that possesseth an inheritance in any tribe of the children of Yashar''el (Israel), shall be wife unto one of the family of the tribe of her father, that the children of Yashar''el (Israel) may enjoy every man the inheritance of his fathers.* (Numbers 36:8) It is the kinsman''s duty to raise up the name that else were cut off: *her husband''s brother shall go in unto her, and take her to him to wife, and perform the duty of an husband''s brother unto her.* (Deuteronomy 25:5) The scattered house of Israel keeps the seed-line whole even in Media — the inheritance is not lost. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 59734
  FROM _session253_tob6_lookup sv, _session253_tob6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-6-bride-appointed-from-the-beginning',
       E'Fear Not — She Is Appointed Unto Thee',
       E'The angel stills Tobias''s dread of death and names Sara the bride ordained for him: *fear not, for she is appointed to you from the beginning; and you shall preserve her, and she shall go with you.* (Tobit 6:17) *And the maid is fair and wise* (Tobit 6:12) — the destined wife, like Rebekah at the well, is shown to be the LORD''s own choosing: *let the same be she that thou hast appointed for thy servant Isaac; and thereby shall I know that thou hast shewed kindness unto my master.* (Genesis 24:14) The bride appointed is not chance but providence answered before the prayer is finished: *And it came to pass, before he had done speaking, that, behold, Rebekah came out, who was born to Bethuel, son of Milcah, the wife of Nahor, Abraham''s brother, with her pitcher upon her shoulder.* (Genesis 24:15) And the wise and fair maid is Yahuah''s gift: *House and riches are the inheritance of fathers: and a prudent wife is from Yahuah (LORD).* (Proverbs 19:14) It ain''t new — the appointed bride is given of the LORD.',
       sv.verse_id, ev.verse_id, 'extras', 59737
  FROM _session253_tob6_lookup sv, _session253_tob6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=6 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-6-the-fish-by-the-river
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* The fish that leaped up to devour is turned, like Joseph''s harm, into the means of saving life, in Tobit 6:2.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-the-fish-by-the-river'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 47:12 — *And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine.* The fish drawn from the river to feed and to heal answers the river whose very waters and fruit are medicine, in Tobit 6:3.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-the-fish-by-the-river'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-6-gall-for-healing-eyes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 9:11 — *He answered and said, A man that is called Yahusha made clay, and anointed mine eyes, and said unto me, Go to the pool of Siloam, and wash: and I went and washed, and I received sight.* The gall laid up to anoint whitened eyes and give sight prefigures the anointing of clay that opens the blind man''s eyes, in Tobit 6:8.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-gall-for-healing-eyes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Mark 16:18 — *They shall take up serpents; and if they drink any deadly thing, it shall not hurt them; they shall lay hands on the sick, and they shall recover.* The heart, liver, and gall kept safely for the recovery of the afflicted answer the laying on of hands by which the sick recover, in Tobit 6:4.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-gall-for-healing-eyes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-6-smoke-that-drives-the-demon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The devil that smells the smoke and flees, never to return, is the same enemy that flees before submission to Elohim, in Tobit 6:17.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-smoke-that-drives-the-demon'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 8:29 — *(For he had commanded the unclean spirit to come out of the man. For oftentimes it had caught him: and he was kept bound with chains and in fetters; and he brake the bands, and was driven of the devil into the wilderness.)* The evil spirit that troubles and vexes a man or woman until it is driven off answers the unclean spirit cast out at the Master''s command, in Tobit 6:7.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-smoke-that-drives-the-demon'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=8 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-6-kinsmans-right-seed-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 36:8 — *And every daughter, that possesseth an inheritance in any tribe of the children of Yashar''el (Israel), shall be wife unto one of the family of the tribe of her father, that the children of Yashar''el (Israel) may enjoy every man the inheritance of his fathers.* The right of inheritance that binds Sara to her kinsman Tobias is the very statute keeping a daughter''s inheritance within her father''s tribe, in Tobit 6:12.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-kinsmans-right-seed-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=36 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 25:5 — *If brethren dwell together, and one of them die, and have no child, the wife of the dead shall not marry without unto a stranger: her husband''s brother shall go in unto her, and take her to him to wife, and perform the duty of an husband''s brother unto her.* The right of Sara appertaining to Tobias as her near kinsman echoes the kinsman''s duty to raise up the dead man''s name from his own house, in Tobit 6:11.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-kinsmans-right-seed-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-6-bride-appointed-from-the-beginning
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:14 — *And let it come to pass, that the damsel to whom I shall say, Let down thy pitcher, I pray thee, that I may drink; and she shall say, Drink, and I will give thy camels drink also: let the same be she that thou hast appointed for thy servant Isaac; and thereby shall I know that thou hast shewed kindness unto my master.* Sara appointed to Tobias from the beginning answers the damsel the servant prays Yahuah has appointed for Isaac, in Tobit 6:17.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-bride-appointed-from-the-beginning'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 24:15 — *And it came to pass, before he had done speaking, that, behold, Rebekah came out, who was born to Bethuel, son of Milcah, the wife of Nahor, Abraham''s brother, with her pitcher upon her shoulder.* The appointed bride given that same night without fail mirrors Rebekah appearing before the prayer was even finished, in Tobit 6:17.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-bride-appointed-from-the-beginning'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 19:14 — *House and riches are the inheritance of fathers: and a prudent wife is from Yahuah (LORD).* The fair and wise maid joined to her kinsman by the right of inheritance is the very prudent wife that is the LORD''s own gift, in Tobit 6:12.'
  FROM cross_reference_threads t, cross_references x, _session253_tob6_lookup sv, _session253_tob6_lookup tv
 WHERE t.slug='tobit-6-bride-appointed-from-the-beginning'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

