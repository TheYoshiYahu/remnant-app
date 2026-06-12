-- ----- fragment: minion_ecclesiasticus_27.sql (session253 ecclesiasticus 27) -----
-- Source anchor: apocrypha/ecclesiasticus ch27. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir27 (view _session253_sir27_lookup). Sort band base 58950, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir27_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sirach-27-speech-tries-the-man
  ('apocrypha', 'ecclesiasticus', 27, 5, 'canon', 'proverbs', 27, 21, 'free', E'Proverbs 27:21 — *As the fining pot for silver, and the furnace for gold; so is a man to his praise.* The same furnace-image that proves the potter''s vessels in Sirach 27:5 already weighed the man in Proverbs.'),
  ('apocrypha', 'ecclesiasticus', 27, 4, 'canon', 'matthew', 12, 34, 'free', E'Matthew 12:34 — *O generation of vipers, how can ye, being evil, speak good things? for out of the abundance of the heart the mouth speaketh.* The sieve leaving the refuse in a man''s talk (Sirach 27:4) is the mouth speaking out of the heart''s abundance.'),
  ('apocrypha', 'ecclesiasticus', 27, 7, 'canon', 'matthew', 12, 37, 'free', E'Matthew 12:37 — *For by thy words thou shalt be justified, and by thy words thou shalt be condemned.* Sirach 27:7 says hear a man speak before you praise him; the Master makes his words the very ground of his judgment.'),
  ('apocrypha', 'ecclesiasticus', 27, 5, 'apocrypha', 'the-wisdom-of-solomon', 3, 6, 'extras', E'Wisdom of Solomon 3:6 — *As gold in the furnace has he tried them, and received them as a burnt offering.* The trial-furnace of Sirach 27:5 is, in its sister wisdom-book, the proving that makes the righteous an offering — testing, not cursing.'),
  -- thread: sirach-27-tree-known-by-fruit
  ('apocrypha', 'ecclesiasticus', 27, 6, 'canon', 'matthew', 7, 16, 'free', E'Matthew 7:16 — *Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?* Sirach 27:6 already said the fruit declares the tree, and the man''s utterance declares his heart.'),
  ('apocrypha', 'ecclesiasticus', 27, 6, 'canon', 'matthew', 7, 17, 'free', E'Matthew 7:17 — *Even so every good tree bringeth forth good fruit; but a corrupt tree bringeth forth evil fruit.* The dressed tree showing its fruit in Sirach 27:6 is the good tree that cannot help but bear good fruit.'),
  ('apocrypha', 'ecclesiasticus', 27, 6, 'canon', 'matthew', 12, 33, 'free', E'Matthew 12:33 — *Either make the tree good, and his fruit good; or else make the tree corrupt, and his fruit corrupt: for the tree is known by his fruit.* The Master ties the tree-and-fruit of Sirach 27:6 directly to the words a heart brings forth.'),
  -- thread: sirach-27-betray-secrets-lose-the-friend
  ('apocrypha', 'ecclesiasticus', 27, 16, 'canon', 'proverbs', 11, 13, 'free', E'Proverbs 11:13 — *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter.* The man who discovers secrets and loses his credit in Sirach 27:16 is the talebearer the proverb contrasts with the faithful spirit.'),
  ('apocrypha', 'ecclesiasticus', 27, 17, 'canon', 'proverbs', 17, 9, 'free', E'Proverbs 17:9 — *He that covereth a transgression seeketh love; but he that repeateth a matter separateth very friends.* To betray a friend''s secrets and follow no more (Sirach 27:17) is the repeating of a matter that separates very friends.'),
  ('apocrypha', 'ecclesiasticus', 27, 21, 'canon', 'proverbs', 18, 19, 'free', E'Proverbs 18:19 — *A brother offended is harder to be won than a strong city: and their contentions are like the bars of a castle.* The betrayer of secrets is without hope (Sirach 27:21) because the offended friend is harder to win than a walled city.'),
  -- thread: sirach-27-stone-pit-returns-on-own-head
  ('apocrypha', 'ecclesiasticus', 27, 26, 'canon', 'proverbs', 26, 27, 'free', E'Proverbs 26:27 — *Whoso diggeth a pit shall fall therein: and he that rolleth a stone, it will return upon him.* Sirach 27:25-26 is the same twin proverb — the high-cast stone and the digged pit both fall back on the one who launched them.'),
  ('apocrypha', 'ecclesiasticus', 27, 27, 'canon', 'psalms', 7, 15, 'free', E'Psalm 7:15 — *He made a pit, and digged it, and is fallen into the ditch which he made.* The mischief that falls on the worker who knows not whence it comes (Sirach 27:27) is the pit-digger fallen into his own ditch.'),
  ('apocrypha', 'ecclesiasticus', 27, 27, 'canon', 'psalms', 7, 16, 'free', E'Psalm 7:16 — *His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate.* Sirach 27:27 says the mischief falls upon its worker; David says it returns upon his own head and pate.'),
  ('apocrypha', 'ecclesiasticus', 27, 25, 'canon', 'galatians', 6, 7, 'free', E'Galatians 6:7 — *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* The stone cast on high returning on its own head (Sirach 27:25) is Sha''ul''s law of sowing and reaping.'),
  -- thread: sirach-27-sin-lion-lies-in-wait
  ('apocrypha', 'ecclesiasticus', 27, 10, 'canon', 'genesis', 4, 7, 'free', E'Genesis 4:7 — *And if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him.* The lion that lieth in wait as sin for the iniquitous (Sirach 27:10) is the beast couching at Cain''s door.'),
  ('apocrypha', 'ecclesiasticus', 27, 28, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Vengeance lying in wait as a lion for the proud (Sirach 27:28) is the roaring lion Kepha bids the watchful resist.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir27_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir27_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-27-speech-tries-the-man',
       E'The furnace proves the potter — so the talk proves the man',
       E'Ben Sira sets the test of a man not in his profession but in his speech: *As when one sifteth with a sieve, the refuse remains; so the filth of man in his talk* (Ecclesiasticus 27:4), *The furnace proves the potter’s vessels; so the trial of man is in his reasoning* (Ecclesiasticus 27:5), and *Praise no man before you hear him speak; for this is the trial of men* (Ecclesiasticus 27:7). It ain''t new — the proverb already weighed a man this way: *As the fining pot for silver, and the furnace for gold; so is a man to his praise* (Proverbs 27:21). The Master sealed it: *O generation of vipers, how can ye, being evil, speak good things? for out of the abundance of the heart the mouth speaketh* (Matthew 12:34), and *by thy words thou shalt be justified, and by thy words thou shalt be condemned* (Matthew 12:37). And the proving in the furnace is mercy, not curse: the sister-book of Wisdom says *As gold in the furnace has he tried them, and received them as a burnt offering* (Wisdom of Solomon 3:6).',
       sv.verse_id, ev.verse_id, 'extras', 58950
  FROM _session253_sir27_lookup sv, _session253_sir27_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=27 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-27-tree-known-by-fruit',
       E'The fruit declares the tree — so the speech declares the heart',
       E'Ben Sira reads a man the way a gardener reads an orchard: *The fruit declareth if the tree have been dressed; so is the utterance of a conceit in the heart of man* (Ecclesiasticus 27:6). The Sermon on the Mount speaks the very figure: *Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?* (Matthew 7:16) — *Even so every good tree bringeth forth good fruit; but a corrupt tree bringeth forth evil fruit* (Matthew 7:17). And it ties straight back to the heart and mouth: *Either make the tree good, and his fruit good; or else make the tree corrupt, and his fruit corrupt: for the tree is known by his fruit* (Matthew 12:33). The deuterocanon already taught that the heart''s fruit shows in the speech.',
       sv.verse_id, ev.verse_id, 'extras', 58953
  FROM _session253_sir27_lookup sv, _session253_sir27_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=27 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-27-betray-secrets-lose-the-friend',
       E'Whoso discovers secrets loses his friend',
       E'Ben Sira guards friendship as a sacred trust: *Whoso discovers secrets loses his credit; and shall never find friend to his mind* (Ecclesiasticus 27:16), *Love your friend, and be faithful to him: but if you betrayest his secrets, follow no more after him* (Ecclesiasticus 27:17), and the wound that will not close — *As for a wound, it may be bound up; and after reviling there may be reconcilement: but he that betrayeth secrets is without hope* (Ecclesiasticus 27:21). It ain''t new — the proverb names the same betrayer: *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter* (Proverbs 11:13), and *He that covereth a transgression seeketh love; but he that repeateth a matter separateth very friends* (Proverbs 17:9). And how hard the breach heals: *A brother offended is harder to be won than a strong city: and their contentions are like the bars of a castle* (Proverbs 18:19).',
       sv.verse_id, ev.verse_id, 'extras', 58956
  FROM _session253_sir27_lookup sv, _session253_sir27_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=27 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-27-stone-pit-returns-on-own-head',
       E'The stone cast on high, the pit digged — deceit returns on its own head',
       E'Here is the chapter''s hinge of justice: *Whoso casteth a stone on high casteth it on his own head; and a deceitful stroke shall make wounds* (Ecclesiasticus 27:25), *Whoso diggeth a pit shall fall in it: and he that sets a trap shall be taken in it* (Ecclesiasticus 27:26), and *He that works mischief, it shall fall upon him, and he shall not know whence it comes* (Ecclesiasticus 27:27). It ain''t new — Solomon spoke it almost word for word: *Whoso diggeth a pit shall fall therein: and he that rolleth a stone, it will return upon him* (Proverbs 26:27). David sang it: *He made a pit, and digged it, and is fallen into the ditch which he made* (Psalm 7:15) — *His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalm 7:16). And Sha''ul fixed the principle for all time: *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). The deceit comes home to the deceiver.',
       sv.verse_id, ev.verse_id, 'extras', 58959
  FROM _session253_sir27_lookup sv, _session253_sir27_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=27 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-27-sin-lion-lies-in-wait',
       E'Sin lieth in wait as a lion for them that work iniquity',
       E'Twice Ben Sira sets a predator at the door of the sinner: *As the lion lieth in wait for the prey; so sin for them that work iniquity* (Ecclesiasticus 27:10), and at the chapter''s close — *Mockery and reproach are from the proud; but vengeance, as a lion, shall lie in wait for them* (Ecclesiasticus 27:28), so that *They that rejoice at the fall of the righteous shall be taken in the snare; and anguish shall consume them before they die* (Ecclesiasticus 27:29). It ain''t new — sin couched as a beast at the door is the oldest warning: *And if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him* (Genesis 4:7). And Kepha keeps the lion at the gate: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8).',
       sv.verse_id, ev.verse_id, 'extras', 58962
  FROM _session253_sir27_lookup sv, _session253_sir27_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=27 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: sirach-27-speech-tries-the-man
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 27:21 — *As the fining pot for silver, and the furnace for gold; so is a man to his praise.* The same furnace-image that proves the potter''s vessels in Sirach 27:5 already weighed the man in Proverbs.'
  FROM cross_reference_threads t, cross_references x, _session253_sir27_lookup sv, _session253_sir27_lookup tv
 WHERE t.slug='sirach-27-speech-tries-the-man'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=27 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 12:34 — *O generation of vipers, how can ye, being evil, speak good things? for out of the abundance of the heart the mouth speaketh.* The sieve leaving the refuse in a man''s talk (Sirach 27:4) is the mouth speaking out of the heart''s abundance.'
  FROM cross_reference_threads t, cross_references x, _session253_sir27_lookup sv, _session253_sir27_lookup tv
 WHERE t.slug='sirach-27-speech-tries-the-man'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 12:37 — *For by thy words thou shalt be justified, and by thy words thou shalt be condemned.* Sirach 27:7 says hear a man speak before you praise him; the Master makes his words the very ground of his judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_sir27_lookup sv, _session253_sir27_lookup tv
 WHERE t.slug='sirach-27-speech-tries-the-man'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 3:6 — *As gold in the furnace has he tried them, and received them as a burnt offering.* The trial-furnace of Sirach 27:5 is, in its sister wisdom-book, the proving that makes the righteous an offering — testing, not cursing.'
  FROM cross_reference_threads t, cross_references x, _session253_sir27_lookup sv, _session253_sir27_lookup tv
 WHERE t.slug='sirach-27-speech-tries-the-man'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-27-tree-known-by-fruit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:16 — *Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?* Sirach 27:6 already said the fruit declares the tree, and the man''s utterance declares his heart.'
  FROM cross_reference_threads t, cross_references x, _session253_sir27_lookup sv, _session253_sir27_lookup tv
 WHERE t.slug='sirach-27-tree-known-by-fruit'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:17 — *Even so every good tree bringeth forth good fruit; but a corrupt tree bringeth forth evil fruit.* The dressed tree showing its fruit in Sirach 27:6 is the good tree that cannot help but bear good fruit.'
  FROM cross_reference_threads t, cross_references x, _session253_sir27_lookup sv, _session253_sir27_lookup tv
 WHERE t.slug='sirach-27-tree-known-by-fruit'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 12:33 — *Either make the tree good, and his fruit good; or else make the tree corrupt, and his fruit corrupt: for the tree is known by his fruit.* The Master ties the tree-and-fruit of Sirach 27:6 directly to the words a heart brings forth.'
  FROM cross_reference_threads t, cross_references x, _session253_sir27_lookup sv, _session253_sir27_lookup tv
 WHERE t.slug='sirach-27-tree-known-by-fruit'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-27-betray-secrets-lose-the-friend
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 11:13 — *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter.* The man who discovers secrets and loses his credit in Sirach 27:16 is the talebearer the proverb contrasts with the faithful spirit.'
  FROM cross_reference_threads t, cross_references x, _session253_sir27_lookup sv, _session253_sir27_lookup tv
 WHERE t.slug='sirach-27-betray-secrets-lose-the-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 17:9 — *He that covereth a transgression seeketh love; but he that repeateth a matter separateth very friends.* To betray a friend''s secrets and follow no more (Sirach 27:17) is the repeating of a matter that separates very friends.'
  FROM cross_reference_threads t, cross_references x, _session253_sir27_lookup sv, _session253_sir27_lookup tv
 WHERE t.slug='sirach-27-betray-secrets-lose-the-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 18:19 — *A brother offended is harder to be won than a strong city: and their contentions are like the bars of a castle.* The betrayer of secrets is without hope (Sirach 27:21) because the offended friend is harder to win than a walled city.'
  FROM cross_reference_threads t, cross_references x, _session253_sir27_lookup sv, _session253_sir27_lookup tv
 WHERE t.slug='sirach-27-betray-secrets-lose-the-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-27-stone-pit-returns-on-own-head
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 26:27 — *Whoso diggeth a pit shall fall therein: and he that rolleth a stone, it will return upon him.* Sirach 27:25-26 is the same twin proverb — the high-cast stone and the digged pit both fall back on the one who launched them.'
  FROM cross_reference_threads t, cross_references x, _session253_sir27_lookup sv, _session253_sir27_lookup tv
 WHERE t.slug='sirach-27-stone-pit-returns-on-own-head'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 7:15 — *He made a pit, and digged it, and is fallen into the ditch which he made.* The mischief that falls on the worker who knows not whence it comes (Sirach 27:27) is the pit-digger fallen into his own ditch.'
  FROM cross_reference_threads t, cross_references x, _session253_sir27_lookup sv, _session253_sir27_lookup tv
 WHERE t.slug='sirach-27-stone-pit-returns-on-own-head'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 7:16 — *His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate.* Sirach 27:27 says the mischief falls upon its worker; David says it returns upon his own head and pate.'
  FROM cross_reference_threads t, cross_references x, _session253_sir27_lookup sv, _session253_sir27_lookup tv
 WHERE t.slug='sirach-27-stone-pit-returns-on-own-head'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 6:7 — *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* The stone cast on high returning on its own head (Sirach 27:25) is Sha''ul''s law of sowing and reaping.'
  FROM cross_reference_threads t, cross_references x, _session253_sir27_lookup sv, _session253_sir27_lookup tv
 WHERE t.slug='sirach-27-stone-pit-returns-on-own-head'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-27-sin-lion-lies-in-wait
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:7 — *And if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him.* The lion that lieth in wait as sin for the iniquitous (Sirach 27:10) is the beast couching at Cain''s door.'
  FROM cross_reference_threads t, cross_references x, _session253_sir27_lookup sv, _session253_sir27_lookup tv
 WHERE t.slug='sirach-27-sin-lion-lies-in-wait'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Vengeance lying in wait as a lion for the proud (Sirach 27:28) is the roaring lion Kepha bids the watchful resist.'
  FROM cross_reference_threads t, cross_references x, _session253_sir27_lookup sv, _session253_sir27_lookup tv
 WHERE t.slug='sirach-27-sin-lion-lies-in-wait'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=27 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

