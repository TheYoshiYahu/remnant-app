-- ----- fragment: minion_ecclesiasticus_19.sql (session253 ecclesiasticus 19) -----
-- Source anchor: apocrypha/ecclesiasticus ch19. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir19 (view _session253_sir19_lookup). Sort band base 58750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sirach-19-rule-the-tongue
  ('apocrypha', 'ecclesiasticus', 19, 6, 'canon', 'proverbs', 18, 21, 'free', E'Proverbs 18:21 — *Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof.* The same weight Sira puts on ruling the tongue, Solomon hangs life and death upon.'),
  ('apocrypha', 'ecclesiasticus', 19, 6, 'canon', 'ecclesiastes', 10, 12, 'free', E'Ecclesiastes 10:12 — *The words of a wise man’s mouth are gracious; but the lips of a fool will swallow up himself.* Babbling devours its own speaker, exactly the ''less evil'' Sira promises the man who hates it.'),
  ('apocrypha', 'ecclesiasticus', 19, 10, 'canon', 'matthew', 12, 36, 'free', E'Matthew 12:36 — *But I say unto you, That every idle word that men shall speak, they shall give account thereof in the day of judgment.* Why let a word die with you? Because each idle one is answered for — Yeshua raises Sira''s discretion to a day of reckoning.'),
  ('apocrypha', 'ecclesiasticus', 19, 6, 'canon', 'james', 1, 26, 'free', E'James 1:26 — *If any man among you seem to be religious, and bridleth not his tongue, but deceiveth his own heart, this man’s religion is vain.* James names the unbridled tongue as Sira does, making rule of the mouth the test of true religion.'),
  -- thread: sirach-19-whisperer-separates-friends
  ('apocrypha', 'ecclesiasticus', 19, 7, 'canon', 'proverbs', 16, 28, 'free', E'Proverbs 16:28 — *A froward man soweth strife: and a whisperer separateth chief friends.* The very harm Sira heads off by ''rehearse not'' — the rehearsed tale that cleaves friend from friend.'),
  ('apocrypha', 'ecclesiasticus', 19, 8, 'canon', 'proverbs', 11, 13, 'free', E'Proverbs 11:13 — *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter.* Sira''s ''reveal them not'' is Solomon''s faithful spirit that conceals.'),
  ('apocrypha', 'ecclesiasticus', 19, 8, 'canon', 'leviticus', 19, 16, 'free', E'Leviticus 19:16 — *Thou shalt not go up and down as a talebearer among thy people: neither shalt thou stand against the blood of thy neighbour: I am Yahuah (LORD).* The Torah-command behind Sira''s counsel not to talk of other men''s lives.'),
  ('apocrypha', 'ecclesiasticus', 19, 9, 'canon', 'ecclesiastes', 10, 20, 'free', E'Ecclesiastes 10:20 — *Curse not the king, no not in thy thought; and curse not the rich in thy bedchamber: for a bird of the air shall carry the voice, and that which hath wings shall tell the matter.* As Sira warns ''he heard and observed you,'' Qoheleth warns that even secret speech is carried back.'),
  -- thread: sirach-19-admonish-friend-first
  ('apocrypha', 'ecclesiasticus', 19, 17, 'canon', 'leviticus', 19, 17, 'free', E'Leviticus 19:17 — *Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him.* The ''law of the Most High'' Sira sends you back to: rebuke the neighbour rather than harbour the grudge.'),
  ('apocrypha', 'ecclesiasticus', 19, 13, 'canon', 'matthew', 18, 15, 'free', E'Matthew 18:15 — *Moreover if thy brother shall trespass against thee, go and tell him his fault between thee and him alone: if he shall hear thee, thou hast gained thy brother.* Yeshua''s order of reproof is Sira''s ''admonish a friend'' — go to him first, privately.'),
  ('apocrypha', 'ecclesiasticus', 19, 15, 'canon', 'proverbs', 17, 9, 'free', E'Proverbs 17:9 — *He that covereth a transgression seeketh love; but he that repeateth a matter separateth very friends.* Sira''s ''believe not every tale'' and private admonition is Solomon''s covering, not repeating, of a matter.'),
  -- thread: sirach-19-fear-of-yahuah-doctrine-of-life
  ('apocrypha', 'ecclesiasticus', 19, 18, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* Sira''s ''first step to be accepted of him'' is Solomon''s ''beginning of knowledge'' — the fear of Yahuah as the door.'),
  ('apocrypha', 'ecclesiasticus', 19, 20, 'canon', 'proverbs', 9, 10, 'free', E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* Word for word the maxim Sira states as ''the fear of Yahuah (God) is all wisdom.'''),
  ('apocrypha', 'ecclesiasticus', 19, 19, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live.* Sira''s ''doctrine of life'' and ''tree of immortality'' are Moses'' choose-life: keeping the commandments IS choosing life.'),
  ('apocrypha', 'ecclesiasticus', 19, 18, 'apocrypha', 'ecclesiasticus', 1, 14, 'extras', E'Ecclesiasticus 1:14 — *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* Sira''s own prologue self-witnesses the maxim he repeats here in chapter 19.'),
  ('apocrypha', 'ecclesiasticus', 19, 20, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 1, 'extras', E'Baruch 4:1 — *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die.* Sira''s ''performance of the law'' as all wisdom is Baruch''s enduring law that brings life to all who keep it.'),
  -- thread: sirach-19-exquisite-subtilty-known-by-fruit
  ('apocrypha', 'ecclesiasticus', 19, 29, 'canon', 'matthew', 7, 16, 'free', E'Matthew 7:16 — *Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?* Sira''s ''a man may be known by his look'' is Yeshua''s know-them-by-fruits: the inward deceit shows itself outwardly.'),
  ('apocrypha', 'ecclesiasticus', 19, 25, 'canon', 'james', 3, 6, 'free', E'James 3:6 — *And the tongue is a fire, a world of iniquity: so is the tongue among our members, that it defileth the whole body, and setteth on fire the course of nature; and it is set on fire of hell.* James names the ''exquisite subtilty that is unjust'' for what it is — the unbridled tongue set on fire of hell, not wisdom.'),
  ('apocrypha', 'ecclesiasticus', 19, 22, 'canon', 'matthew', 12, 34, 'free', E'Matthew 12:34 — *O generation of vipers, how can ye, being evil, speak good things? for out of the abundance of the heart the mouth speaketh.* Sira''s ''knowledge of wickedness is not wisdom'' meets Yeshua''s verdict: the evil heart cannot counterfeit good speech for long.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-19-rule-the-tongue',
       E'He that can rule his tongue shall live without strife',
       E'Ben Sira sets the bridled tongue at the head of wisdom: *He that can rule his tongue shall live without strife; and he that hates babbling shall have less evil* (Ecclesiasticus 19:6), and *If you have heard a word, let it die with you; and be bold, it will not burst you* (Ecclesiasticus 19:10). It ain''t new — the Tanakh already weighed every word: *Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof* (Proverbs 18:21), and *The words of a wise man’s mouth are gracious; but the lips of a fool will swallow up himself* (Ecclesiastes 10:12). The Messiah seals the doctrine: *But I say unto you, That every idle word that men shall speak, they shall give account thereof in the day of judgment* (Matthew 12:36). And James takes up Sira''s very theme of the unbridled mouth: *If any man among you seem to be religious, and bridleth not his tongue, but deceiveth his own heart, this man’s religion is vain* (James 1:26). One witness, one tongue, one law.',
       sv.verse_id, ev.verse_id, 'extras', 58750
  FROM _session253_sir19_lookup sv, _session253_sir19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=19 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-19-whisperer-separates-friends',
       E'Rehearse not a tale: the whisperer separates chief friends',
       E'Sira warns against carrying speech abroad: *Rehearse not to another that which is told to you, and you shall fare never the worse* (Ecclesiasticus 19:7), *Whether it be to friend or foe, talk not of other men’s lives; and if you can without offence, reveal them not* (Ecclesiasticus 19:8), *For he heard and observed you, and when time comes he will hate you* (Ecclesiasticus 19:9). It ain''t new — the proverb-fathers said the same: *A froward man soweth strife: and a whisperer separateth chief friends* (Proverbs 16:28); *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter* (Proverbs 11:13). And Torah set the wall first: *Thou shalt not go up and down as a talebearer among thy people: neither shalt thou stand against the blood of thy neighbour: I am Yahuah (LORD)* (Leviticus 19:16). Even the king is not safe from a carried word: *for a bird of the air shall carry the voice, and that which hath wings shall tell the matter* (Ecclesiastes 10:20). Torah stands; the tongue is governed by it.',
       sv.verse_id, ev.verse_id, 'extras', 58753
  FROM _session253_sir19_lookup sv, _session253_sir19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=19 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-19-admonish-friend-first',
       E'Admonish your neighbour before you threaten him',
       E'Sira lays out the discipline of correction before condemnation: *Admonish a friend, it may be he has not done it: and if he have done it, that he do it no more* (Ecclesiasticus 19:13), *Admonish a friend: for many times it is a slander, and believe not every tale* (Ecclesiasticus 19:15), and the hinge — *Admonish your neighbour before you threaten him; and not being angry, give place to the law of the Most High* (Ecclesiasticus 19:17). It ain''t new — Torah commanded exactly this order: *Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him* (Leviticus 19:17). The Messiah gives the procedure word for word: *Moreover if thy brother shall trespass against thee, go and tell him his fault between thee and him alone: if he shall hear thee, thou hast gained thy brother* (Matthew 18:15). And the proverb names the fruit of the private word: *He that covereth a transgression seeketh love; but he that repeateth a matter separateth very friends* (Proverbs 17:9). Sira''s ''law of the Most High'' is the same Torah Yeshua administered.',
       sv.verse_id, ev.verse_id, 'extras', 58756
  FROM _session253_sir19_lookup sv, _session253_sir19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=19 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-19-fear-of-yahuah-doctrine-of-life',
       E'The commandments of Yahuah are the doctrine of life',
       E'Sira anchors all wisdom in the fear of Yahuah and the keeping of His commandments: *The fear of Yahuah (God) is the first step to be accepted of him, and wisdom obtaineth his love* (Ecclesiasticus 19:18); *The knowledge of the commandments of Yahuah (God) is the doctrine of life: and they that do things that please him shall receive the fruit of the tree of immortality* (Ecclesiasticus 19:19); *The fear of Yahuah (God) is all wisdom; and in all wisdom is the performance of the law, and the knowledge of his omnipotency* (Ecclesiasticus 19:20). It ain''t new — this is the bone of the whole wisdom tradition: *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7), *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding* (Proverbs 9:10). And the commandments as the ''doctrine of life'' is Moses'' own choice set before Israel: *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). Sira self-witnesses from his own opening — *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb* (Ecclesiasticus 1:14) — and Baruch crowns it: the commandments ARE the law that endureth. The performance of the law IS wisdom; Torah stands.',
       sv.verse_id, ev.verse_id, 'extras', 58759
  FROM _session253_sir19_lookup sv, _session253_sir19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=19 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-19-exquisite-subtilty-known-by-fruit',
       E'An exquisite subtilty that is unjust — known by his look',
       E'Sira unmasks counterfeit wisdom: *The knowledge of wickedness is not wisdom, neither at any time the counsel of sinners prudence* (Ecclesiasticus 19:22); *There is an exquisite subtilty, and the same is unjust; and there is one that turns aside to make judgment appear; and there is a wise man that justifies in judgment* (Ecclesiasticus 19:25); and the discernment of it — *A man may be known by his look, and one that has understanding by his countenance, when you meetest him* (Ecclesiasticus 19:29). It ain''t new — Yeshua taught the same test for false prophets: *Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?* (Matthew 7:16), *Wherefore by their fruits ye shall know them* (Matthew 7:20). And James draws the very line Sira draws between true and counterfeit wisdom, naming the unjust subtilty as earthly: *And the tongue is a fire, a world of iniquity: so is the tongue among our members, that it defileth the whole body, and setteth on fire the course of nature; and it is set on fire of hell* (James 3:6). And the heart betrays itself through the mouth: *O generation of vipers, how can ye, being evil, speak good things? for out of the abundance of the heart the mouth speaketh* (Matthew 12:34). Crafty subtilty is not wisdom; it is known by its fruit.',
       sv.verse_id, ev.verse_id, 'extras', 58762
  FROM _session253_sir19_lookup sv, _session253_sir19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=22
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=19 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: sirach-19-rule-the-tongue
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 18:21 — *Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof.* The same weight Sira puts on ruling the tongue, Solomon hangs life and death upon.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-rule-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 10:12 — *The words of a wise man’s mouth are gracious; but the lips of a fool will swallow up himself.* Babbling devours its own speaker, exactly the ''less evil'' Sira promises the man who hates it.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-rule-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 12:36 — *But I say unto you, That every idle word that men shall speak, they shall give account thereof in the day of judgment.* Why let a word die with you? Because each idle one is answered for — Yeshua raises Sira''s discretion to a day of reckoning.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-rule-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 1:26 — *If any man among you seem to be religious, and bridleth not his tongue, but deceiveth his own heart, this man’s religion is vain.* James names the unbridled tongue as Sira does, making rule of the mouth the test of true religion.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-rule-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-19-whisperer-separates-friends
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 16:28 — *A froward man soweth strife: and a whisperer separateth chief friends.* The very harm Sira heads off by ''rehearse not'' — the rehearsed tale that cleaves friend from friend.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-whisperer-separates-friends'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 11:13 — *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter.* Sira''s ''reveal them not'' is Solomon''s faithful spirit that conceals.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-whisperer-separates-friends'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:16 — *Thou shalt not go up and down as a talebearer among thy people: neither shalt thou stand against the blood of thy neighbour: I am Yahuah (LORD).* The Torah-command behind Sira''s counsel not to talk of other men''s lives.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-whisperer-separates-friends'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiastes 10:20 — *Curse not the king, no not in thy thought; and curse not the rich in thy bedchamber: for a bird of the air shall carry the voice, and that which hath wings shall tell the matter.* As Sira warns ''he heard and observed you,'' Qoheleth warns that even secret speech is carried back.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-whisperer-separates-friends'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=10 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-19-admonish-friend-first
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:17 — *Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him.* The ''law of the Most High'' Sira sends you back to: rebuke the neighbour rather than harbour the grudge.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-admonish-friend-first'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 18:15 — *Moreover if thy brother shall trespass against thee, go and tell him his fault between thee and him alone: if he shall hear thee, thou hast gained thy brother.* Yeshua''s order of reproof is Sira''s ''admonish a friend'' — go to him first, privately.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-admonish-friend-first'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 17:9 — *He that covereth a transgression seeketh love; but he that repeateth a matter separateth very friends.* Sira''s ''believe not every tale'' and private admonition is Solomon''s covering, not repeating, of a matter.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-admonish-friend-first'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-19-fear-of-yahuah-doctrine-of-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* Sira''s ''first step to be accepted of him'' is Solomon''s ''beginning of knowledge'' — the fear of Yahuah as the door.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-fear-of-yahuah-doctrine-of-life'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* Word for word the maxim Sira states as ''the fear of Yahuah (God) is all wisdom.'''
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-fear-of-yahuah-doctrine-of-life'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live.* Sira''s ''doctrine of life'' and ''tree of immortality'' are Moses'' choose-life: keeping the commandments IS choosing life.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-fear-of-yahuah-doctrine-of-life'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 1:14 — *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* Sira''s own prologue self-witnesses the maxim he repeats here in chapter 19.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-fear-of-yahuah-doctrine-of-life'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Baruch 4:1 — *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die.* Sira''s ''performance of the law'' as all wisdom is Baruch''s enduring law that brings life to all who keep it.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-fear-of-yahuah-doctrine-of-life'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-19-exquisite-subtilty-known-by-fruit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:16 — *Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?* Sira''s ''a man may be known by his look'' is Yeshua''s know-them-by-fruits: the inward deceit shows itself outwardly.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-exquisite-subtilty-known-by-fruit'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 3:6 — *And the tongue is a fire, a world of iniquity: so is the tongue among our members, that it defileth the whole body, and setteth on fire the course of nature; and it is set on fire of hell.* James names the ''exquisite subtilty that is unjust'' for what it is — the unbridled tongue set on fire of hell, not wisdom.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-exquisite-subtilty-known-by-fruit'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 12:34 — *O generation of vipers, how can ye, being evil, speak good things? for out of the abundance of the heart the mouth speaketh.* Sira''s ''knowledge of wickedness is not wisdom'' meets Yeshua''s verdict: the evil heart cannot counterfeit good speech for long.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-exquisite-subtilty-known-by-fruit'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

