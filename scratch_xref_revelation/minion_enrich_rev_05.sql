-- S227 enrichment — Revelation 5: sealed scroll / Lion-Root / kings-priests / worthy Lamb
-- Adds prophetic + extra-canonical roots to live threads. References shared view _s227_rev_lookup.

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2
  ('canon','revelation',5,1,'apocrypha','2-esdras',6,20,'extras', E'*...the books shall be opened before the firmament, and they shall see all together* (2 Esdras 6:20). Ezra is shown the heavenly books that stay shut until the appointed end, then *opened before the firmament* — the sealed decree John sees in the right hand of him on the throne, *a book written within and on the backside, sealed with seven seals* (Revelation 5:1). The Hebrew library knew the sealed heavenly book that no creature opens until the time comes, the very scroll the slain Lamb is found worthy to loose.'),
  ('canon','revelation',5,4,'apocrypha','2-esdras',14,45,'extras', E'*The first that you have written publish openly, that the worthy and unworthy may read it* (2 Esdras 14:45). Ezra is commanded to publish some books openly but to seal up and keep back the hidden ones, sealed from all but the worthy and wise — the same sealed-scroll world John weeps in, where *no man was found worthy to open and to read the book* (Revelation 5:4). The sealed prophetic word kept from the many until the worthy One is shown is the scroll the Lamb alone prevails to open (Revelation 5:5).'),
  -- thread: revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49
  ('canon','revelation',5,5,'apocrypha','2-esdras',12,31,'extras', E'*And the lion, whom you sawest rising up out of the wood, and roaring, and speaking to the eagle, and rebuking her for her unrighteousness with all the words which you have heard* (2 Esdras 12:31). Ezra too saw a Lion who rises to judge the last kingdom — and the angel names him outright: *This is the anointed* (2 Esdras 12:32). The elder''s *Lion of the tribe of Juda... hath prevailed* (Revelation 5:5) is the same figure the Hebrew library beheld: the Messiah as the roaring Lion who confronts and overthrows the beast-empire, the anointed One reserved for the end.'),
  ('canon','revelation',5,5,'apocrypha','2-esdras',12,32,'extras', E'*This is the anointed, which the Highest has kept for them and for their wickedness to the end: he shall reprove them, and shall upbraid them with their cruelty* (2 Esdras 12:32). The Lion of Ezra''s vision is plainly named *the anointed... of the seed of David* (2 Esdras 12:32), kept by the Highest *to the end.* So the Lion who *hath prevailed* (Revelation 5:5) is the Root of David, the anointed King reserved and now revealed — the One the library looked for, come forth to reprove the beast and to open the sealed scroll.'),
  -- thread: revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19
  ('canon','revelation',5,10,'canon','isaiah',61,6,'free', E'*But ye shall be named the Priests of Yahuah (LORD): men shall call you the Ministers of our Elohim (God)* (Isaiah 61:6). The new song''s *hast made us unto our Elohim (God) kings and priests* (Revelation 5:10) is Isaiah''s restoration-promise: the redeemed *named the Priests of Yahuah (LORD)... the Ministers of our Elohim (God).* The Lamb''s blood brings the covenant people into the priestly calling Isaiah foretold for restored Yashar''el (Israel) — not a new people in her place, but the gathered seed made priests of Yahuah (LORD).'),
  -- thread: revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2
  ('canon','revelation',5,13,'enoch','1-enoch',48,5,'extras', E'*All who dwell on earth shall fall down and worship before him, And will praise and bless and celebrate with song Yahuah (God) of Spirits* (1 Enoch 48:5). The Hebrew library foresaw the very worship of Revelation 5: *all who dwell on earth shall fall down and worship before him* — the Son of Adam, named before creation — *and will praise and bless... Yahuah (God) of Spirits.* So every creature gives blessing *unto him that sitteth upon the throne, and unto the Lamb* (Revelation 5:13): the chosen Son worshipped, and the Father glorified in him, two and distinguished as Enoch saw.'),
  ('canon','revelation',5,13,'enoch','1-enoch',62,9,'extras', E'*And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats... And shall loosen the reins of the strong* (1 Enoch 62:9). In Enoch the Elect One is set *on the throne of His glory* (1 Enoch 62:6) and before him the kings and mighty fall — the same enthroned, worshipped Son of Adam John beholds receiving *blessing, and honour, and glory, and power* with him that sits on the throne (Revelation 5:13). The Formed Son seated and worshipped, distinct from Yahuah (God) of Spirits who seated him, is the frame the library and the seer share.'),
  ('canon','revelation',5,12,'enoch','1-enoch',62,6,'extras', E'*And Yahuah (God) of Spirits seated the Elect One on the throne of His glory, And he shall judge all the secret things* (1 Enoch 62:6). The sevenfold acclamation *Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing* (Revelation 5:12) is the dignity Enoch saw given the Elect One *seated... on the throne of His glory* by Yahuah (God) of Spirits. The Lamb who receives power and glory is the chosen Son enthroned by the Father — worthy because the Father has set him there, the slain-yet-reigning Formed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- thread members -----

-- thread: revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'2 Esdras 6:20 — *the books shall be opened before the firmament* the heavenly books sealed until the appointed end, the sealed scroll John sees in the right hand of him on the throne (Revelation 5:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=6 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'2 Esdras 14:45 — *that the worthy and unworthy may read it* some books published openly while the hidden ones are sealed and kept back from all but the worthy, the sealed scroll none was found worthy to open (Revelation 5:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-5-the-scroll-written-within-and-sealed-with-seven-seals-ezekiel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=14 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- thread: revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'2 Esdras 12:31 — *the lion, whom you sawest rising up out of the wood, and roaring... rebuking her for her unrighteousness* the Messiah-Lion of Ezra''s vision who confronts the beast-empire, the Lion of Yahudah (Judah) who hath prevailed (Revelation 5:5).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=12 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'2 Esdras 12:32 — *This is the anointed, which the Highest has kept... to the end* the Lion named outright as the anointed of the seed of David, the Root of David reserved and now revealed (Revelation 5:5).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-5-the-lion-of-juda-the-root-of-david-who-prevailed-genesis-49'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=12 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- thread: revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 61:6 — *ye shall be named the Priests of Yahuah (LORD): men shall call you the Ministers of our Elohim (God)* the restoration-promise of priesthood for Yashar''el (Israel), the covenant people made kings and priests by the Lamb''s blood (Revelation 5:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-5-thou-hast-redeemed-us-and-made-us-kings-and-priests-the-new-song-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- thread: revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 48:5 — *All who dwell on earth shall fall down and worship before him, And will praise and bless... Yahuah (God) of Spirits* the worship of the Son of Adam and the glory of the Father together, every creature blessing him on the throne and the Lamb (Revelation 5:13).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 62:9 — *this Son of Adam... Shall raise up the kings and the mighty from their seats* the enthroned Elect One before whom the mighty fall, the worshipped Son distinct from Yahuah (God) of Spirits who seated him (Revelation 5:13).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'1 Enoch 62:6 — *Yahuah (God) of Spirits seated the Elect One on the throne of His glory* the Father enthroning the chosen Son, the worthy Lamb who receives power and glory because the Father has set him there (Revelation 5:12).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-5-worthy-is-the-lamb-worshipped-with-him-that-sat-on-the-throne-philippians-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
