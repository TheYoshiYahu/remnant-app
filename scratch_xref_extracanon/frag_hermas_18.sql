-- ----- fragment: minion_hermas_18.sql (session253 hermas 18) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch18. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm18 (view _session253_herm18_lookup). Sort band base 71925, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-18-foreign-land-far-city
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', 'hebrews', 11, 13, 'free', E'Hebrews 11:13 — *These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth.* The Shepherd''s word that the servants of Elohim dwell in a foreign land is the patriarchs'' own confession — strangers and pilgrims, their city far off (Hermas 18:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', 'hebrews', 11, 16, 'free', E'Hebrews 11:16 — *But now they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city.* The far city in which Hermas''s people shall yet dwell is the heavenly country the faithful sought — the city Elohim Himself has prepared (Hermas 18:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', '1-peter', 2, 11, 'free', E'1 Peter 2:11 — *Dearly beloved, I beseech you as strangers and pilgrims, abstain from fleshly lusts, which war against the soul.* Kepha names the servants of Elohim by the same title Hermas gives them — strangers and pilgrims dwelling in a land not their home (Hermas 18:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', 'philippians', 3, 20, 'free', E'Philippians 3:20 — *For our conversation is in heaven; from whence also we look for the Saviour, the Lord Yahusha HaMashiach (Lord Jesus Christ).* The city far from this city, to which the servants of Elohim belong, is the heavenly citizenship Sha''ul confesses — it ain''t new (Hermas 18:1).'),
  -- thread: hermas-18-buy-not-estates-lay-up-treasure
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', 'matthew', 6, 19, 'free', E'Matthew 6:19 — *Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt, and where thieves break through and steal:* The Shepherd''s ban on preparing superfluous estates in this foreign land is the Master''s own warning against hoarding earthly treasure (Hermas 18:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', 'matthew', 6, 20, 'free', E'Matthew 6:20 — *But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal:* The wealth Hermas bids us send to our own far city is the treasure in heaven the Master tells us to lay up (Hermas 18:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', '1-timothy', 6, 8, 'free', E'1 Timothy 6:8 — *And having food and raiment let us be therewith content.* The ''competency sufficient for thee'' that Hermas commands the sojourner is Sha''ul''s own contentment with food and raiment, not the heaping up of estates (Hermas 18:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', '1-timothy', 6, 19, 'free', E'1 Timothy 6:19 — *Laying up in store for themselves a good foundation against the time to come, that they may lay hold on eternal life.* The riches Hermas says we shall find waiting in our own city are the good foundation Sha''ul says the generous lay up against the time to come (Hermas 18:1).'),
  -- thread: hermas-18-buy-souls-visit-widows-orphans
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', '1-timothy', 6, 18, 'free', E'1 Timothy 6:18 — *That they do good, that they be rich in good works, ready to distribute, willing to communicate;* The Shepherd''s charge to spend riches on souls in trouble rather than fields is Sha''ul''s call to the rich to be rich in good works, ready to distribute (Hermas 18:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', 'james', 1, 27, 'free', E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* Hermas''s command to visit widows and orphans and neglect them not is the very religion Ya''aqob (James) calls pure and undefiled (Hermas 18:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 18, 1, 'canon', 'proverbs', 19, 17, 'free', E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* The souls in trouble whom Hermas bids us buy with our riches are the poor whom Mishle (Proverbs) says we lend to Yahuah, repaid in our own city (Hermas 18:1).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-18-foreign-land-far-city',
       E'Ye dwell in a foreign land — your city is far off',
       E'The Shepherd lays bare where the faithful truly live: *‘Ye know that ye, who are the servants of Elohim (God), are dwelling in a foreign land; for your city is far from this city. If then ye know your city, in which ye shall dwell, why do ye here prepare fields and expensive displays and buildings and dwelling-chambers which are superfluous?’* (Hermas 18:1) It ain''t new — this is the very confession of the patriarchs. They died still looking for home: *These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth* (Hebrews 11:13), for *they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city* (Hebrews 11:16). Kepha names the same sojourning estate: *Dearly beloved, I beseech you as strangers and pilgrims, abstain from fleshly lusts, which war against the soul* (1 Peter 2:11). And Sha''ul fixes the citizenship beyond this world: *For our conversation is in heaven; from whence also we look for the Saviour, the Lord Yahusha HaMashiach (Lord Jesus Christ)* (Philippians 3:20). The pilgrim-people did not begin with Hermas; it is Abraham''s road, the whole counsel of the faithful.',
       sv.verse_id, ev.verse_id, 'extras', 71925
  FROM _session253_herm18_lookup sv, _session253_herm18_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=18 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-18-buy-not-estates-lay-up-treasure',
       E'Prepare nothing here but a competency — lay up treasure that travels home',
       E'Because the city is far, the Shepherd forbids the hoarding of estates in a land that is not ours: *‘as dwelling in a strange land prepare nothing more for thyself but a competency which is sufficient for thee’* (Hermas 18:1). It ain''t new — the Master in the mountain set the same choice: *Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt, and where thieves break through and steal: But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal* (Matthew 6:19-20). Sha''ul charges the rich to send their wealth on ahead by good works: *That they do good, that they be rich in good works, ready to distribute, willing to communicate; Laying up in store for themselves a good foundation against the time to come, that they may lay hold on eternal life* (1 Timothy 6:18-19). And contentment, not accumulation, is the pilgrim''s portion: *And having food and raiment let us be therewith content* (1 Timothy 6:8). The competency Hermas commands is the old wisdom — store the wealth where it travels home.',
       sv.verse_id, ev.verse_id, 'extras', 71928
  FROM _session253_herm18_lookup sv, _session253_herm18_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=18 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-18-buy-souls-visit-widows-orphans',
       E'Instead of fields buy souls — visit the widow and the orphan',
       E'Then comes the wealth that does travel home — not stone and field but mercy: *‘instead of fields buy ye souls that are in trouble, as each is able, and visit widows and orphans, and neglect them not’* (Hermas 18:1). It ain''t new — this is the religion the prophets and apostles named pure: *That they do good, that they be rich in good works, ready to distribute, willing to communicate* (1 Timothy 6:18), and the true and undefiled service is *To visit the fatherless and widows in their affliction* (James 1:27). The riches lent to the poor are lent to Yahuah Himself: *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Proverbs 19:17). The good works Hermas commands are the grace-given purpose of every servant — *for to this end the Master enriched you, that ye might perform these ministrations for Him* — the same standing demand of mercy that runs through the whole counsel.',
       sv.verse_id, ev.verse_id, 'extras', 71931
  FROM _session253_herm18_lookup sv, _session253_herm18_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=18 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-18-foreign-land-far-city
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:13 — *These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth.* The Shepherd''s word that the servants of Elohim dwell in a foreign land is the patriarchs'' own confession — strangers and pilgrims, their city far off (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-foreign-land-far-city'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:16 — *But now they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city.* The far city in which Hermas''s people shall yet dwell is the heavenly country the faithful sought — the city Elohim Himself has prepared (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-foreign-land-far-city'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 2:11 — *Dearly beloved, I beseech you as strangers and pilgrims, abstain from fleshly lusts, which war against the soul.* Kepha names the servants of Elohim by the same title Hermas gives them — strangers and pilgrims dwelling in a land not their home (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-foreign-land-far-city'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Philippians 3:20 — *For our conversation is in heaven; from whence also we look for the Saviour, the Lord Yahusha HaMashiach (Lord Jesus Christ).* The city far from this city, to which the servants of Elohim belong, is the heavenly citizenship Sha''ul confesses — it ain''t new (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-foreign-land-far-city'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-18-buy-not-estates-lay-up-treasure
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 6:19 — *Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt, and where thieves break through and steal:* The Shepherd''s ban on preparing superfluous estates in this foreign land is the Master''s own warning against hoarding earthly treasure (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-buy-not-estates-lay-up-treasure'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 6:20 — *But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal:* The wealth Hermas bids us send to our own far city is the treasure in heaven the Master tells us to lay up (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-buy-not-estates-lay-up-treasure'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 6:8 — *And having food and raiment let us be therewith content.* The ''competency sufficient for thee'' that Hermas commands the sojourner is Sha''ul''s own contentment with food and raiment, not the heaping up of estates (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-buy-not-estates-lay-up-treasure'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Timothy 6:19 — *Laying up in store for themselves a good foundation against the time to come, that they may lay hold on eternal life.* The riches Hermas says we shall find waiting in our own city are the good foundation Sha''ul says the generous lay up against the time to come (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-buy-not-estates-lay-up-treasure'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-18-buy-souls-visit-widows-orphans
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Timothy 6:18 — *That they do good, that they be rich in good works, ready to distribute, willing to communicate;* The Shepherd''s charge to spend riches on souls in trouble rather than fields is Sha''ul''s call to the rich to be rich in good works, ready to distribute (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-buy-souls-visit-widows-orphans'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* Hermas''s command to visit widows and orphans and neglect them not is the very religion Ya''aqob (James) calls pure and undefiled (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-buy-souls-visit-widows-orphans'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* The souls in trouble whom Hermas bids us buy with our riches are the poor whom Mishle (Proverbs) says we lend to Yahuah, repaid in our own city (Hermas 18:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm18_lookup sv, _session253_herm18_lookup tv
 WHERE t.slug='hermas-18-buy-souls-visit-widows-orphans'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

