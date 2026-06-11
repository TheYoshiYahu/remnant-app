-- ----- fragment: minion_1enoch_06.sql (session250 1-enoch 6) -----
-- Source anchor: enoch/1-enoch ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en06 (view _session250_en06_lookup). Sort band base 50125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-6-sons-of-god-daughters-of-men
  ('enoch', '1-enoch', 6, 2, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Moses'' "sons of Elohim" who saw and took are Enoch''s angels who "saw and lusted" at 6:2 — the very same descent.'),
  ('enoch', '1-enoch', 6, 1, 'canon', 'genesis', 6, 1, 'free', E'Genesis 6:1 — *And it came to pass, when men began to multiply on the face of the earth, and daughters were born unto them,* which is verbatim the setting of Enoch 6:1, "when the children of men had multiplied... were born unto them beautiful and comely daughters."'),
  ('enoch', '1-enoch', 6, 2, 'jubilees', 'jubilees', 5, 1, 'extras', E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees retells Enoch 6:2 almost word-for-word and names the offspring as giants.'),
  ('enoch', '1-enoch', 6, 2, 'jasher', 'jasher', 4, 18, 'extras', E'Jasher 4:18 — *And their judges and rulers went to the daughters of men and took their wives by force from their husbands according to their choice, and the sons of men in those days took from the cattle of the earth, the beasts of the field and the fowls of the air, and taught the mixture of animals of one species with the other, in order therewith to provoke Yahuah (the Lord); and Elohim saw the whole earth and it was corrupt, for all flesh had corrupted its ways upon earth, all men and all animals.* Jasher echoes the taking of wives "according to their choice" of Enoch 6:2 and adds the forbidden mixing taught in the aftermath.'),
  ('enoch', '1-enoch', 6, 2, 'enoch', '1-enoch', 7, 1, 'extras', E'1 Enoch 7:1 — *And all the others together with them took unto themselves wives, and each chose for himself one, and they began to go in unto them and to defile themselves with them, and they taught them charms and enchantments, and the cutting of roots, and made them acquainted with plants.* The plan announced at 6:2 is carried out here, with the forbidden arts that follow the union.'),
  -- thread: 1-enoch-6-oath-on-hermon-bound-for-judgement
  ('enoch', '1-enoch', 6, 6, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s angels who "left their own habitation" are precisely the heavenly Watchers who descended on Hermon in Enoch 6:6, now reserved for judgement.'),
  ('enoch', '1-enoch', 6, 6, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter''s "angels that sinned" cast into chains are the descended Watchers of Enoch 6, bound for the great-day judgement.'),
  ('enoch', '1-enoch', 6, 4, 'enoch', '1-enoch', 10, 11, 'extras', E'1 Enoch 10:11 — *And Yahuah (God) said unto Michael: ''Go, bind Semjâzâ and his associates who have united themselves with women so as to have defiled themselves with them in all their uncleanness.* The oath of 6:4 is answered four chapters later by the command to bind Shemyaza and his fellows.'),
  -- thread: 1-enoch-6-days-of-jared-and-the-giants
  ('enoch', '1-enoch', 6, 6, 'canon', 'genesis', 5, 18, 'free', E'Genesis 5:18 — *And Jared lived an hundred sixty and two years, and he begat Enoch:* Moses'' Jared is Enoch''s own father, so "the days of Yered (Jared)" in Enoch 6:6 dates the descent to the generation of the seventh from Adam.'),
  ('enoch', '1-enoch', 6, 6, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The descent of the two hundred in Enoch 6:6 is exactly the union Genesis says produced the giants of renown.'),
  ('enoch', '1-enoch', 6, 6, 'canon', 'numbers', 13, 33, 'free', E'Numbers 13:33 — *And there we saw the giants, the sons of Anak, which come of the giants: and we were in our own sight as grasshoppers, and so we were in their sight.* The giant-seed begun by the Watchers'' descent in Enoch 6 reappears in the land as the sons of Anak.'),
  ('enoch', '1-enoch', 6, 6, 'canon', 'matthew', 24, 37, 'free', E'Matthew 24:37 — *But as the days of Noe were, so shall also the coming of the Son of Adam be.* Yahusha makes the days the Watchers corrupted in Enoch 6 the very type of the last days before the Son of Adam comes.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-6-sons-of-god-daughters-of-men',
       E'The Watchers take wives — Genesis 6 in long form',
       E'1 Enoch opens the seed-war exactly where Moses set it: *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* (1 Enoch 6:2) is the same descent Genesis records — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* (Genesis 6:2) — and the same that Jubilees retells word-for-word: *the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* (Jubilees 5:1). Jasher names the mechanism — *their judges and rulers went to the daughters of men and took their wives by force from their husbands according to their choice* (Jasher 4:18) — and the next chapter of Enoch shows what the union produced and taught: *they taught them charms and enchantments, and the cutting of roots* (1 Enoch 7:1). This is not myth grafted onto Scripture; it is the canon''s own Genesis 6:1-4 unfolded. It ain''t new — the Watchers'' rebellion against the Creator''s order is the root of the tares sown among the wheat.',
       sv.verse_id, ev.verse_id, 'extras', 50125
  FROM _session250_en06_lookup sv, _session250_en06_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=6 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-6-oath-on-hermon-bound-for-judgement',
       E'The oath on Hermon and the chains of darkness',
       E'The two hundred bound themselves by an oath before they descended: *Let us all swear an oath, and all bind ourselves by mutual imprecations not to abandon this plan but to do this thing* (1 Enoch 6:4), and they swore upon the summit and *they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it* (1 Enoch 6:6). The New Testament knows this fall precisely and reads it as covenant rebellion against the Creator''s order: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6), and Peter the same — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). Enoch himself records the sentence that answers their oath: *Go, bind Semjâzâ and his associates who have united themselves with women so as to have defiled themselves with them* (1 Enoch 10:11). The Watchers who swore on Hermon are the angels Jude and Peter reserve in chains — Torah''s order stands, and the judgement is for breaking it.',
       sv.verse_id, ev.verse_id, 'extras', 50128
  FROM _session250_en06_lookup sv, _session250_en06_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=6 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-6-days-of-jared-and-the-giants',
       E'In the days of Yered — and the giants of renown',
       E'Enoch dates the descent precisely: the two hundred *descended in the days of Yered (Jared) on the summit of Mount Hermon* (1 Enoch 6:6) — and Moses'' genealogy fixes Jared as the father of Enoch himself: *And Jared lived an hundred sixty and two years, and he begat Enoch* (Genesis 5:18), so the seventh from Adam is an eyewitness generation to the fall. What the unions produced is no Enochic invention; Genesis says it plainly: *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* (Genesis 6:4), and the giant-seed survives the Flood in Canaan — *And there we saw the giants, the sons of Anak, which come of the giants: and we were in our own sight as grasshoppers, and so we were in their sight.* (Numbers 13:33). Yahusha seals the type for the last days: *But as the days of Noe were, so shall also the coming of the Son of Adam be.* (Matthew 24:37). The dating, the giants, the warning — it ain''t new; the canon carried it the whole way.',
       sv.verse_id, ev.verse_id, 'extras', 50131
  FROM _session250_en06_lookup sv, _session250_en06_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-6-sons-of-god-daughters-of-men
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Moses'' "sons of Elohim" who saw and took are Enoch''s angels who "saw and lusted" at 6:2 — the very same descent.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-sons-of-god-daughters-of-men'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:1 — *And it came to pass, when men began to multiply on the face of the earth, and daughters were born unto them,* which is verbatim the setting of Enoch 6:1, "when the children of men had multiplied... were born unto them beautiful and comely daughters."'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-sons-of-god-daughters-of-men'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees retells Enoch 6:2 almost word-for-word and names the offspring as giants.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-sons-of-god-daughters-of-men'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 4:18 — *And their judges and rulers went to the daughters of men and took their wives by force from their husbands according to their choice, and the sons of men in those days took from the cattle of the earth, the beasts of the field and the fowls of the air, and taught the mixture of animals of one species with the other, in order therewith to provoke Yahuah (the Lord); and Elohim saw the whole earth and it was corrupt, for all flesh had corrupted its ways upon earth, all men and all animals.* Jasher echoes the taking of wives "according to their choice" of Enoch 6:2 and adds the forbidden mixing taught in the aftermath.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-sons-of-god-daughters-of-men'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 7:1 — *And all the others together with them took unto themselves wives, and each chose for himself one, and they began to go in unto them and to defile themselves with them, and they taught them charms and enchantments, and the cutting of roots, and made them acquainted with plants.* The plan announced at 6:2 is carried out here, with the forbidden arts that follow the union.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-sons-of-god-daughters-of-men'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-6-oath-on-hermon-bound-for-judgement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s angels who "left their own habitation" are precisely the heavenly Watchers who descended on Hermon in Enoch 6:6, now reserved for judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-oath-on-hermon-bound-for-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter''s "angels that sinned" cast into chains are the descended Watchers of Enoch 6, bound for the great-day judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-oath-on-hermon-bound-for-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:11 — *And Yahuah (God) said unto Michael: ''Go, bind Semjâzâ and his associates who have united themselves with women so as to have defiled themselves with them in all their uncleanness.* The oath of 6:4 is answered four chapters later by the command to bind Shemyaza and his fellows.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-oath-on-hermon-bound-for-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-6-days-of-jared-and-the-giants
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:18 — *And Jared lived an hundred sixty and two years, and he begat Enoch:* Moses'' Jared is Enoch''s own father, so "the days of Yered (Jared)" in Enoch 6:6 dates the descent to the generation of the seventh from Adam.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-days-of-jared-and-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The descent of the two hundred in Enoch 6:6 is exactly the union Genesis says produced the giants of renown.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-days-of-jared-and-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 13:33 — *And there we saw the giants, the sons of Anak, which come of the giants: and we were in our own sight as grasshoppers, and so we were in their sight.* The giant-seed begun by the Watchers'' descent in Enoch 6 reappears in the land as the sons of Anak.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-days-of-jared-and-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=13 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 24:37 — *But as the days of Noe were, so shall also the coming of the Son of Adam be.* Yahusha makes the days the Watchers corrupted in Enoch 6 the very type of the last days before the Son of Adam comes.'
  FROM cross_reference_threads t, cross_references x, _session250_en06_lookup sv, _session250_en06_lookup tv
 WHERE t.slug='1-enoch-6-days-of-jared-and-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

