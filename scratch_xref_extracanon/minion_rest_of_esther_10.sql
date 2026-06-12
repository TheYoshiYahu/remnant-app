-- ----- fragment: minion_therestofesther_10.sql (session253 the-rest-of-esther 10) -----
-- Source anchor: apocrypha/the-rest-of-esther ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: roe10 (view _session253_roe10_lookup). Sort band base 60400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_roe10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: rest-of-esther-10-the-dream-interpreted-hidden-hand
  ('apocrypha', 'the-rest-of-esther', 10, 1, 'canon', 'esther', 9, 1, 'free', E'Esther 9:1 — *Now in the twelfth month, that is, the month Adar, on the thirteenth day of the same, when the king’s commandment and his decree drew near to be put in execution, in the day that the enemies of the Yahudim (Jews) hoped to have power over them, (though it was turned to the contrary, that the Yahudim (Jews) had rule over them that hated them;)* The river that the little fountain became is the great reversal of Esther 9, the hidden hand of The Rest of Esther 10:6 made visible in history.'),
  ('apocrypha', 'the-rest-of-esther', 10, 1, 'canon', 'genesis', 50, 20, 'free', E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* Joseph and Mardocheus read the same Author behind the plot, that nothing of His dream had failed (The Rest of Esther 10:5).'),
  ('apocrypha', 'the-rest-of-esther', 10, 1, 'canon', 'romans', 8, 28, 'free', E'Romans 8:28 — *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* The dream that failed in nothing (The Rest of Esther 10:5) is the same purpose by which all things work together for His called.'),
  -- thread: rest-of-esther-10-two-dragons-seed-war-amalek
  ('apocrypha', 'the-rest-of-esther', 10, 1, 'canon', 'exodus', 17, 8, 'free', E'Exodus 17:8 — *Then came Amalek, and fought with Yashar''el (Israel) in Rephidim.* Aman the Agagite, the second dragon of The Rest of Esther 10:7, is the seed of the Amalek that first warred against Yashar''el at Rephidim.'),
  ('apocrypha', 'the-rest-of-esther', 10, 1, 'canon', 'deuteronomy', 25, 17, 'free', E'Deuteronomy 25:17 — *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt;* The nations assembled to destroy the Name of the Yahudim (The Rest of Esther 10:8) are the standing order of Amalek that Torah commands Yashar''el never to forget.'),
  ('apocrypha', 'the-rest-of-esther', 10, 1, 'canon', 'deuteronomy', 25, 19, 'free', E'Deuteronomy 25:19 — *Therefore it shall be, when Yahuah Elohayka (the LORD thy God) hath given thee rest from all thine enemies round about, in the land which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance to possess it, that thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it.* The fall of Aman and his assembled nations (The Rest of Esther 10:8) is the blotting-out of Amalek the covenant had sworn long before.'),
  -- thread: rest-of-esther-10-cried-to-yahuah-and-were-saved
  ('apocrypha', 'the-rest-of-esther', 10, 1, 'canon', 'psalms', 124, 1, 'free', E'Psalm 124:1 — *If it had not been Yahuah (LORD) who was on our side, now may Yashar''el (Israel) say;* The very confession of The Rest of Esther 10:9, that it was Yahuah and not the sword who saved His people.'),
  ('apocrypha', 'the-rest-of-esther', 10, 1, 'canon', 'psalms', 124, 3, 'free', E'Psalm 124:3 — *Then they had swallowed us up quick, when their wrath was kindled against us:* Without the hand that delivered them from all those evils (The Rest of Esther 10:9), the assembled nations would have swallowed Yashar''el alive.'),
  ('apocrypha', 'the-rest-of-esther', 10, 1, 'canon', 'isaiah', 54, 17, 'free', E'Isaiah 54:17 — *No weapon that is formed against thee shall prosper; and every tongue that shall rise against thee in judgment thou shalt condemn. This is the heritage of the servants of Yahuah (LORD), and their righteousness is of me, saith Yahuah (LORD).* The nation saved when it cried (The Rest of Esther 10:9) is the heritage against which no weapon Haman forged could prosper.'),
  -- thread: rest-of-esther-10-two-lots-day-of-judgment-feast
  ('apocrypha', 'the-rest-of-esther', 10, 1, 'canon', 'matthew', 25, 32, 'free', E'Matthew 25:32 — *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* The two lots that come at the day of judgment among all nations (The Rest of Esther 10:11) foreshadow the Son of Adam dividing all nations one from another.'),
  ('apocrypha', 'the-rest-of-esther', 10, 1, 'canon', 'leviticus', 23, 4, 'free', E'Leviticus 23:4 — *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons.* The fixed assembly of the fourteenth and fifteenth of Adar before Yahuah (The Rest of Esther 10:13) is feast-keeping in the pattern of the appointed convocations of Torah.'),
  ('apocrypha', 'the-rest-of-esther', 10, 1, 'canon', 'esther', 9, 22, 'free', E'Esther 9:22 — *As the days wherein the Yahudim (Jews) rested from their enemies, and the month which was turned unto them from sorrow to joy, and from mourning into a good day: that they should make them days of feasting and joy, and of sending portions one to another, and gifts to the poor.* The same days of Adar that The Rest of Esther 10:13 fixes with assembly and gladness, the month turned from sorrow to joy.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_roe10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_roe10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-10-the-dream-interpreted-hidden-hand',
       E'The little fountain that became a river — the hidden hand of Yahuah',
       E'Mardocheus reads his own dream and finds the whole deliverance was authored before it unfolded: *For I remember a dream which I saw concerning these matters, and nothing thereof has failed.* (The Rest of Esther 10:5) — *A little fountain became a river, and there was light, and the sun, and much water: this river is Esther, whom the king married, and made queen* (The Rest of Esther 10:6). The little fountain swelling into a river is the unnamed providence of Esther''s whole book, where the Name of Yahuah is never spoken yet His hand is on every reversal: *(though it was turned to the contrary, that the Yahudim (Jews) had rule over them that hated them;)* (Esther 9:1). It is the same hidden hand that turned a brother''s betrayal into a nation''s rescue — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* (Genesis 50:20) — and the same law of the unseen ordering that Sha''ul names: *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* (Romans 8:28). It ain''t new: the fountain quietly becomes the river.',
       sv.verse_id, ev.verse_id, 'extras', 60400
  FROM _session253_roe10_lookup sv, _session253_roe10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=10 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-10-two-dragons-seed-war-amalek',
       E'The two dragons — the Agagite and the ancient seed-war',
       E'The interpretation names the combatants: *And the two dragons are I and Aman.* (The Rest of Esther 10:7) — *And the nations were those that were assembled to destroy the name of the Yahudim (Jews)* (The Rest of Esther 10:8). Haman the Agagite is no random villain; he is the living tail of an old serpent, the seed of Amalek that Yahuah swore to blot out: *Then came Amalek, and fought with Yashar''el (Israel) in Rephidim.* (Exodus 17:8). The covenant remembered the grudge — *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt; ... Therefore it shall be, when Yahuah Elohayka (the LORD thy God) hath given thee rest from all thine enemies round about ... that thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it.* (Deuteronomy 25:17, Deuteronomy 25:19) — and in Esther''s day the gallows finishes what Rephidim began. The two dragons coil through the whole Scripture; the dismantling is of the seed of malice, not of flesh and blood for its own sake.',
       sv.verse_id, ev.verse_id, 'extras', 60403
  FROM _session253_roe10_lookup sv, _session253_roe10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=10 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-10-cried-to-yahuah-and-were-saved',
       E'They cried to Yahuah and were saved — no weapon shall prosper',
       E'The heart of the interpretation is a confession, not a boast: *And my nation is this Yashar''el (Israel), which cried to Yahuah (God), and were saved: for Yahuah (God) has saved his people, and Yahuah (God) has delivered us from all those evils* (The Rest of Esther 10:9). The deliverance was never the sword''s; it was the cry answered. So sings the ascent psalm: *If it had not been Yahuah (LORD) who was on our side, now may Yashar''el (Israel) say; ... Then they had swallowed us up quick, when their wrath was kindled against us* (Psalm 124:1, Psalm 124:3). And so the Holy One seals His servants against every Haman ever to rise: *No weapon that is formed against thee shall prosper; and every tongue that shall rise against thee in judgment thou shalt condemn. This is the heritage of the servants of Yahuah (LORD), and their righteousness is of me, saith Yahuah (LORD).* (Isaiah 54:17). The nation that cried and was saved is the heritage that no formed weapon can undo.',
       sv.verse_id, ev.verse_id, 'extras', 60406
  FROM _session253_roe10_lookup sv, _session253_roe10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=10 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-10-two-lots-day-of-judgment-feast',
       E'Two lots, the day of judgment, and the appointed feast of Adar',
       E'The dream ends in a sorting and a feast: *Therefore has he made two lots, one for the people of Yahuah (God), and another for all the Gentiles* (The Rest of Esther 10:10) — *And these two lots came at the hour, and time, and day of judgment, before Yahuah (God) among all nations* (The Rest of Esther 10:11). The two lots at the day of judgment foreshadow the great separation: *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* (Matthew 25:32). And the deliverance is fixed as a moed, an appointed time set before Yahuah: *Therefore those days shall be to them in the month Adar, the fourteenth and fifteenth day of the same month, with an assembly, and joy, and with gladness before Yahuah (God)* (The Rest of Esther 10:13). It is feast-keeping in the pattern Torah laid down — *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons.* (Leviticus 23:4) — the month *turned unto them from sorrow to joy, and from mourning into a good day* (Esther 9:22). The lot for the people of Yahuah ends in an assembly of gladness.',
       sv.verse_id, ev.verse_id, 'extras', 60409
  FROM _session253_roe10_lookup sv, _session253_roe10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=10 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: rest-of-esther-10-the-dream-interpreted-hidden-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 9:1 — *Now in the twelfth month, that is, the month Adar, on the thirteenth day of the same, when the king’s commandment and his decree drew near to be put in execution, in the day that the enemies of the Yahudim (Jews) hoped to have power over them, (though it was turned to the contrary, that the Yahudim (Jews) had rule over them that hated them;)* The river that the little fountain became is the great reversal of Esther 9, the hidden hand of The Rest of Esther 10:6 made visible in history.'
  FROM cross_reference_threads t, cross_references x, _session253_roe10_lookup sv, _session253_roe10_lookup tv
 WHERE t.slug='rest-of-esther-10-the-dream-interpreted-hidden-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 50:20 — *But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* Joseph and Mardocheus read the same Author behind the plot, that nothing of His dream had failed (The Rest of Esther 10:5).'
  FROM cross_reference_threads t, cross_references x, _session253_roe10_lookup sv, _session253_roe10_lookup tv
 WHERE t.slug='rest-of-esther-10-the-dream-interpreted-hidden-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:28 — *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* The dream that failed in nothing (The Rest of Esther 10:5) is the same purpose by which all things work together for His called.'
  FROM cross_reference_threads t, cross_references x, _session253_roe10_lookup sv, _session253_roe10_lookup tv
 WHERE t.slug='rest-of-esther-10-the-dream-interpreted-hidden-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-10-two-dragons-seed-war-amalek
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 17:8 — *Then came Amalek, and fought with Yashar''el (Israel) in Rephidim.* Aman the Agagite, the second dragon of The Rest of Esther 10:7, is the seed of the Amalek that first warred against Yashar''el at Rephidim.'
  FROM cross_reference_threads t, cross_references x, _session253_roe10_lookup sv, _session253_roe10_lookup tv
 WHERE t.slug='rest-of-esther-10-two-dragons-seed-war-amalek'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 25:17 — *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt;* The nations assembled to destroy the Name of the Yahudim (The Rest of Esther 10:8) are the standing order of Amalek that Torah commands Yashar''el never to forget.'
  FROM cross_reference_threads t, cross_references x, _session253_roe10_lookup sv, _session253_roe10_lookup tv
 WHERE t.slug='rest-of-esther-10-two-dragons-seed-war-amalek'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 25:19 — *Therefore it shall be, when Yahuah Elohayka (the LORD thy God) hath given thee rest from all thine enemies round about, in the land which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance to possess it, that thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it.* The fall of Aman and his assembled nations (The Rest of Esther 10:8) is the blotting-out of Amalek the covenant had sworn long before.'
  FROM cross_reference_threads t, cross_references x, _session253_roe10_lookup sv, _session253_roe10_lookup tv
 WHERE t.slug='rest-of-esther-10-two-dragons-seed-war-amalek'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-10-cried-to-yahuah-and-were-saved
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 124:1 — *If it had not been Yahuah (LORD) who was on our side, now may Yashar''el (Israel) say;* The very confession of The Rest of Esther 10:9, that it was Yahuah and not the sword who saved His people.'
  FROM cross_reference_threads t, cross_references x, _session253_roe10_lookup sv, _session253_roe10_lookup tv
 WHERE t.slug='rest-of-esther-10-cried-to-yahuah-and-were-saved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=124 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 124:3 — *Then they had swallowed us up quick, when their wrath was kindled against us:* Without the hand that delivered them from all those evils (The Rest of Esther 10:9), the assembled nations would have swallowed Yashar''el alive.'
  FROM cross_reference_threads t, cross_references x, _session253_roe10_lookup sv, _session253_roe10_lookup tv
 WHERE t.slug='rest-of-esther-10-cried-to-yahuah-and-were-saved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=124 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 54:17 — *No weapon that is formed against thee shall prosper; and every tongue that shall rise against thee in judgment thou shalt condemn. This is the heritage of the servants of Yahuah (LORD), and their righteousness is of me, saith Yahuah (LORD).* The nation saved when it cried (The Rest of Esther 10:9) is the heritage against which no weapon Haman forged could prosper.'
  FROM cross_reference_threads t, cross_references x, _session253_roe10_lookup sv, _session253_roe10_lookup tv
 WHERE t.slug='rest-of-esther-10-cried-to-yahuah-and-were-saved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-10-two-lots-day-of-judgment-feast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 25:32 — *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* The two lots that come at the day of judgment among all nations (The Rest of Esther 10:11) foreshadow the Son of Adam dividing all nations one from another.'
  FROM cross_reference_threads t, cross_references x, _session253_roe10_lookup sv, _session253_roe10_lookup tv
 WHERE t.slug='rest-of-esther-10-two-lots-day-of-judgment-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 23:4 — *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons.* The fixed assembly of the fourteenth and fifteenth of Adar before Yahuah (The Rest of Esther 10:13) is feast-keeping in the pattern of the appointed convocations of Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_roe10_lookup sv, _session253_roe10_lookup tv
 WHERE t.slug='rest-of-esther-10-two-lots-day-of-judgment-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Esther 9:22 — *As the days wherein the Yahudim (Jews) rested from their enemies, and the month which was turned unto them from sorrow to joy, and from mourning into a good day: that they should make them days of feasting and joy, and of sending portions one to another, and gifts to the poor.* The same days of Adar that The Rest of Esther 10:13 fixes with assembly and gladness, the month turned from sorrow to joy.'
  FROM cross_reference_threads t, cross_references x, _session253_roe10_lookup sv, _session253_roe10_lookup tv
 WHERE t.slug='rest-of-esther-10-two-lots-day-of-judgment-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=9 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

