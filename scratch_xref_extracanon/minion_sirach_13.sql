-- ----- fragment: minion_ecclesiasticus_13.sql (session253 ecclesiasticus 13) -----
-- Source anchor: apocrypha/ecclesiasticus ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir13 (view _session253_sir13_lookup). Sort band base 58600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-13-touch-pitch
  ('apocrypha', 'ecclesiasticus', 13, 1, 'canon', '1-corinthians', 15, 33, 'free', E'1 Corinthians 15:33 — *Be not deceived: evil communications corrupt good manners.* Paul''s one-line proverb is Ben Sira''s pitch by another name — bad fellowship corrupts, so Sirach 13:1 warns it defiles.'),
  ('apocrypha', 'ecclesiasticus', 13, 1, 'canon', 'proverbs', 22, 24, 'free', E'Proverbs 22:24 — *Make no friendship with an angry man; and with a furious man thou shalt not go:* the Torah-wisdom Ben Sira inherits — avoid the proud and furious man''s fellowship lest Sirach 13:1''s defilement take hold.'),
  ('apocrypha', 'ecclesiasticus', 13, 1, 'canon', 'psalms', 1, 1, 'free', E'Psalms 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The blessing for the man who keeps clear of the scornful''s seat — the positive of Sirach 13:1''s warning against fellowship with the proud.'),
  ('apocrypha', 'ecclesiasticus', 13, 1, 'apocrypha', 'ecclesiasticus', 27, 9, 'extras', E'Ecclesiasticus 27:9 — *The birds will resort to their like; so will truth return to them that practise in her.* Ben Sira''s own like-to-like principle elsewhere in his book — the same law of company that makes touching pitch (Sirach 13:1) defile.'),
  -- thread: ecclesiasticus-13-rich-wrongs-poor
  ('apocrypha', 'ecclesiasticus', 13, 3, 'canon', 'proverbs', 22, 7, 'free', E'Proverbs 22:7 — *The rich ruleth over the poor, and the borrower is servant to the lender.* The bare wisdom-fact behind Sirach 13:3 — the rich man rules, so he can wrong and still threaten while the poor must entreat.'),
  ('apocrypha', 'ecclesiasticus', 13, 3, 'canon', 'james', 2, 6, 'free', E'James 2:6 — *But ye have despised the poor. Do not rich men oppress you, and draw you before the judgment seats?* James, the NT''s closest sibling to Sirach, indicts the very oppression Sirach 13:3 describes — the rich wrong and drag, the poor must plead.'),
  ('apocrypha', 'ecclesiasticus', 13, 3, 'canon', 'amos', 5, 11, 'free', E'Amos 5:11 — *Forasmuch therefore as your treading is upon the poor, and ye take from him burdens of wheat: ye have built houses of hewn stone, but ye shall not dwell in them; ye have planted pleasant vineyards, but ye shall not drink wine of them.* The prophetic sentence on the rich who tread the poor — the wrong of Sirach 13:3 does not go unjudged.'),
  ('apocrypha', 'ecclesiasticus', 13, 3, 'canon', 'isaiah', 3, 14, 'free', E'Isaiah 3:14 — *Yahuah (LORD) will enter into judgment with the ancients of his people, and the princes thereof: for ye have eaten up the vineyard; the spoil of the poor is in your houses.* Yahuah himself enters into judgment for the spoil of the poor — the answer to the rich man''s wrong in Sirach 13:3.'),
  -- thread: ecclesiasticus-13-flattery-snare
  ('apocrypha', 'ecclesiasticus', 13, 11, 'canon', 'proverbs', 22, 25, 'free', E'Proverbs 22:25 — *Lest thou learn his ways, and get a snare to thy soul.* The snare of the powerful man''s company in Proverbs is exactly the trap Sirach 13:11 names — his much communication is set to tempt and ensnare.'),
  ('apocrypha', 'ecclesiasticus', 13, 12, 'canon', 'habakkuk', 2, 6, 'free', E'Habakkuk 2:6 — *Shall not all these take up a parable against him, and a taunting proverb against him, and say, Woe to him that increaseth that which is not his! how long? and to him that ladeth himself with thick clay!* The oppressor who lays up the poor man''s words to hurt him (Sirach 13:12) has a woe laid up against his own increase.'),
  -- thread: ecclesiasticus-13-love-yahuah-like-to-like
  ('apocrypha', 'ecclesiasticus', 13, 14, 'canon', 'deuteronomy', 6, 5, 'free', E'Deuteronomy 6:5 — *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* The Shema''s first commandment stands behind Sirach 13:14 — love Yahuah all thy life, the one bond that never betrays.'),
  ('apocrypha', 'ecclesiasticus', 13, 17, 'canon', 'isaiah', 11, 6, 'free', E'Isaiah 11:6 — *The wolf also shall dwell with the lamb, and the leopard shall lie down with the kid; and the calf and the young lion and the fatling together; and a little child shall lead them.* The wolf-and-lamb enmity Sirach 13:17 takes as fixed is exactly what the messianic mountain reverses.'),
  ('apocrypha', 'ecclesiasticus', 13, 17, 'canon', 'isaiah', 65, 25, 'free', E'Isaiah 65:25 — *The wolf and the lamb shall feed together, and the lion shall eat straw like the bullock: and dust shall be the serpent’s meat. They shall not hurt nor destroy in all my holy mountain, saith Yahuah (LORD).* In the new creation the wolf and lamb of Sirach 13:17 finally have fellowship — Yahuah undoes the law of predatory kind.'),
  -- thread: ecclesiasticus-13-rich-poor-favored
  ('apocrypha', 'ecclesiasticus', 13, 22, 'canon', 'proverbs', 19, 4, 'free', E'Proverbs 19:4 — *Wealth maketh many friends; but the poor is separated from his neighbour.* The proverb behind Sirach 13:22 — the fallen rich man finds many helpers, the poor man is left alone.'),
  ('apocrypha', 'ecclesiasticus', 13, 22, 'canon', 'proverbs', 19, 7, 'free', E'Proverbs 19:7 — *All the brethren of the poor do hate him: how much more do his friends go far from him? he pursueth them with words, yet they are wanting to him.* The poor man rebuked and friendless in Sirach 13:22 is the very figure Proverbs describes — pursued with words, given no place.'),
  ('apocrypha', 'ecclesiasticus', 13, 23, 'canon', 'proverbs', 14, 20, 'free', E'Proverbs 14:20 — *The poor is hated even of his own neighbour: but the rich hath many friends.* When the rich man speaks all extol it but the poor man is dismissed (Sirach 13:23) — Proverbs already weighed this partiality of wealth.'),
  ('apocrypha', 'ecclesiasticus', 13, 19, 'canon', 'isaiah', 3, 15, 'free', E'Isaiah 3:15 — *What mean ye that ye beat my people to pieces, and grind the faces of the poor? saith Adonai Yahuah (the Lord GOD) of hosts.* The rich eating up the poor in Sirach 13:19 is what Yahuah of hosts calls grinding the faces of the poor — and he enters judgment for it.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-13-touch-pitch',
       E'He that toucheth pitch shall be defiled',
       E'Ben Sira opens chapter 13 with the wisdom-law of contagion: *He that toucheth pitch shall be defiled with it; and he that has fellowship with a proud man shall be like to him.* (Ecclesiasticus 13:1) — the company you keep stamps itself on you. Paul says the same to the Corinthians: *Be not deceived: evil communications corrupt good manners.* (1 Corinthians 15:33) — it ain''t new. Proverbs had already laid it down: *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* (Proverbs 22:24) is the warning against the angry man''s snare, and the psalmist blesses the one who refuses the seat: *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* (Psalms 1:1) Ben Sira''s own image returns elsewhere in his book — *The birds will resort to their like; so will truth return to them that practise in her.* (Ecclesiasticus 27:9) — like cleaves to like, for good or ill.',
       sv.verse_id, ev.verse_id, 'extras', 58600
  FROM _session253_sir13_lookup sv, _session253_sir13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=13 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-13-rich-wrongs-poor',
       E'The rich man hath done wrong, and yet he threateneth',
       E'Ben Sira names the upside-down justice of the powerful: *The rich man has done wrong, and yet he threateneth withal: the poor is wronged, and he must intreat also.* (Ecclesiasticus 13:3) The oppressor wrongs and still threatens; the victim must come begging. The Torah and the prophets thundered this long before. *The rich ruleth over the poor, and the borrower is servant to the lender.* (Proverbs 22:7) James asks the same in the assembly: *But ye have despised the poor. Do not rich men oppress you, and draw you before the judgment seats?* (James 2:6) Amos sees Yahuah''s verdict on it: *Forasmuch therefore as your treading is upon the poor, and ye take from him burdens of wheat: ye have built houses of hewn stone, but ye shall not dwell in them...* (Amos 5:11) And Isaiah brings the LORD himself into court: *Yahuah (LORD) will enter into judgment with the ancients of his people, and the princes thereof: for ye have eaten up the vineyard; the spoil of the poor is in your houses.* (Isaiah 3:14) — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58603
  FROM _session253_sir13_lookup sv, _session253_sir13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=13 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-13-flattery-snare',
       E'With much communication will he tempt thee',
       E'Ben Sira warns that the great man''s friendliness is a baited trap: *Affect not to be made equal to him in talk, and believe not his many words: for with much communication will he tempt you, and smiling upon you will get out your secrets:* (Ecclesiasticus 13:11) — and then *cruelly he will lay up your words, and will not spare to do you hurt, and to put you in prison.* (Ecclesiasticus 13:12) His smile is reconnaissance; his many words are a net. Proverbs gives the rule for such company: *Make no friendship with an angry man; and with a furious man thou shalt not go: Lest thou learn his ways, and get a snare to thy soul.* (Proverbs 22:25) And Habakkuk turns the tables — the day comes when the spoiled raise the proverb against the spoiler: *Shall not all these take up a parable against him, and a taunting proverb against him, and say, Woe to him that increaseth that which is not his! how long?...* (Habakkuk 2:6) The oppressor''s words are laid up against the weak; Yahuah lays up a woe against the oppressor.',
       sv.verse_id, ev.verse_id, 'extras', 58606
  FROM _session253_sir13_lookup sv, _session253_sir13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=13 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-13-love-yahuah-like-to-like',
       E'Love Yahuah all thy life; like will cleave to like',
       E'Against the seduction of the great, Ben Sira plants the one safe fellowship: *Love Yahuah (God) all your life, and call upon him for your salvation.* (Ecclesiasticus 13:14) — the Shema in wisdom dress: *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* (Deuteronomy 6:5) Then the law of kind: *Every beast loves his like, and every man loves his neighbor.* (Ecclesiasticus 13:15) and *What fellowship has the wolf with the lamb? so the sinner with the godly.* (Ecclesiasticus 13:17) The wolf and the lamb cannot agree — until the mountain is made new. *The wolf also shall dwell with the lamb, and the leopard shall lie down with the kid...* (Isaiah 11:6) and *The wolf and the lamb shall feed together... They shall not hurt nor destroy in all my holy mountain, saith Yahuah (LORD).* (Isaiah 65:25) — the enmity of kinds Ben Sira observes is the very thing the kingdom undoes. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58609
  FROM _session253_sir13_lookup sv, _session253_sir13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=13 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-13-rich-poor-favored',
       E'When a rich man is fallen, he hath many helpers',
       E'Ben Sira lays bare the world''s partiality: *As the wild ass is the lion’s prey in the wilderness: so the rich eat up the poor.* (Ecclesiasticus 13:19) and *When a rich man is fallen, he has many helpers... the poor man slipped, and yet they rebuked him too; he spoke wisely, and could have no place.* (Ecclesiasticus 13:22) The same wisdom Israel knew: *Wealth maketh many friends; but the poor is separated from his neighbour.* (Proverbs 19:4) and *All the brethren of the poor do hate him: how much more do his friends go far from him?...* (Proverbs 19:7) and *The poor is hated even of his own neighbour: but the rich hath many friends.* (Proverbs 14:20) But Yahuah''s court overturns the world''s favoritism: *What mean ye that ye beat my people to pieces, and grind the faces of the poor? saith Adonai Yahuah (the Lord GOD) of hosts.* (Isaiah 3:15) — the poor man who could find no place has a Judge who takes up his cause.',
       sv.verse_id, ev.verse_id, 'extras', 58612
  FROM _session253_sir13_lookup sv, _session253_sir13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=13 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-13-touch-pitch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 15:33 — *Be not deceived: evil communications corrupt good manners.* Paul''s one-line proverb is Ben Sira''s pitch by another name — bad fellowship corrupts, so Sirach 13:1 warns it defiles.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-touch-pitch'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 22:24 — *Make no friendship with an angry man; and with a furious man thou shalt not go:* the Torah-wisdom Ben Sira inherits — avoid the proud and furious man''s fellowship lest Sirach 13:1''s defilement take hold.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-touch-pitch'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The blessing for the man who keeps clear of the scornful''s seat — the positive of Sirach 13:1''s warning against fellowship with the proud.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-touch-pitch'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 27:9 — *The birds will resort to their like; so will truth return to them that practise in her.* Ben Sira''s own like-to-like principle elsewhere in his book — the same law of company that makes touching pitch (Sirach 13:1) defile.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-touch-pitch'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=27 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-13-rich-wrongs-poor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 22:7 — *The rich ruleth over the poor, and the borrower is servant to the lender.* The bare wisdom-fact behind Sirach 13:3 — the rich man rules, so he can wrong and still threaten while the poor must entreat.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-rich-wrongs-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 2:6 — *But ye have despised the poor. Do not rich men oppress you, and draw you before the judgment seats?* James, the NT''s closest sibling to Sirach, indicts the very oppression Sirach 13:3 describes — the rich wrong and drag, the poor must plead.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-rich-wrongs-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Amos 5:11 — *Forasmuch therefore as your treading is upon the poor, and ye take from him burdens of wheat: ye have built houses of hewn stone, but ye shall not dwell in them; ye have planted pleasant vineyards, but ye shall not drink wine of them.* The prophetic sentence on the rich who tread the poor — the wrong of Sirach 13:3 does not go unjudged.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-rich-wrongs-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 3:14 — *Yahuah (LORD) will enter into judgment with the ancients of his people, and the princes thereof: for ye have eaten up the vineyard; the spoil of the poor is in your houses.* Yahuah himself enters into judgment for the spoil of the poor — the answer to the rich man''s wrong in Sirach 13:3.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-rich-wrongs-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-13-flattery-snare
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 22:25 — *Lest thou learn his ways, and get a snare to thy soul.* The snare of the powerful man''s company in Proverbs is exactly the trap Sirach 13:11 names — his much communication is set to tempt and ensnare.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-flattery-snare'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Habakkuk 2:6 — *Shall not all these take up a parable against him, and a taunting proverb against him, and say, Woe to him that increaseth that which is not his! how long? and to him that ladeth himself with thick clay!* The oppressor who lays up the poor man''s words to hurt him (Sirach 13:12) has a woe laid up against his own increase.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-flattery-snare'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-13-love-yahuah-like-to-like
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:5 — *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* The Shema''s first commandment stands behind Sirach 13:14 — love Yahuah all thy life, the one bond that never betrays.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-love-yahuah-like-to-like'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:6 — *The wolf also shall dwell with the lamb, and the leopard shall lie down with the kid; and the calf and the young lion and the fatling together; and a little child shall lead them.* The wolf-and-lamb enmity Sirach 13:17 takes as fixed is exactly what the messianic mountain reverses.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-love-yahuah-like-to-like'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 65:25 — *The wolf and the lamb shall feed together, and the lion shall eat straw like the bullock: and dust shall be the serpent’s meat. They shall not hurt nor destroy in all my holy mountain, saith Yahuah (LORD).* In the new creation the wolf and lamb of Sirach 13:17 finally have fellowship — Yahuah undoes the law of predatory kind.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-love-yahuah-like-to-like'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-13-rich-poor-favored
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 19:4 — *Wealth maketh many friends; but the poor is separated from his neighbour.* The proverb behind Sirach 13:22 — the fallen rich man finds many helpers, the poor man is left alone.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-rich-poor-favored'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 19:7 — *All the brethren of the poor do hate him: how much more do his friends go far from him? he pursueth them with words, yet they are wanting to him.* The poor man rebuked and friendless in Sirach 13:22 is the very figure Proverbs describes — pursued with words, given no place.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-rich-poor-favored'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 14:20 — *The poor is hated even of his own neighbour: but the rich hath many friends.* When the rich man speaks all extol it but the poor man is dismissed (Sirach 13:23) — Proverbs already weighed this partiality of wealth.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-rich-poor-favored'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=14 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 3:15 — *What mean ye that ye beat my people to pieces, and grind the faces of the poor? saith Adonai Yahuah (the Lord GOD) of hosts.* The rich eating up the poor in Sirach 13:19 is what Yahuah of hosts calls grinding the faces of the poor — and he enters judgment for it.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-rich-poor-favored'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

