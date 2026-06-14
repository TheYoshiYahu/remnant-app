-- ----- fragment: minion_hermas_19.sql (session253 hermas 19) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch19. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm19 (view _session253_herm19_lookup). Sort band base 71950, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-19-elm-and-vine-members-need-one-another
  ('lightfoot-apostolic-fathers', 'hermas', 19, 1, 'canon', '1-corinthians', 12, 21, 'free', E'1 Corinthians 12:21 — *And the eye cannot say unto the hand, I have no need of thee: nor again the head to the feet, I have no need of you.* The elm that needs the vine and the vine that needs the elm are Sha''ul''s members of one body, none able to say it has no need of the other (Hermas 19:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 19, 1, 'canon', '1-corinthians', 12, 22, 'free', E'1 Corinthians 12:22 — *Nay, much more those members of the body, which seem to be more feeble, are necessary:* the poor man, who seems the weaker like the fruitless-looking elm, is no less necessary — his intercession bears fruit the rich cannot bear alone (Hermas 19:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 19, 1, 'canon', '2-corinthians', 8, 13, 'free', E'2 Corinthians 8:13 — *For I mean not that other men be eased, and ye burdened:* the Shepherd''s pairing of rich and poor is no transfer that empties one to fill the other, but the mutual supply Sha''ul frames — neither eased at the other''s burden (Hermas 19:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 19, 1, 'canon', '2-corinthians', 8, 14, 'free', E'2 Corinthians 8:14 — *But by an equality, that now at this time your abundance may be a supply for their want, that their abundance also may be a supply for your want: that there may be equality:* the rich supplying the poor''s needs and the poor supplying the rich with intercession is exactly Sha''ul''s equality — each abundance a supply for the other''s want (Hermas 19:1).'),
  -- thread: hermas-19-pity-on-the-poor-lendeth-to-yahuah
  ('lightfoot-apostolic-fathers', 'hermas', 19, 1, 'canon', 'proverbs', 19, 17, 'free', E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* The rich man who assists the poor and obtains a reward with Elohim is the man Mishle says lends to Yahuah, certain to be repaid — it ain''t new (Hermas 19:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 19, 1, 'canon', 'luke', 16, 9, 'free', E'Luke 16:9 — *And I say unto you, Make to yourselves friends of the mammon of unrighteousness; that, when ye fail, they may receive you into everlasting habitations.* The Shepherd''s rich man who works for the poor from the bounties of Yahuah and gains a reward above is doing just what the Master taught — turning riches into friends who receive him into the everlasting habitations (Hermas 19:1).'),
  -- thread: hermas-19-poor-rich-in-faith-and-intercession
  ('lightfoot-apostolic-fathers', 'hermas', 19, 1, 'canon', 'james', 2, 5, 'free', E'James 2:5 — *Hearken, my beloved brethren, Hath not Elohim (God) chosen the poor of this world rich in faith, and heirs of the kingdom which he hath promised to them that love him?* The Shepherd''s poor man, poor in goods but rich in intercession and acceptable before Elohim, is Ya''aqov''s poor chosen by Elohim, rich in faith and heirs of the kingdom (Hermas 19:1).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-19-elm-and-vine-members-need-one-another',
       E'The elm and the vine — the members cannot say, I have no need of thee',
       E'The Shepherd shows Hermas a type in the field: *‘This vine,’ saith he, ‘beareth fruit, but the elm is an unfruitful stock. Yet this vine, except it climb up the elm, cannot bear much fruit when it is spread on the ground; and such fruit as it beareth is rotten, because it is not suspended upon the elm. When then the vine is attached to the elm, it beareth fruit both from itself and from the elm.’* (Hermas 19:1) The rich and the poor are the elm and the vine — neither bears fully alone. It ain''t new: Sha''ul saw the same in the one body — *And the eye cannot say unto the hand, I have no need of thee: nor again the head to the feet, I have no need of you* (1 Corinthians 12:21), for *those members of the body, which seem to be more feeble, are necessary* (1 Corinthians 12:22). And the very leveling Hermas teaches — the rich supplying, the poor establishing — is Sha''ul''s equality: *that now at this time your abundance may be a supply for their want, that their abundance also may be a supply for your want: that there may be equality* (2 Corinthians 8:14). The elm bears in the vine, and the vine in the elm; the body has need of every member.',
       sv.verse_id, ev.verse_id, 'extras', 71950
  FROM _session253_herm19_lookup sv, _session253_herm19_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=19 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-19-pity-on-the-poor-lendeth-to-yahuah',
       E'He that giveth to the poor lendeth unto Yahuah',
       E'The Shepherd unfolds the type: *‘When then the rich man goeth up to the poor, and assisteth him in his needs, believing that for what he doth to the poor man he shall be able to obtain a reward with Elohim (God)... the rich man then supplieth all things to the poor man without wavering. But the poor man being supplied by the rich maketh intercession for him, thanking Elohim (God) for him that gave to him.’* (Hermas 19:1) The reward the rich man trusts to receive is the oldest promise in the Scriptures: *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Proverbs 19:17). What the rich man lays out on the poor is not lost but lent to Yahuah Himself — and the Master sealed it: *Make to yourselves friends of the mammon of unrighteousness; that, when ye fail, they may receive you into everlasting habitations* (Luke 16:9). The wealth spent on the poor, joined to the poor man''s prayer, lays up a reward above. It ain''t new — pity on the poor was ever a loan to heaven.',
       sv.verse_id, ev.verse_id, 'extras', 71953
  FROM _session253_herm19_lookup sv, _session253_herm19_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=19 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-19-poor-rich-in-faith-and-intercession',
       E'The poor man rich before Elohim — chosen, rich in faith',
       E'The Shepherd lifts up the poor man, who seems to bear nothing: *‘because the poor man is rich in intercession [and confession], and his intercession hath great power with Elohim (God)... for he knoweth that the intercession of the poor man is acceptable and rich before Elohim (God).’* (Hermas 19:1) The world counts the poor empty as the fruitless elm, yet they are full toward heaven. It ain''t new — Ya''aqov says the very thing: *Hath not Elohim (God) chosen the poor of this world rich in faith, and heirs of the kingdom which he hath promised to them that love him?* (James 2:5) The poor man, lacking in goods, is rich in the one wealth that counts — faith and the prayer that prevails with Elohim; and so the elm that seems barren in the sight of men nurtures the vine and bears fruit twofold.',
       sv.verse_id, ev.verse_id, 'extras', 71956
  FROM _session253_herm19_lookup sv, _session253_herm19_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=19 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-19-elm-and-vine-members-need-one-another
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 12:21 — *And the eye cannot say unto the hand, I have no need of thee: nor again the head to the feet, I have no need of you.* The elm that needs the vine and the vine that needs the elm are Sha''ul''s members of one body, none able to say it has no need of the other (Hermas 19:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm19_lookup sv, _session253_herm19_lookup tv
 WHERE t.slug='hermas-19-elm-and-vine-members-need-one-another'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=12 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 12:22 — *Nay, much more those members of the body, which seem to be more feeble, are necessary:* the poor man, who seems the weaker like the fruitless-looking elm, is no less necessary — his intercession bears fruit the rich cannot bear alone (Hermas 19:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm19_lookup sv, _session253_herm19_lookup tv
 WHERE t.slug='hermas-19-elm-and-vine-members-need-one-another'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=12 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 8:13 — *For I mean not that other men be eased, and ye burdened:* the Shepherd''s pairing of rich and poor is no transfer that empties one to fill the other, but the mutual supply Sha''ul frames — neither eased at the other''s burden (Hermas 19:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm19_lookup sv, _session253_herm19_lookup tv
 WHERE t.slug='hermas-19-elm-and-vine-members-need-one-another'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=8 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Corinthians 8:14 — *But by an equality, that now at this time your abundance may be a supply for their want, that their abundance also may be a supply for your want: that there may be equality:* the rich supplying the poor''s needs and the poor supplying the rich with intercession is exactly Sha''ul''s equality — each abundance a supply for the other''s want (Hermas 19:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm19_lookup sv, _session253_herm19_lookup tv
 WHERE t.slug='hermas-19-elm-and-vine-members-need-one-another'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=8 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-19-pity-on-the-poor-lendeth-to-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* The rich man who assists the poor and obtains a reward with Elohim is the man Mishle says lends to Yahuah, certain to be repaid — it ain''t new (Hermas 19:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm19_lookup sv, _session253_herm19_lookup tv
 WHERE t.slug='hermas-19-pity-on-the-poor-lendeth-to-yahuah'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 16:9 — *And I say unto you, Make to yourselves friends of the mammon of unrighteousness; that, when ye fail, they may receive you into everlasting habitations.* The Shepherd''s rich man who works for the poor from the bounties of Yahuah and gains a reward above is doing just what the Master taught — turning riches into friends who receive him into the everlasting habitations (Hermas 19:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm19_lookup sv, _session253_herm19_lookup tv
 WHERE t.slug='hermas-19-pity-on-the-poor-lendeth-to-yahuah'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-19-poor-rich-in-faith-and-intercession
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 2:5 — *Hearken, my beloved brethren, Hath not Elohim (God) chosen the poor of this world rich in faith, and heirs of the kingdom which he hath promised to them that love him?* The Shepherd''s poor man, poor in goods but rich in intercession and acceptable before Elohim, is Ya''aqov''s poor chosen by Elohim, rich in faith and heirs of the kingdom (Hermas 19:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm19_lookup sv, _session253_herm19_lookup tv
 WHERE t.slug='hermas-19-poor-rich-in-faith-and-intercession'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

