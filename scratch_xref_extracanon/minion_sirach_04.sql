-- ----- fragment: minion_ecclesiasticus_04.sql (session253 ecclesiasticus 4) -----
-- Source anchor: apocrypha/ecclesiasticus ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir04 (view _session253_sir04_lookup). Sort band base 58375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-4-defraud-not-the-poor
  ('apocrypha', 'ecclesiasticus', 4, 1, 'canon', 'deuteronomy', 15, 7, 'free', E'Deuteronomy 15:7 — *If there be among you a poor man of one of thy brethren within any of thy gates in thy land which Yahuah Elohayka (the LORD thy God) giveth thee, thou shalt not harden thine heart, nor shut thine hand from thy poor brother:* The Torah forbids the very hardening Ben Sira warns against when he says defraud not the poor of his living.'),
  ('apocrypha', 'ecclesiasticus', 4, 1, 'canon', 'deuteronomy', 15, 8, 'free', E'Deuteronomy 15:8 — *But thou shalt open thine hand wide unto him, and shalt surely lend him sufficient for his need, in that which he wanteth.* The open hand of Deuteronomy is the answer to Sirach''s needy eyes that must not be made to wait long.'),
  ('apocrypha', 'ecclesiasticus', 4, 6, 'canon', 'deuteronomy', 15, 9, 'free', E'Deuteronomy 15:9 — *Beware that there be not a thought in thy wicked heart, saying, The seventh year, the year of release, is at hand; and thine eye be evil against thy poor brother, and thou givest him nought; and he cry unto Yahuah (LORD) against thee, and it be sin unto thee.* The very curse Sirach 4:6 dreads — the poor man''s cry reaching his Maker as sin against the giver — is Moses'' own warning.'),
  ('apocrypha', 'ecclesiasticus', 4, 1, 'canon', 'proverbs', 19, 17, 'free', E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* Sirach''s plea not to defraud the poor rests on the same accounting: mercy to the needy is a loan made to Yahuah Himself.'),
  -- thread: ecclesiasticus-4-hungry-soul-i-was-an-hungred
  ('apocrypha', 'ecclesiasticus', 4, 2, 'canon', 'matthew', 25, 35, 'free', E'Matthew 25:35 — *For I was an hungred, and ye gave me meat: I was thirsty, and ye gave me drink: I was a stranger, and ye took me in:* The Messiah identifies with the hungry soul Ben Sira forbids us to make sorrowful, counting mercy to the least as mercy to Himself.'),
  ('apocrypha', 'ecclesiasticus', 4, 4, 'canon', 'isaiah', 58, 7, 'free', E'Isaiah 58:7 — *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* Isaiah''s chosen fast is the opposite of turning the face away from a poor man that Sirach 4:4 condemns.'),
  ('apocrypha', 'ecclesiasticus', 4, 2, 'canon', 'james', 2, 15, 'free', E'James 2:15 — *If a brother or sister be naked, and destitute of daily food,* James, the wisdom-book of the New Testament nearest to Sirach, sets the same hungry brother before us whom Ben Sira says we must not provoke in his distress.'),
  ('apocrypha', 'ecclesiasticus', 4, 2, 'canon', 'james', 2, 16, 'free', E'James 2:16 — *And one of you say unto them, Depart in peace, be ye warmed and filled; notwithstanding ye give them not those things which are needful to the body; what doth it profit?* The hollow word that leaves the hungry sorrowful is exactly what Sirach 4:2 forbids.'),
  -- thread: ecclesiasticus-4-father-to-the-fatherless
  ('apocrypha', 'ecclesiasticus', 4, 10, 'canon', 'psalms', 68, 5, 'free', E'Psalm 68:5 — *A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation.* To be a father to the fatherless, as Sirach 4:10 urges, is to mirror Yahuah Himself, who is the orphan''s Father and the widow''s Judge.'),
  ('apocrypha', 'ecclesiasticus', 4, 10, 'canon', 'james', 1, 27, 'free', E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* James, Sirach''s nearest NT kin, makes care for the fatherless and widow the mark of pure religion, just as Sirach 4:10 makes it the mark of the son of the Most High.'),
  ('apocrypha', 'ecclesiasticus', 4, 9, 'canon', 'isaiah', 58, 6, 'free', E'Isaiah 58:6 — *Is not this the fast that I have chosen? to loose the bands of wickedness, to undo the heavy burdens, and to let the oppressed go free, and that ye break every yoke?* Delivering the one who suffers wrong from the oppressor, the charge of Sirach 4:9, is the very fast Yahuah declares He has chosen.'),
  -- thread: ecclesiasticus-4-wisdom-exalteth-her-children
  ('apocrypha', 'ecclesiasticus', 4, 12, 'canon', 'proverbs', 8, 17, 'free', E'Proverbs 8:17 — *I love them that love me; and those that seek me early shall find me.* Lady Wisdom''s own promise stands behind Sirach 4:12: he that loves her loves life, and they that seek her early are filled with joy.'),
  ('apocrypha', 'ecclesiasticus', 4, 13, 'canon', 'proverbs', 8, 21, 'free', E'Proverbs 8:21 — *That I may cause those that love me to inherit substance; and I will fill their treasures.* Wisdom''s inheritance for those who love her is the glory Sirach 4:13 says he that holdeth her fast shall inherit.'),
  ('apocrypha', 'ecclesiasticus', 4, 11, 'canon', 'proverbs', 4, 6, 'free', E'Proverbs 4:6 — *Forsake her not, and she shall preserve thee: love her, and she shall keep thee.* The mutual hold of Sirach 4:11, where wisdom layeth hold of them that seek her, is Proverbs'' counsel to love her and be kept.'),
  ('apocrypha', 'ecclesiasticus', 4, 12, 'apocrypha', 'the-wisdom-of-solomon', 6, 12, 'extras', E'Wisdom of Solomon 6:12 — *Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her.* Sirach''s apocryphal sister-book speaks the same lady Wisdom whom to love is to love life, found of all who seek her early.'),
  -- thread: ecclesiasticus-4-strive-for-the-truth-to-death
  ('apocrypha', 'ecclesiasticus', 4, 17, 'canon', 'proverbs', 3, 11, 'free', E'Proverbs 3:11 — *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction:* Wisdom''s tormenting discipline in Sirach 4:17, which tries the soul by her laws, is the loving correction Proverbs tells the son not to despise.'),
  ('apocrypha', 'ecclesiasticus', 4, 17, 'canon', 'hebrews', 12, 6, 'free', E'Hebrews 12:6 — *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* The fear, dread, and discipline by which wisdom proves him in Sirach 4:17 is the scourging Hebrews reads as the proof of sonship, not rejection.'),
  ('apocrypha', 'ecclesiasticus', 4, 26, 'canon', 'proverbs', 28, 13, 'free', E'Proverbs 28:13 — *He that covereth his sins shall not prosper: but whoso confesseth and forsaketh them shall have mercy.* Ben Sira''s charge not to be ashamed to confess your sins (Sirach 4:26) is the Proverb''s open road to mercy through confession and forsaking.'),
  ('apocrypha', 'ecclesiasticus', 4, 26, 'canon', '1-john', 1, 9, 'free', E'1 John 1:9 — *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.* The unashamed confession Sirach 4:26 commands meets the gospel''s pledge of a faithful and just forgiveness.'),
  ('apocrypha', 'ecclesiasticus', 4, 28, 'canon', 'matthew', 10, 32, 'free', E'Matthew 10:32 — *Whosoever therefore shall confess me before men, him will I confess also before my Father which is in heaven.* To strive for the truth to death (Sirach 4:28) with Yahuah fighting for thee is the confessing-unto-the-end the Messiah crowns before the Father.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-4-defraud-not-the-poor',
       E'Defraud not the poor — his cry is heard of Him that made him',
       E'Ben Sira opens with the cry of the needy laid on the conscience: *My son, defraud not the poor of his living, and make not the needy eyes to wait long.* (Ecclesiasticus 4:1), so that *if he curse you in the bitterness of his soul, his prayer shall be heard of him that made him.* (Ecclesiasticus 4:6). This is no new ethic but the Torah''s own wide-open hand: *If there be among you a poor man of one of thy brethren within any of thy gates in thy land which Yahuah Elohayka (the LORD thy God) giveth thee, thou shalt not harden thine heart, nor shut thine hand from thy poor brother:* (Deuteronomy 15:7) — *But thou shalt open thine hand wide unto him* (Deuteronomy 15:8), lest *he cry unto Yahuah (LORD) against thee, and it be sin unto thee.* (Deuteronomy 15:9). The Proverb makes the loan a covenant transaction: *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* (Proverbs 19:17). Ben Sira''s wisdom and the Law are one tongue.',
       sv.verse_id, ev.verse_id, 'extras', 58375
  FROM _session253_sir04_lookup sv, _session253_sir04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-4-hungry-soul-i-was-an-hungred',
       E'Make not an hungry soul sorrowful — I was an hungred and ye gave me meat',
       E'Ben Sira charges: *Make not an hungry soul sorrowful; neither provoke a man in his distress.* (Ecclesiasticus 4:2), and *Reject not the supplication of the afflicted; neither turn away your face from a poor man.* (Ecclesiasticus 4:4). The Messiah will fold this very mercy into the judgment of the nations: *For I was an hungred, and ye gave me meat: I was thirsty, and ye gave me drink: I was a stranger, and ye took me in:* (Matthew 25:35) — done to the least, done to the King. Isaiah had already named it the fast Yahuah chooses: *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house?* (Isaiah 58:7), with the promise *Then shall thy light break forth as the morning* (Isaiah 58:8). And James, the closest NT sibling of Sirach, exposes the empty word that feeds no one: *If a brother or sister be naked, and destitute of daily food* (James 2:15), *And one of you say unto them, Depart in peace, be ye warmed and filled; notwithstanding ye give them not those things which are needful to the body; what doth it profit?* (James 2:16). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58378
  FROM _session253_sir04_lookup sv, _session253_sir04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-4-father-to-the-fatherless',
       E'Be as a father to the fatherless — so shalt thou be as the son of the Most High',
       E'Ben Sira lifts mercy to the orphan into kinship with Heaven: *Be as a father to the fatherless, and instead of an husband to their mother: so shall you be as the son of the Most High, and he shall love you more than your mother does.* (Ecclesiasticus 4:10), having first urged: *Deliver him that suffers wrong from the hand of the oppressor; and be not fainthearted when you sittest in judgment.* (Ecclesiasticus 4:9). This is the very portrait of Yahuah Himself: *A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation.* (Psalm 68:5) — so to father the fatherless is to bear His own image. James names this the heart of true worship: *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* (James 1:27). And the Sermon promises the peacemaking, merciful son the Father''s likeness, as Sirach promises the orphan''s defender shall be called the son of the Most High.',
       sv.verse_id, ev.verse_id, 'extras', 58381
  FROM _session253_sir04_lookup sv, _session253_sir04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=4 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-4-wisdom-exalteth-her-children',
       E'Whoso loveth her loveth life — wisdom exalteth her children',
       E'Sirach turns from mercy to the lady Wisdom herself: *Wisdom exalteth her children, and layeth hold of them that seek her.* (Ecclesiasticus 4:11), *He that loves her loves life; and they that seek to her early shall be filled with joy.* (Ecclesiasticus 4:12), *He that holdeth her fast shall inherit glory; and wherever she entereth, Yahuah (God) will bless.* (Ecclesiasticus 4:13). This is Proverbs 8 made plain — the formed Wisdom of Yahuah declaring *I love them that love me; and those that seek me early shall find me.* (Proverbs 8:17), whose gift is *Riches and honour are with me; yea, durable riches and righteousness.* (Proverbs 8:18), and *That I may cause those that love me to inherit substance; and I will fill their treasures.* (Proverbs 8:21). Proverbs 4 commands the same fast embrace: *Forsake her not, and she shall preserve thee: love her, and she shall keep thee.* (Proverbs 4:6). And the live Wisdom of Solomon, Sirach''s apocryphal sister, echoes it: *Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her.* (Wisdom of Solomon 6:12).',
       sv.verse_id, ev.verse_id, 'extras', 58384
  FROM _session253_sir04_lookup sv, _session253_sir04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=4 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-4-strive-for-the-truth-to-death',
       E'Strive for the truth to death — and Yahuah shall fight for thee',
       E'The chapter''s summit binds discipline, confession, and faithfulness unto death. Wisdom first proves her own: *For at the first she will walk with him by crooked ways, and bring fear and dread upon him, and torment him with her discipline, until she may trust his soul, and try him by her laws.* (Ecclesiasticus 4:17) — the very chastening Proverbs names love: *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction:* (Proverbs 3:11), which Hebrews seals, *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* (Hebrews 12:6). Then Ben Sira: *Be not ashamed to confess your sins; and force not the course of the river.* (Ecclesiasticus 4:26) — *whoso confesseth and forsaketh them shall have mercy.* (Proverbs 28:13), and the gospel''s own pledge, *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.* (1 John 1:9). And the crown: *Strive for the truth to death, and Yahuah (God) shall fight for you.* (Ecclesiasticus 4:28) — Torah-faithfulness unto the end, with the promise that he who confesses Him is confessed: *Whosoever therefore shall confess me before men, him will I confess also before my Father which is in heaven.* (Matthew 10:32).',
       sv.verse_id, ev.verse_id, 'extras', 58387
  FROM _session253_sir04_lookup sv, _session253_sir04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=4 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-4-defraud-not-the-poor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 15:7 — *If there be among you a poor man of one of thy brethren within any of thy gates in thy land which Yahuah Elohayka (the LORD thy God) giveth thee, thou shalt not harden thine heart, nor shut thine hand from thy poor brother:* The Torah forbids the very hardening Ben Sira warns against when he says defraud not the poor of his living.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-defraud-not-the-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 15:8 — *But thou shalt open thine hand wide unto him, and shalt surely lend him sufficient for his need, in that which he wanteth.* The open hand of Deuteronomy is the answer to Sirach''s needy eyes that must not be made to wait long.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-defraud-not-the-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 15:9 — *Beware that there be not a thought in thy wicked heart, saying, The seventh year, the year of release, is at hand; and thine eye be evil against thy poor brother, and thou givest him nought; and he cry unto Yahuah (LORD) against thee, and it be sin unto thee.* The very curse Sirach 4:6 dreads — the poor man''s cry reaching his Maker as sin against the giver — is Moses'' own warning.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-defraud-not-the-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* Sirach''s plea not to defraud the poor rests on the same accounting: mercy to the needy is a loan made to Yahuah Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-defraud-not-the-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-4-hungry-soul-i-was-an-hungred
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 25:35 — *For I was an hungred, and ye gave me meat: I was thirsty, and ye gave me drink: I was a stranger, and ye took me in:* The Messiah identifies with the hungry soul Ben Sira forbids us to make sorrowful, counting mercy to the least as mercy to Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-hungry-soul-i-was-an-hungred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 58:7 — *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* Isaiah''s chosen fast is the opposite of turning the face away from a poor man that Sirach 4:4 condemns.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-hungry-soul-i-was-an-hungred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 2:15 — *If a brother or sister be naked, and destitute of daily food,* James, the wisdom-book of the New Testament nearest to Sirach, sets the same hungry brother before us whom Ben Sira says we must not provoke in his distress.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-hungry-soul-i-was-an-hungred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 2:16 — *And one of you say unto them, Depart in peace, be ye warmed and filled; notwithstanding ye give them not those things which are needful to the body; what doth it profit?* The hollow word that leaves the hungry sorrowful is exactly what Sirach 4:2 forbids.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-hungry-soul-i-was-an-hungred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-4-father-to-the-fatherless
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 68:5 — *A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation.* To be a father to the fatherless, as Sirach 4:10 urges, is to mirror Yahuah Himself, who is the orphan''s Father and the widow''s Judge.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-father-to-the-fatherless'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=68 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* James, Sirach''s nearest NT kin, makes care for the fatherless and widow the mark of pure religion, just as Sirach 4:10 makes it the mark of the son of the Most High.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-father-to-the-fatherless'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 58:6 — *Is not this the fast that I have chosen? to loose the bands of wickedness, to undo the heavy burdens, and to let the oppressed go free, and that ye break every yoke?* Delivering the one who suffers wrong from the oppressor, the charge of Sirach 4:9, is the very fast Yahuah declares He has chosen.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-father-to-the-fatherless'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-4-wisdom-exalteth-her-children
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 8:17 — *I love them that love me; and those that seek me early shall find me.* Lady Wisdom''s own promise stands behind Sirach 4:12: he that loves her loves life, and they that seek her early are filled with joy.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-wisdom-exalteth-her-children'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 8:21 — *That I may cause those that love me to inherit substance; and I will fill their treasures.* Wisdom''s inheritance for those who love her is the glory Sirach 4:13 says he that holdeth her fast shall inherit.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-wisdom-exalteth-her-children'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 4:6 — *Forsake her not, and she shall preserve thee: love her, and she shall keep thee.* The mutual hold of Sirach 4:11, where wisdom layeth hold of them that seek her, is Proverbs'' counsel to love her and be kept.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-wisdom-exalteth-her-children'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 6:12 — *Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her.* Sirach''s apocryphal sister-book speaks the same lady Wisdom whom to love is to love life, found of all who seek her early.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-wisdom-exalteth-her-children'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-4-strive-for-the-truth-to-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 3:11 — *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction:* Wisdom''s tormenting discipline in Sirach 4:17, which tries the soul by her laws, is the loving correction Proverbs tells the son not to despise.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-strive-for-the-truth-to-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 12:6 — *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* The fear, dread, and discipline by which wisdom proves him in Sirach 4:17 is the scourging Hebrews reads as the proof of sonship, not rejection.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-strive-for-the-truth-to-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 28:13 — *He that covereth his sins shall not prosper: but whoso confesseth and forsaketh them shall have mercy.* Ben Sira''s charge not to be ashamed to confess your sins (Sirach 4:26) is the Proverb''s open road to mercy through confession and forsaking.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-strive-for-the-truth-to-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=28 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 1:9 — *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.* The unashamed confession Sirach 4:26 commands meets the gospel''s pledge of a faithful and just forgiveness.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-strive-for-the-truth-to-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 10:32 — *Whosoever therefore shall confess me before men, him will I confess also before my Father which is in heaven.* To strive for the truth to death (Sirach 4:28) with Yahuah fighting for thee is the confessing-unto-the-end the Messiah crowns before the Father.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-strive-for-the-truth-to-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

