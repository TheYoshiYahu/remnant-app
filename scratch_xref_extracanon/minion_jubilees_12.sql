-- ----- fragment: minion_jubilees_12.sql (session251 jubilees 12) -----
-- Source anchor: jubilees/jubilees ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju12 (view _session251_ju12_lookup). Sort band base 53275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-12-idols-have-no-spirit
  ('jubilees', 'jubilees', 12, 2, 'canon', 'deuteronomy', 4, 28, 'free', E'Deuteronomy 4:28 — *And there ye shall serve gods, the work of men''s hands, wood and stone, which neither see, nor hear, nor eat, nor smell.* The Torah''s verdict on idols is exactly Abram''s in Jubilees 12:2: they are the work of men''s hands with no spirit in them.'),
  ('jubilees', 'jubilees', 12, 1, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names the very idolatry of Terah''s house that Abram confronts in Jubilees 12:1.'),
  ('jubilees', 'jubilees', 12, 7, 'canon', 'acts', 7, 2, 'free', E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* — the election of Abraham out of the idolatrous Chaldee line that frames all of Jubilees 12.'),
  -- thread: jubilees-12-haran-burns-with-the-idols
  ('jubilees', 'jubilees', 12, 14, 'canon', 'genesis', 11, 28, 'free', E'Genesis 11:28 — *And Haran died before his father Terah in the land of his nativity, in Ur of the Chaldees.* Genesis records only the fact of Haran''s death; Jubilees 12:14 supplies the idol-fire that killed him in that same Ur.'),
  ('jubilees', 'jubilees', 12, 14, 'canon', 'genesis', 11, 31, 'free', E'Genesis 11:31 — *And Terah took Abram his son, and Lot the son of Haran his son''s son, and Sarai his daughter in law, his son Abram''s wife; and they went forth with them from Ur of the Chaldees, to go into the land of Canaan; and they came unto Haran, and dwelt there.* The family''s departure from Ur toward Canaan in Jubilees 12:14 is the same journey Genesis records.'),
  -- thread: jubilees-12-signs-in-his-hand
  ('jubilees', 'jubilees', 12, 17, 'canon', 'deuteronomy', 4, 19, 'free', E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* Abram''s realization in Jubilees 12:17 that the sun, moon, and stars are in Yahuah''s hand — not gods — is the Torah''s own guard against worshipping the host of heaven.'),
  ('jubilees', 'jubilees', 12, 17, 'enoch', '1-enoch', 19, 1, 'extras', E'1 Enoch 19:1 — *And Uriel said to me: ''Here shall stand the angels who have connected themselves with women, and their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods, here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* The evil spirits Abram prays to be delivered from in Jubilees 12:17 are the Watcher-spirits of the live 1 Enoch apparatus, who lead mankind astray into demon-worship.'),
  ('jubilees', 'jubilees', 12, 17, 'enoch', '1-enoch', 10, 16, 'extras', E'1 Enoch 10:16 — *Destroy all wrong from the face of the earth and let every evil work come to an end: and let the plant of righteousness and truth appear: and it shall prove a blessing; the works of righteousness and truth'' shall be planted in truth and joy for evermore.* Abram''s plea to stablish him and his seed for ever in Jubilees 12:17 is the planting of the righteous seed against the seed-war that 1 Enoch 10 promises after the Watchers are bound.'),
  -- thread: jubilees-12-get-thee-out-the-call
  ('jubilees', 'jubilees', 12, 22, 'canon', 'genesis', 12, 1, 'free', E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee:* — the call Jubilees 12:22 retells nearly word for word as the angel delivers it to Abram.'),
  ('jubilees', 'jubilees', 12, 22, 'canon', 'genesis', 12, 3, 'free', E'Genesis 12:3 — *And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed.* The blessing-and-cursing and all-families promise of Jubilees 12:22 is Genesis 12:3 set side by side.'),
  ('jubilees', 'jubilees', 12, 22, 'canon', 'acts', 7, 3, 'free', E'Acts 7:3 — *And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* Stephen quotes the same call to Abraham that Jubilees 12:22 records.'),
  ('jubilees', 'jubilees', 12, 22, 'canon', 'romans', 4, 3, 'free', E'Romans 4:3 — *For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness.* The promise Abram receives in Jubilees 12:22 is met with the faith Paul names as counted for righteousness — election and promise, not law-as-curse.'),
  -- thread: jubilees-12-hebrew-restored-after-babel
  ('jubilees', 'jubilees', 12, 25, 'canon', 'genesis', 11, 7, 'free', E'Genesis 11:7 — *Go to, let us go down, and there confound their language, that they may not understand one another''s speech.* The confounding of language at Babel that Jubilees 12:25 says ceased the original tongue from all men is Genesis 11:7.'),
  ('jubilees', 'jubilees', 12, 25, 'canon', 'genesis', 11, 9, 'free', E'Genesis 11:9 — *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth.* Jubilees 12:25 names this Babel overthrow as the moment the tongue of creation was lost — until it is restored to Abram.'),
  ('jubilees', 'jubilees', 12, 27, 'canon', 'genesis', 11, 6, 'free', E'Genesis 11:6 — *And Yahuah (LORD) said, Behold, the people is one, and they have all one language; and this they begin to do: and now nothing will be restrained from them, which they have imagined to do.* The one original language of Genesis 11:6 is the Hebrew given back to Abram in Jubilees 12:26-27 so he can read the books of his fathers.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-12-idols-have-no-spirit',
       E'They are dumb forms — Abram renounces the idols',
       E'Jubilees opens the chapter with the young Abram pleading with his idolatrous father: *"What help and profit have we from those idols which you do worship, And before which you do bow yourself? For there is no spirit in them, For they are dumb forms, and a misleading of the heart. Worship them not: Worship the Elohim (God) of heaven, Who causes the rain and the dew to descend on the earth... For they are the work of (men''s) hands, And on your shoulders do you bear them, And you have no help from them"* (Jubilees 12:2). This is the same charge the Torah lays against idols: *"And there ye shall serve gods, the work of men''s hands, wood and stone, which neither see, nor hear, nor eat, nor smell"* (Deuteronomy 4:28). And it is Abraham''s election OUT of the idolatrous line — *"The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran"* (Acts 7:2) — the very fathers Joshua names: *"Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods"* (Joshua 24:2). The seed is chosen, separated from the nations, before it confesses. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53275
  FROM _session251_ju12_lookup sv, _session251_ju12_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=12 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-12-haran-burns-with-the-idols',
       E'He burned the house of the idols — Haran dies in Ur',
       E'Abram does not merely reason against the idols; he ends them: *"Abram arose by night, and burned the house of the idols, and he burned all that was in the house, and no man knew it"* (Jubilees 12:12), and *"Haran hasted to save them, but the fire flamed over him, and he was burnt in the fire, and he died in Ur of the Chaldees before Terah his father, and they buried him in Ur of the Chaldees"* (Jubilees 12:14). Genesis records the bare death without the cause: *"And Haran died before his father Terah in the land of his nativity, in Ur of the Chaldees"* (Genesis 11:28) — Jubilees fills in the idol-fire behind it. And the migration follows exactly as Genesis tells it: *"And Terah took Abram his son, and Lot the son of Haran his son''s son, and Sarai his daughter in law, his son Abram''s wife; and they went forth with them from Ur of the Chaldees, to go into the land of Canaan; and they came unto Haran, and dwelt there"* (Genesis 11:31). The retelling and its source stand side by side. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53278
  FROM _session251_ju12_lookup sv, _session251_ju12_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=12
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=12 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-12-signs-in-his-hand',
       E'The stars are not gods — all the signs are in His hand',
       E'Abram sits the whole night on the new moon of the seventh month to read the stars, and a word breaks in his heart: *"All the signs of the stars, and the signs of the moon and of the sun are all in the hand of Yahuah (God). Why do I search (them) out? If He desires, He causes it to rain, morning and evening; And if He desires, He withholds it, And all things are in His hand"* (Jubilees 12:17). This is the Torah''s exact guard against star-worship: *"And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven"* (Deuteronomy 4:19). And Abram''s prayer in the same breath names the seed-war — *"Deliver me from the hands of evil spirits who have sway over the thoughts of men''s hearts, And let them not lead me astray from You... And stablish You me and my seed for ever"* (Jubilees 12:17) — the very demons the live 1 Enoch apparatus binds: *"their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods"* (1 Enoch 19:1). The Watcher-spirits drive the nations to idols; Abram prays to be kept, and his seed with him.',
       sv.verse_id, ev.verse_id, 'extras', 53281
  FROM _session251_ju12_lookup sv, _session251_ju12_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=16
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=12 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-12-get-thee-out-the-call',
       E'Get you up from your country — the call of Abram',
       E'The word of Yahuah comes to Abram and Jubilees gives the call almost word for word with Genesis: *"Get you up from your country, and from your kindred and from the house of your father to a land which I shall show you, and I shall make you a great and numerous nation. And I shall bless you And I shall make your name great... And in you will all families of the earth be blessed, And I shall bless them that bless you, And curse them that curse you"* (Jubilees 12:22). Set Genesis beside it: *"Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee"* (Genesis 12:1), and *"And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed"* (Genesis 12:3). Stephen preaches the same call: *"And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee"* (Acts 7:3). And this is the faith counted for righteousness — *"Abraham believed Elohim (God), and it was counted unto him for righteousness"* (Romans 4:3) — election and promise, not law-as-curse. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53284
  FROM _session251_ju12_lookup sv, _session251_ju12_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=22
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=12 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-12-hebrew-restored-after-babel',
       E'He spoke with him in Hebrew — the tongue of creation restored',
       E'Once Abram is called, Yahuah restores to him the lost language: *"Open his mouth and his ears, that he may hear and speak with his mouth, with the language which has been revealed; for it had ceased from the mouths of all the children of men from the day of the overthrow (of Babel)"* (Jubilees 12:25), *"And I opened his mouth, and his ears and his lips, and I began to speak with him in Hebrew in the tongue of the creation"* (Jubilees 12:26). Jubilees anchors this in the Babel judgement of Genesis: *"And Yahuah (LORD) said, Behold, the people is one, and they have all one language... Go to, let us go down, and there confound their language, that they may not understand one another''s speech"* (Genesis 11:6-7), *"Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth"* (Genesis 11:9). The one tongue confounded at Babel is given back to the chosen seed, and with it the books of the fathers — the heavenly-tablet inheritance Abram studies (Jubilees 12:27). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53287
  FROM _session251_ju12_lookup sv, _session251_ju12_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=25
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=12 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-12-idols-have-no-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:28 — *And there ye shall serve gods, the work of men''s hands, wood and stone, which neither see, nor hear, nor eat, nor smell.* The Torah''s verdict on idols is exactly Abram''s in Jubilees 12:2: they are the work of men''s hands with no spirit in them.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-idols-have-no-spirit'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names the very idolatry of Terah''s house that Abram confronts in Jubilees 12:1.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-idols-have-no-spirit'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* — the election of Abraham out of the idolatrous Chaldee line that frames all of Jubilees 12.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-idols-have-no-spirit'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-12-haran-burns-with-the-idols
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:28 — *And Haran died before his father Terah in the land of his nativity, in Ur of the Chaldees.* Genesis records only the fact of Haran''s death; Jubilees 12:14 supplies the idol-fire that killed him in that same Ur.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-haran-burns-with-the-idols'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:31 — *And Terah took Abram his son, and Lot the son of Haran his son''s son, and Sarai his daughter in law, his son Abram''s wife; and they went forth with them from Ur of the Chaldees, to go into the land of Canaan; and they came unto Haran, and dwelt there.* The family''s departure from Ur toward Canaan in Jubilees 12:14 is the same journey Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-haran-burns-with-the-idols'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-12-signs-in-his-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* Abram''s realization in Jubilees 12:17 that the sun, moon, and stars are in Yahuah''s hand — not gods — is the Torah''s own guard against worshipping the host of heaven.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-signs-in-his-hand'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 19:1 — *And Uriel said to me: ''Here shall stand the angels who have connected themselves with women, and their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods, here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* The evil spirits Abram prays to be delivered from in Jubilees 12:17 are the Watcher-spirits of the live 1 Enoch apparatus, who lead mankind astray into demon-worship.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-signs-in-his-hand'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:16 — *Destroy all wrong from the face of the earth and let every evil work come to an end: and let the plant of righteousness and truth appear: and it shall prove a blessing; the works of righteousness and truth'' shall be planted in truth and joy for evermore.* Abram''s plea to stablish him and his seed for ever in Jubilees 12:17 is the planting of the righteous seed against the seed-war that 1 Enoch 10 promises after the Watchers are bound.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-signs-in-his-hand'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-12-get-thee-out-the-call
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee:* — the call Jubilees 12:22 retells nearly word for word as the angel delivers it to Abram.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-get-thee-out-the-call'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 12:3 — *And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed.* The blessing-and-cursing and all-families promise of Jubilees 12:22 is Genesis 12:3 set side by side.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-get-thee-out-the-call'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:3 — *And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* Stephen quotes the same call to Abraham that Jubilees 12:22 records.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-get-thee-out-the-call'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 4:3 — *For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness.* The promise Abram receives in Jubilees 12:22 is met with the faith Paul names as counted for righteousness — election and promise, not law-as-curse.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-get-thee-out-the-call'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-12-hebrew-restored-after-babel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:7 — *Go to, let us go down, and there confound their language, that they may not understand one another''s speech.* The confounding of language at Babel that Jubilees 12:25 says ceased the original tongue from all men is Genesis 11:7.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-hebrew-restored-after-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:9 — *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth.* Jubilees 12:25 names this Babel overthrow as the moment the tongue of creation was lost — until it is restored to Abram.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-hebrew-restored-after-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:6 — *And Yahuah (LORD) said, Behold, the people is one, and they have all one language; and this they begin to do: and now nothing will be restrained from them, which they have imagined to do.* The one original language of Genesis 11:6 is the Hebrew given back to Abram in Jubilees 12:26-27 so he can read the books of his fathers.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-hebrew-restored-after-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

