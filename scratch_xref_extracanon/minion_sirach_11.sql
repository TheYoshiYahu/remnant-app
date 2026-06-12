-- ----- fragment: minion_ecclesiasticus_11.sql (session253 ecclesiasticus 11) -----
-- Source anchor: apocrypha/ecclesiasticus ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir11 (view _session253_sir11_lookup). Sort band base 58550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-11-judge-not-by-appearance
  ('apocrypha', 'ecclesiasticus', 11, 2, 'canon', '1-samuel', 16, 7, 'free', E'1 Samuel 16:7 — *But Yahuah (LORD) said unto Samuel, Look not on his countenance, or on the height of his stature; because I have refused him: for Yahuah (LORD) seeth not as man seeth; for man looketh on the outward appearance, but Yahuah (LORD) looketh on the heart.* The Tanakh''s anchor for Sirach 11:2 — abhor not a man by his outward appearance, for Yahuah weighs the heart.'),
  ('apocrypha', 'ecclesiasticus', 11, 5, 'canon', 'james', 1, 9, 'free', E'James 1:9 — *Let the brother of low degree rejoice in that he is exalted:* James echoes Sirach 11:5''s reversal — the unregarded man wears the crown, the brother of low degree is the one exalted.'),
  ('apocrypha', 'ecclesiasticus', 11, 6, 'canon', 'james', 1, 10, 'free', E'James 1:10 — *But the rich, in that he is made low: because as the flower of the grass he shall pass away.* The mighty greatly disgraced and the honourable delivered up (Sirach 11:6) is James''s fading flower of the rich.'),
  -- thread: ecclesiasticus-11-pride-beginning-of-sin
  ('apocrypha', 'ecclesiasticus', 11, 4, 'apocrypha', 'ecclesiasticus', 10, 13, 'extras', E'Ecclesiasticus 10:13 — *For pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly.* Ben Sira self-links: the warning not to exalt thyself in the day of honour (11:4) rests on his own root-diagnosis that pride is the beginning of sin.'),
  ('apocrypha', 'ecclesiasticus', 11, 30, 'apocrypha', 'ecclesiasticus', 10, 12, 'extras', E'Ecclesiasticus 10:12 — *The beginning of pride is when one departs from Yahuah (God), and his heart is turned away from his Maker.* The proud heart that watcheth for your fall (11:30) is the heart already turned away from its Maker.'),
  ('apocrypha', 'ecclesiasticus', 11, 4, 'canon', 'proverbs', 16, 18, 'free', E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* Proverbs gives the proverb behind Sirach 11:4''s warning not to exalt thyself in the day of honour.'),
  -- thread: ecclesiasticus-11-answer-not-before-hearing
  ('apocrypha', 'ecclesiasticus', 11, 8, 'canon', 'proverbs', 18, 13, 'free', E'Proverbs 18:13 — *He that answereth a matter before he heareth it, it is folly and shame unto him.* The exact proverb Sirach 11:8 expands — answer not before you have heard the cause.'),
  ('apocrypha', 'ecclesiasticus', 11, 9, 'canon', 'luke', 12, 14, 'free', E'Luke 12:14 — *And he said unto him, Man, who made me a judge or a divider over you?* Yahusha himself keeps Sirach 11:9''s rule — strive not in a matter that concerneth you not, sit not in judgment uninvited.'),
  -- thread: ecclesiasticus-11-labour-not-to-be-rich
  ('apocrypha', 'ecclesiasticus', 11, 11, 'canon', 'proverbs', 23, 4, 'free', E'Proverbs 23:4 — *Labour not to be rich: cease from thine own wisdom.* The Tanakh command Sirach 11:11 dramatizes — he that makes haste is the more behind.'),
  ('apocrypha', 'ecclesiasticus', 11, 11, 'canon', 'ecclesiastes', 9, 11, 'free', E'Ecclesiastes 9:11 — *I returned, and saw under the sun, that the race is not to the swift, nor the battle to the strong, neither yet bread to the wise, nor yet riches to men of understanding, nor yet favour to men of skill; but time and chance happeneth to them all.* Qoheleth''s word for Sirach 11:11 — the one who makes haste is so much the more behind, for the race is not to the swift.'),
  ('apocrypha', 'ecclesiasticus', 11, 10, 'canon', 'proverbs', 28, 20, 'free', E'Proverbs 28:20 — *A faithful man shall abound with blessings: but he that maketh haste to be rich shall not be innocent.* Meddle much and you shall not be innocent (Sirach 11:10) is Proverbs'' own verdict on the hasty.'),
  ('apocrypha', 'ecclesiasticus', 11, 12, 'canon', 'psalms', 127, 1, 'free', E'Psalm 127:1 — *Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain.* The eye of Yahuah that sets a man up from low estate (Sirach 11:12) — apart from that building hand all the labour is vain.'),
  -- thread: ecclesiasticus-11-promotion-from-yahuah
  ('apocrypha', 'ecclesiasticus', 11, 14, 'canon', 'psalms', 75, 7, 'free', E'Psalm 75:7 — *But Elohim (God) is the judge: he putteth down one, and setteth up another.* The Psalm''s word for Sirach 11:14 — prosperity and adversity, poverty and riches, all come of Yahuah who alone sets up and casts down.'),
  ('apocrypha', 'ecclesiasticus', 11, 14, 'canon', 'psalms', 75, 6, 'free', E'Psalm 75:6 — *For promotion cometh neither from the east, nor from the west, nor from the south.* Life and death and riches come of Yahuah (Sirach 11:14), not from any quarter of the earth.'),
  ('apocrypha', 'ecclesiasticus', 11, 21, 'canon', 'deuteronomy', 8, 18, 'free', E'Deuteronomy 8:18 — *But thou shalt remember Yahuah Elohayka (the LORD thy God): for it is he that giveth thee power to get wealth, that he may establish his covenant which he sware unto thy fathers, as it is this day.* Yahuah makes a poor man rich on the sudden (Sirach 11:21) — Moses anchors it: it is He that giveth power to get wealth.'),
  ('apocrypha', 'ecclesiasticus', 11, 17, 'canon', 'james', 1, 17, 'free', E'James 1:17 — *Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning.* The gift and favour of Yahuah (Sirach 11:17) is James''s every good and perfect gift from the Father of lights.'),
  -- thread: ecclesiasticus-11-rich-fool-remember-death
  ('apocrypha', 'ecclesiasticus', 11, 19, 'canon', 'luke', 12, 20, 'free', E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* Yahusha''s rich fool is Sirach 11:19 verbatim — he says he will eat continually of his goods, yet must leave them to others and die.'),
  ('apocrypha', 'ecclesiasticus', 11, 24, 'canon', 'luke', 12, 21, 'free', E'Luke 12:21 — *So is he that layeth up treasure for himself, and is not rich toward Elohim (God).* The man who says ''I have enough, and possess many things'' (Sirach 11:24) is the one not rich toward Elohim.'),
  ('apocrypha', 'ecclesiasticus', 11, 24, 'canon', '1-timothy', 6, 9, 'free', E'1 Timothy 6:9 — *But they that will be rich fall into temptation and a snare, and into many foolish and hurtful lusts, which drown men in destruction and perdition.* Say not ''I have enough'' presuming on the hereafter (Sirach 11:24) — Paul names the snare that swallows those who will be rich.'),
  ('apocrypha', 'ecclesiasticus', 11, 26, 'canon', 'hebrews', 9, 27, 'free', E'Hebrews 9:27 — *And as it is appointed unto men once to die, but after this the judgment:* In the day of death Yahuah rewards a man according to his ways (Sirach 11:26) — appointed once to die, and after, the judgment.'),
  ('apocrypha', 'ecclesiasticus', 11, 28, 'canon', 'ecclesiastes', 7, 1, 'free', E'Ecclesiastes 7:1 — *A good name is better than precious ointment; and the day of death than the day of one’s birth.* Judge none blessed before his death (Sirach 11:28) — Qoheleth too weighs a life by its end, not its outward beginning.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-11-judge-not-by-appearance',
       E'Yahuah seeth not as man seeth — judge not by the outward',
       E'Ben Sira opens the wisdom of the lowly head lifted up and warns against the surface of things: *Commend not a man for his beauty; neither abhor a man for his outward appearance.* (Ecclesiasticus 11:2) — *for the works of Yahuah (God) are wonderful, and his works among men are hidden.* (Ecclesiasticus 11:4) This is the very lesson Samuel learns at the anointing of David: *for man looketh on the outward appearance, but Yahuah (LORD) looketh on the heart.* (1 Samuel 16:7) The honour the world reads off clothing and crowns is reversed in the eyes of Yahuah — *Many kings have sat down upon the ground; and one that was never thought of has worn the crown.* (Ecclesiasticus 11:5) James, the closest NT sibling to this wisdom, sets the same paradox: *Let the brother of low degree rejoice in that he is exalted* (James 1:9), *But the rich, in that he is made low.* (James 1:10) It ain''t new — the Tanakh, the deuterocanon, and the brother of the Messiah all read the heart, not the raiment.',
       sv.verse_id, ev.verse_id, 'extras', 58550
  FROM _session253_sir11_lookup sv, _session253_sir11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=11 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-11-pride-beginning-of-sin',
       E'Exalt not thyself — pride is the beginning of sin',
       E'*Boast not of your clothing and raiment, and exalt not thyself in the day of honour* (Ecclesiasticus 11:4) — and the partridge in the cage names the danger: *so is the heart of the proud; and like as a spy, watcheth he for your fall.* (Ecclesiasticus 11:30) Ben Sira had already laid the root one chapter back: *For pride is the beginning of sin, and he that has it shall pour out abomination* (Ecclesiasticus 10:13), *The beginning of pride is when one departs from Yahuah (God), and his heart is turned away from his Maker.* (Ecclesiasticus 10:12) The whole library agrees — *Pride goeth before destruction, and an haughty spirit before a fall.* (Proverbs 16:18) Self-link the live apocrypha: Sirach 11 is leaning on Sirach 10''s own diagnosis. It ain''t new: from Proverbs to ben Sira, the exalted self is the first stumble.',
       sv.verse_id, ev.verse_id, 'extras', 58553
  FROM _session253_sir11_lookup sv, _session253_sir11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=11 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-11-answer-not-before-hearing',
       E'Understand first, and then rebuke — answer not before you hear',
       E'Ben Sira''s counsel of the tongue: *Blame not before you have examined the truth: understand first, and then rebuke.* (Ecclesiasticus 11:7) — *Answer not before you have heard the cause: neither interrupt men in the midst of their talk.* (Ecclesiasticus 11:8) Proverbs cuts it to the bone: *He that answereth a matter before he heareth it, it is folly and shame unto him.* (Proverbs 18:13) And James, the wisdom-book of the NT, sets the same rule as the mark of a life that hears Elohim: this is the *swift to hear, slow to speak* posture in narrative form. It ain''t new — the discipline of hearing before judging runs Proverbs → Sirach → the Epistle of James unbroken.',
       sv.verse_id, ev.verse_id, 'extras', 58556
  FROM _session253_sir11_lookup sv, _session253_sir11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=11 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-11-labour-not-to-be-rich',
       E'Travail not to be rich — the swift do not win the race',
       E'Against the frantic merchant: *There is one that laboureth, and takes pains, and makes haste, and is so much the more behind.* (Ecclesiasticus 11:11) — for *the eye of Yahuah (God) looked upon him for good, and set him up from his low estate.* (Ecclesiasticus 11:12) Proverbs commands it plainly: *Labour not to be rich: cease from thine own wisdom* (Proverbs 23:4), and warns *he that maketh haste to be rich shall not be innocent.* (Proverbs 28:20) Qoheleth saw the same under the sun: *the race is not to the swift, nor the battle to the strong... but time and chance happeneth to them all.* (Ecclesiastes 9:11) And the gathering of the increase is not the strong arm but the building hand of Yahuah: *Except Yahuah (LORD) build the house, they labour in vain that build it.* (Psalm 127:1) It ain''t new — the wisdom books refuse the cult of hustle.',
       sv.verse_id, ev.verse_id, 'extras', 58559
  FROM _session253_sir11_lookup sv, _session253_sir11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=11 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-11-promotion-from-yahuah',
       E'Life and death come of Yahuah — promotion is His to give',
       E'The hinge of the chapter: *Prosperity and adversity, life and death, poverty and riches, come of Yahuah (God).* (Ecclesiasticus 11:14) — *for it is an easy thing in the sight of Yahuah (God) on the sudden to make a poor man rich.* (Ecclesiasticus 11:21) The Psalm names the same Judge who alone promotes: *For promotion cometh neither from the east, nor from the west, nor from the south.* (Psalm 75:6), *But Elohim (God) is the judge: he putteth down one, and setteth up another.* (Psalm 75:7) Moses had warned the wealthy heart against forgetting it: *thou shalt remember Yahuah Elohayka (the LORD thy God): for it is he that giveth thee power to get wealth.* (Deuteronomy 8:18) And James, the Sirach of the NT, traces every good thing to the same source: *Every good gift and every perfect gift is from above, and cometh down from the Father of lights.* (James 1:17) It ain''t new — the lifting up and casting down is Yahuah''s alone.',
       sv.verse_id, ev.verse_id, 'extras', 58562
  FROM _session253_sir11_lookup sv, _session253_sir11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=11 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-11-rich-fool-remember-death',
       E'Say not, I have enough — remember the day of death',
       E'Ben Sira draws the rich man who has stored up and never reckons his end: *Whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die.* (Ecclesiasticus 11:19) — *Again, say not, I have enough, and possess many things, and what evil shall I have hereafter?* (Ecclesiasticus 11:24) Yahusha tells this exact parable: *Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry* — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee.* (Luke 12:20), *So is he that layeth up treasure for himself, and is not rich toward Elohim (God).* (Luke 12:21) James fires the same warning: *Go to now, ye rich men, weep and howl for your miseries that shall come upon you.* (James 5:1) For the end is appointed — *it is an easy thing to Yahuah (God) in the day of death to reward a man according to his ways* (Ecclesiasticus 11:26) — *And as it is appointed unto men once to die, but after this the judgment.* (Hebrews 9:27) Judge none blessed before his death. It ain''t new — the rich fool of Luke 12 was already standing in Sirach 11.',
       sv.verse_id, ev.verse_id, 'extras', 58565
  FROM _session253_sir11_lookup sv, _session253_sir11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=11 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-11-judge-not-by-appearance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 16:7 — *But Yahuah (LORD) said unto Samuel, Look not on his countenance, or on the height of his stature; because I have refused him: for Yahuah (LORD) seeth not as man seeth; for man looketh on the outward appearance, but Yahuah (LORD) looketh on the heart.* The Tanakh''s anchor for Sirach 11:2 — abhor not a man by his outward appearance, for Yahuah weighs the heart.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-judge-not-by-appearance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:9 — *Let the brother of low degree rejoice in that he is exalted:* James echoes Sirach 11:5''s reversal — the unregarded man wears the crown, the brother of low degree is the one exalted.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-judge-not-by-appearance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:10 — *But the rich, in that he is made low: because as the flower of the grass he shall pass away.* The mighty greatly disgraced and the honourable delivered up (Sirach 11:6) is James''s fading flower of the rich.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-judge-not-by-appearance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-11-pride-beginning-of-sin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiasticus 10:13 — *For pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly.* Ben Sira self-links: the warning not to exalt thyself in the day of honour (11:4) rests on his own root-diagnosis that pride is the beginning of sin.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-pride-beginning-of-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 10:12 — *The beginning of pride is when one departs from Yahuah (God), and his heart is turned away from his Maker.* The proud heart that watcheth for your fall (11:30) is the heart already turned away from its Maker.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-pride-beginning-of-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=30
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* Proverbs gives the proverb behind Sirach 11:4''s warning not to exalt thyself in the day of honour.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-pride-beginning-of-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-11-answer-not-before-hearing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 18:13 — *He that answereth a matter before he heareth it, it is folly and shame unto him.* The exact proverb Sirach 11:8 expands — answer not before you have heard the cause.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-answer-not-before-hearing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 12:14 — *And he said unto him, Man, who made me a judge or a divider over you?* Yahusha himself keeps Sirach 11:9''s rule — strive not in a matter that concerneth you not, sit not in judgment uninvited.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-answer-not-before-hearing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-11-labour-not-to-be-rich
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 23:4 — *Labour not to be rich: cease from thine own wisdom.* The Tanakh command Sirach 11:11 dramatizes — he that makes haste is the more behind.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-labour-not-to-be-rich'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 9:11 — *I returned, and saw under the sun, that the race is not to the swift, nor the battle to the strong, neither yet bread to the wise, nor yet riches to men of understanding, nor yet favour to men of skill; but time and chance happeneth to them all.* Qoheleth''s word for Sirach 11:11 — the one who makes haste is so much the more behind, for the race is not to the swift.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-labour-not-to-be-rich'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 28:20 — *A faithful man shall abound with blessings: but he that maketh haste to be rich shall not be innocent.* Meddle much and you shall not be innocent (Sirach 11:10) is Proverbs'' own verdict on the hasty.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-labour-not-to-be-rich'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=28 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 127:1 — *Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain.* The eye of Yahuah that sets a man up from low estate (Sirach 11:12) — apart from that building hand all the labour is vain.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-labour-not-to-be-rich'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=127 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-11-promotion-from-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 75:7 — *But Elohim (God) is the judge: he putteth down one, and setteth up another.* The Psalm''s word for Sirach 11:14 — prosperity and adversity, poverty and riches, all come of Yahuah who alone sets up and casts down.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-promotion-from-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=75 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 75:6 — *For promotion cometh neither from the east, nor from the west, nor from the south.* Life and death and riches come of Yahuah (Sirach 11:14), not from any quarter of the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-promotion-from-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=75 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 8:18 — *But thou shalt remember Yahuah Elohayka (the LORD thy God): for it is he that giveth thee power to get wealth, that he may establish his covenant which he sware unto thy fathers, as it is this day.* Yahuah makes a poor man rich on the sudden (Sirach 11:21) — Moses anchors it: it is He that giveth power to get wealth.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-promotion-from-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 1:17 — *Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning.* The gift and favour of Yahuah (Sirach 11:17) is James''s every good and perfect gift from the Father of lights.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-promotion-from-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-11-rich-fool-remember-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* Yahusha''s rich fool is Sirach 11:19 verbatim — he says he will eat continually of his goods, yet must leave them to others and die.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-rich-fool-remember-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 12:21 — *So is he that layeth up treasure for himself, and is not rich toward Elohim (God).* The man who says ''I have enough, and possess many things'' (Sirach 11:24) is the one not rich toward Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-rich-fool-remember-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 6:9 — *But they that will be rich fall into temptation and a snare, and into many foolish and hurtful lusts, which drown men in destruction and perdition.* Say not ''I have enough'' presuming on the hereafter (Sirach 11:24) — Paul names the snare that swallows those who will be rich.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-rich-fool-remember-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 9:27 — *And as it is appointed unto men once to die, but after this the judgment:* In the day of death Yahuah rewards a man according to his ways (Sirach 11:26) — appointed once to die, and after, the judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-rich-fool-remember-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiastes 7:1 — *A good name is better than precious ointment; and the day of death than the day of one’s birth.* Judge none blessed before his death (Sirach 11:28) — Qoheleth too weighs a life by its end, not its outward beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-rich-fool-remember-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

