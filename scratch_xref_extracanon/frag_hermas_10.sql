-- ----- fragment: minion_hermas_10.sql (session253 hermas 10) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm10 (view _session253_herm10_lookup). Sort band base 71725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-10-longsuffering-fruit-spirit
  ('lightfoot-apostolic-fathers', 'hermas', 10, 1, 'canon', 'galatians', 5, 22, 'free', E'Galatians 5:22 — *But the fruit of the Spirit is love, joy, peace, longsuffering, gentleness, goodness, faith,* the apostle''s own list naming the very long-suffering Hermas 10:1 calls the sweet honey of the Spirit who abides pure within.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 1, 'canon', 'ephesians', 4, 2, 'free', E'Ephesians 4:2 — *With all lowliness and meekness, with longsuffering, forbearing one another in love;* the walk worthy of the calling that matches Hermas 10:1''s mastery over evil through long-suffering.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 1, 'canon', '1-corinthians', 13, 4, 'free', E'1 Corinthians 13:4 — *Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up,* the love that suffers long, sweeter than honey, in which Yahuah dwells per Hermas 10:1.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 1, 'canon', 'proverbs', 14, 29, 'free', E'Proverbs 14:29 — *He that is slow to wrath is of great understanding: but he that is hasty of spirit exalteth folly.* The Tanakh already weds long-suffering to understanding, exactly as Hermas 10:1 opens: be long-suffering and understanding.'),
  -- thread: hermas-10-angry-temper-double-minded
  ('lightfoot-apostolic-fathers', 'hermas', 10, 2, 'canon', 'james', 1, 8, 'free', E'James 1:8 — *A double minded man is unstable in all his ways.* James names the very dipsuchos (double-minded) man whom Hermas 10:2 says the angry temper leads astray, while it cannot move the one full in faith.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 2, 'canon', 'james', 1, 19, 'free', E'James 1:19 — *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath:* the apostolic counsel against the wrath that Hermas 10:2 traces from foolishness into bitterness, wrath, anger, and spite.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 2, 'canon', 'james', 1, 20, 'free', E'James 1:20 — *For the wrath of man worketh not the righteousness of Elohim (God).* This is precisely why the angry temper leads the servant astray from righteousness in Hermas 10:2.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 2, 'canon', 'proverbs', 14, 17, 'free', E'Proverbs 14:17 — *He that is soon angry dealeth foolishly: and a man of wicked devices is hated.* The Tanakh already calls anger foolish, the same diagnosis Hermas 10:2 gives: angry temper is in the first place foolish, fickle, and senseless.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 2, 'canon', 'ecclesiastes', 7, 9, 'free', E'Ecclesiastes 7:9 — *Be not hasty in thy spirit to be angry: for anger resteth in the bosom of fools.* The preacher lodges anger in the fool''s bosom, echoing Hermas 10:2''s chain of evil elements composing the great and incurable sin.'),
  -- thread: hermas-10-grieve-not-the-spirit-keep-commandment
  ('lightfoot-apostolic-fathers', 'hermas', 10, 1, 'canon', 'ephesians', 4, 30, 'free', E'Ephesians 4:30 — *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption.* The grieved, sealed Spirit is the same delicate Ruach who, in Hermas 10:1, is straitened and seeks to retire when the angry temper approaches.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 1, 'canon', 'ephesians', 4, 31, 'free', E'Ephesians 4:31 — *Let all bitterness, and wrath, and anger, and clamour, and evil speaking, be put away from you, with all malice:* the very catalogue of bitterness and wrath Hermas 10:1 says chokes the Spirit out of the vessel.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 1, 'canon', '1-corinthians', 3, 16, 'free', E'1 Corinthians 3:16 — *Know ye not that ye are the temple of Elohim (God), and that the Spirit of Elohim (God) dwelleth in you?* The believer is the vessel of Hermas 10:1 in which the Ruach HaKodesh abides and must be kept pure.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 2, 'canon', 'john', 14, 15, 'free', E'John 14:15 — *If ye love me, keep my commandments.* Hermas 10:2''s charge never to neglect this commandment, that one may keep the remaining commandments, is the Master''s own word — the commandments stand.'),
  ('lightfoot-apostolic-fathers', 'hermas', 10, 2, 'canon', 'john', 14, 16, 'free', E'John 14:16 — *And I will pray the Father, and he shall give you another Comforter, that he may abide with you for ever;* the abiding Comforter is the very Spirit Hermas 10:1-2 says dwells in the kept vessel and departs from the wrathful one.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-10-longsuffering-fruit-spirit',
       E'Long-suffering, the sweet honey: the fruit of the indwelling Spirit',
       E'Mandate 5 sets long-suffering against angry temper and makes the heart a vessel for the Ruach HaKodesh: *Be thou long-suffering and understanding, he saith, and thou shalt have the mastery over all evil deeds, and shalt work all righteousness. For if thou art long-suffering, the Ruach HaKodesh (Holy Spirit) that abideth in thee shall be pure, not being darkened by another evil spirit... For if you take a little wormwood, and pour it into a jar of honey, is not the whole of the honey spoiled... long-suffering is very sweet, beyond the sweetness of honey, and is useful to Yahuah (Lord), and He dwelleth in it* (Hermas 10:1). It ain''t new — this is the apostle''s own list: *But the fruit of the Spirit is love, joy, peace, longsuffering, gentleness, goodness, faith* (Galatians 5:22); *With all lowliness and meekness, with longsuffering, forbearing one another in love* (Ephesians 4:2); *Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up* (1 Corinthians 13:4). And the proverb already knew it: *He that is slow to wrath is of great understanding: but he that is hasty of spirit exalteth folly* (Proverbs 14:29). The single drop of wormwood that ruins the honey is the angry temper that grieves the gentle Spirit dwelling within.',
       sv.verse_id, ev.verse_id, 'extras', 71725
  FROM _session253_herm10_lookup sv, _session253_herm10_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=10 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-10-angry-temper-double-minded',
       E'Angry temper subverts the double-minded; faith stands firm',
       E'The Shepherd unfolds how the angry temper works ruin: *Hear now, saith he, the working of angry temper, how evil it is, and how it subverteth the servants of Elohim (God)... But it doth not lead astray them that are full in the faith, nor can it work upon them, because the power of Yahuah (Lord) is with them; but them that are empty and double-minded it leadeth astray... then from foolishness is engendered bitterness, and from bitterness wrath, and from wrath anger, and from anger spite* (Hermas 10:2). The same double-minded instability is named by James: *A double minded man is unstable in all his ways* (James 1:8); and the same chain from wrath to ruin: *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath: For the wrath of man worketh not the righteousness of Elohim (God)* (James 1:19-20). The proverb seals it: *He that is soon angry dealeth foolishly: and a man of wicked devices is hated* (Proverbs 14:17); and the preacher: *Be not hasty in thy spirit to be angry: for anger resteth in the bosom of fools* (Ecclesiastes 7:9). The faithful are kept; the wavering are dragged about — election holds the heart that the temper cannot pry loose.',
       sv.verse_id, ev.verse_id, 'extras', 71728
  FROM _session253_herm10_lookup sv, _session253_herm10_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=10 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-10-grieve-not-the-spirit-keep-commandment',
       E'Grieve not the Spirit: the pure vessel, the kept commandment',
       E'The delicate Spirit will not share the vessel with wrath: *if any angry temper approach, forthwith the Ruach HaKodesh (Holy Spirit), being delicate, is straitened, not having the place clear, and seeketh to retire from the place; for he is being choked by the evil spirit* (Hermas 10:1); and the charge to keep this commandment so the rest may be kept: *See then that thou never neglect this commandment; for if thou master this commandment, thou shalt be able likewise to keep the remaining commandments* (Hermas 10:2). Paul says the same of the sealed Spirit and the bitterness that drives Him out: *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption. Let all bitterness, and wrath, and anger, and clamour, and evil speaking, be put away from you, with all malice* (Ephesians 4:30-31). The believer is that vessel: *Know ye not that ye are the temple of Elohim (God), and that the Spirit of Elohim (God) dwelleth in you?* (1 Corinthians 3:16). And the Master Himself binds love, the kept commandment, and the abiding Comforter together: *If ye love me, keep my commandments. And I will pray the Father, and he shall give you another Comforter, that he may abide with you for ever* (John 14:15-16). It ain''t new — the commandments stand, and the Spirit dwells in the heart that keeps them.',
       sv.verse_id, ev.verse_id, 'extras', 71731
  FROM _session253_herm10_lookup sv, _session253_herm10_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=10 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-10-longsuffering-fruit-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 5:22 — *But the fruit of the Spirit is love, joy, peace, longsuffering, gentleness, goodness, faith,* the apostle''s own list naming the very long-suffering Hermas 10:1 calls the sweet honey of the Spirit who abides pure within.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-longsuffering-fruit-spirit'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 4:2 — *With all lowliness and meekness, with longsuffering, forbearing one another in love;* the walk worthy of the calling that matches Hermas 10:1''s mastery over evil through long-suffering.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-longsuffering-fruit-spirit'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 13:4 — *Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up,* the love that suffers long, sweeter than honey, in which Yahuah dwells per Hermas 10:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-longsuffering-fruit-spirit'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=13 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 14:29 — *He that is slow to wrath is of great understanding: but he that is hasty of spirit exalteth folly.* The Tanakh already weds long-suffering to understanding, exactly as Hermas 10:1 opens: be long-suffering and understanding.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-longsuffering-fruit-spirit'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=14 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-10-angry-temper-double-minded
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:8 — *A double minded man is unstable in all his ways.* James names the very dipsuchos (double-minded) man whom Hermas 10:2 says the angry temper leads astray, while it cannot move the one full in faith.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-angry-temper-double-minded'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:19 — *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath:* the apostolic counsel against the wrath that Hermas 10:2 traces from foolishness into bitterness, wrath, anger, and spite.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-angry-temper-double-minded'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:20 — *For the wrath of man worketh not the righteousness of Elohim (God).* This is precisely why the angry temper leads the servant astray from righteousness in Hermas 10:2.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-angry-temper-double-minded'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 14:17 — *He that is soon angry dealeth foolishly: and a man of wicked devices is hated.* The Tanakh already calls anger foolish, the same diagnosis Hermas 10:2 gives: angry temper is in the first place foolish, fickle, and senseless.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-angry-temper-double-minded'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=14 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiastes 7:9 — *Be not hasty in thy spirit to be angry: for anger resteth in the bosom of fools.* The preacher lodges anger in the fool''s bosom, echoing Hermas 10:2''s chain of evil elements composing the great and incurable sin.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-angry-temper-double-minded'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-10-grieve-not-the-spirit-keep-commandment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 4:30 — *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption.* The grieved, sealed Spirit is the same delicate Ruach who, in Hermas 10:1, is straitened and seeks to retire when the angry temper approaches.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-grieve-not-the-spirit-keep-commandment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 4:31 — *Let all bitterness, and wrath, and anger, and clamour, and evil speaking, be put away from you, with all malice:* the very catalogue of bitterness and wrath Hermas 10:1 says chokes the Spirit out of the vessel.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-grieve-not-the-spirit-keep-commandment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 3:16 — *Know ye not that ye are the temple of Elohim (God), and that the Spirit of Elohim (God) dwelleth in you?* The believer is the vessel of Hermas 10:1 in which the Ruach HaKodesh abides and must be kept pure.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-grieve-not-the-spirit-keep-commandment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 14:15 — *If ye love me, keep my commandments.* Hermas 10:2''s charge never to neglect this commandment, that one may keep the remaining commandments, is the Master''s own word — the commandments stand.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-grieve-not-the-spirit-keep-commandment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'John 14:16 — *And I will pray the Father, and he shall give you another Comforter, that he may abide with you for ever;* the abiding Comforter is the very Spirit Hermas 10:1-2 says dwells in the kept vessel and departs from the wrathful one.'
  FROM cross_reference_threads t, cross_references x, _session253_herm10_lookup sv, _session253_herm10_lookup tv
 WHERE t.slug='hermas-10-grieve-not-the-spirit-keep-commandment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

