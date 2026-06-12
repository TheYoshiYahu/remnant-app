-- ----- fragment: minion_thewisdomofsolomon_06.sql (session253 the-wisdom-of-solomon 6) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis06 (view _session253_wis06_lookup). Sort band base 58125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-6-powers-ordained
  ('apocrypha', 'the-wisdom-of-solomon', 6, 3, 'canon', 'romans', 13, 1, 'free', E'Romans 13:1 — *Let every soul be subject unto the higher powers. For there is no power but of God: the powers that be are ordained of God.* Sha''ul echoes Wisdom of Solomon 6:3 — every authority is a delegated stewardship granted of Yahuah, never self-owned.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 3, 'canon', 'daniel', 2, 21, 'free', E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding.* The same Giver of sovereignty in Wisdom of Solomon 6:3 is the One who removes kings and bestows wisdom on the ruler who seeks it.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 4, 'canon', 'psalms', 66, 7, 'free', E'Psalm 66:7 — *He ruleth by his power for ever; his eyes behold the nations: let not the rebellious exalt themselves. Selah.* The ministers of His kingdom in Wisdom of Solomon 6:4 who kept not the law are the rebellious whom the all-beholding King will not let exalt themselves.'),
  -- thread: wisdom-6-mighty-mightily-tormented
  ('apocrypha', 'the-wisdom-of-solomon', 6, 7, 'canon', 'deuteronomy', 1, 17, 'free', E'Deuteronomy 1:17 — *Ye shall not respect persons in judgment; but ye shall hear the small as well as the great; ye shall not be afraid of the face of man: for the judgment is God''s: and the cause that is too hard for you, bring it unto me, and I will hear it.* Wisdom of Solomon 6:7 voices the Torah''s own rule that the Judge who made small and great fears no man''s greatness.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 7, 'canon', 'romans', 2, 11, 'free', E'Romans 2:11 — *For there is no respect of persons with God.* Sha''ul states plainly what Wisdom of Solomon 6:7 declares — the God over all stands in awe of no man''s greatness.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 6, 'canon', '1-peter', 1, 17, 'free', E'1 Peter 1:17 — *And if ye call on the Father, who without respect of persons judgeth according to every man''s work, pass the time of your sojourning here in fear.* The strict reckoning of the mighty in Wisdom of Solomon 6:6 is Kepha''s impartial Father judging every man''s work.'),
  -- thread: wisdom-6-be-wise-o-kings
  ('apocrypha', 'the-wisdom-of-solomon', 6, 9, 'canon', 'psalms', 2, 10, 'free', E'Psalm 2:10 — *Be wise now therefore, O ye kings: be instructed, ye judges of the earth.* Wisdom of Solomon 6:9 speaks the second Psalm''s very summons — the kings and judges of the earth called to learn wisdom and not fall away.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 21, 'canon', 'psalms', 2, 12, 'free', E'Psalm 2:12 — *Kiss the Son, lest he be angry, and ye perish from the way, when his wrath is kindled but a little. Blessed are all they that put their trust in him.* Honouring wisdom that the kings may reign for evermore (Wisdom of Solomon 6:21) is the Psalm''s homage to the Son that the rulers perish not.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 9, 'canon', '1-kings', 3, 12, 'free', E'1 Kings 3:12 — *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee, neither after thee shall any arise like unto thee.* Solomon''s charge to kings in Wisdom of Solomon 6:9 flows from his own throne, granted because he asked for wisdom and not power.'),
  -- thread: wisdom-6-she-is-found-of-them-that-seek
  ('apocrypha', 'the-wisdom-of-solomon', 6, 14, 'canon', 'proverbs', 8, 17, 'free', E'Proverbs 8:17 — *I love them that love me; and those that seek me early shall find me.* The Formed Wisdom of Proverbs speaks in her own voice the promise of Wisdom of Solomon 6:14 — she is found by them that seek her early.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 12, 'canon', 'matthew', 7, 7, 'free', E'Matthew 7:7 — *Ask, and it shall be given you; seek, and ye shall find; knock, and it shall be opened unto you.* The Messiah confirms what Wisdom of Solomon 6:12 declares — wisdom is found of such as seek her.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 12, 'canon', 'jeremiah', 29, 13, 'free', E'Jeremiah 29:13 — *And ye shall seek me, and find me, when ye shall search for me with all your heart.* The covenant promise that wisdom is found of such as seek her (Wisdom of Solomon 6:12) is Yahuah''s own pledge to the whole-hearted searcher.'),
  -- thread: wisdom-6-beginning-of-wisdom-keeping-laws
  ('apocrypha', 'the-wisdom-of-solomon', 6, 18, 'canon', 'john', 14, 15, 'free', E'John 14:15 — *If ye love me, keep my commandments.* The Messiah defines love precisely as Wisdom of Solomon 6:18 does — *love is the keeping of her laws* — obedience, not mere affection.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 17, 'canon', 'proverbs', 9, 10, 'free', E'Proverbs 9:10 — *The fear of the LORD is the beginning of wisdom: and the knowledge of the holy is understanding.* The desire of discipline that is the *very true beginning* of wisdom in Wisdom of Solomon 6:17 is the fear of Yahuah that Proverbs names as wisdom''s start.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 17, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of the LORD is the beginning of knowledge: but fools despise wisdom and instruction.* Wisdom''s beginning in the desire of discipline (Wisdom of Solomon 6:17) answers Proverbs'' opening axiom — the fear of Yahuah is where knowledge begins.'),
  ('apocrypha', 'the-wisdom-of-solomon', 6, 19, 'canon', '1-corinthians', 15, 53, 'free', E'1 Corinthians 15:53 — *For this corruptible must put on incorruption, and this mortal must put on immortality.* The *assurance of incorruption* that draws us near to Elohim in Wisdom of Solomon 6:19 is Sha''ul''s promise that the corruptible puts on incorruption.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-6-powers-ordained',
       E'Power is given you of Yahuah — the rulers who must answer',
       E'Solomon turns to the thrones of the earth: *For power is given you of Yahuah (God), and sovereignty from the Highest, who shall try your works, and search out your counsels.* (Wisdom of Solomon 6:3). Every crown is a delegated crown, held in trust and audited from above. Sha''ul says the same to Rome: *Let every soul be subject unto the higher powers. For there is no power but of God: the powers that be are ordained of God.* (Romans 13:1) — authority is real, but it is derived, never sovereign in itself. Daniel had already announced the Giver who is also the Remover: *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding.* (Daniel 2:21). And the same hand that grants the throne measures the king who *kept not the law*: *He ruleth by his power for ever; his eyes behold the nations: let not the rebellious exalt themselves.* (Psalm 66:7). The deuterocanon carries the covenant order: power is loaned, and the lender keeps account.',
       sv.verse_id, ev.verse_id, 'extras', 58125
  FROM _session253_wis06_lookup sv, _session253_wis06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=6 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-6-mighty-mightily-tormented',
       E'The mighty shall be mightily tormented — no respecter of persons',
       E'The judgment falls heaviest on the high: *For mercy will soon pardon the meanest: but mighty men shall be mightily tormented.* (Wisdom of Solomon 6:6) — *For he which is Yahuah (God) over all shall fear no man''s person, neither shall he stand in awe of any man''s greatness: for he has made the small and great, and careth for all alike.* (Wisdom of Solomon 6:7). The Torah already wrote this impartiality into the bench: *Ye shall not respect persons in judgment; but ye shall hear the small as well as the great; ye shall not be afraid of the face of man: for the judgment is God''s.* (Deuteronomy 1:17). Kepha carries it into the assembly: *And if ye call on the Father, who without respect of persons judgeth according to every man''s work, pass the time of your sojourning here in fear.* (1 Peter 1:17). And Sha''ul seals it: *For there is no respect of persons with God.* (Romans 2:11). It ain''t new — the King who made small and great alike judges them by one weight.',
       sv.verse_id, ev.verse_id, 'extras', 58128
  FROM _session253_wis06_lookup sv, _session253_wis06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-6-be-wise-o-kings',
       E'To you, O kings — be wise and fall not away',
       E'The address to the throne is an altar call to power itself: *To you therefore, O kings, do I speak, that you may learn wisdom, and not fall away.* (Wisdom of Solomon 6:9) — *If your delight be then in thrones and sceptres, O you kings of the people, honour wisdom, that you may reign for evermore.* (Wisdom of Solomon 6:21). This is the second Psalm preached to the rulers: *Be wise now therefore, O ye kings: be instructed, ye judges of the earth.* (Psalm 2:10) — *Kiss the Son, lest he be angry, and ye perish from the way, when his wrath is kindled but a little. Blessed are all they that put their trust in him.* (Psalm 2:12). Solomon''s own throne came of this very asking: *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee.* (1 Kings 3:12). The crown that delights in wisdom is the crown that reigns for evermore.',
       sv.verse_id, ev.verse_id, 'extras', 58131
  FROM _session253_wis06_lookup sv, _session253_wis06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=6 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-6-she-is-found-of-them-that-seek',
       E'Found of such as seek her — wisdom meets the early seeker',
       E'Wisdom is not hidden from the heart that wants her: *Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her.* (Wisdom of Solomon 6:12) — *Whoso seeks her early shall have no great travail: for he shall find her sitting at his doors.* (Wisdom of Solomon 6:14). The Formed Wisdom of Proverbs says it of herself: *I love them that love me; and those that seek me early shall find me.* (Proverbs 8:17). The Messiah confirms the promise to every seeker: *Ask, and it shall be given you; seek, and ye shall find; knock, and it shall be opened unto you.* (Matthew 7:7). And the covenant terms hold across the testaments: *And ye shall seek me, and find me, when ye shall search for me with all your heart.* (Jeremiah 29:13). She sits at the door of the one who rises early to look — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58134
  FROM _session253_wis06_lookup sv, _session253_wis06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-6-beginning-of-wisdom-keeping-laws',
       E'The desire of discipline — love is the keeping of her laws',
       E'Solomon traces wisdom back to her root, and the root is obedience: *For the very true beginning of her is the desire of discipline; and the care of discipline is love; And love is the keeping of her laws; and the giving heed to her laws is the assurance of incorruption; And incorruption makes us near to Yahuah (God).* (Wisdom of Solomon 6:17-19). The fear of Yahuah opens that whole chain: *The fear of the LORD is the beginning of knowledge: but fools despise wisdom and instruction.* (Proverbs 1:7) — *The fear of the LORD is the beginning of wisdom: and the knowledge of the holy is understanding.* (Proverbs 9:10). And the Messiah defines love exactly as Solomon does — not feeling but keeping: *If ye love me, keep my commandments.* (John 14:15). Torah stands: love IS the keeping of her laws, and that keeping draws us near to Elohim and toward incorruption.',
       sv.verse_id, ev.verse_id, 'extras', 58137
  FROM _session253_wis06_lookup sv, _session253_wis06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=6 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-6-powers-ordained
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 13:1 — *Let every soul be subject unto the higher powers. For there is no power but of God: the powers that be are ordained of God.* Sha''ul echoes Wisdom of Solomon 6:3 — every authority is a delegated stewardship granted of Yahuah, never self-owned.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-powers-ordained'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding.* The same Giver of sovereignty in Wisdom of Solomon 6:3 is the One who removes kings and bestows wisdom on the ruler who seeks it.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-powers-ordained'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 66:7 — *He ruleth by his power for ever; his eyes behold the nations: let not the rebellious exalt themselves. Selah.* The ministers of His kingdom in Wisdom of Solomon 6:4 who kept not the law are the rebellious whom the all-beholding King will not let exalt themselves.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-powers-ordained'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=66 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-6-mighty-mightily-tormented
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 1:17 — *Ye shall not respect persons in judgment; but ye shall hear the small as well as the great; ye shall not be afraid of the face of man: for the judgment is God''s: and the cause that is too hard for you, bring it unto me, and I will hear it.* Wisdom of Solomon 6:7 voices the Torah''s own rule that the Judge who made small and great fears no man''s greatness.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-mighty-mightily-tormented'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 2:11 — *For there is no respect of persons with God.* Sha''ul states plainly what Wisdom of Solomon 6:7 declares — the God over all stands in awe of no man''s greatness.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-mighty-mightily-tormented'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:17 — *And if ye call on the Father, who without respect of persons judgeth according to every man''s work, pass the time of your sojourning here in fear.* The strict reckoning of the mighty in Wisdom of Solomon 6:6 is Kepha''s impartial Father judging every man''s work.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-mighty-mightily-tormented'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-6-be-wise-o-kings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:10 — *Be wise now therefore, O ye kings: be instructed, ye judges of the earth.* Wisdom of Solomon 6:9 speaks the second Psalm''s very summons — the kings and judges of the earth called to learn wisdom and not fall away.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-be-wise-o-kings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 2:12 — *Kiss the Son, lest he be angry, and ye perish from the way, when his wrath is kindled but a little. Blessed are all they that put their trust in him.* Honouring wisdom that the kings may reign for evermore (Wisdom of Solomon 6:21) is the Psalm''s homage to the Son that the rulers perish not.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-be-wise-o-kings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 3:12 — *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee, neither after thee shall any arise like unto thee.* Solomon''s charge to kings in Wisdom of Solomon 6:9 flows from his own throne, granted because he asked for wisdom and not power.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-be-wise-o-kings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-6-she-is-found-of-them-that-seek
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 8:17 — *I love them that love me; and those that seek me early shall find me.* The Formed Wisdom of Proverbs speaks in her own voice the promise of Wisdom of Solomon 6:14 — she is found by them that seek her early.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-she-is-found-of-them-that-seek'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:7 — *Ask, and it shall be given you; seek, and ye shall find; knock, and it shall be opened unto you.* The Messiah confirms what Wisdom of Solomon 6:12 declares — wisdom is found of such as seek her.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-she-is-found-of-them-that-seek'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 29:13 — *And ye shall seek me, and find me, when ye shall search for me with all your heart.* The covenant promise that wisdom is found of such as seek her (Wisdom of Solomon 6:12) is Yahuah''s own pledge to the whole-hearted searcher.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-she-is-found-of-them-that-seek'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-6-beginning-of-wisdom-keeping-laws
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 14:15 — *If ye love me, keep my commandments.* The Messiah defines love precisely as Wisdom of Solomon 6:18 does — *love is the keeping of her laws* — obedience, not mere affection.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-beginning-of-wisdom-keeping-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 9:10 — *The fear of the LORD is the beginning of wisdom: and the knowledge of the holy is understanding.* The desire of discipline that is the *very true beginning* of wisdom in Wisdom of Solomon 6:17 is the fear of Yahuah that Proverbs names as wisdom''s start.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-beginning-of-wisdom-keeping-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 1:7 — *The fear of the LORD is the beginning of knowledge: but fools despise wisdom and instruction.* Wisdom''s beginning in the desire of discipline (Wisdom of Solomon 6:17) answers Proverbs'' opening axiom — the fear of Yahuah is where knowledge begins.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-beginning-of-wisdom-keeping-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 15:53 — *For this corruptible must put on incorruption, and this mortal must put on immortality.* The *assurance of incorruption* that draws us near to Elohim in Wisdom of Solomon 6:19 is Sha''ul''s promise that the corruptible puts on incorruption.'
  FROM cross_reference_threads t, cross_references x, _session253_wis06_lookup sv, _session253_wis06_lookup tv
 WHERE t.slug='wisdom-6-beginning-of-wisdom-keeping-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=53
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

