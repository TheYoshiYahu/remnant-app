-- ----- fragment: minion_2timothy_01.sql (S236 2 Timothy 1) -----
-- =====================================================================
-- S236 minion — 2 TIMOTHY 1 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 TIMOTHY 1 (18 verses) — THE DEPOSIT / GRACE NOT WORKS / DEATH ABOLISHED.
-- Tag: t236c1 (temp view _s236_t236c1_lookup).
-- Sort band: floor 8550 (25-wide); used 8550, 8553, 8556, 8559 (all under 8575).
-- Source is ALWAYS the canon 2 Timothy verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (2 Timothy = the apostle's last words, the CHARGE TO ENDURE; same Yahuah, same
-- Torah, same Yashar'el, the deposit and the sound words guarded to the end; NO replacement theology,
-- NO law-vs-grace antithesis). Chapter 1 opens Paul, ready to be offered, charging his beloved son
-- Timothy. ★ 1:9-10 is load-bearing: *not according to our works* excludes FLESH-MERIT/boasting, NOT
-- the Torah — election and calling rest on Elohim's own purpose and covenant love (Deuteronomy 7:7-8
-- *not because ye were more in number... but because Yahuah loved you*). *Abolished death* = the
-- conquest of the grave (Isaiah 25:8 *he will swallow up death in victory*, Hosea 13:14 *I will
-- ransom them from the power of the grave*), the resurrection hope — NOT the abolition of the law.
-- The faith taught Timothy *from a child* by Lois and Eunice (1:5) is the Deuteronomic charge to
-- teach the word to children (Deuteronomy 6:6-7); the spirit of *power, and of love, and of a sound
-- mind* not of fear (1:7) re-speaks Yahuah's *Fear thou not... I will strengthen thee* (Isaiah 41:10);
-- and *that good thing which was committed unto thee keep* (1:14) is the deposit, Isaiah's *bind up
-- the testimony, seal the law among my disciples* (Isaiah 8:16). Christology: salvation is *in
-- HaMashiach Yahusha (Christ Jesus)* by the Father's *own purpose and grace*; the Father saves and
-- calls, made manifest by the appearing of the Saviour, the Formed. No co-equal-persons grammar.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   Paul to Timothy his beloved son; the promise of life; remembrance night and day
--           Tanakh: none warranted (greeting/thanksgiving; load carried at 1:9-10 promise-of-life)
--           Extras: none warranted   NT: none warranted
--   v.5     the unfeigned faith first in grandmother Lois and mother Eunice
--           Tanakh: Deuteronomy 6:6-7 (these words... thou shalt teach them diligently unto thy
--                   children), Deuteronomy 4:9 (teach them thy sons, and thy sons' sons)
--           Extras: none warranted   NT: none warranted (the from-a-child faith is the Torah root)
--   v.6     stir up the gift of Elohim in thee by the putting on of hands
--           Tanakh: none warranted (laying-on-of-hands carried in prose; no load-bearing single root)
--           Extras: none warranted   NT: none warranted
--   v.7-8   not the spirit of fear but of power, love, sound mind; be not ashamed of the testimony
--           Tanakh: Isaiah 41:10 (Fear thou not... I will strengthen thee), Joshua 1:9 (be not
--                   afraid... for Yahuah Elohayka is with thee)
--           Extras: none warranted   NT: Romans 8:15 (ye have not received the spirit of bondage
--                   again to fear)
--   v.9-10  saved and called by grace not works, before the world began; death abolished, life and
--           immortality brought to light  [★ LOAD-BEARING]
--           Tanakh: Deuteronomy 7:7-8 (not because ye were more in number... but because Yahuah
--                   loved you), Isaiah 25:8 (He will swallow up death in victory), Hosea 13:14
--                   (I will ransom them from the power of the grave; I will redeem them from death)
--           Extras: Wisdom of Solomon 2:23 (Yahuah created man to be immortal, image of his eternity),
--                   Wisdom of Solomon 3:4 (their hope full of immortality)
--           NT: 1 Corinthians 15:54 (Death is swallowed up in victory), Titus 1:2 (eternal life
--               promised before the world began), Ephesians 1:4 (chosen in him before the foundation
--               of the world)
--   v.11-12 appointed a preacher and apostle; I know whom I have believed; keep that which I committed
--           Tanakh: none warranted (the deposit weight gathered at 1:13-14)
--           Extras: none warranted   NT: none warranted
--   v.13-14 hold fast the form of sound words; keep the good thing committed (the deposit)
--           Tanakh: Isaiah 8:16 (Bind up the testimony, seal the law among my disciples),
--                   Proverbs 4:13 (Take fast hold of instruction... keep her; for she is thy life)
--           Extras: none warranted   NT: none warranted (the keep-the-deposit charge is the Torah root)
--   v.15-18 all in Asia turned away; mercy on the house of Onesiphorus who was not ashamed of my chain
--           Tanakh: none warranted (personal report; no load-bearing root)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   8550 2-timothy-1-saved-and-called-by-grace-not-works-death-abolished-deuteronomy-7-isaiah-25  (Tanakh + Extras + NT)  [★ BLESSING]
--   8553 2-timothy-1-the-unfeigned-faith-of-lois-and-eunice-taught-from-a-child-deuteronomy-6     (Tanakh)
--   8556 2-timothy-1-the-spirit-of-power-and-love-not-of-fear-isaiah-41                            (Tanakh + NT)
--   8559 2-timothy-1-keep-the-good-deposit-the-form-of-sound-words-isaiah-8                        (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s236_t236c1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-timothy-1-saved-and-called-by-grace-not-works-death-abolished-deuteronomy-7-isaiah-25  [★ BLESSING]
  ('canon', '2-timothy', 1, 9, 'canon', 'deuteronomy', 7, 7, 'free', E'*Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people:* (Deuteronomy 7:7). Paul says we were *saved... and called with an holy calling, not according to our works, but according to his own purpose and grace* (2 Timothy 1:9). Read it through the Torah''s own word: Yahuah (LORD) did not choose Yashar''el (Israel) for any merit of theirs — *not because ye were more in number* — but of his own purpose and love. *Not according to our works* is the same word: flesh-merit and boasting are excluded, the calling rests on Elohim''s sovereign love, NOT the Torah set aside.'),
  ('canon', '2-timothy', 1, 9, 'canon', 'deuteronomy', 7, 8, 'free', E'*But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD) brought you out with a mighty hand, and redeemed you out of the house of bondmen, from the hand of Pharaoh king of Egypt.* (Deuteronomy 7:8). Here is the ground of the calling Paul names — *his own purpose and grace, which was given us in HaMashiach Yahusha (Christ Jesus) before the world began* (2 Timothy 1:9). It was *because Yahuah (LORD) loved you,* and to keep his sworn oath, that he redeemed his people; never their works, always his covenant love. The grace given before the world began is this same electing love, the oath now made manifest in the Saviour.'),
  ('canon', '2-timothy', 1, 10, 'canon', 'isaiah', 25, 8, 'free', E'*He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away from off all the earth: for Yahuah (LORD) hath spoken it.* (Isaiah 25:8). When Paul says the Saviour *hath abolished death, and hath brought life and immortality to light* (2 Timothy 1:10), he proclaims this promise come to pass. *Abolished death* is Isaiah''s *He will swallow up death in victory* — the conquest of the grave, the resurrection hope. What is abolished is death, NOT the law; the One who swallows up death is Yahuah (LORD) who spoke it, made manifest by the appearing of the Saviour.'),
  ('canon', '2-timothy', 1, 10, 'canon', 'hosea', 13, 14, 'free', E'*I will ransom them from the power of the grave; I will redeem them from death: O death, I will be thy plagues; O grave, I will be thy destruction: repentance shall be hid from mine eyes.* (Hosea 13:14). Yahuah (LORD) vowed to *ransom them from the power of the grave* and to be death''s own plague and destruction. Paul declares it accomplished: the Saviour *hath abolished death, and hath brought life and immortality to light through the gospel* (2 Timothy 1:10). The death that is abolished is the grave Hosea named; the immortality brought to light is the ransom of Yahuah (LORD) made manifest — the conquest of death, not the abolition of the Torah.'),
  ('canon', '2-timothy', 1, 9, 'apocrypha', 'the-wisdom-of-solomon', 2, 23, 'extras', E'*For Yahuah (God) created man to be immortal, and made him to be an image of his own eternity.* (Wisdom of Solomon 2:23). The Hebrew library held that man was made for immortality, *an image of his own eternity* — death being the intruder. Paul preaches the recovery of that estate: a calling *according to his own purpose and grace, which was given us in HaMashiach Yahusha (Christ Jesus) before the world began* (2 Timothy 1:9), the immortality for which man was created now brought to light by the Saviour. The grace before the world began answers the eternity-image man was formed to bear.'),
  ('canon', '2-timothy', 1, 10, 'apocrypha', 'the-wisdom-of-solomon', 3, 4, 'extras', E'*For though they be punished in the sight of men, yet is their hope full of immortality.* (Wisdom of Solomon 3:4). The library held the souls of the righteous in the hand of Yahuah (God), their *hope full of immortality* though they seemed to die. Paul names that hope made manifest: the Saviour *hath abolished death, and hath brought life and immortality to light through the gospel* (2 Timothy 1:10). The immortality the righteous hoped for is the immortality Paul says is now brought to light — the resurrection conquest of the grave.'),
  ('canon', '2-timothy', 1, 10, 'canon', '1-corinthians', 15, 54, 'free', E'*So when this corruptible shall have put on incorruption, and this mortal shall have put on immortality, then shall be brought to pass the saying that is written, Death is swallowed up in victory.* (1 Corinthians 15:54). Paul names the same swallowing-up of death that Isaiah spoke, declaring it the resurrection of the body. It is the very thing he tells Timothy: the Saviour *hath abolished death, and hath brought life and immortality to light* (2 Timothy 1:10). *Death is swallowed up in victory* — Isaiah''s word fulfilled, the mortal putting on immortality; the abolition of death, not of the law.'),
  ('canon', '2-timothy', 1, 9, 'canon', 'titus', 1, 2, 'free', E'*In hope of eternal life, which Elohim (God), that cannot lie, promised before the world began;* (Titus 1:2). To Titus Paul speaks the same before-the-world purpose he names to Timothy: salvation *according to his own purpose and grace, which was given us in HaMashiach Yahusha (Christ Jesus) before the world began* (2 Timothy 1:9). The eternal life *promised before the world began* by the Elohim (God) who cannot lie is the grace given before the world began — one purpose, fixed in the Father''s own counsel, now made manifest by the appearing of the Saviour.'),
  ('canon', '2-timothy', 1, 9, 'canon', 'ephesians', 1, 4, 'free', E'*According as he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him in love:* (Ephesians 1:4). The choosing *before the foundation of the world* is the calling *not according to our works, but according to his own purpose and grace, which was given us in HaMashiach Yahusha (Christ Jesus) before the world began* (2 Timothy 1:9). The election rests on the Father''s purpose and love, not on works — *that we should be holy and without blame before him in love* — the very holiness the holy calling is unto. Grace before the world began, election unto holiness, no flesh-merit and no Torah abolished.'),
  -- thread: 2-timothy-1-the-unfeigned-faith-of-lois-and-eunice-taught-from-a-child-deuteronomy-6
  ('canon', '2-timothy', 1, 5, 'canon', 'deuteronomy', 6, 6, 'free', E'*And these words, which I command thee this day, shall be in thine heart:* (Deuteronomy 6:6). Before a word is taught a child it must dwell in the parent''s own heart — and so Paul recalls *the unfeigned faith that is in thee, which dwelt first in thy grandmother Lois, and thy mother Eunice* (2 Timothy 1:5). The faith passed down three generations is the Deuteronomic pattern: the words of Yahuah (LORD) first *in thine heart,* then handed to the children. Timothy''s faith is no new thing but the Torah''s own way of transmission, the word kept in the heart and passed to the household.'),
  ('canon', '2-timothy', 1, 5, 'canon', 'deuteronomy', 6, 7, 'free', E'*And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up.* (Deuteronomy 6:7). The command is to teach the word *diligently unto thy children* — and this is exactly what Lois and Eunice did, so that *from a child* Timothy knew the faith (2 Timothy 1:5; cf. 3:15). The *unfeigned faith* that dwelt first in the grandmother and mother is the Shema''s charge kept: the household taught the word morning and evening, the faith handed down unfeigned through the generations of Yashar''el (Israel).'),
  ('canon', '2-timothy', 1, 5, 'canon', 'deuteronomy', 4, 9, 'free', E'*Only take heed to thyself, and keep thy soul diligently, lest thou forget the things which thine eyes have seen, and lest they depart from thy heart all the days of thy life: but teach them thy sons, and thy sons'' sons;* (Deuteronomy 4:9). Moses charges the people to teach *thy sons, and thy sons'' sons* — the very span of Timothy''s inheritance, *which dwelt first in thy grandmother Lois, and thy mother Eunice; and... in thee also* (2 Timothy 1:5). Three generations, grandmother to mother to son: the Torah''s charge that the word not depart from the heart but pass to sons and sons'' sons is fulfilled in this unfeigned faith.'),
  -- thread: 2-timothy-1-the-spirit-of-power-and-love-not-of-fear-isaiah-41
  ('canon', '2-timothy', 1, 7, 'canon', 'isaiah', 41, 10, 'free', E'*Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* (Isaiah 41:10). Yahuah (LORD) puts away fear and gives strength: *Fear thou not... I will strengthen thee.* So Paul tells Timothy *Elohim (God) hath not given us the spirit of fear; but of power, and of love, and of a sound mind* (2 Timothy 1:7). The Spirit Timothy is given is not of fear but of power — the same strengthening Yahuah (LORD) promised, the right hand of righteousness upholding the servant against all dread.'),
  ('canon', '2-timothy', 1, 8, 'canon', 'joshua', 1, 9, 'free', E'*Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest.* (Joshua 1:9). As Yahuah (LORD) charged Joshua to *be not afraid, neither be thou dismayed,* so Paul charges Timothy: *Be not thou therefore ashamed of the testimony of our Lord, nor of me his prisoner: but be thou partaker of the afflictions of the gospel* (2 Timothy 1:8). The courage that brought Yashar''el (Israel) into the land is the courage to bear the gospel''s afflictions unashamed — for the same Elohim (God) is with his servant whithersoever he goes.'),
  ('canon', '2-timothy', 1, 7, 'canon', 'romans', 8, 15, 'free', E'*For ye have not received the spirit of bondage again to fear; but ye have received the Spirit of adoption, whereby we cry, Abba, Father.* (Romans 8:15). Paul says the same to the Romans as to Timothy: *ye have not received the spirit of bondage again to fear.* The Spirit given is not of fear but of sonship — *Elohim (God) hath not given us the spirit of fear; but of power, and of love, and of a sound mind* (2 Timothy 1:7). The Spirit of adoption crying *Abba, Father* is the Spirit of power and love; fear has no place in the household of the Father.'),
  -- thread: 2-timothy-1-keep-the-good-deposit-the-form-of-sound-words-isaiah-8
  ('canon', '2-timothy', 1, 14, 'canon', 'isaiah', 8, 16, 'free', E'*Bind up the testimony, seal the law among my disciples.* (Isaiah 8:16). Isaiah charges that the testimony be bound up and the law sealed *among my disciples* — guarded, kept, handed to those taught. Paul lays the same charge on Timothy: *That good thing which was committed unto thee keep by the Ruach HaKodesh (Holy Spirit) which dwelleth in us* (2 Timothy 1:14). The deposit Timothy keeps is the testimony and the law bound up among the disciples; the *form of sound words* (2 Timothy 1:13) is the sealed teaching, guarded by the Spirit and passed on undefiled.'),
  ('canon', '2-timothy', 1, 13, 'canon', 'proverbs', 4, 13, 'free', E'*Take fast hold of instruction; let her not go: keep her; for she is thy life.* (Proverbs 4:13). The wisdom-charge is to *take fast hold of instruction... keep her; for she is thy life* — and Paul echoes it: *Hold fast the form of sound words, which thou hast heard of me, in faith and love which is in HaMashiach Yahusha (Christ Jesus)* (2 Timothy 1:13). To *hold fast* the sound words is to *take fast hold of instruction* and not let her go; the deposit is no mere doctrine but life itself, kept by faith and love and guarded to the end.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s236_t236c1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s236_t236c1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-1-saved-and-called-by-grace-not-works-death-abolished-deuteronomy-7-isaiah-25',
       E'Saved and called by grace not works, death abolished (Deuteronomy 7, Isaiah 25)',
       E'Paul names the ground of the whole calling: *Who hath saved us, and called us with an holy calling, not according to our works, but according to his own purpose and grace, which was given us in HaMashiach Yahusha (Christ Jesus) before the world began* (2 Timothy 1:9). Hear *not according to our works* through the Torah''s own word, lest it be twisted into a law-vs-grace antithesis. Yahuah (LORD) said the very same of Yashar''el (Israel) at the first: *Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people* (Deuteronomy 7:7); *But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD) brought you out with a mighty hand* (Deuteronomy 7:8). The election never rested on merit or numbers or works — only on Elohim''s own purpose and covenant love and his sworn oath. *Not according to our works* excludes the boast of the flesh, NOT the Torah; the grace given before the world began is this same electing love, now made manifest. And the manifestation is the conquest of the grave: the Saviour *hath abolished death, and hath brought life and immortality to light* (2 Timothy 1:10). *Abolished death* is Isaiah''s promise come to pass — *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces* (Isaiah 25:8) — and Hosea''s vow, *I will ransom them from the power of the grave; I will redeem them from death: O death, I will be thy plagues; O grave, I will be thy destruction* (Hosea 13:14). What is abolished is death, NOT the law. The Hebrew library held the same hope: man was made for it, *for Yahuah (God) created man to be immortal, and made him to be an image of his own eternity* (Wisdom of Solomon 2:23), and the righteous keep it, *their hope full of immortality* (Wisdom of Solomon 3:4). Paul declares it accomplished where Isaiah is fulfilled in the resurrection: *Death is swallowed up in victory* (1 Corinthians 15:54). And the before-the-world purpose is one fixed counsel of the Father — *In hope of eternal life, which Elohim (God), that cannot lie, promised before the world began* (Titus 1:2); *According as he hath chosen us in him before the foundation of the world, that we should be holy and without blame* (Ephesians 1:4). Harmonized: salvation by grace excludes flesh-merit and boasting, not the Torah; death — not the law — is the thing abolished, swallowed up in the victory of the One who created man for immortality and ransomed him from the grave.',
       sv.verse_id, ev.verse_id, 'extras', 8550
  FROM _s236_t236c1_lookup sv, _s236_t236c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=1 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-1-the-unfeigned-faith-of-lois-and-eunice-taught-from-a-child-deuteronomy-6',
       E'The unfeigned faith of Lois and Eunice, taught from a child (Deuteronomy 6, 4)',
       E'Paul remembers *the unfeigned faith that is in thee, which dwelt first in thy grandmother Lois, and thy mother Eunice; and I am persuaded that in thee also* (2 Timothy 1:5) — a faith handed down three generations, so that *from a child* Timothy knew the holy scriptures (2 Timothy 3:15). This is the Torah''s own pattern of transmission, not a new thing. The Shema commands the word first to dwell in the heart, then to be handed to the children: *And these words, which I command thee this day, shall be in thine heart* (Deuteronomy 6:6); *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up* (Deuteronomy 6:7). And Moses charges the very span of Timothy''s inheritance — *but teach them thy sons, and thy sons'' sons* (Deuteronomy 4:9), grandmother to mother to son. The *unfeigned faith* that dwelt first in Lois and Eunice and now in Timothy is the word kept in the heart and passed down through the generations of Yashar''el (Israel), the household-discipleship of the Torah bearing its fruit in the apostle''s beloved son.',
       sv.verse_id, ev.verse_id, 'free', 8553
  FROM _s236_t236c1_lookup sv, _s236_t236c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=1 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-1-the-spirit-of-power-and-love-not-of-fear-isaiah-41',
       E'The spirit of power and love, not of fear (Isaiah 41, Joshua 1)',
       E'*For Elohim (God) hath not given us the spirit of fear; but of power, and of love, and of a sound mind* (2 Timothy 1:7); therefore *Be not thou therefore ashamed of the testimony of our Lord, nor of me his prisoner: but be thou partaker of the afflictions of the gospel according to the power of Elohim (God)* (2 Timothy 1:8). The charge against fear is Yahuah''s (LORD''s) own word to his servants. To Yashar''el (Israel) he said, *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness* (Isaiah 41:10); and to Joshua at the entering of the land, *Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* (Joshua 1:9). The Spirit Timothy is given is not of bondage but of power — Paul says it again to the Romans, *ye have not received the spirit of bondage again to fear; but ye have received the Spirit of adoption, whereby we cry, Abba, Father* (Romans 8:15). The courage that strengthened Joshua and upheld Yashar''el (Israel) with the right hand of righteousness is the courage to bear the gospel''s afflictions unashamed, for the same Elohim (God) is with his servant whithersoever he goes.',
       sv.verse_id, ev.verse_id, 'free', 8556
  FROM _s236_t236c1_lookup sv, _s236_t236c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-1-keep-the-good-deposit-the-form-of-sound-words-isaiah-8',
       E'Hold fast the form of sound words, keep the good deposit (Isaiah 8, Proverbs 4)',
       E'Paul charges Timothy twice over to guard what was handed him: *Hold fast the form of sound words, which thou hast heard of me, in faith and love which is in HaMashiach Yahusha (Christ Jesus)* (2 Timothy 1:13); *That good thing which was committed unto thee keep by the Ruach HaKodesh (Holy Spirit) which dwelleth in us* (2 Timothy 1:14). The deposit is the testimony and the law bound up and sealed for safekeeping, exactly as Isaiah charged: *Bind up the testimony, seal the law among my disciples* (Isaiah 8:16). The sound words are the sealed teaching, kept among the disciples and passed on undefiled. And to hold fast is the wisdom-charge of the Torah''s own house: *Take fast hold of instruction; let her not go: keep her; for she is thy life* (Proverbs 4:13). The deposit is no mere doctrine to be improved upon but life itself, the form of sound words guarded by the indwelling Spirit and held fast to the end — the same testimony, the same law, kept among the disciples of Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'free', 8559
  FROM _s236_t236c1_lookup sv, _s236_t236c1_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=1 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-timothy-1-saved-and-called-by-grace-not-works-death-abolished-deuteronomy-7-isaiah-25
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 7:7 — *Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number... for ye were the fewest of all people* election never by merit; *not according to our works* (2 Timothy 1:9) excludes flesh-merit, not the Torah.'
  FROM cross_reference_threads t, cross_references x, _s236_t236c1_lookup sv, _s236_t236c1_lookup tv
 WHERE t.slug='2-timothy-1-saved-and-called-by-grace-not-works-death-abolished-deuteronomy-7-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:8 — *because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers* the calling grounded in covenant love and the sworn oath; *his own purpose and grace... before the world began* (2 Timothy 1:9).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c1_lookup sv, _s236_t236c1_lookup tv
 WHERE t.slug='2-timothy-1-saved-and-called-by-grace-not-works-death-abolished-deuteronomy-7-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 25:8 — *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces* the conquest of the grave; *hath abolished death* (2 Timothy 1:10) is death swallowed up, not the law abolished.'
  FROM cross_reference_threads t, cross_references x, _s236_t236c1_lookup sv, _s236_t236c1_lookup tv
 WHERE t.slug='2-timothy-1-saved-and-called-by-grace-not-works-death-abolished-deuteronomy-7-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hosea 13:14 — *I will ransom them from the power of the grave; I will redeem them from death: O death, I will be thy plagues; O grave, I will be thy destruction* Yahuah''s (LORD''s) vow against death; the death abolished (2 Timothy 1:10) is the grave Hosea named.'
  FROM cross_reference_threads t, cross_references x, _s236_t236c1_lookup sv, _s236_t236c1_lookup tv
 WHERE t.slug='2-timothy-1-saved-and-called-by-grace-not-works-death-abolished-deuteronomy-7-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=13 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 2:23 — *For Yahuah (God) created man to be immortal, and made him to be an image of his own eternity* man made for the immortality now brought to light; the grace given before the world began (2 Timothy 1:9) answers the eternity-image man was formed to bear.'
  FROM cross_reference_threads t, cross_references x, _s236_t236c1_lookup sv, _s236_t236c1_lookup tv
 WHERE t.slug='2-timothy-1-saved-and-called-by-grace-not-works-death-abolished-deuteronomy-7-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Wisdom of Solomon 3:4 — *For though they be punished in the sight of men, yet is their hope full of immortality* the righteous'' hope; the immortality brought to light (2 Timothy 1:10) is the hope the righteous held.'
  FROM cross_reference_threads t, cross_references x, _s236_t236c1_lookup sv, _s236_t236c1_lookup tv
 WHERE t.slug='2-timothy-1-saved-and-called-by-grace-not-works-death-abolished-deuteronomy-7-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'1 Corinthians 15:54 — *then shall be brought to pass the saying that is written, Death is swallowed up in victory* Isaiah fulfilled in resurrection; the same death abolished (2 Timothy 1:10), the mortal putting on immortality.'
  FROM cross_reference_threads t, cross_references x, _s236_t236c1_lookup sv, _s236_t236c1_lookup tv
 WHERE t.slug='2-timothy-1-saved-and-called-by-grace-not-works-death-abolished-deuteronomy-7-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=54
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Titus 1:2 — *In hope of eternal life, which Elohim (God), that cannot lie, promised before the world began* one before-the-world purpose; the grace *given us in HaMashiach Yahusha (Christ Jesus) before the world began* (2 Timothy 1:9).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c1_lookup sv, _s236_t236c1_lookup tv
 WHERE t.slug='2-timothy-1-saved-and-called-by-grace-not-works-death-abolished-deuteronomy-7-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='titus' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Ephesians 1:4 — *According as he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him in love* election unto holiness, not works; the holy calling *not according to our works* (2 Timothy 1:9).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c1_lookup sv, _s236_t236c1_lookup tv
 WHERE t.slug='2-timothy-1-saved-and-called-by-grace-not-works-death-abolished-deuteronomy-7-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-timothy-1-the-unfeigned-faith-of-lois-and-eunice-taught-from-a-child-deuteronomy-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:6 — *And these words, which I command thee this day, shall be in thine heart* the word first in the heart before it is handed down; the *unfeigned faith* that dwelt first in Lois and Eunice (2 Timothy 1:5).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c1_lookup sv, _s236_t236c1_lookup tv
 WHERE t.slug='2-timothy-1-the-unfeigned-faith-of-lois-and-eunice-taught-from-a-child-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:7 — *And thou shalt teach them diligently unto thy children... when thou sittest in thine house* the Shema''s charge to teach the children; so Timothy knew the faith from a child (2 Timothy 1:5; cf. 3:15).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c1_lookup sv, _s236_t236c1_lookup tv
 WHERE t.slug='2-timothy-1-the-unfeigned-faith-of-lois-and-eunice-taught-from-a-child-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 4:9 — *but teach them thy sons, and thy sons'' sons* the three-generation charge; grandmother Lois to mother Eunice to Timothy (2 Timothy 1:5).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c1_lookup sv, _s236_t236c1_lookup tv
 WHERE t.slug='2-timothy-1-the-unfeigned-faith-of-lois-and-eunice-taught-from-a-child-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-timothy-1-the-spirit-of-power-and-love-not-of-fear-isaiah-41
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 41:10 — *Fear thou not... I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness* Yahuah''s (LORD''s) word against fear; *not the spirit of fear; but of power* (2 Timothy 1:7).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c1_lookup sv, _s236_t236c1_lookup tv
 WHERE t.slug='2-timothy-1-the-spirit-of-power-and-love-not-of-fear-isaiah-41'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 1:9 — *Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee* the courage to bear the gospel''s afflictions unashamed (2 Timothy 1:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c1_lookup sv, _s236_t236c1_lookup tv
 WHERE t.slug='2-timothy-1-the-spirit-of-power-and-love-not-of-fear-isaiah-41'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:15 — *ye have not received the spirit of bondage again to fear; but ye have received the Spirit of adoption, whereby we cry, Abba, Father* the Spirit of sonship, not fear; the spirit of power and love (2 Timothy 1:7).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c1_lookup sv, _s236_t236c1_lookup tv
 WHERE t.slug='2-timothy-1-the-spirit-of-power-and-love-not-of-fear-isaiah-41'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-timothy-1-keep-the-good-deposit-the-form-of-sound-words-isaiah-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 8:16 — *Bind up the testimony, seal the law among my disciples* the deposit guarded and sealed; *That good thing which was committed unto thee keep* (2 Timothy 1:14).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c1_lookup sv, _s236_t236c1_lookup tv
 WHERE t.slug='2-timothy-1-keep-the-good-deposit-the-form-of-sound-words-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 4:13 — *Take fast hold of instruction; let her not go: keep her; for she is thy life* the wisdom-charge to hold fast; *Hold fast the form of sound words* (2 Timothy 1:13).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c1_lookup sv, _s236_t236c1_lookup tv
 WHERE t.slug='2-timothy-1-keep-the-good-deposit-the-form-of-sound-words-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
