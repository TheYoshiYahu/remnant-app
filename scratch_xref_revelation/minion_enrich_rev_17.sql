-- S227 enrichment — Revelation 17: the woman on the beast; mystery Babylon; the Lamb overcomes
-- ADD-ONLY. References shared view _s227_rev_lookup.

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: woman-on-the-scarlet-beast-seven-heads-and-ten-horns
  ('canon','revelation',17,3,'canon','daniel',7,23,'free', E'*Thus he said, The fourth beast shall be the fourth kingdom upon earth, which shall be diverse from all kingdoms, and shall devour the whole earth, and shall tread it down, and break it in pieces.* (Daniel 7:23). The angel''s own reading of Daniel''s beast: a world-devouring fourth kingdom that treads down and breaks in pieces. The scarlet beast *full of names of blasphemy, having seven heads and ten horns* (Revelation 17:3) is that same brute power, the blaspheming kingdom that tramples the earth and carries the harlot upon its back.'),
  ('canon','revelation',17,3,'canon','daniel',7,24,'free', E'*And the ten horns out of this kingdom are ten kings that shall arise: and another shall rise after them; and he shall be diverse from the first, and he shall subdue three kings.* (Daniel 7:24). Daniel''s ten horns are *ten kings that shall arise* out of the fourth kingdom. The beast the woman rides bears those same *ten horns* (Revelation 17:3), later named as *ten kings, which have received no kingdom as yet* (17:12) — the harlot carried by Daniel''s very kingdom, the ten-horned power read straight from the night-vision.'),
  ('canon','revelation',17,3,'apocrypha','2-esdras',11,1,'extras', E'*Then saw I a dream, and, behold, there came up from the sea an eagle, which had twelve feathered wings, and three heads.* (2 Esdras 11:1). The Hebrew library saw the same beast from the sea — *an eagle... which had twelve feathered wings, and three heads*, whose wings and heads are the kings that reign in succession. So the seer beholds a scarlet beast *having seven heads and ten horns* (Revelation 17:3), the heads and horns alike the kings of the world-kingdom. The multi-headed, many-winged ruler rising from the sea is the apocalyptic figure both seers share.'),
  ('canon','revelation',17,3,'apocrypha','2-esdras',12,11,'extras', E'*The eagle, whom you sawest come up from the sea, is the kingdom which was seen in the vision of your brother Daniel.* (2 Esdras 12:11). The interpreting voice tells Esdras plainly: the eagle from the sea *is the kingdom which was seen in the vision of your brother Daniel* — the fourth kingdom, its heads and wings the kings. The scarlet beast with *seven heads and ten horns* (Revelation 17:3) is that same Danielic kingdom, the heads kings and the horns kings; the Hebrew library binds the eagle, Daniel''s beast, and the harlot''s mount into one world-power.'),
  -- thread: lamb-shall-overcome-them-lord-of-lords
  ('canon','revelation',17,14,'canon','daniel',2,44,'free', E'*And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... it shall break in pieces and consume all these kingdoms, and it shall stand for ever.* (Daniel 2:44). Daniel saw the stone-kingdom that breaks all the kingdoms of men and stands for ever. The ten kings *shall make war with the Lamb, and the Lamb shall overcome them: for he is Lord of lords, and King of kings* (Revelation 17:14) — the everlasting kingdom that crushes the beast''s confederacy. The kings hold power one hour; the kingdom of the Lamb breaks them in pieces and endures for ever.'),
  -- thread: waters-are-peoples-and-nations
  ('canon','revelation',17,15,'canon','isaiah',17,12,'free', E'*Woe to the multitude of many people, which make a noise like the noise of the seas; and to the rushing of nations, that make a rushing like the rushing of mighty waters!* (Isaiah 17:12). Isaiah likens the massed peoples to roaring seas, *the rushing of nations... like the rushing of mighty waters.* The angel reads the same idiom: *The waters which thou sawest, where the whore sitteth, are peoples, and multitudes, and nations, and tongues* (Revelation 17:15). The many waters under the harlot are the nations in just this sense — the swarming peoples whose roar fills the earth.'),
  ('canon','revelation',17,15,'canon','isaiah',17,13,'free', E'*The nations shall rush like the rushing of many waters: but Elohim (God) shall rebuke them, and they shall flee far off, and shall be chased as the chaff of the mountains before the wind...* (Isaiah 17:13). The peoples rush like many waters, yet at his rebuke *they shall flee far off.* So the waters the whore sits upon *are peoples, and multitudes, and nations, and tongues* (Revelation 17:15) — and the prophet''s warning is the harlot''s end: the very floods she rides are rebuked and flee, the nations that carried her turning to make her desolate.'),
  -- thread: mystery-babylon-the-mother-of-harlots
  ('canon','revelation',17,5,'canon','isaiah',47,1,'extras', E'*Come down, and sit in the dust, O virgin daughter of Babylon, sit on the ground: there is no throne, O daughter of the Chaldeans: for thou shalt no more be called tender and delicate.* (Isaiah 47:1). Isaiah summoned the *virgin daughter of Babylon* down from her throne into the dust — the self-exalting harlot-city stripped of her glory. *MYSTERY, BABYLON THE GREAT, THE MOTHER OF HARLOTS* (Revelation 17:5) is that same daughter of the Chaldeans unveiled, the proud city whose throne is taken away and who is brought down to sit in the dust.'),
  ('canon','revelation',17,6,'canon','ezekiel',23,37,'extras', E'*That they have committed adultery, and blood is in their hands, and with their idols have they committed adultery, and have also caused their sons... to pass for them through the fire, to devour them.* (Ezekiel 23:37). Ezekiel arraigned the unfaithful city on the harlot''s double count — adultery *and blood in their hands.* So the woman is *drunken with the blood of the saints, and with the blood of the martyrs of Yahusha (Jesus)* (Revelation 17:6): she has played the harlot with the kings and shed the blood of the faithful, judged for fornication and bloodshed together, exactly as the prophet judged the harlot-city.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- thread members -----
-- woman-on-the-scarlet-beast-seven-heads-and-ten-horns
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 7:23 — *The fourth beast shall be the fourth kingdom upon earth... shall devour the whole earth, and shall tread it down* the world-devouring fourth kingdom; the scarlet beast that carries the woman (Revelation 17:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-17-the-woman-on-the-scarlet-beast-seven-heads-and-ten-horns-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Daniel 7:24 — *the ten horns out of this kingdom are ten kings that shall arise* Daniel''s ten horns are ten kings; the beast bears *seven heads and ten horns*, the horns the ten kings of 17:12 (Revelation 17:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-17-the-woman-on-the-scarlet-beast-seven-heads-and-ten-horns-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'2 Esdras 11:1 — *there came up from the sea an eagle, which had twelve feathered wings, and three heads* the multi-headed, many-winged ruler from the sea, its heads and wings the kings; the scarlet beast with seven heads and ten horns (Revelation 17:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-17-the-woman-on-the-scarlet-beast-seven-heads-and-ten-horns-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 24, E'2 Esdras 12:11 — *The eagle, whom you sawest come up from the sea, is the kingdom which was seen in the vision of your brother Daniel* the Hebrew library names the eagle as Daniel''s fourth kingdom; the same kingdom is the harlot''s mount (Revelation 17:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-17-the-woman-on-the-scarlet-beast-seven-heads-and-ten-horns-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=12 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- lamb-shall-overcome-them-lord-of-lords
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 2:44 — *the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... it shall break in pieces and consume all these kingdoms* the stone-kingdom that crushes all others and stands for ever; the Lamb overcomes the ten kings (Revelation 17:14).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-17-the-lamb-shall-overcome-them-lord-of-lords-and-king-of-kings-deuteronomy-10-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- waters-are-peoples-and-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 17:12 — *the rushing of nations, that make a rushing like the rushing of mighty waters* the massed peoples as roaring seas; *the waters... are peoples, and multitudes, and nations, and tongues* (Revelation 17:15).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-17-the-waters-are-peoples-and-nations-and-tongues-isaiah-8-jeremiah-47'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=17 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 17:13 — *The nations shall rush like the rushing of many waters: but Elohim (God) shall rebuke them, and they shall flee far off* the floods rebuked and fleeing; the waters that carry the whore turn to make her desolate (Revelation 17:15-16).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-17-the-waters-are-peoples-and-nations-and-tongues-isaiah-8-jeremiah-47'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=17 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- mystery-babylon-the-mother-of-harlots
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 47:1 — *Come down, and sit in the dust, O virgin daughter of Babylon... there is no throne, O daughter of the Chaldeans* the proud daughter of the Chaldeans brought down to the dust; *MYSTERY, BABYLON THE GREAT* unveiled (Revelation 17:5).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-17-mystery-babylon-the-mother-of-harlots-the-unfaithful-city-isaiah-47-ezekiel-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=47 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Ezekiel 23:37 — *they have committed adultery, and blood is in their hands* the harlot-city judged for fornication and bloodshed together; the woman drunken with the blood of the saints (Revelation 17:6).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-17-mystery-babylon-the-mother-of-harlots-the-unfaithful-city-isaiah-47-ezekiel-16'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=17 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=23 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
