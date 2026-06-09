-- ----- fragment: minion_acts_18.sql (S217 Acts 18) -----
-- =====================================================================
-- S217 minion — ACTS 18 FULL-LIBRARY cross-references
-- =====================================================================
-- Range:  ACTS 18.  Tag: a18 (temp view _s217_a18_lookup).  Sort band: 5700-5712.
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- WATCHPOINTS (Red Lines #4/#7/#11, Christology, son-of-Adam, dropped-Paul):
--  * "Your blood be upon your own heads; I am clean" (18:6): this is Ezekiel's watchman
--    (Ezekiel 33:7-9; 3:18-19) — the watchman who blows the trumpet and warns is clean of
--    the blood; the blood is required at the hand of the watchman who fails to warn. Paul
--    has warned; the blood is now on their own heads, not his. NEVER read as a verdict
--    casting off a people — it is the watchman cleared, the warning delivered, the call
--    still standing (cf. Ezekiel 33:11, no pleasure in the death of the wicked).
--  * "I have much people in this city" (18:9-10): the remnant Yahuah (Lord) keeps and
--    gathers — the much-people already his in Corinth, his sheep who will hear (the hearing
--    revealing what was already true, never names added after the foundation). The night
--    vision *Be not afraid … for I am with thee* is the same comfort given Jeremiah and the
--    servant of Isaiah (Jeremiah 1:8; Isaiah 41:10; 43:5 — the gathering of the seed from
--    east and west). Read as the remnant kept, NOT false-inclusion of non-seed by confession.
--  * The vow / shorn head at Cenchrea (18:18): a Nazarite-style vow (Numbers 6) — Paul
--    Torah-observant, separating himself unto Yahuah (LORD). This is the dropped-Paul
--    correction: the Paul who abolished the Torah does not exist; here he takes a vow, and
--    in Acts 21:24 pays the charges for four men's vows precisely so all may know *that thou
--    thyself also walkest orderly, and keepest the law.* Never let the vow read as residue
--    of a system Paul left behind.
--  * Apollos / "the way more perfectly" / "the baptism of John" (18:24-26): Apollos mighty
--    in the scriptures, knowing only John's baptism, is shown the way more perfectly — the
--    same gap Paul fills for the Ephesian disciples in Acts 19:1-6 (John's baptism of
--    repentance completed in the name of the Lord Yahusha (Lord Jesus) and the Ruach
--    HaKodesh (Holy Spirit)). The come-and-see: the way is unfolded more perfectly, not a
--    new religion installed.
--  * "Watered … helped them much which had believed through grace" (18:27-28): the
--    planted/watered of 1 Corinthians 3:6 (Paul planted, Apollos watered, Elohim (God) gave
--    the increase) and the rain-and-the-word of Isaiah 55:10-11 (the word that goeth forth
--    shall not return void). "Through grace" is the means by which the increase is given —
--    NOT a standalone freedom-from-Torah formula (Red Line #10); grace waters the seed home.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 18:
--   v.1-3   Aquila/Priscilla, tentmakers   Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative; Paul the laborer with his hands carried elsewhere)
--   v.4-5   reasoned/testified Yahusha is Messiah  Tanakh: none added (the scriptures-prove carried in v.28 thread)  Extras: none warranted  NT: none warranted (narrative)
--   v.6     blood on your own heads; I am clean  Tanakh: Ezekiel 33:7, Ezekiel 33:8, Ezekiel 3:18  Extras: none warranted  NT: none warranted
--   v.7-8   Justus/Crispus believe, baptized  Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.9-10  night vision: be not afraid, I am with thee, much people  Tanakh: Jeremiah 1:8, Isaiah 41:10, Isaiah 43:5  Extras: none warranted  NT: none warranted
--   v.11    continued teaching the word  Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.12-17 Gallio refuses to judge        Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative; "question of words and names, and of your law")
--   v.18    shorn head in Cenchrea, a vow  Tanakh: Numbers 6:5, Numbers 6:18  Extras: none warranted  NT: Acts 21:24
--   v.19-23 Ephesus/Antioch/Galatia, keep the feast  Tanakh: none added (feast-keeping carried thematically by the vow/Torah thread)  Extras: none warranted  NT: none warranted (narrative; "I must by all means keep this feast")
--   v.24-26 Apollos, the way more perfectly, John's baptism  Tanakh: none warranted  Extras: none warranted  NT: Acts 19:4, Acts 19:5, Acts 19:6
--   v.27-28 watered / believed through grace / scriptures prove  Tanakh: Isaiah 55:10, Isaiah 55:11  Extras: none warranted  NT: 1 Corinthians 3:6, 1 Corinthians 3:9
--
-- THREADS (slug -> target libraries):
--   5700 acts-18-your-blood-be-upon-your-own-heads-the-watchman-of-yasharel-cleared  (Tanakh)
--   5703 acts-18-i-am-with-thee-i-have-much-people-in-this-city-the-remnant-kept      (Tanakh)
--   5706 acts-18-having-shorn-his-head-in-cenchrea-paul-the-nazarite-keeping-the-law  (Tanakh + NT)
--   5709 acts-18-the-way-more-perfectly-apollos-and-the-baptism-of-john               (NT)
--   5712 acts-18-i-planted-apollos-watered-the-rain-and-the-word-that-prospers        (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s217_a18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-18-your-blood-be-upon-your-own-heads-the-watchman-of-yasharel-cleared
  ('canon', 'acts', 18, 6, 'canon', 'ezekiel', 33, 7, 'free', E'*So thou, O son of Adam, I have set thee a watchman unto the house of Yashar''el (Israel); therefore thou shalt hear the word at my mouth, and warn them from me.* (Ezekiel 33:7). When they opposed and blasphemed, *he shook his raiment, and said unto them, Your blood be upon your own heads; I am clean* (Acts 18:6). This is the watchman of Ezekiel: the one set to hear the word at Yahuah''s (LORD''s) mouth and warn the house. Paul has warned; he stands in the watchman''s office, and his raiment shaken is the trumpet blown.'),
  ('canon', 'acts', 18, 6, 'canon', 'ezekiel', 33, 8, 'free', E'*When I say unto the wicked, O wicked man, thou shalt surely die; if thou dost not speak to warn the wicked from his way, that wicked man shall die in his iniquity; but his blood will I require at thine hand.* (Ezekiel 33:8). The watchman who fails to warn carries the blood at his own hand; the watchman who warns is cleared. *Your blood be upon your own heads; I am clean* (Acts 18:6) is exactly this acquittal — the warning delivered, the blood now upon those who would not hear, the watchman''s hand washed of it.'),
  ('canon', 'acts', 18, 6, 'canon', 'ezekiel', 3, 18, 'free', E'*When I say unto the wicked, Thou shalt surely die; and thou givest him not warning, nor speakest to warn the wicked from his wicked way, to save his life; the same wicked man shall die in his iniquity; but his blood will I require at thine hand.* (Ezekiel 3:18). From the first the watchman''s charge was the same: warn, and *thou hast delivered thy soul* (Ezekiel 3:19). Paul, having testified that Yahusha (Jesus) was Messiah (Christ) and met only blasphemy, declares himself clean — the soul delivered, the warning given, the blood upon their own heads, not his.'),
  -- thread: acts-18-i-am-with-thee-i-have-much-people-in-this-city-the-remnant-kept
  ('canon', 'acts', 18, 9, 'canon', 'jeremiah', 1, 8, 'free', E'*Be not afraid of their faces: for I am with thee to deliver thee, saith Yahuah (LORD).* (Jeremiah 1:8). In the night vision *spake Yahuah (Lord) to Paul … Be not afraid, but speak, and hold not thy peace* (Acts 18:9). It is the very word Yahuah (LORD) gave Jeremiah at his sending — *be not afraid … for I am with thee.* The One who steadied the prophet against the faces of the people steadies Paul in Corinth: speak, hold not thy peace, for I am with thee.'),
  ('canon', 'acts', 18, 10, 'canon', 'isaiah', 41, 10, 'free', E'*Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* (Isaiah 41:10). *For I am with thee, and no man shall set on thee to hurt thee* (Acts 18:10). The promise spoken to the servant — *fear thou not; for I am with thee* — is spoken again over Paul: the same presence that upholds with the right hand of righteousness guards him that none shall hurt him in that city.'),
  ('canon', 'acts', 18, 10, 'canon', 'isaiah', 43, 5, 'free', E'*Fear not: for I am with thee: I will bring thy seed from the east, and gather thee from the west;* (Isaiah 43:5). *For I have much people in this city* (Acts 18:10). The much-people Yahuah (Lord) names as already his in Corinth are the seed he gathers from east and west — his sheep who will hear because they are his, the scattered remnant kept and called home. *Fear not: for I am with thee* is the word over the gathering: the people are already his before the word reaches them; the hearing reveals what was already true.'),
  -- thread: acts-18-having-shorn-his-head-in-cenchrea-paul-the-nazarite-keeping-the-law
  ('canon', 'acts', 18, 18, 'canon', 'numbers', 6, 5, 'free', E'*All the days of the vow of his separation there shall no razor come upon his head: until the days be fulfilled, in the which he separateth himself unto Yahuah (LORD), he shall be holy, and shall let the locks of the hair of his head grow.* (Numbers 6:5). Paul *took his leave of the brethren … having shorn his head in Cenchrea: for he had a vow* (Acts 18:18). The vow is the Nazarite''s: the hair let grow through the days of separation unto Yahuah (LORD), then shorn when the days are fulfilled. This is no relic of an abandoned system — it is Paul separating himself unto Yahuah (LORD) by the very law of the Nazarite.'),
  ('canon', 'acts', 18, 18, 'canon', 'numbers', 6, 18, 'free', E'*And the Nazarite shall shave the head of his separation at the door of the tabernacle of the congregation, and shall take the hair of the head of his separation, and put it in the fire which is under the sacrifice of the peace offerings.* (Numbers 6:18). The shorn head at Cenchrea — *having shorn his head … for he had a vow* (Acts 18:18) — is the close of the Nazarite''s separation, the hair brought to the fire of the peace offering. Paul keeps the law of the vow he took, walking orderly in the Torah he never left.'),
  ('canon', 'acts', 18, 18, 'canon', 'acts', 21, 24, 'free', E'*Them take, and purify thyself with them, and be at charges with them, that they may shave their heads: and all may know that those things, whereof they were informed concerning thee, are nothing; but that thou thyself also walkest orderly, and keepest the law.* (Acts 21:24). The vow at Cenchrea is no isolated act: in Yerushalayim (Jerusalem) Paul pays the charges for four men under a vow that all may see *thou thyself also walkest orderly, and keepest the law.* The shorn head of Acts 18:18 and the four men''s vows of Acts 21:24 testify to one man — Torah-observant, keeping the vow, keeping the law.'),
  -- thread: acts-18-the-way-more-perfectly-apollos-and-the-baptism-of-john
  ('canon', 'acts', 18, 25, 'canon', 'acts', 19, 4, 'free', E'*Then said Paul, John verily baptized with the baptism of repentance, saying unto the people, that they should believe on him which should come after him, that is, on HaMashiach Yahusha (Christ Jesus).* (Acts 19:4). Apollos *taught diligently the things of Yahuah (Lord), knowing only the baptism of John* (Acts 18:25). The gap is the very one Paul names to the disciples at Ephesus: John''s baptism was the baptism of repentance pointing forward to the One coming after — *that is, on HaMashiach Yahusha (Christ Jesus).* The baptism of John is true and points home; it is completed, not discarded, by the One it pointed to.'),
  ('canon', 'acts', 18, 26, 'canon', 'acts', 19, 5, 'free', E'*When they heard this, they were baptized in the name of the Lord Yahusha (Lord Jesus).* (Acts 19:5). When Aquila and Priscilla heard Apollos, *they took him unto them, and expounded unto him the way of Elohim (God) more perfectly* (Acts 18:26). The same completing happens at Ephesus: those who knew only John''s baptism are now *baptized in the name of the Lord Yahusha (Lord Jesus).* The way of Elohim (God) is unfolded more perfectly — the repentance of John carried through to the Lord Yahusha (Lord Jesus) it always pointed toward.'),
  ('canon', 'acts', 18, 26, 'canon', 'acts', 19, 6, 'free', E'*And when Paul had laid his hands upon them, the Ruach HaKodesh (Holy Spirit) came on them; and they spake with tongues, and prophesied.* (Acts 19:6). Apollos, fervent in the spirit yet knowing only John''s baptism, is shown *the way of Elohim (God) more perfectly* (Acts 18:26); and at Ephesus the disciples who knew only John''s baptism receive the Ruach HaKodesh (Holy Spirit) when Paul lays hands upon them. The more-perfect way is the way completed in the Spirit — the repentance of John brought home to the outpouring promised.'),
  -- thread: acts-18-i-planted-apollos-watered-the-rain-and-the-word-that-prospers
  ('canon', 'acts', 18, 27, 'canon', '1-corinthians', 3, 6, 'free', E'*I have planted, Apollos watered; but Elohim (God) gave the increase.* (1 Corinthians 3:6). Apollos passes into Achaia and *helped them much which had believed through grace* (Acts 18:27). Paul names the labor exactly: he himself planted at Corinth, and Apollos — coming after — watered; but the increase is Elohim''s (God''s). The helping much is the watering of a seed already planted, and the grace through which they believed is the means by which Elohim (God) gives the increase.'),
  ('canon', 'acts', 18, 27, 'canon', 'isaiah', 55, 10, 'free', E'*For as the rain cometh down, and the snow from heaven, and returneth not thither, but watereth the earth, and maketh it bring forth and bud, that it may give seed to the sower, and bread to the eater:* (Isaiah 55:10). Apollos *watered* those who had believed (Acts 18:27) as the rain waters the earth — coming down to make the ground bring forth and bud. The watering is not the increase; it is the rain over the seed, that Elohim (God) may give the bringing-forth.'),
  ('canon', 'acts', 18, 28, 'canon', 'isaiah', 55, 11, 'free', E'*So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it.* (Isaiah 55:11). Apollos *mightily convinced the Yahudim (Jews), and that publickly, shewing by the scriptures that Yahusha (Jesus) was Messiah (Christ)* (Acts 18:28). The word goeth forth out of the mouth and does not return void: shown by the scriptures, it accomplishes what Yahuah (LORD) pleases and prospers in the thing whereto he sent it — the scriptures themselves witnessing the Messiah (Christ) they foretold.'),
  ('canon', 'acts', 18, 27, 'canon', '1-corinthians', 3, 9, 'free', E'*For we are labourers together with Elohim (God): ye are Elohim''s (God''s) husbandry, ye are Elohim''s (God''s) building.* (1 Corinthians 3:9). The brethren wrote exhorting the disciples to receive Apollos, who *helped them much which had believed through grace* (Acts 18:27). Planter and waterer are one work — *labourers together with Elohim (God)* — and the believers are Elohim''s (God''s) husbandry, the field he tends. The grace through which they believed is Elohim (God) giving the increase upon the labor of his servants.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-18-your-blood-be-upon-your-own-heads-the-watchman-of-yasharel-cleared',
       E'Your blood be upon your own heads — the watchman of Yashar''el (Israel) cleared',
       E'Paul testifies in the synagogue at Corinth *that Yahusha (Jesus) was Messiah (Christ)* (Acts 18:5); and *when they opposed themselves, and blasphemed, he shook his raiment, and said unto them, Your blood be upon your own heads; I am clean* (Acts 18:6). This is the watchman of Ezekiel, word for word in office. Yahuah (LORD) had set the prophet *a watchman unto the house of Yashar''el (Israel); therefore thou shalt hear the word at my mouth, and warn them from me* (Ezekiel 33:7), and the charge was exact: *if thou dost not speak to warn the wicked from his way, that wicked man shall die in his iniquity; but his blood will I require at thine hand* (Ezekiel 33:8). From the first the same word stood — *thou givest him not warning … his blood will I require at thine hand* (Ezekiel 3:18) — and the watchman who warns *hath delivered his soul.* Paul has blown the trumpet; the warning is delivered; the watchman''s hand is washed of the blood. This is not a verdict casting off a people but the watchman cleared — and the call still stands, for Yahuah (LORD) saith *I have no pleasure in the death of the wicked; but that the wicked turn from his way and live* (Ezekiel 33:11).',
       sv.verse_id, ev.verse_id, 'free', 5700
  FROM _s217_a18_lookup sv, _s217_a18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=18 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-18-i-am-with-thee-i-have-much-people-in-this-city-the-remnant-kept',
       E'I am with thee, I have much people in this city — the remnant kept',
       E'In the night Yahuah (Lord) speaks to Paul by a vision: *Be not afraid, but speak, and hold not thy peace: For I am with thee, and no man shall set on thee to hurt thee: for I have much people in this city* (Acts 18:9-10). The comfort is the prophets'' own. To Jeremiah at his sending: *Be not afraid of their faces: for I am with thee to deliver thee, saith Yahuah (LORD)* (Jeremiah 1:8). To the servant: *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee* (Isaiah 41:10). The same presence that steadied the prophets against the faces of the people now guards Paul, that none shall hurt him. And the ground of the comfort is the much-people already his: *Fear not: for I am with thee: I will bring thy seed from the east, and gather thee from the west* (Isaiah 43:5). The much-people in Corinth are the seed Yahuah (Lord) gathers from east and west — his sheep who will hear because they are already his. They are not made his people by responding; they respond because they are his people. The hearing reveals what was already true; the remnant is kept and called home.',
       sv.verse_id, ev.verse_id, 'free', 5703
  FROM _s217_a18_lookup sv, _s217_a18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=18 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-18-having-shorn-his-head-in-cenchrea-paul-the-nazarite-keeping-the-law',
       E'Having shorn his head in Cenchrea — Paul the Nazarite, keeping the law',
       E'Paul *took his leave of the brethren, and sailed thence into Syria, and with him Priscilla and Aquila; having shorn his head in Cenchrea: for he had a vow* (Acts 18:18). The vow is the Nazarite''s, by the law of Numbers 6. Through the days of separation *there shall no razor come upon his head … he shall be holy, and shall let the locks of the hair of his head grow* (Numbers 6:5); and when the days are fulfilled, *the Nazarite shall shave the head of his separation … and put it in the fire which is under the sacrifice of the peace offerings* (Numbers 6:18). The shorn head at Cenchrea is the close of a separation unto Yahuah (LORD) — Paul keeping the very law of the vow he took. This is no residue of a system he had left behind: in Yerushalayim (Jerusalem) he pays the charges for four men under a vow precisely *that all may know … that thou thyself also walkest orderly, and keepest the law* (Acts 21:24). The Paul who abolished the Torah does not exist. Here is the Paul who is — separating himself unto Yahuah (LORD), keeping the vow, keeping the law.',
       sv.verse_id, ev.verse_id, 'free', 5706
  FROM _s217_a18_lookup sv, _s217_a18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=18 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-18-the-way-more-perfectly-apollos-and-the-baptism-of-john',
       E'The way more perfectly — Apollos and the baptism of John',
       E'Apollos comes to Ephesus *an eloquent man, and mighty in the scriptures … instructed in the way of Yahuah (Lord); and being fervent in the spirit, he spake and taught diligently the things of Yahuah (Lord), knowing only the baptism of John* (Acts 18:24-25). When Aquila and Priscilla hear him, *they took him unto them, and expounded unto him the way of Elohim (God) more perfectly* (Acts 18:26). The gap is named exactly when Paul meets the Ephesian disciples who also knew only John''s baptism: *John verily baptized with the baptism of repentance, saying unto the people, that they should believe on him which should come after him, that is, on HaMashiach Yahusha (Christ Jesus)* (Acts 19:4). The baptism of John is true and points forward; it is not discarded but carried home to the One it pointed to. *When they heard this, they were baptized in the name of the Lord Yahusha (Lord Jesus)* (Acts 19:5), and *when Paul had laid his hands upon them, the Ruach HaKodesh (Holy Spirit) came on them* (Acts 19:6). The more-perfect way is the way completed in the Lord Yahusha (Lord Jesus) and in the Spirit — the repentance of John brought through to the outpouring it always promised.',
       sv.verse_id, ev.verse_id, 'free', 5709
  FROM _s217_a18_lookup sv, _s217_a18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=18 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-18-i-planted-apollos-watered-the-rain-and-the-word-that-prospers',
       E'I planted, Apollos watered — the rain and the word that prospers',
       E'Apollos passes into Achaia and *helped them much which had believed through grace* (Acts 18:27), and *mightily convinced the Yahudim (Jews), and that publickly, shewing by the scriptures that Yahusha (Jesus) was Messiah (Christ)* (Acts 18:28). Paul names the labor exactly: *I have planted, Apollos watered; but Elohim (God) gave the increase* (1 Corinthians 3:6). Paul planted the seed at Corinth; Apollos, coming after, watered; and the increase is Elohim''s (God''s). It is the rain of Isaiah: *as the rain cometh down, and the snow from heaven, and returneth not thither, but watereth the earth, and maketh it bring forth and bud* (Isaiah 55:10) — the watering is not the increase but the rain over the seed, that the ground may bring forth. And the scriptures by which Apollos convinces are themselves the word that does not return void: *so shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it* (Isaiah 55:11). Planter and waterer are one work — *labourers together with Elohim (God): ye are Elohim''s (God''s) husbandry* (1 Corinthians 3:9). The grace through which they believed is the means by which Elohim (God) gives the increase — grace watering the seed home, not a freedom standing apart from his ways.',
       sv.verse_id, ev.verse_id, 'free', 5712
  FROM _s217_a18_lookup sv, _s217_a18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=18 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-18-your-blood-be-upon-your-own-heads-the-watchman-of-yasharel-cleared
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 33:7 — *I have set thee a watchman unto the house of Yashar''el (Israel) … warn them from me* the watchman''s office Paul stands in, the trumpet blown (Acts 18:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-your-blood-be-upon-your-own-heads-the-watchman-of-yasharel-cleared'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 33:8 — *his blood will I require at thine hand* the watchman who warns is cleared; *I am clean* (Acts 18:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-your-blood-be-upon-your-own-heads-the-watchman-of-yasharel-cleared'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 3:18 — *thou givest him not warning … his blood will I require at thine hand* the watchman''s charge from the first; warn, and the soul is delivered (Acts 18:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-your-blood-be-upon-your-own-heads-the-watchman-of-yasharel-cleared'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-18-i-am-with-thee-i-have-much-people-in-this-city-the-remnant-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 1:8 — *Be not afraid of their faces: for I am with thee to deliver thee* the prophet''s sending-word now over Paul (Acts 18:9).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-i-am-with-thee-i-have-much-people-in-this-city-the-remnant-kept'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 41:10 — *Fear thou not; for I am with thee … I will uphold thee with the right hand of my righteousness* the servant''s comfort; none shall set on Paul to hurt him (Acts 18:10).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-i-am-with-thee-i-have-much-people-in-this-city-the-remnant-kept'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 43:5 — *I will bring thy seed from the east, and gather thee from the west* the much-people already his, the seed gathered; they hear because they are his (Acts 18:10).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-i-am-with-thee-i-have-much-people-in-this-city-the-remnant-kept'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-18-having-shorn-his-head-in-cenchrea-paul-the-nazarite-keeping-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 6:5 — *there shall no razor come upon his head … he shall let the locks of the hair of his head grow* the Nazarite''s separation unto Yahuah (LORD), the vow Paul took (Acts 18:18).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-having-shorn-his-head-in-cenchrea-paul-the-nazarite-keeping-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 6:18 — *the Nazarite shall shave the head of his separation* the shorn head at Cenchrea, the close of the vow (Acts 18:18).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-having-shorn-his-head-in-cenchrea-paul-the-nazarite-keeping-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 21:24 — *that thou thyself also walkest orderly, and keepest the law* the same Paul pays the charges for four men''s vows in Yerushalayim (Jerusalem); the vow at Cenchrea is no isolated act (Acts 18:18).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-having-shorn-his-head-in-cenchrea-paul-the-nazarite-keeping-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=21 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-18-the-way-more-perfectly-apollos-and-the-baptism-of-john
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 19:4 — *John verily baptized with the baptism of repentance … that they should believe on him which should come after him* the gap Apollos had, knowing only John''s baptism (Acts 18:25).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-the-way-more-perfectly-apollos-and-the-baptism-of-john'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=19 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 19:5 — *they were baptized in the name of the Lord Yahusha (Lord Jesus)* the way of Elohim (God) expounded more perfectly, John''s baptism carried home (Acts 18:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-the-way-more-perfectly-apollos-and-the-baptism-of-john'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 19:6 — *the Ruach HaKodesh (Holy Spirit) came on them* the more-perfect way completed in the Spirit (Acts 18:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-the-way-more-perfectly-apollos-and-the-baptism-of-john'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-18-i-planted-apollos-watered-the-rain-and-the-word-that-prospers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 3:6 — *I have planted, Apollos watered; but Elohim (God) gave the increase* Paul names the labor; Apollos helps much those who believed (Acts 18:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-i-planted-apollos-watered-the-rain-and-the-word-that-prospers'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 55:10 — *as the rain cometh down … and watereth the earth* the watering of the seed, the rain over the ground (Acts 18:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-i-planted-apollos-watered-the-rain-and-the-word-that-prospers'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 3:9 — *labourers together with Elohim (God): ye are Elohim''s (God''s) husbandry* planter and waterer one work; grace gives the increase (Acts 18:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-i-planted-apollos-watered-the-rain-and-the-word-that-prospers'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 55:11 — *my word … shall not return unto me void, but it shall accomplish that which I please* the scriptures by which Apollos convinces, the word that prospers (Acts 18:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a18_lookup sv, _s217_a18_lookup tv
 WHERE t.slug='acts-18-i-planted-apollos-watered-the-rain-and-the-word-that-prospers'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=18 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
