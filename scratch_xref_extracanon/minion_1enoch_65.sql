-- ----- fragment: minion_1enoch_65.sql (session250 1-enoch 65) -----
-- Source anchor: enoch/1-enoch ch65. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en65 (view _session250_en65_lookup). Sort band base 51600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en65_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-65-earth-corrupt-sinking
  ('enoch', '1-enoch', 65, 1, 'canon', 'genesis', 6, 11, 'free', E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The sinking, shaken earth Noah sees in Enoch 65:1 is the corrupted, violence-filled earth Moses names on the eve of the Flood.'),
  ('enoch', '1-enoch', 65, 1, 'canon', 'genesis', 6, 12, 'free', E'Genesis 6:12 — *And Elohim (God) looked upon the earth, and, behold, it was corrupt; for all flesh had corrupted his way upon the earth.* Enoch 65:1''s earth ''nigh to destruction'' is the all-flesh corruption that draws the divine sentence.'),
  ('enoch', '1-enoch', 65, 3, 'canon', 'genesis', 6, 7, 'free', E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* Noah''s fear in Enoch 65:3 that he ''shall be destroyed with it'' answers the decree of total destruction Yahuah announces.'),
  ('enoch', '1-enoch', 65, 1, 'jubilees', 'jubilees', 5, 2, 'extras', E'Jubilees 5:2 — *And lawlessness increased on the earth and all flesh corrupted its way, alike men and cattle and beasts and birds and everything that walks on the earth-all of them corrupted their ways and their orders, and they began to devour each other, and lawlessness increased on the earth and every imagination of the thoughts of all men (was) thus evil continually.* The parallel witness names the lawlessness that has ''tired and shaken'' the earth of Enoch 65:1.'),
  -- thread: 1-enoch-65-noah-cries-enoch-warns
  ('enoch', '1-enoch', 65, 6, 'canon', '2-peter', 2, 3, 'free', E'2 Peter 2:3 — *And through covetousness shall they with feigned words make merchandise of you: whose judgment now of a long time lingereth not, and their damnation slumbereth not.* Enoch''s unceasing warning of the coming judgement (Enoch 65:6) is the same sentence Peter says lingers not and does not slumber.'),
  ('enoch', '1-enoch', 65, 2, 'canon', 'genesis', 7, 22, 'free', E'Genesis 7:22 — *All in whose nostrils was the breath of life, of all that was in the dry land, died.* The destruction Noah cries to Enoch about in 65:2 is the Flood that took all flesh that breathed.'),
  -- thread: 1-enoch-65-watchers-taught-sin
  ('enoch', '1-enoch', 65, 9, 'enoch', '1-enoch', 8, 1, 'extras', E'1 Enoch 8:1 — *And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them, and bracelets, and ornaments, and the use of antimony, and the beautifying of the eyelids, and all kinds of costly stones, and all colouring tinctures.* Enoch''s word to Noah in 65:9 recalls his own earlier account of the forbidden arts the descended angels taught mankind.'),
  ('enoch', '1-enoch', 65, 9, 'canon', 'genesis', 6, 12, 'free', E'Genesis 6:12 — *And Elohim (God) looked upon the earth, and, behold, it was corrupt; for all flesh had corrupted his way upon the earth.* The angels who ''corrupted the earth'' in Enoch 65:9 are why Moses says all flesh had corrupted its way.'),
  ('enoch', '1-enoch', 65, 9, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The descended angels of Enoch 65:9 are the angels Jude says left their habitation and are reserved in chains for judgement.'),
  ('enoch', '1-enoch', 65, 11, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* The Most High''s punishment upon the fallen angels in Enoch 65:11 is Peter''s angels that sinned, cast down and reserved unto judgement.'),
  ('enoch', '1-enoch', 65, 10, 'jubilees', 'jubilees', 5, 1, 'extras', E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* The spirits of the giants in Enoch 65:10 are the offspring of the angels Jubilees says took wives and bore giants.'),
  -- thread: 1-enoch-65-earth-cleansed-righteous
  ('enoch', '1-enoch', 65, 12, 'enoch', '1-enoch', 10, 20, 'extras', E'1 Enoch 10:20 — *And cleanse thou the earth from all oppression, and from all unrighteousness, and from all sin: and all the uncleanness that is wrought upon the earth destroy from off the earth.* Enoch''s word to Noah in 65:12 repeats the cleansing he was earlier commanded to announce over the post-Flood earth.'),
  ('enoch', '1-enoch', 65, 13, 'enoch', '1-enoch', 10, 21, 'extras', E'1 Enoch 10:21 — *And all the children of men shall become righteous, and all nations shall offer adoration and shall praise Me, and all shall worship Me.* Enoch 65:13''s children of men made righteous to worship Yahuah of Spirits is the same restored worship he foretold in chapter 10.'),
  ('enoch', '1-enoch', 65, 12, 'jubilees', 'jubilees', 5, 11, 'extras', E'Jubilees 5:11 — *And He destroyed all from their places, and there was not left one of them whom He judged not according to all their wickedness. And He made for all His works a new and righteous nature, so that they should not sin in their whole nature for ever, but should be all righteous each in his kind alway.* The earth cleansed and made righteous in Enoch 65:12 is Jubilees'' new and righteous nature after the Flood.'),
  ('enoch', '1-enoch', 65, 12, 'canon', 'genesis', 8, 21, 'free', E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man’s sake; for the imagination of man’s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The cleansed earth of Enoch 65:12 is the ground Yahuah vows not again to curse once the Flood has passed.'),
  -- thread: 1-enoch-65-noah-righteous-elect-preserved
  ('enoch', '1-enoch', 65, 14, 'canon', 'genesis', 6, 8, 'free', E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* The righteous preserved and not destroyed in Enoch 65:14 is Noah, who first found grace before the Flood.'),
  ('enoch', '1-enoch', 65, 14, 'canon', 'genesis', 6, 9, 'free', E'Genesis 6:9 — *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God).* Enoch 65:14''s preserved righteous one is Noah the just and perfect, who walked with Elohim.'),
  ('enoch', '1-enoch', 65, 14, 'jubilees', 'jubilees', 5, 19, 'extras', E'Jubilees 5:19 — *And as for all those who corrupted their ways and their thoughts before the flood, no man’s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account; for his heart was righteous in all his ways, according as it was commanded regarding him, and he had not departed from aught that was ordained for him.* Enoch 65:14''s elect preserved through the judgement is Noah alone accepted, saved with his sons because his heart was righteous.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en65_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en65_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-65-earth-corrupt-sinking',
       E'The earth sunk down and nigh to destruction',
       E'Noah sees the world itself giving way under the weight of its corruption: *And in those days Noah saw the earth that it had sunk down, And its destruction was nigh.* (1 Enoch 65:1) — *That the earth is so tired and shaken? May it not be on my account? Shall I be destroyed with it?* (1 Enoch 65:3). This is no new vision; it is Genesis told from inside the ark-builder''s house. Moses names the same ruin: *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* (Genesis 6:11) — *And Elohim (God) looked upon the earth, and, behold, it was corrupt; for all flesh had corrupted his way upon the earth.* (Genesis 6:12), so that *Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth* (Genesis 6:7). Jubilees, the parallel witness, records the same flood of lawlessness that wearied the ground: *And lawlessness increased on the earth and all flesh corrupted its way... and they began to devour each other* (Jubilees 5:2). The judgement falls on a covenant broken and a creation defiled — never on the Creator''s order, which stands.',
       sv.verse_id, ev.verse_id, 'extras', 51600
  FROM _session250_en65_lookup sv, _session250_en65_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=65 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-65-noah-cries-enoch-warns',
       E'Noah cries to Enoch; Enoch warns of the coming judgement',
       E'Noah runs to the ends of the earth and cries to his translated grandfather: *And he arose from thence and went to the ends of the earth, And cried aloud to his grandfather Enoch... Hear me, hear me, hear me.* (1 Enoch 65:2). Enoch comes and does not fall silent: *And from that time forward he did not cease to speak to the children of men, And to warn them of the coming judgment.* (1 Enoch 65:6). The witness who walked with Elohim and was taken became the preacher of righteousness before the Flood — Peter sets the same wall against the same scoffers, *whose judgment now of a long time lingereth not, and their damnation slumbereth not.* (2 Peter 2:3). And Yahusha hangs the last days on these very Noah-days: the warning Enoch would not cease to give is the warning still going out, that men ate and drank and knew not until the Flood came. The judgement is real, announced, and patient — but it does not slumber.',
       sv.verse_id, ev.verse_id, 'extras', 51603
  FROM _session250_en65_lookup sv, _session250_en65_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=65 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-65-watchers-taught-sin',
       E'The angels who descended taught mankind sin',
       E'Enoch names the root of the ruin: *And behold, the angels who descended from heaven Have taught mankind sin, And have led them astray, And have corrupted the earth.* (1 Enoch 65:9) — *And the spirits of the giants shall rise up against them, And they shall destroy the children of men.* (1 Enoch 65:10). This is Enoch''s own earlier testimony, brought forward to Noah: *And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them... Semjâzâ taught enchantments, and root-cuttings, Armârôs the resolving of enchantments, Barâqîjâl taught astrology, Kôkabêl the constellations* (1 Enoch 8:1-2). It is the canon''s own Genesis 6, when *the angels of Elohim (God) saw them... and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* (Jubilees 5:1). Jude and Peter carry it: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6) — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). The Watchers'' sin is rebellion against the Creator''s order; the seed-war they sowed runs straight into the Flood Noah is about to outlive.',
       sv.verse_id, ev.verse_id, 'extras', 51606
  FROM _session250_en65_lookup sv, _session250_en65_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=9
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=65 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-65-earth-cleansed-righteous',
       E'The earth cleansed; all made righteous to worship',
       E'Past the judgement Enoch shows Noah the cleansed world: *And the earth shall be cleansed from all corruption, And from all unrighteousness, And from all sin, And from all iniquity.* (1 Enoch 65:12) — *And all the children of men shall become righteous, And all shall worship Yahuah (God) of Spirits, And shall praise Him for ever and ever.* (1 Enoch 65:13). This is Enoch''s own earlier oracle, repeated almost word for word: *And cleanse thou the earth from all oppression, and from all unrighteousness, and from all sin* (1 Enoch 10:20) — *And all the children of men shall become righteous, and all nations shall offer adoration and shall praise Me, and all shall worship Me.* (1 Enoch 10:21). Jubilees seals the same renewal after the Flood: *And He made for all His works a new and righteous nature, so that they should not sin in their whole nature for ever, but should be all righteous each in his kind alway.* (Jubilees 5:11), the LORD vowing *I will not again curse the ground any more for man''s sake* (Genesis 8:21). The cleansing is the Creator restoring His own order — the way kept, not the law cursed.',
       sv.verse_id, ev.verse_id, 'extras', 51609
  FROM _session250_en65_lookup sv, _session250_en65_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=12
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=65 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-65-noah-righteous-elect-preserved',
       E'Noah preserved; the elect not destroyed',
       E'Enoch''s last word to Noah is election: *And the righteous shall be preserved, And the elect shall dwell with them, And they shall not be destroyed.* (1 Enoch 65:14). Noah is not preserved because he selected himself — Moses says grace came first: *But Noah found grace in the eyes of Yahuah (LORD).* (Genesis 6:8) — *Noah was a just man and perfect in his generations, and Noah walked with Elohim (God).* (Genesis 6:9). Jubilees makes the order plain: when no man''s person was accepted, *no man’s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account; for his heart was righteous in all his ways* (Jubilees 5:19). The elect of Enoch 65:14 are a preserved people, kept through the judgement — election before the waters rise, righteousness walked out in the keeping of the way, never a class that saved itself.',
       sv.verse_id, ev.verse_id, 'extras', 51612
  FROM _session250_en65_lookup sv, _session250_en65_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=14
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=65 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-65-earth-corrupt-sinking
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The sinking, shaken earth Noah sees in Enoch 65:1 is the corrupted, violence-filled earth Moses names on the eve of the Flood.'
  FROM cross_reference_threads t, cross_references x, _session250_en65_lookup sv, _session250_en65_lookup tv
 WHERE t.slug='1-enoch-65-earth-corrupt-sinking'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:12 — *And Elohim (God) looked upon the earth, and, behold, it was corrupt; for all flesh had corrupted his way upon the earth.* Enoch 65:1''s earth ''nigh to destruction'' is the all-flesh corruption that draws the divine sentence.'
  FROM cross_reference_threads t, cross_references x, _session250_en65_lookup sv, _session250_en65_lookup tv
 WHERE t.slug='1-enoch-65-earth-corrupt-sinking'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* Noah''s fear in Enoch 65:3 that he ''shall be destroyed with it'' answers the decree of total destruction Yahuah announces.'
  FROM cross_reference_threads t, cross_references x, _session250_en65_lookup sv, _session250_en65_lookup tv
 WHERE t.slug='1-enoch-65-earth-corrupt-sinking'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:2 — *And lawlessness increased on the earth and all flesh corrupted its way, alike men and cattle and beasts and birds and everything that walks on the earth-all of them corrupted their ways and their orders, and they began to devour each other, and lawlessness increased on the earth and every imagination of the thoughts of all men (was) thus evil continually.* The parallel witness names the lawlessness that has ''tired and shaken'' the earth of Enoch 65:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en65_lookup sv, _session250_en65_lookup tv
 WHERE t.slug='1-enoch-65-earth-corrupt-sinking'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-65-noah-cries-enoch-warns
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Peter 2:3 — *And through covetousness shall they with feigned words make merchandise of you: whose judgment now of a long time lingereth not, and their damnation slumbereth not.* Enoch''s unceasing warning of the coming judgement (Enoch 65:6) is the same sentence Peter says lingers not and does not slumber.'
  FROM cross_reference_threads t, cross_references x, _session250_en65_lookup sv, _session250_en65_lookup tv
 WHERE t.slug='1-enoch-65-noah-cries-enoch-warns'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 7:22 — *All in whose nostrils was the breath of life, of all that was in the dry land, died.* The destruction Noah cries to Enoch about in 65:2 is the Flood that took all flesh that breathed.'
  FROM cross_reference_threads t, cross_references x, _session250_en65_lookup sv, _session250_en65_lookup tv
 WHERE t.slug='1-enoch-65-noah-cries-enoch-warns'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-65-watchers-taught-sin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 8:1 — *And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them, and bracelets, and ornaments, and the use of antimony, and the beautifying of the eyelids, and all kinds of costly stones, and all colouring tinctures.* Enoch''s word to Noah in 65:9 recalls his own earlier account of the forbidden arts the descended angels taught mankind.'
  FROM cross_reference_threads t, cross_references x, _session250_en65_lookup sv, _session250_en65_lookup tv
 WHERE t.slug='1-enoch-65-watchers-taught-sin'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=8 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:12 — *And Elohim (God) looked upon the earth, and, behold, it was corrupt; for all flesh had corrupted his way upon the earth.* The angels who ''corrupted the earth'' in Enoch 65:9 are why Moses says all flesh had corrupted its way.'
  FROM cross_reference_threads t, cross_references x, _session250_en65_lookup sv, _session250_en65_lookup tv
 WHERE t.slug='1-enoch-65-watchers-taught-sin'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The descended angels of Enoch 65:9 are the angels Jude says left their habitation and are reserved in chains for judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en65_lookup sv, _session250_en65_lookup tv
 WHERE t.slug='1-enoch-65-watchers-taught-sin'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* The Most High''s punishment upon the fallen angels in Enoch 65:11 is Peter''s angels that sinned, cast down and reserved unto judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en65_lookup sv, _session250_en65_lookup tv
 WHERE t.slug='1-enoch-65-watchers-taught-sin'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* The spirits of the giants in Enoch 65:10 are the offspring of the angels Jubilees says took wives and bore giants.'
  FROM cross_reference_threads t, cross_references x, _session250_en65_lookup sv, _session250_en65_lookup tv
 WHERE t.slug='1-enoch-65-watchers-taught-sin'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=10
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-65-earth-cleansed-righteous
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:20 — *And cleanse thou the earth from all oppression, and from all unrighteousness, and from all sin: and all the uncleanness that is wrought upon the earth destroy from off the earth.* Enoch''s word to Noah in 65:12 repeats the cleansing he was earlier commanded to announce over the post-Flood earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en65_lookup sv, _session250_en65_lookup tv
 WHERE t.slug='1-enoch-65-earth-cleansed-righteous'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=12
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:21 — *And all the children of men shall become righteous, and all nations shall offer adoration and shall praise Me, and all shall worship Me.* Enoch 65:13''s children of men made righteous to worship Yahuah of Spirits is the same restored worship he foretold in chapter 10.'
  FROM cross_reference_threads t, cross_references x, _session250_en65_lookup sv, _session250_en65_lookup tv
 WHERE t.slug='1-enoch-65-earth-cleansed-righteous'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=13
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:11 — *And He destroyed all from their places, and there was not left one of them whom He judged not according to all their wickedness. And He made for all His works a new and righteous nature, so that they should not sin in their whole nature for ever, but should be all righteous each in his kind alway.* The earth cleansed and made righteous in Enoch 65:12 is Jubilees'' new and righteous nature after the Flood.'
  FROM cross_reference_threads t, cross_references x, _session250_en65_lookup sv, _session250_en65_lookup tv
 WHERE t.slug='1-enoch-65-earth-cleansed-righteous'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=12
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man’s sake; for the imagination of man’s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The cleansed earth of Enoch 65:12 is the ground Yahuah vows not again to curse once the Flood has passed.'
  FROM cross_reference_threads t, cross_references x, _session250_en65_lookup sv, _session250_en65_lookup tv
 WHERE t.slug='1-enoch-65-earth-cleansed-righteous'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-65-noah-righteous-elect-preserved
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* The righteous preserved and not destroyed in Enoch 65:14 is Noah, who first found grace before the Flood.'
  FROM cross_reference_threads t, cross_references x, _session250_en65_lookup sv, _session250_en65_lookup tv
 WHERE t.slug='1-enoch-65-noah-righteous-elect-preserved'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:9 — *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God).* Enoch 65:14''s preserved righteous one is Noah the just and perfect, who walked with Elohim.'
  FROM cross_reference_threads t, cross_references x, _session250_en65_lookup sv, _session250_en65_lookup tv
 WHERE t.slug='1-enoch-65-noah-righteous-elect-preserved'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:19 — *And as for all those who corrupted their ways and their thoughts before the flood, no man’s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account; for his heart was righteous in all his ways, according as it was commanded regarding him, and he had not departed from aught that was ordained for him.* Enoch 65:14''s elect preserved through the judgement is Noah alone accepted, saved with his sons because his heart was righteous.'
  FROM cross_reference_threads t, cross_references x, _session250_en65_lookup sv, _session250_en65_lookup tv
 WHERE t.slug='1-enoch-65-noah-righteous-elect-preserved'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=65 AND sv.verse_number=14
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

