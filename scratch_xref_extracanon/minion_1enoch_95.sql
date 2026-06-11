-- ----- fragment: minion_1enoch_95.sql (session250 1-enoch 95) -----
-- Source anchor: enoch/1-enoch ch95. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en95 (view _session250_en95_lookup). Sort band base 52350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en95_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-95-woe-pervert-the-words
  ('enoch', '1-enoch', 95, 2, 'canon', 'isaiah', 5, 20, 'free', E'Isaiah 5:20 — *Woe unto them that call evil good, and good evil; that put darkness for light, and light for darkness; that put bitter for sweet, and sweet for bitter!* — Isaiah''s woe against inverting the moral order is Enoch''s woe on those who alter the words of uprightness and write unrighteousness in 95:2.'),
  ('enoch', '1-enoch', 95, 1, 'canon', 'isaiah', 5, 21, 'free', E'Isaiah 5:21 — *Woe unto them that are wise in their own eyes, and prudent in their own sight!* — the self-wise who glory in their own lying are the godless of Enoch 95:1 who shall find no good.'),
  ('enoch', '1-enoch', 95, 1, 'canon', 'luke', 6, 24, 'free', E'Luke 6:24 — *But woe unto you that are rich! for ye have received your consolation.* — Yahusha (Jesus) takes up the same prophetic woe-form Enoch uses, pronouncing loss on those whose consolation is already spent.'),
  -- thread: 1-enoch-95-woe-to-the-rich-oppressor
  ('enoch', '1-enoch', 95, 6, 'canon', 'amos', 6, 6, 'free', E'Amos 6:6 — *That drink wine in bowls, and anoint themselves with the chief ointments: but they are not grieved for the affliction of Joseph.* — Amos''s woe on those who drink wine in bowls is verbatim Enoch''s woe on those who drink wine in large bowls and tread upon the poor in 95:6.'),
  ('enoch', '1-enoch', 95, 7, 'canon', 'amos', 6, 7, 'free', E'Amos 6:7 — *Therefore now shall they go captive with the first that go captive, and the banquet of them that stretched themselves shall be removed.* — the banquet removed and the feasters led captive is the cutting-off of the rich oppressor''s might in Enoch 95:4,7.'),
  ('enoch', '1-enoch', 95, 8, 'canon', 'james', 5, 4, 'free', E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* — the many husbandmen and labourers of Enoch 95:8-10 are James''s defrauded reapers whose cry reaches Yahuah.'),
  ('enoch', '1-enoch', 95, 7, 'canon', 'jeremiah', 17, 11, 'free', E'Jeremiah 17:11 — *As the partridge sitteth on eggs, and hatcheth them not; so he that getteth riches, and not by right, shall leave them in the midst of his days, and at his end shall be a fool.* — riches acquired in unrighteousness (Enoch 95:7) end in folly and loss.'),
  -- thread: 1-enoch-95-vanishing-riches-fiery-furnace
  ('enoch', '1-enoch', 95, 13, 'canon', 'luke', 12, 19, 'free', E'Luke 12:19 — *And I will say to my soul, Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry.* — the rich fool''s boast is the gathered-silver self-talk of Enoch 95:7-8 that the reckoning of 95:13 silences.'),
  ('enoch', '1-enoch', 95, 13, 'canon', 'luke', 12, 20, 'free', E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* — ''where are your riches now?'' (Enoch 95:13) is the night the soul is required and the hoard left behind.'),
  ('enoch', '1-enoch', 95, 15, 'apocrypha', 'the-wisdom-of-solomon', 5, 8, 'extras', E'Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* — the parallel extra-canon witness puts Enoch''s pride-filled heart (95:15) in the perished proud man''s own too-late confession.'),
  ('enoch', '1-enoch', 95, 12, 'apocrypha', 'the-wisdom-of-solomon', 5, 9, 'extras', E'Wisdom of Solomon 5:9 — *All those things are passed away like a shadow, and as a post that hasted by;* — wealth passing like a shadow matches Enoch''s rich man destroyed like withering grass in 95:12.'),
  -- thread: 1-enoch-95-two-paths-choose-righteousness
  ('enoch', '1-enoch', 95, 18, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* — Moses'' two-ways charge is precisely Enoch''s paths of righteousness and unrighteousness set before the sons in 95:17-18.'),
  ('enoch', '1-enoch', 95, 18, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* — ''choose for yourselves the paths of righteousness... that ye may live and that your seed may be multiplied'' (Enoch 95:18) is Moses'' choose-life so thy seed may live.'),
  ('enoch', '1-enoch', 95, 19, 'canon', 'psalms', 1, 6, 'free', E'Psalm 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* — the Psalter''s two ways match Enoch''s path of unrighteousness that ''shall be cut off'' in 95:17,19.'),
  ('enoch', '1-enoch', 95, 17, 'canon', 'proverbs', 4, 18, 'free', E'Proverbs 4:18 — *But the path of the just is as the shining light, that shineth more and more unto the perfect day.* — the path of righteousness Enoch shows his sons (95:17) is wisdom''s shining path of the just.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en95_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en95_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-95-woe-pervert-the-words',
       E'Woe to those who alter the words of uprightness',
       E'Enoch''s first woes fall not on persons but on the systems of deceit that pervert the eternal law: *Woe to you who work godlessness, And glory in lying and oppression: You are lost, and no good shall you find.* (1 Enoch 95:1), and *Woe to you who alter the words of uprightness, And who write the words of unrighteousness and lying: They write their own judgment* (1 Enoch 95:2). This is the catalogue of Isaiah''s woes against those who invert God''s order — *Woe unto them that call evil good, and good evil; that put darkness for light, and light for darkness; that put bitter for sweet, and sweet for bitter!* (Isaiah 5:20) and *Woe unto them that are wise in their own eyes, and prudent in their own sight!* (Isaiah 5:21). Yahusha (Jesus) turns the very same woe against the self-satisfied: *But woe unto you that are rich! for ye have received your consolation.* (Luke 6:24). Torah is the standard they twist — to rewrite the words of uprightness is to write one''s own sentence.',
       sv.verse_id, ev.verse_id, 'extras', 52350
  FROM _session250_en95_lookup sv, _session250_en95_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=95 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=95 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-95-woe-to-the-rich-oppressor',
       E'Woe to those who tread upon the poor and acquire gold in unrighteousness',
       E'The heart of the chapter is the woe on the rich oppressor who feasts while crushing the poor: *Woe to you who are full of fatness! For you shall be hungry, And you shall thirst.* (1 Enoch 95:5), *Woe to you who drink wine in large bowls, And tread upon the poor with your might.* (1 Enoch 95:6), *Woe to you who acquire gold and silver in unrighteousness And say: ''We have become rich with riches and have possessions; And we have acquired everything that we have desired.* (1 Enoch 95:7). Amos pronounced the identical sentence on the luxuriating elite of his day: *Woe to them that are at ease in Zion... That drink wine in bowls, and anoint themselves with the chief ointments: but they are not grieved for the affliction of Joseph. Therefore now shall they go captive with the first that go captive* (Amos 6:1,6,7). James carries it into the last days: *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* (James 5:4) — the same gathered silver and many husbandmen of Enoch 95:8-9, indicted. The systems of fraud are dismantled, not the persons; wealth gotten by injustice cannot stand, *for he that getteth riches, and not by right... at his end shall be a fool.* (Jeremiah 17:11).',
       sv.verse_id, ev.verse_id, 'extras', 52353
  FROM _session250_en95_lookup sv, _session250_en95_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=95 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=95 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-95-vanishing-riches-fiery-furnace',
       E'Where are your riches now? — the rich man''s wealth perishes',
       E'Enoch stages the reckoning where the hoarded glory evaporates: *But you shall be destroyed like grass, And like the young grass that withers, And you shall be cast into the fiery furnace.* (1 Enoch 95:12), *And they shall say to you: ''Where are your riches now, And where are your possessions, And where is your glory, And where is your power?''* (1 Enoch 95:13). Yahusha (Jesus) tells exactly this scene in the parable of the rich fool: *And I will say to my soul, Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry. But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* (Luke 12:19-20) — the very boast of Enoch 95:7-8 (''we have gathered silver... let us do what we purposed'') answered by the night of demand. And the Wisdom of Solomon puts the same confession in the mouths of the perished proud: *What has pride profited us? or what good has riches with our vaunting brought us? All those things are passed away like a shadow* (Wisdom of Solomon 5:8-9) — the heart full of pride (95:15) seeing too late that the grass withers.',
       sv.verse_id, ev.verse_id, 'extras', 52356
  FROM _session250_en95_lookup sv, _session250_en95_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=95 AND sv.verse_number=12
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=95 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-95-two-paths-choose-righteousness',
       E'The two paths — choose the way of righteousness and live',
       E'After the woes, Enoch sets the great choice that governs the whole Epistle (the two ways of chs 91 and 94): *And now, my sons, listen to me, And I will show you the paths of righteousness, And the paths of unrighteousness, And I will show you how the paths of unrighteousness Shall be cut off.* (1 Enoch 95:17), *And now, my sons, choose for yourselves The paths of righteousness, And walk therein, That ye may live and prosper, And that your seed may be multiplied upon the earth.* (1 Enoch 95:18). This is Moses'' covenant charge word for word — life set against death, with the seed''s blessing hanging on the choice: *See, I have set before thee this day life and good, and death and evil;* (Deuteronomy 30:15) and *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* (Deuteronomy 30:19). Torah is the path of life, never the curse. The Psalter opens on the same two ways — *Blessed is the man that walketh not in the counsel of the ungodly... For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* (Psalm 1:1,6) — and Proverbs lights the contrast: *But the path of the just is as the shining light, that shineth more and more unto the perfect day. The way of the wicked is as darkness* (Proverbs 4:18-19). Enoch shows the unrighteous path ''cut off''; the elect walk the way that endures.',
       sv.verse_id, ev.verse_id, 'extras', 52359
  FROM _session250_en95_lookup sv, _session250_en95_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=95 AND sv.verse_number=17
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=95 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-95-woe-pervert-the-words
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 5:20 — *Woe unto them that call evil good, and good evil; that put darkness for light, and light for darkness; that put bitter for sweet, and sweet for bitter!* — Isaiah''s woe against inverting the moral order is Enoch''s woe on those who alter the words of uprightness and write unrighteousness in 95:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en95_lookup sv, _session250_en95_lookup tv
 WHERE t.slug='1-enoch-95-woe-pervert-the-words'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=95 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 5:21 — *Woe unto them that are wise in their own eyes, and prudent in their own sight!* — the self-wise who glory in their own lying are the godless of Enoch 95:1 who shall find no good.'
  FROM cross_reference_threads t, cross_references x, _session250_en95_lookup sv, _session250_en95_lookup tv
 WHERE t.slug='1-enoch-95-woe-pervert-the-words'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=95 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 6:24 — *But woe unto you that are rich! for ye have received your consolation.* — Yahusha (Jesus) takes up the same prophetic woe-form Enoch uses, pronouncing loss on those whose consolation is already spent.'
  FROM cross_reference_threads t, cross_references x, _session250_en95_lookup sv, _session250_en95_lookup tv
 WHERE t.slug='1-enoch-95-woe-pervert-the-words'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=95 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-95-woe-to-the-rich-oppressor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Amos 6:6 — *That drink wine in bowls, and anoint themselves with the chief ointments: but they are not grieved for the affliction of Joseph.* — Amos''s woe on those who drink wine in bowls is verbatim Enoch''s woe on those who drink wine in large bowls and tread upon the poor in 95:6.'
  FROM cross_reference_threads t, cross_references x, _session250_en95_lookup sv, _session250_en95_lookup tv
 WHERE t.slug='1-enoch-95-woe-to-the-rich-oppressor'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=95 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Amos 6:7 — *Therefore now shall they go captive with the first that go captive, and the banquet of them that stretched themselves shall be removed.* — the banquet removed and the feasters led captive is the cutting-off of the rich oppressor''s might in Enoch 95:4,7.'
  FROM cross_reference_threads t, cross_references x, _session250_en95_lookup sv, _session250_en95_lookup tv
 WHERE t.slug='1-enoch-95-woe-to-the-rich-oppressor'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=95 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* — the many husbandmen and labourers of Enoch 95:8-10 are James''s defrauded reapers whose cry reaches Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session250_en95_lookup sv, _session250_en95_lookup tv
 WHERE t.slug='1-enoch-95-woe-to-the-rich-oppressor'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=95 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 17:11 — *As the partridge sitteth on eggs, and hatcheth them not; so he that getteth riches, and not by right, shall leave them in the midst of his days, and at his end shall be a fool.* — riches acquired in unrighteousness (Enoch 95:7) end in folly and loss.'
  FROM cross_reference_threads t, cross_references x, _session250_en95_lookup sv, _session250_en95_lookup tv
 WHERE t.slug='1-enoch-95-woe-to-the-rich-oppressor'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=95 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-95-vanishing-riches-fiery-furnace
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 12:19 — *And I will say to my soul, Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry.* — the rich fool''s boast is the gathered-silver self-talk of Enoch 95:7-8 that the reckoning of 95:13 silences.'
  FROM cross_reference_threads t, cross_references x, _session250_en95_lookup sv, _session250_en95_lookup tv
 WHERE t.slug='1-enoch-95-vanishing-riches-fiery-furnace'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=95 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* — ''where are your riches now?'' (Enoch 95:13) is the night the soul is required and the hoard left behind.'
  FROM cross_reference_threads t, cross_references x, _session250_en95_lookup sv, _session250_en95_lookup tv
 WHERE t.slug='1-enoch-95-vanishing-riches-fiery-furnace'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=95 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* — the parallel extra-canon witness puts Enoch''s pride-filled heart (95:15) in the perished proud man''s own too-late confession.'
  FROM cross_reference_threads t, cross_references x, _session250_en95_lookup sv, _session250_en95_lookup tv
 WHERE t.slug='1-enoch-95-vanishing-riches-fiery-furnace'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=95 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 5:9 — *All those things are passed away like a shadow, and as a post that hasted by;* — wealth passing like a shadow matches Enoch''s rich man destroyed like withering grass in 95:12.'
  FROM cross_reference_threads t, cross_references x, _session250_en95_lookup sv, _session250_en95_lookup tv
 WHERE t.slug='1-enoch-95-vanishing-riches-fiery-furnace'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=95 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-95-two-paths-choose-righteousness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* — Moses'' two-ways charge is precisely Enoch''s paths of righteousness and unrighteousness set before the sons in 95:17-18.'
  FROM cross_reference_threads t, cross_references x, _session250_en95_lookup sv, _session250_en95_lookup tv
 WHERE t.slug='1-enoch-95-two-paths-choose-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=95 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* — ''choose for yourselves the paths of righteousness... that ye may live and that your seed may be multiplied'' (Enoch 95:18) is Moses'' choose-life so thy seed may live.'
  FROM cross_reference_threads t, cross_references x, _session250_en95_lookup sv, _session250_en95_lookup tv
 WHERE t.slug='1-enoch-95-two-paths-choose-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=95 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* — the Psalter''s two ways match Enoch''s path of unrighteousness that ''shall be cut off'' in 95:17,19.'
  FROM cross_reference_threads t, cross_references x, _session250_en95_lookup sv, _session250_en95_lookup tv
 WHERE t.slug='1-enoch-95-two-paths-choose-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=95 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 4:18 — *But the path of the just is as the shining light, that shineth more and more unto the perfect day.* — the path of righteousness Enoch shows his sons (95:17) is wisdom''s shining path of the just.'
  FROM cross_reference_threads t, cross_references x, _session250_en95_lookup sv, _session250_en95_lookup tv
 WHERE t.slug='1-enoch-95-two-paths-choose-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=95 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

