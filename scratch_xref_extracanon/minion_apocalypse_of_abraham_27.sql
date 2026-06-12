-- ----- fragment: minion_apocalypseofabraham_27.sql (session253 apocalypse-of-abraham 27) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch27. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa27 (view _session253_aoa27_lookup). Sort band base 67650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa27_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-27-temple-burnt-with-fire
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 2, 'canon', '2-kings', 25, 9, 'free', E'2 Kings 25:9 — *And he burnt the house of Yahuah (LORD), and the king''s house, and all the houses of Jerusalem, and every great man''s house burnt he with fire.* The history fulfils to the letter what Abraham was shown of the Temple burnt with fire in Apocalypse of Abraham 27:2.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 2, 'canon', 'lamentations', 1, 10, 'free', E'Lamentations 1:10 — *The adversary hath spread out his hand upon all her pleasant things: for she hath seen that the heathen entered into her sanctuary, whom thou didst command that they should not enter into thy congregation.* The plundering of the holy things in Apocalypse of Abraham 27:2 is the heathen spreading his hand on her pleasant things.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 4, 'canon', 'psalms', 79, 1, 'free', E'Psalm 79:1 — *O Elohim (God), the heathen are come into thine inheritance; thy holy temple have they defiled; they have laid Jerusalem on heaps.* Abraham''s lament that the hordes plunder and rob the beautiful things in Apocalypse of Abraham 27:4 is the psalmist''s cry over the defiled temple.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 4, 'canon', 'matthew', 24, 15, 'free', E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The desolation Abraham foresaw in Apocalypse of Abraham 27:4 the Messiah carries forward as the sign yet to be watched for.'),
  -- thread: apocalypse-of-abraham-27-people-that-spring-from-me
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 4, 'canon', 'psalms', 79, 1, 'free', E'Psalm 79:1 — *O Elohim (God), the heathen are come into thine inheritance; thy holy temple have they defiled; they have laid Jerusalem on heaps.* Abraham''s grief that the heathen plunder the people that spring from him in Apocalypse of Abraham 27:4 is the psalmist''s grief over the inheritance overrun.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 6, 'canon', 'lamentations', 1, 9, 'free', E'Lamentations 1:9 — *Her filthiness is in her skirts; she remembereth not her last end; therefore she came down wonderfully: she had no comforter. O Yahuah (LORD), behold my affliction: for the enemy hath magnified himself.* Abraham''s lacerated heart in Apocalypse of Abraham 27:6 is the same cry that the enemy has magnified himself over the city.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 4, 'canon', 'genesis', 25, 23, 'free', E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The people Yahuah accepted in Apocalypse of Abraham 27:4 are the elect seed marked out by election from the womb, not a people replacing them.'),
  -- thread: apocalypse-of-abraham-27-statue-of-jealousy-and-blood
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 8, 'canon', 'ezekiel', 8, 5, 'free', E'Ezekiel 8:5 — *Then said he unto me, Son of Adam, lift up thine eyes now the way toward the north. So I lifted up mine eyes the way toward the north, and behold northward at the gate of the altar this image of jealousy in the entry.* The statue Abraham saw that angers Yahuah in Apocalypse of Abraham 27:8 is Ezekiel''s image of jealousy set in the sanctuary.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 8, 'canon', 'ezekiel', 8, 6, 'free', E'Ezekiel 8:6 — *He said furthermore unto me, Son of Adam, seest thou what they do? even the great abominations that the house of Yashar''el (Israel) committeth here, that I should go far off from my sanctuary? but turn thee yet again, and thou shalt see greater abominations.* The seed''s provoking by the statue in Apocalypse of Abraham 27:8 is the abomination that drives Yahuah from His sanctuary.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 8, 'canon', 'psalms', 106, 38, 'free', E'Psalm 106:38 — *And shed innocent blood, even the blood of their sons and of their daughters, whom they sacrificed unto the idols of Canaan: and the land was polluted with blood.* The human slaughter in the Temple in Apocalypse of Abraham 27:8 is the innocent blood poured out to idols that pollutes the land.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 8, 'canon', 'jeremiah', 7, 14, 'free', E'Jeremiah 7:14 — *Therefore will I do unto this house, which is called by my name, wherein ye trust, and unto the place which I gave to you and to your fathers, as I have done to Shiloh.* Because of the idol and the blood in Apocalypse of Abraham 27:8 the house called by Yahuah''s name is given over, as Shiloh was.'),
  -- thread: apocalypse-of-abraham-27-two-ways-righteous-and-self-seeking
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 10, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* Abraham''s plea to be shown those who fulfilled the commandments in Apocalypse of Abraham 27:10 is the choice of life Moses set before the seed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 10, 'canon', 'psalms', 15, 2, 'free', E'Psalm 15:2 — *He that walketh uprightly, and worketh righteousness, and speaketh the truth in his heart.* The ones who fulfilled the commandments and the works of righteousness in Apocalypse of Abraham 27:10 are the ones who walk uprightly and work righteousness.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 13, 'canon', 'matthew', 7, 14, 'free', E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The split between the righteous and the men who care for their interests in Apocalypse of Abraham 27:12-13 is the narrow way the few find against the broad way.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 13, 'canon', 'malachi', 3, 18, 'free', E'Malachi 3:18 — *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not.* The two issues Yahuah names to Abraham in Apocalypse of Abraham 27:12-13 are the very discernment between him that serveth Elohim and him that serveth not.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa27_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa27_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-27-temple-burnt-with-fire',
       E'The heathen burn the Temple — it ain''t new',
       E'Abraham beholds it long before it falls: *Lo, I saw them run towards them through four entrances, and they burnt the Temple with fire, and the holy things that were therein they plundered* (Apocalypse of Abraham 27:2), *and the Temple they have burnt with fire, and the beautiful things therein they do rob and destroy* (Apocalypse of Abraham 27:4). The vision is the very thing Scripture records and forewarns. Nebuzar-adan does exactly this: *And he burnt the house of Yahuah (LORD), and the king''s house, and all the houses of Jerusalem, and every great man''s house burnt he with fire* (2 Kings 25:9). The psalmist mourns the plunder of the holy things: *O Elohim (God), the heathen are come into thine inheritance; thy holy temple have they defiled; they have laid Jerusalem on heaps* (Psalm 79:1). Jeremiah of the lament sees the same hand: *The adversary hath spread out his hand upon all her pleasant things: for she hath seen that the heathen entered into her sanctuary, whom thou didst command that they should not enter into thy congregation* (Lamentations 1:10). And the Messiah carries it forward to the abomination that desolates: *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* (Matthew 24:15). Abraham was shown the whole pattern.',
       sv.verse_id, ev.verse_id, 'extras', 67650
  FROM _session253_aoa27_lookup sv, _session253_aoa27_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=27 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-27-people-that-spring-from-me',
       E'Abraham pleads for the people that spring from him',
       E'Seeing his own seed slaughtered and held as aliens, Abraham cries: *Lo, the people that spring from me, whom Thou hast accepted, the hordes of the heathen do plunder, and some they kill, while others they hold fast as aliens* (Apocalypse of Abraham 27:4), and again, *wherefore hast Thou now lacerated my heart, and why should this be so?* (Apocalypse of Abraham 27:6). It is the intercessor''s same wounded plea that runs through the prophets. The psalmist over the defiled inheritance speaks for him: *O Elohim (God), the heathen are come into thine inheritance; thy holy temple have they defiled; they have laid Jerusalem on heaps* (Psalm 79:1). Jeremiah''s lament owns the affliction: *O Yahuah (LORD), behold my affliction: for the enemy hath magnified himself* (Lamentations 1:9). Yet the covenant with this people is never revoked — Yahuah accepted Abraham''s seed by election, as He told Rebekah: *Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger* (Genesis 25:23). Abraham grieves precisely because the accepted seed is held fast as aliens.',
       sv.verse_id, ev.verse_id, 'extras', 67653
  FROM _session253_aoa27_lookup sv, _session253_aoa27_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=27 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-27-statue-of-jealousy-and-blood',
       E'The statue, the bloodshed, the zeal in the Temple',
       E'The reason of the desolation is named: *What thou hast seen shall happen on account of thy seed who anger me by reason of the statue which thou sawest, and on account of the human slaughter in the picture, through zeal in the Temple* (Apocalypse of Abraham 27:8). This is the very charge Ezekiel was carried to see in the visions of Elohim: *behold northward at the gate of the altar this image of jealousy in the entry* (Ezekiel 8:5), the idol that provokes Yahuah to fury — *even the great abominations that the house of Yashar''el (Israel) committeth here, that I should go far off from my sanctuary?* (Ezekiel 8:6). And the human slaughter is the innocent blood the prophets indict: *And shed innocent blood, even the blood of their sons and of their daughters, whom they sacrificed unto the idols of Canaan: and the land was polluted with blood* (Psalm 106:38). When the idol stands and the blood is shed, the sanctuary is given over: *Therefore will I do unto this house, which is called by my name, wherein ye trust, and unto the place which I gave to you and to your fathers, as I have done to Shiloh* (Jeremiah 7:14). It ain''t new — Abraham was shown the cause before the cause was committed.',
       sv.verse_id, ev.verse_id, 'extras', 67656
  FROM _session253_aoa27_lookup sv, _session253_aoa27_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=8
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=27 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-27-two-ways-righteous-and-self-seeking',
       E'The two ways — those who keep the commandments and those who seek their own',
       E'Abraham turns from the works of evil and asks to be shown the other people: *show me those who fulfilled the commandments, even the works of his righteousness* (Apocalypse of Abraham 27:10), and the answer divides the times by holiness and by self-seeking — *The time of the righteous meeteth them first through the holiness flowing from kings and righteous-dealing rulers* (Apocalypse of Abraham 27:12), *But from these issue men who care for their interests* (Apocalypse of Abraham 27:13). This is the two ways laid down from the beginning. Moses set them before Yashar''el: *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). The righteous Abraham seeks are those who do the commandments: *He that walketh uprightly, and worketh righteousness, and speaketh the truth in his heart* (Psalm 15:2). The Messiah set the same narrow and broad before the multitudes: *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it* (Matthew 7:14). And the day comes that divides them visibly: *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not* (Malachi 3:18). Election precedes confession; the commandments stand.',
       sv.verse_id, ev.verse_id, 'extras', 67659
  FROM _session253_aoa27_lookup sv, _session253_aoa27_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=10
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=27 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-27-temple-burnt-with-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 25:9 — *And he burnt the house of Yahuah (LORD), and the king''s house, and all the houses of Jerusalem, and every great man''s house burnt he with fire.* The history fulfils to the letter what Abraham was shown of the Temple burnt with fire in Apocalypse of Abraham 27:2.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-temple-burnt-with-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=25 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Lamentations 1:10 — *The adversary hath spread out his hand upon all her pleasant things: for she hath seen that the heathen entered into her sanctuary, whom thou didst command that they should not enter into thy congregation.* The plundering of the holy things in Apocalypse of Abraham 27:2 is the heathen spreading his hand on her pleasant things.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-temple-burnt-with-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 79:1 — *O Elohim (God), the heathen are come into thine inheritance; thy holy temple have they defiled; they have laid Jerusalem on heaps.* Abraham''s lament that the hordes plunder and rob the beautiful things in Apocalypse of Abraham 27:4 is the psalmist''s cry over the defiled temple.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-temple-burnt-with-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The desolation Abraham foresaw in Apocalypse of Abraham 27:4 the Messiah carries forward as the sign yet to be watched for.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-temple-burnt-with-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-27-people-that-spring-from-me
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 79:1 — *O Elohim (God), the heathen are come into thine inheritance; thy holy temple have they defiled; they have laid Jerusalem on heaps.* Abraham''s grief that the heathen plunder the people that spring from him in Apocalypse of Abraham 27:4 is the psalmist''s grief over the inheritance overrun.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-people-that-spring-from-me'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Lamentations 1:9 — *Her filthiness is in her skirts; she remembereth not her last end; therefore she came down wonderfully: she had no comforter. O Yahuah (LORD), behold my affliction: for the enemy hath magnified himself.* Abraham''s lacerated heart in Apocalypse of Abraham 27:6 is the same cry that the enemy has magnified himself over the city.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-people-that-spring-from-me'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The people Yahuah accepted in Apocalypse of Abraham 27:4 are the elect seed marked out by election from the womb, not a people replacing them.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-people-that-spring-from-me'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-27-statue-of-jealousy-and-blood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 8:5 — *Then said he unto me, Son of Adam, lift up thine eyes now the way toward the north. So I lifted up mine eyes the way toward the north, and behold northward at the gate of the altar this image of jealousy in the entry.* The statue Abraham saw that angers Yahuah in Apocalypse of Abraham 27:8 is Ezekiel''s image of jealousy set in the sanctuary.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-statue-of-jealousy-and-blood'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=8 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 8:6 — *He said furthermore unto me, Son of Adam, seest thou what they do? even the great abominations that the house of Yashar''el (Israel) committeth here, that I should go far off from my sanctuary? but turn thee yet again, and thou shalt see greater abominations.* The seed''s provoking by the statue in Apocalypse of Abraham 27:8 is the abomination that drives Yahuah from His sanctuary.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-statue-of-jealousy-and-blood'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=8 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 106:38 — *And shed innocent blood, even the blood of their sons and of their daughters, whom they sacrificed unto the idols of Canaan: and the land was polluted with blood.* The human slaughter in the Temple in Apocalypse of Abraham 27:8 is the innocent blood poured out to idols that pollutes the land.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-statue-of-jealousy-and-blood'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 7:14 — *Therefore will I do unto this house, which is called by my name, wherein ye trust, and unto the place which I gave to you and to your fathers, as I have done to Shiloh.* Because of the idol and the blood in Apocalypse of Abraham 27:8 the house called by Yahuah''s name is given over, as Shiloh was.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-statue-of-jealousy-and-blood'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-27-two-ways-righteous-and-self-seeking
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* Abraham''s plea to be shown those who fulfilled the commandments in Apocalypse of Abraham 27:10 is the choice of life Moses set before the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-two-ways-righteous-and-self-seeking'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 15:2 — *He that walketh uprightly, and worketh righteousness, and speaketh the truth in his heart.* The ones who fulfilled the commandments and the works of righteousness in Apocalypse of Abraham 27:10 are the ones who walk uprightly and work righteousness.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-two-ways-righteous-and-self-seeking'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=15 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The split between the righteous and the men who care for their interests in Apocalypse of Abraham 27:12-13 is the narrow way the few find against the broad way.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-two-ways-righteous-and-self-seeking'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 3:18 — *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not.* The two issues Yahuah names to Abraham in Apocalypse of Abraham 27:12-13 are the very discernment between him that serveth Elohim and him that serveth not.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-two-ways-righteous-and-self-seeking'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

