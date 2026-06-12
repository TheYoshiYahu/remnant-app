-- ----- fragment: minion_1adameve_78.sql (session253 1-adam-eve 78) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch78. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae78 (view _session253_1ae78_lookup). Sort band base 65925, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae78_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-78-satan-tempts-cain
  ('adam-eve-conflict', '1-adam-eve', 78, 6, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan coming to Cain in 78:6 is the serpent''s enmity carried into the second generation, striking now at the seed through the elder brother.'),
  ('adam-eve-conflict', '1-adam-eve', 78, 6, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The disguise of a beautiful man of the field bearing gold and a garden in 78:6-9 is the deceiver''s signature transformation.'),
  ('adam-eve-conflict', '1-adam-eve', 78, 11, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* When Cain opens his ears to Satan''s speech in 78:11 he is leaning toward the father of lies, who will make him the first murderer.'),
  -- thread: 1-adam-eve-78-cain-strikes-his-mother
  ('adam-eve-conflict', '1-adam-eve', 78, 12, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Cain striking and cursing his own mother in 78:12 is the adversary already devouring the household through the son he has lured.'),
  ('adam-eve-conflict', '1-adam-eve', 78, 12, 'canon', 'matthew', 5, 22, 'free', E'Matthew 5:22 — *But I say unto you, That whosoever is angry with his brother without a cause shall be in danger of the judgment: and whosoever shall say to his brother, Raca, shall be in danger of the council: but whosoever shall say, Thou fool, shall be in danger of hell fire.* Cain''s rage in 78:12 is the very anger Yahusha names as the root from which the murder of 78 will grow.'),
  ('adam-eve-conflict', '1-adam-eve', 78, 12, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Cain''s violent rising against his mother in 78:12 shows his works already evil, of the wicked one, before ever he strikes Abel.'),
  -- thread: 1-adam-eve-78-two-offerings-divine-fire
  ('adam-eve-conflict', '1-adam-eve', 78, 22, 'canon', 'genesis', 4, 4, 'free', E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* The divine fire consuming Abel''s gift in 78:22 is the same respect Yahuah shows the firstlings of Abel''s flock.'),
  ('adam-eve-conflict', '1-adam-eve', 78, 20, 'canon', 'genesis', 4, 5, 'free', E'Genesis 4:5 — *But unto Cain and to his offering he had not respect. And Cain was very wroth, and his countenance fell.* Elohim refusing Cain''s gift with no fire coming down in 78:20 is exactly this withholding of respect that left Cain wroth.'),
  ('adam-eve-conflict', '1-adam-eve', 78, 22, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* Abel''s humble, guile-free offering accepted by fire in 78:22 is the more excellent sacrifice of faith the apostle commends.'),
  ('adam-eve-conflict', '1-adam-eve', 78, 22, 'jasher', 'jasher', 1, 15, 'extras', E'Jasher 1:15 — *And it was at the expiration of a few years, that they brought an approximating offering to Yahuah (the Lord), and Cain brought from the fruit of the ground, and Abel brought from the firstlings of his flock from the fat of it, and Elohim turned and inclined to Abel and his offering, and a fire came down from Yahuah (the Lord) from heaven and consumed it.* Jasher names the same heavenly fire that descends and consumes Abel''s offering in 78:22.'),
  ('adam-eve-conflict', '1-adam-eve', 78, 20, 'jubilees', 'jubilees', 4, 2, 'extras', E'Jubilees 4:2 — *And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* Jubilees gives the same rejected-versus-accepted offering of 78:20-22 as the very cause of the murder to come.'),
  -- thread: 1-adam-eve-78-rebuke-and-the-two-seed-lines
  ('adam-eve-conflict', '1-adam-eve', 78, 26, 'canon', 'genesis', 4, 7, 'free', E'Genesis 4:7 — *If thou doest well, shalt thou not be accepted? and if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him.* Yahuah''s plea to Cain to be righteous that his offering be accepted in 78:26 is this same open door before the sin that lies waiting.'),
  ('adam-eve-conflict', '1-adam-eve', 78, 23, 'canon', '1-john', 3, 10, 'free', E'1 John 3:10 — *In this the children of Elohim (God) are manifest, and the children of the devil: whosoever doeth not righteousness is not of Elohim (God), neither he that loveth not his brother.* The angel of light comforting righteous Abel while Cain blasphemes in 78:23-25 makes the two seed-lines manifest just as John divides them.'),
  ('adam-eve-conflict', '1-adam-eve', 78, 23, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The TRUE angel of light sent to comfort righteous Abel in 78:23 throws into relief the counterfeit light Satan put on for Cain in 78:6 — the same form, opposite source.'),
  -- thread: 1-adam-eve-78-lured-into-the-field
  ('adam-eve-conflict', '1-adam-eve', 78, 36, 'canon', 'genesis', 4, 8, 'free', E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* Abel consenting to go with Cain into the field in 78:36, with Cain talking to comfort him, is the very setting Genesis gives for the murder.'),
  ('adam-eve-conflict', '1-adam-eve', 78, 32, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Satan stoking Cain''s envy because Abel is favored in 78:32-35 is exactly why John says Cain slew him: his works evil, his brother''s righteous.'),
  ('adam-eve-conflict', '1-adam-eve', 78, 33, 'jasher', 'jasher', 1, 16, 'extras', E'Jasher 1:16 — *And to Cain and his offering Yahuah (the Lord) did not turn, and he did not incline to it, for he had brought from the inferior fruit of the ground before Yahuah (the Lord), and Cain was jealous against his brother Abel on account of this, and he sought a pretext to slay him.* Cain laying wait to kill his brother in 78:33 is the very pretext-seeking jealousy Jasher records.'),
  ('adam-eve-conflict', '1-adam-eve', 78, 36, 'jasher', 'jasher', 1, 17, 'extras', E'Jasher 1:17 — *And in some time after, Cain and Abel his brother, went one day into the field to do their work; and they were both in the field, Cain tilling and ploughing his ground, and Abel feeding his flock; and the flock passed that part which Cain had ploughed in the ground, and it sorely grieved Cain on this account.* The brothers going together into the field in 78:36 matches Jasher''s account of the fatal day in the field.'),
  ('adam-eve-conflict', '1-adam-eve', 78, 38, 'canon', 'hebrews', 12, 24, 'free', E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* Abel standing in his innocence in 78:38, about to be slain, is the righteous one whose crying blood points forward to the better-speaking blood of the Mediator.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae78_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae78_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-78-satan-tempts-cain',
       E'Satan, in the figure of a man, comes to tempt Cain',
       E'Adam takes counsel to wed the children, but Eve marks the danger in the elder: *I do not like Cain because he is hard-hearted; but let them stay with us until we offer up to Yahuah (Lord) in their behalf.* (1 Adam and Eve 78:4) — and at once the enemy moves on the hard-hearted son: *Meanwhile Satan came to Cain in the figure of a man of the field* (78:6), offering robes, *gold and silver in plenty*, and a garden *in the north* (78:7-9). It ain''t new: this is the serpent of the garden striking again at the seed of the woman, the same enmity Yahuah set from the first day — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15) The shape is the tell — *Satan himself is transformed into an angel of light.* (2 Corinthians 11:14) — a man of the field, a kind voice, a false garden. The same liar who deceived Eve now opens Cain''s ears: *He was a murderer from the beginning, and abode not in the truth, because there is no truth in him.* (John 8:44)',
       sv.verse_id, ev.verse_id, 'extras', 65925
  FROM _session253_1ae78_lookup sv, _session253_1ae78_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=78 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-78-cain-strikes-his-mother',
       E'The deception bears fruit — Cain beats and curses Eve',
       E'The enemy''s words do their work the moment they are received: *And he did not remain in the field, but he went to Eve, his mother, and beat her, and cursed her* (1 Adam and Eve 78:12). The deceiver''s first harvest in a man is violence against his own household — the lion does not roar from far off but devours from within: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8). This is the murderer''s spirit already moving, the works of the wicked one in the firstborn son: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* (1 John 3:12) The Master named the chain exactly — anger at a brother is the seed of which murder is the fruit: *whosoever is angry with his brother without a cause shall be in danger of the judgment.* (Matthew 5:22)',
       sv.verse_id, ev.verse_id, 'extras', 65928
  FROM _session253_1ae78_lookup sv, _session253_1ae78_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=12
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=78 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-78-two-offerings-divine-fire',
       E'The two offerings — Cain rejected, Abel accepted by divine fire',
       E'Two brothers bring their gifts, and the hearts are weighed: Cain offers *with a proud heart, full of guile, and fraud* (1 Adam and Eve 78:18) while Abel offers *with a heart humble and free from guile* (78:19), and the verdict falls from heaven — *a divine fire came down and consumed his offering. And Elohim (God) smelled the sweet savor of his offering; because Abel loved Him* (78:22). This is Genesis told whole: *And Yahuah (LORD) had respect unto Abel and to his offering: But unto Cain and to his offering he had not respect* (Genesis 4:4-5). The apostle reads it as the first witness of faith — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh* (Hebrews 11:4). The restored books agree on the fire and the cause: *Elohim turned and inclined to Abel and his offering, and a fire came down from Yahuah (the Lord) from heaven and consumed it* (Jasher 1:15), *Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain* (Jubilees 4:2).',
       sv.verse_id, ev.verse_id, 'extras', 65931
  FROM _session253_1ae78_lookup sv, _session253_1ae78_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=18
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=78 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-78-rebuke-and-the-two-seed-lines',
       E'Elohim''s rebuke of Cain, and the angel of light sent to Abel',
       E'When Cain blasphemes over the unaccepted gift, Yahuah does not strike but pleads with him: *Why do you look sad? Be righteous, that I may accept your offering. Not against Me have you murmured, but against yourself* (1 Adam and Eve 78:26). This is the very mercy of Genesis — *If thou doest well, shalt thou not be accepted? and if thou doest not well, sin lieth at the door* (Genesis 4:7) — the door still open to repentance even now. But the two seed-lines are already parting at the altar: Abel the righteous is comforted, *He sent him an angel of light in the figure of a man... and they comforted Abel and strengthened his heart* (78:23), while Cain hardens. So John divides the whole race by this hour: *In this the children of Elohim (God) are manifest, and the children of the devil: whosoever doeth not righteousness is not of Elohim (God), neither he that loveth not his brother* (1 John 3:10). Mark well that this true angel of light *in the figure of a man* (78:23) is sent of Yahuah to the righteous — the counterfeit Satan-as-light (78:6) preys only on the unrighteous heart.',
       sv.verse_id, ev.verse_id, 'extras', 65934
  FROM _session253_1ae78_lookup sv, _session253_1ae78_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=23
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=78 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-78-lured-into-the-field',
       E'Satan''s second assault, and the brother lured into the field',
       E'The enemy returns to fan the embers: *Satan came to him and said... they have kissed his face, and they rejoice over him, far more than over you* (1 Adam and Eve 78:32), and Cain, *filled with rage*, lays wait, coaxing his brother with sweet words — *you are righteous, and I love you much, O my brother!* (78:35) — into the field: *Then Abel consented to go with his brother Cain into the field* (78:36), *Cain talking to him, and comforting him, to make him forget everything* (78:39). It ain''t new: *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him* (Genesis 4:8). The restored chronicle tells the same lured walk and the pretext sought — *Cain was jealous against his brother Abel on account of this, and he sought a pretext to slay him* (Jasher 1:16); *And in some time after, Cain and Abel his brother, went one day into the field to do their work* (Jasher 1:17). Yet Abel''s blood, soon spilt, is not silenced but pleads — and points forward to a better blood: *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel* (Hebrews 12:24).',
       sv.verse_id, ev.verse_id, 'extras', 65937
  FROM _session253_1ae78_lookup sv, _session253_1ae78_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=32
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=78 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-78-satan-tempts-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan coming to Cain in 78:6 is the serpent''s enmity carried into the second generation, striking now at the seed through the elder brother.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae78_lookup sv, _session253_1ae78_lookup tv
 WHERE t.slug='1-adam-eve-78-satan-tempts-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The disguise of a beautiful man of the field bearing gold and a garden in 78:6-9 is the deceiver''s signature transformation.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae78_lookup sv, _session253_1ae78_lookup tv
 WHERE t.slug='1-adam-eve-78-satan-tempts-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* When Cain opens his ears to Satan''s speech in 78:11 he is leaning toward the father of lies, who will make him the first murderer.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae78_lookup sv, _session253_1ae78_lookup tv
 WHERE t.slug='1-adam-eve-78-satan-tempts-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-78-cain-strikes-his-mother
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Cain striking and cursing his own mother in 78:12 is the adversary already devouring the household through the son he has lured.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae78_lookup sv, _session253_1ae78_lookup tv
 WHERE t.slug='1-adam-eve-78-cain-strikes-his-mother'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 5:22 — *But I say unto you, That whosoever is angry with his brother without a cause shall be in danger of the judgment: and whosoever shall say to his brother, Raca, shall be in danger of the council: but whosoever shall say, Thou fool, shall be in danger of hell fire.* Cain''s rage in 78:12 is the very anger Yahusha names as the root from which the murder of 78 will grow.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae78_lookup sv, _session253_1ae78_lookup tv
 WHERE t.slug='1-adam-eve-78-cain-strikes-his-mother'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Cain''s violent rising against his mother in 78:12 shows his works already evil, of the wicked one, before ever he strikes Abel.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae78_lookup sv, _session253_1ae78_lookup tv
 WHERE t.slug='1-adam-eve-78-cain-strikes-his-mother'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-78-two-offerings-divine-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* The divine fire consuming Abel''s gift in 78:22 is the same respect Yahuah shows the firstlings of Abel''s flock.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae78_lookup sv, _session253_1ae78_lookup tv
 WHERE t.slug='1-adam-eve-78-two-offerings-divine-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:5 — *But unto Cain and to his offering he had not respect. And Cain was very wroth, and his countenance fell.* Elohim refusing Cain''s gift with no fire coming down in 78:20 is exactly this withholding of respect that left Cain wroth.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae78_lookup sv, _session253_1ae78_lookup tv
 WHERE t.slug='1-adam-eve-78-two-offerings-divine-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* Abel''s humble, guile-free offering accepted by fire in 78:22 is the more excellent sacrifice of faith the apostle commends.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae78_lookup sv, _session253_1ae78_lookup tv
 WHERE t.slug='1-adam-eve-78-two-offerings-divine-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 1:15 — *And it was at the expiration of a few years, that they brought an approximating offering to Yahuah (the Lord), and Cain brought from the fruit of the ground, and Abel brought from the firstlings of his flock from the fat of it, and Elohim turned and inclined to Abel and his offering, and a fire came down from Yahuah (the Lord) from heaven and consumed it.* Jasher names the same heavenly fire that descends and consumes Abel''s offering in 78:22.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae78_lookup sv, _session253_1ae78_lookup tv
 WHERE t.slug='1-adam-eve-78-two-offerings-divine-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=22
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 4:2 — *And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* Jubilees gives the same rejected-versus-accepted offering of 78:20-22 as the very cause of the murder to come.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae78_lookup sv, _session253_1ae78_lookup tv
 WHERE t.slug='1-adam-eve-78-two-offerings-divine-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=20
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-78-rebuke-and-the-two-seed-lines
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:7 — *If thou doest well, shalt thou not be accepted? and if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him.* Yahuah''s plea to Cain to be righteous that his offering be accepted in 78:26 is this same open door before the sin that lies waiting.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae78_lookup sv, _session253_1ae78_lookup tv
 WHERE t.slug='1-adam-eve-78-rebuke-and-the-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:10 — *In this the children of Elohim (God) are manifest, and the children of the devil: whosoever doeth not righteousness is not of Elohim (God), neither he that loveth not his brother.* The angel of light comforting righteous Abel while Cain blasphemes in 78:23-25 makes the two seed-lines manifest just as John divides them.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae78_lookup sv, _session253_1ae78_lookup tv
 WHERE t.slug='1-adam-eve-78-rebuke-and-the-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The TRUE angel of light sent to comfort righteous Abel in 78:23 throws into relief the counterfeit light Satan put on for Cain in 78:6 — the same form, opposite source.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae78_lookup sv, _session253_1ae78_lookup tv
 WHERE t.slug='1-adam-eve-78-rebuke-and-the-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-78-lured-into-the-field
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* Abel consenting to go with Cain into the field in 78:36, with Cain talking to comfort him, is the very setting Genesis gives for the murder.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae78_lookup sv, _session253_1ae78_lookup tv
 WHERE t.slug='1-adam-eve-78-lured-into-the-field'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Satan stoking Cain''s envy because Abel is favored in 78:32-35 is exactly why John says Cain slew him: his works evil, his brother''s righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae78_lookup sv, _session253_1ae78_lookup tv
 WHERE t.slug='1-adam-eve-78-lured-into-the-field'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jasher 1:16 — *And to Cain and his offering Yahuah (the Lord) did not turn, and he did not incline to it, for he had brought from the inferior fruit of the ground before Yahuah (the Lord), and Cain was jealous against his brother Abel on account of this, and he sought a pretext to slay him.* Cain laying wait to kill his brother in 78:33 is the very pretext-seeking jealousy Jasher records.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae78_lookup sv, _session253_1ae78_lookup tv
 WHERE t.slug='1-adam-eve-78-lured-into-the-field'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=33
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 1:17 — *And in some time after, Cain and Abel his brother, went one day into the field to do their work; and they were both in the field, Cain tilling and ploughing his ground, and Abel feeding his flock; and the flock passed that part which Cain had ploughed in the ground, and it sorely grieved Cain on this account.* The brothers going together into the field in 78:36 matches Jasher''s account of the fatal day in the field.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae78_lookup sv, _session253_1ae78_lookup tv
 WHERE t.slug='1-adam-eve-78-lured-into-the-field'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=36
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* Abel standing in his innocence in 78:38, about to be slain, is the righteous one whose crying blood points forward to the better-speaking blood of the Mediator.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae78_lookup sv, _session253_1ae78_lookup tv
 WHERE t.slug='1-adam-eve-78-lured-into-the-field'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=78 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

