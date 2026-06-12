-- ----- fragment: minion_ecclesiasticus_05.sql (session253 ecclesiasticus 5) -----
-- Source anchor: apocrypha/ecclesiasticus ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir05 (view _session253_sir05_lookup). Sort band base 58400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-5-trust-not-in-riches
  ('apocrypha', 'ecclesiasticus', 5, 1, 'canon', 'luke', 12, 20, 'free', E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* The rich fool who said "I have enough for my life" is the very man Ecclesiasticus 5:1 warns against.'),
  ('apocrypha', 'ecclesiasticus', 5, 1, 'canon', 'matthew', 6, 19, 'free', E'Matthew 6:19 — *Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt, and where thieves break through and steal:* The Master forbids the heart set on goods that Ecclesiasticus 5:1 calls vain.'),
  ('apocrypha', 'ecclesiasticus', 5, 8, 'apocrypha', 'the-wisdom-of-solomon', 5, 8, 'extras', E'Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* The companion wisdom-book voices the dead man''s regret over the goods that did not profit in the day of calamity (Ecclesiasticus 5:8).'),
  -- thread: ecclesiasticus-5-say-not-i-have-sinned-what-harm
  ('apocrypha', 'ecclesiasticus', 5, 4, 'canon', 'ecclesiastes', 8, 11, 'free', E'Ecclesiastes 8:11 — *Because sentence against an evil work is not executed speedily, therefore the heart of the sons of men is fully set in them to do evil.* The Preacher names the very self-deceit of "I have sinned, and what harm" in Ecclesiasticus 5:4.'),
  ('apocrypha', 'ecclesiasticus', 5, 4, 'canon', 'romans', 2, 4, 'free', E'Romans 2:4 — *Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* Sha''ul shows the longsuffering of Ecclesiasticus 5:4 is mercy unto repentance, not permission to add sin.'),
  ('apocrypha', 'ecclesiasticus', 5, 4, 'canon', 'romans', 2, 5, 'free', E'Romans 2:5 — *But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God);* The man who says "what harm" (Ecclesiasticus 5:4) is in fact treasuring up wrath against the day of vengeance.'),
  -- thread: ecclesiasticus-5-mercy-and-wrath-presume-not
  ('apocrypha', 'ecclesiasticus', 5, 6, 'apocrypha', 'the-wisdom-of-solomon', 11, 23, 'extras', E'Wisdom of Solomon 11:23 — *But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend.* The companion book confirms the mercy of Ecclesiasticus 5:6 is real, but given that men should amend — not that they may add sin to sin.'),
  ('apocrypha', 'ecclesiasticus', 5, 5, 'apocrypha', 'the-wisdom-of-solomon', 12, 10, 'extras', E'Wisdom of Solomon 12:10 — *But executing your judgments upon them by little and little, you gavest them place of repentance, not being ignorant that they were a naughty generation, and that their malice was bred in them, and that their cogitation would never be changed.* The space for repentance is the very propitiation Ecclesiasticus 5:5 says to fear adding sin against.'),
  ('apocrypha', 'ecclesiasticus', 5, 6, 'canon', 'romans', 2, 5, 'free', E'Romans 2:5 — *But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God);* He who presumes "His mercy is great" (Ecclesiasticus 5:6) forgets that wrath also rests on the impenitent.'),
  -- thread: ecclesiasticus-5-make-no-tarrying-to-turn
  ('apocrypha', 'ecclesiasticus', 5, 7, 'canon', 'proverbs', 27, 1, 'free', E'Proverbs 27:1 — *Boast not thyself of to morrow; for thou knowest not what a day may bring forth.* The proverb against presuming on tomorrow undergirds Ben Sira''s "put not off from day to day" (Ecclesiasticus 5:7).'),
  ('apocrypha', 'ecclesiasticus', 5, 7, 'canon', '2-corinthians', 6, 2, 'free', E'2 Corinthians 6:2 — *For he saith, I have heard thee in a time accepted, and in the day of salvation have I succoured thee: behold, now is the accepted time; behold, now is the day of salvation.* Sha''ul presses the same "make no tarrying" of Ecclesiasticus 5:7 — the day to turn is now.'),
  ('apocrypha', 'ecclesiasticus', 5, 7, 'canon', 'luke', 12, 20, 'free', E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* He who is at ease "in your security" (Ecclesiasticus 5:7) is the fool whose soul is suddenly required.'),
  -- thread: ecclesiasticus-5-double-tongue-winnow-not
  ('apocrypha', 'ecclesiasticus', 5, 9, 'canon', 'james', 3, 5, 'free', E'James 3:5 — *Even so the tongue is a little member, and boasteth great things. Behold, how great a matter a little fire kindleth!* Ya''aqov, Sirach''s nearest sibling, takes up the same peril of the double tongue named in Ecclesiasticus 5:9.'),
  ('apocrypha', 'ecclesiasticus', 5, 10, 'canon', 'proverbs', 10, 19, 'free', E'Proverbs 10:19 — *In the multitude of words there wanteth not sin: but he that refraineth his lips is wise.* The proverb commends the steadfast, single word Ben Sira urges in Ecclesiasticus 5:10.'),
  -- thread: ecclesiasticus-5-swift-to-hear-slow-to-answer
  ('apocrypha', 'ecclesiasticus', 5, 11, 'canon', 'james', 1, 19, 'free', E'James 1:19 — *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath:* Ya''aqov all but quotes Ecclesiasticus 5:11 — "be swift to hear... with patience give answer" — the closest NT echo of ben Sira.'),
  ('apocrypha', 'ecclesiasticus', 5, 12, 'canon', 'proverbs', 17, 28, 'free', E'Proverbs 17:28 — *Even a fool, when he holdeth his peace, is counted wise: and he that shutteth his lips is esteemed a man of understanding.* The proverb commends the "lay thy hand upon thy mouth" restraint of Ecclesiasticus 5:12.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-5-trust-not-in-riches',
       E'Set not thine heart upon goods — thou fool, this night',
       E'Ben Sira opens against the lie of self-sufficiency: *Set your heart upon your goods; and say not, I have enough for my life.* (Ecclesiasticus 5:1) — and warns *Set not yours heart upon goods unjustly gotten, for they shall not profit you in the day of calamity.* (Ecclesiasticus 5:8). It ain''t new — this is the rich fool of the Master''s parable, the barns torn down to build greater: *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* (Luke 12:20). The Sermon on the Mount says the same: *Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt, and where thieves break through and steal:* (Matthew 6:19). And the sibling apocryphal wisdom-book asks the very question over the grave: *What has pride profited us? or what good has riches with our vaunting brought us?* (Wisdom of Solomon 5:8) — for the goods cannot answer in the day of calamity.',
       sv.verse_id, ev.verse_id, 'extras', 58400
  FROM _session253_sir05_lookup sv, _session253_sir05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=5 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-5-say-not-i-have-sinned-what-harm',
       E'Say not, I have sinned, and what harm — presume not on delayed judgment',
       E'*And say not, I have sinned, and what harm has happened to me? for Yahuah (God) is longsuffering, he will in no wise let you go.* (Ecclesiasticus 5:4) — the sinner reads the silence of God as license. It ain''t new: the Preacher diagnosed the same self-deceit, *Because sentence against an evil work is not executed speedily, therefore the heart of the sons of men is fully set in them to do evil.* (Ecclesiastes 8:11). And Sha''ul presses it into a warning — the delay is goodness meant to lead to repentance, not a verdict of acquittal: *Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* (Romans 2:4), *But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God);* (Romans 2:5). The longsuffering Ben Sira names is the same forbearance that the impenitent abuse.',
       sv.verse_id, ev.verse_id, 'extras', 58403
  FROM _session253_sir05_lookup sv, _session253_sir05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=5 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-5-mercy-and-wrath-presume-not',
       E'His mercy is great — yet mercy and wrath both come from him',
       E'Against presumption on grace: *And say not His mercy is great; he will be pacified for the multitude of my sins: for mercy and wrath come from him, and his indignation resteth upon sinners.* (Ecclesiasticus 5:6), *Concerning propitiation, be not without fear to add sin to sin:* (Ecclesiasticus 5:5). The wisdom is held in tension — the sibling apocryphal book affirms the mercy is real, *But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend.* (Wisdom of Solomon 11:23), and that judgment itself opens a door, *But executing your judgments upon them by little and little, you gavest them place of repentance...* (Wisdom of Solomon 12:10) — yet the space is given that they *should amend*, not that they may presume. Hence Sha''ul''s verdict on the man who despises that forbearance: *But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath...* (Romans 2:5). Mercy and wrath both come from the one hand.',
       sv.verse_id, ev.verse_id, 'extras', 58406
  FROM _session253_sir05_lookup sv, _session253_sir05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=5 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-5-make-no-tarrying-to-turn',
       E'Make no tarrying to turn to Yahuah — now is the accepted time',
       E'The urgency of repentance: *Make no tarrying to turn to Yahuah (God), and put not off from day to day: for suddenly shall the wrath of Yahuah (God) come forth, and in your security you shall be destroyed, and perish in the day of vengeance.* (Ecclesiasticus 5:7). It ain''t new — wisdom forbids deferring even a boast: *Boast not thyself of to morrow; for thou knowest not what a day may bring forth.* (Proverbs 27:1). And the gospel seals the hour: *...behold, now is the accepted time; behold, now is the day of salvation.* (2 Corinthians 6:2). The man at ease in his security is the rich fool whose soul is required *this night* — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee...* (Luke 12:20). Turn now; the day of vengeance keeps no appointment with the procrastinator.',
       sv.verse_id, ev.verse_id, 'extras', 58409
  FROM _session253_sir05_lookup sv, _session253_sir05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=5 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-5-double-tongue-winnow-not',
       E'Winnow not with every wind — the double tongue',
       E'Against duplicity of speech: *Winnow not with every wind, and go not into every way: for so does the sinner that has a double tongue.* (Ecclesiasticus 5:9), and the call to single-minded steadfastness, *Be stedfast in your understanding; and let your word be the same.* (Ecclesiasticus 5:10). It ain''t new — wisdom warns of the slander and the betraying tongue: *In the multitude of words there wanteth not sin: but he that refraineth his lips is wise.* (Proverbs 10:19). And Ya''aqov, Sirach''s nearest NT sibling, names the divided man and the untamed tongue: *Even so the tongue is a little member, and boasteth great things. Behold, how great a matter a little fire kindleth!* (James 3:5). The sinner who winnows with every wind is the double-minded man, unstable in all his ways.',
       sv.verse_id, ev.verse_id, 'extras', 58412
  FROM _session253_sir05_lookup sv, _session253_sir05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=5 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-5-swift-to-hear-slow-to-answer',
       E'Be swift to hear, slow to answer — lay thy hand on thy mouth',
       E'The chapter''s most famous line, all but quoted by Ya''aqov: *Be swift to hear; and let your life be sincere; and with patience give answer.* (Ecclesiasticus 5:11), *If you have understanding, answer your neighbour; if not, lay your hand upon your mouth.* (Ecclesiasticus 5:12). It ain''t new — *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath:* (James 1:19) is the same wisdom in NT dress, the Epistle of Ya''aqov leaning on the Wisdom of ben Sira. And the Tanakh wisdom-book commends the very restraint of "lay thy hand on thy mouth": *Even a fool, when he holdeth his peace, is counted wise: and he that shutteth his lips is esteemed a man of understanding.* (Proverbs 17:28). Swift to hear, slow to answer — and the tongue of man is his fall (Ecclesiasticus 5:13).',
       sv.verse_id, ev.verse_id, 'extras', 58415
  FROM _session253_sir05_lookup sv, _session253_sir05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=5 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-5-trust-not-in-riches
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* The rich fool who said "I have enough for my life" is the very man Ecclesiasticus 5:1 warns against.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-trust-not-in-riches'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 6:19 — *Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt, and where thieves break through and steal:* The Master forbids the heart set on goods that Ecclesiasticus 5:1 calls vain.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-trust-not-in-riches'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* The companion wisdom-book voices the dead man''s regret over the goods that did not profit in the day of calamity (Ecclesiasticus 5:8).'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-trust-not-in-riches'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-5-say-not-i-have-sinned-what-harm
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 8:11 — *Because sentence against an evil work is not executed speedily, therefore the heart of the sons of men is fully set in them to do evil.* The Preacher names the very self-deceit of "I have sinned, and what harm" in Ecclesiasticus 5:4.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-say-not-i-have-sinned-what-harm'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=8 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 2:4 — *Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* Sha''ul shows the longsuffering of Ecclesiasticus 5:4 is mercy unto repentance, not permission to add sin.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-say-not-i-have-sinned-what-harm'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 2:5 — *But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God);* The man who says "what harm" (Ecclesiasticus 5:4) is in fact treasuring up wrath against the day of vengeance.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-say-not-i-have-sinned-what-harm'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-5-mercy-and-wrath-presume-not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 11:23 — *But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend.* The companion book confirms the mercy of Ecclesiasticus 5:6 is real, but given that men should amend — not that they may add sin to sin.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-mercy-and-wrath-presume-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=11 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 12:10 — *But executing your judgments upon them by little and little, you gavest them place of repentance, not being ignorant that they were a naughty generation, and that their malice was bred in them, and that their cogitation would never be changed.* The space for repentance is the very propitiation Ecclesiasticus 5:5 says to fear adding sin against.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-mercy-and-wrath-presume-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 2:5 — *But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God);* He who presumes "His mercy is great" (Ecclesiasticus 5:6) forgets that wrath also rests on the impenitent.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-mercy-and-wrath-presume-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-5-make-no-tarrying-to-turn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 27:1 — *Boast not thyself of to morrow; for thou knowest not what a day may bring forth.* The proverb against presuming on tomorrow undergirds Ben Sira''s "put not off from day to day" (Ecclesiasticus 5:7).'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-make-no-tarrying-to-turn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=27 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 6:2 — *For he saith, I have heard thee in a time accepted, and in the day of salvation have I succoured thee: behold, now is the accepted time; behold, now is the day of salvation.* Sha''ul presses the same "make no tarrying" of Ecclesiasticus 5:7 — the day to turn is now.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-make-no-tarrying-to-turn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* He who is at ease "in your security" (Ecclesiasticus 5:7) is the fool whose soul is suddenly required.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-make-no-tarrying-to-turn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-5-double-tongue-winnow-not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 3:5 — *Even so the tongue is a little member, and boasteth great things. Behold, how great a matter a little fire kindleth!* Ya''aqov, Sirach''s nearest sibling, takes up the same peril of the double tongue named in Ecclesiasticus 5:9.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-double-tongue-winnow-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 10:19 — *In the multitude of words there wanteth not sin: but he that refraineth his lips is wise.* The proverb commends the steadfast, single word Ben Sira urges in Ecclesiasticus 5:10.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-double-tongue-winnow-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-5-swift-to-hear-slow-to-answer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:19 — *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath:* Ya''aqov all but quotes Ecclesiasticus 5:11 — "be swift to hear... with patience give answer" — the closest NT echo of ben Sira.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-swift-to-hear-slow-to-answer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 17:28 — *Even a fool, when he holdeth his peace, is counted wise: and he that shutteth his lips is esteemed a man of understanding.* The proverb commends the "lay thy hand upon thy mouth" restraint of Ecclesiasticus 5:12.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-swift-to-hear-slow-to-answer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

