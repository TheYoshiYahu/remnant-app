-- ----- fragment: minion_hermas_17.sql (session253 hermas 17) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm17 (view _session253_herm17_lookup). Sort band base 71900, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-17-cast-out-evil-desire-put-on-good
  ('lightfoot-apostolic-fathers', 'hermas', 17, 1, 'canon', 'galatians', 5, 16, 'free', E'Galatians 5:16 — *This I say then, Walk in the Spirit, and ye shall not fulfil the lust of the flesh.* The Shepherd''s charge to put off the evil desire and put on the good is Sha''ul''s (Paul''s) walk in the Spirit that does not fulfil the flesh.'),
  ('lightfoot-apostolic-fathers', 'hermas', 17, 1, 'canon', 'galatians', 5, 17, 'free', E'Galatians 5:17 — *For the flesh lusteth against the Spirit, and the Spirit against the flesh: and these are contrary the one to the other: so that ye cannot do the things that ye would.* The two warring desires of Hermas — the wild evil desire against the good and holy — are Sha''ul''s flesh-against-Spirit, contrary one to the other.'),
  ('lightfoot-apostolic-fathers', 'hermas', 17, 2, 'canon', 'romans', 13, 14, 'free', E'Romans 13:14 — *But put ye on the Lord Yahusha HaMashiach (Lord Jesus Christ), and make not provision for the flesh, to fulfil the lusts thereof.* The Shepherd''s ''clothe thyself in the desire of righteousness'' is the apostle''s putting-on of the Master and making no provision for the flesh.'),
  ('lightfoot-apostolic-fathers', 'hermas', 17, 2, 'canon', 'romans', 6, 12, 'free', E'Romans 6:12 — *Let not sin therefore reign in your mortal body, that ye should obey it in the lusts thereof.* Bridling and directing the wild desire so it no longer masters the man is Sha''ul''s word that sin must not reign in the body unto its lusts.'),
  -- thread: hermas-17-armed-with-the-fear-resist-and-it-flees
  ('lightfoot-apostolic-fathers', 'hermas', 17, 2, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The Shepherd''s word that the evil desire, seen the man armed and resisting, shall flee far from him is Ya''aqov''s (James''s) own promise: resist the devil and he will flee.'),
  ('lightfoot-apostolic-fathers', 'hermas', 17, 2, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The evil desire that is ''a daughter of the devil'' is the very adversary Kepha (Peter) bids us watch — sober and vigilant against the roaring lion.'),
  ('lightfoot-apostolic-fathers', 'hermas', 17, 2, 'canon', '1-peter', 5, 9, 'free', E'1 Peter 5:9 — *Whom resist stedfast in the faith, knowing that the same afflictions are accomplished in your brethren that are in the world.* The Shepherd''s armed resisting that drives the desire away is Kepha''s resist-stedfast-in-the-faith against the same adversary.'),
  -- thread: hermas-17-serve-the-good-desire-walk-in-the-commandments
  ('lightfoot-apostolic-fathers', 'hermas', 17, 3, 'canon', 'deuteronomy', 30, 11, 'free', E'Deuteronomy 30:11 — *For this commandment which I command thee this day, it is not hidden from thee, neither is it far off.* The Shepherd''s correction — that the commandments are not too hard for the man who sets his heart — is Moses'' own word that the commandment is not far off.'),
  ('lightfoot-apostolic-fathers', 'hermas', 17, 4, 'canon', 'deuteronomy', 30, 14, 'free', E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* The man who has Yahuah in his heart finds nothing easier than these commandments — Moses said the word is very nigh, in the heart, that thou mayest do it. The commandments are never the curse.'),
  ('lightfoot-apostolic-fathers', 'hermas', 17, 4, 'canon', 'ephesians', 6, 11, 'free', E'Ephesians 6:11 — *Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil.* The armour of the fear of Yahuah the Shepherd bids the servant wear is Sha''ul''s (Paul''s) whole armour of Elohim, worn to stand against the wiles of the devil.'),
  -- thread: hermas-17-fear-not-the-devil-resist-and-he-flees
  ('lightfoot-apostolic-fathers', 'hermas', 17, 4, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The angel of repentance''s ''fear not the devil... and he will flee from you'' is Ya''aqov''s (James''s) word verbatim in substance — resist the devil and he will flee.'),
  ('lightfoot-apostolic-fathers', 'hermas', 17, 5, 'canon', '1-peter', 5, 9, 'free', E'1 Peter 5:9 — *Whom resist stedfast in the faith, knowing that the same afflictions are accomplished in your brethren that are in the world.* ''If then ye resist him, he will be vanquished'' is Kepha''s (Peter''s) resist-stedfast-in-the-faith against the same adversary.'),
  ('lightfoot-apostolic-fathers', 'hermas', 17, 6, 'canon', 'ephesians', 6, 11, 'free', E'Ephesians 6:11 — *Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil.* The threatening of the devil is empty ''like the sinews of a dead man'' because the servant stands in Sha''ul''s (Paul''s) whole armour of Elohim against his wiles.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-17-cast-out-evil-desire-put-on-good',
       E'Strip off the evil desire, clothe thyself in the good — flesh against Spirit',
       E'The Shepherd opens the twelfth and last commandment with a stripping and a clothing: *He saith to me; ‘Remove from thyself all evil desire, and clothe thyself in the desire which is good and holy; for clothed with this desire thou shalt hate the evil desire, and shalt bridle and direct it as thou wilt.’* (Hermas 17:1) And the warning that the two desires war: *But do thou clothe thyself in the desire of righteousness... For this evil desire is a daughter of the devil.* (Hermas 17:2) It ain''t new — Sha''ul (Paul) names the very same two-fold pull and the very same remedy: *This I say then, Walk in the Spirit, and ye shall not fulfil the lust of the flesh.* (Galatians 5:16) — *For the flesh lusteth against the Spirit, and the Spirit against the flesh: and these are contrary the one to the other: so that ye cannot do the things that ye would.* (Galatians 5:17) The clothing language is his too: *But put ye on the Lord Yahusha HaMashiach (Lord Jesus Christ), and make not provision for the flesh, to fulfil the lusts thereof.* (Romans 13:14) The Shepherd''s bridling of the wild desire is the apostle''s *Let not sin therefore reign in your mortal body, that ye should obey it in the lusts thereof.* (Romans 6:12) Two desires, one Spirit-clothed walk — the old battle, not a new one.',
       sv.verse_id, ev.verse_id, 'extras', 71900
  FROM _session253_herm17_lookup sv, _session253_herm17_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=17 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-17-armed-with-the-fear-resist-and-it-flees',
       E'Armed with the fear of Yahuah, resist — and the evil desire flees',
       E'The Shepherd hands Hermas his armour: *But do thou clothe thyself in the desire of righteousness, and, having armed thyself with the fear of Yahuah (Lord), resist them. For the fear of Elohim (God) dwelleth in the good desire. If the evil desire shall see thee armed with the fear of Elohim (God) and resisting itself, it shall flee far from thee, and shall no more be seen of thee, being in fear of thine arms.* (Hermas 17:2) It ain''t new — this is Ya''aqov''s (James''s) plain promise word for word in substance: *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* (James 4:7) The desire is *a daughter of the devil,* so to resist her is to resist him — and Kepha (Peter) names the same adversary and the same posture: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* (1 Peter 5:8) — *Whom resist stedfast in the faith, knowing that the same afflictions are accomplished in your brethren that are in the world.* (1 Peter 5:9) Resist, and the enemy flees: the apostles taught nothing the Shepherd does not also lay down.',
       sv.verse_id, ev.verse_id, 'extras', 71903
  FROM _session253_herm17_lookup sv, _session253_herm17_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=17 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-17-serve-the-good-desire-walk-in-the-commandments',
       E'Practise righteousness, truth, the fear of Yahuah — the commandments are not too hard',
       E'Asked how to serve the good desire, the Shepherd answers with a life, not a slogan: *‘practise righteousness and virtue, truth and the fear of Yahuah (Lord), faith and gentleness, and as many good deeds as are like these.’* (Hermas 17:3) And when Hermas frets that the commandments are *very hard,* the Shepherd corrects him — the man who sets his heart can keep them: *Aye,’ saith he, ‘the man that hath Yahuah (Lord) in his heart can master [all things and] all these commandments... ye shall perceive that nothing is easier than these commandments, nor sweeter, nor more gentle.* (Hermas 17:4) It ain''t new — and the commandments are never named the curse. Moses said the same of the very Torah: *For this commandment which I command thee this day, it is not hidden from thee, neither is it far off.* (Deuteronomy 30:11) — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* (Deuteronomy 30:14) And the armour the Shepherd hands is Sha''ul''s (Paul''s): *Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil.* (Ephesians 6:11) The commandments stand, near and keepable to the heart that holds Yahuah; the Shepherd and Moses speak with one voice.',
       sv.verse_id, ev.verse_id, 'extras', 71906
  FROM _session253_herm17_lookup sv, _session253_herm17_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=3
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=17 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-17-fear-not-the-devil-resist-and-he-flees',
       E'The angel of repentance: fear not the devil — resist him and he flees',
       E'Here is the heart of the chapter — the angel set over repentance disarms the enemy''s terror: *‘fear not the devil, for there is no power in him against you. For I will be with you, I, the angel of repentance, who have the mastery over him. The devil hath fear alone, but his fear hath no force. Fear him not therefore; and he will flee from you.’* (Hermas 17:4) And again: *‘If then ye resist him, he will be vanquished, and will flee from you disgraced.’* (Hermas 17:5) And the closing comfort, that the threatening is empty: *But of the threatening of the devil fear not at all; for he is unstrung, like the sinews of a dead man.* (Hermas 17:6) It ain''t new — this is Ya''aqov''s (James''s) very promise: *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* (James 4:7) Kepha (Peter) gives the steadfast posture: *Whom resist stedfast in the faith, knowing that the same afflictions are accomplished in your brethren that are in the world.* (1 Peter 5:9) And the armour that makes the stand sure: *Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil.* (Ephesians 6:11) The angel of repentance promises no new gospel — only the apostles'' own: stand, resist, and the toothless adversary flees.',
       sv.verse_id, ev.verse_id, 'extras', 71909
  FROM _session253_herm17_lookup sv, _session253_herm17_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=4
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=17 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-17-cast-out-evil-desire-put-on-good
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 5:16 — *This I say then, Walk in the Spirit, and ye shall not fulfil the lust of the flesh.* The Shepherd''s charge to put off the evil desire and put on the good is Sha''ul''s (Paul''s) walk in the Spirit that does not fulfil the flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-cast-out-evil-desire-put-on-good'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 5:17 — *For the flesh lusteth against the Spirit, and the Spirit against the flesh: and these are contrary the one to the other: so that ye cannot do the things that ye would.* The two warring desires of Hermas — the wild evil desire against the good and holy — are Sha''ul''s flesh-against-Spirit, contrary one to the other.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-cast-out-evil-desire-put-on-good'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 13:14 — *But put ye on the Lord Yahusha HaMashiach (Lord Jesus Christ), and make not provision for the flesh, to fulfil the lusts thereof.* The Shepherd''s ''clothe thyself in the desire of righteousness'' is the apostle''s putting-on of the Master and making no provision for the flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-cast-out-evil-desire-put-on-good'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=13 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 6:12 — *Let not sin therefore reign in your mortal body, that ye should obey it in the lusts thereof.* Bridling and directing the wild desire so it no longer masters the man is Sha''ul''s word that sin must not reign in the body unto its lusts.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-cast-out-evil-desire-put-on-good'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-17-armed-with-the-fear-resist-and-it-flees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The Shepherd''s word that the evil desire, seen the man armed and resisting, shall flee far from him is Ya''aqov''s (James''s) own promise: resist the devil and he will flee.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-armed-with-the-fear-resist-and-it-flees'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The evil desire that is ''a daughter of the devil'' is the very adversary Kepha (Peter) bids us watch — sober and vigilant against the roaring lion.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-armed-with-the-fear-resist-and-it-flees'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:9 — *Whom resist stedfast in the faith, knowing that the same afflictions are accomplished in your brethren that are in the world.* The Shepherd''s armed resisting that drives the desire away is Kepha''s resist-stedfast-in-the-faith against the same adversary.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-armed-with-the-fear-resist-and-it-flees'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-17-serve-the-good-desire-walk-in-the-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:11 — *For this commandment which I command thee this day, it is not hidden from thee, neither is it far off.* The Shepherd''s correction — that the commandments are not too hard for the man who sets his heart — is Moses'' own word that the commandment is not far off.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-serve-the-good-desire-walk-in-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* The man who has Yahuah in his heart finds nothing easier than these commandments — Moses said the word is very nigh, in the heart, that thou mayest do it. The commandments are never the curse.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-serve-the-good-desire-walk-in-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 6:11 — *Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil.* The armour of the fear of Yahuah the Shepherd bids the servant wear is Sha''ul''s (Paul''s) whole armour of Elohim, worn to stand against the wiles of the devil.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-serve-the-good-desire-walk-in-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-17-fear-not-the-devil-resist-and-he-flees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The angel of repentance''s ''fear not the devil... and he will flee from you'' is Ya''aqov''s (James''s) word verbatim in substance — resist the devil and he will flee.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-fear-not-the-devil-resist-and-he-flees'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:9 — *Whom resist stedfast in the faith, knowing that the same afflictions are accomplished in your brethren that are in the world.* ''If then ye resist him, he will be vanquished'' is Kepha''s (Peter''s) resist-stedfast-in-the-faith against the same adversary.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-fear-not-the-devil-resist-and-he-flees'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 6:11 — *Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil.* The threatening of the devil is empty ''like the sinews of a dead man'' because the servant stands in Sha''ul''s (Paul''s) whole armour of Elohim against his wiles.'
  FROM cross_reference_threads t, cross_references x, _session253_herm17_lookup sv, _session253_herm17_lookup tv
 WHERE t.slug='hermas-17-fear-not-the-devil-resist-and-he-flees'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=17 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

