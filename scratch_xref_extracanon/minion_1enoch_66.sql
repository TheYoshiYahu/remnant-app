-- ----- fragment: minion_1enoch_66.sql (session250 1-enoch 66) -----
-- Source anchor: enoch/1-enoch ch66. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en66 (view _session250_en66_lookup). Sort band base 51625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en66_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-66-angels-of-the-waters-held-back
  ('enoch', '1-enoch', 66, 1, 'canon', 'genesis', 7, 11, 'free', E'Genesis 7:11 — *In the six hundredth year of Noah’s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* The very unleashing of the deep that Enoch''s angels of the waters were prepared to release upon the earth (66:1).'),
  ('enoch', '1-enoch', 66, 4, 'canon', 'revelation', 7, 1, 'free', E'Revelation 7:1 — *And after these things I saw four angels standing on the four corners of the earth, holding the four winds of the earth, that the wind should not blow on the earth, nor on the sea, nor on any tree.* The same picture of angels set over the elements, holding judgement back until the word is given (66:4).'),
  ('enoch', '1-enoch', 66, 1, 'enoch', '1-enoch', 54, 7, 'extras', E'1 Enoch 54:7 — *And in those days shall punishment come from Yahuah (God) of Spirits, and He will open all the chambers of waters which are above the heavens, and of the fountains which are beneath the earth.* Enoch''s own Parables name the upper and lower chambers that the angels of 66:1 stand ready to loose.'),
  -- thread: 1-enoch-66-waters-loosed-on-the-ungodly
  ('enoch', '1-enoch', 66, 5, 'canon', '2-peter', 2, 5, 'free', E'2 Peter 2:5 — *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly.* The flood released upon the sinners and the ungodly, exactly as Enoch''s angels are commissioned (66:5).'),
  ('enoch', '1-enoch', 66, 6, 'canon', 'genesis', 8, 2, 'free', E'Genesis 8:2 — *The fountains also of the deep and the windows of heaven were stopped, and the rain from heaven was restrained.* The same waters that were loosed are shut again by command, as the destroyers are bound to await judgement (66:6).'),
  ('enoch', '1-enoch', 66, 6, 'enoch', '1-enoch', 55, 2, 'extras', E'1 Enoch 55:2 — *And He sware by His great name: ‘Henceforth I will not do so to all who dwell on the earth, and I will set a sign in the heaven: and this shall be a pledge of good faith between Me and them for ever, so long as heaven is above the earth.* Enoch''s Head of Days seals with the Noahic oath and bow the restraint that 66:6 anticipates.'),
  -- thread: 1-enoch-66-righteous-saved-in-the-light
  ('enoch', '1-enoch', 66, 8, 'canon', '2-peter', 2, 9, 'free', E'2 Peter 2:9 — *Yahuah (Lord) knoweth how to deliver the godly out of temptations, and to reserve the unjust unto the day of judgment to be punished.* The same Lord who drowns the ungodly delivers His own, just as Enoch''s righteous and elect are saved on that day (66:8).'),
  ('enoch', '1-enoch', 66, 9, 'canon', 'revelation', 22, 5, 'free', E'Revelation 22:5 — *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* The everlasting dwelling in the light of God that Enoch promises the elect (66:9).'),
  ('enoch', '1-enoch', 66, 9, 'enoch', '1-enoch', 58, 3, 'extras', E'1 Enoch 58:3 — *And the righteous shall be in the light of the sun, And the elect in the light of eternal life: The days of their life shall be unending, And the days of the holy and elect shall be without number.* Enoch''s own Parables name the unfailing light in which the elect dwell forever (66:9).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en66_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en66_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-66-angels-of-the-waters-held-back',
       E'The angels over the waters, ready to loose the Flood',
       E'Enoch sees the executioners of the deluge poised and restrained: *And after this he showed me the angels of punishment who are prepared to come and release the powers of the waters upon the earth* (1 Enoch 66:1), *And he showed me the angels who are over the powers of the waters, And who release them upon the earth* (1 Enoch 66:4). This is the canon''s own Flood, when the restraint was lifted and the deep was unloosed: *In the six hundredth year of Noah’s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened* (Genesis 7:11). Enoch''s Parables name the same chambers a few chapters earlier — *And in those days shall punishment come from Yahuah (God) of Spirits, and He will open all the chambers of waters which are above the heavens, and of the fountains which are beneath the earth* (1 Enoch 54:7) — so the deep above and the deep below are the very waters Genesis opens. And the picture of angels appointed over the elements, holding them until the word is given, runs straight to John''s vision of judgement held in check: *And after these things I saw four angels standing on the four corners of the earth, holding the four winds of the earth, that the wind should not blow on the earth, nor on the sea, nor on any tree* (Revelation 7:1). It ain''t new — the messengers stand ready, and nothing is loosed until the Creator commands.',
       sv.verse_id, ev.verse_id, 'extras', 51625
  FROM _session250_en66_lookup sv, _session250_en66_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=66 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=66 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-66-waters-loosed-on-the-ungodly',
       E'The waters loosed on the sinners — and then restrained',
       E'The angels'' commission is judgement upon the covenant-breakers, not upon the earth at large: *These are the angels who are over the powers of the waters, And they shall release them upon the sinners and upon the ungodly, And upon those who have led the world astray* (1 Enoch 66:5). That is precisely how the canon frames the deluge — a flood *upon the world of the ungodly*: *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly* (2 Peter 2:5). And just as the waters were loosed by command, by command they were stopped: *The fountains also of the deep and the windows of heaven were stopped, and the rain from heaven was restrained* (Genesis 8:2) — the same fountains and windows of Genesis 7:11 shut again. Enoch''s Head of Days seals that restraint with the Noahic oath: *And He sware by His great name: ‘Henceforth I will not do so to all who dwell on the earth, and I will set a sign in the heaven: and this shall be a pledge of good faith between Me and them for ever, so long as heaven is above the earth* (1 Enoch 55:2). The judgement falls on those who *led the world astray*, the Watchers'' seed-war — and the bound destroyers wait their own day: *And they shall be bound in the valleys of the earth Until the day of their judgment, The great day of consummation* (1 Enoch 66:6).',
       sv.verse_id, ev.verse_id, 'extras', 51628
  FROM _session250_en66_lookup sv, _session250_en66_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=66 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=66 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-66-righteous-saved-in-the-light',
       E'The righteous and elect saved, dwelling in the light',
       E'Where the ungodly perish, the elect are kept: *And the righteous and elect shall be saved on that day, And they shall never again see the face of the sinners and the ungodly* (1 Enoch 66:8), *And the Most High shall preserve them, And they shall dwell in the light of Yahuah (God) of Spirits for ever and ever* (1 Enoch 66:9). This is the canon''s own division at the Flood — the same Lord who drowns the ungodly delivers His own: *Yahuah (Lord) knoweth how to deliver the godly out of temptations, and to reserve the unjust unto the day of judgment to be punished* (2 Peter 2:9). The promised dwelling — the elect in unfailing light — is the end Enoch''s Parables sing elsewhere: *And the righteous shall be in the light of the sun, And the elect in the light of eternal life: The days of their life shall be unending, And the days of the holy and elect shall be without number* (1 Enoch 58:3); and it is John''s New Jerusalem: *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever* (Revelation 22:5). The righteous here are a preserved people, not a self-chosen class — saved because the Most High preserves them, and kept in His light forever.',
       sv.verse_id, ev.verse_id, 'extras', 51631
  FROM _session250_en66_lookup sv, _session250_en66_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=66 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=66 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-66-angels-of-the-waters-held-back
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:11 — *In the six hundredth year of Noah’s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* The very unleashing of the deep that Enoch''s angels of the waters were prepared to release upon the earth (66:1).'
  FROM cross_reference_threads t, cross_references x, _session250_en66_lookup sv, _session250_en66_lookup tv
 WHERE t.slug='1-enoch-66-angels-of-the-waters-held-back'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=66 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 7:1 — *And after these things I saw four angels standing on the four corners of the earth, holding the four winds of the earth, that the wind should not blow on the earth, nor on the sea, nor on any tree.* The same picture of angels set over the elements, holding judgement back until the word is given (66:4).'
  FROM cross_reference_threads t, cross_references x, _session250_en66_lookup sv, _session250_en66_lookup tv
 WHERE t.slug='1-enoch-66-angels-of-the-waters-held-back'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=66 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 54:7 — *And in those days shall punishment come from Yahuah (God) of Spirits, and He will open all the chambers of waters which are above the heavens, and of the fountains which are beneath the earth.* Enoch''s own Parables name the upper and lower chambers that the angels of 66:1 stand ready to loose.'
  FROM cross_reference_threads t, cross_references x, _session250_en66_lookup sv, _session250_en66_lookup tv
 WHERE t.slug='1-enoch-66-angels-of-the-waters-held-back'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=66 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=54 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-66-waters-loosed-on-the-ungodly
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Peter 2:5 — *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly.* The flood released upon the sinners and the ungodly, exactly as Enoch''s angels are commissioned (66:5).'
  FROM cross_reference_threads t, cross_references x, _session250_en66_lookup sv, _session250_en66_lookup tv
 WHERE t.slug='1-enoch-66-waters-loosed-on-the-ungodly'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=66 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 8:2 — *The fountains also of the deep and the windows of heaven were stopped, and the rain from heaven was restrained.* The same waters that were loosed are shut again by command, as the destroyers are bound to await judgement (66:6).'
  FROM cross_reference_threads t, cross_references x, _session250_en66_lookup sv, _session250_en66_lookup tv
 WHERE t.slug='1-enoch-66-waters-loosed-on-the-ungodly'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=66 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 55:2 — *And He sware by His great name: ‘Henceforth I will not do so to all who dwell on the earth, and I will set a sign in the heaven: and this shall be a pledge of good faith between Me and them for ever, so long as heaven is above the earth.* Enoch''s Head of Days seals with the Noahic oath and bow the restraint that 66:6 anticipates.'
  FROM cross_reference_threads t, cross_references x, _session250_en66_lookup sv, _session250_en66_lookup tv
 WHERE t.slug='1-enoch-66-waters-loosed-on-the-ungodly'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=66 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=55 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-66-righteous-saved-in-the-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Peter 2:9 — *Yahuah (Lord) knoweth how to deliver the godly out of temptations, and to reserve the unjust unto the day of judgment to be punished.* The same Lord who drowns the ungodly delivers His own, just as Enoch''s righteous and elect are saved on that day (66:8).'
  FROM cross_reference_threads t, cross_references x, _session250_en66_lookup sv, _session250_en66_lookup tv
 WHERE t.slug='1-enoch-66-righteous-saved-in-the-light'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=66 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:5 — *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* The everlasting dwelling in the light of God that Enoch promises the elect (66:9).'
  FROM cross_reference_threads t, cross_references x, _session250_en66_lookup sv, _session250_en66_lookup tv
 WHERE t.slug='1-enoch-66-righteous-saved-in-the-light'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=66 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 58:3 — *And the righteous shall be in the light of the sun, And the elect in the light of eternal life: The days of their life shall be unending, And the days of the holy and elect shall be without number.* Enoch''s own Parables name the unfailing light in which the elect dwell forever (66:9).'
  FROM cross_reference_threads t, cross_references x, _session250_en66_lookup sv, _session250_en66_lookup tv
 WHERE t.slug='1-enoch-66-righteous-saved-in-the-light'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=66 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=58 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

