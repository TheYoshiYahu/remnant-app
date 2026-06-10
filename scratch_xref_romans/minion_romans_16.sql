-- ----- fragment: minion_romans_16.sql (S219 Romans 16) -----
-- =====================================================================
-- S219 minion — ROMANS 16 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 16.  Tag: r16 (temp view _s219_r16_lookup).  Sort band: 6375, step 3 (<6400).
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Red Lines #2/#4/#5/#6/#10): Romans 16 is mostly personal greetings — the
-- closing of a letter Paul, a Torah-keeping Yashar'elite, wrote to the mixed assembly at Rome.
-- The greeting lists carry no load-bearing scriptural root and warrant no threads ("none
-- warranted" is the correct, curated answer). Three load-bearing connections close the book:
-- the warning against the false teachers with *good words and fair speeches* (16:17-18) — the
-- same smooth-tongued false shepherds the prophets indicted; the *Elohim (God) of peace shall
-- bruise Satan under your feet* (16:20) — the protoevangelium of Genesis 3:15 fulfilled in the
-- gathered; and the mystery *kept secret since the world began* now *made manifest, and by the
-- scriptures of the prophets ... made known to all nations for the obedience of faith* (16:25-26)
-- — the gospel was always rooted in the prophets, now unveiled, and the obedience of faith
-- (faith THAT obeys, never faith instead of obedience).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2    commend Phebe / receive in the Lord    Tanakh: none warranted  Extras: none warranted  NT: none warranted (greeting)
--   v.3-16   the greeting roll / holy kiss           Tanakh: none warranted  Extras: none warranted  NT: none warranted (greetings — no scriptural root)
--   v.17-18  mark them which cause divisions /        Tanakh: Jeremiah 23:1, Jeremiah 23:16, Jeremiah 23:17; Ezekiel 13:10; Psalm 12:2  Extras: none warranted  NT: none added (prophets carry it)
--            good words and fair speeches
--   v.19     your obedience come abroad / wise to good Tanakh: none added (carried at 16:25-26 obedience of faith)  Extras: none warranted  NT: none warranted
--   v.20     bruise Satan under your feet shortly      Tanakh: Genesis 3:15  Extras: none warranted  NT: none warranted (protoevangelium carried by Genesis)
--   v.21-24  Timotheus / Tertius / Gaius greetings     Tanakh: none warranted  Extras: none warranted  NT: none warranted (greetings)
--   v.25-26  the mystery made known by the scriptures  Tanakh: Isaiah 52:15  Extras: none warranted  NT: Ephesians 3:5, Colossians 1:26, 1 Peter 1:10
--            of the prophets / for the obedience of faith
--   v.27     to Elohim only wise, glory               Tanakh: none warranted  Extras: none warranted  NT: none warranted (doxology close — carried at 25-26)
--
-- THREADS (slug -> target libraries):
--   6375 romans-16-mark-them-which-cause-divisions-the-smooth-words-of-the-false-shepherds  (Tanakh)
--   6378 romans-16-the-elohim-of-peace-shall-bruise-satan-under-your-feet-genesis           (Tanakh)
--   6381 romans-16-the-mystery-made-known-by-the-scriptures-of-the-prophets                 (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s219_r16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-16-mark-them-which-cause-divisions-the-smooth-words-of-the-false-shepherds
  ('canon', 'romans', 16, 17, 'canon', 'jeremiah', 23, 1, 'free', E'*Woe be unto the pastors that destroy and scatter the sheep of my pasture! saith Yahuah (LORD).* (Jeremiah 23:1). Paul tells the assembly to *mark them which cause divisions and offences contrary to the doctrine which ye have learned; and avoid them* (Romans 16:17). The prophet had named the same men: the pastors who *destroy and scatter the sheep* of Yahuah''s (LORD''s) pasture. Those who divide the flock are not new — they are the shepherds against whom Yahuah pronounced woe, and the assembly is told to mark them and turn away.'),
  ('canon', 'romans', 16, 18, 'canon', 'jeremiah', 23, 16, 'free', E'*Thus saith Yahuah Tseva''ot (LORD of hosts), Hearken not unto the words of the prophets that prophesy unto you: they make you vain: they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD).* (Jeremiah 23:16). They that cause divisions *serve not our Lord Yahusha HaMashiach (Lord Jesus Christ), but their own belly; and by good words and fair speeches deceive the hearts of the simple* (Romans 16:18). Jeremiah had already named the deception: men who speak *a vision of their own heart, and not out of the mouth of Yahuah,* who make the people vain with words. The fair speeches that deceive the simple are the same self-sourced word the prophet told the people not to hear.'),
  ('canon', 'romans', 16, 18, 'canon', 'jeremiah', 23, 17, 'free', E'*They say still unto them that despise me, Yahuah (LORD) hath said, Ye shall have peace; and they say unto every one that walketh after the imagination of his own heart, No evil shall come upon you.* (Jeremiah 23:17). The false teachers deceive *by good words and fair speeches* (Romans 16:18) — the smooth comfort the prophet exposed: *Ye shall have peace ... No evil shall come upon you,* spoken to those who walk after their own heart. The good words are not good news; they are the flattering promise that strengthens the hands of evildoers and leaves the simple in their sin.'),
  ('canon', 'romans', 16, 18, 'canon', 'ezekiel', 13, 10, 'free', E'*Because, even because they have seduced my people, saying, Peace; and there was no peace; and one built up a wall, and, lo, others daubed it with untempered morter:* (Ezekiel 13:10). The men Paul marks *by good words and fair speeches deceive the hearts of the simple* (Romans 16:18). Ezekiel had seen the same craft: prophets who *seduced my people, saying, Peace; and there was no peace,* daubing a falling wall with untempered morter. The fair speech is the daubing — a cover of comfort over a wall that cannot stand, and the assembly is told to mark the daubers and avoid them.'),
  ('canon', 'romans', 16, 18, 'canon', 'psalms', 12, 2, 'free', E'*They speak vanity every one with his neighbour: with flattering lips and with a double heart do they speak.* (Psalm 12:2). They that cause divisions deceive *by good words and fair speeches* (Romans 16:18). The psalmist named the instrument: *flattering lips and ... a double heart* — the fair speech that hides a divided purpose. Yahuah''s (LORD''s) verdict stands over them: *Yahuah (LORD) shall cut off all flattering lips, and the tongue that speaketh proud things* (Psalm 12:3). The smooth tongue that serves its own belly is the very thing Yahuah cuts off.'),
  -- thread: romans-16-the-elohim-of-peace-shall-bruise-satan-under-your-feet-genesis
  ('canon', 'romans', 16, 20, 'canon', 'genesis', 3, 15, 'free', E'*And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20). This is the first promise of the garden come home to the gathered. The sentence Yahuah Elohim (the LORD God) spoke to the serpent — that the seed of the woman *shall bruise thy head* — is the word Paul lays under the feet of the assembly. The protoevangelium spoken at the fall is fulfilled in the Formed who came as the seed of the woman and crushed the serpent, and the saints share in the crushing as the enmity runs to its end.')
  ,
  -- thread: romans-16-the-mystery-made-known-by-the-scriptures-of-the-prophets
  ('canon', 'romans', 16, 26, 'canon', 'isaiah', 52, 15, 'free', E'*So shall he sprinkle many nations; the kings shall shut their mouths at him: for that which had not been told them shall they see; and that which they had not heard shall they consider.* (Isaiah 52:15). The mystery is now *made manifest, and by the scriptures of the prophets, according to the commandment of El Olam (the everlasting God), made known to all nations for the obedience of faith* (Romans 16:26). The prophet had already foreseen the unveiling: the servant who would sprinkle many nations, so that *that which had not been told them shall they see.* What was kept secret was never apart from the prophets — it was carried in their own scriptures, now opened to all nations.'),
  ('canon', 'romans', 16, 25, 'canon', 'ephesians', 3, 5, 'free', E'*Which in other ages was not made known unto the sons of Adam, as it is now revealed unto his holy apostles and prophets by the Spirit;* (Ephesians 3:5). Paul writes of *the revelation of the mystery, which was kept secret since the world began* (Romans 16:25). He says the same thing to the assembly at Ephesus: the mystery not made known in other ages, *now revealed ... by the Spirit.* The secret was not a new religion but the unsealing of what the prophets carried — the gathering of the scattered seed into one body, hidden in the purpose of Elohim (God) and now brought to light.'),
  ('canon', 'romans', 16, 26, 'canon', 'colossians', 1, 26, 'free', E'*Even the mystery which hath been hid from ages and from generations, but now is made manifest to his saints:* (Colossians 1:26). The mystery *kept secret since the world began, but now is made manifest, and by the scriptures of the prophets ... made known to all nations* (Romans 16:25-26). The very words recur: *hid from ages ... now made manifest.* What was hidden is *Messiah (Christ) in you, the hope of glory* (Colossians 1:27) — the indwelling promised through the prophets, now unveiled to the gathered out of every nation.'),
  ('canon', 'romans', 16, 26, 'canon', '1-peter', 1, 10, 'free', E'*Of which salvation the prophets have enquired and searched diligently, who prophesied of the grace that should come unto you:* (1 Peter 1:10). The mystery is made known *by the scriptures of the prophets* (Romans 16:26) — the gospel was always rooted in them. Peter says the prophets themselves *enquired and searched diligently,* prophesying of the grace now come, *searching ... when it testified beforehand the sufferings of Messiah (Christ), and the glory that should follow* (1 Peter 1:11). The good news did not arrive apart from the prophets; it was the thing they carried and searched, now opened to those it was reserved for.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-16-mark-them-which-cause-divisions-the-smooth-words-of-the-false-shepherds',
       E'Mark them which cause divisions — the smooth words of the false shepherds',
       E'Before the final blessing Paul turns the assembly to a warning: *mark them which cause divisions and offences contrary to the doctrine which ye have learned; and avoid them. For they that are such serve not our Lord Yahusha HaMashiach (Lord Jesus Christ), but their own belly; and by good words and fair speeches deceive the hearts of the simple* (Romans 16:17-18). These men are not a new danger. The prophets named them and named their craft. Jeremiah pronounced the woe: *Woe be unto the pastors that destroy and scatter the sheep of my pasture! saith Yahuah (LORD)* (Jeremiah 23:1) — and exposed their word as self-sourced: *they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD)* (Jeremiah 23:16), the smooth comfort that flatters the unrepentant — *Ye shall have peace ... No evil shall come upon you* (Jeremiah 23:17). Ezekiel saw the same seduction: *they have seduced my people, saying, Peace; and there was no peace; and one built up a wall, and, lo, others daubed it with untempered morter* (Ezekiel 13:10) — the fair speech is the daubing over a wall that cannot stand. And the psalmist named the instrument and its end: *with flattering lips and with a double heart do they speak* (Psalm 12:2), but *Yahuah (LORD) shall cut off all flattering lips, and the tongue that speaketh proud things* (Psalm 12:3). The good words that serve the belly and divide the flock are the ancient lie in a new mouth; the assembly is told to mark them and turn away.',
       sv.verse_id, ev.verse_id, 'free', 6375
  FROM _s219_r16_lookup sv, _s219_r16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=16 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=16 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-16-the-elohim-of-peace-shall-bruise-satan-under-your-feet-genesis',
       E'The Elohim (God) of peace shall bruise Satan under your feet — Genesis',
       E'Paul''s blessing carries the oldest promise in scripture: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20). The word reaches back to the garden, to the first promise Yahuah Elohim (the LORD God) spoke after the fall — the sentence pronounced over the serpent: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The enmity set in the garden runs the whole length of scripture to its end. The seed of the woman is the Formed drawn from the Formless, who came in flesh and crushed the serpent''s head; and the saints, gathered into him, share in the bruising as the promise is brought home. The protoevangelium spoken in Eden is not a far-off hope but the very ground of the assembly''s peace: the Elohim of peace will crush the enemy under their feet shortly.',
       sv.verse_id, ev.verse_id, 'free', 6378
  FROM _s219_r16_lookup sv, _s219_r16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=16 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=16 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-16-the-mystery-made-known-by-the-scriptures-of-the-prophets',
       E'The mystery made known by the scriptures of the prophets',
       E'Romans closes with a doxology that guards the whole book against the lie that the gospel is a new religion: *Now to him that is of power to stablish you according to my gospel ... according to the revelation of the mystery, which was kept secret since the world began, but now is made manifest, and by the scriptures of the prophets, according to the commandment of El Olam (the everlasting God), made known to all nations for the obedience of faith* (Romans 16:25-26). The mystery was secret, but never apart from the prophets — it was carried in *the scriptures of the prophets,* now unsealed. Isaiah had foreseen the unveiling to the nations: *that which had not been told them shall they see; and that which they had not heard shall they consider* (Isaiah 52:15). Paul says the same to the assembly at Ephesus — the mystery *not made known unto the sons of Adam, as it is now revealed unto his holy apostles and prophets by the Spirit* (Ephesians 3:5) — and to Colosse — *the mystery which hath been hid from ages and from generations, but now is made manifest to his saints* (Colossians 1:26). And Peter testifies the prophets themselves carried and searched it: *of which salvation the prophets have enquired and searched diligently, who prophesied of the grace that should come unto you* (1 Peter 1:10). The end of the unveiling is *the obedience of faith* — not faith instead of obedience, but the faithful brought to obey; the gospel was always the prophets'' own word, now made known to all nations that they might walk in it.',
       sv.verse_id, ev.verse_id, 'free', 6381
  FROM _s219_r16_lookup sv, _s219_r16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=16 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=16 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-16-mark-them-which-cause-divisions-the-smooth-words-of-the-false-shepherds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 23:1 — *Woe be unto the pastors that destroy and scatter the sheep of my pasture! saith Yahuah (LORD)* the shepherds who divide the flock, against whom Yahuah pronounced woe (Romans 16:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r16_lookup sv, _s219_r16_lookup tv
 WHERE t.slug='romans-16-mark-them-which-cause-divisions-the-smooth-words-of-the-false-shepherds'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 23:16 — *they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD)* the self-sourced word; the fair speech is the prophet''s own heart, not Yahuah''s (Romans 16:18).'
  FROM cross_reference_threads t, cross_references x, _s219_r16_lookup sv, _s219_r16_lookup tv
 WHERE t.slug='romans-16-mark-them-which-cause-divisions-the-smooth-words-of-the-false-shepherds'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 23:17 — *Yahuah (LORD) hath said, Ye shall have peace ... No evil shall come upon you* the flattering comfort spoken to the unrepentant, the good words that deceive (Romans 16:18).'
  FROM cross_reference_threads t, cross_references x, _s219_r16_lookup sv, _s219_r16_lookup tv
 WHERE t.slug='romans-16-mark-them-which-cause-divisions-the-smooth-words-of-the-false-shepherds'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 13:10 — *they have seduced my people, saying, Peace; and there was no peace ... daubed it with untempered morter* the fair speech is the daubing over a wall that cannot stand (Romans 16:18).'
  FROM cross_reference_threads t, cross_references x, _s219_r16_lookup sv, _s219_r16_lookup tv
 WHERE t.slug='romans-16-mark-them-which-cause-divisions-the-smooth-words-of-the-false-shepherds'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 12:2 — *with flattering lips and with a double heart do they speak* the instrument of the deceivers; Yahuah cuts off all flattering lips (Psalm 12:3) (Romans 16:18).'
  FROM cross_reference_threads t, cross_references x, _s219_r16_lookup sv, _s219_r16_lookup tv
 WHERE t.slug='romans-16-mark-them-which-cause-divisions-the-smooth-words-of-the-false-shepherds'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-16-the-elohim-of-peace-shall-bruise-satan-under-your-feet-genesis
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* the first promise of the garden, the serpent crushed by the seed of the woman, fulfilled in the gathered (Romans 16:20).'
  FROM cross_reference_threads t, cross_references x, _s219_r16_lookup sv, _s219_r16_lookup tv
 WHERE t.slug='romans-16-the-elohim-of-peace-shall-bruise-satan-under-your-feet-genesis'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-16-the-mystery-made-known-by-the-scriptures-of-the-prophets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 52:15 — *that which had not been told them shall they see; and that which they had not heard shall they consider* the prophet foreseeing the mystery unveiled to the nations (Romans 16:26).'
  FROM cross_reference_threads t, cross_references x, _s219_r16_lookup sv, _s219_r16_lookup tv
 WHERE t.slug='romans-16-the-mystery-made-known-by-the-scriptures-of-the-prophets'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=16 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 3:5 — *not made known unto the sons of Adam, as it is now revealed unto his holy apostles and prophets by the Spirit* the same mystery, secret in other ages, now revealed by the Spirit (Romans 16:25).'
  FROM cross_reference_threads t, cross_references x, _s219_r16_lookup sv, _s219_r16_lookup tv
 WHERE t.slug='romans-16-the-mystery-made-known-by-the-scriptures-of-the-prophets'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=16 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 1:26 — *the mystery which hath been hid from ages and from generations, but now is made manifest to his saints* the very words recur: hid from ages, now made manifest (Romans 16:25-26).'
  FROM cross_reference_threads t, cross_references x, _s219_r16_lookup sv, _s219_r16_lookup tv
 WHERE t.slug='romans-16-the-mystery-made-known-by-the-scriptures-of-the-prophets'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=16 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 1:10 — *the prophets have enquired and searched diligently, who prophesied of the grace that should come unto you* the prophets themselves carried and searched the mystery now made known (Romans 16:26).'
  FROM cross_reference_threads t, cross_references x, _s219_r16_lookup sv, _s219_r16_lookup tv
 WHERE t.slug='romans-16-the-mystery-made-known-by-the-scriptures-of-the-prophets'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=16 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
