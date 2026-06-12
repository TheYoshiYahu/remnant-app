-- ----- fragment: minion_thewisdomofsolomon_10.sql (session253 the-wisdom-of-solomon 10) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis10 (view _session253_wis10_lookup). Sort band base 58225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-10-adam-formed-and-fallen
  ('apocrypha', 'the-wisdom-of-solomon', 10, 2, 'canon', 'genesis', 1, 28, 'free', E'Genesis 1:28 — *And Elohim (God) blessed them, and Elohim (God) said unto them, Be fruitful, and multiply, and replenish the earth, and subdue it: and have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth upon the earth.* The dominion Wisdom *gave him power to rule all things* (10:2) is the garden mandate given to the first-formed father.'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 3, 'canon', 'genesis', 4, 8, 'free', E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* This is *the fury with which he murdered his brother* (10:3) — the unrighteous who *went away from her in his anger*.'),
  -- thread: wisdom-10-noah-ark-righteous-preserved
  ('apocrypha', 'the-wisdom-of-solomon', 10, 4, 'canon', 'genesis', 7, 1, 'free', E'Genesis 7:1 — *And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation.* This is *the righteous* whose course Wisdom *directed... in a piece of wood of small value* (10:4).'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 4, 'canon', 'hebrews', 11, 7, 'free', E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith.* The ark of *small value* (10:4) is the saving of the righteous house by faith.'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 4, 'jubilees', 'jubilees', 5, 22, 'extras', E'Jubilees 5:22 — *And Noah made the ark in all respects as He commanded him, in the twenty-seventh jubilee of years, in the fifth week in the fifth year (on the new moon of the first month).* The now-live Jubilees self-links Wisdom''s *piece of wood* (10:4) to the dated building of the ark.'),
  -- thread: wisdom-10-abraham-and-lot-from-the-fire
  ('apocrypha', 'the-wisdom-of-solomon', 10, 5, 'canon', 'hebrews', 11, 8, 'free', E'Hebrews 11:8 — *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went.* This is *the righteous... preserved blameless* whom Wisdom *found out* amid the confounded nations (10:5).'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 6, 'canon', 'genesis', 19, 24, 'free', E'Genesis 19:24 — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven.* This is *the fire which fell down upon the five cities*, from which Wisdom *delivered the righteous man* Lot (10:6).'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 7, 'canon', 'genesis', 19, 26, 'free', E'Genesis 19:26 — *But his wife looked back from behind him, and she became a pillar of salt.* This is *a standing pillar of salt... a monument of an unbelieving soul* (10:7).'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 6, 'jubilees', 'jubilees', 16, 6, 'extras', E'Jubilees 16:6 — *And, in like manner, Elohim (God) will execute judgment on the places where they have done according to the uncleanness of the Sodomites, like to the judgment of Sodom. But Lot we saved; for Elohim (God) remembered Abraham, and sent him out from the midst of the overthrow.* The now-live Jubilees self-links Wisdom''s deliverance of *the righteous man* from the fire (10:6).'),
  -- thread: wisdom-10-jacob-fled-shewn-the-kingdom
  ('apocrypha', 'the-wisdom-of-solomon', 10, 10, 'canon', 'genesis', 28, 13, 'free', E'Genesis 28:13 — *And, behold, Yahuah (LORD) stood above it, and said, I am Yahuah Elohim (the LORD God) of Abraham thy father, and the Elohim (God) of Isaac: the land whereon thou liest, to thee will I give it, and to thy seed.* This is the *kingdom of Yahuah (God)* Wisdom *shewed him* when the righteous fled (10:10).'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 10, 'canon', 'genesis', 28, 15, 'free', E'Genesis 28:15 — *And, behold, I am with thee, and will keep thee in all places whither thou goest, and will bring thee again into this land; for I will not leave thee, until I have done that which I have spoken to thee of.* This is Wisdom guiding Jacob *in right paths* and keeping him through the flight (10:10).'),
  -- thread: wisdom-10-joseph-the-pit-to-the-sceptre
  ('apocrypha', 'the-wisdom-of-solomon', 10, 13, 'canon', 'genesis', 39, 3, 'free', E'Genesis 39:3 — *And his master saw that Yahuah (LORD) was with him, and that Yahuah (LORD) made all that he did to prosper in his hand.* This is Wisdom who *forsook him not* when the righteous was sold (10:13).'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 14, 'canon', 'genesis', 41, 40, 'free', E'Genesis 41:40 — *Thou shalt be over my house, and according unto thy word shall all my people be ruled: only in the throne will I be greater than thou.* This is *the sceptre of the kingdom* Wisdom brought him out of bonds (10:14).'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 13, 'jubilees', 'jubilees', 39, 3, 'extras', E'Jubilees 39:3 — *And he set Joseph over all his house, and the blessing of Yahuah (God) came upon the house of the Egyptian on account of Joseph, and Yahuah (God) prospered him in all that he did.* The now-live Jubilees self-links Wisdom who *delivered him from sin* and went down into the pit (10:13).'),
  -- thread: wisdom-10-exodus-the-sea-divided
  ('apocrypha', 'the-wisdom-of-solomon', 10, 18, 'canon', 'exodus', 14, 22, 'free', E'Exodus 14:22 — *And the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left.* This is Wisdom that *brought them through the Red sea, and led them through much water* (10:18).'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 17, 'canon', 'psalms', 105, 37, 'free', E'Psalm 105:37 — *He brought them forth also with silver and gold: and there was not one feeble person among their tribes.* This is the *reward of their labours* Wisdom rendered to the righteous (10:17), the providence over the fathers.'),
  ('apocrypha', 'the-wisdom-of-solomon', 10, 19, 'jubilees', 'jubilees', 48, 14, 'extras', E'Jubilees 48:14 — *And all the peoples whom he brought to pursue after Yashar''el (Israel), Yahuah our Elohim (the LORD our God) cast them into the midst of the sea, into the depths of the abyss beneath the children of Yashar''el (Israel), even as the people of Egypt had cast their children into the river. He took vengeance on 1,000,000 of them, and one thousand strong and energetic men were destroyed on account of one suckling of the children of your people which they had thrown into the river.* The now-live Jubilees self-links Wisdom who *drowned their enemies, and cast them up out of the bottom of the deep* (10:19).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-10-adam-formed-and-fallen',
       E'Wisdom kept the first-formed father — and Cain''s fury',
       E'Chapter 10 unfolds the saving providence — Wisdom walking through history: *She preserved the first formed father of the world, that was created alone, and brought him out of his fall, And gave him power to rule all things* (Wisdom of Solomon 10:1-2). The first-formed father is Adam, *created alone* — and the dominion he was given is the dominion of the garden mandate: *And Elohim (God) blessed them, and Elohim (God) said unto them, Be fruitful, and multiply, and replenish the earth, and subdue it: and have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth upon the earth* (Genesis 1:28). Wisdom *brought him out of his fall* — grace into the ruin, not abandonment. But the next generation rejected her: *But when the unrighteous went away from her in his anger, he perished also in the fury with which he murdered his brother* (Wisdom of Solomon 10:3) — Cain, who *rose up against Abel his brother, and slew him* (Genesis 4:8). It ain''t new: the deuterocanon reads Eden and the first murder exactly as Torah tells it.',
       sv.verse_id, ev.verse_id, 'extras', 58225
  FROM _session253_wis10_lookup sv, _session253_wis10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=10 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-10-noah-ark-righteous-preserved',
       E'Wisdom steered the ark — Noah the righteous through the flood',
       E'When the world drowned, Wisdom became the pilot: *For whose cause the earth being drowned with the flood, wisdom again preserved it, and directed the course of the righteous in a piece of wood of small value* (Wisdom of Solomon 10:4). The *piece of wood of small value* is Noah''s ark, and *the righteous* is Noah himself, called in by Yahuah: *And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation* (Genesis 7:1). Hebrews reads the same faith: *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith* (Hebrews 11:7). The now-live Jubilees keeps the very timetable: *And Noah made the ark in all respects as He commanded him, in the twenty-seventh jubilee of years, in the fifth week in the fifth year (on the new moon of the first month)* (Jubilees 5:22). One witness across four books — the saving providence over one righteous house.',
       sv.verse_id, ev.verse_id, 'extras', 58228
  FROM _session253_wis10_lookup sv, _session253_wis10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=10 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-10-abraham-and-lot-from-the-fire',
       E'Wisdom found Abraham at Babel — and snatched Lot from the fire',
       E'At the scattering of Babel Wisdom singled out the patriarch: *Moreover, the nations in their wicked conspiracy being confounded, she found out the righteous, and preserved him blameless to Yahuah (God), and kept him strong against his tender compassion toward his son* (Wisdom of Solomon 10:5) — Abraham *kept strong* at the binding of Isaac. *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went* (Hebrews 11:8). Then Wisdom delivered Lot: *When the ungodly perished, she delivered the righteous man, who fled from the fire which fell down upon the five cities* (Wisdom of Solomon 10:6) — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven* (Genesis 19:24). And Wisdom marks Lot''s wife: *a standing pillar of salt is a monument of an unbelieving soul* (Wisdom of Solomon 10:7) — *But his wife looked back from behind him, and she became a pillar of salt* (Genesis 19:26). The now-live Jubilees reads the rescue the same way: *But Lot we saved; for Elohim (God) remembered Abraham, and sent him out from the midst of the overthrow* (Jubilees 16:6).',
       sv.verse_id, ev.verse_id, 'extras', 58231
  FROM _session253_wis10_lookup sv, _session253_wis10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=10 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-10-jacob-fled-shewn-the-kingdom',
       E'Wisdom guided Jacob fleeing — and shewed him the kingdom',
       E'Wisdom became Jacob''s road and his defender: *When the righteous fled from his brother''s wrath she guided him in right paths, shewed him the kingdom of Yahuah (God), and gave him knowledge of holy things, made him rich in his travels, and multiplied the fruit of his labours* (Wisdom of Solomon 10:10). The kingdom *shewed him* is Bethel''s ladder, where Yahuah stood and spoke: *And, behold, Yahuah (LORD) stood above it, and said, I am Yahuah Elohim (the LORD God) of Abraham thy father, and the Elohim (God) of Isaac: the land whereon thou liest, to thee will I give it, and to thy seed* (Genesis 28:13). And the keeping in *right paths* on the road is the Bethel promise itself: *And, behold, I am with thee, and will keep thee in all places whither thou goest, and will bring thee again into this land; for I will not leave thee, until I have done that which I have spoken to thee of* (Genesis 28:15). Wisdom *defended him from his enemies, and kept him safe from those that lay in wait, and in a sore conflict she gave him the victory; that he might know that goodness is stronger than all* (Wisdom of Solomon 10:12) — Laban behind, Esau ahead, and Peniel''s wrestle between. The saving providence over the heel-holder.',
       sv.verse_id, ev.verse_id, 'extras', 58234
  FROM _session253_wis10_lookup sv, _session253_wis10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=10 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-10-joseph-the-pit-to-the-sceptre',
       E'Wisdom went down into the pit with Joseph — and raised the sceptre',
       E'Wisdom descended with the sold son and lifted him to the throne: *When the righteous was sold, she forsook him not, but delivered him from sin: she went down with him into the pit, And left him not in bonds, till she brought him the sceptre of the kingdom, and power against those that oppressed him: as for them that had accused him, she shewed them to be liars, and gave him perpetual glory* (Wisdom of Solomon 10:13-14). The *forsook him not* is the refrain of Genesis: *And his master saw that Yahuah (LORD) was with him, and that Yahuah (LORD) made all that he did to prosper in his hand* (Genesis 39:3). The *sceptre of the kingdom* is Pharaoh''s word: *Thou shalt be over my house, and according unto thy word shall all my people be ruled: only in the throne will I be greater than thou* (Genesis 41:40). The now-live Jubilees keeps both halves — the prospering and the exalting: *And he set Joseph over all his house, and the blessing of Yahuah (God) came upon the house of the Egyptian on account of Joseph, and Yahuah (God) prospered him in all that he did* (Jubilees 39:3). The pit, the prison, the palace — Wisdom *left him not in bonds*.',
       sv.verse_id, ev.verse_id, 'extras', 58237
  FROM _session253_wis10_lookup sv, _session253_wis10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=10 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-10-exodus-the-sea-divided',
       E'Wisdom entered Moses — the pillar, the Red Sea, the drowned foe',
       E'Wisdom became the deliverer of the nation through Moses: *She entered into the soul of the servant of Yahuah (God), and withstood dreadful kings in wonders and signs; Rendered to the righteous a reward of their labours, guided them in a marvellous way, and was to them for a cover by day, and a light of stars in the night season; Brought them through the Red sea, and led them through much water: But she drowned their enemies, and cast them up out of the bottom of the deep* (Wisdom of Solomon 10:16-19). The sea-crossing is Exodus told plain: *And the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left* (Exodus 14:22). The providence over the fathers is Psalm 105''s song: *He brought them forth also with silver and gold: and there was not one feeble person among their tribes* (Psalm 105:37) — Wisdom *rendered to the righteous a reward of their labours* (10:17). And the now-live Jubilees keeps the drowning of the foe: *And all the peoples whom he brought to pursue after Yashar''el (Israel), Yahuah our Elohim (the LORD our God) cast them into the midst of the sea, into the depths of the abyss beneath the children of Yashar''el (Israel)* (Jubilees 48:14). The book closes on the saving providence that *fought for them*.',
       sv.verse_id, ev.verse_id, 'extras', 58240
  FROM _session253_wis10_lookup sv, _session253_wis10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=10 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-10-adam-formed-and-fallen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:28 — *And Elohim (God) blessed them, and Elohim (God) said unto them, Be fruitful, and multiply, and replenish the earth, and subdue it: and have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth upon the earth.* The dominion Wisdom *gave him power to rule all things* (10:2) is the garden mandate given to the first-formed father.'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-adam-formed-and-fallen'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* This is *the fury with which he murdered his brother* (10:3) — the unrighteous who *went away from her in his anger*.'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-adam-formed-and-fallen'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-10-noah-ark-righteous-preserved
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:1 — *And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation.* This is *the righteous* whose course Wisdom *directed... in a piece of wood of small value* (10:4).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-noah-ark-righteous-preserved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith.* The ark of *small value* (10:4) is the saving of the righteous house by faith.'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-noah-ark-righteous-preserved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:22 — *And Noah made the ark in all respects as He commanded him, in the twenty-seventh jubilee of years, in the fifth week in the fifth year (on the new moon of the first month).* The now-live Jubilees self-links Wisdom''s *piece of wood* (10:4) to the dated building of the ark.'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-noah-ark-righteous-preserved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-10-abraham-and-lot-from-the-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:8 — *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went.* This is *the righteous... preserved blameless* whom Wisdom *found out* amid the confounded nations (10:5).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-abraham-and-lot-from-the-fire'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 19:24 — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven.* This is *the fire which fell down upon the five cities*, from which Wisdom *delivered the righteous man* Lot (10:6).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-abraham-and-lot-from-the-fire'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 19:26 — *But his wife looked back from behind him, and she became a pillar of salt.* This is *a standing pillar of salt... a monument of an unbelieving soul* (10:7).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-abraham-and-lot-from-the-fire'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 16:6 — *And, in like manner, Elohim (God) will execute judgment on the places where they have done according to the uncleanness of the Sodomites, like to the judgment of Sodom. But Lot we saved; for Elohim (God) remembered Abraham, and sent him out from the midst of the overthrow.* The now-live Jubilees self-links Wisdom''s deliverance of *the righteous man* from the fire (10:6).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-abraham-and-lot-from-the-fire'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=16 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-10-jacob-fled-shewn-the-kingdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 28:13 — *And, behold, Yahuah (LORD) stood above it, and said, I am Yahuah Elohim (the LORD God) of Abraham thy father, and the Elohim (God) of Isaac: the land whereon thou liest, to thee will I give it, and to thy seed.* This is the *kingdom of Yahuah (God)* Wisdom *shewed him* when the righteous fled (10:10).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-jacob-fled-shewn-the-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 28:15 — *And, behold, I am with thee, and will keep thee in all places whither thou goest, and will bring thee again into this land; for I will not leave thee, until I have done that which I have spoken to thee of.* This is Wisdom guiding Jacob *in right paths* and keeping him through the flight (10:10).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-jacob-fled-shewn-the-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-10-joseph-the-pit-to-the-sceptre
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 39:3 — *And his master saw that Yahuah (LORD) was with him, and that Yahuah (LORD) made all that he did to prosper in his hand.* This is Wisdom who *forsook him not* when the righteous was sold (10:13).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-joseph-the-pit-to-the-sceptre'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 41:40 — *Thou shalt be over my house, and according unto thy word shall all my people be ruled: only in the throne will I be greater than thou.* This is *the sceptre of the kingdom* Wisdom brought him out of bonds (10:14).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-joseph-the-pit-to-the-sceptre'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 39:3 — *And he set Joseph over all his house, and the blessing of Yahuah (God) came upon the house of the Egyptian on account of Joseph, and Yahuah (God) prospered him in all that he did.* The now-live Jubilees self-links Wisdom who *delivered him from sin* and went down into the pit (10:13).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-joseph-the-pit-to-the-sceptre'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=13
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=39 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-10-exodus-the-sea-divided
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 14:22 — *And the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left.* This is Wisdom that *brought them through the Red sea, and led them through much water* (10:18).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-exodus-the-sea-divided'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 105:37 — *He brought them forth also with silver and gold: and there was not one feeble person among their tribes.* This is the *reward of their labours* Wisdom rendered to the righteous (10:17), the providence over the fathers.'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-exodus-the-sea-divided'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 48:14 — *And all the peoples whom he brought to pursue after Yashar''el (Israel), Yahuah our Elohim (the LORD our God) cast them into the midst of the sea, into the depths of the abyss beneath the children of Yashar''el (Israel), even as the people of Egypt had cast their children into the river. He took vengeance on 1,000,000 of them, and one thousand strong and energetic men were destroyed on account of one suckling of the children of your people which they had thrown into the river.* The now-live Jubilees self-links Wisdom who *drowned their enemies, and cast them up out of the bottom of the deep* (10:19).'
  FROM cross_reference_threads t, cross_references x, _session253_wis10_lookup sv, _session253_wis10_lookup tv
 WHERE t.slug='wisdom-10-exodus-the-sea-divided'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

