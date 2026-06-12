-- ----- fragment: minion_apocalypseofabraham_28.sql (session253 apocalypse-of-abraham 28) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch28. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa28 (view _session253_aoa28_lookup). Sort band base 67675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa28_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-28-the-measured-term
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 28, 3, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* In the very vision Abraham here recalls, the term of his seed''s affliction was spoken in numbers, exactly the "how long" he asks in Apocalypse of Abraham 28:3.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 28, 3, 'canon', 'genesis', 15, 14, 'free', E'Genesis 15:14 — *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance.* The measured affliction of Apocalypse of Abraham 28:3 closes in the LORD''s judgment on the oppressor and the coming-out of the seed.'),
  -- thread: apocalypse-of-abraham-28-scattered-among-the-heathen
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 28, 4, 'canon', 'leviticus', 26, 33, 'free', E'Leviticus 26:33 — *And I will scatter you among the heathen, and will draw out a sword after you: and your land shall be desolate, and your cities waste.* The retribution "accomplished" upon the multitude in Apocalypse of Abraham 28:4 is the Torah-foretold scattering among the heathen.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 28, 4, 'canon', 'leviticus', 26, 42, 'free', E'Leviticus 26:42 — *Then will I remember my covenant with Jacob, and also my covenant with Isaac, and also my covenant with Abraham will I remember; and I will remember the land.* The very covenant with Abraham — whose vision this is — is what survives the retribution of Apocalypse of Abraham 28:4.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 28, 4, 'canon', 'leviticus', 26, 44, 'free', E'Leviticus 26:44 — *And yet for all that, when they be in the land of their enemies, I will not cast them away, neither will I abhor them, to destroy them utterly, and to break my covenant with them: for I am Yahuah (LORD) their Elohim (God).* Even in the retribution of Apocalypse of Abraham 28:4, the people are disciplined, not cast away — election holds.'),
  -- thread: apocalypse-of-abraham-28-one-hour-in-mercy
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 28, 5, 'canon', 'deuteronomy', 30, 3, 'free', E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* The "one hour in mercy" of Apocalypse of Abraham 28:5 is Torah''s promise to gather the scattered after the misfortune among the heathen.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 28, 5, 'canon', 'isaiah', 27, 13, 'free', E'Isaiah 27:13 — *And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* The hour of mercy in Apocalypse of Abraham 28:5 is the great-trumpet ingathering of the outcasts.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 28, 5, 'canon', 'isaiah', 11, 11, 'free', E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The mercy after the heathen-misfortune of Apocalypse of Abraham 28:5 is the second-time, two-house recovery of Abraham''s own seed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 28, 5, 'canon', 'romans', 11, 26, 'free', E'Romans 11:26 — *And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob:* Sha''ul confirms the hour of mercy in Apocalypse of Abraham 28:5 — the scattered seed is saved, not replaced.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa28_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa28_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-28-the-measured-term',
       E'The measured term foretold to Abraham',
       E'Abraham, lifted up, presses the One he has found: *As Thou hast brought me up to Thy height, so make this known to me, Thy beloved one, as much as I ask whether what I saw shall happen to them for long?* (Apocalypse of Abraham 28:3). It ain''t new — this is the same Abraham, in the same vision, who watched the deep sleep and the horror of great darkness fall over the covenant sacrifice, and there heard the term of his seed spoken aloud: *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years* (Genesis 15:13). The affliction is never open-ended; it is measured. And it ends in judgment upon the oppressor and deliverance for the seed: *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance* (Genesis 15:14). The question of "how long" is answered before it is asked — Yahuah set the bound of it at the furnace and the stars.',
       sv.verse_id, ev.verse_id, 'extras', 67675
  FROM _session253_aoa28_lookup sv, _session253_aoa28_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=28 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-28-scattered-among-the-heathen',
       E'The multitude provoked, scattered, and yet not cast away',
       E'He showed Abraham *a multitude of His people*, and said: *On their account, through four issues, as thou sawest, I shall be provoked by them, and in these my retribution for their deeds shall be accomplished* (Apocalypse of Abraham 28:4). This is no new sentence. Torah set it down in advance — the provoking, the retribution, the scattering: *And I will scatter you among the heathen, and will draw out a sword after you: and your land shall be desolate, and your cities waste* (Leviticus 26:33). Yet the same Torah binds the scattering to a covenant that cannot break, retribution that ends in remembrance: *Then will I remember my covenant with Jacob, and also my covenant with Isaac, and also my covenant with Abraham will I remember; and I will remember the land* (Leviticus 26:42). And the closing word of that chapter is the very floor the Apocalypse stands on — judgment, but never abandonment: *And yet for all that, when they be in the land of their enemies, I will not cast them away, neither will I abhor them, to destroy them utterly, and to break my covenant with them: for I am Yahuah (LORD) their Elohim (God)* (Leviticus 26:44). The retribution of 28:4 is covenant-discipline, not divorce; the seed of Abraham is kept.',
       sv.verse_id, ev.verse_id, 'extras', 67678
  FROM _session253_aoa28_lookup sv, _session253_aoa28_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=28 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-28-one-hour-in-mercy',
       E'Misfortune among the heathen, then one hour of mercy',
       E'The sentence ends not in misfortune but in mercy: *But in the fourth outgoing of a hundred years and one hour of the age — the same is a hundred years — it shall be in misfortune among the heathen, but one hour in mercy and contumely, as among the heathen* (Apocalypse of Abraham 28:5). The misfortune is real, but it is bounded, and the "hour of mercy" turns toward the gathering Torah promised the scattered: *And shalt return unto Yahuah Elohayka (the LORD thy God)... That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:2-3). The prophets name the hour: *And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem* (Isaiah 27:13). It is the two-house recovery, the seed of Abraham regathered — not a new people supplanting the old, but the *remnant* of his people: *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left* (Isaiah 11:11). And Sha''ul says the same mercy is no parenthesis: *And so all Yashar''el (Israel) shall be saved* (Romans 11:26). The "one hour in mercy" of Apocalypse of Abraham 28:5 is the trumpet of the ingathering.',
       sv.verse_id, ev.verse_id, 'extras', 67681
  FROM _session253_aoa28_lookup sv, _session253_aoa28_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=28 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-28-the-measured-term
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* In the very vision Abraham here recalls, the term of his seed''s affliction was spoken in numbers, exactly the "how long" he asks in Apocalypse of Abraham 28:3.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa28_lookup sv, _session253_aoa28_lookup tv
 WHERE t.slug='apocalypse-of-abraham-28-the-measured-term'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:14 — *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance.* The measured affliction of Apocalypse of Abraham 28:3 closes in the LORD''s judgment on the oppressor and the coming-out of the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa28_lookup sv, _session253_aoa28_lookup tv
 WHERE t.slug='apocalypse-of-abraham-28-the-measured-term'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-28-scattered-among-the-heathen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 26:33 — *And I will scatter you among the heathen, and will draw out a sword after you: and your land shall be desolate, and your cities waste.* The retribution "accomplished" upon the multitude in Apocalypse of Abraham 28:4 is the Torah-foretold scattering among the heathen.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa28_lookup sv, _session253_aoa28_lookup tv
 WHERE t.slug='apocalypse-of-abraham-28-scattered-among-the-heathen'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 26:42 — *Then will I remember my covenant with Jacob, and also my covenant with Isaac, and also my covenant with Abraham will I remember; and I will remember the land.* The very covenant with Abraham — whose vision this is — is what survives the retribution of Apocalypse of Abraham 28:4.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa28_lookup sv, _session253_aoa28_lookup tv
 WHERE t.slug='apocalypse-of-abraham-28-scattered-among-the-heathen'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 26:44 — *And yet for all that, when they be in the land of their enemies, I will not cast them away, neither will I abhor them, to destroy them utterly, and to break my covenant with them: for I am Yahuah (LORD) their Elohim (God).* Even in the retribution of Apocalypse of Abraham 28:4, the people are disciplined, not cast away — election holds.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa28_lookup sv, _session253_aoa28_lookup tv
 WHERE t.slug='apocalypse-of-abraham-28-scattered-among-the-heathen'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-28-one-hour-in-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* The "one hour in mercy" of Apocalypse of Abraham 28:5 is Torah''s promise to gather the scattered after the misfortune among the heathen.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa28_lookup sv, _session253_aoa28_lookup tv
 WHERE t.slug='apocalypse-of-abraham-28-one-hour-in-mercy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 27:13 — *And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* The hour of mercy in Apocalypse of Abraham 28:5 is the great-trumpet ingathering of the outcasts.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa28_lookup sv, _session253_aoa28_lookup tv
 WHERE t.slug='apocalypse-of-abraham-28-one-hour-in-mercy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=27 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The mercy after the heathen-misfortune of Apocalypse of Abraham 28:5 is the second-time, two-house recovery of Abraham''s own seed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa28_lookup sv, _session253_aoa28_lookup tv
 WHERE t.slug='apocalypse-of-abraham-28-one-hour-in-mercy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 11:26 — *And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob:* Sha''ul confirms the hour of mercy in Apocalypse of Abraham 28:5 — the scattered seed is saved, not replaced.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa28_lookup sv, _session253_aoa28_lookup tv
 WHERE t.slug='apocalypse-of-abraham-28-one-hour-in-mercy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

