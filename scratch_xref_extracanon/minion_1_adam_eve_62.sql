-- ----- fragment: minion_1adameve_62.sql (session253 1-adam-eve 62) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch62. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae62 (view _session253_1ae62_lookup). Sort band base 65525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae62_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-62-envious-seed-buried
  ('adam-eve-conflict', '1-adam-eve', 62, 1, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s envy and plotting in 1 Adam & Eve 62:1 is the same enmity declared in the garden — the serpent striking at the seed kept for the first parents.'),
  ('adam-eve-conflict', '1-adam-eve', 62, 2, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* John names the very pattern of 1 Adam & Eve 62:2 — the devil sinning from the beginning, with the Son foretold to destroy his work.'),
  ('adam-eve-conflict', '1-adam-eve', 62, 2, 'canon', '2-corinthians', 11, 3, 'free', E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The stealth of Satan hiding the figs in 1 Adam & Eve 62:2 is the same subtilty by which the serpent beguiled Eve.'),
  ('adam-eve-conflict', '1-adam-eve', 62, 2, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The wicked one who buries the fruit in 1 Adam & Eve 62:2 is that old serpent who deceiveth the whole world.'),
  -- thread: 1-adam-eve-62-counsel-overturned-mercy
  ('adam-eve-conflict', '1-adam-eve', 62, 3, 'canon', 'genesis', 50, 20, 'free', E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* Yahuah turning Satan''s buried figs into fruit trees in 1 Adam & Eve 62:3 is the same mercy that means evil unto good to save His people.'),
  ('adam-eve-conflict', '1-adam-eve', 62, 5, 'canon', 'proverbs', 19, 21, 'free', E'Proverbs 19:21 — *There are many devices in a man''s heart; nevertheless the counsel of Yahuah (LORD), that shall stand.* Satan''s confession that Elohim overturned his counsel in 1 Adam & Eve 62:5 is this proverb proved — only the counsel of Yahuah stands.'),
  ('adam-eve-conflict', '1-adam-eve', 62, 5, 'canon', 'psalms', 33, 10, 'free', E'Psalm 33:10 — *Yahuah (LORD) bringeth the counsel of the heathen to nought: he maketh the devices of the people of none effect.* The defeated counsel and made-plain intention of 1 Adam & Eve 62:5 is Yahuah bringing the adversary''s device to nought.'),
  ('adam-eve-conflict', '1-adam-eve', 62, 3, 'jubilees', 'jubilees', 10, 8, 'extras', E'Jubilees 10:8 — *And the chief of the spirits, Mastêmâ, came and said: “Yahuah (God), Creator, let some of them remain before me... for great is the wickedness of the sons of men.” And He said: “Let the tenth part of them remain before him, and let nine parts descend into the place of condemnation.”* As mercy curbs Mastema to a permitted tenth here, so mercy in 1 Adam & Eve 62:3 lets the buried figs live rather than perish.'),
  -- thread: 1-adam-eve-62-adversary-ashamed
  ('adam-eve-conflict', '1-adam-eve', 62, 6, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Satan slinking away ashamed in 1 Adam & Eve 62:6 is the bruising of the serpent already begun, promised in full at the last.'),
  ('adam-eve-conflict', '1-adam-eve', 62, 6, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The adversary defeated and withdrawing in 1 Adam & Eve 62:6 is the devil who flees when Yahuah''s purpose resists him.'),
  ('adam-eve-conflict', '1-adam-eve', 62, 6, 'jubilees', 'jubilees', 48, 15, 'extras', E'Jubilees 48:15 — *And on the fourteenth day and on the fifteenth and on the sixteenth and on the seventeenth and on the eighteenth the prince of the Mastêmâ was bound and imprisoned behind the children of Yashar''el (Israel) that he might not accuse them.* The shamed and thwarted Satan of 1 Adam & Eve 62:6 is the prince of Mastema bound behind the covenant children at the Exodus.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae62_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae62_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-62-envious-seed-buried',
       E'The envious adversary strikes at the sacred fruit',
       E'Satan cannot bear the comfort Yahuah gives the first parents, so he moves at once against the seed: *But Satan the wicked was envious, because of the consolation Elohim (God) had given them.* (1 Adam & Eve 62:1) *So he prevented them, and went into the cave and took the two figs, and buried them outside the cave, so that Adam and Eve should not find them. He also had in his thoughts to destroy them.* (1 Adam & Eve 62:2) It ain''t new — this is the enmity declared in the garden, the serpent forever striking at the woman''s seed: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15) The devil has worked thus from the first day outside Eden: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* (1 John 3:8) The same subtilty that beguiled Eve presses on still: *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* (2 Corinthians 11:3) And John names the burier of the fruit — *that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9).',
       sv.verse_id, ev.verse_id, 'extras', 65525
  FROM _session253_1ae62_lookup sv, _session253_1ae62_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=62 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=62 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-62-counsel-overturned-mercy',
       E'Yahuah overturns the counsel and keeps the sacred fruit',
       E'What Satan buried to destroy, Yahuah''s mercy raises into life: *But by Elohim''s (God''s) mercy, as soon as those two figs were in the ground, Elohim (God) defeated Satan''s counsel regarding them; and made them into two fruit trees, that overshadowed the cave.* (1 Adam & Eve 62:3) Satan himself confesses the reversal: *But Elohim (God) has overturned my counsel; and would not that this sacred fruit should perish; and He has made plain my intention, and has defeated the counsel I had formed against His servants.* (1 Adam & Eve 62:5) This is the oldest law of the seed-war — the enemy means evil and the Most High bends it to good: *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* (Genesis 50:20) Man''s and the adversary''s devices cannot stand against His purpose: *There are many devices in a man''s heart; nevertheless the counsel of Yahuah (LORD), that shall stand.* (Proverbs 19:21) *Yahuah (LORD) bringeth the counsel of the heathen to nought: he maketh the devices of the people of none effect.* (Psalm 33:10) The same Mastema later begs leave to corrupt the sons of men, and is allowed only what mercy permits: *And He said: ''Let the tenth part of them remain before him, and let nine parts descend into the place of condemnation.''* (Jubilees 10:8) — election and mercy ever guard the covenant line.',
       sv.verse_id, ev.verse_id, 'extras', 65528
  FROM _session253_1ae62_lookup sv, _session253_1ae62_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=62 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=62 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-62-adversary-ashamed',
       E'The adversary goes away ashamed',
       E'The chapter ends with the enemy beaten at his own scheme: *Then Satan went away ashamed because he hadn''t thought his plans all the way through.* (1 Adam & Eve 62:6) This is the promised crushing already at work in the primeval days — the Elohim of peace bruising Satan: *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* (Romans 16:20) The same word holds for every assault: resist, and he flees defeated: *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* (James 4:7) So too at the Exodus the prince of Mastema is bound and shamed behind the covenant children: *And on the fourteenth day and on the fifteenth and on the sixteenth and on the seventeenth and on the eighteenth the prince of the Mastêmâ was bound and imprisoned behind the children of Yashar''el (Israel) that he might not accuse them.* (Jubilees 48:15) — from the cave to the sea, the accuser is sent away ashamed.',
       sv.verse_id, ev.verse_id, 'extras', 65531
  FROM _session253_1ae62_lookup sv, _session253_1ae62_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=62 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=62 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-62-envious-seed-buried
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s envy and plotting in 1 Adam & Eve 62:1 is the same enmity declared in the garden — the serpent striking at the seed kept for the first parents.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae62_lookup sv, _session253_1ae62_lookup tv
 WHERE t.slug='1-adam-eve-62-envious-seed-buried'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=62 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* John names the very pattern of 1 Adam & Eve 62:2 — the devil sinning from the beginning, with the Son foretold to destroy his work.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae62_lookup sv, _session253_1ae62_lookup tv
 WHERE t.slug='1-adam-eve-62-envious-seed-buried'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=62 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The stealth of Satan hiding the figs in 1 Adam & Eve 62:2 is the same subtilty by which the serpent beguiled Eve.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae62_lookup sv, _session253_1ae62_lookup tv
 WHERE t.slug='1-adam-eve-62-envious-seed-buried'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=62 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The wicked one who buries the fruit in 1 Adam & Eve 62:2 is that old serpent who deceiveth the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae62_lookup sv, _session253_1ae62_lookup tv
 WHERE t.slug='1-adam-eve-62-envious-seed-buried'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=62 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-62-counsel-overturned-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* Yahuah turning Satan''s buried figs into fruit trees in 1 Adam & Eve 62:3 is the same mercy that means evil unto good to save His people.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae62_lookup sv, _session253_1ae62_lookup tv
 WHERE t.slug='1-adam-eve-62-counsel-overturned-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=62 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 19:21 — *There are many devices in a man''s heart; nevertheless the counsel of Yahuah (LORD), that shall stand.* Satan''s confession that Elohim overturned his counsel in 1 Adam & Eve 62:5 is this proverb proved — only the counsel of Yahuah stands.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae62_lookup sv, _session253_1ae62_lookup tv
 WHERE t.slug='1-adam-eve-62-counsel-overturned-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=62 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 33:10 — *Yahuah (LORD) bringeth the counsel of the heathen to nought: he maketh the devices of the people of none effect.* The defeated counsel and made-plain intention of 1 Adam & Eve 62:5 is Yahuah bringing the adversary''s device to nought.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae62_lookup sv, _session253_1ae62_lookup tv
 WHERE t.slug='1-adam-eve-62-counsel-overturned-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=62 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 10:8 — *And the chief of the spirits, Mastêmâ, came and said: “Yahuah (God), Creator, let some of them remain before me... for great is the wickedness of the sons of men.” And He said: “Let the tenth part of them remain before him, and let nine parts descend into the place of condemnation.”* As mercy curbs Mastema to a permitted tenth here, so mercy in 1 Adam & Eve 62:3 lets the buried figs live rather than perish.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae62_lookup sv, _session253_1ae62_lookup tv
 WHERE t.slug='1-adam-eve-62-counsel-overturned-mercy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=62 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-62-adversary-ashamed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Satan slinking away ashamed in 1 Adam & Eve 62:6 is the bruising of the serpent already begun, promised in full at the last.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae62_lookup sv, _session253_1ae62_lookup tv
 WHERE t.slug='1-adam-eve-62-adversary-ashamed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=62 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The adversary defeated and withdrawing in 1 Adam & Eve 62:6 is the devil who flees when Yahuah''s purpose resists him.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae62_lookup sv, _session253_1ae62_lookup tv
 WHERE t.slug='1-adam-eve-62-adversary-ashamed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=62 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 48:15 — *And on the fourteenth day and on the fifteenth and on the sixteenth and on the seventeenth and on the eighteenth the prince of the Mastêmâ was bound and imprisoned behind the children of Yashar''el (Israel) that he might not accuse them.* The shamed and thwarted Satan of 1 Adam & Eve 62:6 is the prince of Mastema bound behind the covenant children at the Exodus.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae62_lookup sv, _session253_1ae62_lookup tv
 WHERE t.slug='1-adam-eve-62-adversary-ashamed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=62 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

