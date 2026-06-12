-- ----- fragment: minion_ecclesiasticus_03.sql (session253 ecclesiasticus 3) -----
-- Source anchor: apocrypha/ecclesiasticus ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir03 (view _session253_sir03_lookup). Sort band base 58350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-3-honour-father-mother
  ('apocrypha', 'ecclesiasticus', 3, 2, 'canon', 'exodus', 20, 12, 'free', E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* The Sinai command Ben Sira unfolds when he says Yahuah has given the father honour over the children (Ecclesiasticus 3:2).'),
  ('apocrypha', 'ecclesiasticus', 3, 6, 'canon', 'deuteronomy', 5, 16, 'free', E'Deuteronomy 5:16 — *Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee; that thy days may be prolonged, and that it may go well with thee, in the land which Yahuah Elohayka (the LORD thy God) giveth thee.* The same long-life promise Ben Sira repeats: he that honoureth his father shall have a long life (Ecclesiasticus 3:6).'),
  ('apocrypha', 'ecclesiasticus', 3, 8, 'canon', 'ephesians', 6, 2, 'free', E'Ephesians 6:2 — *Honour thy father and mother; (which is the first commandment with promise;)* Sha''ul names as the first commandment with promise the very duty Ben Sira urges in word and deed (Ecclesiasticus 3:8).'),
  ('apocrypha', 'ecclesiasticus', 3, 5, 'canon', 'matthew', 15, 4, 'free', E'Matthew 15:4 — *For Elohim (God) commanded, saying, Honour thy father and mother: and, He that curseth father or mother, let him die the death.* The Messiah holds the same commandment Ben Sira presses, rebuking the tradition that voided it (Ecclesiasticus 3:5).'),
  -- thread: ecclesiasticus-3-corban-tradition-rebuked
  ('apocrypha', 'ecclesiasticus', 3, 16, 'canon', 'matthew', 15, 6, 'free', E'Matthew 15:6 — *And honour not his father or his mother, he shall be free. Thus have ye made the commandment of Elohim (God) of none effect by your tradition.* The corban loophole is precisely the forsaking of the father Ben Sira likens to blasphemy (Ecclesiasticus 3:16).'),
  ('apocrypha', 'ecclesiasticus', 3, 14, 'apocrypha', 'tobit', 12, 9, 'extras', E'Tobit 12:9 — *For alms does deliver from death, and shall purge away all sin. Those that exercise alms and righteousness shall be filled with life:* The sister wisdom-book confirms that the relief of one''s father, counted instead of sins to build a man up, is an almsdeed (Ecclesiasticus 3:14).'),
  ('apocrypha', 'ecclesiasticus', 3, 13, 'canon', 'ephesians', 6, 3, 'free', E'Ephesians 6:3 — *That it may be well with thee, and thou mayest live long on the earth.* The promise attached to honouring parents reaches into their old age, where Ben Sira bids the strong have patience (Ecclesiasticus 3:13).'),
  -- thread: ecclesiasticus-3-humble-thyself-exalted
  ('apocrypha', 'ecclesiasticus', 3, 18, 'canon', 'luke', 14, 11, 'free', E'Luke 14:11 — *For whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted.* The Messiah''s law of the Kingdom is Ben Sira''s counsel that the greater one is, the more he should humble himself (Ecclesiasticus 3:18).'),
  ('apocrypha', 'ecclesiasticus', 3, 18, 'canon', 'luke', 18, 14, 'free', E'Luke 18:14 — *I tell you, this man went down to his house justified rather than the other: for every one that exalteth himself shall be abased; and he that humbleth himself shall be exalted.* The publican who humbled himself found the favour before Yahuah that Ben Sira promises the lowly (Ecclesiasticus 3:18).'),
  ('apocrypha', 'ecclesiasticus', 3, 20, 'canon', 'james', 4, 6, 'free', E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* Ya''aqob, the closest NT sibling of this book, echoes that Yahuah is honoured of the lowly (Ecclesiasticus 3:20).'),
  ('apocrypha', 'ecclesiasticus', 3, 20, 'canon', 'proverbs', 3, 34, 'free', E'Proverbs 3:34 — *Surely he scorneth the scorners: but he giveth grace unto the lowly.* The Tanakh''s wisdom that grace goes to the lowly underwrites Ben Sira''s word that the lowly honour the great power of Yahuah (Ecclesiasticus 3:20).'),
  -- thread: ecclesiasticus-3-seek-not-secret-things
  ('apocrypha', 'ecclesiasticus', 3, 22, 'canon', 'deuteronomy', 29, 29, 'free', E'Deuteronomy 29:29 — *The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us and to our children for ever, that we may do all the words of this law.* Moses'' division of secret and revealed is exactly Ben Sira''s: think on what is commanded, not on the things in secret (Ecclesiasticus 3:22).'),
  ('apocrypha', 'ecclesiasticus', 3, 22, 'canon', 'micah', 6, 8, 'free', E'Micah 6:8 — *He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* The modest, reverent walk Micah requires is Ben Sira''s mind set on what is commanded rather than the hidden (Ecclesiasticus 3:22).'),
  ('apocrypha', 'ecclesiasticus', 3, 24, 'canon', 'daniel', 12, 10, 'free', E'Daniel 12:10 — *Many shall be purified, and made white, and tried; but the wicked shall do wickedly: and none of the wicked shall understand; but the wise shall understand.* As Ben Sira warns that many are deceived by vain opinion, Daniel divides the wise who understand from the wicked who never will (Ecclesiasticus 3:24).'),
  -- thread: ecclesiasticus-3-proud-heart-alms-atones
  ('apocrypha', 'ecclesiasticus', 3, 28, 'canon', 'proverbs', 16, 18, 'free', E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* The wisdom-saying behind Ben Sira''s verdict that for the punishment of the proud there is no remedy (Ecclesiasticus 3:28).'),
  ('apocrypha', 'ecclesiasticus', 3, 26, 'canon', 'daniel', 4, 37, 'free', E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The king who learned that the stubborn heart fares evil at the last is living proof of Ben Sira''s word (Ecclesiasticus 3:26).'),
  ('apocrypha', 'ecclesiasticus', 3, 30, 'canon', 'matthew', 6, 4, 'free', E'Matthew 6:4 — *That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly.* The Sermon takes up Ben Sira''s almsdeed that maketh atonement and hides it from man''s eye (Ecclesiasticus 3:30).'),
  ('apocrypha', 'ecclesiasticus', 3, 30, 'apocrypha', 'tobit', 4, 7, 'extras', E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* The sister apocryphal wisdom-book teaches the same: alms quench sin as water quencheth fire (Ecclesiasticus 3:30).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-3-honour-father-mother',
       E'Honour thy father and mother — the fifth commandment unfolded',
       E'Ben Sira opens chapter 3 by taking the fifth word of the Decalogue and unfolding it as wisdom: *For Yahuah (God) has given the father honour over the children, and has confirmed the authority of the mother over the sons.* (Ecclesiasticus 3:2). To honour is no light thing — *Whoso honoureth his father makes an atonement for his sins* (Ecclesiasticus 3:3), and *Whoso honoureth his father shall have joy of his own children; and when he makes his prayer, he shall be heard* (Ecclesiasticus 3:5). This is the very commandment graven at Sinai: *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* (Exodus 20:12), repeated in Moses'' rehearsal — *Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee; that thy days may be prolonged, and that it may go well with thee* (Deuteronomy 5:16). Sha''ul knows it as the hinge of the household: *Honour thy father and mother; (which is the first commandment with promise;)* (Ephesians 6:2). It ain''t new — the apparatus Ben Sira raises on the commandment is the same covenant honour, the same long-life promise, the same blessing that *establishes the houses of children* (Ecclesiasticus 3:9).',
       sv.verse_id, ev.verse_id, 'extras', 58350
  FROM _session253_sir03_lookup sv, _session253_sir03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-3-corban-tradition-rebuked',
       E'Help thy father in his age — against the corban evasion',
       E'Ben Sira presses the commandment into old age, where it costs: *My son, help your father in his age, and grieve him not as long as he lives.* (Ecclesiasticus 3:12), and *if his understanding fail, have patience with him; and despise him not when you are in your full strength* (Ecclesiasticus 3:13). The man who shirks it is no neutral — *He that forsaketh his father is as a blasphemer; and he that angereth his mother is cursed: of Yahuah (God).* (Ecclesiasticus 3:16). Centuries on, the Messiah indicts the scribes for inventing a loophole around this very duty: *For Elohim (God) commanded, saying, Honour thy father and mother: and, He that curseth father or mother, let him die the death.* (Matthew 15:4) — *Thus have ye made the commandment of Elohim (God) of none effect by your tradition* (Matthew 15:6). The corban evasion is exactly the forsaking Ben Sira called blasphemy. And the relief of an aged father is not lost: *For the relieving of your father shall not be forgotten: and instead of sins it shall be added to build you up.* (Ecclesiasticus 3:14) — an almsdeed within the house, which Tobit calls deliverance: *For alms does deliver from death, and shall purge away all sin.* (Tobit 12:9).',
       sv.verse_id, ev.verse_id, 'extras', 58353
  FROM _session253_sir03_lookup sv, _session253_sir03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=3 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-3-humble-thyself-exalted',
       E'The greater thou art, the more humble thyself',
       E'From honour Ben Sira turns to its root, lowliness: *My son, go on with your business in meekness; so shall you be beloved of him that is approved.* (Ecclesiasticus 3:17), and the great wisdom-saying — *The greater you are, the more humble thyself, and you shall find favour before Yahuah (God).* (Ecclesiasticus 3:18). This is the law of the Kingdom the Messiah twice declared: *For whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted.* (Luke 14:11), and again at the temple — *for every one that exalteth himself shall be abased; and he that humbleth himself shall be exalted.* (Luke 18:14). Ben Sira''s *the power of Yahuah (God) is great, and he is honoured of the lowly* (Ecclesiasticus 3:20) is the same word Proverbs and Ya''aqob carry: *Surely he scorneth the scorners: but he giveth grace unto the lowly.* (Proverbs 3:34) — *Elohim (God) resisteth the proud, but giveth grace unto the humble.* (James 4:6). It ain''t new: the Sermon''s blessing on the meek, and James — the closest NT sibling to this whole book — draw the identical line from lowliness to favour.',
       sv.verse_id, ev.verse_id, 'extras', 58356
  FROM _session253_sir03_lookup sv, _session253_sir03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=3 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-3-seek-not-secret-things',
       E'Seek not things too hard — the secret and the revealed',
       E'Humility governs the mind as well as the heart: *Seek not out things that are too hard for you, neither search the things that are above your strength.* (Ecclesiasticus 3:21), but rather — *what is commanded you, think thereupon with reverence, for it is not needful for you to see with your eyes the things that are in secret.* (Ecclesiasticus 3:22). This is Moses'' own division of secret and revealed: *The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us and to our children for ever, that we may do all the words of this law.* (Deuteronomy 29:29) — the revealed thing being the commandment to do. Ben Sira warns *many are deceived by their own vain opinion* (Ecclesiasticus 3:24); the prudent walk modestly, for as Daniel was told, *none of the wicked shall understand; but the wise shall understand* (Daniel 12:10). Micah names the same reverent, modest walk: *to do justly, and to love mercy, and to walk humbly with thy Elohim (God)* (Micah 6:8). It ain''t new — wisdom keeps to what is commanded and leaves the secret things with Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 58359
  FROM _session253_sir03_lookup sv, _session253_sir03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=3 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-3-proud-heart-alms-atones',
       E'The proud heart, and alms that maketh atonement',
       E'Ben Sira ends the chapter on the heart that will not bow: *A stubborn heart shall fare evil at the last; and he that loves danger shall perish in it.* (Ecclesiasticus 3:26), and *In the punishment of the proud there is no remedy; for the plant of wickedness has taken root in him.* (Ecclesiasticus 3:28). The Tanakh says it plainly — *Pride goeth before destruction, and an haughty spirit before a fall.* (Proverbs 16:18) — and Nebuchadnezzar learned it on his knees: *those that walk in pride he is able to abase* (Daniel 4:37). Against the proud heart Ben Sira sets the humble deed: *Water will quench a flaming fire; and alms makes an atonement for sins.* (Ecclesiasticus 3:30). This is Tobit''s gospel of mercy — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor* (Tobit 4:7) — and the Sermon on the Mount, where the Messiah hides the almsdeed from human praise: *That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly.* (Matthew 6:4). It ain''t new — the proud heart has no remedy, but the lowly hand that gives finds atonement and a stay.',
       sv.verse_id, ev.verse_id, 'extras', 58362
  FROM _session253_sir03_lookup sv, _session253_sir03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=26
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=3 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-3-honour-father-mother
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* The Sinai command Ben Sira unfolds when he says Yahuah has given the father honour over the children (Ecclesiasticus 3:2).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-honour-father-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 5:16 — *Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee; that thy days may be prolonged, and that it may go well with thee, in the land which Yahuah Elohayka (the LORD thy God) giveth thee.* The same long-life promise Ben Sira repeats: he that honoureth his father shall have a long life (Ecclesiasticus 3:6).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-honour-father-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 6:2 — *Honour thy father and mother; (which is the first commandment with promise;)* Sha''ul names as the first commandment with promise the very duty Ben Sira urges in word and deed (Ecclesiasticus 3:8).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-honour-father-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 15:4 — *For Elohim (God) commanded, saying, Honour thy father and mother: and, He that curseth father or mother, let him die the death.* The Messiah holds the same commandment Ben Sira presses, rebuking the tradition that voided it (Ecclesiasticus 3:5).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-honour-father-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=15 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-3-corban-tradition-rebuked
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 15:6 — *And honour not his father or his mother, he shall be free. Thus have ye made the commandment of Elohim (God) of none effect by your tradition.* The corban loophole is precisely the forsaking of the father Ben Sira likens to blasphemy (Ecclesiasticus 3:16).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-corban-tradition-rebuked'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Tobit 12:9 — *For alms does deliver from death, and shall purge away all sin. Those that exercise alms and righteousness shall be filled with life:* The sister wisdom-book confirms that the relief of one''s father, counted instead of sins to build a man up, is an almsdeed (Ecclesiasticus 3:14).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-corban-tradition-rebuked'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 6:3 — *That it may be well with thee, and thou mayest live long on the earth.* The promise attached to honouring parents reaches into their old age, where Ben Sira bids the strong have patience (Ecclesiasticus 3:13).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-corban-tradition-rebuked'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-3-humble-thyself-exalted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 14:11 — *For whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted.* The Messiah''s law of the Kingdom is Ben Sira''s counsel that the greater one is, the more he should humble himself (Ecclesiasticus 3:18).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-humble-thyself-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=14 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 18:14 — *I tell you, this man went down to his house justified rather than the other: for every one that exalteth himself shall be abased; and he that humbleth himself shall be exalted.* The publican who humbled himself found the favour before Yahuah that Ben Sira promises the lowly (Ecclesiasticus 3:18).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-humble-thyself-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* Ya''aqob, the closest NT sibling of this book, echoes that Yahuah is honoured of the lowly (Ecclesiasticus 3:20).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-humble-thyself-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 3:34 — *Surely he scorneth the scorners: but he giveth grace unto the lowly.* The Tanakh''s wisdom that grace goes to the lowly underwrites Ben Sira''s word that the lowly honour the great power of Yahuah (Ecclesiasticus 3:20).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-humble-thyself-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-3-seek-not-secret-things
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 29:29 — *The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us and to our children for ever, that we may do all the words of this law.* Moses'' division of secret and revealed is exactly Ben Sira''s: think on what is commanded, not on the things in secret (Ecclesiasticus 3:22).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-seek-not-secret-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Micah 6:8 — *He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* The modest, reverent walk Micah requires is Ben Sira''s mind set on what is commanded rather than the hidden (Ecclesiasticus 3:22).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-seek-not-secret-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:10 — *Many shall be purified, and made white, and tried; but the wicked shall do wickedly: and none of the wicked shall understand; but the wise shall understand.* As Ben Sira warns that many are deceived by vain opinion, Daniel divides the wise who understand from the wicked who never will (Ecclesiasticus 3:24).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-seek-not-secret-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-3-proud-heart-alms-atones
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* The wisdom-saying behind Ben Sira''s verdict that for the punishment of the proud there is no remedy (Ecclesiasticus 3:28).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-proud-heart-alms-atones'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The king who learned that the stubborn heart fares evil at the last is living proof of Ben Sira''s word (Ecclesiasticus 3:26).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-proud-heart-alms-atones'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 6:4 — *That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly.* The Sermon takes up Ben Sira''s almsdeed that maketh atonement and hides it from man''s eye (Ecclesiasticus 3:30).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-proud-heart-alms-atones'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* The sister apocryphal wisdom-book teaches the same: alms quench sin as water quencheth fire (Ecclesiasticus 3:30).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-proud-heart-alms-atones'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=30
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

