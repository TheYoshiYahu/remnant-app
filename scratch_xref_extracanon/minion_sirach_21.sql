-- ----- fragment: minion_ecclesiasticus_21.sql (session253 ecclesiasticus 21) -----
-- Source anchor: apocrypha/ecclesiasticus ch21. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir21 (view _session253_sir21_lookup). Sort band base 58800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-21-flee-sin-as-a-serpent
  ('apocrypha', 'ecclesiasticus', 21, 2, 'canon', 'proverbs', 23, 32, 'free', E'Proverbs 23:32 — *At the last it biteth like a serpent, and stingeth like an adder.* The same serpent-bite figure Ben Sira uses for sin (Ecclesiasticus 21:2).'),
  ('apocrypha', 'ecclesiasticus', 21, 2, 'canon', 'genesis', 4, 7, 'free', E'Genesis 4:7 — *If thou doest well, shalt thou not be accepted? and if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him.* The crouching sin Ben Sira bids us flee is the very beast the LORD set Cain to master (Ecclesiasticus 21:2).'),
  ('apocrypha', 'ecclesiasticus', 21, 2, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The way to flee the serpent Ben Sira describes (Ecclesiasticus 21:2).'),
  ('apocrypha', 'ecclesiasticus', 21, 1, 'canon', 'proverbs', 9, 6, 'free', E'Proverbs 9:6 — *Forsake the foolish, and live; and go in the way of understanding.* The turn-and-sin-no-more wisdom of Ben Sira''s opening call (Ecclesiasticus 21:1).'),
  -- thread: ecclesiasticus-21-fear-of-the-lord-is-wisdom
  ('apocrypha', 'ecclesiasticus', 21, 11, 'canon', 'proverbs', 9, 10, 'free', E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* The fear-of-Yahuah-is-wisdom refrain Ben Sira makes the crown of law-keeping (Ecclesiasticus 21:11).'),
  ('apocrypha', 'ecclesiasticus', 21, 11, 'canon', 'psalms', 111, 10, 'free', E'Psalm 111:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments: his praise endureth for ever.* Wisdom bound to doing the commandments, exactly as Ben Sira binds it to keeping the law (Ecclesiasticus 21:11).'),
  ('apocrypha', 'ecclesiasticus', 21, 11, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The fear-of-Yahuah foundation Ben Sira sets under understanding (Ecclesiasticus 21:11).'),
  ('apocrypha', 'ecclesiasticus', 21, 11, 'apocrypha', 'ecclesiasticus', 24, 23, 'extras', E'Ecclesiasticus 24:23 — *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* Ben Sira''s own crown chapter names Wisdom as the Torah of Moses — the very law whose keeping is wisdom in 21:11.'),
  -- thread: ecclesiasticus-21-the-two-ways-pit-of-hell
  ('apocrypha', 'ecclesiasticus', 21, 10, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil.* The two ways Moses set before Yashar''el, which Ben Sira draws as the smooth road to the pit versus the fountain of life (Ecclesiasticus 21:10,13).'),
  ('apocrypha', 'ecclesiasticus', 21, 10, 'canon', 'psalms', 1, 1, 'free', E'Psalm 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The way of sinners Ben Sira says ends in the pit of hell (Ecclesiasticus 21:10).'),
  ('apocrypha', 'ecclesiasticus', 21, 10, 'canon', 'proverbs', 15, 24, 'free', E'Proverbs 15:24 — *The way of life is above to the wise, that he may depart from hell beneath.* The wise man''s upward road against the sinner''s pit, the same contrast Ben Sira draws (Ecclesiasticus 21:10).'),
  -- thread: ecclesiasticus-21-heart-of-fools-in-their-mouth
  ('apocrypha', 'ecclesiasticus', 21, 26, 'canon', 'matthew', 12, 34, 'free', E'Matthew 12:34 — *O generation of vipers, how can ye, being evil, speak good things? for out of the abundance of the heart the mouth speaketh.* Yahusha''s word that the mouth pours out the heart, the very turn of Ben Sira''s proverb (Ecclesiasticus 21:26).'),
  ('apocrypha', 'ecclesiasticus', 21, 26, 'canon', 'proverbs', 29, 11, 'free', E'Proverbs 29:11 — *A fool uttereth all his mind: but a wise man keepeth it in till afterwards.* The fool whose heart is all in his mouth, where the wise keeps it in his heart (Ecclesiasticus 21:26).'),
  ('apocrypha', 'ecclesiasticus', 21, 26, 'canon', 'proverbs', 16, 23, 'free', E'Proverbs 16:23 — *The heart of the wise teacheth his mouth, and addeth learning to his lips.* The wise man whose mouth is governed from within his heart, as Ben Sira frames it (Ecclesiasticus 21:26).'),
  ('apocrypha', 'ecclesiasticus', 21, 16, 'canon', 'proverbs', 10, 14, 'free', E'Proverbs 10:14 — *Wise men lay up knowledge: but the mouth of the foolish is near destruction.* The laid-up wisdom against the fool''s burdensome talk Ben Sira contrasts (Ecclesiasticus 21:16).'),
  ('apocrypha', 'ecclesiasticus', 21, 17, 'canon', 'proverbs', 17, 28, 'free', E'Proverbs 17:28 — *Even a fool, when he holdeth his peace, is counted wise: and he that shutteth his lips is esteemed a man of understanding.* The weighed restraint that makes men seek the wise man''s words in the congregation (Ecclesiasticus 21:17).'),
  -- thread: ecclesiasticus-21-the-whisperer-and-the-tongue
  ('apocrypha', 'ecclesiasticus', 21, 28, 'canon', 'leviticus', 19, 16, 'free', E'Leviticus 19:16 — *Thou shalt not go up and down as a talebearer among thy people: neither shalt thou stand against the blood of thy neighbour: I am Yahuah (LORD).* The Torah command against the very whisperer Ben Sira condemns (Ecclesiasticus 21:28).'),
  ('apocrypha', 'ecclesiasticus', 21, 28, 'canon', 'proverbs', 26, 22, 'free', E'Proverbs 26:22 — *The words of a talebearer are as wounds, and they go down into the innermost parts of the belly.* The whisperer whose words wound, as Ben Sira says he defiles his own soul (Ecclesiasticus 21:28).'),
  ('apocrypha', 'ecclesiasticus', 21, 28, 'canon', 'james', 3, 6, 'free', E'James 3:6 — *And the tongue is a fire, a world of iniquity: so is the tongue among our members, that it defileth the whole body, and setteth on fire the course of nature; and it is set on fire of hell.* The defiling fire of the tongue, the same self-defilement Ben Sira warns of (Ecclesiasticus 21:28).'),
  ('apocrypha', 'ecclesiasticus', 21, 25, 'canon', 'proverbs', 11, 13, 'free', E'Proverbs 11:13 — *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter.* The babbling lips against the weighed words of the understanding (Ecclesiasticus 21:25).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-21-flee-sin-as-a-serpent',
       E'Flee from sin as from a serpent',
       E'Ben Sira opens with the call to turn: *My son, have you sinned? do so no more, but ask pardon for your former sins* (Ecclesiasticus 21:1), and then paints sin as a venomous beast — *Flee from sin as from the face of a serpent: for if you come too near it, it will bite you: the teeth thereof are as the teeth of a lion, slaying the souls of men* (Ecclesiasticus 21:2). It ain''t new: the same serpent-bite warns off the cup of folly in Proverbs — *At the last it biteth like a serpent, and stingeth like an adder* (Proverbs 23:32) — and the figure goes back to the door of the heart where the LORD told Cain *sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him* (Genesis 4:7). The wound is mortal because *All iniquity is as a two edged sword, the wounds of which cannot be healed* (Ecclesiasticus 21:3); but the way of escape is the way the brother James commands — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you* (James 4:7). Flee the serpent; the LORD set the rule over it from the beginning.',
       sv.verse_id, ev.verse_id, 'extras', 58800
  FROM _session253_sir21_lookup sv, _session253_sir21_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=21 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-21-fear-of-the-lord-is-wisdom',
       E'Keep the law, fear Yahuah, get wisdom',
       E'The poor man''s prayer is heard above the proud — *A prayer out of a poor man’s mouth reacheth to the ears of Yahuah (God), and his judgment comes speedily* (Ecclesiasticus 21:5) — and the one who *fears Yahuah (God) will repent from his heart* (Ecclesiasticus 21:6). Then Ben Sira gives the whole sum of the matter: *He that keepeth the law of Yahuah (God) getteth the understanding thereof: and the perfection of the fear of Yahuah (God) is wisdom* (Ecclesiasticus 21:11). This is the refrain of all the wisdom books — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding* (Proverbs 9:10); *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7); *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments: his praise endureth for ever* (Psalm 111:10). Wisdom is not a feeling but Torah-keeping: it ain''t new, and the law stands.',
       sv.verse_id, ev.verse_id, 'extras', 58803
  FROM _session253_sir21_lookup sv, _session253_sir21_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=21 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-21-the-two-ways-pit-of-hell',
       E'The two ways: the pit of hell or the way of life',
       E'Ben Sira lays the road of the wicked and the road of the wise side by side. *The way of sinners is made plain with stones, but at the end thereof is the pit of hell* (Ecclesiasticus 21:10), while the wise man''s *counsel is like a pure fountain of life* (Ecclesiasticus 21:13). It ain''t new — this is the two-ways teaching of the Torah and the Psalter: *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15); *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful* (Psalm 1:1); *The way of life is above to the wise, that he may depart from hell beneath* (Proverbs 15:24). The smooth-paved road and the fountain of life are the two ends Moses set before Yashar''el.',
       sv.verse_id, ev.verse_id, 'extras', 58806
  FROM _session253_sir21_lookup sv, _session253_sir21_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=21 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-21-heart-of-fools-in-their-mouth',
       E'The heart of fools is in their mouth',
       E'Ben Sira''s sharpest proverb turns the inward man inside out: *The heart of fools is in their mouth: but the mouth of the wise is in their heart* (Ecclesiasticus 21:26). The fool blurts all he is; the wise keeps counsel and *grace shall be found in the lips of the wise* (Ecclesiasticus 21:16). It ain''t new: *A fool uttereth all his mind: but a wise man keepeth it in till afterwards* (Proverbs 29:11); *Wise men lay up knowledge: but the mouth of the foolish is near destruction* (Proverbs 10:14); *The heart of the wise teacheth his mouth, and addeth learning to his lips* (Proverbs 16:23). And the Messiah Yahusha sealed the whole figure — the mouth is the heart''s overflow: *O generation of vipers, how can ye, being evil, speak good things? for out of the abundance of the heart the mouth speaketh* (Matthew 12:34). The tongue tells what the heart is.',
       sv.verse_id, ev.verse_id, 'extras', 58809
  FROM _session253_sir21_lookup sv, _session253_sir21_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=21 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-21-the-whisperer-and-the-tongue',
       E'The whisperer defiles his own soul',
       E'The chapter ends on the sin of the tongue: *The lips of talkers will be telling such things as pertain not to them: but the words of such as have understanding are weighed in the balance* (Ecclesiasticus 21:25), and last of all the slanderer — *A whisperer defiles his own soul, and is hated wherever he dwells* (Ecclesiasticus 21:28). It ain''t new: the Torah forbids it outright — *Thou shalt not go up and down as a talebearer among thy people: neither shalt thou stand against the blood of thy neighbour: I am Yahuah (LORD)* (Leviticus 19:16); the wisdom of the fathers warns *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter* (Proverbs 11:13), and *The words of a talebearer are as wounds, and they go down into the innermost parts of the belly* (Proverbs 26:22). The brother James names the fire of it: *And the tongue is a fire, a world of iniquity: so is the tongue among our members, that it defileth the whole body, and setteth on fire the course of nature; and it is set on fire of hell* (James 3:6). The whisperer''s poison defiles the whisperer first.',
       sv.verse_id, ev.verse_id, 'extras', 58812
  FROM _session253_sir21_lookup sv, _session253_sir21_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=21 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-21-flee-sin-as-a-serpent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 23:32 — *At the last it biteth like a serpent, and stingeth like an adder.* The same serpent-bite figure Ben Sira uses for sin (Ecclesiasticus 21:2).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-flee-sin-as-a-serpent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:7 — *If thou doest well, shalt thou not be accepted? and if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him.* The crouching sin Ben Sira bids us flee is the very beast the LORD set Cain to master (Ecclesiasticus 21:2).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-flee-sin-as-a-serpent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The way to flee the serpent Ben Sira describes (Ecclesiasticus 21:2).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-flee-sin-as-a-serpent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 9:6 — *Forsake the foolish, and live; and go in the way of understanding.* The turn-and-sin-no-more wisdom of Ben Sira''s opening call (Ecclesiasticus 21:1).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-flee-sin-as-a-serpent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-21-fear-of-the-lord-is-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* The fear-of-Yahuah-is-wisdom refrain Ben Sira makes the crown of law-keeping (Ecclesiasticus 21:11).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-fear-of-the-lord-is-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 111:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments: his praise endureth for ever.* Wisdom bound to doing the commandments, exactly as Ben Sira binds it to keeping the law (Ecclesiasticus 21:11).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-fear-of-the-lord-is-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=111 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The fear-of-Yahuah foundation Ben Sira sets under understanding (Ecclesiasticus 21:11).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-fear-of-the-lord-is-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 24:23 — *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* Ben Sira''s own crown chapter names Wisdom as the Torah of Moses — the very law whose keeping is wisdom in 21:11.'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-fear-of-the-lord-is-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-21-the-two-ways-pit-of-hell
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil.* The two ways Moses set before Yashar''el, which Ben Sira draws as the smooth road to the pit versus the fountain of life (Ecclesiasticus 21:10,13).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-the-two-ways-pit-of-hell'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The way of sinners Ben Sira says ends in the pit of hell (Ecclesiasticus 21:10).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-the-two-ways-pit-of-hell'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 15:24 — *The way of life is above to the wise, that he may depart from hell beneath.* The wise man''s upward road against the sinner''s pit, the same contrast Ben Sira draws (Ecclesiasticus 21:10).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-the-two-ways-pit-of-hell'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-21-heart-of-fools-in-their-mouth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 12:34 — *O generation of vipers, how can ye, being evil, speak good things? for out of the abundance of the heart the mouth speaketh.* Yahusha''s word that the mouth pours out the heart, the very turn of Ben Sira''s proverb (Ecclesiasticus 21:26).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-heart-of-fools-in-their-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 29:11 — *A fool uttereth all his mind: but a wise man keepeth it in till afterwards.* The fool whose heart is all in his mouth, where the wise keeps it in his heart (Ecclesiasticus 21:26).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-heart-of-fools-in-their-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=29 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 16:23 — *The heart of the wise teacheth his mouth, and addeth learning to his lips.* The wise man whose mouth is governed from within his heart, as Ben Sira frames it (Ecclesiasticus 21:26).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-heart-of-fools-in-their-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 10:14 — *Wise men lay up knowledge: but the mouth of the foolish is near destruction.* The laid-up wisdom against the fool''s burdensome talk Ben Sira contrasts (Ecclesiasticus 21:16).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-heart-of-fools-in-their-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 17:28 — *Even a fool, when he holdeth his peace, is counted wise: and he that shutteth his lips is esteemed a man of understanding.* The weighed restraint that makes men seek the wise man''s words in the congregation (Ecclesiasticus 21:17).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-heart-of-fools-in-their-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-21-the-whisperer-and-the-tongue
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:16 — *Thou shalt not go up and down as a talebearer among thy people: neither shalt thou stand against the blood of thy neighbour: I am Yahuah (LORD).* The Torah command against the very whisperer Ben Sira condemns (Ecclesiasticus 21:28).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-the-whisperer-and-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 26:22 — *The words of a talebearer are as wounds, and they go down into the innermost parts of the belly.* The whisperer whose words wound, as Ben Sira says he defiles his own soul (Ecclesiasticus 21:28).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-the-whisperer-and-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 3:6 — *And the tongue is a fire, a world of iniquity: so is the tongue among our members, that it defileth the whole body, and setteth on fire the course of nature; and it is set on fire of hell.* The defiling fire of the tongue, the same self-defilement Ben Sira warns of (Ecclesiasticus 21:28).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-the-whisperer-and-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 11:13 — *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter.* The babbling lips against the weighed words of the understanding (Ecclesiasticus 21:25).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-the-whisperer-and-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

