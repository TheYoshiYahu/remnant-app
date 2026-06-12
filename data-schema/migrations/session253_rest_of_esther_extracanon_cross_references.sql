-- =====================================================================
-- Session 253 — The Rest of Esther FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session253_rest_of_esther_extracanon_cross_references.sql
-- =====================================================================

\echo 'session253 — The Rest of Esther cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_therestofesther_11.sql (session253 the-rest-of-esther 11) -----
-- Source anchor: apocrypha/the-rest-of-esther ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: roe11 (view _session253_roe11_lookup). Sort band base 60425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_roe11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: rest-of-esther-11-two-dragons-sea-war
  ('apocrypha', 'the-rest-of-esther', 11, 6, 'canon', 'daniel', 7, 2, 'free', E'Daniel 7:2 — *Daniel spake and said, I saw in my vision by night, and, behold, the four winds of the heaven strove upon the great sea.* The troubled sea of the nations is the same churning waters from which Mordecai''s two dragons come forth ready to fight.'),
  ('apocrypha', 'the-rest-of-esther', 11, 6, 'canon', 'daniel', 7, 3, 'free', E'Daniel 7:3 — *And four great beasts came up from the sea, diverse one from another.* The beasts rising from the sea are kin to the great dragons of Mordecai''s dream, the kingdoms arrayed against the saints.'),
  ('apocrypha', 'the-rest-of-esther', 11, 6, 'canon', 'revelation', 12, 7, 'free', E'Revelation 12:7 — *And there was war in heaven: Michael and his angels fought against the dragon; and the dragon fought and his angels,* unveiling the heavenly front of the very dragon-war Mordecai foresaw in Rest of Esther 11:6.'),
  ('apocrypha', 'the-rest-of-esther', 11, 7, 'canon', 'revelation', 12, 17, 'free', E'Revelation 12:17 — *And the dragon was wroth with the woman, and went to make war with the remnant of her seed, which keep the commandments of Elohim (God), and have the testimony of Yahusha HaMashiach (Jesus Christ).* The nations prepared to fight against the righteous people are the dragon making war on the commandment-keeping seed.'),
  -- thread: rest-of-esther-11-day-of-darkness-tribulation
  ('apocrypha', 'the-rest-of-esther', 11, 8, 'canon', 'zephaniah', 1, 15, 'free', E'Zephaniah 1:15 — *That day is a day of wrath, a day of trouble and distress, a day of wasteness and desolation, a day of darkness and gloominess, a day of clouds and thick darkness,* the prophet''s day of darkness matching the day of darkness and obscurity of Rest of Esther 11:8.'),
  ('apocrypha', 'the-rest-of-esther', 11, 9, 'canon', 'daniel', 12, 1, 'free', E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* The righteous nation troubled and ready to perish is the people delivered in the unequalled time of trouble.'),
  -- thread: rest-of-esther-11-cried-to-yahuah-flood
  ('apocrypha', 'the-rest-of-esther', 11, 10, 'canon', 'joel', 2, 32, 'free', E'Joel 2:32 — *And it shall come to pass, that whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance, as Yahuah (LORD) hath said, and in the remnant whom Yahuah (LORD) shall call.* The nation crying to Yahuah and being delivered is the remnant calling on the Name unto deliverance.'),
  ('apocrypha', 'the-rest-of-esther', 11, 10, 'canon', 'psalms', 18, 6, 'free', E'Psalms 18:6 — *In my distress I called upon Yahuah (LORD), and cried unto my Elohim (God): he heard my voice out of his temple, and my cry came before him, even into his ears.* David''s cry from distress heard by Yahuah is the very pattern of the righteous nation''s cry in Rest of Esther 11:10.'),
  ('apocrypha', 'the-rest-of-esther', 11, 10, 'canon', 'exodus', 14, 14, 'free', E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* The flood of much water rising from a little fountain is Yahuah Himself fighting for the people who cried out, as at the sea.'),
  -- thread: rest-of-esther-11-light-rose-lowly-exalted
  ('apocrypha', 'the-rest-of-esther', 11, 11, 'canon', 'isaiah', 60, 1, 'free', E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* The light and the sun rising up in Mordecai''s dream is the risen glory of Yahuah over His delivered people.'),
  ('apocrypha', 'the-rest-of-esther', 11, 11, 'canon', 'isaiah', 9, 2, 'free', E'Isaiah 9:2 — *The people that walked in darkness have seen a great light: they that dwell in the land of the shadow of death, upon them hath the light shined.* The sun rising after the day of darkness is the great light shining on the people of Rest of Esther 11:11.'),
  ('apocrypha', 'the-rest-of-esther', 11, 11, 'canon', '1-samuel', 2, 7, 'free', E'1 Samuel 2:7 — *Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up.* Hannah''s song of the great reversal is exactly the lowly exalted and the glorious devoured in Rest of Esther 11:11.'),
  ('apocrypha', 'the-rest-of-esther', 11, 11, 'canon', 'luke', 1, 52, 'free', E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* Miriam''s Magnificat carries the same covenant overturning — the lowly raised over the glorious — that crowns Mordecai''s dream.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_roe11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_roe11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-11-two-dragons-sea-war',
       E'Two great dragons, the beasts from the troubled sea',
       E'Mordecai''s dream opens with the cosmic seed-war behind the whole Esther deliverance: *And, behold, two great dragons came forth ready to fight, and their cry was great* (Rest of Esther 11:6), *And at their cry all nations were prepared to battle, that they might fight against the righteous people* (Rest of Esther 11:7). It ain''t new — Daniel saw the same vision: *I saw in my vision by night, and, behold, the four winds of the heaven strove upon the great sea* (Daniel 7:2), and *And four great beasts came up from the sea, diverse one from another* (Daniel 7:3). The dragon''s war is named at the last in the Revelation: *And there was war in heaven: Michael and his angels fought against the dragon; and the dragon fought and his angels* (Revelation 12:7), the old serpent who *went to make war with the remnant of her seed, which keep the commandments of Elohim (God), and have the testimony of Yahusha HaMashiach (Jesus Christ)* (Revelation 12:17). The two dragons are the system of the nations marshalled against the kept seed — never against flesh and blood only, but the spiritual battle behind Haman the Agagite.',
       sv.verse_id, ev.verse_id, 'extras', 60425
  FROM _session253_roe11_lookup sv, _session253_roe11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=11 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-11-day-of-darkness-tribulation',
       E'A day of darkness, the time of trouble for the righteous nation',
       E'The dream turns to a day of dread: *And lo a day of darkness and obscurity, tribulation and anguish, affliction and great uproar, upon earth* (Rest of Esther 11:8), *And the whole righteous nation was troubled, fearing their own evils, and were ready to perish* (Rest of Esther 11:9). This is the great-tribulation language of the prophets. Zephaniah named it: *That day is a day of wrath, a day of trouble and distress, a day of wasteness and desolation, a day of darkness and gloominess, a day of clouds and thick darkness* (Zephaniah 1:15). Daniel set it over Mordecai''s own people: *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book* (Daniel 12:1). The righteous nation ready to perish is delivered, as ever, not by its own strength but by the One who fights for them.',
       sv.verse_id, ev.verse_id, 'extras', 60428
  FROM _session253_roe11_lookup sv, _session253_roe11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=11 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-11-cried-to-yahuah-flood',
       E'They cried to Yahuah, and the little fountain became a flood',
       E'At the brink of perishing the nation does the one thing that delivers: *Then they cried to Yahuah (God), and upon their cry, as it were from a little fountain, was made a great flood, even much water* (Rest of Esther 11:10). This is the covenant promise — call on the Name and be delivered. Joel set it down: *And it shall come to pass, that whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance, as Yahuah (LORD) hath said, and in the remnant whom Yahuah (LORD) shall call* (Joel 2:32). David cried the same cry: *In my distress I called upon Yahuah (LORD), and cried unto my Elohim (God): he heard my voice out of his temple, and my cry came before him, even into his ears* (Psalms 18:6). And the deliverance is Yahuah''s own war, not ours: *Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14). The little fountain swelling to a great flood is Esther herself, the small and lowly one through whom the saving river runs.',
       sv.verse_id, ev.verse_id, 'extras', 60431
  FROM _session253_roe11_lookup sv, _session253_roe11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=11 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-11-light-rose-lowly-exalted',
       E'The light and the sun rose up, and the lowly were exalted',
       E'The dream ends in reversal and dawn: *The light and the sun rose up, and the lowly were exalted, and devoured the glorious* (Rest of Esther 11:11). After the day of darkness comes the rising light — Isaiah''s dawn over Zion: *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1), and the people in darkness who *have seen a great light* (Isaiah 9:2). And the lowly exalted over the glorious is the great covenant overturning that Hannah sang and Miriam echoed: *Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up* (1 Samuel 2:7); *He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52). The lowly captive Mordecai, the orphan Esther, are lifted to devour the glory of Haman — Yahuah''s settled way of saving His people through the small.',
       sv.verse_id, ev.verse_id, 'extras', 60434
  FROM _session253_roe11_lookup sv, _session253_roe11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=11 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: rest-of-esther-11-two-dragons-sea-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:2 — *Daniel spake and said, I saw in my vision by night, and, behold, the four winds of the heaven strove upon the great sea.* The troubled sea of the nations is the same churning waters from which Mordecai''s two dragons come forth ready to fight.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-two-dragons-sea-war'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:3 — *And four great beasts came up from the sea, diverse one from another.* The beasts rising from the sea are kin to the great dragons of Mordecai''s dream, the kingdoms arrayed against the saints.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-two-dragons-sea-war'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:7 — *And there was war in heaven: Michael and his angels fought against the dragon; and the dragon fought and his angels,* unveiling the heavenly front of the very dragon-war Mordecai foresaw in Rest of Esther 11:6.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-two-dragons-sea-war'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:17 — *And the dragon was wroth with the woman, and went to make war with the remnant of her seed, which keep the commandments of Elohim (God), and have the testimony of Yahusha HaMashiach (Jesus Christ).* The nations prepared to fight against the righteous people are the dragon making war on the commandment-keeping seed.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-two-dragons-sea-war'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-11-day-of-darkness-tribulation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zephaniah 1:15 — *That day is a day of wrath, a day of trouble and distress, a day of wasteness and desolation, a day of darkness and gloominess, a day of clouds and thick darkness,* the prophet''s day of darkness matching the day of darkness and obscurity of Rest of Esther 11:8.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-day-of-darkness-tribulation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* The righteous nation troubled and ready to perish is the people delivered in the unequalled time of trouble.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-day-of-darkness-tribulation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-11-cried-to-yahuah-flood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:32 — *And it shall come to pass, that whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance, as Yahuah (LORD) hath said, and in the remnant whom Yahuah (LORD) shall call.* The nation crying to Yahuah and being delivered is the remnant calling on the Name unto deliverance.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-cried-to-yahuah-flood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 18:6 — *In my distress I called upon Yahuah (LORD), and cried unto my Elohim (God): he heard my voice out of his temple, and my cry came before him, even into his ears.* David''s cry from distress heard by Yahuah is the very pattern of the righteous nation''s cry in Rest of Esther 11:10.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-cried-to-yahuah-flood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* The flood of much water rising from a little fountain is Yahuah Himself fighting for the people who cried out, as at the sea.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-cried-to-yahuah-flood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-11-light-rose-lowly-exalted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* The light and the sun rising up in Mordecai''s dream is the risen glory of Yahuah over His delivered people.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-light-rose-lowly-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 9:2 — *The people that walked in darkness have seen a great light: they that dwell in the land of the shadow of death, upon them hath the light shined.* The sun rising after the day of darkness is the great light shining on the people of Rest of Esther 11:11.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-light-rose-lowly-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Samuel 2:7 — *Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up.* Hannah''s song of the great reversal is exactly the lowly exalted and the glorious devoured in Rest of Esther 11:11.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-light-rose-lowly-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* Miriam''s Magnificat carries the same covenant overturning — the lowly raised over the glorious — that crowns Mordecai''s dream.'
  FROM cross_reference_threads t, cross_references x, _session253_roe11_lookup sv, _session253_roe11_lookup tv
 WHERE t.slug='rest-of-esther-11-light-rose-lowly-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_therestofesther_12.sql (session253 the-rest-of-esther 12) -----
-- Source anchor: apocrypha/the-rest-of-esther ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: roe12 (view _session253_roe12_lookup). Sort band base 60450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_roe12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: rest-of-esther-12-the-plot-uncovered
  ('apocrypha', 'the-rest-of-esther', 12, 2, 'canon', 'esther', 2, 21, 'free', E'Esther 2:21 — *In those days, while Mordecai sat in the king’s gate, two of the king’s chamberlains, Bigthan and Teresh, of those which kept the door, were wroth, and sought to lay hand on the king Ahasuerus.* The canonical book names the same two door-keepers whose plot Mordecai overhears in Rest of Esther 12:2.'),
  ('apocrypha', 'the-rest-of-esther', 12, 3, 'canon', 'esther', 2, 23, 'free', E'Esther 2:23 — *And when inquisition was made of the matter, it was found out; therefore they were both hanged on a tree: and it was written in the book of the chronicles before the king.* The strangling and the chronicling of Rest of Esther 12:3-4 is this same examination and record set down in the Hebrew.'),
  ('apocrypha', 'the-rest-of-esther', 12, 4, 'canon', 'esther', 6, 2, 'free', E'Esther 6:2 — *And it was found written, that Mordecai had told of Bigthana and Teresh, two of the king’s chamberlains, the keepers of the door, who sought to lay hand on the king Ahasuerus.* The record Mordecai writes in Rest of Esther 12:4 is the very page read on the sleepless night that begins his deliverance.'),
  -- thread: rest-of-esther-12-watchman-of-the-king
  ('apocrypha', 'the-rest-of-esther', 12, 2, 'canon', 'proverbs', 24, 11, 'free', E'Proverbs 24:11 — *If thou forbear to deliver them that are drawn unto death, and those that are ready to be slain;* Mordecai''s certifying of the king in Rest of Esther 12:2 is exactly the deliverance from death the proverb forbids the righteous to withhold.'),
  ('apocrypha', 'the-rest-of-esther', 12, 2, 'canon', 'proverbs', 24, 12, 'free', E'Proverbs 24:12 — *If thou sayest, Behold, we knew it not; doth not he that pondereth the heart consider it? and he that keepeth thy soul, doth not he know it? and shall not he render to every man according to his works?* The plot Mordecai searches out in Rest of Esther 12:2 cannot be feigned-ignorant, for the One who ponders the heart renders to each according to his works.'),
  ('apocrypha', 'the-rest-of-esther', 12, 2, 'canon', 'ecclesiastes', 10, 20, 'free', E'Ecclesiastes 10:20 — *Curse not the king, no not in thy thought; and curse not the rich in thy bedchamber: for a bird of the air shall carry the voice, and that which hath wings shall tell the matter.* The eunuchs'' devices in Rest of Esther 12:2 are the hidden voice that wings its way to the king''s ear through the watchman who heard.'),
  -- thread: rest-of-esther-12-the-servant-rewarded
  ('apocrypha', 'the-rest-of-esther', 12, 5, 'canon', 'esther', 6, 11, 'free', E'Esther 6:11 — *Then took Haman the apparel and the horse, and arrayed Mordecai, and brought him on horseback through the street of the city, and proclaimed before him, Thus shall it be done unto the man whom the king delighteth to honour.* The reward promised in Rest of Esther 12:5 is paid by Haman''s own hand in the Hebrew, the enemy parading the man he hated.'),
  ('apocrypha', 'the-rest-of-esther', 12, 5, 'canon', 'esther', 10, 3, 'free', E'Esther 10:3 — *For Mordecai the Yahudi (Jew) was next unto king Ahasuerus, and great among the Yahudim (Jews), and accepted of the multitude of his brethren, seeking the wealth of his people, and speaking peace to all his seed.* Mordecai''s service-and-reward in Rest of Esther 12:5 ripens into the second seat of the kingdom and peace for his whole people.'),
  -- thread: rest-of-esther-12-haman-the-agagite
  ('apocrypha', 'the-rest-of-esther', 12, 6, 'canon', 'esther', 3, 6, 'free', E'Esther 3:6 — *And he thought scorn to lay hands on Mordecai alone; for they had shewed him the people of Mordecai: wherefore Haman sought to destroy all the Yahudim (Jews) that were throughout the whole kingdom of Ahasuerus, even the people of Mordecai.* The grudge that begins against Mordecai''s people in Rest of Esther 12:6 swells in the Hebrew into a decree to destroy the whole nation.'),
  ('apocrypha', 'the-rest-of-esther', 12, 6, 'canon', '1-samuel', 15, 2, 'free', E'1 Samuel 15:2 — *Thus saith Yahuah Tseva''ot (LORD of hosts), I remember that which Amalek did to Yashar''el (Israel), how he laid wait for him in the way, when he came up from Egypt.* Haman the Agagite of Rest of Esther 12:6 is the line of Agag king of Amalek, carrying forward the ancient enmity Yahuah remembers.'),
  ('apocrypha', 'the-rest-of-esther', 12, 6, 'canon', 'deuteronomy', 25, 17, 'free', E'Deuteronomy 25:17 — *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt;* the Agagite''s grudge in Rest of Esther 12:6 is the standing Torah-charge against Amalek breaking out again in Persia.'),
  ('apocrypha', 'the-rest-of-esther', 12, 6, 'canon', 'exodus', 17, 14, 'free', E'Exodus 17:14 — *And Yahuah (LORD) said unto Moses, Write this for a memorial in a book, and rehearse it in the ears of Joshua: for I will utterly put out the remembrance of Amalek from under heaven.* The seed-war Haman renews in Rest of Esther 12:6 is the very Amalek whose remembrance Yahuah swore to blot out.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_roe12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_roe12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-12-the-plot-uncovered',
       E'Mordecai uncovers the plot and is written into the book',
       E'The Greek additions retell, in their own hand, the scene the Hebrew already knows: *And he heard their devices, and searched out their purposes, and learned that they were about to lay hands upon Artexerxes the king; and so he certified the king of them* (Rest of Esther 12:2), and *the king made a record of these things, and Mardocheus also wrote thereof* (Rest of Esther 12:4). It is the very door-keepers'' conspiracy of the canonical book: *In those days, while Mordecai sat in the king’s gate, two of the king’s chamberlains, Bigthan and Teresh, of those which kept the door, were wroth, and sought to lay hand on the king Ahasuerus* (Esther 2:21), and when inquisition was made *they were both hanged on a tree: and it was written in the book of the chronicles before the king* (Esther 2:23). The writing is no idle detail — on the sleepless night it is read back, *and it was found written, that Mordecai had told of Bigthana and Teresh* (Esther 6:2), and the unforgotten record begins to turn the wheel of deliverance. It ain''t new: the righteous watchman speaks, and Yahuah keeps the books.',
       sv.verse_id, ev.verse_id, 'extras', 60450
  FROM _session253_roe12_lookup sv, _session253_roe12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=12 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-12-watchman-of-the-king',
       E'The watchful righteous who delivers from death',
       E'*And he heard their devices, and searched out their purposes... and so he certified the king of them* (Rest of Esther 12:2). Mordecai is the watchman who will not be silent, and Wisdom binds his act to a charge laid on every righteous one: *If thou forbear to deliver them that are drawn unto death, and those that are ready to be slain; If thou sayest, Behold, we knew it not; doth not he that pondereth the heart consider it? and he that keepeth thy soul, doth not he know it? and shall not he render to every man according to his works?* (Proverbs 24:11-12). What he overhears in secret does not stay secret, for the proverb warns *Curse not the king, no not in thy thought... for a bird of the air shall carry the voice, and that which hath wings shall tell the matter* (Ecclesiastes 10:20) — the eunuchs'' whispered treason is carried to the throne by the one who heard it. The just man speaks; the King of all the earth keeps account.',
       sv.verse_id, ev.verse_id, 'extras', 60453
  FROM _session253_roe12_lookup sv, _session253_roe12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=12 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-12-the-servant-rewarded',
       E'The faithful servant set in the court and rewarded',
       E'*So the king commanded, Mardocheus to serve in the court, and for this he rewarded him* (Rest of Esther 12:5). The reward foreshadowed here is paid out in full in the canonical scene, when the very enemy is made to honour him: *Then took Haman the apparel and the horse, and arrayed Mordecai, and brought him on horseback through the street of the city, and proclaimed before him, Thus shall it be done unto the man whom the king delighteth to honour* (Esther 6:11). And the reward ripens into greatness for the sake of his people, *For Mordecai the Yahudi (Jew) was next unto king Ahasuerus, and great among the Yahudim (Jews), and accepted of the multitude of his brethren, seeking the wealth of his people, and speaking peace to all his seed* (Esther 10:3). The watchman of chapter 12 becomes the second of the kingdom — faithfulness in the small certified word lifted to peace for the whole seed.',
       sv.verse_id, ev.verse_id, 'extras', 60456
  FROM _session253_roe12_lookup sv, _session253_roe12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=12 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-12-haman-the-agagite',
       E'Haman the Agagite — the old seed-war begins again',
       E'*Howbeit Aman the son of Amadathus the Agagite, who was in great honour with the king, sought to molest Mardocheus and his people because of the two eunuchs of the king* (Rest of Esther 12:6). The grudge is no private quarrel — the title *Agagite* names the ancient seed-war, for Haman is reckoned of Agag the Amalekite, whom the prophet rebuked Saul for sparing: *Thus saith Yahuah Tseva''ot (LORD of hosts), I remember that which Amalek did to Yashar''el (Israel), how he laid wait for him in the way, when he came up from Egypt* (1 Samuel 15:2). It is the standing charge of the Torah, *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt* (Deuteronomy 25:17), the foe of whom Yahuah swore *I will utterly put out the remembrance of Amalek from under heaven* (Exodus 17:14). And so in the canonical book the enmity flares against the whole people: *he thought scorn to lay hands on Mordecai alone... wherefore Haman sought to destroy all the Yahudim (Jews) that were throughout the whole kingdom* (Esther 3:6). It ain''t new: the serpent''s old hatred of the seed, raised up once more in a court of Persia — and once more brought to nothing.',
       sv.verse_id, ev.verse_id, 'extras', 60459
  FROM _session253_roe12_lookup sv, _session253_roe12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=12 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: rest-of-esther-12-the-plot-uncovered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 2:21 — *In those days, while Mordecai sat in the king’s gate, two of the king’s chamberlains, Bigthan and Teresh, of those which kept the door, were wroth, and sought to lay hand on the king Ahasuerus.* The canonical book names the same two door-keepers whose plot Mordecai overhears in Rest of Esther 12:2.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-the-plot-uncovered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Esther 2:23 — *And when inquisition was made of the matter, it was found out; therefore they were both hanged on a tree: and it was written in the book of the chronicles before the king.* The strangling and the chronicling of Rest of Esther 12:3-4 is this same examination and record set down in the Hebrew.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-the-plot-uncovered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Esther 6:2 — *And it was found written, that Mordecai had told of Bigthana and Teresh, two of the king’s chamberlains, the keepers of the door, who sought to lay hand on the king Ahasuerus.* The record Mordecai writes in Rest of Esther 12:4 is the very page read on the sleepless night that begins his deliverance.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-the-plot-uncovered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-12-watchman-of-the-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 24:11 — *If thou forbear to deliver them that are drawn unto death, and those that are ready to be slain;* Mordecai''s certifying of the king in Rest of Esther 12:2 is exactly the deliverance from death the proverb forbids the righteous to withhold.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-watchman-of-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 24:12 — *If thou sayest, Behold, we knew it not; doth not he that pondereth the heart consider it? and he that keepeth thy soul, doth not he know it? and shall not he render to every man according to his works?* The plot Mordecai searches out in Rest of Esther 12:2 cannot be feigned-ignorant, for the One who ponders the heart renders to each according to his works.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-watchman-of-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiastes 10:20 — *Curse not the king, no not in thy thought; and curse not the rich in thy bedchamber: for a bird of the air shall carry the voice, and that which hath wings shall tell the matter.* The eunuchs'' devices in Rest of Esther 12:2 are the hidden voice that wings its way to the king''s ear through the watchman who heard.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-watchman-of-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=10 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-12-the-servant-rewarded
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 6:11 — *Then took Haman the apparel and the horse, and arrayed Mordecai, and brought him on horseback through the street of the city, and proclaimed before him, Thus shall it be done unto the man whom the king delighteth to honour.* The reward promised in Rest of Esther 12:5 is paid by Haman''s own hand in the Hebrew, the enemy parading the man he hated.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-the-servant-rewarded'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Esther 10:3 — *For Mordecai the Yahudi (Jew) was next unto king Ahasuerus, and great among the Yahudim (Jews), and accepted of the multitude of his brethren, seeking the wealth of his people, and speaking peace to all his seed.* Mordecai''s service-and-reward in Rest of Esther 12:5 ripens into the second seat of the kingdom and peace for his whole people.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-the-servant-rewarded'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-12-haman-the-agagite
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 3:6 — *And he thought scorn to lay hands on Mordecai alone; for they had shewed him the people of Mordecai: wherefore Haman sought to destroy all the Yahudim (Jews) that were throughout the whole kingdom of Ahasuerus, even the people of Mordecai.* The grudge that begins against Mordecai''s people in Rest of Esther 12:6 swells in the Hebrew into a decree to destroy the whole nation.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-haman-the-agagite'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 15:2 — *Thus saith Yahuah Tseva''ot (LORD of hosts), I remember that which Amalek did to Yashar''el (Israel), how he laid wait for him in the way, when he came up from Egypt.* Haman the Agagite of Rest of Esther 12:6 is the line of Agag king of Amalek, carrying forward the ancient enmity Yahuah remembers.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-haman-the-agagite'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 25:17 — *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt;* the Agagite''s grudge in Rest of Esther 12:6 is the standing Torah-charge against Amalek breaking out again in Persia.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-haman-the-agagite'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 17:14 — *And Yahuah (LORD) said unto Moses, Write this for a memorial in a book, and rehearse it in the ears of Joshua: for I will utterly put out the remembrance of Amalek from under heaven.* The seed-war Haman renews in Rest of Esther 12:6 is the very Amalek whose remembrance Yahuah swore to blot out.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-haman-the-agagite'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_therestofesther_13.sql (session253 the-rest-of-esther 13) -----
-- Source anchor: apocrypha/the-rest-of-esther ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: roe13 (view _session253_roe13_lookup). Sort band base 60475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_roe13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: rest-of-esther-13-the-decree-against-the-nation
  ('apocrypha', 'the-rest-of-esther', 13, 4, 'canon', 'esther', 3, 8, 'free', E'Esther 3:8 — *And Haman said unto king Ahasuerus, There is a certain people scattered abroad and dispersed among the people in all the provinces of thy kingdom; and their laws are diverse from all people; neither keep they the king''s laws: therefore it is not for the king''s profit to suffer them.* The Greek letter merely formalizes the very accusation Haman makes in the Hebrew Esther — a scattered people whose Torah-difference is cast as treason.'),
  ('apocrypha', 'the-rest-of-esther', 13, 6, 'canon', 'esther', 3, 13, 'free', E'Esther 3:13 — *And the letters were sent by posts into all the king''s provinces, to destroy, to kill, and to cause to perish, all Yahudim (Jews), both young and old, little children and women, in one day, even upon the thirteenth day of the twelfth month, which is the month Adar, and to take the spoil of them for a prey.* This is the same sword-without-mercy edict against wives and children that the rest-of-Esther letter publishes against the whole people.'),
  ('apocrypha', 'the-rest-of-esther', 13, 7, 'canon', 'psalms', 83, 4, 'free', E'Psalm 83:4 — *They have said, Come, and let us cut them off from being a nation; that the name of Yashar''el (Israel) may be no more in remembrance.* Haman''s plot to send a people "in one day" into the grave is one episode of the recurring confederate vow to erase Israel from the earth.'),
  -- thread: rest-of-esther-13-i-bowed-not-to-haman
  ('apocrypha', 'the-rest-of-esther', 13, 14, 'canon', 'exodus', 20, 3, 'free', E'Exodus 20:3 — *Thou shalt have no other gods before me.* Mordecai''s refusal to bow to Haman is simple obedience to the first commandment — no glory of man placed before the glory of Elohim.'),
  ('apocrypha', 'the-rest-of-esther', 13, 14, 'canon', 'exodus', 20, 5, 'free', E'Exodus 20:5 — *Thou shalt not bow down thyself to them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God), visiting the iniquity of the fathers upon the children unto the third and fourth generation of them that hate me;* The very posture Mordecai withholds from Haman — bowing down and serving — is the act Sinai reserves for Yahuah alone.'),
  ('apocrypha', 'the-rest-of-esther', 13, 12, 'canon', 'daniel', 3, 18, 'free', E'Daniel 3:18 — *But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up.* Mordecai in Persia and the three in Babylon make the identical confession: no image, no man, gets the worship due to Elohim, whatever the cost.'),
  ('apocrypha', 'the-rest-of-esther', 13, 14, 'canon', 'psalms', 115, 1, 'free', E'Psalm 115:1 — *Not unto us, O Yahuah (LORD), not unto us, but unto thy name give glory, for thy mercy, and for thy truth''s sake.* Mordecai''s refusal "to prefer the glory of man above the glory of Yahuah" is this psalm enacted — the Name keeps its glory.'),
  -- thread: rest-of-esther-13-king-almighty-maker-of-heaven-and-earth
  ('apocrypha', 'the-rest-of-esther', 13, 10, 'canon', 'nehemiah', 9, 6, 'free', E'Nehemiah 9:6 — *Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee.* Mordecai''s "you have made heaven and earth" is the same monotheist confession the Levites pray over the returned exiles.'),
  ('apocrypha', 'the-rest-of-esther', 13, 11, 'canon', 'psalms', 115, 4, 'free', E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands.* Against the made-by-hands gods of the nations, Mordecai owns the living Yahuah whom no man can resist — the system of dead gods is empty, the Maker is not.'),
  ('apocrypha', 'the-rest-of-esther', 13, 10, 'canon', 'isaiah', 44, 23, 'free', E'Isaiah 44:23 — *Sing, O ye heavens; for Yahuah (LORD) hath done it: shout, ye lower parts of the earth: break forth into singing, ye mountains, O forest, and every tree therein: for Yahuah (LORD) hath redeemed Jacob, and glorified himself in Yashar''el (Israel).* The Maker of heaven and earth in Mordecai''s prayer is the same who, having made all things, redeems Jacob — creation and salvation in one hand.'),
  -- thread: rest-of-esther-13-spare-thine-inheritance-out-of-egypt
  ('apocrypha', 'the-rest-of-esther', 13, 15, 'canon', 'deuteronomy', 32, 9, 'free', E'Deuteronomy 32:9 — *For the LORD''S portion is his people; Jacob is the lot of his inheritance.* Mordecai''s word "the inheritance, that has been yours from the beginning" rests on the Song of Moses'' claim that Israel is Yahuah''s own allotted portion.'),
  ('apocrypha', 'the-rest-of-esther', 13, 16, 'canon', 'deuteronomy', 9, 26, 'free', E'Deuteronomy 9:26 — *I prayed therefore unto Yahuah (LORD), and said, O Yahuah (Lord) GOD, destroy not thy people and thine inheritance, which thou hast redeemed through thy greatness, which thou hast brought forth out of Egypt with a mighty hand.* Mordecai''s "despise not the portion delivered out of Egypt" is Moses'' very intercession pleading the Exodus-redeemed inheritance against ruin.'),
  ('apocrypha', 'the-rest-of-esther', 13, 17, 'canon', 'joel', 2, 13, 'free', E'Joel 2:13 — *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil.* Mordecai''s appeal to be "merciful to your inheritance" and to "turn our sorrow into joy" leans on this very mercy that relents from the threatened evil.'),
  -- thread: rest-of-esther-13-haman-the-agagite-the-seed-of-amalek
  ('apocrypha', 'the-rest-of-esther', 13, 3, 'canon', 'exodus', 17, 16, 'free', E'Exodus 17:16 — *For he said, Because Yahuah (LORD) hath sworn that Yahuah (LORD) will have war with Amalek from generation to generation.* Haman the Agagite, of Amalek''s royal seed, is exactly the perpetual foe against whom Yahuah swore this generational war.'),
  ('apocrypha', 'the-rest-of-esther', 13, 6, 'canon', 'deuteronomy', 25, 17, 'free', E'Deuteronomy 25:17 — *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt;* Haman''s edict to slay "with their wives and children" is Amalek''s old work, the very thing Israel is commanded never to forget.'),
  ('apocrypha', 'the-rest-of-esther', 13, 6, 'canon', 'deuteronomy', 25, 18, 'free', E'Deuteronomy 25:18 — *How he met thee by the way, and smote the hindmost of thee, even all that were feeble behind thee, when thou wast faint and weary; and he feared not Elohim (God).* As Amalek struck the feeble hindmost, so Haman the Agagite targets the children and women of the scattered people — the same fearless cruelty.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_roe13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_roe13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-13-the-decree-against-the-nation',
       E'The decree to destroy a people in one day',
       E'Artaxerxes'' letter, drafted by Haman, indicts the covenant people as a scattered law-keeping nation to be wiped out: *Declared to us, that in all nations throughout the world there was scattered a certain malicious people, that had laws contrary to all nations, and continually despised the commandments of kings, so as the uniting of our kingdoms, honourably intended by us cannot go forward.* It ain''t new — it is the same slander Haman whispered in the Hebrew Esther: *And Haman said unto king Ahasuerus, There is a certain people scattered abroad and dispersed among the people in all the provinces of thy kingdom; and their laws are diverse from all people; neither keep they the king''s laws: therefore it is not for the king''s profit to suffer them.* (Esther 3:8). The decree dooms them in a single day — *And the letters were sent by posts into all the king''s provinces, to destroy, to kill, and to cause to perish, all Yahudim (Jews), both young and old, little children and women, in one day, even upon the thirteenth day of the twelfth month, which is the month Adar, and to take the spoil of them for a prey.* (Esther 3:13). And the conspirators'' true aim is older still, the standing oath of the nations against the seed: *They have said, Come, and let us cut them off from being a nation; that the name of Yashar''el (Israel) may be no more in remembrance.* (Psalm 83:4).',
       sv.verse_id, ev.verse_id, 'extras', 60475
  FROM _session253_roe13_lookup sv, _session253_roe13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=13 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-13-i-bowed-not-to-haman',
       E'I bowed not to proud Haman — to no man above Elohim',
       E'Mordecai answers the king''s gate at the price of his life, and explains his refusal before Yahuah: *You know all things, and you know, Yahuah (God), that it was neither in contempt nor pride, nor for any desire of glory, that I did not bow down to proud Aman.* He will not give a man the worship owed to Elohim alone: *But I did this, that I might not prefer the glory of man above the glory of Yahuah (God): neither will I worship any but you, O Yahuah (God), neither will I do it in pride.* It ain''t new — it is the first word of Sinai: *Thou shalt have no other gods before me.* (Exodus 20:3), *Thou shalt not bow down thyself to them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God), visiting the iniquity of the fathers upon the children unto the third and fourth generation of them that hate me;* (Exodus 20:5). Three Hebrew youths take the same stand before another image and another furnace: *But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up.* (Daniel 3:18). And the heart of it — glory to the Name, not to man — is the cry of the Psalms: *Not unto us, O Yahuah (LORD), not unto us, but unto thy name give glory, for thy mercy, and for thy truth''s sake.* (Psalm 115:1).',
       sv.verse_id, ev.verse_id, 'extras', 60478
  FROM _session253_roe13_lookup sv, _session253_roe13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=13 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-13-king-almighty-maker-of-heaven-and-earth',
       E'O Yahuah, the King Almighty, maker of heaven and earth',
       E'Mordecai opens his prayer by confessing the one God over all creation: *Saying, O Yahuah (God), Yahuah (God), the King Almighty: for the whole world is in your power, and if you have appointed to save Yashar''el (Israel), there is no man that can gainsay you.* He grounds the plea in creation and in the uniqueness of Yahuah: *For you have made heaven and earth, and all the wondrous things under the heaven.* — *You are Yahuah (God) of all things, and there is no man that can resist you, which are Yahuah (God).* It ain''t new — it is Nehemiah''s confession and Israel''s creed: *Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee.* (Nehemiah 9:6). The idols of the nations are dumb and dead — *Their idols are silver and gold, the work of men''s hands.* (Psalm 115:4) — but Israel''s God is the living Maker who alone fashioned all things and redeems His own: *Sing, O ye heavens; for Yahuah (LORD) hath done it: shout, ye lower parts of the earth: break forth into singing, ye mountains, O forest, and every tree therein: for Yahuah (LORD) hath redeemed Jacob, and glorified himself in Yashar''el (Israel).* (Isaiah 44:23).',
       sv.verse_id, ev.verse_id, 'extras', 60481
  FROM _session253_roe13_lookup sv, _session253_roe13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=13 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-13-spare-thine-inheritance-out-of-egypt',
       E'Spare thy people, the portion redeemed out of Egypt',
       E'Mordecai pleads not on Israel''s merit but on Yahuah''s own claim — they are His portion, His inheritance: *And now, O Yahuah (God) and King, spare your people: for their eyes are upon us to bring us to nought; yes, they desire to destroy the inheritance, that has been yours from the beginning.* He invokes the Exodus as the title-deed: *Despise not the portion, which you have delivered out of Egypt for your own self.* It ain''t new — it is the song of Moses naming Israel as Yahuah''s own lot: *For the LORD''S portion is his people; Jacob is the lot of his inheritance.* (Deuteronomy 32:9). And it is Moses'' own intercession on the mountain, pleading the redeemed inheritance against destruction: *I prayed therefore unto Yahuah (LORD), and said, O Yahuah (Lord) GOD, destroy not thy people and thine inheritance, which thou hast redeemed through thy greatness, which thou hast brought forth out of Egypt with a mighty hand.* (Deuteronomy 9:26). The plea closes in turning and mercy — "be merciful to your inheritance: turn our sorrow into joy" — the heart of Joel''s call: *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil.* (Joel 2:13).',
       sv.verse_id, ev.verse_id, 'extras', 60484
  FROM _session253_roe13_lookup sv, _session253_roe13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=13 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-13-haman-the-agagite-the-seed-of-amalek',
       E'Haman the Agagite — the seed-war with Amalek',
       E'The whole crisis traces to one man''s pride, the second in the kingdom: *Now when I asked my counsellors how this might be brought to pass, Aman, that excelled in wisdom among us, and was approved for his constant good will and steadfast fidelity, and had the honour of the second place in the kingdom,* Read his Hebrew name and the war comes into focus — Haman the son of Hammedatha the Agagite, of Agag the Amalekite king — so this decree against "a certain malicious people" is the latest assault in an ancient feud. It ain''t new — Yahuah swore the war Himself at Rephidim: *For he said, Because Yahuah (LORD) hath sworn that Yahuah (LORD) will have war with Amalek from generation to generation.* (Exodus 17:16). Moses charged Israel never to forget the cowardly assault on the weak: *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt;* (Deuteronomy 25:17) and *How he met thee by the way, and smote the hindmost of thee, even all that were feeble behind thee, when thou wast faint and weary; and he feared not Elohim (God).* (Deuteronomy 25:18). Haman the Agagite reaches once more for "little children and women" — the hindmost — and so the deliverance through Esther and Mordecai is one more chapter of blotting out the remembrance of Amalek.',
       sv.verse_id, ev.verse_id, 'extras', 60487
  FROM _session253_roe13_lookup sv, _session253_roe13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=13 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: rest-of-esther-13-the-decree-against-the-nation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 3:8 — *And Haman said unto king Ahasuerus, There is a certain people scattered abroad and dispersed among the people in all the provinces of thy kingdom; and their laws are diverse from all people; neither keep they the king''s laws: therefore it is not for the king''s profit to suffer them.* The Greek letter merely formalizes the very accusation Haman makes in the Hebrew Esther — a scattered people whose Torah-difference is cast as treason.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-the-decree-against-the-nation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Esther 3:13 — *And the letters were sent by posts into all the king''s provinces, to destroy, to kill, and to cause to perish, all Yahudim (Jews), both young and old, little children and women, in one day, even upon the thirteenth day of the twelfth month, which is the month Adar, and to take the spoil of them for a prey.* This is the same sword-without-mercy edict against wives and children that the rest-of-Esther letter publishes against the whole people.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-the-decree-against-the-nation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 83:4 — *They have said, Come, and let us cut them off from being a nation; that the name of Yashar''el (Israel) may be no more in remembrance.* Haman''s plot to send a people "in one day" into the grave is one episode of the recurring confederate vow to erase Israel from the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-the-decree-against-the-nation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=83 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-13-i-bowed-not-to-haman
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:3 — *Thou shalt have no other gods before me.* Mordecai''s refusal to bow to Haman is simple obedience to the first commandment — no glory of man placed before the glory of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-i-bowed-not-to-haman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:5 — *Thou shalt not bow down thyself to them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God), visiting the iniquity of the fathers upon the children unto the third and fourth generation of them that hate me;* The very posture Mordecai withholds from Haman — bowing down and serving — is the act Sinai reserves for Yahuah alone.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-i-bowed-not-to-haman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 3:18 — *But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up.* Mordecai in Persia and the three in Babylon make the identical confession: no image, no man, gets the worship due to Elohim, whatever the cost.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-i-bowed-not-to-haman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 115:1 — *Not unto us, O Yahuah (LORD), not unto us, but unto thy name give glory, for thy mercy, and for thy truth''s sake.* Mordecai''s refusal "to prefer the glory of man above the glory of Yahuah" is this psalm enacted — the Name keeps its glory.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-i-bowed-not-to-haman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-13-king-almighty-maker-of-heaven-and-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Nehemiah 9:6 — *Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee.* Mordecai''s "you have made heaven and earth" is the same monotheist confession the Levites pray over the returned exiles.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-king-almighty-maker-of-heaven-and-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands.* Against the made-by-hands gods of the nations, Mordecai owns the living Yahuah whom no man can resist — the system of dead gods is empty, the Maker is not.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-king-almighty-maker-of-heaven-and-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:23 — *Sing, O ye heavens; for Yahuah (LORD) hath done it: shout, ye lower parts of the earth: break forth into singing, ye mountains, O forest, and every tree therein: for Yahuah (LORD) hath redeemed Jacob, and glorified himself in Yashar''el (Israel).* The Maker of heaven and earth in Mordecai''s prayer is the same who, having made all things, redeems Jacob — creation and salvation in one hand.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-king-almighty-maker-of-heaven-and-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-13-spare-thine-inheritance-out-of-egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:9 — *For the LORD''S portion is his people; Jacob is the lot of his inheritance.* Mordecai''s word "the inheritance, that has been yours from the beginning" rests on the Song of Moses'' claim that Israel is Yahuah''s own allotted portion.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-spare-thine-inheritance-out-of-egypt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 9:26 — *I prayed therefore unto Yahuah (LORD), and said, O Yahuah (Lord) GOD, destroy not thy people and thine inheritance, which thou hast redeemed through thy greatness, which thou hast brought forth out of Egypt with a mighty hand.* Mordecai''s "despise not the portion delivered out of Egypt" is Moses'' very intercession pleading the Exodus-redeemed inheritance against ruin.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-spare-thine-inheritance-out-of-egypt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=9 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:13 — *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil.* Mordecai''s appeal to be "merciful to your inheritance" and to "turn our sorrow into joy" leans on this very mercy that relents from the threatened evil.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-spare-thine-inheritance-out-of-egypt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-13-haman-the-agagite-the-seed-of-amalek
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 17:16 — *For he said, Because Yahuah (LORD) hath sworn that Yahuah (LORD) will have war with Amalek from generation to generation.* Haman the Agagite, of Amalek''s royal seed, is exactly the perpetual foe against whom Yahuah swore this generational war.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-haman-the-agagite-the-seed-of-amalek'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 25:17 — *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt;* Haman''s edict to slay "with their wives and children" is Amalek''s old work, the very thing Israel is commanded never to forget.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-haman-the-agagite-the-seed-of-amalek'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 25:18 — *How he met thee by the way, and smote the hindmost of thee, even all that were feeble behind thee, when thou wast faint and weary; and he feared not Elohim (God).* As Amalek struck the feeble hindmost, so Haman the Agagite targets the children and women of the scattered people — the same fearless cruelty.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-haman-the-agagite-the-seed-of-amalek'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_therestofesther_14.sql (session253 the-rest-of-esther 14) -----
-- Source anchor: apocrypha/the-rest-of-esther ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: roe14 (view _session253_roe14_lookup). Sort band base 60500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_roe14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: rest-of-esther-14-sackcloth-and-ashes
  ('apocrypha', 'the-rest-of-esther', 14, 2, 'canon', 'joel', 2, 12, 'free', E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* The prophet''s call to fasting-and-mourning is the very rite Esther enacts in ashes and torn hair.'),
  ('apocrypha', 'the-rest-of-esther', 14, 2, 'canon', 'joel', 2, 13, 'free', E'Joel 2:13 — *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil.* Esther''s humbled body and laid-away glory is the outward sign of the inward rending Joel demands.'),
  ('apocrypha', 'the-rest-of-esther', 14, 1, 'apocrypha', 'judith', 9, 1, 'extras', E'Judith 9:1 — *Judith fell upon her face, and put ashes upon her head, and uncovered the sackcloth with which she was clothed; and about the time that the incense of that evening was offered in Jerusalem in the house of Yahuah (God) Judith cried with a loud voice, and said,* Esther''s deliverer-sister begins her own intercession in the same ashes, fear of death turned into prayer.'),
  ('apocrypha', 'the-rest-of-esther', 14, 2, 'canon', 'matthew', 6, 17, 'free', E'Matthew 6:17 — *But thou, when thou fastest, anoint thine head, and wash thy face;* Esther''s secret, ash-strewn fast — joy laid aside for the Father alone — is the very hiddenness the Messiah commands.'),
  -- thread: rest-of-esther-14-no-helper-but-thee
  ('apocrypha', 'the-rest-of-esther', 14, 3, 'canon', 'psalms', 22, 11, 'free', E'Psalm 22:11 — *Be not far from me; for trouble is near; for there is none to help.* Esther''s ''no helper but thee'' is the Passion-psalm''s own none-to-help, the righteous left utterly alone with God.'),
  ('apocrypha', 'the-rest-of-esther', 14, 14, 'canon', 'psalms', 25, 16, 'free', E'Psalm 25:16 — *Turn thee unto me, and have mercy upon me; for I am desolate and afflicted.* David''s desolate-and-afflicted plea is the same word Esther twice calls herself, the helpless turned wholly toward Yahuah.'),
  ('apocrypha', 'the-rest-of-esther', 14, 14, 'apocrypha', 'judith', 9, 11, 'extras', E'Judith 9:11 — *For your power stands not in multitude nor your might in strong men: for you are a Yahuah (God) of the afflicted, an helper of the oppressed, an upholder of the weak, a protector of the forlorn, a saviour of them that are without hope.* Judith confesses the very Helper-of-the-forlorn that Esther leans on, two women with no help but Him.'),
  -- thread: rest-of-esther-14-chosen-inheritance
  ('apocrypha', 'the-rest-of-esther', 14, 5, 'canon', 'exodus', 19, 5, 'free', E'Exodus 19:5 — *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine:* The peculiar-treasure of Sinai is the ''perpetual inheritance'' Esther was taught from her youth.'),
  ('apocrypha', 'the-rest-of-esther', 14, 5, 'canon', 'deuteronomy', 7, 6, 'free', E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* Israel taken ''from among all people'' is Moses'' chosen-above-all-people, the ground of Esther''s confidence.'),
  -- thread: rest-of-esther-14-we-have-sinned
  ('apocrypha', 'the-rest-of-esther', 14, 6, 'canon', 'daniel', 9, 5, 'free', E'Daniel 9:5 — *We have sinned, and have committed iniquity, and have done wickedly, and have rebelled, even by departing from thy precepts and from thy judgments:* Daniel''s confession in exile is Esther''s ''we have sinned before thee,'' the captive owning the covenant''s justice.'),
  ('apocrypha', 'the-rest-of-esther', 14, 7, 'canon', 'nehemiah', 9, 33, 'free', E'Nehemiah 9:33 — *Howbeit thou art just in all that is brought upon us; for thou hast done right, but we have done wickedly:* Esther''s ''O Yahuah, you are righteous'' echoes the post-exile confession that God is just even in the hand of the enemy.'),
  ('apocrypha', 'the-rest-of-esther', 14, 6, 'canon', 'leviticus', 26, 41, 'free', E'Leviticus 26:41 — *And that I also have walked contrary unto them, and have brought them into the land of their enemies; if then their uncircumcised hearts be humbled, and they then accept of the punishment of their iniquity:* The Torah foretold the giving-into-enemy-hands and the humbled heart that turns it back, the frame Esther prays inside.'),
  -- thread: rest-of-esther-14-sceptre-and-the-king-of-nations
  ('apocrypha', 'the-rest-of-esther', 14, 11, 'canon', 'psalms', 115, 4, 'free', E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands.* The ''them that be nothing'' Esther begs God not to crown are the lifeless hand-made idols the psalm exposes.'),
  ('apocrypha', 'the-rest-of-esther', 14, 12, 'canon', 'jeremiah', 10, 10, 'free', E'Jeremiah 10:10 — *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble, and the nations shall not be able to abide his indignation.* The living everlasting King stands against the nothing-idols, the ''King of the nations'' Esther invokes.'),
  ('apocrypha', 'the-rest-of-esther', 14, 13, 'canon', 'proverbs', 21, 1, 'free', E'Proverbs 21:1 — *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* Esther asks God to ''turn his heart'' before the lion-king — the very thing Proverbs says is wholly in Yahuah''s hand.'),
  ('apocrypha', 'the-rest-of-esther', 14, 13, 'apocrypha', 'judith', 9, 13, 'extras', E'Judith 9:13 — *And make my speech and deceit to be their wound and stripe, who have purposed cruel things against your covenant, and your hallowed house, and against the top of Sion, and against the house of the possession of your children.* Judith too asks God to arm her speech against the enemy of the covenant, the sister-prayer to Esther''s ''eloquent speech before the lion.'''),
  -- thread: rest-of-esther-14-abhor-the-crown-and-the-table
  ('apocrypha', 'the-rest-of-esther', 14, 17, 'canon', 'daniel', 1, 8, 'free', E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank: therefore he requested of the prince of the eunuchs that he might not defile himself.* Esther''s refusal of Aman''s table and the king''s wine is Daniel''s same purposed-heart refusal of the king''s defiling meat.'),
  ('apocrypha', 'the-rest-of-esther', 14, 15, 'canon', 'psalms', 119, 46, 'free', E'Psalm 119:46 — *I will speak of thy testimonies also before kings, and will not be ashamed.* Esther''s abhorrence of heathen glory before a heathen throne is the psalmist''s unashamed witness of the testimonies before kings.'),
  ('apocrypha', 'the-rest-of-esther', 14, 18, 'canon', 'psalms', 25, 16, 'free', E'Psalm 25:16 — *Turn thee unto me, and have mercy upon me; for I am desolate and afflicted.* Esther''s joy ''only in Yahuah God of Abraham'' amid the king''s feast is the desolate one''s single turning toward Him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_roe14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_roe14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-14-sackcloth-and-ashes',
       E'She laid away her glorious apparel and covered her head with ashes',
       E'Before she dares the king''s gate, the queen strips off the crown''s splendour and goes down into mourning: *And laid away her glorious apparel, and put on the garments of anguish and mourning: and instead of precious ointments, she covered her head with ashes and dung, and she humbled her body greatly, and all the places of her joy she filled with her torn hair.* (the-rest-of-esther 14:2). It ain''t new — this is the prophets'' own liturgy of repentance, *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12), the heart rent and not the garment. Her sister-deliverer Judith does the same before her own peril: *Judith fell upon her face, and put ashes upon her head, and uncovered the sackcloth with which she was clothed* (Judith 9:1). And the Messiah seals that the fast is for the Father and not for show: *But thou, when thou fastest, anoint thine head, and wash thy face* (Matthew 6:17).',
       sv.verse_id, ev.verse_id, 'extras', 60500
  FROM _session253_roe14_lookup sv, _session253_roe14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=14 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-14-no-helper-but-thee',
       E'Help me, desolate woman, which have no helper but thee',
       E'She names herself by her need: *And she prayed to Yahuah (God) of Yashar''el (Israel), saying, O my Elohim (God), you only art our King: help me, desolate woman, which have no helper but you* (the-rest-of-esther 14:3), and again *help me that am desolate, and which have no other help but you* (the-rest-of-esther 14:14). This is the cry of the forsaken Psalter — *Be not far from me; for trouble is near; for there is none to help* (Psalm 22:11) — and *Turn thee unto me, and have mercy upon me; for I am desolate and afflicted* (Psalm 25:16). Judith names the same God: *you are a Yahuah (God) of the afflicted, an helper of the oppressed, an upholder of the weak, a protector of the forlorn, a saviour of them that are without hope* (Judith 9:11).',
       sv.verse_id, ev.verse_id, 'extras', 60503
  FROM _session253_roe14_lookup sv, _session253_roe14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=14 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-14-chosen-inheritance',
       E'Thou tookest Israel for a perpetual inheritance',
       E'Her plea is grounded in election: *From my youth up I have heard in the tribe of my family that you, O Yahuah (God), tookest Yashar''el (Israel) from among all people, and our fathers from all their predecessors, for a perpetual inheritance, and you have performed whatsoever you did promise them* (the-rest-of-esther 14:5). It ain''t new — this is Sinai''s own word, *if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people* (Exodus 19:5), and *Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth* (Deuteronomy 7:6). The election stands; the seed is kept.',
       sv.verse_id, ev.verse_id, 'extras', 60506
  FROM _session253_roe14_lookup sv, _session253_roe14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=14 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-14-we-have-sinned',
       E'We have sinned before thee — thou art righteous',
       E'Like every true intercessor she confesses for her people before she asks: *And now we have sinned before you: therefore have you given us into the hands of our enemies, Because we worshipped their gods: O Yahuah (God), you are righteous* (the-rest-of-esther 14:6-7). This is Daniel''s prayer breath for breath — *We have sinned, and have committed iniquity, and have done wickedly, and have rebelled, even by departing from thy precepts and from thy judgments* (Daniel 9:5) — and Nehemiah''s, *Howbeit thou art just in all that is brought upon us; for thou hast done right, but we have done wickedly* (Nehemiah 9:33). The Torah named the captivity beforehand, healed by the humbled heart: *if then their uncircumcised hearts be humbled, and they then accept of the punishment of their iniquity* (Leviticus 26:41). Mercy is real, never cheap.',
       sv.verse_id, ev.verse_id, 'extras', 60509
  FROM _session253_roe14_lookup sv, _session253_roe14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=14 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-14-sceptre-and-the-king-of-nations',
       E'Give not thy sceptre to them that be nothing',
       E'She wars not against flesh but against the system of dead gods: *O Yahuah (God), give not your sceptre to them that be nothing, and let them not laugh at our fall* (the-rest-of-esther 14:11), pleading to the *King of the nations, and Yahuah (God) of all power* (14:12) and asking that the king''s heart be turned: *Give me eloquent speech in my mouth before the lion: turn his heart to hate him that fighteth against us* (14:13). The idols ''that be nothing'' are the mouthless, eyeless work of hands — *Their idols are silver and gold, the work of men''s hands. They have mouths, but they speak not* (Psalm 115:4-5) — over against *Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king* (Jeremiah 10:10). And the heathen lion''s heart is His to turn: *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1).',
       sv.verse_id, ev.verse_id, 'extras', 60512
  FROM _session253_roe14_lookup sv, _session253_roe14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=14 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-14-abhor-the-crown-and-the-table',
       E'I abhor the crown and the table of the uncircumcised',
       E'Her hidden Torah-faithfulness is laid bare: *you know that I hate the glory of the unrighteous, and abhor the bed of the uncircumcised, and of all the heathen* (the-rest-of-esther 14:15); she abhors the diadem itself, *I abhor it as a menstruous rag* (14:16), and she keeps the dietary line in the heart of the palace — *yours handmaid has not eaten at Aman''s table, and that I have not greatly esteemed the king''s feast, nor drunk the wine of the drink offerings* (14:17). This is Daniel in Babylon: *Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank* (Daniel 1:8). And it is the unashamed confession before kings, *I will speak of thy testimonies also before kings, and will not be ashamed* (Psalm 119:46). The crown abhorred, the heart''s joy only in *Yahuah (God) of Abraham* (14:18).',
       sv.verse_id, ev.verse_id, 'extras', 60515
  FROM _session253_roe14_lookup sv, _session253_roe14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=14 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: rest-of-esther-14-sackcloth-and-ashes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* The prophet''s call to fasting-and-mourning is the very rite Esther enacts in ashes and torn hair.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-sackcloth-and-ashes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 2:13 — *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil.* Esther''s humbled body and laid-away glory is the outward sign of the inward rending Joel demands.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-sackcloth-and-ashes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judith 9:1 — *Judith fell upon her face, and put ashes upon her head, and uncovered the sackcloth with which she was clothed; and about the time that the incense of that evening was offered in Jerusalem in the house of Yahuah (God) Judith cried with a loud voice, and said,* Esther''s deliverer-sister begins her own intercession in the same ashes, fear of death turned into prayer.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-sackcloth-and-ashes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='judith' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 6:17 — *But thou, when thou fastest, anoint thine head, and wash thy face;* Esther''s secret, ash-strewn fast — joy laid aside for the Father alone — is the very hiddenness the Messiah commands.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-sackcloth-and-ashes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-14-no-helper-but-thee
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 22:11 — *Be not far from me; for trouble is near; for there is none to help.* Esther''s ''no helper but thee'' is the Passion-psalm''s own none-to-help, the righteous left utterly alone with God.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-no-helper-but-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 25:16 — *Turn thee unto me, and have mercy upon me; for I am desolate and afflicted.* David''s desolate-and-afflicted plea is the same word Esther twice calls herself, the helpless turned wholly toward Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-no-helper-but-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=25 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judith 9:11 — *For your power stands not in multitude nor your might in strong men: for you are a Yahuah (God) of the afflicted, an helper of the oppressed, an upholder of the weak, a protector of the forlorn, a saviour of them that are without hope.* Judith confesses the very Helper-of-the-forlorn that Esther leans on, two women with no help but Him.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-no-helper-but-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='judith' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-14-chosen-inheritance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:5 — *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine:* The peculiar-treasure of Sinai is the ''perpetual inheritance'' Esther was taught from her youth.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-chosen-inheritance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* Israel taken ''from among all people'' is Moses'' chosen-above-all-people, the ground of Esther''s confidence.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-chosen-inheritance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-14-we-have-sinned
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 9:5 — *We have sinned, and have committed iniquity, and have done wickedly, and have rebelled, even by departing from thy precepts and from thy judgments:* Daniel''s confession in exile is Esther''s ''we have sinned before thee,'' the captive owning the covenant''s justice.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-we-have-sinned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 9:33 — *Howbeit thou art just in all that is brought upon us; for thou hast done right, but we have done wickedly:* Esther''s ''O Yahuah, you are righteous'' echoes the post-exile confession that God is just even in the hand of the enemy.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-we-have-sinned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 26:41 — *And that I also have walked contrary unto them, and have brought them into the land of their enemies; if then their uncircumcised hearts be humbled, and they then accept of the punishment of their iniquity:* The Torah foretold the giving-into-enemy-hands and the humbled heart that turns it back, the frame Esther prays inside.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-we-have-sinned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-14-sceptre-and-the-king-of-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands.* The ''them that be nothing'' Esther begs God not to crown are the lifeless hand-made idols the psalm exposes.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-sceptre-and-the-king-of-nations'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:10 — *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble, and the nations shall not be able to abide his indignation.* The living everlasting King stands against the nothing-idols, the ''King of the nations'' Esther invokes.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-sceptre-and-the-king-of-nations'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 21:1 — *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* Esther asks God to ''turn his heart'' before the lion-king — the very thing Proverbs says is wholly in Yahuah''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-sceptre-and-the-king-of-nations'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Judith 9:13 — *And make my speech and deceit to be their wound and stripe, who have purposed cruel things against your covenant, and your hallowed house, and against the top of Sion, and against the house of the possession of your children.* Judith too asks God to arm her speech against the enemy of the covenant, the sister-prayer to Esther''s ''eloquent speech before the lion.'''
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-sceptre-and-the-king-of-nations'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='judith' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-14-abhor-the-crown-and-the-table
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank: therefore he requested of the prince of the eunuchs that he might not defile himself.* Esther''s refusal of Aman''s table and the king''s wine is Daniel''s same purposed-heart refusal of the king''s defiling meat.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-abhor-the-crown-and-the-table'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 119:46 — *I will speak of thy testimonies also before kings, and will not be ashamed.* Esther''s abhorrence of heathen glory before a heathen throne is the psalmist''s unashamed witness of the testimonies before kings.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-abhor-the-crown-and-the-table'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 25:16 — *Turn thee unto me, and have mercy upon me; for I am desolate and afflicted.* Esther''s joy ''only in Yahuah God of Abraham'' amid the king''s feast is the desolate one''s single turning toward Him.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-abhor-the-crown-and-the-table'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=25 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_therestofesther_15.sql (session253 the-rest-of-esther 15) -----
-- Source anchor: apocrypha/the-rest-of-esther ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: roe15 (view _session253_roe15_lookup). Sort band base 60525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_roe15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: rest-of-esther-15-third-day-glorious-apparel
  ('apocrypha', 'the-rest-of-esther', 15, 1, 'canon', 'esther', 5, 1, 'free', E'Esther 5:1 — *Now it came to pass on the third day, that Esther put on her royal apparel, and stood in the inner court of the king’s house, over against the king’s house: and the king sat upon his royal throne in the royal house, over against the gate of the house.* The canonical Esther records the same third-day approach in royal apparel that Rest of Esther 15:1 unfolds in prayer.'),
  ('apocrypha', 'the-rest-of-esther', 15, 1, 'canon', 'esther', 4, 16, 'free', E'Esther 4:16 — *Go, gather together all the Yahudim (Jews) that are present in Shushan, and fast ye for me, and neither eat nor drink three days, night or day: I also and my maidens will fast likewise; and so will I go in unto the king, which is not according to the law: and if I perish, I perish.* The three-day fast Esther commands is the hidden labor whose end Rest of Esther 15:1 marks when she lays away her mourning garments.'),
  ('apocrypha', 'the-rest-of-esther', 15, 1, 'canon', 'psalms', 30, 5, 'free', E'Psalm 30:5 — *For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning.* The psalm names the very turn enacted in Rest of Esther 15:1, where night-long mourning gives way to glorious apparel.'),
  ('apocrypha', 'the-rest-of-esther', 15, 1, 'canon', 'isaiah', 61, 3, 'free', E'Isaiah 61:3 — *To appoint unto them that mourn in Zion, to give unto them beauty for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness; that they might be called trees of righteousness, the planting of Yahuah (LORD), that he might be glorified.* Isaiah''s exchange of the garment of praise for heaviness is the prophetic pattern of Esther trading mourning garments for glory in Rest of Esther 15:1.'),
  -- thread: rest-of-esther-15-dreadful-throne-fainting
  ('apocrypha', 'the-rest-of-esther', 15, 6, 'canon', 'esther', 5, 2, 'free', E'Esther 5:2 — *And it was so, when the king saw Esther the queen standing in the court, that she obtained favour in his sight: and the king held out to Esther the golden sceptre that was in his hand. So Esther drew near, and touched the top of the sceptre.* The canonical account renders as favour the dreadful throne-room moment Rest of Esther 15:6 paints in its terror.'),
  ('apocrypha', 'the-rest-of-esther', 15, 7, 'canon', 'psalms', 30, 7, 'free', E'Psalm 30:7 — *Yahuah (LORD), by thy favour thou hast made my mountain to stand strong: thou didst hide thy face, and I was troubled.* The trouble that overcomes the queen at the fierce countenance in Rest of Esther 15:7 is the same dread the psalmist feels when the face is hidden.'),
  -- thread: rest-of-esther-15-king-heart-turned
  ('apocrypha', 'the-rest-of-esther', 15, 8, 'canon', 'proverbs', 21, 1, 'free', E'Proverbs 21:1 — *The king’s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* The proverb names the exact sovereignty by which Yahuah changes the spirit of the king into mildness in Rest of Esther 15:8.'),
  ('apocrypha', 'the-rest-of-esther', 15, 8, 'canon', 'daniel', 2, 21, 'free', E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding:* Daniel confesses the same hand over kings that turns the heart of the king in Rest of Esther 15:8.'),
  ('apocrypha', 'the-rest-of-esther', 15, 8, 'canon', 'ezra', 7, 27, 'free', E'Ezra 7:27 — *Blessed be Yahuah Elohim (the LORD God) of our fathers, which hath put such a thing as this in the king’s heart, to beautify the house of Yahuah (LORD) which is in Jerusalem:* Ezra blesses Yahuah for putting a purpose in a Persian king''s heart, the very work done to the king''s spirit in Rest of Esther 15:8.'),
  ('apocrypha', 'the-rest-of-esther', 15, 8, 'canon', 'psalms', 37, 5, 'free', E'Psalm 37:5 — *Commit thy way unto Yahuah (LORD); trust also in him; and he shall bring it to pass.* The psalm''s counsel to commit the way and let Yahuah bring it to pass is fulfilled when He changes the king''s spirit in Rest of Esther 15:8.'),
  -- thread: rest-of-esther-15-golden-sceptre-favour
  ('apocrypha', 'the-rest-of-esther', 15, 11, 'canon', 'esther', 5, 2, 'free', E'Esther 5:2 — *And it was so, when the king saw Esther the queen standing in the court, that she obtained favour in his sight: and the king held out to Esther the golden sceptre that was in his hand. So Esther drew near, and touched the top of the sceptre.* The golden sceptre laid upon the queen''s neck in Rest of Esther 15:11 is the canonical sceptre of favour held out and touched.'),
  ('apocrypha', 'the-rest-of-esther', 15, 12, 'canon', 'nehemiah', 2, 4, 'free', E'Nehemiah 2:4 — *Then the king said unto me, For what dost thou make request? So I prayed to the Elohim (God) of heaven.* Nehemiah''s prayer at the king''s invitation to speak mirrors the king''s word ‘Speak to me’ in Rest of Esther 15:12, where the request is borne on intercession.'),
  ('apocrypha', 'the-rest-of-esther', 15, 10, 'canon', 'nehemiah', 2, 8, 'free', E'Nehemiah 2:8 — *And a letter unto Asaph the keeper of the king’s forest, that he may give me timber to make beams for the gates of the palace which appertained to the house, and for the wall of the city, and for the house that I shall enter into. And the king granted me, according to the good hand of my Elohim (God) upon me.* The king''s granting of Nehemiah''s request by the good hand of Elohim is the same hand that spares the queen and bids her come near in Rest of Esther 15:10.'),
  -- thread: rest-of-esther-15-as-an-angel-of-god
  ('apocrypha', 'the-rest-of-esther', 15, 13, 'canon', 'judges', 13, 6, 'free', E'Judges 13:6 — *Then the woman came and told her husband, saying, A man of Elohim (God) came unto me, and his countenance was like the countenance of an angel of Elohim (God), very terrible: but I asked him not whence he was, neither told he me his name:* Manoah''s wife describes the same fearful angel-like countenance the queen sees in the king in Rest of Esther 15:13.'),
  ('apocrypha', 'the-rest-of-esther', 15, 14, 'canon', 'exodus', 34, 29, 'free', E'Exodus 34:29 — *And it came to pass, when Moses came down from mount Sinai with the two tables of testimony in Moses’ hand, when he came down from the mount, that Moses wist not that the skin of his face shone while he talked with him.* The shining, grace-filled countenance the queen marvels at in Rest of Esther 15:14 echoes the radiant face that the divine presence gives in the Tanakh.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_roe15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_roe15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-15-third-day-glorious-apparel',
       E'The Third Day: Mourning Laid Aside for Glory',
       E'*And upon the third day, when she had ended her prayers, she laid away her mourning garments, and put on her glorious apparel. And being gloriously adorned, after she had called upon Yahuah (God), who is the beholder and saviour of all things, she took two maids with her* (Rest of Esther 15:1-2). The queen rises on the third day, prayer ended, sackcloth exchanged for splendour — the very motion the canonical text records plainly: *Now it came to pass on the third day, that Esther put on her royal apparel, and stood in the inner court of the king''s house* (Esther 5:1). The three-day fast that precedes it is the hidden engine: *fast ye for me, and neither eat nor drink three days, night or day... and so will I go in unto the king, which is not according to the law: and if I perish, I perish* (Esther 4:16). This is the Tanakh''s own pattern of mourning turned to joy — *For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning* (Psalm 30:5) — and the prophets seal it as covenant promise: *to give unto them beauty for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness* (Isaiah 61:3). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 60525
  FROM _session253_roe15_lookup sv, _session253_roe15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=15 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-15-dreadful-throne-fainting',
       E'Before the Dreadful Throne: The Queen Faints',
       E'*Then having passed through all the doors, she stood before the king, who sat upon his royal throne, and was clothed with all his robes of majesty, all glittering with gold and precious stones; and he was very dreadful. Then lifting up his countenance that shone with majesty, he looked very fiercely upon her: and the queen fell down, and was pale, and fainted, and bowed herself upon the head of the maid that went before her* (Rest of Esther 15:6-7). The throne is terrible, the look fierce; the queen, who has prepared with prayer and fasting, faints at the threshold of intercession. The canonical scene is the same court, the same throne: *And it was so, when the king saw Esther the queen standing in the court, that she obtained favour in his sight* (Esther 5:2). And the psalmist knows this dread of the hidden face that makes the strong man tremble: *Yahuah (LORD), by thy favour thou hast made my mountain to stand strong: thou didst hide thy face, and I was troubled* (Psalm 30:7). The peril is real; the deliverance will not be cheap.',
       sv.verse_id, ev.verse_id, 'extras', 60528
  FROM _session253_roe15_lookup sv, _session253_roe15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=15 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-15-king-heart-turned',
       E'Yahuah Changed the Spirit of the King',
       E'*Then Yahuah (God) changed the spirit of the king into mildness, who in a fear leaped from his throne, and took her in his arms, till she came to herself again, and comforted her with loving words* (Rest of Esther 15:8). This is the heart of the chapter and the open confession of who truly rules: the deliverance is not Esther''s beauty nor the king''s whim but the sovereign hand that bends the throne. The proverb states the law of it outright: *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1). Daniel saw the same hand over empires: *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise* (Daniel 2:21). Ezra blessed Him for the same turning of a Persian heart toward His house: *Blessed be Yahuah Elohim (the LORD God) of our fathers, which hath put such a thing as this in the king''s heart* (Ezra 7:27). And the wise are told to commit the matter and let Him bring it to pass: *Commit thy way unto Yahuah (LORD); trust also in him; and he shall bring it to pass* (Psalm 37:5). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 60531
  FROM _session253_roe15_lookup sv, _session253_roe15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=15 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-15-golden-sceptre-favour',
       E'The Golden Sceptre and the Word of Favour',
       E'*You shall not die, though our commandment be general: come near. And so he held up his golden sceptre, and laid it upon her neck, And embraced her, and said, Speak to me* (Rest of Esther 15:10-12). The death-sentence of the general law is suspended; the sceptre is extended; the queen is bidden to speak her request. The canonical Esther shows the sceptre held out and touched: *and the king held out to Esther the golden sceptre that was in his hand. So Esther drew near, and touched the top of the sceptre* (Esther 5:2). Nehemiah, another exile before a Persian throne, prays in the breath before he asks and finds the same heart opened: *Then the king said unto me, For what dost thou make request? So I prayed to the Elohim (God) of heaven* (Nehemiah 2:4), and the petition for the city is granted *according to the good hand of my Elohim (God) upon me* (Nehemiah 2:8). The favoured request before the king is the prayer answered through the king.',
       sv.verse_id, ev.verse_id, 'extras', 60534
  FROM _session253_roe15_lookup sv, _session253_roe15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=15 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-15-as-an-angel-of-god',
       E'As an Angel of Yahuah: The Countenance Full of Grace',
       E'*Then said she to him, I saw you, my lord, as an angel of Yahuah (God), and my heart was troubled for fear of your majesty. For wonderful art you, lord, and your countenance is full of grace* (Rest of Esther 15:13-14). Recovered, the queen names the dread she felt: the king''s face shone upon her like the face of a messenger of Elohim. The Tanakh knows that troubling brightness in a heavenly visitor: *A man of Elohim (God) came unto me, and his countenance was like the countenance of an angel of Elohim (God), very terrible: but I asked him not whence he was* (Judges 13:6). And it knows the face that shines from standing in the divine presence: *that Moses wist not that the skin of his face shone while he talked with him* (Exodus 34:29). The fearful, grace-filled countenance is the Tanakh''s own sign of a glory drawn from above.',
       sv.verse_id, ev.verse_id, 'extras', 60537
  FROM _session253_roe15_lookup sv, _session253_roe15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=15 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: rest-of-esther-15-third-day-glorious-apparel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 5:1 — *Now it came to pass on the third day, that Esther put on her royal apparel, and stood in the inner court of the king’s house, over against the king’s house: and the king sat upon his royal throne in the royal house, over against the gate of the house.* The canonical Esther records the same third-day approach in royal apparel that Rest of Esther 15:1 unfolds in prayer.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-third-day-glorious-apparel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Esther 4:16 — *Go, gather together all the Yahudim (Jews) that are present in Shushan, and fast ye for me, and neither eat nor drink three days, night or day: I also and my maidens will fast likewise; and so will I go in unto the king, which is not according to the law: and if I perish, I perish.* The three-day fast Esther commands is the hidden labor whose end Rest of Esther 15:1 marks when she lays away her mourning garments.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-third-day-glorious-apparel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 30:5 — *For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning.* The psalm names the very turn enacted in Rest of Esther 15:1, where night-long mourning gives way to glorious apparel.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-third-day-glorious-apparel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=30 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 61:3 — *To appoint unto them that mourn in Zion, to give unto them beauty for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness; that they might be called trees of righteousness, the planting of Yahuah (LORD), that he might be glorified.* Isaiah''s exchange of the garment of praise for heaviness is the prophetic pattern of Esther trading mourning garments for glory in Rest of Esther 15:1.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-third-day-glorious-apparel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-15-dreadful-throne-fainting
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 5:2 — *And it was so, when the king saw Esther the queen standing in the court, that she obtained favour in his sight: and the king held out to Esther the golden sceptre that was in his hand. So Esther drew near, and touched the top of the sceptre.* The canonical account renders as favour the dreadful throne-room moment Rest of Esther 15:6 paints in its terror.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-dreadful-throne-fainting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 30:7 — *Yahuah (LORD), by thy favour thou hast made my mountain to stand strong: thou didst hide thy face, and I was troubled.* The trouble that overcomes the queen at the fierce countenance in Rest of Esther 15:7 is the same dread the psalmist feels when the face is hidden.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-dreadful-throne-fainting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=30 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-15-king-heart-turned
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 21:1 — *The king’s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* The proverb names the exact sovereignty by which Yahuah changes the spirit of the king into mildness in Rest of Esther 15:8.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-king-heart-turned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding:* Daniel confesses the same hand over kings that turns the heart of the king in Rest of Esther 15:8.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-king-heart-turned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 7:27 — *Blessed be Yahuah Elohim (the LORD God) of our fathers, which hath put such a thing as this in the king’s heart, to beautify the house of Yahuah (LORD) which is in Jerusalem:* Ezra blesses Yahuah for putting a purpose in a Persian king''s heart, the very work done to the king''s spirit in Rest of Esther 15:8.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-king-heart-turned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 37:5 — *Commit thy way unto Yahuah (LORD); trust also in him; and he shall bring it to pass.* The psalm''s counsel to commit the way and let Yahuah bring it to pass is fulfilled when He changes the king''s spirit in Rest of Esther 15:8.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-king-heart-turned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-15-golden-sceptre-favour
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 5:2 — *And it was so, when the king saw Esther the queen standing in the court, that she obtained favour in his sight: and the king held out to Esther the golden sceptre that was in his hand. So Esther drew near, and touched the top of the sceptre.* The golden sceptre laid upon the queen''s neck in Rest of Esther 15:11 is the canonical sceptre of favour held out and touched.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-golden-sceptre-favour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 2:4 — *Then the king said unto me, For what dost thou make request? So I prayed to the Elohim (God) of heaven.* Nehemiah''s prayer at the king''s invitation to speak mirrors the king''s word ‘Speak to me’ in Rest of Esther 15:12, where the request is borne on intercession.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-golden-sceptre-favour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Nehemiah 2:8 — *And a letter unto Asaph the keeper of the king’s forest, that he may give me timber to make beams for the gates of the palace which appertained to the house, and for the wall of the city, and for the house that I shall enter into. And the king granted me, according to the good hand of my Elohim (God) upon me.* The king''s granting of Nehemiah''s request by the good hand of Elohim is the same hand that spares the queen and bids her come near in Rest of Esther 15:10.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-golden-sceptre-favour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-15-as-an-angel-of-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Judges 13:6 — *Then the woman came and told her husband, saying, A man of Elohim (God) came unto me, and his countenance was like the countenance of an angel of Elohim (God), very terrible: but I asked him not whence he was, neither told he me his name:* Manoah''s wife describes the same fearful angel-like countenance the queen sees in the king in Rest of Esther 15:13.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-as-an-angel-of-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=13 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 34:29 — *And it came to pass, when Moses came down from mount Sinai with the two tables of testimony in Moses’ hand, when he came down from the mount, that Moses wist not that the skin of his face shone while he talked with him.* The shining, grace-filled countenance the queen marvels at in Rest of Esther 15:14 echoes the radiant face that the divine presence gives in the Tanakh.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-as-an-angel-of-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_therestofesther_16.sql (session253 the-rest-of-esther 16) -----
-- Source anchor: apocrypha/the-rest-of-esther ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: roe16 (view _session253_roe16_lookup). Sort band base 60550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_roe16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: rest-of-esther-16-hanged-on-his-own-gallows
  ('apocrypha', 'the-rest-of-esther', 16, 18, 'canon', 'esther', 7, 10, 'free', E'Esther 7:10 — *So they hanged Haman on the gallows that he had prepared for Mordecai. Then was the king’s wrath pacified.* The letter''s report that the worker is hanged at the gates of Susa is the king''s own account of the gallows Haman built for Mordecai turned back on himself.'),
  ('apocrypha', 'the-rest-of-esther', 16, 18, 'canon', 'psalms', 7, 15, 'free', E'Psalms 7:15 — *He made a pit, and digged it, and is fallen into the ditch which he made.* Haman hanged on his own gallows is the very pattern the Psalm sets: the trap made for another swallows its maker.'),
  ('apocrypha', 'the-rest-of-esther', 16, 18, 'canon', 'psalms', 7, 16, 'free', E'Psalms 7:16 — *His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate.* Yahuah rendering vengeance to Haman according to his deserts is mischief returning upon the head of the one who devised it.'),
  ('apocrypha', 'the-rest-of-esther', 16, 18, 'canon', 'proverbs', 11, 8, 'free', E'Proverbs 11:8 — *The righteous is delivered out of trouble, and the wicked cometh in his stead.* Mordecai delivered while Haman hangs in his place is the proverb made history at the gates of Susa.'),
  -- thread: rest-of-esther-16-amalek-blotted-out
  ('apocrypha', 'the-rest-of-esther', 16, 10, 'canon', 'deuteronomy', 25, 19, 'free', E'Deuteronomy 25:19 — *Therefore it shall be, when Yahuah Elohayka (the LORD thy God) hath given thee rest from all thine enemies round about, in the land which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance to possess it, that thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it.* Haman the stranger-plotter is the Amalekite seed under the standing decree of erasure.'),
  ('apocrypha', 'the-rest-of-esther', 16, 10, 'canon', 'deuteronomy', 25, 17, 'free', E'Deuteronomy 25:17 — *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt;* the king''s exposure of the foreign plotter who waylaid the people echoes the command never to forget what Amalek did on the way.'),
  ('apocrypha', 'the-rest-of-esther', 16, 13, 'canon', 'exodus', 17, 14, 'free', E'Exodus 17:14 — *And Yahuah (LORD) said unto Moses, Write this for a memorial in a book, and rehearse it in the ears of Joshua: for I will utterly put out the remembrance of Amalek from under heaven.* Haman''s plot against Mordecai and Esther with their whole nation is the latest assault in the war Yahuah swore to wage against Amalek from generation to generation.'),
  ('apocrypha', 'the-rest-of-esther', 16, 13, 'canon', '1-samuel', 15, 33, 'free', E'1 Samuel 15:33 — *And Samuel said, As thy sword hath made women childless, so shall thy mother be childless among women. And Samuel hewed Agag in pieces before Yahuah (LORD) in Gilgal.* Haman the Agagite seeking the destruction of the whole nation falls where Agag his forefather fell, the seed-war carried to its end.'),
  -- thread: rest-of-esther-16-pride-translates-the-kingdom
  ('apocrypha', 'the-rest-of-esther', 16, 4, 'canon', 'proverbs', 16, 18, 'free', E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* The proud who think to escape the justice of Yahuah that seeth all things fall by the very haughtiness the letter exposes.'),
  ('apocrypha', 'the-rest-of-esther', 16, 4, 'canon', 'proverbs', 16, 5, 'free', E'Proverbs 16:5 — *Every one that is proud in heart is an abomination to Yahuah (LORD): though hand join in hand, he shall not be unpunished.* The lifted-up who imagine they can escape the all-seeing justice of Yahuah are the proud-in-heart who shall not go unpunished.'),
  ('apocrypha', 'the-rest-of-esther', 16, 2, 'apocrypha', 'ecclesiasticus', 10, 7, 'extras', E'Ecclesiasticus 10:7 — *Pride is hateful before Yahuah (God) and man: and by both does one commit iniquity.* The honoured who wax proud and turn on their benefactors are exactly the pride Ben Sira names as hateful before Yahuah and man.'),
  ('apocrypha', 'the-rest-of-esther', 16, 2, 'apocrypha', 'ecclesiasticus', 10, 8, 'extras', E'Ecclesiasticus 10:8 — *Because of unrighteous dealings, injuries, and riches got by deceit, the kingdom is translated from one people to another.* Haman''s plot to translate the Persian kingdom to the Macedonians by deceit falls under Ben Sira''s law that injustice removes a kingdom from one people to another.'),
  -- thread: rest-of-esther-16-children-of-the-most-high
  ('apocrypha', 'the-rest-of-esther', 16, 16, 'canon', 'daniel', 2, 21, 'free', E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding:* the king''s confession that the living Yahuah ordered his kingdom is the truth Daniel pressed on Nebuchadnezzar, that Elohim removes and sets up kings.'),
  ('apocrypha', 'the-rest-of-esther', 16, 16, 'canon', 'daniel', 2, 20, 'free', E'Daniel 2:20 — *Daniel answered and said, Blessed be the name of Elohim (God) for ever and ever: for wisdom and might are his:* the king naming the most high and most mighty living Yahuah who orders kingdoms echoes Daniel''s blessing of the Elohim to whom wisdom and might belong.'),
  ('apocrypha', 'the-rest-of-esther', 16, 15, 'apocrypha', 'ecclesiasticus', 10, 19, 'extras', E'Ecclesiasticus 10:19 — *They that fear Yahuah (God) are a sure seed, and they that love him an honourable plant: they that regard not the law are a dishonourable seed; they that transgress the commandments are a deceivable seed.* The Yahudim who live by most just laws are Ben Sira''s sure seed, the people who keep the commandments and so are no evildoers.'),
  -- thread: rest-of-esther-16-turned-to-joy-the-feast
  ('apocrypha', 'the-rest-of-esther', 16, 21, 'canon', 'esther', 9, 22, 'free', E'Esther 9:22 — *As the days wherein the Yahudim (Jews) rested from their enemies, and the month which was turned unto them from sorrow to joy, and from mourning into a good day: that they should make them days of feasting and joy, and of sending portions one to another, and gifts to the poor.* The letter''s turning of the day of destruction to joy is the founding charter of Purim Mordecai wrote into the calendar.'),
  ('apocrypha', 'the-rest-of-esther', 16, 20, 'apocrypha', '2-maccabees', 15, 36, 'extras', E'2 Maccabees 15:36 — *And they ordained all with a common decree in no case to let that day pass without solemnity, but to celebrate the thirteenth day of the twelfth month, which in the Syrian tongue is called Adar, the day before Mardocheus’ day.* The thirteenth of Adar named in the king''s decree is the very date the Maccabees keep, reckoned as the eve of Mordecai''s day.'),
  ('apocrypha', 'the-rest-of-esther', 16, 21, 'canon', 'psalms', 9, 15, 'free', E'Psalms 9:15 — *The heathen are sunk down in the pit that they made: in the net which they hid is their own foot taken.* The day on which the chosen people should have perished turned to joy is the Psalmist''s reversal: the snare-setter caught in his own net.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_roe16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_roe16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-16-hanged-on-his-own-gallows',
       E'He digged a pit and is fallen in: Haman on his own gallows',
       E'The king''s vindicating letter announces the reversal: *For he that was the worker of these things, is hanged at the gates of Susa with all his family: Yahuah (God), who ruleth all things, speedily rendering vengeance to him according to his deserts.* (Rest of Esther 16:18) The plotter is caught in his own plot. *So they hanged Haman on the gallows that he had prepared for Mordecai. Then was the king''s wrath pacified.* (Esther 7:10) The gallows fifty cubits high was Haman''s own work. The Psalmist had already sung the law of it: *He made a pit, and digged it, and is fallen into the ditch which he made.* (Psalms 7:15) And *His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate.* (Psalms 7:16) Solomon names the same reversal: *The righteous is delivered out of trouble, and the wicked cometh in his stead.* (Proverbs 11:8) It ain''t new — the snare set for the just snaps shut on the one who set it.',
       sv.verse_id, ev.verse_id, 'extras', 60550
  FROM _session253_roe16_lookup sv, _session253_roe16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=16 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-16-amalek-blotted-out',
       E'The Agagite stranger: blotting out the seed of Amalek',
       E'The king unmasks the enemy by his lineage: *For Aman, a Macedonian, the son of Amadatha, being indeed a stranger from the Persian blood, and far distant from our goodness, and as a stranger received of us,* (Rest of Esther 16:10) — the perennial outsider who plots the destruction of the chosen people. Behind the Macedonian gloss stands the old seed-war: Haman the Agagite, of the house Yahuah swore to erase. *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt;* (Deuteronomy 25:17) and the standing decree: *thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it.* (Deuteronomy 25:19) Moses had already written it as memorial: *Write this for a memorial in a book, and rehearse it in the ears of Joshua: for I will utterly put out the remembrance of Amalek from under heaven.* (Exodus 17:14) Saul spared Agag and lost a kingdom; *And Samuel hewed Agag in pieces before Yahuah (LORD) in Gilgal.* (1 Samuel 15:33) The gallows at Susa finishes the unforgotten war.',
       sv.verse_id, ev.verse_id, 'extras', 60553
  FROM _session253_roe16_lookup sv, _session253_roe16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=16 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-16-pride-translates-the-kingdom',
       E'Lifted up to escape justice: pride and the translated kingdom',
       E'The letter diagnoses the disease at the root: *And take not only thankfulness away from among men, but also lifted up with the glorious words of lewd persons, that were never good, they think to escape the justice of Yahuah (God), that seeth all things and hates evil.* (Rest of Esther 16:4) Honoured beyond bearing, the proud turn on their benefactors: *Many, the more often they are honoured with the great bounty of their gracious princes, the more proud they are waxen,* (Rest of Esther 16:2). Yeshua ben Sira had taught the law of it: *Pride is hateful before Yahuah (God) and man: and by both does one commit iniquity.* (Ecclesiasticus 10:7) And the very mechanism of Haman''s downfall — *Because of unrighteous dealings, injuries, and riches got by deceit, the kingdom is translated from one people to another.* (Ecclesiasticus 10:8) Solomon seals it: *Pride goeth before destruction, and an haughty spirit before a fall.* (Proverbs 16:18) Yahuah *that seeth all things* is not mocked.',
       sv.verse_id, ev.verse_id, 'extras', 60556
  FROM _session253_roe16_lookup sv, _session253_roe16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=16 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-16-children-of-the-most-high',
       E'Children of the living Elohim: the people who live by just laws',
       E'The king clears the accused and names them rightly: *But we find that the Yahudim (Jews), whom this wicked wretch has delivered to utter destruction, are no evildoers, but live by most just laws:* (Rest of Esther 16:15) — *And that they be children of the most high and most mighty, living Yahuah (God), who has ordered the kingdom both to us and to our progenitors in the most excellent manner.* (Rest of Esther 16:16) The pagan king confesses the covenant election the scriptures proclaim. They that fear Yahuah are the kept seed: *They that fear Yahuah (God) are a sure seed, and they that love him an honourable plant: they that regard not the law are a dishonourable seed; they that transgress the commandments are a deceivable seed.* (Ecclesiasticus 10:19) Daniel had taught a Babylon king the same — *Blessed be the name of Elohim (God) for ever and ever: for wisdom and might are his... he removeth kings, and setteth up kings.* (Daniel 2:20-21) The One who orders kingdoms keeps His people who live by His law.',
       sv.verse_id, ev.verse_id, 'extras', 60559
  FROM _session253_roe16_lookup sv, _session253_roe16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=16 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-16-turned-to-joy-the-feast',
       E'Turned to joy: the high day of deliverance kept among the feasts',
       E'The reversal becomes a perpetual festival: *For Almighty Yahuah (God) has turned to joy to them the day, in which the chosen people should have perished.* (Rest of Esther 16:21) — *You shall therefore among your solemn feasts keep it an high day with all feasting:* (Rest of Esther 16:22). The day of intended destruction, the thirteenth of Adar, becomes Purim. Mordecai wrote it into Israel''s calendar: *As the days wherein the Yahudim (Jews) rested from their enemies, and the month which was turned unto them from sorrow to joy, and from mourning into a good day: that they should make them days of feasting and joy, and of sending portions one to another, and gifts to the poor.* (Esther 9:22) And the deuterocanon itself remembers the very date — when Judas struck down the blasphemer Nicanor — *to celebrate the thirteenth day of the twelfth month, which in the Syrian tongue is called Adar, the day before Mardocheus'' day.* (2 Maccabees 15:36) The Psalmist sings the pattern of every such reversal: *The heathen are sunk down in the pit that they made: in the net which they hid is their own foot taken.* (Psalms 9:15)',
       sv.verse_id, ev.verse_id, 'extras', 60562
  FROM _session253_roe16_lookup sv, _session253_roe16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=16 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: rest-of-esther-16-hanged-on-his-own-gallows
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 7:10 — *So they hanged Haman on the gallows that he had prepared for Mordecai. Then was the king’s wrath pacified.* The letter''s report that the worker is hanged at the gates of Susa is the king''s own account of the gallows Haman built for Mordecai turned back on himself.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-hanged-on-his-own-gallows'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 7:15 — *He made a pit, and digged it, and is fallen into the ditch which he made.* Haman hanged on his own gallows is the very pattern the Psalm sets: the trap made for another swallows its maker.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-hanged-on-his-own-gallows'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 7:16 — *His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate.* Yahuah rendering vengeance to Haman according to his deserts is mischief returning upon the head of the one who devised it.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-hanged-on-his-own-gallows'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 11:8 — *The righteous is delivered out of trouble, and the wicked cometh in his stead.* Mordecai delivered while Haman hangs in his place is the proverb made history at the gates of Susa.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-hanged-on-his-own-gallows'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-16-amalek-blotted-out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 25:19 — *Therefore it shall be, when Yahuah Elohayka (the LORD thy God) hath given thee rest from all thine enemies round about, in the land which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance to possess it, that thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it.* Haman the stranger-plotter is the Amalekite seed under the standing decree of erasure.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-amalek-blotted-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 25:17 — *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt;* the king''s exposure of the foreign plotter who waylaid the people echoes the command never to forget what Amalek did on the way.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-amalek-blotted-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 17:14 — *And Yahuah (LORD) said unto Moses, Write this for a memorial in a book, and rehearse it in the ears of Joshua: for I will utterly put out the remembrance of Amalek from under heaven.* Haman''s plot against Mordecai and Esther with their whole nation is the latest assault in the war Yahuah swore to wage against Amalek from generation to generation.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-amalek-blotted-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Samuel 15:33 — *And Samuel said, As thy sword hath made women childless, so shall thy mother be childless among women. And Samuel hewed Agag in pieces before Yahuah (LORD) in Gilgal.* Haman the Agagite seeking the destruction of the whole nation falls where Agag his forefather fell, the seed-war carried to its end.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-amalek-blotted-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-16-pride-translates-the-kingdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* The proud who think to escape the justice of Yahuah that seeth all things fall by the very haughtiness the letter exposes.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-pride-translates-the-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 16:5 — *Every one that is proud in heart is an abomination to Yahuah (LORD): though hand join in hand, he shall not be unpunished.* The lifted-up who imagine they can escape the all-seeing justice of Yahuah are the proud-in-heart who shall not go unpunished.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-pride-translates-the-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 10:7 — *Pride is hateful before Yahuah (God) and man: and by both does one commit iniquity.* The honoured who wax proud and turn on their benefactors are exactly the pride Ben Sira names as hateful before Yahuah and man.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-pride-translates-the-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=10 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 10:8 — *Because of unrighteous dealings, injuries, and riches got by deceit, the kingdom is translated from one people to another.* Haman''s plot to translate the Persian kingdom to the Macedonians by deceit falls under Ben Sira''s law that injustice removes a kingdom from one people to another.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-pride-translates-the-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-16-children-of-the-most-high
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding:* the king''s confession that the living Yahuah ordered his kingdom is the truth Daniel pressed on Nebuchadnezzar, that Elohim removes and sets up kings.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-children-of-the-most-high'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 2:20 — *Daniel answered and said, Blessed be the name of Elohim (God) for ever and ever: for wisdom and might are his:* the king naming the most high and most mighty living Yahuah who orders kingdoms echoes Daniel''s blessing of the Elohim to whom wisdom and might belong.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-children-of-the-most-high'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 10:19 — *They that fear Yahuah (God) are a sure seed, and they that love him an honourable plant: they that regard not the law are a dishonourable seed; they that transgress the commandments are a deceivable seed.* The Yahudim who live by most just laws are Ben Sira''s sure seed, the people who keep the commandments and so are no evildoers.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-children-of-the-most-high'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=10 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-16-turned-to-joy-the-feast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 9:22 — *As the days wherein the Yahudim (Jews) rested from their enemies, and the month which was turned unto them from sorrow to joy, and from mourning into a good day: that they should make them days of feasting and joy, and of sending portions one to another, and gifts to the poor.* The letter''s turning of the day of destruction to joy is the founding charter of Purim Mordecai wrote into the calendar.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-turned-to-joy-the-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=9 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 15:36 — *And they ordained all with a common decree in no case to let that day pass without solemnity, but to celebrate the thirteenth day of the twelfth month, which in the Syrian tongue is called Adar, the day before Mardocheus’ day.* The thirteenth of Adar named in the king''s decree is the very date the Maccabees keep, reckoned as the eve of Mordecai''s day.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-turned-to-joy-the-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=15 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 9:15 — *The heathen are sunk down in the pit that they made: in the net which they hid is their own foot taken.* The day on which the chosen people should have perished turned to joy is the Psalmist''s reversal: the snare-setter caught in his own net.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-turned-to-joy-the-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=9 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session253 — The Rest of Esther cross-references complete.'
