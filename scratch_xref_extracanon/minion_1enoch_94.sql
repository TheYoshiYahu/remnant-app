-- ----- fragment: minion_1enoch_94.sql (session250 1-enoch 94) -----
-- Source anchor: enoch/1-enoch ch94. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en94 (view _session250_en94_lookup). Sort band base 52325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en94_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-94-two-ways-choose-life
  ('enoch', '1-enoch', 94, 1, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Moses sets the very same two ways before Israel that Enoch sets before his sons in 94:1.'),
  ('enoch', '1-enoch', 94, 23, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* Enoch''s closing charge to choose the path of righteousness ''that ye may live... and that your seed may be multiplied'' echoes Moses'' ''choose life... that thou and thy seed may live'' word for word in theme (94:23).'),
  ('enoch', '1-enoch', 94, 2, 'canon', 'jeremiah', 21, 8, 'free', E'Jeremiah 21:8 — *And unto this people thou shalt say, Thus saith Yahuah (LORD); Behold, I set before you the way of life, and the way of death.* The prophet names the same fork — the way of life against the path of death revealed to a generation in 94:2.'),
  ('enoch', '1-enoch', 94, 1, 'canon', 'psalms', 1, 6, 'free', E'Psalm 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* The Psalter''s two-way opening matches Enoch''s promise that the paths of righteousness endure while the paths of unrighteousness ''shall suddenly be destroyed and vanish'' (94:1).'),
  ('enoch', '1-enoch', 94, 1, 'canon', 'proverbs', 4, 18, 'free', E'Proverbs 4:18 — *But the path of the just is as the shining light, that shineth more and more unto the perfect day.* Solomon''s shining path of the just is Enoch''s ''paths of righteousness worthy of acceptance'' (94:1).'),
  ('enoch', '1-enoch', 94, 2, 'canon', 'matthew', 7, 13, 'free', E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* Yahusha''s broad road to destruction is Enoch''s ''paths of violence and death'' that many hold to instead of righteousness (94:2).'),
  ('enoch', '1-enoch', 94, 23, 'canon', 'matthew', 7, 14, 'free', E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The narrow way that leads to life is the path Enoch charges his sons to choose, ''that ye may live'' (94:23).'),
  -- thread: 1-enoch-94-woe-to-the-rich-trust
  ('enoch', '1-enoch', 94, 3, 'canon', 'psalms', 49, 6, 'free', E'Psalm 49:6 — *They that trust in their wealth, and boast themselves in the multitude of their riches;* the very posture Enoch condemns — trusting in riches instead of remembering the God of Spirits (94:3).'),
  ('enoch', '1-enoch', 94, 5, 'canon', 'psalms', 49, 7, 'free', E'Psalm 49:7 — *None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him:* riches cannot ransom a man in the day of affliction, exactly as Enoch says they ''shall not deliver you'' (94:5).'),
  ('enoch', '1-enoch', 94, 3, 'canon', 'psalms', 49, 17, 'free', E'Psalm 49:17 — *For when he dieth he shall carry nothing away: his glory shall not descend after him.* The rich man departs from his riches at death, just as Enoch warns ''from your riches shall you depart'' (94:3).'),
  ('enoch', '1-enoch', 94, 4, 'canon', 'luke', 12, 20, 'free', E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* Yahusha''s rich fool who boasts ''we have become great and glorious'' meets the same reckoning Enoch announces (94:4).'),
  ('enoch', '1-enoch', 94, 3, 'canon', 'james', 5, 1, 'free', E'James 5:1 — *Go to now, ye rich men, weep and howl for your miseries that shall come upon you.* James pronounces Enoch''s identical woe on the rich whose wealth will fail them (94:3).'),
  ('enoch', '1-enoch', 94, 5, 'apocrypha', 'the-wisdom-of-solomon', 5, 8, 'extras', E'Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* The rich confess at the judgement that their wealth could not save them, the very helplessness Enoch foretells in the day of affliction (94:5).'),
  -- thread: 1-enoch-94-riches-shall-not-endure-grass
  ('enoch', '1-enoch', 94, 8, 'apocrypha', 'ecclesiasticus', 11, 19, 'extras', E'Ecclesiasticus 11:19 — *Whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die.* Sirach mocks the hoarder''s ''let us do what we purposed'' plan with the very ignorance of his end that Enoch exposes (94:8).'),
  ('enoch', '1-enoch', 94, 12, 'canon', 'psalms', 37, 2, 'free', E'Psalm 37:2 — *For they shall soon be cut down like the grass, and wither as the green herb.* The Psalter''s withering-grass image of the wicked is exactly Enoch''s ''destroyed like grass... like the young grass that withers'' (94:12).'),
  ('enoch', '1-enoch', 94, 16, 'canon', 'psalms', 37, 20, 'free', E'Psalm 37:20 — *But the wicked shall perish, and the enemies of Yahuah (LORD) shall be as the fat of lambs: they shall consume; into smoke shall they consume away.* The sinner''s riches and glory do not last but consume away, the fate Enoch pronounces (94:16).'),
  ('enoch', '1-enoch', 94, 12, 'canon', 'james', 5, 3, 'free', E'James 5:3 — *Your gold and silver is cankered; and the rust of them shall be a witness against you, and shall eat your flesh as it were fire. Ye have heaped treasure together for the last days.* James''s hoarded gold turned to fire-witness matches Enoch''s sinners cast into the fiery furnace (94:12).'),
  -- thread: 1-enoch-94-woe-luxury-tread-on-poor
  ('enoch', '1-enoch', 94, 6, 'canon', 'isaiah', 5, 8, 'free', E'Isaiah 5:8 — *Woe unto them that join house to house, that lay field to field, till there be no place, that they may be placed alone in the midst of the earth!* Isaiah''s woe on those who seize land and tread out the poor is Enoch''s woe on those who ''tread upon the righteous with your might'' (94:6).'),
  ('enoch', '1-enoch', 94, 18, 'canon', 'isaiah', 5, 22, 'free', E'Isaiah 5:22 — *Woe unto them that are mighty to drink wine, and men of strength to mingle strong drink:* the mighty wine-drinkers Isaiah condemns are Enoch''s who ''drink the finest wine, And tread upon the poor with your might'' (94:18).'),
  ('enoch', '1-enoch', 94, 6, 'canon', 'amos', 6, 6, 'free', E'Amos 6:6 — *That drink wine in bowls, and anoint themselves with the chief ointments: but they are not grieved for the affliction of Joseph.* Amos''s ''wine in bowls'' indifferent to the afflicted is verbatim the picture Enoch draws — ''drink wine in large bowls, And tread upon the righteous'' (94:6).'),
  ('enoch', '1-enoch', 94, 19, 'canon', 'luke', 6, 25, 'free', E'Luke 6:25 — *Woe unto you that are full! for ye shall hunger. Woe unto you that laugh now! for ye shall mourn and weep.* Yahusha''s woe on the full who shall hunger is word-for-word Enoch''s ''Woe to you who are full of fatness! For you shall be hungry'' (94:19).'),
  ('enoch', '1-enoch', 94, 18, 'canon', 'james', 5, 5, 'free', E'James 5:5 — *Ye have lived in pleasure on the earth, and been wanton; ye have nourished your hearts, as in a day of slaughter.* James condemns the same self-indulgent feasting on the backs of others that Enoch pronounces woe upon (94:18).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en94_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en94_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-94-two-ways-choose-life',
       E'The two ways — choose the paths of righteousness, that ye may live',
       E'Enoch frames the whole Epistle as a choice between two roads: *And now I say unto you, my sons, love righteousness and walk therein; For the paths of righteousness are worthy of acceptance, But the paths of unrighteousness shall suddenly be destroyed and vanish* (1 Enoch 94:1), closing with the charge *And now, my sons, choose for yourselves The paths of righteousness, And walk therein, That ye may live and prosper, And that your seed may be multiplied upon the earth* (1 Enoch 94:23). It ain''t new — this is Moses'' covenant summons at the edge of the land: *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15), *therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). The same two roads stand in Jeremiah''s mouth: *Thus saith Yahuah (LORD); Behold, I set before you the way of life, and the way of death* (Jeremiah 21:8). Torah is the way of life, never the curse: the Psalter opens on it — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6) — and Proverbs paints the two paths in light and dark: *But the path of the just is as the shining light, that shineth more and more unto the perfect day* (Proverbs 4:18) against *The way of the wicked is as darkness: they know not at what they stumble* (Proverbs 4:19). Yahusha set the same fork before the crowds: *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat* (Matthew 7:13), *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it* (Matthew 7:14). One ancient summons, from Sinai to Enoch to the Sermon on the Mount: walk the way that leads to life.',
       sv.verse_id, ev.verse_id, 'extras', 52325
  FROM _session250_en94_lookup sv, _session250_en94_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=94 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-94-woe-to-the-rich-trust',
       E'Woe to you who trust in your riches — they will not deliver in the day of affliction',
       E'The first woe falls not on persons but on the system of misplaced trust: *Woe to you who are rich! For you have trusted in your riches, And from your riches shall you depart, Because you have not remembered Yahuah (God) of Spirits in the days of your riches* (1 Enoch 94:3), for *in the day of your affliction you shall not be able to save yourselves; And your riches shall not deliver you* (1 Enoch 94:5). The Tanakh already weighed this exact futility: *They that trust in their wealth, and boast themselves in the multitude of their riches* (Psalm 49:6) yet *None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him* (Psalm 49:7), for *when he dieth he shall carry nothing away: his glory shall not descend after him* (Psalm 49:17). Yahusha told the parable of just such a man, whose granaries Enoch will picture in the next breath: *Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry* (Luke 12:19) — to whom *Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* (Luke 12:20). James thunders the same woe over the same departing wealth: *Go to now, ye rich men, weep and howl for your miseries that shall come upon you* (James 5:1). And the Wisdom of Solomon puts the lament in the mouths of the rich themselves at the judgement: *What has pride profited us? or what good has riches with our vaunting brought us?* (Wisdom of Solomon 5:8). The wealth does not save — only the God of Spirits, unremembered in the days of plenty, judges in the day of affliction.',
       sv.verse_id, ev.verse_id, 'extras', 52328
  FROM _session250_en94_lookup sv, _session250_en94_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=94 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-94-riches-shall-not-endure-grass',
       E'Your riches shall not endure — you shall wither like grass',
       E'Enoch answers the rich man''s boast with its end: he says *We have become rich with riches and have possessions; And we have acquired everything that we have desired* (1 Enoch 94:7) and lays plans, *let us do what we purposed* (1 Enoch 94:8), but the verdict comes — *But you shall be destroyed like grass, And like the young grass that withers, And you shall be cast into the fiery furnace* (1 Enoch 94:12), and again, *Woe to you, O sinners! For your riches shall not endure, And your glory shall not last* (1 Enoch 94:16). The boast and its swift undoing are an old refrain. Ecclesiasticus already mocked the hoarder''s plan: *Whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die* (Ecclesiasticus 11:19). The withering-grass figure is the Psalter''s standing image of the wicked''s end: *For they shall soon be cut down like the grass, and wither as the green herb* (Psalm 37:2), and *the wicked shall perish... into smoke shall they consume away* (Psalm 37:20). James names the rust on the hoarded wealth as a witness of fire: *Your gold and silver is cankered; and the rust of them shall be a witness against you, and shall eat your flesh as it were fire. Ye have heaped treasure together for the last days* (James 5:3). The riches gathered in unrighteousness do not endure; the glory the sinner claims withers like cut grass and is cast into the furnace.',
       sv.verse_id, ev.verse_id, 'extras', 52331
  FROM _session250_en94_lookup sv, _session250_en94_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=94 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-94-woe-luxury-tread-on-poor',
       E'Woe to you who feast in luxury and tread upon the poor',
       E'The woes turn to those who feast on the backs of the oppressed: *Woe to you who eat all the best food, And drink wine in large bowls, And tread upon the righteous with your might* (1 Enoch 94:6), and again *Woe to you who eat the marrow of wheat, And drink the finest wine, And tread upon the poor with your might* (1 Enoch 94:18). This dismantles a system of luxury built on injustice — and Isaiah pronounced the identical woe: *Woe unto them that join house to house, that lay field to field, till there be no place, that they may be placed alone in the midst of the earth!* (Isaiah 5:8), *Woe unto them that are mighty to drink wine, and men of strength to mingle strong drink* (Isaiah 5:22). Amos draws the very picture of bowls of wine and feasting indifferent to the afflicted: *That lie upon beds of ivory, and stretch themselves upon their couches, and eat the lambs out of the flock* (Amos 6:4), *That drink wine in bowls, and anoint themselves with the chief ointments: but they are not grieved for the affliction of Joseph* (Amos 6:6). Yahusha sets the same woe over against the Beatitudes: *But woe unto you that are rich! for ye have received your consolation* (Luke 6:24), *Woe unto you that are full! for ye shall hunger* (Luke 6:25) — which is Enoch''s own sentence, *Woe to you who are full of fatness! For you shall be hungry, And you shall thirst* (1 Enoch 94:19). And James seals it: *Ye have lived in pleasure on the earth, and been wanton; ye have nourished your hearts, as in a day of slaughter* (James 5:5). The judgement targets the oppression, not the persons; the poor and the righteous trodden under foot are the victims the God of Spirits will vindicate.',
       sv.verse_id, ev.verse_id, 'extras', 52334
  FROM _session250_en94_lookup sv, _session250_en94_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=94 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-94-two-ways-choose-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Moses sets the very same two ways before Israel that Enoch sets before his sons in 94:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-two-ways-choose-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* Enoch''s closing charge to choose the path of righteousness ''that ye may live... and that your seed may be multiplied'' echoes Moses'' ''choose life... that thou and thy seed may live'' word for word in theme (94:23).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-two-ways-choose-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 21:8 — *And unto this people thou shalt say, Thus saith Yahuah (LORD); Behold, I set before you the way of life, and the way of death.* The prophet names the same fork — the way of life against the path of death revealed to a generation in 94:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-two-ways-choose-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=21 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* The Psalter''s two-way opening matches Enoch''s promise that the paths of righteousness endure while the paths of unrighteousness ''shall suddenly be destroyed and vanish'' (94:1).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-two-ways-choose-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 4:18 — *But the path of the just is as the shining light, that shineth more and more unto the perfect day.* Solomon''s shining path of the just is Enoch''s ''paths of righteousness worthy of acceptance'' (94:1).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-two-ways-choose-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* Yahusha''s broad road to destruction is Enoch''s ''paths of violence and death'' that many hold to instead of righteousness (94:2).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-two-ways-choose-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The narrow way that leads to life is the path Enoch charges his sons to choose, ''that ye may live'' (94:23).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-two-ways-choose-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-94-woe-to-the-rich-trust
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 49:6 — *They that trust in their wealth, and boast themselves in the multitude of their riches;* the very posture Enoch condemns — trusting in riches instead of remembering the God of Spirits (94:3).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-woe-to-the-rich-trust'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 49:7 — *None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him:* riches cannot ransom a man in the day of affliction, exactly as Enoch says they ''shall not deliver you'' (94:5).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-woe-to-the-rich-trust'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 49:17 — *For when he dieth he shall carry nothing away: his glory shall not descend after him.* The rich man departs from his riches at death, just as Enoch warns ''from your riches shall you depart'' (94:3).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-woe-to-the-rich-trust'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* Yahusha''s rich fool who boasts ''we have become great and glorious'' meets the same reckoning Enoch announces (94:4).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-woe-to-the-rich-trust'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'James 5:1 — *Go to now, ye rich men, weep and howl for your miseries that shall come upon you.* James pronounces Enoch''s identical woe on the rich whose wealth will fail them (94:3).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-woe-to-the-rich-trust'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* The rich confess at the judgement that their wealth could not save them, the very helplessness Enoch foretells in the day of affliction (94:5).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-woe-to-the-rich-trust'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-94-riches-shall-not-endure-grass
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiasticus 11:19 — *Whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die.* Sirach mocks the hoarder''s ''let us do what we purposed'' plan with the very ignorance of his end that Enoch exposes (94:8).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-riches-shall-not-endure-grass'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=11 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 37:2 — *For they shall soon be cut down like the grass, and wither as the green herb.* The Psalter''s withering-grass image of the wicked is exactly Enoch''s ''destroyed like grass... like the young grass that withers'' (94:12).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-riches-shall-not-endure-grass'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 37:20 — *But the wicked shall perish, and the enemies of Yahuah (LORD) shall be as the fat of lambs: they shall consume; into smoke shall they consume away.* The sinner''s riches and glory do not last but consume away, the fate Enoch pronounces (94:16).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-riches-shall-not-endure-grass'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 5:3 — *Your gold and silver is cankered; and the rust of them shall be a witness against you, and shall eat your flesh as it were fire. Ye have heaped treasure together for the last days.* James''s hoarded gold turned to fire-witness matches Enoch''s sinners cast into the fiery furnace (94:12).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-riches-shall-not-endure-grass'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-94-woe-luxury-tread-on-poor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 5:8 — *Woe unto them that join house to house, that lay field to field, till there be no place, that they may be placed alone in the midst of the earth!* Isaiah''s woe on those who seize land and tread out the poor is Enoch''s woe on those who ''tread upon the righteous with your might'' (94:6).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-woe-luxury-tread-on-poor'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 5:22 — *Woe unto them that are mighty to drink wine, and men of strength to mingle strong drink:* the mighty wine-drinkers Isaiah condemns are Enoch''s who ''drink the finest wine, And tread upon the poor with your might'' (94:18).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-woe-luxury-tread-on-poor'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Amos 6:6 — *That drink wine in bowls, and anoint themselves with the chief ointments: but they are not grieved for the affliction of Joseph.* Amos''s ''wine in bowls'' indifferent to the afflicted is verbatim the picture Enoch draws — ''drink wine in large bowls, And tread upon the righteous'' (94:6).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-woe-luxury-tread-on-poor'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 6:25 — *Woe unto you that are full! for ye shall hunger. Woe unto you that laugh now! for ye shall mourn and weep.* Yahusha''s woe on the full who shall hunger is word-for-word Enoch''s ''Woe to you who are full of fatness! For you shall be hungry'' (94:19).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-woe-luxury-tread-on-poor'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'James 5:5 — *Ye have lived in pleasure on the earth, and been wanton; ye have nourished your hearts, as in a day of slaughter.* James condemns the same self-indulgent feasting on the backs of others that Enoch pronounces woe upon (94:18).'
  FROM cross_reference_threads t, cross_references x, _session250_en94_lookup sv, _session250_en94_lookup tv
 WHERE t.slug='1-enoch-94-woe-luxury-tread-on-poor'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=94 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

