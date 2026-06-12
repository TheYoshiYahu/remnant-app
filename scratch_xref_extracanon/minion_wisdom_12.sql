-- ----- fragment: minion_thewisdomofsolomon_12.sql (session253 the-wisdom-of-solomon 12) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis12 (view _session253_wis12_lookup). Sort band base 58275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-12-by-little-and-little
  ('apocrypha', 'the-wisdom-of-solomon', 12, 8, 'canon', 'exodus', 23, 29, 'free', E'Exodus 23:29 — *I will not drive them out from before thee in one year; lest the land become desolate, and the beast of the field multiply against thee.* The very Torah word Wisdom 12:8 is reading — the dispossession deliberately measured, not total at once.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 8, 'canon', 'exodus', 23, 30, 'free', E'Exodus 23:30 — *By little and little I will drive them out from before thee, until thou be increased, and inherit the land.* Wisdom 12:8-10 lifts Torah''s exact phrase "by little and little" and reads its restraint as room for repentance.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 10, 'canon', 'deuteronomy', 9, 4, 'free', E'Deuteronomy 9:4 — *Speak not thou in thine heart, after that Yahuah Elohayka (the LORD thy God) hath cast them out from before thee, saying, For my righteousness Yahuah (LORD) hath brought me in to possess this land: but for the wickedness of these nations Yahuah (LORD) doth drive them out from before thee.* The judgment in Wisdom 12:10 falls on a "naughty generation" for its own wickedness, never as Israel''s merit.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 10, 'canon', 'romans', 2, 4, 'free', E'Romans 2:4 — *Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* Paul names the principle Wisdom 12:10 dramatizes — the withheld stroke is goodness aimed at turning the sinner.'),
  -- thread: wisdom-12-no-elohim-but-thou
  ('apocrypha', 'the-wisdom-of-solomon', 12, 13, 'canon', 'deuteronomy', 4, 35, 'free', E'Deuteronomy 4:35 — *Unto thee it was shewed, that thou mightest know that Yahuah (LORD) he is Elohim (God); there is none else beside him.* Wisdom 12:13''s "no Elohim but thou" is the Shema''s exclusivity restated as the ground of righteous judgment.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 13, 'canon', 'isaiah', 45, 5, 'free', E'Isaiah 45:5 — *I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me: I girded thee, though thou hast not known me:* The sole-Elohim confession of Wisdom 12:13 echoes Isaiah''s repeated "none else."'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 16, 'canon', 'psalms', 145, 9, 'free', E'Psalm 145:9 — *Yahuah (LORD) is good to all: and his tender mercies are over all his works.* Wisdom 12:16 — being Elohim of all makes him gracious to all — is this Psalm in argument form.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 12, 'canon', 'romans', 9, 20, 'free', E'Romans 9:20 — *Nay but, O man, who art thou that repliest against Elohim (God)? Shall the thing formed say to him that formed it, Why hast thou made me thus?* Paul silences the same protest Wisdom 12:12 forecloses — none may say "What have you done?" to the Judge of all.'),
  -- thread: wisdom-12-place-of-repentance
  ('apocrypha', 'the-wisdom-of-solomon', 12, 20, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* Peter names the very purpose of the "time and place" Wisdom 12:20 says God grants the condemned.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 19, 'canon', 'ezekiel', 18, 23, 'free', E'Ezekiel 18:23 — *Have I any pleasure at all that the wicked should die? saith Adonai Yahuah (the Lord GOD): and not that he should return from his ways, and live?* The "good hope" of repentance in Wisdom 12:19 rests on this — God''s pleasure is the sinner''s return, not his death.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 19, 'canon', '1-timothy', 2, 4, 'free', E'1 Timothy 2:4 — *Who will have all men to be saved, and to come unto the knowledge of the truth.* The God who gives repentance for sins in Wisdom 12:19 is the God whose will Paul says reaches toward all.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 19, 'apocrypha', 'the-wisdom-of-solomon', 11, 23, 'extras', E'Wisdom of Solomon 11:23 — *But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend.* Solomon''s own prior verse self-links: omnipotence is bent toward amendment, the same hope Wisdom 12:19 gives God''s children.'),
  -- thread: wisdom-12-just-man-merciful
  ('apocrypha', 'the-wisdom-of-solomon', 12, 19, 'canon', 'matthew', 5, 7, 'free', E'Matthew 5:7 — *Blessed are the merciful: for they shall obtain mercy.* Wisdom 12:19 — God''s works teach that "the just man should be merciful" — is the Beatitude''s exact logic: mercy extended draws mercy received.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 22, 'canon', 'luke', 6, 36, 'free', E'Luke 6:36 — *Be ye therefore merciful, as your Father also is merciful.* Wisdom 12:22 grounds our mercy in God''s goodness so that "when we ourselves are judged, we should look for mercy" — imitating the Father''s own mercy.'),
  -- thread: wisdom-12-idols-self-torment
  ('apocrypha', 'the-wisdom-of-solomon', 12, 24, 'canon', 'romans', 1, 23, 'free', E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* Paul''s idolatry indictment — exchanging the Creator for beast-images — is exactly the error Wisdom 12:24 names, men holding for gods what is despised among the beasts.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 27, 'canon', 'romans', 1, 23, 'free', E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* Those in Wisdom 12:27 who "denied to know" the true Yahuah are Romans 1''s people who exchanged his glory — the deliberate refusal that brings damnation.'),
  ('apocrypha', 'the-wisdom-of-solomon', 12, 23, 'apocrypha', 'the-wisdom-of-solomon', 14, 27, 'extras', E'Wisdom of Solomon 14:27 — *For the worshipping of idols not to be named is the beginning, the cause, and the end, of all evil.* Solomon''s coming idolatry-polemic self-links: the "own abominations" that torment men in Wisdom 12:23 are idols, named the source and end of all evil.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-12-by-little-and-little',
       E'By little and little — judgment that gives place for repentance',
       E'Solomon reads the conquest of Canaan as restrained mercy, not raw conquest: *Nevertheless even those you sparedst as men, and did send wasps, forerunners of yours host, to destroy them by little and little* (Wisdom of Solomon 12:8), *But executing your judgments upon them by little and little, you gavest them place of repentance* (Wisdom of Solomon 12:10). It ain''t new — this is the Torah''s own cadence. Yahuah told Yashar''el the dispossession would be measured precisely so the land would not run wild: *I will not drive them out from before thee in one year; lest the land become desolate, and the beast of the field multiply against thee* (Exodus 23:29), *By little and little I will drive them out from before thee, until thou be increased, and inherit the land* (Exodus 23:30). And the conquest was never Yashar''el''s righteousness but the nations'' ripened wickedness: *but for the wickedness of these nations Yahuah (LORD) doth drive them out from before thee* (Deuteronomy 9:4). Paul names the same withheld stroke as kindness aimed at turning: *not knowing that the goodness of Elohim (God) leadeth thee to repentance?* (Romans 2:4). The slowness is the mercy.',
       sv.verse_id, ev.verse_id, 'extras', 58275
  FROM _session253_wis12_lookup sv, _session253_wis12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=12 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-12-no-elohim-but-thou',
       E'There is no Elohim but thou that careth for all',
       E'Against any who would arraign the Most High, Solomon plants the bedrock: *For neither is there any Yahuah (God) but you that careth for all, to whom you might shew that your judgment is not unright* (Wisdom of Solomon 12:13), and the astonishing inversion — *For your power is the beginning of righteousness, and because you are Yahuah (God) of all, it makes you to be gracious to all* (Wisdom of Solomon 12:16). It ain''t new: this is the Shema''s exclusivity. *Unto thee it was shewed, that thou mightest know that Yahuah (LORD) he is Elohim (God); there is none else beside him* (Deuteronomy 4:35); *I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me* (Isaiah 45:5). His care reaches every creature — *Yahuah (LORD) is good to all: and his tender mercies are over all his works* (Psalm 145:9). And the same unanswerable sovereignty Wisdom 12:12 protests (*who shall say, What have you done?*) is Paul''s potter: *Nay but, O man, who art thou that repliest against Elohim (God)? Shall the thing formed say to him that formed it, Why hast thou made me thus?* (Romans 9:20). The One who alone is Elohim is the One whose power is the wellspring of mercy.',
       sv.verse_id, ev.verse_id, 'extras', 58278
  FROM _session253_wis12_lookup sv, _session253_wis12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=12 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-12-place-of-repentance',
       E'Place of repentance — not willing that any should perish',
       E'The heart of Solomon''s theodicy is that Yahuah''s deliberate delay is gospel: *you gavest them place of repentance* (Wisdom of Solomon 12:10), *and have made your children to be of a good hope that you give repentance for sins* (Wisdom of Solomon 12:19), *giving them time and place, by which they might be delivered from their malice* (Wisdom of Solomon 12:20). This is the same divine longing the prophets and apostles confess. *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance* (2 Peter 3:9). The God of judgment takes no delight in the stroke: *Have I any pleasure at all that the wicked should die? saith Adonai Yahuah (the Lord GOD): and not that he should return from his ways, and live?* (Ezekiel 18:23); *Who will have all men to be saved, and to come unto the knowledge of the truth* (1 Timothy 2:4). Solomon had already said it plainly a chapter before — *But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend* (Wisdom of Solomon 11:23). It ain''t new: the patience is purposed for return.',
       sv.verse_id, ev.verse_id, 'extras', 58281
  FROM _session253_wis12_lookup sv, _session253_wis12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=12 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-12-just-man-merciful',
       E'The just man should be merciful',
       E'Solomon draws the ethic straight out of the theodicy: because Yahuah judges with such restraint, his people must imitate it — *But by such works have you taught your people that the just man should be merciful* (Wisdom of Solomon 12:19), *to the intent that, when we judge, we should carefully think of your goodness, and when we ourselves are judged, we should look for mercy* (Wisdom of Solomon 12:22). It ain''t new — Yahusha makes mercy the hinge of judgment in the Sermon: *Blessed are the merciful: for they shall obtain mercy* (Matthew 5:7), and binds it to the Father''s own character: *Be ye therefore merciful, as your Father also is merciful* (Luke 6:36). The measure we extend in judging is the measure we plead to receive — Solomon''s "look for mercy" is the Beatitude in seed.',
       sv.verse_id, ev.verse_id, 'extras', 58284
  FROM _session253_wis12_lookup sv, _session253_wis12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=12 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-12-idols-self-torment',
       E'Tormented by their own abominations — the idolatry that condemns',
       E'The chapter closes on the pagans'' self-inflicted ruin: *whereas men have lived dissolutely and unrighteously, you have tormented them with their own abominations* (Wisdom of Solomon 12:23), *For they went astray very far in the ways of error, and held them for gods, which even among the beasts of their enemies were despised* (Wisdom of Solomon 12:24), and at the last *they acknowledged him to be the true Yahuah (God), whom before they denied to know: and therefore came extreme damnation upon them* (Wisdom of Solomon 12:27). This is the very indictment Romans 1 will draw from Wisdom''s idolatry-polemic — men who exchange the Creator for the creature: *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things* (Romans 1:23). Solomon''s own next chapters name it the headwaters of every evil — *For the worshipping of idols not to be named is the beginning, the cause, and the end, of all evil* (Wisdom of Solomon 14:27). It ain''t new: the idol is the lie, and the lie is its own torment.',
       sv.verse_id, ev.verse_id, 'extras', 58287
  FROM _session253_wis12_lookup sv, _session253_wis12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=12 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-12-by-little-and-little
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:29 — *I will not drive them out from before thee in one year; lest the land become desolate, and the beast of the field multiply against thee.* The very Torah word Wisdom 12:8 is reading — the dispossession deliberately measured, not total at once.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-by-little-and-little'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:30 — *By little and little I will drive them out from before thee, until thou be increased, and inherit the land.* Wisdom 12:8-10 lifts Torah''s exact phrase "by little and little" and reads its restraint as room for repentance.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-by-little-and-little'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 9:4 — *Speak not thou in thine heart, after that Yahuah Elohayka (the LORD thy God) hath cast them out from before thee, saying, For my righteousness Yahuah (LORD) hath brought me in to possess this land: but for the wickedness of these nations Yahuah (LORD) doth drive them out from before thee.* The judgment in Wisdom 12:10 falls on a "naughty generation" for its own wickedness, never as Israel''s merit.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-by-little-and-little'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 2:4 — *Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* Paul names the principle Wisdom 12:10 dramatizes — the withheld stroke is goodness aimed at turning the sinner.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-by-little-and-little'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-12-no-elohim-but-thou
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:35 — *Unto thee it was shewed, that thou mightest know that Yahuah (LORD) he is Elohim (God); there is none else beside him.* Wisdom 12:13''s "no Elohim but thou" is the Shema''s exclusivity restated as the ground of righteous judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-no-elohim-but-thou'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 45:5 — *I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me: I girded thee, though thou hast not known me:* The sole-Elohim confession of Wisdom 12:13 echoes Isaiah''s repeated "none else."'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-no-elohim-but-thou'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 145:9 — *Yahuah (LORD) is good to all: and his tender mercies are over all his works.* Wisdom 12:16 — being Elohim of all makes him gracious to all — is this Psalm in argument form.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-no-elohim-but-thou'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 9:20 — *Nay but, O man, who art thou that repliest against Elohim (God)? Shall the thing formed say to him that formed it, Why hast thou made me thus?* Paul silences the same protest Wisdom 12:12 forecloses — none may say "What have you done?" to the Judge of all.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-no-elohim-but-thou'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-12-place-of-repentance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* Peter names the very purpose of the "time and place" Wisdom 12:20 says God grants the condemned.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-place-of-repentance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:23 — *Have I any pleasure at all that the wicked should die? saith Adonai Yahuah (the Lord GOD): and not that he should return from his ways, and live?* The "good hope" of repentance in Wisdom 12:19 rests on this — God''s pleasure is the sinner''s return, not his death.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-place-of-repentance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 2:4 — *Who will have all men to be saved, and to come unto the knowledge of the truth.* The God who gives repentance for sins in Wisdom 12:19 is the God whose will Paul says reaches toward all.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-place-of-repentance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 11:23 — *But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend.* Solomon''s own prior verse self-links: omnipotence is bent toward amendment, the same hope Wisdom 12:19 gives God''s children.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-place-of-repentance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=11 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-12-just-man-merciful
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 5:7 — *Blessed are the merciful: for they shall obtain mercy.* Wisdom 12:19 — God''s works teach that "the just man should be merciful" — is the Beatitude''s exact logic: mercy extended draws mercy received.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-just-man-merciful'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 6:36 — *Be ye therefore merciful, as your Father also is merciful.* Wisdom 12:22 grounds our mercy in God''s goodness so that "when we ourselves are judged, we should look for mercy" — imitating the Father''s own mercy.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-just-man-merciful'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-12-idols-self-torment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* Paul''s idolatry indictment — exchanging the Creator for beast-images — is exactly the error Wisdom 12:24 names, men holding for gods what is despised among the beasts.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-idols-self-torment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* Those in Wisdom 12:27 who "denied to know" the true Yahuah are Romans 1''s people who exchanged his glory — the deliberate refusal that brings damnation.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-idols-self-torment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 14:27 — *For the worshipping of idols not to be named is the beginning, the cause, and the end, of all evil.* Solomon''s coming idolatry-polemic self-links: the "own abominations" that torment men in Wisdom 12:23 are idols, named the source and end of all evil.'
  FROM cross_reference_threads t, cross_references x, _session253_wis12_lookup sv, _session253_wis12_lookup tv
 WHERE t.slug='wisdom-12-idols-self-torment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=12 AND sv.verse_number=23
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

