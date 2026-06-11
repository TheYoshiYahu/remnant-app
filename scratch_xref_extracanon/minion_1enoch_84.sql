-- ----- fragment: minion_1enoch_84.sql (session250 1-enoch 84) -----
-- Source anchor: enoch/1-enoch ch84. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en84 (view _session250_en84_lookup). Sort band base 52075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en84_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-84-everlasting-throne-dominion
  ('enoch', '1-enoch', 84, 2, 'canon', 'daniel', 4, 34, 'free', E'Daniel 4:34 — *And at the end of the days I Nebuchadnezzar lifted up mine eyes unto heaven, and mine understanding returned unto me, and I blessed the El Elyon (most High), and I praised and honoured him that liveth for ever, whose dominion is an everlasting dominion, and his kingdom is from generation to generation:* the pagan king is driven to Enoch''s exact confession of an everlasting throne and dominion.'),
  ('enoch', '1-enoch', 84, 3, 'canon', 'daniel', 4, 35, 'free', E'Daniel 4:35 — *And all the inhabitants of the earth are reputed as nothing: and he doeth according to his will in the army of heaven, and among the inhabitants of the earth: and none can stay his hand, or say unto him, What doest thou?* Enoch''s ''Thou hast power over all things'' is Daniel''s ''none can stay his hand.'''),
  ('enoch', '1-enoch', 84, 2, 'canon', 'psalms', 145, 13, 'free', E'Psalm 145:13 — *Thy kingdom is an everlasting kingdom, and thy dominion endureth throughout all generations.* The Psalmist''s crown matches Enoch''s ''Thy throne is for ever and ever.'''),
  ('enoch', '1-enoch', 84, 2, 'canon', 'isaiah', 6, 1, 'free', E'Isaiah 6:1 — *In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple.* Isaiah is shown the very throne ''for ever and ever'' that Enoch is blessing.'),
  ('enoch', '1-enoch', 84, 2, 'canon', 'revelation', 11, 17, 'free', E'Revelation 11:17 — *Saying, We give thee thanks, O Yahuah Elohim (Lord God) Almighty, which art, and wast, and art to come; because thou hast taken to thee thy great power, and hast reigned.* The redeemed close the age with Enoch''s confession of the everlasting King who reigns.'),
  ('enoch', '1-enoch', 84, 2, 'enoch', '1-enoch', 9, 4, 'extras', E'1 Enoch 9:4 — *And they said to Yahuah (God) of the ages: "Lord of lords, Elohim (God) of elohiym, King of kings, and Elohim (God) of the ages, the throne of Thy glory (standeth) unto all the generations of the world, and Thy Name is holy and glorious and blessed unto all the ages!* the angels'' first cry against the Watchers names the same everlasting throne Enoch blesses here.'),
  -- thread: 1-enoch-84-all-naked-and-open
  ('enoch', '1-enoch', 84, 3, 'canon', 'hebrews', 4, 13, 'free', E'Hebrews 4:13 — *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do.* the canon carries Enoch''s exact phrase: all things naked and open before the eyes of God.'),
  ('enoch', '1-enoch', 84, 8, 'canon', 'psalms', 139, 7, 'free', E'Psalm 139:7 — *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* David confesses Enoch''s ''nothing can hide itself from Thee.'''),
  ('enoch', '1-enoch', 84, 3, 'canon', 'psalms', 11, 4, 'free', E'Psalm 11:4 — *Yahuah (LORD) is in his holy temple, the LORD''S throne is in heaven: his eyes behold, his eyelids try, the children of men.* the enthroned One whose eyes see all is the same God Enoch blesses.'),
  ('enoch', '1-enoch', 84, 3, 'enoch', '1-enoch', 9, 5, 'extras', E'1 Enoch 9:5 — *Thou hast made all things, and power over all things hast Thou: and all things are naked and open in Thy sight, and Thou seest all things, and nothing can hide itself from Thee.* the angels'' intercession against the Watchers uses the identical formula Enoch repeats in his prayer.'),
  -- thread: 1-enoch-84-watchers-azazel-giants
  ('enoch', '1-enoch', 84, 6, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* the canon''s account of the Watchers going to the daughters of men that Enoch is rehearsing.'),
  ('enoch', '1-enoch', 84, 7, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* Enoch''s ''the women have borne giants'' is Genesis 6:4 itself.'),
  ('enoch', '1-enoch', 84, 7, 'canon', 'genesis', 6, 11, 'free', E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* matches Enoch''s ''the whole earth has thereby been filled with blood and unrighteousness.'''),
  ('enoch', '1-enoch', 84, 9, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude carries forward Enoch''s ''fallen angels'' who led astray the children of men.'),
  ('enoch', '1-enoch', 84, 9, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* the apostle binds the same fallen Watchers Enoch names to their reserved judgment.'),
  ('enoch', '1-enoch', 84, 6, 'jubilees', 'jubilees', 5, 1, 'extras', E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* a parallel extra-canon witness to the descent Enoch lays before the throne.'),
  -- thread: 1-enoch-84-preserve-a-seed-remnant
  ('enoch', '1-enoch', 84, 10, 'canon', 'genesis', 6, 8, 'free', E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* the seed preserved for the righteous in Enoch''s plea is, in the Flood account, the one man left alive.'),
  ('enoch', '1-enoch', 84, 10, 'canon', 'genesis', 7, 23, 'free', E'Genesis 7:23 — *And every living substance was destroyed which was upon the face of the ground, both man, and cattle, and the creeping things, and the fowl of the heaven; and they were destroyed from the earth: and Noah only remained alive, and they that were with him in the ark.* the destruction of unrighteousness with a seed preserved is exactly Enoch''s request answered.'),
  ('enoch', '1-enoch', 84, 11, 'canon', 'micah', 1, 3, 'free', E'Micah 1:3 — *For, behold, Yahuah (LORD) cometh forth out of his place, and will come down, and tread upon the high places of the earth.* the prophet''s cry matches Enoch''s ''come forth from Thy holy habitation, And come down upon the earth.'''),
  ('enoch', '1-enoch', 84, 11, 'canon', 'isaiah', 64, 1, 'free', E'Isaiah 64:1 — *Oh that thou wouldest rend the heavens, that thou wouldest come down, that the mountains might flow down at thy presence,* the same plea that the Most High come down upon the earth.'),
  ('enoch', '1-enoch', 84, 12, 'canon', 'isaiah', 1, 9, 'free', E'Isaiah 1:9 — *Except Yahuah Tseva''ot (LORD of hosts) had left unto us a very small remnant, we should have been as Sodom, and we should have been like unto Gomorrah.* the preserved-seed principle of Enoch''s plea is the remnant left to Israel.'),
  ('enoch', '1-enoch', 84, 12, 'canon', 'romans', 11, 5, 'free', E'Romans 11:5 — *Even so then at this present time also there is a remnant according to the election of grace.* Paul reads the preserved seed as the elect remnant of Israel in the present — election precedes the preserving, the very frame of Enoch''s ''the righteous and elect Thou shalt preserve.'''),
  ('enoch', '1-enoch', 84, 10, 'jubilees', 'jubilees', 5, 19, 'extras', E'Jubilees 5:19 — *And as for all those who corrupted their ways and their thoughts before the flood, no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account; for his heart was righteous in all his ways, according as it was commanded regarding him, and he had not departed from aught that was ordained for him.* a parallel witness to the lone preserved seed Enoch begs for.'),
  ('enoch', '1-enoch', 84, 10, 'enoch', '1-enoch', 10, 3, 'extras', E'1 Enoch 10:3 — *And now instruct him that he may escape and his seed may be preserved for all the generations of the world.* Enoch''s own earlier commission to Noah is the answer to the plea he prays here — the seed preserved through the Flood.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en84_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en84_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-84-everlasting-throne-dominion',
       E'Thy throne is for ever and ever — the everlasting dominion',
       E'Enoch opens his blessing by exalting the Most High as King over an unending reign: *''Blessed be Thou, O Yahuah (God), King, Great and mighty in Thy greatness, Elyon in Thy dominion, And Thy throne is for ever and ever, And Thy name is holy and great for ever and ever, And blessed be Thou for ever.''* (1 Enoch 84:2). This is the same confession Nebuchadnezzar is forced to make when his reason returns: *''I blessed the El Elyon (most High), and I praised and honoured him that liveth for ever, whose dominion is an everlasting dominion, and his kingdom is from generation to generation''* (Daniel 4:34) — and *''none can stay his hand, or say unto him, What doest thou?''* (Daniel 4:35). The Psalmist sings the same crown: *''Thy kingdom is an everlasting kingdom, and thy dominion endureth throughout all generations.''* (Psalm 145:13). Isaiah is granted the vision behind Enoch''s words — *''I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple.''* (Isaiah 6:1) — and the redeemed at the consummation echo the everlasting King: *''We give thee thanks, O Yahuah Elohim (Lord God) Almighty, which art, and wast, and art to come; because thou hast taken to thee thy great power, and hast reigned.''* (Revelation 11:17). The throne of glory that opens Enoch''s plea is the same throne the watching angels named at the first cry against the Watchers: *''Lord of lords, Elohim (God) of elohiym, King of kings... the throne of Thy glory (standeth) unto all the generations of the world''* (1 Enoch 9:4). The sovereignty is total, ordered, and unshakeable — the ground on which a remnant can be safely asked for.',
       sv.verse_id, ev.verse_id, 'extras', 52075
  FROM _session250_en84_lookup sv, _session250_en84_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=84 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-84-all-naked-and-open',
       E'All things are naked and open in Thy sight — the searching omniscience',
       E'Enoch presses past the throne to the eyes of the One on it: *''Thou hast made all things, And Thou hast power over all things: And all things are naked and open in Thy sight, And Thou seest all things, And nothing can hide itself from Thee.''* (1 Enoch 84:3) — and again, *''And now, O Yahuah (God) of Spirits, Thou knowest all things, And all the hidden things are manifest before Thee.''* (1 Enoch 84:8). Hebrews lifts this line nearly word for word into the canon: *''Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do.''* (Hebrews 4:13). David knew there is no hiding from the same gaze — *''Whither shall I go from thy spirit? or whither shall I flee from thy presence?''* (Psalm 139:7) — and the same enthroned eyes try the sons of men: *''Yahuah (LORD) is in his holy temple, the LORD''S throne is in heaven: his eyes behold, his eyelids try, the children of men.''* (Psalm 11:4). This is the same omniscience the angels declared at the dawn of the Watcher-judgment, the page Enoch is deliberately echoing: *''Thou hast made all things, and power over all things hast Thou: and all things are naked and open in Thy sight, and Thou seest all things, and nothing can hide itself from Thee.''* (1 Enoch 9:5). Nothing of the Watchers'' secret arts is hidden — which is exactly why Enoch can name them next and trust the verdict.',
       sv.verse_id, ev.verse_id, 'extras', 52078
  FROM _session250_en84_lookup sv, _session250_en84_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=84 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-84-watchers-azazel-giants',
       E'Thou seest what Azazel has done — the Watchers, the women, and the giants',
       E'Enoch lays the whole catastrophe of Genesis 6 before the all-seeing King: *''Thou seest what Azâzêl has done, Who has taught all unrighteousness on earth And revealed the eternal secrets which were (preserved) in heaven... And they have gone to the daughters of men upon the earth, And have lain with the women, And have defiled themselves... And the women have borne giants, And the whole earth has thereby been filled with blood and unrighteousness.''* (1 Enoch 84:4-7). This is the canon''s own account: *''That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.''* (Genesis 6:2), and *''There were giants in the earth in those days... the same became mighty men which were of old, men of renown.''* (Genesis 6:4), so that *''the earth was filled with violence.''* (Genesis 6:11). The New Testament keeps the same dossier: *''And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.''* (Jude 1:6), and *''For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;''* (2 Peter 2:4). Jubilees recounts the identical descent — *''the angels of Elohim (God) saw them... and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.''* (Jubilees 5:1). The Watchers'' sin is rebellion against the Creator''s order — fallen stars teaching forbidden arts, the seed-war sown — not a tale of mere human wickedness; and because the all-seeing One has already seen it (84:9, *''how they have led astray the children of men''*), the verdict is sure.',
       sv.verse_id, ev.verse_id, 'extras', 52081
  FROM _session250_en84_lookup sv, _session250_en84_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=84 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-84-preserve-a-seed-remnant',
       E'Preserve a seed for the righteous — the plea and the remnant left',
       E'Enoch''s blessing turns to intercession, asking not for a blanket reprieve but for a preserved seed: *''And now I beseech Thee, O Yahuah (God) of Spirits, To have mercy upon the children of men, And not to destroy the whole race of men, But to preserve a seed from them for the righteous.''* (1 Enoch 84:10), and he pleads for the Most High to come down — *''Arise and come forth from Thy holy habitation, And come down upon the earth, And destroy the unrighteousness from off the face of the earth''* (1 Enoch 84:11) — *''But the righteous and elect Thou shalt preserve, And they shall dwell in Thy presence for ever and ever.''* (1 Enoch 84:12). The seed preserved through the Flood is one man and his house: *''But Noah found grace in the eyes of Yahuah (LORD).''* (Genesis 6:8), so that *''Noah only remained alive, and they that were with him in the ark.''* (Genesis 7:23). The plea that the Lord ''come forth from His holy habitation'' is the prophets'' cry — *''For, behold, Yahuah (LORD) cometh forth out of his place, and will come down, and tread upon the high places of the earth.''* (Micah 1:3) and *''Oh that thou wouldest rend the heavens, that thou wouldest come down''* (Isaiah 64:1). And the preserved-seed principle runs straight to the two-house remnant: *''Except Yahuah Tseva''ot (LORD of hosts) had left unto us a very small remnant, we should have been as Sodom''* (Isaiah 1:9), *''yet a remnant of them shall return''* (Isaiah 10:22) — which Paul reads as God leaving Israel a seed in the present awakening: *''Even so then at this present time also there is a remnant according to the election of grace.''* (Romans 11:5). Election precedes the preserving: the righteous and elect are already His — *they* are the seed left, not a self-selected class. Jubilees marks the same lone-survivor mercy: *''no man''s person was accepted save that of Noah alone... for his heart was righteous in all his ways''* (Jubilees 5:19), the Flood-pattern that Enoch''s own commission already framed — *''that he may escape and his seed may be preserved for all the generations of the world.''* (1 Enoch 10:3). The Watchers are bound, the unrighteousness swept off, but the elect dwell in His presence for ever — sovereignty and a preserved seed held together.',
       sv.verse_id, ev.verse_id, 'extras', 52084
  FROM _session250_en84_lookup sv, _session250_en84_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=84 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-84-everlasting-throne-dominion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 4:34 — *And at the end of the days I Nebuchadnezzar lifted up mine eyes unto heaven, and mine understanding returned unto me, and I blessed the El Elyon (most High), and I praised and honoured him that liveth for ever, whose dominion is an everlasting dominion, and his kingdom is from generation to generation:* the pagan king is driven to Enoch''s exact confession of an everlasting throne and dominion.'
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-everlasting-throne-dominion'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 4:35 — *And all the inhabitants of the earth are reputed as nothing: and he doeth according to his will in the army of heaven, and among the inhabitants of the earth: and none can stay his hand, or say unto him, What doest thou?* Enoch''s ''Thou hast power over all things'' is Daniel''s ''none can stay his hand.'''
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-everlasting-throne-dominion'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 145:13 — *Thy kingdom is an everlasting kingdom, and thy dominion endureth throughout all generations.* The Psalmist''s crown matches Enoch''s ''Thy throne is for ever and ever.'''
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-everlasting-throne-dominion'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 6:1 — *In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple.* Isaiah is shown the very throne ''for ever and ever'' that Enoch is blessing.'
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-everlasting-throne-dominion'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 11:17 — *Saying, We give thee thanks, O Yahuah Elohim (Lord God) Almighty, which art, and wast, and art to come; because thou hast taken to thee thy great power, and hast reigned.* The redeemed close the age with Enoch''s confession of the everlasting King who reigns.'
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-everlasting-throne-dominion'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Enoch 9:4 — *And they said to Yahuah (God) of the ages: "Lord of lords, Elohim (God) of elohiym, King of kings, and Elohim (God) of the ages, the throne of Thy glory (standeth) unto all the generations of the world, and Thy Name is holy and glorious and blessed unto all the ages!* the angels'' first cry against the Watchers names the same everlasting throne Enoch blesses here.'
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-everlasting-throne-dominion'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-84-all-naked-and-open
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 4:13 — *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do.* the canon carries Enoch''s exact phrase: all things naked and open before the eyes of God.'
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-all-naked-and-open'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 139:7 — *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* David confesses Enoch''s ''nothing can hide itself from Thee.'''
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-all-naked-and-open'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 11:4 — *Yahuah (LORD) is in his holy temple, the LORD''S throne is in heaven: his eyes behold, his eyelids try, the children of men.* the enthroned One whose eyes see all is the same God Enoch blesses.'
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-all-naked-and-open'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 9:5 — *Thou hast made all things, and power over all things hast Thou: and all things are naked and open in Thy sight, and Thou seest all things, and nothing can hide itself from Thee.* the angels'' intercession against the Watchers uses the identical formula Enoch repeats in his prayer.'
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-all-naked-and-open'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-84-watchers-azazel-giants
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* the canon''s account of the Watchers going to the daughters of men that Enoch is rehearsing.'
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-watchers-azazel-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* Enoch''s ''the women have borne giants'' is Genesis 6:4 itself.'
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-watchers-azazel-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* matches Enoch''s ''the whole earth has thereby been filled with blood and unrighteousness.'''
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-watchers-azazel-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude carries forward Enoch''s ''fallen angels'' who led astray the children of men.'
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-watchers-azazel-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* the apostle binds the same fallen Watchers Enoch names to their reserved judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-watchers-azazel-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* a parallel extra-canon witness to the descent Enoch lays before the throne.'
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-watchers-azazel-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-84-preserve-a-seed-remnant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* the seed preserved for the righteous in Enoch''s plea is, in the Flood account, the one man left alive.'
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-preserve-a-seed-remnant'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 7:23 — *And every living substance was destroyed which was upon the face of the ground, both man, and cattle, and the creeping things, and the fowl of the heaven; and they were destroyed from the earth: and Noah only remained alive, and they that were with him in the ark.* the destruction of unrighteousness with a seed preserved is exactly Enoch''s request answered.'
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-preserve-a-seed-remnant'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Micah 1:3 — *For, behold, Yahuah (LORD) cometh forth out of his place, and will come down, and tread upon the high places of the earth.* the prophet''s cry matches Enoch''s ''come forth from Thy holy habitation, And come down upon the earth.'''
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-preserve-a-seed-remnant'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 64:1 — *Oh that thou wouldest rend the heavens, that thou wouldest come down, that the mountains might flow down at thy presence,* the same plea that the Most High come down upon the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-preserve-a-seed-remnant'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=64 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 1:9 — *Except Yahuah Tseva''ot (LORD of hosts) had left unto us a very small remnant, we should have been as Sodom, and we should have been like unto Gomorrah.* the preserved-seed principle of Enoch''s plea is the remnant left to Israel.'
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-preserve-a-seed-remnant'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Romans 11:5 — *Even so then at this present time also there is a remnant according to the election of grace.* Paul reads the preserved seed as the elect remnant of Israel in the present — election precedes the preserving, the very frame of Enoch''s ''the righteous and elect Thou shalt preserve.'''
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-preserve-a-seed-remnant'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Jubilees 5:19 — *And as for all those who corrupted their ways and their thoughts before the flood, no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account; for his heart was righteous in all his ways, according as it was commanded regarding him, and he had not departed from aught that was ordained for him.* a parallel witness to the lone preserved seed Enoch begs for.'
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-preserve-a-seed-remnant'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=10
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'1 Enoch 10:3 — *And now instruct him that he may escape and his seed may be preserved for all the generations of the world.* Enoch''s own earlier commission to Noah is the answer to the plea he prays here — the seed preserved through the Flood.'
  FROM cross_reference_threads t, cross_references x, _session250_en84_lookup sv, _session250_en84_lookup tv
 WHERE t.slug='1-enoch-84-preserve-a-seed-remnant'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=84 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

