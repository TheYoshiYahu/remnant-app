-- ----- fragment: minion_2adameve_18.sql (session253 2-adam-eve 18) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch18. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae18 (view _session253_2ae18_lookup). Sort band base 66425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-18-satan-false-apparition
  ('adam-eve-conflict', '2-adam-eve', 18, 2, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The very deceit the elders name in 2 Adam & Eve 18:2 is the apparition Sha''ul warns is Satan''s standing disguise.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 2, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* The bodies say Satan would destroy Jared *as he destroyed Cain* (18:2) — the same wicked one working the same end down the line.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 2, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The devil who *wrought a great and false apparition* against Jared (18:3) is the prowling adversary Kepha says is always hunting the seed.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 3, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The elders'' cry to *deliver our son from the hand of Satan* (18:3) is the same resistance Ya''aqob says puts the deceiver to flight.'),
  -- thread: 2-adam-eve-18-fathers-intercede
  ('adam-eve-conflict', '2-adam-eve', 18, 8, 'canon', 'revelation', 5, 8, 'free', E'Revelation 5:8 — *And when he had taken the book, the four beasts and four and twenty elders fell down before the Lamb, having every one of them harps, and golden vials full of odours, which are the prayers of saints.* The fathers *praying for his deliverance* (18:8) are of one company with the prayers of the saints kept in golden vials before the Lamb.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 9, 'canon', 'hebrews', 7, 25, 'free', E'Hebrews 7:25 — *Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them.* Jared begs his fathers'' *intercession* (18:9), which points beyond them to the one Mediator who ever liveth to make it.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 9, 'canon', 'luke', 22, 31, 'free', E'Luke 22:31 — *And Yahuah (Lord) said, Simon, Simon, behold, Satan hath desired to have you, that he may sift you as wheat:* Jared asks to be hidden *from him unto the day of my death* (18:9) — the same sifting hand Messiah warns reaches for His own, met by intercession.'),
  -- thread: 2-adam-eve-18-adam-command-offer-gifts
  ('adam-eve-conflict', '2-adam-eve', 18, 10, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam''s charge to *offer gifts to Elohim* on the altar (18:10) is the same calling on the Name kept by Seth''s line down to Jared.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 10, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s *apparitions, wishing to destroy* Adam (18:10) are the serpent''s enmity against the seed, declared in the garden from the start.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 11, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Adam bids his people *be on their guard against him* (18:11); Sha''ul gives the end of that guard — the deceiver bruised under the feet of the seed.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 10, 'jubilees', 'jubilees', 4, 15, 'extras', E'Jubilees 4:15 — *And in the second week of the tenth jubilee Mahalalel took to him to wife Dînâh... and she bare him a son... and he called his name Jared; for in his days the angels of Yahuah (God) descended on the earth, those who are named the Watchers...* The very Jared whom Adam''s voice charges (18:10) is named in Jubilees for the days when the Watchers fell — the same primeval seed-war from another witness.'),
  -- thread: 2-adam-eve-18-sacred-fire-blessing
  ('adam-eve-conflict', '2-adam-eve', 18, 14, 'canon', 'leviticus', 6, 13, 'free', E'Leviticus 6:13 — *The fire shall ever be burning upon the altar; it shall never go out.* The *sacred fire from the altar* that Jared must never let lapse (18:14) is the unceasing altar-fire Torah later writes into the law — the way kept before Sinai.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 13, 'canon', 'genesis', 8, 21, 'free', E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man’s sake; for the imagination of man’s heart is evil from his youth...* Jared''s offering *accepted* on the altar (18:13) is of one savour with Noah''s, the covenant mercy that keeps the seed against the curse.'),
  ('adam-eve-conflict', '2-adam-eve', 18, 14, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The Elohim who *appeared* and *blessed* on the altar (18:14) is the same manifested Son who comes to undo the deceiver''s apparitions throughout this book.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-18-satan-false-apparition',
       E'Satan in an apparition has deceived our son',
       E'The voices from the holy bodies name the enemy by his oldest craft: *"Satan in an apparition has deceived our son, wishing to destroy him, as he destroyed our son Cain."* (2 Adam & Eve 18:2). It ain''t new — Sha''ul tells the same story plainly: *And no marvel; for Satan himself is transformed into an angel of light.* (2 Corinthians 11:14). The adversary is *as a roaring lion* (1 Peter 5:8), and the cave''s elders pray the only counter there is: *"Yahuah Elohim of heaven and earth, deliver our son from the hand of Satan, who wrought a great and false apparition before him."* (2 Adam & Eve 18:3) — *Resist the devil, and he will flee from you.* (James 4:7). The same enemy that struck the first murderer is striking the seed kept in the cave: *Not as Cain, who was of that wicked one, and slew his brother.* (1 John 3:12).',
       sv.verse_id, ev.verse_id, 'extras', 66425
  FROM _session253_2ae18_lookup sv, _session253_2ae18_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=18 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-18-fathers-intercede',
       E'Through your intercession, let Elohim deliver me',
       E'Jared falls upon the holy bodies and pleads: *"O my fathers, through your intercession, let Elohim deliver me from the hand of Satan!"* — and finds the fathers *themselves praying for his deliverance from the hand of Satan.* (2 Adam & Eve 18:8-9). The righteous before the throne are heard the same way in the Revelation: *golden vials full of odours, which are the prayers of saints.* (Revelation 5:8). And there is One whose intercession never ceases — *Wherefore he is able also to save them to the uttermost that come unto Elohim by him, seeing he ever liveth to make intercession for them.* (Hebrews 7:25). The enemy still desires to sift the seed — *Simon, Simon, behold, Satan hath desired to have you, that he may sift you as wheat:* (Luke 22:31) — but the prayer of the righteous keeps the watch on the mountain of the cave.',
       sv.verse_id, ev.verse_id, 'extras', 66428
  FROM _session253_2ae18_lookup sv, _session253_2ae18_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=18 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-18-adam-command-offer-gifts',
       E'Offer gifts to Elohim, and beware of Satan',
       E'Adam''s own voice breaks from the bodies and lays down the way kept before Sinai: *"O Jared, my son, offer gifts to Elohim for having delivered thee from the hand of Satan... offerest them on the altar on which I did offer. Then also, beware of Satan; for he deluded me many a time with his apparitions, wishing to destroy me, but Elohim delivered me out of his hand."* (2 Adam & Eve 18:10). This is the worship of the seed from the first day outside the garden — *then began men to call upon the name of Yahuah.* (Genesis 4:26). It is the altar Noah will keep — *And Noah builded an altar unto Yahuah; and took of every clean beast... and offered burnt offerings on the altar.* (Genesis 8:20) — and the deliverance is the promise of Eden itself: *And the Elohim of peace shall bruise Satan under your feet shortly.* (Romans 16:20). The enemy''s *apparitions* are the serpent''s old enmity (Genesis 3:15), and Yahuah''s hand still parts the seed from the deceiver.',
       sv.verse_id, ev.verse_id, 'extras', 66431
  FROM _session253_2ae18_lookup sv, _session253_2ae18_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=18 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-18-sacred-fire-blessing',
       E'Elohim appeared on the altar, and the sacred fire',
       E'Jared offers as Adam commanded, and the Word answers from the altar: *Then Elohim appeared unto Jared on the altar and blessed him and his children, and accepted their offerings; and commanded Jared to take of the sacred fire from the altar, and with it to light the lamp that shed light on the body of Adam.* (2 Adam & Eve 18:13-14). The fire Adam keeps is the fire Torah will guard at Sinai — *The fire shall ever be burning upon the altar; it shall never go out.* (Leviticus 6:13). The accepted offering is Noah''s accepted offering — *And Yahuah smelled a sweet savour... I will not again curse the ground any more for man’s sake* (Genesis 8:21). And the Elohim who *appeared* and *blessed* on the altar is the same Word who delivers the seed from the deceiver — *For this purpose the Son of Elohim was manifested, that he might destroy the works of the devil.* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 66434
  FROM _session253_2ae18_lookup sv, _session253_2ae18_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=13
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=18 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-18-satan-false-apparition
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The very deceit the elders name in 2 Adam & Eve 18:2 is the apparition Sha''ul warns is Satan''s standing disguise.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-satan-false-apparition'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* The bodies say Satan would destroy Jared *as he destroyed Cain* (18:2) — the same wicked one working the same end down the line.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-satan-false-apparition'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The devil who *wrought a great and false apparition* against Jared (18:3) is the prowling adversary Kepha says is always hunting the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-satan-false-apparition'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The elders'' cry to *deliver our son from the hand of Satan* (18:3) is the same resistance Ya''aqob says puts the deceiver to flight.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-satan-false-apparition'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-18-fathers-intercede
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 5:8 — *And when he had taken the book, the four beasts and four and twenty elders fell down before the Lamb, having every one of them harps, and golden vials full of odours, which are the prayers of saints.* The fathers *praying for his deliverance* (18:8) are of one company with the prayers of the saints kept in golden vials before the Lamb.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-fathers-intercede'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 7:25 — *Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them.* Jared begs his fathers'' *intercession* (18:9), which points beyond them to the one Mediator who ever liveth to make it.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-fathers-intercede'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 22:31 — *And Yahuah (Lord) said, Simon, Simon, behold, Satan hath desired to have you, that he may sift you as wheat:* Jared asks to be hidden *from him unto the day of my death* (18:9) — the same sifting hand Messiah warns reaches for His own, met by intercession.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-fathers-intercede'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-18-adam-command-offer-gifts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam''s charge to *offer gifts to Elohim* on the altar (18:10) is the same calling on the Name kept by Seth''s line down to Jared.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-adam-command-offer-gifts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s *apparitions, wishing to destroy* Adam (18:10) are the serpent''s enmity against the seed, declared in the garden from the start.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-adam-command-offer-gifts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Adam bids his people *be on their guard against him* (18:11); Sha''ul gives the end of that guard — the deceiver bruised under the feet of the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-adam-command-offer-gifts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:15 — *And in the second week of the tenth jubilee Mahalalel took to him to wife Dînâh... and she bare him a son... and he called his name Jared; for in his days the angels of Yahuah (God) descended on the earth, those who are named the Watchers...* The very Jared whom Adam''s voice charges (18:10) is named in Jubilees for the days when the Watchers fell — the same primeval seed-war from another witness.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-adam-command-offer-gifts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=10
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-18-sacred-fire-blessing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 6:13 — *The fire shall ever be burning upon the altar; it shall never go out.* The *sacred fire from the altar* that Jared must never let lapse (18:14) is the unceasing altar-fire Torah later writes into the law — the way kept before Sinai.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-sacred-fire-blessing'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man’s sake; for the imagination of man’s heart is evil from his youth...* Jared''s offering *accepted* on the altar (18:13) is of one savour with Noah''s, the covenant mercy that keeps the seed against the curse.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-sacred-fire-blessing'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The Elohim who *appeared* and *blessed* on the altar (18:14) is the same manifested Son who comes to undo the deceiver''s apparitions throughout this book.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae18_lookup sv, _session253_2ae18_lookup tv
 WHERE t.slug='2-adam-eve-18-sacred-fire-blessing'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=18 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

