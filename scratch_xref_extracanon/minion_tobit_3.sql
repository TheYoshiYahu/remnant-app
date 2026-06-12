-- ----- fragment: minion_tobit_03.sql (session253 tobit 3) -----
-- Source anchor: apocrypha/tobit ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob3 (view _session253_tob3_lookup). Sort band base 59650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-3-rebuke-me-not
  ('apocrypha', 'tobit', 3, 1, 'canon', 'psalms', 6, 1, 'free', E'Psalm 6:1 — *O Yahuah (LORD), rebuke me not in thine anger, neither chasten me in thy hot displeasure.* Tobit weeping in his sorrow (3:1) takes up David''s opening cry of the chastened afflicted.'),
  ('apocrypha', 'tobit', 3, 6, 'canon', 'psalms', 6, 4, 'free', E'Psalm 6:4 — *Return, O Yahuah (LORD), deliver my soul: oh save me for thy mercies'' sake.* Tobit''s plea to be delivered out of his distress (3:6) is David''s plea for deliverance for mercy''s sake.'),
  ('apocrypha', 'tobit', 3, 6, 'canon', 'psalms', 25, 16, 'free', E'Psalm 25:16 — *Turn thee unto me, and have mercy upon me; for I am desolate and afflicted.* Tobit''s *turn not your face away from me* (3:6) is the obverse of David''s prayer that Yahuah turn toward the desolate.'),
  ('apocrypha', 'tobit', 3, 6, 'canon', 'psalms', 25, 18, 'free', E'Psalm 25:18 — *Look upon mine affliction and my pain; and forgive all my sins.* Tobit, weighed by reproach and sin alike (3:6), asks the same: that Yahuah look on his affliction and forgive.'),
  -- thread: tobit-3-fathers-sins-captivity
  ('apocrypha', 'tobit', 3, 4, 'canon', 'daniel', 9, 11, 'free', E'Daniel 9:11 — *Yea, all Yashar''el (Israel) have transgressed thy law, even by departing, that they might not obey thy voice; therefore the curse is poured upon us, and the oath that is written in the law of Moses the servant of Elohim (God), because we have sinned against him.* Tobit''s *they obeyed not your commandments: wherefore you have delivered us... to captivity* (3:4) is Daniel''s identical reckoning of the exile as the law''s own sworn oath.'),
  ('apocrypha', 'tobit', 3, 3, 'canon', 'lamentations', 5, 7, 'free', E'Lamentations 5:7 — *Our fathers have sinned, and are not; and we have borne their iniquities.* Tobit asks not to be punished for *the sins of my fathers, who have sinned before you* (3:3) — the very weight Lamentations names.'),
  ('apocrypha', 'tobit', 3, 4, 'canon', 'lamentations', 5, 1, 'free', E'Lamentations 5:1 — *Remember, O Yahuah (LORD), what is come upon us: consider, and behold our reproach.* Tobit dispersed *for a proverb of reproach to all the nations* (3:4) prays Lamentations'' own appeal over the reproach of the scattered.'),
  ('apocrypha', 'tobit', 3, 5, 'canon', 'nehemiah', 9, 2, 'free', E'Nehemiah 9:2 — *And the seed of Yashar''el (Israel) separated themselves from all strangers, and stood and confessed their sins, and the iniquities of their fathers.* Tobit''s *we have not kept your commandments* (3:5) is the same confession the returning remnant makes in Nehemiah.'),
  -- thread: tobit-3-just-and-true-judgments
  ('apocrypha', 'tobit', 3, 2, 'canon', 'psalms', 25, 10, 'free', E'Psalm 25:10 — *All the paths of Yahuah (LORD) are mercy and truth unto such as keep his covenant and his testimonies.* Tobit''s *all your ways are mercy and truth* (3:2) quotes the psalter''s verdict on the covenant-keeping God almost word for word.'),
  ('apocrypha', 'tobit', 3, 5, 'canon', 'daniel', 9, 7, 'free', E'Daniel 9:7 — *O Yahuah (Lord), righteousness belongeth unto thee, but unto us confusion of faces, as at this day.* Tobit''s *your judgments are many and true: deal with me according to my sins* (3:5) is Daniel''s same self-condemning vindication of Yahuah.'),
  ('apocrypha', 'tobit', 3, 2, 'canon', 'daniel', 9, 14, 'free', E'Daniel 9:14 — *Therefore hath Yahuah (LORD) watched upon the evil, and brought it upon us: for Yahuah Eloheinu (the LORD our God) is righteous in all his works which he doeth: for we obeyed not his voice.* Tobit confessing Yahuah *just... in all your works* (3:2) speaks Daniel''s confession that He is righteous in all His works.'),
  -- thread: tobit-3-sarah-reproach-prayer
  ('apocrypha', 'tobit', 3, 12, 'canon', 'psalms', 25, 1, 'free', E'Psalm 25:1 — *Unto thee, O Yahuah (LORD), do I lift up my soul.* Sarah setting *my eyes and my face toward you* (3:12) lifts her soul exactly as the psalmist does in his distress.'),
  ('apocrypha', 'tobit', 3, 12, 'canon', 'psalms', 25, 15, 'free', E'Psalm 25:15 — *Mine eyes are ever toward Yahuah (LORD); for he shall pluck my feet out of the net.* Sarah''s eyes fixed toward Yahuah (3:12) trust, like David, to be plucked out of the snare that has taken her seven husbands.'),
  ('apocrypha', 'tobit', 3, 13, 'canon', 'psalms', 25, 17, 'free', E'Psalm 25:17 — *The troubles of my heart are enlarged: O bring thou me out of my distresses.* Sarah''s *Take me out of the earth, that I may hear no more the reproach* (3:13) is the same cry to be brought out of an unbearable distress.'),
  -- thread: tobit-3-prayers-heard-raphael-sent
  ('apocrypha', 'tobit', 3, 16, 'canon', 'psalms', 34, 15, 'free', E'Psalm 34:15 — *The eyes of Yahuah (LORD) are upon the righteous, and his ears are open unto their cry.* Both prayers *heard before the majesty of the great Yahuah* (3:16) prove the psalm true: His ears are open to the afflicted righteous.'),
  ('apocrypha', 'tobit', 3, 16, 'canon', 'psalms', 34, 17, 'free', E'Psalm 34:17 — *The righteous cry, and Yahuah (LORD) heareth, and delivereth them out of all their troubles.* Tobit and Sarah cry and are heard (3:16) — delivered out of their troubles exactly as the psalm promises.'),
  ('apocrypha', 'tobit', 3, 17, 'canon', 'daniel', 9, 21, 'free', E'Daniel 9:21 — *Yea, whiles I was speaking in prayer, even the man Gabriel, whom I had seen in the vision at the beginning, being caused to fly swiftly, touched me about the time of the evening oblation.* Raphael sent in answer to the prayers (3:17) matches Gabriel dispatched to Daniel in the very act of praying.'),
  ('apocrypha', 'tobit', 3, 17, 'canon', 'luke', 1, 13, 'free', E'Luke 1:13 — *But the angel said unto him, Fear not, Zacharias: for thy prayer is heard; and thy wife Elisabeth shall bear thee a son, and thou shalt call his name John.* The angel sent because the prayer is heard (3:16-17) is the same word Gabriel brings Zacharias at the altar of incense.'),
  ('apocrypha', 'tobit', 3, 17, 'canon', 'revelation', 20, 2, 'free', E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years.* Raphael sent *to bind Asmodeus the evil spirit* (3:17) is the seed-war in miniature — the angel laying hold on and binding the adversary.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-3-rebuke-me-not',
       E'Rebuke me not in thine anger — the prayer of the afflicted',
       E'Tobit, blind and shamed, weeps and pours out a sufferer''s prayer: *Then I being grieved did weep, and in my sorrow prayed, saying* (Tobit 3:1), *Now therefore deal with me as seemeth best to you, and command my spirit to be taken from me, that I may be dissolved, and become earth: for it is profitable for me to die rather than to live, because I have heard false reproaches, and have much sorrow: command therefore that I may now be delivered out of this distress, and go into the everlasting place: turn not your face away from me* (Tobit 3:6). It is the very voice of the penitential psalms. David groans the same: *O Yahuah (LORD), rebuke me not in thine anger, neither chasten me in thy hot displeasure* (Psalm 6:1), and *Return, O Yahuah (LORD), deliver my soul: oh save me for thy mercies'' sake* (Psalm 6:4). The cry to be remembered in distress is older still: *Look upon mine affliction and my pain; and forgive all my sins* (Psalm 25:18), *Turn thee unto me, and have mercy upon me; for I am desolate and afflicted* (Psalm 25:16). It ain''t new — the exile in Nineveh prays the prayer Israel has always prayed.',
       sv.verse_id, ev.verse_id, 'extras', 59650
  FROM _session253_tob3_lookup sv, _session253_tob3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-3-fathers-sins-captivity',
       E'We have not kept your commandments — confession of the fathers'' sins',
       E'Tobit owns the covenant breach that scattered the house: *Remember me, and look on me, punish me not for my sins and ignorances, and the sins of my fathers, who have sinned before you* (Tobit 3:3), *For they obeyed not your commandments: wherefore you have delivered us for a spoil, and to captivity, and to death, and for a proverb of reproach to all the nations among whom we are dispersed* (Tobit 3:4), *because we have not kept your commandments, neither have walked in truth before you* (Tobit 3:5). This is Daniel''s confession at the same exile: *Yea, all Yashar''el (Israel) have transgressed thy law, even by departing, that they might not obey thy voice; therefore the curse is poured upon us, and the oath that is written in the law of Moses the servant of Elohim (God), because we have sinned against him* (Daniel 9:11). It is Lamentations over the burning city: *Our fathers have sinned, and are not; and we have borne their iniquities* (Lamentations 5:7), *Remember, O Yahuah (LORD), what is come upon us: consider, and behold our reproach* (Lamentations 5:1). And it is Nehemiah''s returning remnant: *And the seed of Yashar''el (Israel) separated themselves from all strangers, and stood and confessed their sins, and the iniquities of their fathers* (Nehemiah 9:2). The scattering is the Torah''s own oath at work — not law as curse, but covenant kept faithful — and the same Torah-keeping remnant is gathered home again (Ezekiel 37).',
       sv.verse_id, ev.verse_id, 'extras', 59653
  FROM _session253_tob3_lookup sv, _session253_tob3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=3 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-3-just-and-true-judgments',
       E'Just are thy ways — righteous in all his works',
       E'Even in grief Tobit justifies Yahuah: *O Yahuah (God), you are just, and all your works and all your ways are mercy and truth, and you judgest truly and justly for ever* (Tobit 3:2), *And now your judgments are many and true: deal with me according to my sins* (Tobit 3:5). This is the heart of Daniel''s confession — *O Yahuah (LORD), righteousness belongeth unto thee, but unto us confusion of faces* (Daniel 9:7) — and its close: *for Yahuah Eloheinu (the LORD our God) is righteous in all his works which he doeth: for we obeyed not his voice* (Daniel 9:14). It echoes David''s creed of the covenant: *All the paths of Yahuah (LORD) are mercy and truth unto such as keep his covenant and his testimonies* (Psalm 25:10). The afflicted man does not accuse Heaven; he vindicates it.',
       sv.verse_id, ev.verse_id, 'extras', 59656
  FROM _session253_tob3_lookup sv, _session253_tob3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=3 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-3-sarah-reproach-prayer',
       E'Take me out of the earth — Sarah''s prayer at the window',
       E'Far off in Ecbatane, Sarah — whose seven husbands Asmodeus the evil spirit had slain — is taunted to death and prays the same prayer toward heaven: *Then she prayed toward the window, and said, Blessed art you, O Yahuah (God), my Elohim (God), and yours holy and glorious name is blessed and honourable for ever: let all your works praise you for ever* (Tobit 3:11), *And now, O Yahuah (God), I set my eyes and my face toward you* (Tobit 3:12), *And say, Take me out of the earth, that I may hear no more the reproach* (Tobit 3:13). Her lifted face is David''s posture: *Unto thee, O Yahuah (LORD), do I lift up my soul* (Psalm 25:1), *Mine eyes are ever toward Yahuah (LORD); for he shall pluck my feet out of the net* (Psalm 25:15). Her plea to be taken out of her reproach is the psalmist''s: *The troubles of my heart are enlarged: O bring thou me out of my distresses* (Psalm 25:17). Two prayers, one God — Tobit at Nineveh and Sarah at Ecbatane reach the same throne.',
       sv.verse_id, ev.verse_id, 'extras', 59659
  FROM _session253_tob3_lookup sv, _session253_tob3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-3-prayers-heard-raphael-sent',
       E'The prayers were heard — Raphael sent, the demon bound',
       E'Both prayers ascend together and are answered: *So the prayers of them both were heard before the majesty of the great Yahuah (God)* (Tobit 3:16), *And Raphael was sent to heal them both, that is, to scale away the whiteness of Tobit''s eyes, and to give Sara the daughter of Raguel for a wife to Tobias the son of Tobit; and to bind Asmodeus the evil spirit* (Tobit 3:17). The eyes of Yahuah were upon these afflicted righteous all along: *The eyes of Yahuah (LORD) are upon the righteous, and his ears are open unto their cry* (Psalm 34:15), *The righteous cry, and Yahuah (LORD) heareth, and delivereth them out of all their troubles* (Psalm 34:17). An angel is dispatched at the prayer just as Gabriel comes to Daniel: *Yea, whiles I was speaking in prayer, even the man Gabriel... touched me about the time of the evening oblation* (Daniel 9:21), *At the beginning of thy supplications the commandment came forth, and I am come to shew thee; for thou art greatly beloved* (Daniel 9:23). And the angel''s word to Zacharias is the very tidings of this chapter: *Fear not, Zacharias: for thy prayer is heard* (Luke 1:13). The binding of Asmodeus is the seed-war''s outcome written small — the angel laying hold on the evil spirit prefigures the angel who *bound him a thousand years* (Revelation 20:2).',
       sv.verse_id, ev.verse_id, 'extras', 59662
  FROM _session253_tob3_lookup sv, _session253_tob3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-3-rebuke-me-not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 6:1 — *O Yahuah (LORD), rebuke me not in thine anger, neither chasten me in thy hot displeasure.* Tobit weeping in his sorrow (3:1) takes up David''s opening cry of the chastened afflicted.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-rebuke-me-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 6:4 — *Return, O Yahuah (LORD), deliver my soul: oh save me for thy mercies'' sake.* Tobit''s plea to be delivered out of his distress (3:6) is David''s plea for deliverance for mercy''s sake.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-rebuke-me-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 25:16 — *Turn thee unto me, and have mercy upon me; for I am desolate and afflicted.* Tobit''s *turn not your face away from me* (3:6) is the obverse of David''s prayer that Yahuah turn toward the desolate.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-rebuke-me-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=25 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 25:18 — *Look upon mine affliction and my pain; and forgive all my sins.* Tobit, weighed by reproach and sin alike (3:6), asks the same: that Yahuah look on his affliction and forgive.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-rebuke-me-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=25 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-3-fathers-sins-captivity
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 9:11 — *Yea, all Yashar''el (Israel) have transgressed thy law, even by departing, that they might not obey thy voice; therefore the curse is poured upon us, and the oath that is written in the law of Moses the servant of Elohim (God), because we have sinned against him.* Tobit''s *they obeyed not your commandments: wherefore you have delivered us... to captivity* (3:4) is Daniel''s identical reckoning of the exile as the law''s own sworn oath.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-fathers-sins-captivity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Lamentations 5:7 — *Our fathers have sinned, and are not; and we have borne their iniquities.* Tobit asks not to be punished for *the sins of my fathers, who have sinned before you* (3:3) — the very weight Lamentations names.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-fathers-sins-captivity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Lamentations 5:1 — *Remember, O Yahuah (LORD), what is come upon us: consider, and behold our reproach.* Tobit dispersed *for a proverb of reproach to all the nations* (3:4) prays Lamentations'' own appeal over the reproach of the scattered.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-fathers-sins-captivity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Nehemiah 9:2 — *And the seed of Yashar''el (Israel) separated themselves from all strangers, and stood and confessed their sins, and the iniquities of their fathers.* Tobit''s *we have not kept your commandments* (3:5) is the same confession the returning remnant makes in Nehemiah.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-fathers-sins-captivity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-3-just-and-true-judgments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 25:10 — *All the paths of Yahuah (LORD) are mercy and truth unto such as keep his covenant and his testimonies.* Tobit''s *all your ways are mercy and truth* (3:2) quotes the psalter''s verdict on the covenant-keeping God almost word for word.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-just-and-true-judgments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=25 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 9:7 — *O Yahuah (Lord), righteousness belongeth unto thee, but unto us confusion of faces, as at this day.* Tobit''s *your judgments are many and true: deal with me according to my sins* (3:5) is Daniel''s same self-condemning vindication of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-just-and-true-judgments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 9:14 — *Therefore hath Yahuah (LORD) watched upon the evil, and brought it upon us: for Yahuah Eloheinu (the LORD our God) is righteous in all his works which he doeth: for we obeyed not his voice.* Tobit confessing Yahuah *just... in all your works* (3:2) speaks Daniel''s confession that He is righteous in all His works.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-just-and-true-judgments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-3-sarah-reproach-prayer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 25:1 — *Unto thee, O Yahuah (LORD), do I lift up my soul.* Sarah setting *my eyes and my face toward you* (3:12) lifts her soul exactly as the psalmist does in his distress.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-sarah-reproach-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=25 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 25:15 — *Mine eyes are ever toward Yahuah (LORD); for he shall pluck my feet out of the net.* Sarah''s eyes fixed toward Yahuah (3:12) trust, like David, to be plucked out of the snare that has taken her seven husbands.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-sarah-reproach-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=25 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 25:17 — *The troubles of my heart are enlarged: O bring thou me out of my distresses.* Sarah''s *Take me out of the earth, that I may hear no more the reproach* (3:13) is the same cry to be brought out of an unbearable distress.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-sarah-reproach-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=25 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-3-prayers-heard-raphael-sent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 34:15 — *The eyes of Yahuah (LORD) are upon the righteous, and his ears are open unto their cry.* Both prayers *heard before the majesty of the great Yahuah* (3:16) prove the psalm true: His ears are open to the afflicted righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-prayers-heard-raphael-sent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 34:17 — *The righteous cry, and Yahuah (LORD) heareth, and delivereth them out of all their troubles.* Tobit and Sarah cry and are heard (3:16) — delivered out of their troubles exactly as the psalm promises.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-prayers-heard-raphael-sent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 9:21 — *Yea, whiles I was speaking in prayer, even the man Gabriel, whom I had seen in the vision at the beginning, being caused to fly swiftly, touched me about the time of the evening oblation.* Raphael sent in answer to the prayers (3:17) matches Gabriel dispatched to Daniel in the very act of praying.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-prayers-heard-raphael-sent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 1:13 — *But the angel said unto him, Fear not, Zacharias: for thy prayer is heard; and thy wife Elisabeth shall bear thee a son, and thou shalt call his name John.* The angel sent because the prayer is heard (3:16-17) is the same word Gabriel brings Zacharias at the altar of incense.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-prayers-heard-raphael-sent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years.* Raphael sent *to bind Asmodeus the evil spirit* (3:17) is the seed-war in miniature — the angel laying hold on and binding the adversary.'
  FROM cross_reference_threads t, cross_references x, _session253_tob3_lookup sv, _session253_tob3_lookup tv
 WHERE t.slug='tobit-3-prayers-heard-raphael-sent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

