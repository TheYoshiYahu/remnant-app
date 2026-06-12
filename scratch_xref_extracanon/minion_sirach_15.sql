-- ----- fragment: minion_ecclesiasticus_15.sql (session253 ecclesiasticus 15) -----
-- Source anchor: apocrypha/ecclesiasticus ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir15 (view _session253_sir15_lookup). Sort band base 58650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-15-fear-of-yahuah-obtains-wisdom
  ('apocrypha', 'ecclesiasticus', 15, 1, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* Ben Sira''s opening — he that fears Yahuah and knows the law obtains wisdom — is Solomon''s own first principle (Sirach 15:1).'),
  ('apocrypha', 'ecclesiasticus', 15, 1, 'canon', 'proverbs', 9, 10, 'free', E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* The fear of Yahuah that ''will do good'' and obtains wisdom in Sirach 15:1 is the very beginning of wisdom in Proverbs.'),
  ('apocrypha', 'ecclesiasticus', 15, 1, 'canon', 'proverbs', 2, 5, 'free', E'Proverbs 2:5 — *Then shalt thou understand the fear of Yahuah (LORD), and find the knowledge of Elohim (God).* Knowledge of the law in Sirach 15:1 yields the fear of Yahuah and the knowledge of Elohim.'),
  ('apocrypha', 'ecclesiasticus', 15, 3, 'canon', 'proverbs', 3, 13, 'free', E'Proverbs 3:13 — *Happy is the man that findeth wisdom, and the man that getteth understanding.* The man fed *the bread of understanding* in Sirach 15:3 is the happy man who finds wisdom in Proverbs.'),
  ('apocrypha', 'ecclesiasticus', 15, 3, 'canon', 'james', 1, 5, 'free', E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* Sirach''s nursing-mother wisdom who feeds the seeker (Sirach 15:3) is James''s wisdom freely given to whoever asks — Sirach''s closest NT sibling.'),
  -- thread: ecclesiasticus-15-wisdom-far-from-pride-and-sinners
  ('apocrypha', 'ecclesiasticus', 15, 8, 'canon', 'proverbs', 16, 18, 'free', E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* Wisdom is *far from pride* in Sirach 15:8 because pride is the very road to ruin Proverbs charts.'),
  ('apocrypha', 'ecclesiasticus', 15, 8, 'canon', 'proverbs', 13, 10, 'free', E'Proverbs 13:10 — *Only by pride cometh contention: but with the well advised is wisdom.* That the proud and the liars cannot remember her (Sirach 15:8) is Solomon''s pairing of pride against wisdom.'),
  ('apocrypha', 'ecclesiasticus', 15, 9, 'canon', 'matthew', 15, 8, 'free', E'Matthew 15:8 — *This people draweth nigh unto me with their mouth, and honoureth me with their lips; but their heart is far from me.* Praise unseemly in a sinner''s mouth (Sirach 15:9) is the lip-honour without the heart that the Messiah rebukes.'),
  -- thread: ecclesiasticus-15-say-not-yahuah-made-me-fall
  ('apocrypha', 'ecclesiasticus', 15, 11, 'canon', 'james', 1, 13, 'free', E'James 1:13 — *Let no man say when he is tempted, I am tempted of Elohim (God): for Elohim (God) cannot be tempted with evil, neither tempteth he any man.* James''s ''let no man say'' is Ben Sira''s ''Say not... it is through Yahuah that I fell away'' (Sirach 15:11) — almost word for word.'),
  ('apocrypha', 'ecclesiasticus', 15, 12, 'canon', 'james', 1, 14, 'free', E'James 1:14 — *But every man is tempted, when he is drawn away of his own lust, and enticed.* Against Sirach''s ''He has caused me to err'' (Sirach 15:12), James names the true cause: a man''s own lust, not Elohim.'),
  ('apocrypha', 'ecclesiasticus', 15, 11, 'apocrypha', 'the-wisdom-of-solomon', 1, 13, 'extras', E'Wisdom of Solomon 1:13 — *For Yahuah (God) made not death: neither has he pleasure in the destruction of the living.* The companion wisdom book on the same restored shelf seals Sirach 15:11 — Yahuah is no author of the fall or of death.'),
  ('apocrypha', 'ecclesiasticus', 15, 13, 'canon', 'psalms', 5, 4, 'free', E'Psalms 5:4 — *For thou art not a Elohim (God) that hath pleasure in wickedness: neither shall evil dwell with thee.* Yahuah *hates all abomination* in Sirach 15:13 because no evil can dwell with him.'),
  -- thread: ecclesiasticus-15-the-freedom-of-the-will
  ('apocrypha', 'ecclesiasticus', 15, 17, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil.* Sirach''s ''Before man is life and death'' (Sirach 15:17) is Moses'' charge set before Israel verbatim in theme.'),
  ('apocrypha', 'ecclesiasticus', 15, 17, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live.* ''whether him liketh shall be given him'' (Sirach 15:17) is Moses'' ''therefore choose life'' — the will set free to choose.'),
  ('apocrypha', 'ecclesiasticus', 15, 14, 'canon', 'genesis', 4, 7, 'free', E'Genesis 4:7 — *If thou doest well, shalt thou not be accepted? and if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him.* Man left *in the hand of his counsel* (Sirach 15:14) is Cain told he can yet rule over sin — the will is his.'),
  ('apocrypha', 'ecclesiasticus', 15, 16, 'canon', 'joshua', 24, 15, 'free', E'Joshua 24:15 — *And if it seem evil unto you to serve Yahuah (LORD), choose you this day whom ye will serve... but as for me and my house, we will serve Yahuah (LORD).* ''stretch forth your hand to whether you will'' (Sirach 15:16) is Joshua''s ''choose you this day'' — fire and water before the will.'),
  ('apocrypha', 'ecclesiasticus', 15, 15, 'canon', 'deuteronomy', 11, 26, 'free', E'Deuteronomy 11:26 — *Behold, I set before you this day a blessing and a curse.* ''If you will, to keep the commandments'' (Sirach 15:15) is the blessing-and-curse Moses sets before the keeper of the law.'),
  -- thread: ecclesiasticus-15-all-seeing-elohim-no-licence-to-sin
  ('apocrypha', 'ecclesiasticus', 15, 18, 'canon', 'psalms', 139, 1, 'free', E'Psalms 139:1 — *O Yahuah (LORD), thou hast searched me, and known me.* The Yahuah who *beholds all things* (Sirach 15:18) is David''s God who has searched and known him.'),
  ('apocrypha', 'ecclesiasticus', 15, 18, 'canon', 'proverbs', 15, 3, 'free', E'Proverbs 15:3 — *The eyes of Yahuah (LORD) are in every place, beholding the evil and the good.* Sirach''s all-beholding Yahuah (Sirach 15:18) is the proverb''s eyes-in-every-place.'),
  ('apocrypha', 'ecclesiasticus', 15, 19, 'canon', 'romans', 2, 6, 'free', E'Romans 2:6 — *Who will render to every man according to his deeds.* Because Yahuah *knoweth every work of man* (Sirach 15:19), Paul says he renders to every man by those works.'),
  ('apocrypha', 'ecclesiasticus', 15, 20, 'canon', 'james', 1, 15, 'free', E'James 1:15 — *Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death.* Yahuah gave *no man licence to sin* (Sirach 15:20); sin is born of a man''s own conceived lust, not of any divine warrant.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-15-fear-of-yahuah-obtains-wisdom',
       E'The fear of Yahuah, the knowledge of the law, obtains wisdom',
       E'Ben Sira opens the chapter binding wisdom to Torah: *He that fears Yahuah (God) will do good, and he that has the knowledge of the law shall obtain her* (Ecclesiasticus 15:1). Wisdom is not abstract — she comes to the law-keeper as a nursing mother: *And as a mother shall she meet him, and receive him as a wife married of a virgin* (Ecclesiasticus 15:2), feeding him *the bread of understanding* and *the water of wisdom* (Ecclesiasticus 15:3). This is the proverb''s own doctrine: *The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7) and *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding* (Proverbs 9:10). Whoso fears Yahuah is *stayed upon her, and shall not be moved* (Ecclesiasticus 15:4) — *Happy is the man that findeth wisdom, and the man that getteth understanding* (Proverbs 3:13). And the door stands open to the one who simply asks: *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). It ain''t new — the same wisdom-out-of-Torah witness.',
       sv.verse_id, ev.verse_id, 'extras', 58650
  FROM _session253_sir15_lookup sv, _session253_sir15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=15 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-15-wisdom-far-from-pride-and-sinners',
       E'Wisdom is far from pride; praise unseemly in a sinner''s mouth',
       E'The flip side of the fear of Yahuah: *But foolish men shall not attain to her, and sinners shall not see her* (Ecclesiasticus 15:7), *For she is far from pride, and men that are liars cannot remember her* (Ecclesiasticus 15:8). Wisdom and pride cannot share a house — and pride is the very root the next chapters call the beginning of sin. The proverb seals it: *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18), and *Only by pride cometh contention: but with the well advised is wisdom* (Proverbs 13:10). Ben Sira adds that worship itself is hollow from an unclean mouth: *Praise is not seemly in the mouth of a sinner, for it was not sent him of Yahuah (God)* (Ecclesiasticus 15:9) — the heart, not the lip, is the offering Yahuah seeks. The Messiah says the same of the Isaiah-quoted hypocrites: *This people draweth nigh unto me with their mouth, and honoureth me with their lips; but their heart is far from me* (Matthew 15:8). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58653
  FROM _session253_sir15_lookup sv, _session253_sir15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=15 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-15-say-not-yahuah-made-me-fall',
       E'Say not, it is through Yahuah that I fell away',
       E'Here is the heart of the chapter — the ★ no-author-of-evil verse: *Say not you, It is through Yahuah (God) that I fell away: for you oughtest not to do the things that he hates* (Ecclesiasticus 15:11), *Say not you, He has caused me to err: for he has no need of the sinful man* (Ecclesiasticus 15:12). Ben Sira slams the door on every excuse that lays sin at the Creator''s feet. James, Sirach''s closest NT sibling, repeats it almost verbatim: *Let no man say when he is tempted, I am tempted of Elohim (God): for Elohim (God) cannot be tempted with evil, neither tempteth he any man* (James 1:13) — *But every man is tempted, when he is drawn away of his own lust, and enticed* (James 1:14). Wisdom of Solomon confirms it from the other restored shelf: *For Yahuah (God) made not death: neither has he pleasure in the destruction of the living* (Wisdom of Solomon 1:13). Yahuah *hates all abomination* (Ecclesiasticus 15:13) — he is no tempter, no cause of the fall. It ain''t new: the same anti-fatalism, the same clean Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 58656
  FROM _session253_sir15_lookup sv, _session253_sir15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=15 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-15-the-freedom-of-the-will',
       E'He left man in the hand of his counsel — before man is life and death',
       E'The grand free-will declaration: *He himself made man from the beginning, and left him in the hand of his counsel* (Ecclesiasticus 15:14); *He has set fire and water before you: stretch forth your hand to whether you will* (Ecclesiasticus 15:16); *Before man is life and death; and whether him liketh shall be given him* (Ecclesiasticus 15:17). This is Moses'' choose-life charge made a doctrine: *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15), and *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). It is Yahuah''s word to Cain before the first murder: *if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him* (Genesis 4:7). It is Joshua''s altar-call: *choose you this day whom ye will serve... but as for me and my house, we will serve Yahuah (LORD)* (Joshua 24:15). Ben Sira''s ''if you will, to keep the commandments'' (Sirach 15:15) — the Torah set before the will, life and death in the hand. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58659
  FROM _session253_sir15_lookup sv, _session253_sir15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=15 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-15-all-seeing-elohim-no-licence-to-sin',
       E'The all-seeing Elohim: he commanded no man to do wickedly',
       E'Ben Sira closes by grounding the freedom of the will in the omniscience of the Judge: *For the wisdom of Yahuah (God) is great, and he is mighty in power, and beholds all things* (Ecclesiasticus 15:18); *And his eyes are upon them that fear him, and he knoweth every work of man* (Ecclesiasticus 15:19). The all-seeing Yahuah is David''s confession: *O Yahuah (LORD), thou hast searched me, and known me. Thou knowest my downsitting and mine uprising, thou understandest my thought afar off* (Psalms 139:1-2). Because he sees every work, he judges every work: *Who will render to every man according to his deeds* (Romans 2:6). And the final word slams every excuse shut forever: *He has commanded no man to do wickedly, neither has he given any man licence to sin* (Ecclesiasticus 15:20) — there is no decree of Yahuah that authors a single sin. *His eyes are in every place, beholding the evil and the good* (Proverbs 15:3). It ain''t new: the seeing Elohim, the righteous render, the clean command.',
       sv.verse_id, ev.verse_id, 'extras', 58662
  FROM _session253_sir15_lookup sv, _session253_sir15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=15 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-15-fear-of-yahuah-obtains-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* Ben Sira''s opening — he that fears Yahuah and knows the law obtains wisdom — is Solomon''s own first principle (Sirach 15:1).'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-fear-of-yahuah-obtains-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* The fear of Yahuah that ''will do good'' and obtains wisdom in Sirach 15:1 is the very beginning of wisdom in Proverbs.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-fear-of-yahuah-obtains-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 2:5 — *Then shalt thou understand the fear of Yahuah (LORD), and find the knowledge of Elohim (God).* Knowledge of the law in Sirach 15:1 yields the fear of Yahuah and the knowledge of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-fear-of-yahuah-obtains-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 3:13 — *Happy is the man that findeth wisdom, and the man that getteth understanding.* The man fed *the bread of understanding* in Sirach 15:3 is the happy man who finds wisdom in Proverbs.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-fear-of-yahuah-obtains-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* Sirach''s nursing-mother wisdom who feeds the seeker (Sirach 15:3) is James''s wisdom freely given to whoever asks — Sirach''s closest NT sibling.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-fear-of-yahuah-obtains-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-15-wisdom-far-from-pride-and-sinners
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* Wisdom is *far from pride* in Sirach 15:8 because pride is the very road to ruin Proverbs charts.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-wisdom-far-from-pride-and-sinners'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 13:10 — *Only by pride cometh contention: but with the well advised is wisdom.* That the proud and the liars cannot remember her (Sirach 15:8) is Solomon''s pairing of pride against wisdom.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-wisdom-far-from-pride-and-sinners'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 15:8 — *This people draweth nigh unto me with their mouth, and honoureth me with their lips; but their heart is far from me.* Praise unseemly in a sinner''s mouth (Sirach 15:9) is the lip-honour without the heart that the Messiah rebukes.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-wisdom-far-from-pride-and-sinners'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-15-say-not-yahuah-made-me-fall
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:13 — *Let no man say when he is tempted, I am tempted of Elohim (God): for Elohim (God) cannot be tempted with evil, neither tempteth he any man.* James''s ''let no man say'' is Ben Sira''s ''Say not... it is through Yahuah that I fell away'' (Sirach 15:11) — almost word for word.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-say-not-yahuah-made-me-fall'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:14 — *But every man is tempted, when he is drawn away of his own lust, and enticed.* Against Sirach''s ''He has caused me to err'' (Sirach 15:12), James names the true cause: a man''s own lust, not Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-say-not-yahuah-made-me-fall'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 1:13 — *For Yahuah (God) made not death: neither has he pleasure in the destruction of the living.* The companion wisdom book on the same restored shelf seals Sirach 15:11 — Yahuah is no author of the fall or of death.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-say-not-yahuah-made-me-fall'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 5:4 — *For thou art not a Elohim (God) that hath pleasure in wickedness: neither shall evil dwell with thee.* Yahuah *hates all abomination* in Sirach 15:13 because no evil can dwell with him.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-say-not-yahuah-made-me-fall'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-15-the-freedom-of-the-will
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil.* Sirach''s ''Before man is life and death'' (Sirach 15:17) is Moses'' charge set before Israel verbatim in theme.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-the-freedom-of-the-will'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live.* ''whether him liketh shall be given him'' (Sirach 15:17) is Moses'' ''therefore choose life'' — the will set free to choose.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-the-freedom-of-the-will'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:7 — *If thou doest well, shalt thou not be accepted? and if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him.* Man left *in the hand of his counsel* (Sirach 15:14) is Cain told he can yet rule over sin — the will is his.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-the-freedom-of-the-will'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 24:15 — *And if it seem evil unto you to serve Yahuah (LORD), choose you this day whom ye will serve... but as for me and my house, we will serve Yahuah (LORD).* ''stretch forth your hand to whether you will'' (Sirach 15:16) is Joshua''s ''choose you this day'' — fire and water before the will.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-the-freedom-of-the-will'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 11:26 — *Behold, I set before you this day a blessing and a curse.* ''If you will, to keep the commandments'' (Sirach 15:15) is the blessing-and-curse Moses sets before the keeper of the law.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-the-freedom-of-the-will'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-15-all-seeing-elohim-no-licence-to-sin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 139:1 — *O Yahuah (LORD), thou hast searched me, and known me.* The Yahuah who *beholds all things* (Sirach 15:18) is David''s God who has searched and known him.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-all-seeing-elohim-no-licence-to-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 15:3 — *The eyes of Yahuah (LORD) are in every place, beholding the evil and the good.* Sirach''s all-beholding Yahuah (Sirach 15:18) is the proverb''s eyes-in-every-place.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-all-seeing-elohim-no-licence-to-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 2:6 — *Who will render to every man according to his deeds.* Because Yahuah *knoweth every work of man* (Sirach 15:19), Paul says he renders to every man by those works.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-all-seeing-elohim-no-licence-to-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 1:15 — *Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death.* Yahuah gave *no man licence to sin* (Sirach 15:20); sin is born of a man''s own conceived lust, not of any divine warrant.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-all-seeing-elohim-no-licence-to-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

