-- ----- fragment: minion_1enoch_97.sql (session250 1-enoch 97) -----
-- Source anchor: enoch/1-enoch ch97. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en97 (view _session250_en97_lookup). Sort band base 52400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en97_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-97-riches-witness-against-them
  ('enoch', '1-enoch', 97, 7, 'canon', 'james', 5, 3, 'free', E'James 5:3 — *Your gold and silver is cankered; and the rust of them shall be a witness against you, and shall eat your flesh as it were fire. Ye have heaped treasure together for the last days.* The hoarded silver and gold of Enoch 97:7-8 becomes the very witness that eats the flesh of those who gathered it in unrighteousness.'),
  ('enoch', '1-enoch', 97, 8, 'canon', 'habakkuk', 2, 6, 'free', E'Habakkuk 2:6 — *Shall not all these take up a parable against him, and a taunting proverb against him, and say, Woe to him that increaseth that which is not his! how long? and to him that ladeth himself with thick clay!* Habakkuk''s taunting woe against the man who increases what is not his is the same charge Enoch 97:8 lays on those who say ''let us do what we purposed.'''),
  ('enoch', '1-enoch', 97, 14, 'canon', 'luke', 12, 20, 'free', E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* The rich man''s boast of acquired riches and glory in Enoch 97:14 is answered exactly as Yahusha answers the fool whose soul is required the same night.'),
  ('enoch', '1-enoch', 97, 15, 'canon', 'proverbs', 11, 4, 'free', E'Proverbs 11:4 — *Riches profit not in the day of wrath: but righteousness delivereth from death.* The unrighteous wealth and proud heart exposed in Enoch 97:15 cannot profit in the day of wrath; only righteousness, the way Enoch will set out, delivers from death.'),
  -- thread: 1-enoch-97-wine-bowls-tread-the-poor
  ('enoch', '1-enoch', 97, 6, 'canon', 'amos', 6, 6, 'free', E'Amos 6:6 — *That drink wine in bowls, and anoint themselves with the chief ointments: but they are not grieved for the affliction of Joseph.* Amos names the same wine-in-bowls feasting that Enoch 97:6 condemns, indifferent to the poor it treads down.'),
  ('enoch', '1-enoch', 97, 6, 'canon', 'isaiah', 5, 22, 'free', E'Isaiah 5:22 — *Woe unto them that are mighty to drink wine, and men of strength to mingle strong drink:* Isaiah''s woe on those mighty to drink wine is the same indictment Enoch 97:6 brings against the wine-drinkers who tread upon the poor with their might.'),
  ('enoch', '1-enoch', 97, 6, 'canon', 'james', 5, 4, 'free', E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* The poor trodden in Enoch 97:6 are James''s defrauded reapers, whose cry has already entered the ears of Yahuah.'),
  -- thread: 1-enoch-97-grass-that-withers-fiery-furnace
  ('enoch', '1-enoch', 97, 12, 'apocrypha', 'the-wisdom-of-solomon', 5, 8, 'extras', E'Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* The ungodly''s own lament in Wisdom echoes the proud rich of Enoch 97:11-12, whose vaunting riches profit nothing when they wither like grass.'),
  ('enoch', '1-enoch', 97, 12, 'apocrypha', 'the-wisdom-of-solomon', 5, 14, 'extras', E'Wisdom of Solomon 5:14 — *For the hope of the ungodly is like dust that is blown away with the wind; like a thin froth that is driven away with the storm; like as the smoke which is dispersed here and there with a tempest, and passeth away as the remembrance of a guest that tarrieth but a day.* Wisdom''s image of the ungodly''s hope as wind-blown dust is Enoch 97:12''s young grass that withers and is cast into the fire.'),
  ('enoch', '1-enoch', 97, 11, 'enoch', '1-enoch', 94, 4, 'extras', E'1 Enoch 94:4 — *Woe to you who are rich in unrighteousness! For your riches shall not last, And your glory shall not endure; And in your hearts you have said: ''We have acquired riches and power, And we have become great and glorious.''* Enoch''s own earlier woe is the matching scene to 97:11, the exalted rich whose glory will not endure.'),
  -- thread: 1-enoch-97-two-ways-choose-righteousness
  ('enoch', '1-enoch', 97, 18, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* Enoch 97:18''s call to choose the paths of righteousness ''that ye may live... and that your seed may be multiplied'' is Moses'' own ''choose life, that both thou and thy seed may live.'''),
  ('enoch', '1-enoch', 97, 17, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* The two paths Enoch shows his sons in 97:17 are the life-and-good versus death-and-evil that Moses set before Israel.'),
  ('enoch', '1-enoch', 97, 18, 'canon', 'psalms', 1, 3, 'free', E'Psalms 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* The one who walks the path of righteousness and prospers in Enoch 97:18 is the Psalmist''s planted tree whose leaf does not wither — over against the rich who wither like grass (97:12).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en97_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en97_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-97-riches-witness-against-them',
       E'We have become rich — the riches that testify against the rich',
       E'Enoch turns the boast of the unrighteous rich into the very evidence that condemns them: *Woe to you who acquire gold and silver in unrighteousness And say: ''We have become rich with riches and have possessions; And we have acquired everything that we have desired.* (1 Enoch 97:7), and again *And you shall say: ''We have acquired riches and possessions, And we have become great and glorious.''* (1 Enoch 97:14) — to which the answer comes, *But they shall say: ''You have acquired them in unrighteousness, And your heart is full of pride.''* (1 Enoch 97:15). James hears the same indictment and lets the hoard itself cry out: *Your gold and silver is cankered; and the rust of them shall be a witness against you, and shall eat your flesh as it were fire. Ye have heaped treasure together for the last days.* (James 5:3). The prophet had already raised the taunt: *Shall not all these take up a parable against him, and a taunting proverb against him, and say, Woe to him that increaseth that which is not his! how long? and to him that ladeth himself with thick clay!* (Habakkuk 2:6). Yahusha frames it as folly that the day of judgement exposes: *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* (Luke 12:20). And the proverb seals the verdict Enoch is pronouncing: *Riches profit not in the day of wrath: but righteousness delivereth from death.* (Proverbs 11:4). The judgement falls on the system of unrighteous gain, not on possession as such — the wealth witnesses against the heart that gathered it apart from the way of righteousness.',
       sv.verse_id, ev.verse_id, 'extras', 52400
  FROM _session250_en97_lookup sv, _session250_en97_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=97 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=97 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-97-wine-bowls-tread-the-poor',
       E'Wine in large bowls, treading on the poor',
       E'Enoch''s woe lands on the luxury of the oppressor who feasts on the backs of the afflicted: *Woe to you who are full of fatness! For you shall be hungry, And you shall thirst.* (1 Enoch 97:5), *Woe to you who drink wine in large bowls, And tread upon the poor with your might.* (1 Enoch 97:6). Amos had named the very picture — the couch, the feast, the bowl of wine, all while the poor go uncared-for: *That lie upon beds of ivory, and stretch themselves upon their couches, and eat the lambs out of the flock, and the calves out of the midst of the stall;* (Amos 6:4) and *That drink wine in bowls, and anoint themselves with the chief ointments: but they are not grieved for the affliction of Joseph.* (Amos 6:6). Isaiah binds the drunken strong-man to the cry of the oppressed: *Woe unto them that are mighty to drink wine, and men of strength to mingle strong drink:* (Isaiah 5:22), having already wept that the vineyard yielded *oppression... a cry* instead of judgement (Isaiah 5:7). James gives the labourer his voice: *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* (James 5:4). The woe falls to dismantle the system that treads the poor — Enoch''s husbandmen and labourers (97:8-10) are the very reapers whose cry rises.',
       sv.verse_id, ev.verse_id, 'extras', 52403
  FROM _session250_en97_lookup sv, _session250_en97_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=97 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=97 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-97-grass-that-withers-fiery-furnace',
       E'Called gods, destroyed like grass — the hope of the ungodly',
       E'The exaltation of the rich is exposed as the briefest of vanities: *And they shall exalt you like a king, And they shall call you gods.* (1 Enoch 97:11) — *But you shall be destroyed like grass, And like the young grass that withers, And you shall be cast into the fiery furnace.* (1 Enoch 97:12). Wisdom of Solomon puts the same lament in the mouths of the perished ungodly: *What has pride profited us? or what good has riches with our vaunting brought us?* (Wisdom of Solomon 5:8), and likens their hope to vanishing dust: *For the hope of the ungodly is like dust that is blown away with the wind; like a thin froth that is driven away with the storm; like as the smoke which is dispersed here and there with a tempest, and passeth away as the remembrance of a guest that tarrieth but a day.* (Wisdom of Solomon 5:14). Enoch himself has already sounded the warning in the preceding woe: *Woe to you who are rich in unrighteousness! For your riches shall not last, And your glory shall not endure; And in your hearts you have said: ''We have acquired riches and power, And we have become great and glorious.''* (1 Enoch 94:4). The riches do not last; the proud who are called gods wither like grass and are cast into the fire — the judgement is on the system that idolized them, not a denial that the righteous dead will rise.',
       sv.verse_id, ev.verse_id, 'extras', 52406
  FROM _session250_en97_lookup sv, _session250_en97_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=97 AND sv.verse_number=11
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=97 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-97-two-ways-choose-righteousness',
       E'Choose the paths of righteousness, that ye may live',
       E'After the woes, Enoch sets the two ways before his sons and calls them to choose life: *And now, my sons, listen to me, And I will show you the paths of righteousness, And the paths of unrighteousness, And I will show you how the paths of unrighteousness Shall be cut off.* (1 Enoch 97:17), *And now, my sons, choose for yourselves The paths of righteousness, And walk therein, That ye may live and prosper, And that your seed may be multiplied upon the earth.* (1 Enoch 97:18). This is Moses'' covenant charge, word for word in substance: *See, I have set before thee this day life and good, and death and evil;* (Deuteronomy 30:15) and *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* (Deuteronomy 30:19) — the very promise that the one who walks in the way will *live and multiply* and his seed prosper. The Psalm draws the same two roads, the way that prospers against the chaff that the wind drives away: *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* (Psalm 1:1), *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* (Psalm 1:3). The way of righteousness is the way of life and Torah; the path of unrighteousness, the woes just pronounced, is cut off. Choose life.',
       sv.verse_id, ev.verse_id, 'extras', 52409
  FROM _session250_en97_lookup sv, _session250_en97_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=97 AND sv.verse_number=17
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=97 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-97-riches-witness-against-them
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 5:3 — *Your gold and silver is cankered; and the rust of them shall be a witness against you, and shall eat your flesh as it were fire. Ye have heaped treasure together for the last days.* The hoarded silver and gold of Enoch 97:7-8 becomes the very witness that eats the flesh of those who gathered it in unrighteousness.'
  FROM cross_reference_threads t, cross_references x, _session250_en97_lookup sv, _session250_en97_lookup tv
 WHERE t.slug='1-enoch-97-riches-witness-against-them'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=97 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Habakkuk 2:6 — *Shall not all these take up a parable against him, and a taunting proverb against him, and say, Woe to him that increaseth that which is not his! how long? and to him that ladeth himself with thick clay!* Habakkuk''s taunting woe against the man who increases what is not his is the same charge Enoch 97:8 lays on those who say ''let us do what we purposed.'''
  FROM cross_reference_threads t, cross_references x, _session250_en97_lookup sv, _session250_en97_lookup tv
 WHERE t.slug='1-enoch-97-riches-witness-against-them'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=97 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* The rich man''s boast of acquired riches and glory in Enoch 97:14 is answered exactly as Yahusha answers the fool whose soul is required the same night.'
  FROM cross_reference_threads t, cross_references x, _session250_en97_lookup sv, _session250_en97_lookup tv
 WHERE t.slug='1-enoch-97-riches-witness-against-them'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=97 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 11:4 — *Riches profit not in the day of wrath: but righteousness delivereth from death.* The unrighteous wealth and proud heart exposed in Enoch 97:15 cannot profit in the day of wrath; only righteousness, the way Enoch will set out, delivers from death.'
  FROM cross_reference_threads t, cross_references x, _session250_en97_lookup sv, _session250_en97_lookup tv
 WHERE t.slug='1-enoch-97-riches-witness-against-them'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=97 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-97-wine-bowls-tread-the-poor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Amos 6:6 — *That drink wine in bowls, and anoint themselves with the chief ointments: but they are not grieved for the affliction of Joseph.* Amos names the same wine-in-bowls feasting that Enoch 97:6 condemns, indifferent to the poor it treads down.'
  FROM cross_reference_threads t, cross_references x, _session250_en97_lookup sv, _session250_en97_lookup tv
 WHERE t.slug='1-enoch-97-wine-bowls-tread-the-poor'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=97 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 5:22 — *Woe unto them that are mighty to drink wine, and men of strength to mingle strong drink:* Isaiah''s woe on those mighty to drink wine is the same indictment Enoch 97:6 brings against the wine-drinkers who tread upon the poor with their might.'
  FROM cross_reference_threads t, cross_references x, _session250_en97_lookup sv, _session250_en97_lookup tv
 WHERE t.slug='1-enoch-97-wine-bowls-tread-the-poor'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=97 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* The poor trodden in Enoch 97:6 are James''s defrauded reapers, whose cry has already entered the ears of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session250_en97_lookup sv, _session250_en97_lookup tv
 WHERE t.slug='1-enoch-97-wine-bowls-tread-the-poor'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=97 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-97-grass-that-withers-fiery-furnace
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* The ungodly''s own lament in Wisdom echoes the proud rich of Enoch 97:11-12, whose vaunting riches profit nothing when they wither like grass.'
  FROM cross_reference_threads t, cross_references x, _session250_en97_lookup sv, _session250_en97_lookup tv
 WHERE t.slug='1-enoch-97-grass-that-withers-fiery-furnace'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=97 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 5:14 — *For the hope of the ungodly is like dust that is blown away with the wind; like a thin froth that is driven away with the storm; like as the smoke which is dispersed here and there with a tempest, and passeth away as the remembrance of a guest that tarrieth but a day.* Wisdom''s image of the ungodly''s hope as wind-blown dust is Enoch 97:12''s young grass that withers and is cast into the fire.'
  FROM cross_reference_threads t, cross_references x, _session250_en97_lookup sv, _session250_en97_lookup tv
 WHERE t.slug='1-enoch-97-grass-that-withers-fiery-furnace'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=97 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 94:4 — *Woe to you who are rich in unrighteousness! For your riches shall not last, And your glory shall not endure; And in your hearts you have said: ''We have acquired riches and power, And we have become great and glorious.''* Enoch''s own earlier woe is the matching scene to 97:11, the exalted rich whose glory will not endure.'
  FROM cross_reference_threads t, cross_references x, _session250_en97_lookup sv, _session250_en97_lookup tv
 WHERE t.slug='1-enoch-97-grass-that-withers-fiery-furnace'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=97 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=94 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-97-two-ways-choose-righteousness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* Enoch 97:18''s call to choose the paths of righteousness ''that ye may live... and that your seed may be multiplied'' is Moses'' own ''choose life, that both thou and thy seed may live.'''
  FROM cross_reference_threads t, cross_references x, _session250_en97_lookup sv, _session250_en97_lookup tv
 WHERE t.slug='1-enoch-97-two-ways-choose-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=97 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* The two paths Enoch shows his sons in 97:17 are the life-and-good versus death-and-evil that Moses set before Israel.'
  FROM cross_reference_threads t, cross_references x, _session250_en97_lookup sv, _session250_en97_lookup tv
 WHERE t.slug='1-enoch-97-two-ways-choose-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=97 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* The one who walks the path of righteousness and prospers in Enoch 97:18 is the Psalmist''s planted tree whose leaf does not wither — over against the rich who wither like grass (97:12).'
  FROM cross_reference_threads t, cross_references x, _session250_en97_lookup sv, _session250_en97_lookup tv
 WHERE t.slug='1-enoch-97-two-ways-choose-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=97 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

