-- ----- fragment: minion_1enoch_102.sql (session250 1-enoch 102) -----
-- Source anchor: enoch/1-enoch ch102. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en102 (view _session250_en102_lookup). Sort band base 52525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en102_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-102-souls-in-the-hand-of-elohim
  ('enoch', '1-enoch', 102, 3, 'apocrypha', 'the-wisdom-of-solomon', 3, 1, 'extras', E'Wisdom of Solomon 3:1 — *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* Almost verbatim with Enoch 102:3 — the righteous dead rest in Elohim''s hand, untouched by torment, while only the sinners are held in Sheol.'),
  ('enoch', '1-enoch', 102, 1, 'apocrypha', 'the-wisdom-of-solomon', 3, 2, 'extras', E'Wisdom of Solomon 3:2 — *In the sight of the unwise they seemed to die: and their departure is taken for misery,* matching the very taunt Enoch''s sinners raise at 102:5-6 — the world reads the righteous death as defeat and cannot see the path that runs through it.'),
  ('enoch', '1-enoch', 102, 3, 'apocrypha', 'the-wisdom-of-solomon', 3, 4, 'extras', E'Wisdom of Solomon 3:4 — *For though they be punished in the sight of men, yet is their hope full of immortality.* The no-torment promise of Enoch 102:3 is the hope of immortality — the righteous suffer in the world''s eyes but are kept whole in Elohim''s hand.'),
  ('enoch', '1-enoch', 102, 1, 'canon', 'daniel', 12, 1, 'free', E'Daniel 12:1 — *...and at that time thy people shall be delivered, every one that shall be found written in the book.* Enoch''s separation of righteous from sinners (102:1-2) is Daniel''s deliverance — the deciding line is the name already written, election before any confession.'),
  -- thread: 1-enoch-102-righteous-shine-sinners-taunt
  ('enoch', '1-enoch', 102, 7, 'canon', 'daniel', 12, 3, 'free', E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* Enoch''s righteous *shining like the sun* (102:7) is Daniel''s resurrection-radiance of the wise.'),
  ('enoch', '1-enoch', 102, 2, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The separation of the righteous dead from the sinners in Enoch 102:2 is the two-fold awakening — life for the one, shame for the other.'),
  ('enoch', '1-enoch', 102, 7, 'canon', 'matthew', 13, 43, 'free', E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Yahusha''s own words for the harvest''s end exactly render Enoch 102:7 — the righteous shining like the sun.'),
  ('enoch', '1-enoch', 102, 6, 'apocrypha', 'the-wisdom-of-solomon', 5, 3, 'extras', E'Wisdom of Solomon 5:3 — *And they repenting and groaning for anguish of spirit shall say within themselves, This was he, whom we had sometimes in derision, and a proverb of reproach:* the mockers of Enoch 102:6 (“these are they who have despised us”) seen now from the other side — the despisers confessing too late.'),
  ('enoch', '1-enoch', 102, 7, 'apocrypha', 'the-wisdom-of-solomon', 5, 5, 'extras', E'Wisdom of Solomon 5:5 — *How is he numbered among the children of Yahuah (God), and his lot is among the saints!* The sinners'' astonishment at the shining righteous in Enoch 102:7 is this very cry — the despised are found among the elect.'),
  -- thread: 1-enoch-102-woes-on-the-rich-oppressors
  ('enoch', '1-enoch', 102, 10, 'canon', 'isaiah', 5, 8, 'free', E'Isaiah 5:8 — *Woe unto them that join house to house, that lay field to field, till there be no place, that they may be placed alone in the midst of the earth!* Enoch''s woe on those who tread the poor and amass possessions (102:10,13) is Isaiah''s woe on land-grabbing greed.'),
  ('enoch', '1-enoch', 102, 12, 'canon', 'isaiah', 5, 22, 'free', E'Isaiah 5:22 — *Woe unto them that are mighty to drink wine, and men of strength to mingle strong drink:* the strong who drink wine in large bowls while treading the poor (Enoch 102:12) stand under Isaiah''s same woe.'),
  ('enoch', '1-enoch', 102, 12, 'canon', 'amos', 6, 6, 'free', E'Amos 6:6 — *That drink wine in bowls, and anoint themselves with the chief ointments: but they are not grieved for the affliction of Joseph.* Enoch''s drinkers of wine in large bowls (102:12) are Amos''s feasters indifferent to the suffering of the people.'),
  ('enoch', '1-enoch', 102, 13, 'canon', 'james', 5, 4, 'free', E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* The many husbandmen and labourers in the rich man''s houses (Enoch 102:14-16) cry out against the fraud that gathered the gold and silver in unrighteousness (102:13).'),
  -- thread: 1-enoch-102-furnace-riches-do-not-endure
  ('enoch', '1-enoch', 102, 18, 'canon', 'matthew', 13, 42, 'free', E'Matthew 13:42 — *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* Yahusha''s harvest-end furnace is Enoch''s *fiery furnace* (102:18) — the same fate for those whose unrighteous glory withers like grass.'),
  ('enoch', '1-enoch', 102, 18, 'canon', 'malachi', 4, 1, 'free', E'Malachi 4:1 — *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up...* Enoch''s proud destroyed like withering grass and cast into the furnace (102:18) are Malachi''s proud burned up as stubble.'),
  ('enoch', '1-enoch', 102, 7, 'canon', 'malachi', 4, 2, 'free', E'Malachi 4:2 — *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall.* The righteous shining like the sun in Enoch 102:7 meet the Sun of righteousness who rises for those who fear Yahuah''s name — the other end from the furnace.'),
  ('enoch', '1-enoch', 102, 13, 'canon', 'malachi', 3, 14, 'free', E'Malachi 3:14 — *Ye have said, It is vain to serve Elohim (God): and what profit is it that we have kept his ordinance, and that we have walked mournfully before Yahuah Tseva''ot (LORD of hosts)?* This is the sinners'' boast of Enoch 102:13 — that wealth, not service, is gain — answered when Yahuah writes the book of remembrance for them that fear Him (Malachi 3:16).'),
  ('enoch', '1-enoch', 102, 22, 'canon', 'psalms', 49, 16, 'free', E'Psalm 49:16 — *Be not thou afraid when one is made rich, when the glory of his house is increased;* the Psalmist''s counsel answers Enoch 102:22 — the rich man''s riches and glory shall not endure, so the righteous need not fear them.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en102_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en102_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-102-souls-in-the-hand-of-elohim',
       E'The souls of the righteous in the hand of Elohim — no torment touches them',
       E'Enoch separates the two ends in the day of judgement: *And the souls of the righteous shall be in the hand of Elohim (God), And no torment shall touch them.* (1 Enoch 102:3), while *the souls of the sinners shall be in Sheol* lamenting (102:4). This is not a new comfort — Wisdom says it almost word for word: *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* (Wisdom of Solomon 3:1), and answers the world''s misreading of their death — *In the sight of the unwise they seemed to die: and their departure is taken for misery* (Wisdom of Solomon 3:2) — *but they are in peace* (Wisdom of Solomon 3:3) and *their hope full of immortality* (Wisdom of Solomon 3:4). The righteous keep the way and are kept; Sheol holds only those who broke the covenant. The keeping precedes the deliverance: *every one that shall be found written in the book* (Daniel 12:1) is the one already named among the elect, not added by a deathbed verdict.',
       sv.verse_id, ev.verse_id, 'extras', 52525
  FROM _session250_en102_lookup sv, _session250_en102_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=102 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-102-righteous-shine-sinners-taunt',
       E'Shining like the sun — the dead righteous answered, the sinners'' taunt undone',
       E'The sinners in Sheol see the vindicated righteous and recoil: *And they shall see the righteous shining like the sun, And they shall say: “These are they who have walked in righteousness before Yahuah (God) of Spirits.”* (1 Enoch 102:7). This is the resurrection-shining of Daniel — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* (Daniel 12:3) — after *many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2), which Yahusha seals: *Then shall the righteous shine forth as the sun in the kingdom of their Father.* (Matthew 13:43). Wisdom stages the very scene of 102:6-7 — the mockers turned witnesses: *This was he, whom we had sometimes in derision, and a proverb of reproach* (Wisdom of Solomon 5:3), *We fools accounted his life madness, and his end to be without honour* (Wisdom of Solomon 5:4), *How is he numbered among the children of Yahuah (God), and his lot is among the saints!* (Wisdom of Solomon 5:5). And Malachi names the ledger that decides who shines: *a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* (Malachi 3:16) — over against the world''s complaint that *It is vain to serve Elohim (God)* (Malachi 3:14). It ain''t new: the despised righteous of Enoch 102 are the wise-who-shine, written in the book of remembrance.',
       sv.verse_id, ev.verse_id, 'extras', 52528
  FROM _session250_en102_lookup sv, _session250_en102_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=102 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-102-woes-on-the-rich-oppressors',
       E'Woe to the strong in unrighteousness who tread the poor — the eternal law unbroken',
       E'Enoch turns the woes against the systems of injustice, not the persons caught in them: *Woe to you who eat the marrow of wheat, And drink the finest wine, And tread upon the poor with your might!* (1 Enoch 102:10) and *Woe to you who acquire gold and silver in unrighteousness* (102:13). This is the prophets'' own indictment of luxury wrung from the oppressed. Isaiah: *Woe unto them that join house to house, that lay field to field, till there be no place* (Isaiah 5:8), and *Woe unto them that are mighty to drink wine, and men of strength to mingle strong drink* (Isaiah 5:22) — the vineyard owner who *looked for judgment, but behold oppression; for righteousness, but behold a cry* (Isaiah 5:7). Amos names the same banquet: *That drink wine in bowls... but they are not grieved for the affliction of Joseph.* (Amos 6:6). And the apostle Yahaqov carries it whole into the last days: *Go to now, ye rich men, weep and howl for your miseries that shall come upon you.* (James 5:1), for *the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth* (James 5:4). The woe falls on the fraud, the hoarding, the trampling — the perversion of the eternal law — never on the poor, and never on Torah, which is the way of life the oppressor abandoned.',
       sv.verse_id, ev.verse_id, 'extras', 52531
  FROM _session250_en102_lookup sv, _session250_en102_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=102 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-102-furnace-riches-do-not-endure',
       E'Cast into the fiery furnace — where are your riches now?',
       E'The flattery that crowned the rich as gods is unmasked: they exalt you *like a king... And they shall call you gods* (1 Enoch 102:17), *But ye shall be destroyed like grass, And like the young grass that withers, And ye shall be cast into the fiery furnace.* (102:18), and the mocking question follows — *Where are your riches now?* (102:19) — answered, *For your riches shall not endure, And your glory shall not last.* (102:22). Yahusha sets the same furnace at the end of the age: *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* (Matthew 13:42). Malachi paints the same withering: *the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble* (Malachi 4:1), while *unto you that fear my name shall the Sun of righteousness arise with healing in his wings* (Malachi 4:2) — the same two ends as Enoch''s shining righteous and consumed sinners, sealed with *Remember ye the law of Moses my servant* (Malachi 4:4): Torah stands through the fire. And the Psalmist already answered the boast: *Be not thou afraid when one is made rich, when the glory of his house is increased;* (Psalm 49:16). The riches that do not endure (102:22) are stubble; the path of righteousness alone is not cut off.',
       sv.verse_id, ev.verse_id, 'extras', 52534
  FROM _session250_en102_lookup sv, _session250_en102_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=17
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=102 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-102-souls-in-the-hand-of-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 3:1 — *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* Almost verbatim with Enoch 102:3 — the righteous dead rest in Elohim''s hand, untouched by torment, while only the sinners are held in Sheol.'
  FROM cross_reference_threads t, cross_references x, _session250_en102_lookup sv, _session250_en102_lookup tv
 WHERE t.slug='1-enoch-102-souls-in-the-hand-of-elohim'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 3:2 — *In the sight of the unwise they seemed to die: and their departure is taken for misery,* matching the very taunt Enoch''s sinners raise at 102:5-6 — the world reads the righteous death as defeat and cannot see the path that runs through it.'
  FROM cross_reference_threads t, cross_references x, _session250_en102_lookup sv, _session250_en102_lookup tv
 WHERE t.slug='1-enoch-102-souls-in-the-hand-of-elohim'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 3:4 — *For though they be punished in the sight of men, yet is their hope full of immortality.* The no-torment promise of Enoch 102:3 is the hope of immortality — the righteous suffer in the world''s eyes but are kept whole in Elohim''s hand.'
  FROM cross_reference_threads t, cross_references x, _session250_en102_lookup sv, _session250_en102_lookup tv
 WHERE t.slug='1-enoch-102-souls-in-the-hand-of-elohim'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 12:1 — *...and at that time thy people shall be delivered, every one that shall be found written in the book.* Enoch''s separation of righteous from sinners (102:1-2) is Daniel''s deliverance — the deciding line is the name already written, election before any confession.'
  FROM cross_reference_threads t, cross_references x, _session250_en102_lookup sv, _session250_en102_lookup tv
 WHERE t.slug='1-enoch-102-souls-in-the-hand-of-elohim'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-102-righteous-shine-sinners-taunt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* Enoch''s righteous *shining like the sun* (102:7) is Daniel''s resurrection-radiance of the wise.'
  FROM cross_reference_threads t, cross_references x, _session250_en102_lookup sv, _session250_en102_lookup tv
 WHERE t.slug='1-enoch-102-righteous-shine-sinners-taunt'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The separation of the righteous dead from the sinners in Enoch 102:2 is the two-fold awakening — life for the one, shame for the other.'
  FROM cross_reference_threads t, cross_references x, _session250_en102_lookup sv, _session250_en102_lookup tv
 WHERE t.slug='1-enoch-102-righteous-shine-sinners-taunt'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Yahusha''s own words for the harvest''s end exactly render Enoch 102:7 — the righteous shining like the sun.'
  FROM cross_reference_threads t, cross_references x, _session250_en102_lookup sv, _session250_en102_lookup tv
 WHERE t.slug='1-enoch-102-righteous-shine-sinners-taunt'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 5:3 — *And they repenting and groaning for anguish of spirit shall say within themselves, This was he, whom we had sometimes in derision, and a proverb of reproach:* the mockers of Enoch 102:6 (“these are they who have despised us”) seen now from the other side — the despisers confessing too late.'
  FROM cross_reference_threads t, cross_references x, _session250_en102_lookup sv, _session250_en102_lookup tv
 WHERE t.slug='1-enoch-102-righteous-shine-sinners-taunt'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 5:5 — *How is he numbered among the children of Yahuah (God), and his lot is among the saints!* The sinners'' astonishment at the shining righteous in Enoch 102:7 is this very cry — the despised are found among the elect.'
  FROM cross_reference_threads t, cross_references x, _session250_en102_lookup sv, _session250_en102_lookup tv
 WHERE t.slug='1-enoch-102-righteous-shine-sinners-taunt'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-102-woes-on-the-rich-oppressors
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 5:8 — *Woe unto them that join house to house, that lay field to field, till there be no place, that they may be placed alone in the midst of the earth!* Enoch''s woe on those who tread the poor and amass possessions (102:10,13) is Isaiah''s woe on land-grabbing greed.'
  FROM cross_reference_threads t, cross_references x, _session250_en102_lookup sv, _session250_en102_lookup tv
 WHERE t.slug='1-enoch-102-woes-on-the-rich-oppressors'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 5:22 — *Woe unto them that are mighty to drink wine, and men of strength to mingle strong drink:* the strong who drink wine in large bowls while treading the poor (Enoch 102:12) stand under Isaiah''s same woe.'
  FROM cross_reference_threads t, cross_references x, _session250_en102_lookup sv, _session250_en102_lookup tv
 WHERE t.slug='1-enoch-102-woes-on-the-rich-oppressors'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Amos 6:6 — *That drink wine in bowls, and anoint themselves with the chief ointments: but they are not grieved for the affliction of Joseph.* Enoch''s drinkers of wine in large bowls (102:12) are Amos''s feasters indifferent to the suffering of the people.'
  FROM cross_reference_threads t, cross_references x, _session250_en102_lookup sv, _session250_en102_lookup tv
 WHERE t.slug='1-enoch-102-woes-on-the-rich-oppressors'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* The many husbandmen and labourers in the rich man''s houses (Enoch 102:14-16) cry out against the fraud that gathered the gold and silver in unrighteousness (102:13).'
  FROM cross_reference_threads t, cross_references x, _session250_en102_lookup sv, _session250_en102_lookup tv
 WHERE t.slug='1-enoch-102-woes-on-the-rich-oppressors'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-102-furnace-riches-do-not-endure
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 13:42 — *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* Yahusha''s harvest-end furnace is Enoch''s *fiery furnace* (102:18) — the same fate for those whose unrighteous glory withers like grass.'
  FROM cross_reference_threads t, cross_references x, _session250_en102_lookup sv, _session250_en102_lookup tv
 WHERE t.slug='1-enoch-102-furnace-riches-do-not-endure'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 4:1 — *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up...* Enoch''s proud destroyed like withering grass and cast into the furnace (102:18) are Malachi''s proud burned up as stubble.'
  FROM cross_reference_threads t, cross_references x, _session250_en102_lookup sv, _session250_en102_lookup tv
 WHERE t.slug='1-enoch-102-furnace-riches-do-not-endure'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:2 — *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall.* The righteous shining like the sun in Enoch 102:7 meet the Sun of righteousness who rises for those who fear Yahuah''s name — the other end from the furnace.'
  FROM cross_reference_threads t, cross_references x, _session250_en102_lookup sv, _session250_en102_lookup tv
 WHERE t.slug='1-enoch-102-furnace-riches-do-not-endure'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 3:14 — *Ye have said, It is vain to serve Elohim (God): and what profit is it that we have kept his ordinance, and that we have walked mournfully before Yahuah Tseva''ot (LORD of hosts)?* This is the sinners'' boast of Enoch 102:13 — that wealth, not service, is gain — answered when Yahuah writes the book of remembrance for them that fear Him (Malachi 3:16).'
  FROM cross_reference_threads t, cross_references x, _session250_en102_lookup sv, _session250_en102_lookup tv
 WHERE t.slug='1-enoch-102-furnace-riches-do-not-endure'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 49:16 — *Be not thou afraid when one is made rich, when the glory of his house is increased;* the Psalmist''s counsel answers Enoch 102:22 — the rich man''s riches and glory shall not endure, so the righteous need not fear them.'
  FROM cross_reference_threads t, cross_references x, _session250_en102_lookup sv, _session250_en102_lookup tv
 WHERE t.slug='1-enoch-102-furnace-riches-do-not-endure'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=102 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

