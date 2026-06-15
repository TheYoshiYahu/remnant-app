-- =====================================================================
-- Session 236 — 2 Timothy FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session236_2timothy_cross_references.sql
-- =====================================================================

\echo 'session236 — 2 Timothy cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_2timothy_02.sql (S236 2 Timothy 2) -----
-- =====================================================================
-- S236 minion — 2 TIMOTHY 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 TIMOTHY 2 (26 verses) — THE CHARGE TO ENDURE: be a good soldier, a
--   workman rightly dividing the word of truth, the foundation standeth sure.
-- Tag: t236c2 (temp view _s236_t236c2_lookup).
-- Sort band: floor 8575, 25-wide (8575, 8576, 8577 used; under 8600).
-- Source is ALWAYS the canon 2 Timothy verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (2 Timothy = the apostle's last words, the charge to guard the deposit and
-- endure; one olive tree, no replacement theology, no law-vs-grace antithesis). Chapter 2 hands
-- Timothy the soldier's, athlete's, and husbandman's labours, then plants the two load-bearing
-- centers: ★★ 2:8 *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was
-- raised from the dead* — the Father raised the Son, the Formed, the promised seed of David per
-- 2 Samuel 7:12 and the Branch of Isaiah 11:1; keep the Father the One who raises and the Son the
-- Formed seed of David, no co-equal-persons grammar. And ★★ 2:19 *the foundation of Elohim (God)
-- standeth sure, having this seal, Yahuah (Lord) knoweth them that are his. And, Let every one
-- that nameth the name of Messiah (Christ) depart from iniquity* — the double seal re-speaks
-- Numbers 16:5 (*Yahuah will shew who are his, and who is holy*) and Isaiah 52:11 (*depart ye,
-- depart ye... be ye clean*), with Yahuah's own knowing of his own confirmed in Nahum 1:7 and
-- Psalm 1:6. The faithful saying of 2:11-13 (*if we be dead with him, we shall also live with
-- him... if we suffer, we shall also reign with him*) is the endurance promise the Hebrew library
-- already held out to the righteous (Wisdom 3:5-8, 5:15-16) and which Paul speaks again in
-- Romans 6:8.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-7   be strong, commit to faithful men, endure as a soldier/athlete/husbandman
--           Tanakh: none warranted (the soldier/athlete/husbandman figures are Paul's own;
--                   no single load-bearing Tanakh root — drop verbal coincidence)
--           Extras: none warranted   NT: none warranted (carried in prose; reign-reward woven at 2:11-13)
--   v.8-10  the risen seed of David, the word of Elohim not bound, the elect's salvation
--           Tanakh: 2 Samuel 7:12 (I will set up thy seed after thee), Isaiah 11:1 (a rod out of
--                   the stem of Jesse), Isaiah 11:10 (a root of Jesse... an ensign of the people)
--           Extras: none warranted
--           NT: Acts 2:30 (of the fruit of his loins... raise up Messiah to sit on his throne),
--               Romans 1:3-4 (made of the seed of David... by the resurrection from the dead)
--   v.11-13 the faithful saying: dead with him -> live with him; suffer -> reign with him
--           Tanakh: none warranted (the die/live/reign promise carried by extras + NT)
--           Extras: Wisdom of Solomon 3:5-8 (a little chastised, greatly rewarded... they shall
--                   judge the nations, and have dominion), Wisdom of Solomon 5:15-16 (the righteous
--                   live for evermore... a glorious kingdom, and a beautiful crown)
--           NT: Romans 6:8 (if we be dead with Messiah... we shall also live with him)
--   v.14-18 strive not about words; rightly dividing the word of truth; resurrection-past error
--           Tanakh: none warranted (the workman/rightly-dividing charge is pastoral, no single root)
--           Extras: none warranted   NT: none warranted
--   v.19    ★★ the foundation standeth sure: Yahuah knoweth them that are his / depart from iniquity
--           Tanakh: Numbers 16:5 (Yahuah will shew who are his, and who is holy), Psalm 1:6
--                   (Yahuah knoweth the way of the righteous), Nahum 1:7 (he knoweth them that
--                   trust in him), Isaiah 52:11 (depart ye, depart ye... be ye clean)
--           Extras: none warranted   NT: none warranted (the seal is the Tanakh double-root)
--   v.20-26 vessels to honour, flee youthful lusts, the servant of Yahuah, the snare of the devil
--           Tanakh: none warranted (vessel-imagery echoes the potter but is not load-bearing here)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   8575 2-timothy-2-the-risen-seed-of-david-raised-from-the-dead-2-samuel-7-isaiah-11   (Tanakh + NT)
--   8576 2-timothy-2-if-we-be-dead-with-him-we-shall-live-and-reign-wisdom-3-5-romans-6  (Extras + NT)
--   8577 2-timothy-2-the-foundation-standeth-sure-yahuah-knoweth-them-that-are-his-numbers-16  (Tanakh)  [BLESSING]
-- =====================================================================

CREATE TEMP VIEW _s236_t236c2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-timothy-2-the-risen-seed-of-david-raised-from-the-dead-2-samuel-7-isaiah-11
  ('canon', '2-timothy', 2, 8, 'canon', '2-samuel', 7, 12, 'free', E'*And when thy days be fulfilled, and thou shalt sleep with thy fathers, I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom.* (2 Samuel 7:12). Yahuah (LORD) swore to David a seed out of his own bowels whose kingdom would be established for ever. Paul charges Timothy to *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel* (2 Timothy 2:8) — the very seed the oath named, raised by the Father from the dead to take the throne. Keep the order the texts keep: the Father is the One who set up the seed and raised him; the Son is the Formed, the seed of David, the heir of the established kingdom.'),
  ('canon', '2-timothy', 2, 8, 'canon', 'isaiah', 11, 1, 'free', E'*And there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots:* (Isaiah 11:1). Isaiah named the seed of David as a Branch sprung from Jesse''s stem — the very seed Paul bids Timothy remember: *Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead* (2 Timothy 2:8). The Branch out of Jesse''s root is the risen One, of the seed of David, raised by the Father; the rod from the stem is no felled and forgotten tree but the living heir of the Davidic promise.'),
  ('canon', '2-timothy', 2, 8, 'canon', 'isaiah', 11, 10, 'free', E'*And in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek: and his rest shall be glorious.* (Isaiah 11:10). The *root of Jesse* stands as an ensign to which the nations gather — the seed of David lifted up. Paul''s gospel rests on this risen root: *Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel* (2 Timothy 2:8). The ensign to which the Gentiles seek is the raised seed of David; the gathering of the nations is the gathering to him, not to a new people but to the root of Jesse himself.'),
  ('canon', '2-timothy', 2, 8, 'canon', 'acts', 2, 30, 'free', E'*Therefore being a prophet, and knowing that Elohim (God) had sworn with an oath to him, that of the fruit of his loins, according to the flesh, he would raise up Messiah (Christ) to sit on his throne;* (Acts 2:30). Peter reads the Davidic oath exactly as Paul does: Elohim (God) *sworn with an oath* that *of the fruit of his loins... he would raise up Messiah (Christ) to sit on his throne* — the seed of David raised to reign. Paul says the same: *Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel* (2 Timothy 2:8). Elohim (God) the Father raises the seed; the Son raised is the Formed who sits on David''s throne.'),
  ('canon', '2-timothy', 2, 8, 'canon', 'romans', 1, 4, 'free', E'*And declared to be the Son of Elohim (God) with power, according to the spirit of holiness, by the resurrection from the dead:* (Romans 1:4). Paul opens Romans with the same two-fold gospel he hands Timothy here: the One *made of the seed of David according to the flesh* (Romans 1:3) and *declared to be the Son of Elohim (God) with power... by the resurrection from the dead* (Romans 1:4). It is the very confession of 2 Timothy 2:8 — *of the seed of David was raised from the dead.* The Father raised the Son and so declared him; the seed of David and the risen Son are one Formed person, raised, not self-raising.')
,
  -- thread: 2-timothy-2-if-we-be-dead-with-him-we-shall-live-and-reign-wisdom-3-5-romans-6
  ('canon', '2-timothy', 2, 11, 'canon', 'romans', 6, 8, 'free', E'*Now if we be dead with Messiah (Christ), we believe that we shall also live with him:* (Romans 6:8). Paul speaks elsewhere the very faithful saying he cites to Timothy: *It is a faithful saying: For if we be dead with him, we shall also live with him* (2 Timothy 2:11). To die with the Messiah is to be raised with him; the death is not loss but the pledge of the shared life. The same gospel of the risen seed of David (2:8) is the ground of the believer''s own resurrection hope — dead with him, then alive with him.'),
  ('canon', '2-timothy', 2, 12, 'apocrypha', 'the-wisdom-of-solomon', 3, 5, 'extras', E'*And having been a little chastised, they shall be greatly rewarded: for Yahuah (God) proved them, and found them worthy for himself.* (Wisdom of Solomon 3:5). The Hebrew library already held the endurance-and-reward promise Paul speaks: *If we suffer, we shall also reign with him* (2 Timothy 2:12). The righteous *a little chastised* are *greatly rewarded* — the suffering is the proving, and the reward is to share the reign. The light affliction of the soldier of Yahusha HaMashiach (Jesus Christ) is the door to the kingdom, not a sign of abandonment.'),
  ('canon', '2-timothy', 2, 12, 'apocrypha', 'the-wisdom-of-solomon', 3, 8, 'extras', E'*They shall judge the nations, and have dominion over the people, and their Elohim (God) shall reign for ever.* (Wisdom of Solomon 3:8). The righteous who were chastised and proved are given dominion: *they shall judge the nations, and have dominion over the people.* This is the reign Paul promises the enduring: *if we suffer, we shall also reign with him* (2 Timothy 2:12). The dominion of the righteous is not their own but a sharing in the reign of the One whose *Elohim (God) shall reign for ever* — to reign with him is to be where he is.'),
  ('canon', '2-timothy', 2, 12, 'apocrypha', 'the-wisdom-of-solomon', 5, 16, 'extras', E'*Therefore shall they receive a glorious kingdom, and a beautiful crown from the hand of Yahuah (God): for with his right hand shall he cover them, and with his arm shall he protect them.* (Wisdom of Solomon 5:16). The library names the reward of the enduring righteous: *a glorious kingdom, and a beautiful crown from the hand of Yahuah (God).* It is the same crown and reign Paul sets before Timothy — *if we suffer, we shall also reign with him* (2 Timothy 2:12) — and the warning that follows, *if we deny him, he also will deny us* (2 Timothy 2:12), guards the crown: it is from the hand of Yahuah (God), kept for those who endure.')
,
  -- thread: 2-timothy-2-the-foundation-standeth-sure-yahuah-knoweth-them-that-are-his-numbers-16  [BLESSING]
  ('canon', '2-timothy', 2, 19, 'canon', 'numbers', 16, 5, 'free', E'*And he spake unto Korah and unto all his company, saying, Even to morrow Yahuah (LORD) will shew who are his, and who is holy; and will cause him to come near unto him: even him whom he hath chosen will he cause to come near unto him.* (Numbers 16:5). When Korah''s company rose against Moses, the answer was that Yahuah (LORD) himself would *shew who are his, and who is holy.* Paul stamps that very seal on the foundation: *the foundation of Elohim (God) standeth sure, having this seal, Yahuah (Lord) knoweth them that are his* (2 Timothy 2:19). The first half of the seal is Numbers 16:5 spoken again — against every pretender and false teacher, Yahuah (Lord) knows and shews who are truly his.'),
  ('canon', '2-timothy', 2, 19, 'canon', 'isaiah', 52, 11, 'free', E'*Depart ye, depart ye, go ye out from thence, touch no unclean thing; go ye out of the midst of her; be ye clean, that bear the vessels of Yahuah (LORD).* (Isaiah 52:11). The second half of the seal is Isaiah''s call to the bearers of the vessels: *Depart ye, depart ye... touch no unclean thing... be ye clean.* Paul writes it as the answering side of the seal: *Let every one that nameth the name of Messiah (Christ) depart from iniquity* (2 Timothy 2:19). Yahuah (Lord) knows his own, and his own depart from iniquity — the two halves of the one sure seal: his knowing, and their cleanness; election and holiness held together, never set against each other.'),
  ('canon', '2-timothy', 2, 19, 'canon', 'psalms', 1, 6, 'free', E'*For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* (Psalm 1:6). The first psalm rests on the same knowing Paul calls the seal: *Yahuah (LORD) knoweth the way of the righteous.* So *the foundation of Elohim (God) standeth sure, having this seal, Yahuah (Lord) knoweth them that are his* (2 Timothy 2:19). The knowing of Yahuah (Lord) is not bare information but the keeping of his own; the way he knows endures, and the way he does not know perishes — the sure foundation against which no resurrection-denying word can prevail.'),
  ('canon', '2-timothy', 2, 19, 'canon', 'nahum', 1, 7, 'free', E'*Yahuah (LORD) is good, a strong hold in the day of trouble; and he knoweth them that trust in him.* (Nahum 1:7). Nahum joins the knowing of Yahuah (LORD) to the security of his own: *he knoweth them that trust in him.* This is the comfort of the seal Paul stamps on the foundation: *Yahuah (Lord) knoweth them that are his* (2 Timothy 2:19). In the day of trouble, when the word of some is overthrown, the foundation stands because Yahuah (Lord) is the strong hold who knows his own and keeps them.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s236_t236c2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s236_t236c2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-2-the-risen-seed-of-david-raised-from-the-dead-2-samuel-7-isaiah-11',
       E'The risen seed of David, raised from the dead (2 Samuel 7, Isaiah 11)',
       E'Paul hands Timothy the heart of his gospel in a single charge: *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel* (2 Timothy 2:8). Two ancient words stand behind it. First the oath to David: *I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom* (2 Samuel 7:12) — Yahuah (LORD) himself promising a seed out of David''s own body whose throne would stand. Then the prophet''s naming of that seed: *there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1), and *in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek* (Isaiah 11:10). The seed of David is the Branch from Jesse''s stem, the root that becomes the ensign of the nations. The apostles read these texts as one: Peter declared that Elohim (God) *had sworn with an oath... that of the fruit of his loins, according to the flesh, he would raise up Messiah (Christ) to sit on his throne* (Acts 2:30), and Paul opens Romans with the same two-fold confession — *made of the seed of David according to the flesh; And declared to be the Son of Elohim (God) with power, according to the spirit of holiness, by the resurrection from the dead* (Romans 1:3-4). Keep the order the whole library keeps: the Father is the One who set up the seed, swore the oath, and raised him from the dead; the Son is the Formed, the seed of David, the Branch of Jesse raised to the throne. He does not raise himself; he is raised — and being raised, declared the Son of Elohim (God) with power. The risen seed of David is the unbroken Davidic promise come to its appointed heir, the gospel for which Paul suffers bonds while *the word of Elohim (God) is not bound* (2 Timothy 2:9).',
       sv.verse_id, ev.verse_id, 'free', 8575
  FROM _s236_t236c2_lookup sv, _s236_t236c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-2-if-we-be-dead-with-him-we-shall-live-and-reign-wisdom-3-5-romans-6',
       E'If we be dead with him, we shall live and reign with him (Wisdom of Solomon 3, 5; Romans 6)',
       E'Paul seals his charge to endure with a faithful saying: *It is a faithful saying: For if we be dead with him, we shall also live with him: If we suffer, we shall also reign with him: if we deny him, he also will deny us: If we believe not, yet he abideth faithful: he can not deny himself* (2 Timothy 2:11-13). The promise that death-with-him is the door to life-with-him is no new thing; Paul speaks it again in Romans: *Now if we be dead with Messiah (Christ), we believe that we shall also live with him* (Romans 6:8) — the death the pledge of the resurrection. And the reign Paul holds out to the suffering, the Hebrew library already set before the righteous. *And having been a little chastised, they shall be greatly rewarded: for Yahuah (God) proved them, and found them worthy for himself* (Wisdom of Solomon 3:5); the proving issues in dominion — *They shall judge the nations, and have dominion over the people, and their Elohim (God) shall reign for ever* (Wisdom of Solomon 3:8). The same library names the reward as a crown: *Therefore shall they receive a glorious kingdom, and a beautiful crown from the hand of Yahuah (God): for with his right hand shall he cover them, and with his arm shall he protect them* (Wisdom of Solomon 5:16). This is the reign Paul promises — *if we suffer, we shall also reign with him* (2 Timothy 2:12) — and the warning that the crown is from the hand of Yahuah (God), kept for those who do not deny. The light chastening of the soldier is the proving; the kingdom and the crown are the reward; and the ground of it all is the faithfulness of the One who *abideth faithful: he can not deny himself* (2 Timothy 2:13).',
       sv.verse_id, ev.verse_id, 'extras', 8576
  FROM _s236_t236c2_lookup sv, _s236_t236c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-2-the-foundation-standeth-sure-yahuah-knoweth-them-that-are-his-numbers-16',
       E'The foundation standeth sure: Yahuah knoweth them that are his, and depart from iniquity (Numbers 16, Isaiah 52)',
       E'Against the false teachers whose word *will eat as doth a canker* and who say *the resurrection is past already* (2 Timothy 2:17-18), Paul plants an unshakeable rock: *Nevertheless the foundation of Elohim (God) standeth sure, having this seal, Yahuah (Lord) knoweth them that are his. And, Let every one that nameth the name of Messiah (Christ) depart from iniquity* (2 Timothy 2:19). The seal is double, and both halves are the Tanakh spoken again. The first half is the answer to Korah''s rebellion: when men rose against Moses, Moses said, *Even to morrow Yahuah (LORD) will shew who are his, and who is holy; and will cause him to come near unto him: even him whom he hath chosen will he cause to come near unto him* (Numbers 16:5). Yahuah (Lord) himself shews who are his — no usurper, no resurrection-denier, can counterfeit it. That knowing runs through the Writings and the Prophets: *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6); *Yahuah (LORD) is good, a strong hold in the day of trouble; and he knoweth them that trust in him* (Nahum 1:7). His knowing is not bare information but the keeping of his own in the day of trouble. The second half of the seal is Isaiah''s call to the bearers of the holy vessels: *Depart ye, depart ye, go ye out from thence, touch no unclean thing; go ye out of the midst of her; be ye clean, that bear the vessels of Yahuah (LORD)* (Isaiah 52:11). Paul writes it as the answering side: *Let every one that nameth the name of Messiah (Christ) depart from iniquity.* The two halves are one seal and must never be split: Yahuah (Lord) knows his own, and his own depart from iniquity — election and holiness, his knowing and their cleanness, held together. The foundation stands sure not because the teachers are silenced but because Yahuah (Lord) knows whom he has chosen and calls them to be clean, as he has from Sinai to the prophets to this last charge.',
       sv.verse_id, ev.verse_id, 'free', 8577
  FROM _s236_t236c2_lookup sv, _s236_t236c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=2 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-timothy-2-the-risen-seed-of-david-raised-from-the-dead-2-samuel-7-isaiah-11
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Samuel 7:12 — *I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom* the Davidic oath; the seed Paul bids Timothy remember, *of the seed of David was raised from the dead* (2 Timothy 2:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-the-risen-seed-of-david-raised-from-the-dead-2-samuel-7-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:1 — *there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* the seed of David named as the Branch; the risen One *of the seed of David* (2 Timothy 2:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-the-risen-seed-of-david-raised-from-the-dead-2-samuel-7-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:10 — *a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek* the seed of David lifted as the ensign of the nations; the risen root of Paul''s gospel (2 Timothy 2:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-the-risen-seed-of-david-raised-from-the-dead-2-samuel-7-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 2:30 — *of the fruit of his loins, according to the flesh, he would raise up Messiah (Christ) to sit on his throne* Peter reading the Davidic oath as Paul does; Elohim (God) the Father raises the seed (2 Timothy 2:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-the-risen-seed-of-david-raised-from-the-dead-2-samuel-7-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 1:4 — *declared to be the Son of Elohim (God) with power... by the resurrection from the dead* the same two-fold gospel (seed of David / raised); the Father raises and so declares the Son (2 Timothy 2:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-the-risen-seed-of-david-raised-from-the-dead-2-samuel-7-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-timothy-2-if-we-be-dead-with-him-we-shall-live-and-reign-wisdom-3-5-romans-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 6:8 — *if we be dead with Messiah (Christ)... we shall also live with him* the same faithful saying spoken again; death-with-him the pledge of life-with-him (2 Timothy 2:11).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-if-we-be-dead-with-him-we-shall-live-and-reign-wisdom-3-5-romans-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 3:5 — *a little chastised, they shall be greatly rewarded: for Yahuah (God) proved them* the suffering as proving, the door to reward; *if we suffer, we shall also reign with him* (2 Timothy 2:12).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-if-we-be-dead-with-him-we-shall-live-and-reign-wisdom-3-5-romans-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 3:8 — *They shall judge the nations, and have dominion over the people* the dominion of the proved righteous; the reign Paul promises the enduring (2 Timothy 2:12).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-if-we-be-dead-with-him-we-shall-live-and-reign-wisdom-3-5-romans-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 5:16 — *a glorious kingdom, and a beautiful crown from the hand of Yahuah (God)* the crown and kingdom of the enduring righteous; *if we suffer, we shall also reign with him* (2 Timothy 2:12), the crown guarded by *if we deny him, he also will deny us* (2 Timothy 2:12).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-if-we-be-dead-with-him-we-shall-live-and-reign-wisdom-3-5-romans-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-timothy-2-the-foundation-standeth-sure-yahuah-knoweth-them-that-are-his-numbers-16
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 16:5 — *Yahuah (LORD) will shew who are his, and who is holy* the answer to Korah''s rebellion; the first half of the seal, *Yahuah (Lord) knoweth them that are his* (2 Timothy 2:19).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-the-foundation-standeth-sure-yahuah-knoweth-them-that-are-his-numbers-16'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 52:11 — *Depart ye, depart ye... touch no unclean thing... be ye clean, that bear the vessels of Yahuah (LORD)* the second half of the seal; *Let every one that nameth the name of Messiah (Christ) depart from iniquity* (2 Timothy 2:19).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-the-foundation-standeth-sure-yahuah-knoweth-them-that-are-his-numbers-16'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 1:6 — *Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* the knowing that keeps his own; the sure seal of the foundation (2 Timothy 2:19).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-the-foundation-standeth-sure-yahuah-knoweth-them-that-are-his-numbers-16'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Nahum 1:7 — *Yahuah (LORD) is good, a strong hold in the day of trouble; and he knoweth them that trust in him* the knowing joined to keeping; the foundation stands because Yahuah (Lord) knows his own (2 Timothy 2:19).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-the-foundation-standeth-sure-yahuah-knoweth-them-that-are-his-numbers-16'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='nahum' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2timothy_03.sql (S236 2 Timothy 3) -----
-- =====================================================================
-- S236 minion — 2 TIMOTHY 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 TIMOTHY 3 (17 verses) — the perilous last days, Jannes and Jambres
--          the deceivers, and ★★ THE HOLY SCRIPTURES known from a child = the TANAKH,
--          GIVEN BY INSPIRATION and profitable (HIGHEST watchpoint / BLESSING chapter).
-- Tag: t236c3 (temp view _s236_t236c3_lookup).
-- Sort band: floor 8600, 25-wide (8600, 8601, 8602 used; under 8625).
-- Source is ALWAYS the canon 2 Timothy verse; targets span Tanakh + extra-canonical, woven.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (2 Timothy = the charge to ENDURE; the apostle's last words. Ch3 sets the
-- perilous last days and the Jannes-and-Jambres deceivers AGAINST the inspired Tanakh that
-- Timothy knew from a child. ★★ The *holy scriptures* of 3:15 and the *all scripture* of 3:16
-- are THE TANAKH — the Law, the Prophets, and the Writings, the ONLY scripture then in
-- existence. Paul declares it *given by inspiration of Elohim (God)* and *profitable for
-- doctrine, for reproof, for correction, for instruction in righteousness* — the Tanakh is
-- AFFIRMED as the living, profitable word, the standard for the man of Elohim (God), NOT
-- superseded by a later NT. The Tanakh makes its own claim: *the law of Yahuah (LORD) is
-- perfect* (Psalm 19:7), *for ever, O Yahuah (LORD), thy word is settled in heaven*
-- (Psalm 119:89), *every word of Elohim (God) is pure* (Proverbs 30:5). Do NOT read 3:16 as
-- proof the NT replaced/completes the OT — the scripture in view IS the Tanakh, declared
-- inspired and profitable. And 3:8 Jannes and Jambres = the magicians who withstood Moses
-- before Pharaoh (Exodus 7), named in the Hebrew library — Jasher names them by name.
-- No replacement theology, no law-vs-grace antithesis. The inspired word belongs to the one
-- olive tree.)
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-7   in the last days perilous times shall come; ever learning, never able to come
--           to the knowledge of the truth
--           Tanakh: none warranted (the moral catalogue vv.2-5 is a list, not a quotation;
--                   the load-bearing last-days witness here is the extras layer)
--           Extras: 2 Esdras 5:1-2 (the days shall come... the way of truth shall be hidden,
--                   and the land shall be barren of faith... iniquity shall be increased)
--           NT: none warranted (no specific NT verse re-spoken; carried in prose)
--   v.8-9   as Jannes and Jambres withstood Moses, so do these also resist the truth
--           Tanakh: Exodus 7:11 (the magicians of Egypt... did in like manner with their
--                   enchantments), Exodus 7:22 (the magicians of Egypt did so with their
--                   enchantments)
--           Extras: Jasher 79:27 (Pharaoh sent for Balaam the magician and to Jannes and
--                   Jambres his sons... and all the magicians) — names them by name
--           NT: none warranted
--   v.10-13 my doctrine, persecutions which came unto me at Antioch, Iconium, Lystra; all
--           that will live godly shall suffer persecution
--           Tanakh: none warranted (Paul's own biography; no Tanakh verse re-spoken)
--           Extras: none warranted   NT: none warranted
--   v.14-17 ★★ from a child thou hast known the holy scriptures... All scripture is given by
--           inspiration of Elohim (God), and is profitable... that the man of Elohim be perfect
--           Tanakh: Psalm 19:7 (the law of Yahuah is perfect... making wise the simple),
--                   Psalm 119:89 (for ever, O Yahuah, thy word is settled in heaven),
--                   Proverbs 30:5 (every word of Elohim is pure)
--           Extras: 2 Esdras 14:22 (send the Ruach HaKodesh... I shall write all... which were
--                   written in your law, that men may find your path) — scripture by inspiration,
--                   anchored in the law
--           NT: none warranted (the scripture in view IS the Tanakh — the guard, not an NT echo)
--
-- THREADS (slug -> target libraries):
--   8600 2-timothy-3-in-the-last-days-perilous-times-shall-come-the-way-of-truth-hidden-2-esdras-5  (Extras)
--   8601 2-timothy-3-jannes-and-jambres-withstood-moses-the-magicians-of-egypt-exodus-7-jasher      (Tanakh + Extras)
--   8602 2-timothy-3-all-scripture-given-by-inspiration-the-holy-scriptures-are-the-tanakh-psalm-19 (Tanakh + Extras)  [BLESSING]
-- =====================================================================

CREATE TEMP VIEW _s236_t236c3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-timothy-3-in-the-last-days-perilous-times-shall-come-the-way-of-truth-hidden-2-esdras-5
  ('canon', '2-timothy', 3, 1, 'apocrypha', '2-esdras', 5, 1, 'extras', E'*Nevertheless as concerning the tokens, behold, the days shall come, that they which dwell upon earth shall be taken in a great number, and the way of truth shall be hidden, and the land shall be barren of faith.* (2 Esdras 5:1). Paul warns *This know also, that in the last days perilous times shall come* (2 Timothy 3:1). The Hebrew library had already set the shape of those days: the *way of truth shall be hidden, and the land shall be barren of faith.* It is the same hour Paul describes — a people *ever learning, and never able to come to the knowledge of the truth* (2 Timothy 3:7), the truth hidden and faith grown scarce. The perilous times are not a new prophecy but the last-days reckoning the restored library long foretold.'),
  ('canon', '2-timothy', 3, 2, 'apocrypha', '2-esdras', 5, 2, 'extras', E'*But iniquity shall be increased above that which now you see, or that you have heard long ago.* (2 Esdras 5:2). The catalogue of the last days follows: *For men shall be lovers of their own selves, covetous, boasters, proud, blasphemers, disobedient to parents, unthankful, unholy* (2 Timothy 3:2). The library said *iniquity shall be increased above that which now you see* — and Paul lists the swelling of that iniquity, men who multiply in self-love and lawlessness as the truth is hidden. The increase of iniquity foretold is the very flood of corruption Timothy is charged to turn away from (*from such turn away,* 2 Timothy 3:5).')
  ,
  -- thread: 2-timothy-3-jannes-and-jambres-withstood-moses-the-magicians-of-egypt-exodus-7-jasher
  ('canon', '2-timothy', 3, 8, 'canon', 'exodus', 7, 11, 'free', E'*Then Pharaoh also called the wise men and the sorcerers: now the magicians of Egypt, they also did in like manner with their enchantments.* (Exodus 7:11). When Paul writes *Now as Jannes and Jambres withstood Moses, so do these also resist the truth: men of corrupt minds, reprobate concerning the faith* (2 Timothy 3:8), this is the scene he names: the *magicians of Egypt* who matched the sign of Moses *with their enchantments,* counterfeiting the rod-and-serpent before Pharaoh. The last-days deceivers are cast in the type of Pharaoh''s magicians — a *form of godliness* aping the power, resisting the truth as the sorcerers resisted Moses.'),
  ('canon', '2-timothy', 3, 8, 'canon', 'exodus', 7, 22, 'free', E'*And the magicians of Egypt did so with their enchantments: and Pharaoh''s heart was hardened, neither did he hearken unto them; as Yahuah (LORD) had said.* (Exodus 7:22). The magicians could copy the wonder for a time, *but they shall proceed no further: for their folly shall be manifest unto all men, as theirs also was* (2 Timothy 3:9). Exodus shows the end of their craft: their enchantments only hardened Pharaoh''s heart and could not stand, for at the plague of lice *the magicians did so... but they could not* (Exodus 8:18), and their folly was made manifest. So Paul promises the resisters of the truth the same exposure the magicians of Egypt met — their counterfeit shall not prevail.'),
  ('canon', '2-timothy', 3, 8, 'jasher', 'jasher', 79, 27, 'extras', E'*And when they had gone Pharaoh sent for Balaam the magician and to Jannes and Jambres his sons, and to all the magicians and conjurors and counsellors which belonged to the king, and they all came and sat before the king.* (Jasher 79:27). The Hebrew library names them — *Jannes and Jambres,* the sons of Balaam the magician, summoned by Pharaoh against Moses and Aaron when *Yahuah Elohim (Lord God) of the Hebrews* sent them to demand *Send forth my people that they may serve me* (Jasher 79:25). Paul names the very pair: *as Jannes and Jambres withstood Moses, so do these also resist the truth* (2 Timothy 3:8). The witness Paul reaches for is preserved in the restored library, the named magicians who stood before the king to counterfeit the sign of the rod and resist the word of Yahuah (LORD) — the type of the last-days deceivers.')
  ,
  -- thread: 2-timothy-3-all-scripture-given-by-inspiration-the-holy-scriptures-are-the-tanakh-psalm-19  [BLESSING]
  ('canon', '2-timothy', 3, 15, 'canon', 'psalms', 19, 7, 'free', E'*The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* (Psalm 19:7). Paul says *from a child thou hast known the holy scriptures, which are able to make thee wise unto salvation* (2 Timothy 3:15) — and the *holy scriptures* Timothy knew from a child are the Tanakh, the only scripture that then existed. The Tanakh''s own testimony names what Paul affirms: *the law of Yahuah (LORD) is perfect... making wise the simple.* The word that makes the simple wise is the very word that makes Timothy *wise unto salvation* — the perfect law of Yahuah (LORD), not superseded but profitable, the standard for the man of Elohim (God).'),
  ('canon', '2-timothy', 3, 16, 'canon', 'psalms', 119, 89, 'free', E'*For ever, O Yahuah (LORD), thy word is settled in heaven.* (Psalm 119:89). Paul declares *All scripture is given by inspiration of Elohim (God), and is profitable for doctrine, for reproof, for correction, for instruction in righteousness* (2 Timothy 3:16) — and the scripture so given is the Tanakh, whose word is *settled in heaven* for ever. The inspired word is not a passing fixture to be replaced by a later book; it is the abiding word, settled and enduring, the same word Paul calls profitable for every correction. The settled word of Psalm 119 is the inspired and profitable scripture of 2 Timothy 3.'),
  ('canon', '2-timothy', 3, 16, 'canon', 'proverbs', 30, 5, 'free', E'*Every word of Elohim (God) is pure: he is a shield unto them that put their trust in him.* (Proverbs 30:5). When Paul writes *All scripture is given by inspiration of Elohim (God), and is profitable* (2 Timothy 3:16), the Tanakh has already said why: *every word of Elohim (God) is pure.* Each word breathed out by Elohim (God) is pure and a shield — exactly the scripture profitable *for doctrine, for reproof, for correction, for instruction in righteousness.* The purity Proverbs names is the inspiration Paul names; the scripture in view is the Tanakh, the pure word of Elohim (God), affirmed and not abolished.'),
  ('canon', '2-timothy', 3, 16, 'apocrypha', '2-esdras', 14, 22, 'extras', E'*But if I have found grace before you, send the Ruach HaKodesh (Holy Spirit) into me, and I shall write all that has been done in the world since the beginning, which were written in your law, that men may find your path, and that they which will live in the latter days may live.* (2 Esdras 14:22). Ezra prays for the *Ruach HaKodesh (Holy Spirit)* to write the scriptures *which were written in your law, that men may find your path* — and Elohim answers, *I shall light a candle of understanding in yours heart* (2 Esdras 14:25). This is scripture *given by inspiration of Elohim (God)* (2 Timothy 3:16), breathed out by the Spirit and anchored in the law, that men may find the path and live. The Hebrew library bears the same witness Paul affirms: the inspired word is the law, the Tanakh, given so the people may walk in the way unto salvation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s236_t236c3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s236_t236c3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-3-in-the-last-days-perilous-times-shall-come-the-way-of-truth-hidden-2-esdras-5',
       E'In the last days perilous times shall come, the way of truth hidden (2 Esdras 5)',
       E'Paul opens the chapter with a warning for Timothy and for all who come after: *This know also, that in the last days perilous times shall come* (2 Timothy 3:1), followed by the catalogue of swelling corruption — *men shall be lovers of their own selves, covetous, boasters, proud, blasphemers... Having a form of godliness, but denying the power thereof* (2 Timothy 3:2,5), a generation *ever learning, and never able to come to the knowledge of the truth* (2 Timothy 3:7). The Hebrew library had already set the shape of those days. *Behold, the days shall come, that they which dwell upon earth shall be taken in a great number, and the way of truth shall be hidden, and the land shall be barren of faith* (2 Esdras 5:1); *but iniquity shall be increased above that which now you see, or that you have heard long ago* (2 Esdras 5:2). The way of truth hidden, faith grown barren, iniquity increased — this is the very hour Paul names: a people who cannot come to the knowledge of the truth because the truth has been hidden from them, and a flood of lawlessness from which Timothy is charged to turn away (*from such turn away,* 2 Timothy 3:5). The perilous last days are not a new prophecy but the long-foretold reckoning of the restored library, the days of hidden truth and increased iniquity that Paul tells Timothy to know and to stand against.',
       sv.verse_id, ev.verse_id, 'extras', 8600
  FROM _s236_t236c3_lookup sv, _s236_t236c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=3 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-3-jannes-and-jambres-withstood-moses-the-magicians-of-egypt-exodus-7-jasher',
       E'Jannes and Jambres withstood Moses, the magicians of Egypt (Exodus 7, Jasher 79)',
       E'*Now as Jannes and Jambres withstood Moses, so do these also resist the truth: men of corrupt minds, reprobate concerning the faith. But they shall proceed no further: for their folly shall be manifest unto all men, as theirs also was* (2 Timothy 3:8-9). Paul reaches for a scene from the Exodus and a pair of names the Tanakh tells but does not name. The scene is the magicians'' contest before Pharaoh: *Then Pharaoh also called the wise men and the sorcerers: now the magicians of Egypt, they also did in like manner with their enchantments* (Exodus 7:11); *and the magicians of Egypt did so with their enchantments: and Pharaoh''s heart was hardened* (Exodus 7:22). They could counterfeit the rod-and-serpent and the first plagues for a season, but their craft came to its end — at the plague of lice *the magicians did so... but they could not* (Exodus 8:18), and their folly was manifest, just as Paul says the deceivers'' folly *shall be manifest unto all men, as theirs also was.* And the names Paul knows are preserved in the Hebrew library: *Pharaoh sent for Balaam the magician and to Jannes and Jambres his sons, and to all the magicians and conjurors and counsellors which belonged to the king* (Jasher 79:27), summoned against Moses and Aaron when *Yahuah Elohim (Lord God) of the Hebrews* demanded *Send forth my people that they may serve me* (Jasher 79:25). The named magicians who resisted the word of Yahuah (LORD) with their enchantments are Paul''s type of the last-days deceivers — a form of godliness aping the power, withstanding the truth, but bound to be exposed and to proceed no further.',
       sv.verse_id, ev.verse_id, 'extras', 8601
  FROM _s236_t236c3_lookup sv, _s236_t236c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-3-all-scripture-given-by-inspiration-the-holy-scriptures-are-the-tanakh-psalm-19',
       E'All scripture given by inspiration: the holy scriptures are the Tanakh (Psalm 19, Psalm 119, Proverbs 30)',
       E'This is the keystone of the chapter, and the framework must hold it exactly. *And that from a child thou hast known the holy scriptures, which are able to make thee wise unto salvation through faith which is in HaMashiach Yahusha (Christ Jesus). All scripture is given by inspiration of Elohim (God), and is profitable for doctrine, for reproof, for correction, for instruction in righteousness: That the man of Elohim (God) may be perfect, throughly furnished unto all good works* (2 Timothy 3:15-17). The *holy scriptures* Timothy knew *from a child* are the Tanakh — the Law, the Prophets, and the Writings — the only scripture that then existed; there was no New Testament for a child to learn. Paul declares this Tanakh *given by inspiration of Elohim (God)* and *profitable... for instruction in righteousness* — it is affirmed as the living, profitable, God-breathed word, the standard for the man of Elohim (God), NOT superseded by a later book. The Tanakh makes the same claim of itself that Paul makes of it. *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* (Psalm 19:7) — the word that makes the simple wise is the word that makes Timothy *wise unto salvation.* *For ever, O Yahuah (LORD), thy word is settled in heaven* (Psalm 119:89) — the inspired word is the abiding word, settled and enduring, not a passing fixture awaiting replacement. *Every word of Elohim (God) is pure: he is a shield unto them that put their trust in him* (Proverbs 30:5) — the purity Proverbs names is the inspiration Paul names. And the Hebrew library bears the same witness to scripture given by the Spirit and anchored in the law: Ezra prays *send the Ruach HaKodesh (Holy Spirit) into me, and I shall write all... which were written in your law, that men may find your path, and that they which will live in the latter days may live* (2 Esdras 14:22), and Elohim answers, *I shall light a candle of understanding in yours heart* (2 Esdras 14:25). The scripture given by inspiration, profitable, perfect, settled for ever, and pure is the Tanakh — the law of Yahuah (LORD) that makes wise unto salvation, affirmed by the apostle and not abolished. Hold this verse against every reading that would make it prove the word of Elohim (God) was replaced: Paul calls the Tanakh inspired and profitable, the furnishing of the man of Elohim (God) unto all good works.',
       sv.verse_id, ev.verse_id, 'extras', 8602
  FROM _s236_t236c3_lookup sv, _s236_t236c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-timothy-3-in-the-last-days-perilous-times-shall-come-the-way-of-truth-hidden-2-esdras-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 5:1 — *the days shall come... and the way of truth shall be hidden, and the land shall be barren of faith* the last-days shape behind *in the last days perilous times shall come* (2 Timothy 3:1); a people who cannot come to the knowledge of the truth (3:7).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c3_lookup sv, _s236_t236c3_lookup tv
 WHERE t.slug='2-timothy-3-in-the-last-days-perilous-times-shall-come-the-way-of-truth-hidden-2-esdras-5'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras 5:2 — *but iniquity shall be increased above that which now you see* the swelling of lawlessness Paul catalogues: *men shall be lovers of their own selves, covetous, boasters, proud* (2 Timothy 3:2); from such turn away (3:5).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c3_lookup sv, _s236_t236c3_lookup tv
 WHERE t.slug='2-timothy-3-in-the-last-days-perilous-times-shall-come-the-way-of-truth-hidden-2-esdras-5'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-timothy-3-jannes-and-jambres-withstood-moses-the-magicians-of-egypt-exodus-7-jasher
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 7:11 — *the magicians of Egypt, they also did in like manner with their enchantments* the scene Paul names: *as Jannes and Jambres withstood Moses, so do these also resist the truth* (2 Timothy 3:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c3_lookup sv, _s236_t236c3_lookup tv
 WHERE t.slug='2-timothy-3-jannes-and-jambres-withstood-moses-the-magicians-of-egypt-exodus-7-jasher'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 7:22 — *the magicians of Egypt did so with their enchantments: and Pharaoh''s heart was hardened* their craft hardened the king and could not stand; *their folly shall be manifest unto all men, as theirs also was* (2 Timothy 3:9).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c3_lookup sv, _s236_t236c3_lookup tv
 WHERE t.slug='2-timothy-3-jannes-and-jambres-withstood-moses-the-magicians-of-egypt-exodus-7-jasher'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jasher 79:27 — *Pharaoh sent for Balaam the magician and to Jannes and Jambres his sons, and to all the magicians* the Hebrew library names the very pair Paul names; the named magicians summoned against Moses (2 Timothy 3:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c3_lookup sv, _s236_t236c3_lookup tv
 WHERE t.slug='2-timothy-3-jannes-and-jambres-withstood-moses-the-magicians-of-egypt-exodus-7-jasher'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=79 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-timothy-3-all-scripture-given-by-inspiration-the-holy-scriptures-are-the-tanakh-psalm-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 19:7 — *the law of Yahuah (LORD) is perfect... making wise the simple* the holy scriptures known from a child = the Tanakh, *able to make thee wise unto salvation* (2 Timothy 3:15); affirmed, not superseded.'
  FROM cross_reference_threads t, cross_references x, _s236_t236c3_lookup sv, _s236_t236c3_lookup tv
 WHERE t.slug='2-timothy-3-all-scripture-given-by-inspiration-the-holy-scriptures-are-the-tanakh-psalm-19'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 119:89 — *for ever, O Yahuah (LORD), thy word is settled in heaven* the inspired word is the abiding word, not a passing fixture; *All scripture is given by inspiration of Elohim (God), and is profitable* (2 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c3_lookup sv, _s236_t236c3_lookup tv
 WHERE t.slug='2-timothy-3-all-scripture-given-by-inspiration-the-holy-scriptures-are-the-tanakh-psalm-19'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=89
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 30:5 — *every word of Elohim (God) is pure: he is a shield unto them that put their trust in him* the purity that is the inspiration Paul names; scripture profitable *for instruction in righteousness* (2 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c3_lookup sv, _s236_t236c3_lookup tv
 WHERE t.slug='2-timothy-3-all-scripture-given-by-inspiration-the-holy-scriptures-are-the-tanakh-psalm-19'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Esdras 14:22 — *send the Ruach HaKodesh (Holy Spirit) into me, and I shall write all... which were written in your law, that men may find your path* scripture by inspiration, anchored in the law; *given by inspiration of Elohim (God)* (2 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c3_lookup sv, _s236_t236c3_lookup tv
 WHERE t.slug='2-timothy-3-all-scripture-given-by-inspiration-the-holy-scriptures-are-the-tanakh-psalm-19'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=14 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2timothy_04.sql (S236 2 Timothy 4) -----
-- =====================================================================
-- S236 minion — 2 TIMOTHY 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 TIMOTHY 4 (22 verses) — THE FINAL CHARGE: preach the word, the crown
-- of righteousness, I have finished my course. Paul's last words as he faces death.
-- Tag: t236c4 (temp view _s236_t236c4_lookup).
-- Sort band: floor 8625, 25-wide (8625, 8626, 8627, 8628 used; under 8650).
-- Source is ALWAYS the canon 2 Timothy verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (2 Timothy = the charge to endure; the deposit, the sound words, the inspired
-- Tanakh, and the crown of righteousness belong to the one olive tree. No replacement theology,
-- no two-covenant split, no law-vs-grace antithesis. Christology = the Formed: the Father judges
-- and rewards through the Formed Son, *the Lord, the righteous judge, shall give me at that day*.)
-- Chapter 4 opens the charge before the appearing and the judgment (4:1), commands Timothy to
-- *preach the word* against the coming itching-ears apostasy that *will not endure sound doctrine*
-- and is *turned unto fables* (4:2-4) — the very turning the prophets named, who told the seers
-- *prophesy not unto us right things, speak unto us smooth things* (Isaiah 30:10) and warned that
-- *my people love to have it so* (Jeremiah 5:31). Then Paul, *ready to be offered,* reckons the
-- finished course: *Henceforth there is laid up for me a crown of righteousness, which Yahuah
-- (Lord), the righteous judge, shall give me at that day* (4:8) — the judgment-throne of Daniel 7,
-- the reward of the righteous the Hebrew library beheld (*a beautiful crown from the hand of
-- Yahuah,* Wisdom 5:16), the prize and incorruptible crown and crown of life the NT names. The
-- judge who renders the crown is the One who *reward[s] him according to his works* (4:14) — the
-- Tanakh's settled rule, *thou renderest to every man according to his work* (Psalm 62:12). And the
-- One who *stood with me... and I was delivered out of the mouth of the lion* (4:17) is the deliverer
-- of Psalm 22 and the God who *shut the lions' mouths* for Daniel (Daniel 6:22). No co-equal-persons
-- grammar: the Father judges, rewards, and delivers through the Formed Son.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1     I charge thee before Elohim... who shall judge the quick and the dead at his appearing
--           Tanakh: Daniel 7:9-10 (carried in the crown thread, the judgment set and the books opened)
--           Extras: none warranted   NT: none warranted (the appearing/judgment carried at v.8)
--   v.2-4   preach the word; they will not endure sound doctrine; itching ears; turned unto fables
--           Tanakh: Isaiah 30:9-11 (lying children... speak unto us smooth things, prophesy deceits),
--                   Jeremiah 5:31 (the prophets prophesy falsely... my people love to have it so)
--           Extras: none warranted (the prophetic root carries the weight; no clean extras add)
--           NT: none warranted (the watchman/preach-the-word weight rests on the Tanakh prophets)
--   v.5-6   do the work of an evangelist; I am now ready to be offered
--           Tanakh: none warranted (drink-offering imagery carried in prose, no single load-bearing verse)
--           Extras: none warranted   NT: none warranted
--   v.7-8   I have fought a good fight... a crown of righteousness, which Yahuah the righteous judge
--           shall give me at that day; unto all them also that love his appearing
--           Tanakh: Daniel 7:9-10 (the Ancient of days, the judgment set, the books opened)
--           Extras: Wisdom of Solomon 5:15-16 (the righteous live for evermore; their reward is with
--                   Yahuah; a glorious kingdom, and a beautiful crown from the hand of Yahuah)
--           NT: Philippians 3:14 (the prize of the high calling), 1 Corinthians 9:25 (the
--                   incorruptible crown), Revelation 2:10 (be faithful unto death, a crown of life)
--   v.9-13  Demas forsook me; only Luke; bring Mark, the cloke, the books and parchments
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (personal narrative)
--   v.14-15 Alexander the coppersmith... Yahuah reward him according to his works
--           Tanakh: Psalm 62:12 (thou renderest to every man according to his work),
--                   Proverbs 24:12 (shall not he render to every man according to his works?)
--           Extras: none warranted   NT: Romans 2:6 (who will render to every man according to his deeds)
--   v.16-18 the Lord stood with me... I was delivered out of the mouth of the lion
--           Tanakh: Psalm 22:21 (save me from the lion's mouth), Daniel 6:22 (hath shut the lions'
--                   mouths, that they have not hurt me)
--           Extras: none warranted   NT: none warranted (the deliverance root is the Tanakh)
--   v.19-22 salutations; Grace be with you
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   8625 2-timothy-4-preach-the-word-against-itching-ears-turned-unto-fables-isaiah-30-jeremiah-5  (Tanakh)
--   8626 2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7  (Tanakh + Extras + NT)
--   8627 2-timothy-4-reward-him-according-to-his-works-psalm-62-proverbs-24  (Tanakh + NT)
--   8628 2-timothy-4-delivered-out-of-the-mouth-of-the-lion-psalm-22-daniel-6  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s236_t236c4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-timothy-4-preach-the-word-against-itching-ears-turned-unto-fables-isaiah-30-jeremiah-5
  ('canon', '2-timothy', 4, 3, 'canon', 'isaiah', 30, 10, 'free', E'*Which say to the seers, See not; and to the prophets, Prophesy not unto us right things, speak unto us smooth things, prophesy deceits:* (Isaiah 30:10). Isaiah names the rebellion that *will not hear the law of Yahuah (LORD)* (Isaiah 30:9) — a people who demand *smooth things* from the prophets and refuse the right word. Paul foresees the same turning: *the time will come when they will not endure sound doctrine; but after their own lusts shall they heap to themselves teachers, having itching ears* (2 Timothy 4:3). The itching ears that crave smooth things are the lying children of Isaiah''s day; the apostasy Paul charges Timothy to preach against is no new thing but the old refusal of the word of Yahuah (LORD).'),
  ('canon', '2-timothy', 4, 4, 'canon', 'jeremiah', 5, 31, 'free', E'*The prophets prophesy falsely, and the priests bear rule by their means; and my people love to have it so: and what will ye do in the end thereof?* (Jeremiah 5:31). Jeremiah sees a people who *love to have it so* — who welcome the false word because it flatters. Paul writes that the itching-eared *shall turn away their ears from the truth, and shall be turned unto fables* (2 Timothy 4:4). The fables Paul names are the false prophesying Jeremiah condemned; against this Timothy is charged, *Preach the word; be instant in season, out of season* (2 Timothy 4:2) — the watchman''s charge to speak the truth though the people love the lie, and to ask with Jeremiah, *what will ye do in the end thereof?*'),
  -- thread: 2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7
  ('canon', '2-timothy', 4, 1, 'canon', 'daniel', 7, 9, 'free', E'*I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* (Daniel 7:9). Paul charges Timothy *before Elohim (God), and the Lord Yahusha HaMashiach (Lord Jesus Christ), who shall judge the quick and the dead at his appearing and his kingdom* (2 Timothy 4:1). Daniel saw that very court convened: the Ancient of days seated on the throne of fire, and *one like the Son of Adam* brought near to receive the kingdom. The judgment-throne behind Paul''s charge is the throne of Daniel''s vision — the Father seated, the Formed Son given the kingdom, judging the quick and the dead at his appearing.'),
  ('canon', '2-timothy', 4, 8, 'canon', 'daniel', 7, 10, 'free', E'*A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* (Daniel 7:10). When Paul reckons *a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day* (2 Timothy 4:8), the day he means is the day Daniel saw: *the judgment was set, and the books were opened.* The righteous judge who lays up the crown is the One enthroned in that fiery court; the *that day* of Paul''s hope is the day of the opened books, when the reward of the righteous is given from the throne.'),
  ('canon', '2-timothy', 4, 8, 'apocrypha', 'the-wisdom-of-solomon', 5, 15, 'extras', E'*But the righteous live for evermore; their reward also is with Yahuah (God), and the care of them is with the Most High.* (Wisdom of Solomon 5:15). The Hebrew library held the same hope Paul reckons: the righteous do not perish but *live for evermore,* and *their reward also is with Yahuah (God).* Paul, ready to be offered, says *Henceforth there is laid up for me a crown of righteousness* (2 Timothy 4:8) — the reward laid up with Yahuah, kept against that day for the one who *fought a good fight... kept the faith* (2 Timothy 4:7). The reward of the righteous Wisdom names is the crown Paul awaits.'),
  ('canon', '2-timothy', 4, 8, 'apocrypha', 'the-wisdom-of-solomon', 5, 16, 'extras', E'*Therefore shall they receive a glorious kingdom, and a beautiful crown from the hand of Yahuah (God): for with his right hand shall he cover them, and with his arm shall he protect them.* (Wisdom of Solomon 5:16). The restored library makes the crown explicit: the righteous *receive a glorious kingdom, and a beautiful crown from the hand of Yahuah (God).* This is the very gift Paul awaits — *a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day* (2 Timothy 4:8). The crown given *from the hand of Yahuah* is the crown the righteous judge lays up; the same hope, the same hand, the same day, spoken in the Hebrew library before Paul reckoned his course finished.'),
  ('canon', '2-timothy', 4, 8, 'canon', 'philippians', 3, 14, 'free', E'*I press toward the mark for the prize of the high calling of Elohim (God) in HaMashiach Yahusha (Christ Jesus).* (Philippians 3:14). Paul pressed *toward the mark for the prize of the high calling.* Now at the end he reckons the prize attained: *I have fought a good fight, I have finished my course... Henceforth there is laid up for me a crown of righteousness* (2 Timothy 4:7-8). The race he ran toward the prize in Philippians is the course now finished in 2 Timothy; the prize of the high calling is the crown of righteousness laid up at that day.'),
  ('canon', '2-timothy', 4, 8, 'canon', '1-corinthians', 9, 25, 'free', E'*And every man that striveth for the mastery is temperate in all things. Now they do it to obtain a corruptible crown; but we an incorruptible.* (1 Corinthians 9:25). Paul set the runner''s corruptible crown against the believer''s *incorruptible.* That incorruptible crown is the one he names at the last: *a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day* (2 Timothy 4:8). The temperate striving of the race in 1 Corinthians is the *good fight* finished in 2 Timothy; the incorruptible crown is the crown of righteousness, given not to Paul only *but unto all them also that love his appearing.*'),
  ('canon', '2-timothy', 4, 8, 'canon', 'revelation', 2, 10, 'free', E'*Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* (Revelation 2:10). The promise to the faithful is a crown: *be thou faithful unto death, and I will give thee a crown of life.* Paul, faithful unto his own death-offering, says *I have kept the faith: Henceforth there is laid up for me a crown of righteousness* (2 Timothy 4:7-8). The crown of life given to the faithful unto death is the crown of righteousness laid up for the one who kept the faith to the end — given to all *that love his appearing.*'),
  -- thread: 2-timothy-4-reward-him-according-to-his-works-psalm-62-proverbs-24
  ('canon', '2-timothy', 4, 14, 'canon', 'psalms', 62, 12, 'free', E'*Also unto thee, O Yahuah (Lord), belongeth mercy: for thou renderest to every man according to his work.* (Psalm 62:12). When Paul says of the one who did him much evil, *Yahuah (Lord) reward him according to his works* (2 Timothy 4:14), he does not curse but commits the matter to the settled rule of the Tanakh: *thou renderest to every man according to his work.* Paul leaves the recompense to Yahuah (Lord), to whom both *mercy* and just rendering belong; the apostle does not avenge himself but trusts the righteous judge who renders to every man.'),
  ('canon', '2-timothy', 4, 14, 'canon', 'proverbs', 24, 12, 'free', E'*If thou sayest, Behold, we knew it not; doth not he that pondereth the heart consider it? and he that keepeth thy soul, doth not he know it? and shall not he render to every man according to his works?* (Proverbs 24:12). Proverbs asks whether the One who *pondereth the heart* will not *render to every man according to his works.* Paul answers it of Alexander: *Yahuah (Lord) reward him according to his works* (2 Timothy 4:14). The heart-pondering God who knows and renders is the One Paul appeals to; vengeance is not the apostle''s but Yahuah''s, who renders justly according to the works he alone sees.'),
  ('canon', '2-timothy', 4, 14, 'canon', 'romans', 2, 6, 'free', E'*Who will render to every man according to his deeds:* (Romans 2:6). Paul had already written the rule into Romans: Elohim (God) *will render to every man according to his deeds.* He now applies it as he hands the matter over: *Yahuah (Lord) reward him according to his works* (2 Timothy 4:14). The God who renders according to deeds in Romans is the righteous judge of 2 Timothy 4:8 — the same One who lays up the crown of righteousness for those who love his appearing renders justly to those who resist the word.'),
  -- thread: 2-timothy-4-delivered-out-of-the-mouth-of-the-lion-psalm-22-daniel-6
  ('canon', '2-timothy', 4, 17, 'canon', 'psalms', 22, 21, 'free', E'*Save me from the lion''s mouth: for thou hast heard me from the horns of the unicorns.* (Psalm 22:21). The psalm of the afflicted righteous cries *Save me from the lion''s mouth,* and is answered — *thou hast heard me.* Paul takes up the same deliverance: *Notwithstanding Yahuah (Lord) stood with me, and strengthened me... and I was delivered out of the mouth of the lion* (2 Timothy 4:17). The lion''s mouth from which the psalmist was saved is the lion''s mouth from which Paul is delivered; the One who heard the afflicted of Psalm 22 stood with Paul and strengthened him.'),
  ('canon', '2-timothy', 4, 17, 'canon', 'daniel', 6, 22, 'free', E'*My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me; and also before thee, O king, have I done no hurt.* (Daniel 6:22). Daniel, cast into the den, testifies that *my Elohim (God) hath sent his angel, and hath shut the lions'' mouths.* Paul, at his first answer forsaken by all, testifies the same deliverance: *I was delivered out of the mouth of the lion* (2 Timothy 4:17). The God who shut the lions'' mouths for the innocent Daniel is the One who stood with Paul and *shall deliver me from every evil work, and will preserve me unto his heavenly kingdom* (2 Timothy 4:18).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s236_t236c4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s236_t236c4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-4-preach-the-word-against-itching-ears-turned-unto-fables-isaiah-30-jeremiah-5',
       E'Preach the word against itching ears turned unto fables (Isaiah 30, Jeremiah 5)',
       E'Paul''s charge is urgent: *Preach the word; be instant in season, out of season; reprove, rebuke, exhort with all longsuffering and doctrine* (2 Timothy 4:2). And he gives the reason: *For the time will come when they will not endure sound doctrine; but after their own lusts shall they heap to themselves teachers, having itching ears; And they shall turn away their ears from the truth, and shall be turned unto fables* (2 Timothy 4:3-4). This is no new corruption but the old refusal the prophets named. Isaiah saw *a rebellious people, lying children, children that will not hear the law of Yahuah (LORD)* (Isaiah 30:9) — a people who say *to the prophets, Prophesy not unto us right things, speak unto us smooth things, prophesy deceits* (Isaiah 30:10). The itching ears that crave smooth things are Isaiah''s lying children; the truth they turn from is the law of Yahuah (LORD) they would not hear. Jeremiah saw the same: *The prophets prophesy falsely, and the priests bear rule by their means; and my people love to have it so: and what will ye do in the end thereof?* (Jeremiah 5:31). The fables Paul warns of are the false prophesying Jeremiah condemned, welcomed because the people *love to have it so.* Against this stands the watchman''s charge — preach the word in season and out, though the people love the lie; for the truth refused is the word of Yahuah (LORD), and the question still presses, *what will ye do in the end thereof?*',
       sv.verse_id, ev.verse_id, 'free', 8625
  FROM _s236_t236c4_lookup sv, _s236_t236c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=4 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7',
       E'The crown of righteousness the righteous judge shall give at that day (Daniel 7; Wisdom 5)',
       E'Paul charges Timothy *before Elohim (God), and the Lord Yahusha HaMashiach (Lord Jesus Christ), who shall judge the quick and the dead at his appearing and his kingdom* (2 Timothy 4:1), and then, ready to be offered, reckons his finished course: *I have fought a good fight, I have finished my course, I have kept the faith: Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing* (2 Timothy 4:7-8). The day he means is the day Daniel saw: *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow... his throne was like the fiery flame* (Daniel 7:9), and *the judgment was set, and the books were opened* (Daniel 7:10). The righteous judge who lays up the crown is the One enthroned in that fiery court — the Father seated, the Formed Son given the kingdom to judge the quick and the dead at his appearing. The crown itself the Hebrew library beheld: *the righteous live for evermore; their reward also is with Yahuah (God), and the care of them is with the Most High* (Wisdom of Solomon 5:15); *Therefore shall they receive a glorious kingdom, and a beautiful crown from the hand of Yahuah (God)* (Wisdom of Solomon 5:16) — the reward laid up with Yahuah, the crown given from his own hand. And the New Testament names this same prize: the *prize of the high calling of Elohim (God)* Paul pressed toward (Philippians 3:14); the *incorruptible* crown set against the runner''s corruptible one (1 Corinthians 9:25); the *crown of life* promised to the one *faithful unto death* (Revelation 2:10). The race run, the faith kept, the offering poured out — the crown of righteousness is the incorruptible crown, the crown of life, the reward of the righteous given from the hand of Yahuah at the day of the opened books, to all that love his appearing. The Father judges and rewards through the Formed Son, the righteous judge of that day.',
       sv.verse_id, ev.verse_id, 'extras', 8626
  FROM _s236_t236c4_lookup sv, _s236_t236c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-4-reward-him-according-to-his-works-psalm-62-proverbs-24',
       E'Yahuah reward him according to his works (Psalm 62, Proverbs 24, Romans 2)',
       E'Of the man who did him much evil, Paul does not curse but commits the matter to Yahuah: *Alexander the coppersmith did me much evil: Yahuah (Lord) reward him according to his works* (2 Timothy 4:14). The words are the settled rule of the Tanakh. The psalmist sang, *Also unto thee, O Yahuah (Lord), belongeth mercy: for thou renderest to every man according to his work* (Psalm 62:12) — to Yahuah belong both mercy and just rendering. Proverbs presses it as a question no man escapes: *doth not he that pondereth the heart consider it? and he that keepeth thy soul, doth not he know it? and shall not he render to every man according to his works?* (Proverbs 24:12). And Paul had already written the rule into the gospel: Elohim (God) *will render to every man according to his deeds* (Romans 2:6). So the apostle does not avenge himself; he hands the matter to the righteous judge who *pondereth the heart* and renders justly. The same One who lays up *a crown of righteousness... at that day* (2 Timothy 4:8) for those who love his appearing will render to the one who resisted the word — recompense and reward both belong to Yahuah, who renders to every man according to his works.',
       sv.verse_id, ev.verse_id, 'free', 8627
  FROM _s236_t236c4_lookup sv, _s236_t236c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=4 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-4-delivered-out-of-the-mouth-of-the-lion-psalm-22-daniel-6',
       E'Delivered out of the mouth of the lion (Psalm 22, Daniel 6)',
       E'Forsaken by all at his first answer, Paul testifies that he was not alone: *Notwithstanding Yahuah (Lord) stood with me, and strengthened me; that by me the preaching might be fully known, and that all the Gentiles might hear: and I was delivered out of the mouth of the lion* (2 Timothy 4:17). The lion''s mouth is the deliverance the Tanakh sings and shows. The afflicted righteous of the psalm cried, *Save me from the lion''s mouth: for thou hast heard me from the horns of the unicorns* (Psalm 22:21) — and was heard. Daniel, cast into the den, testified, *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me* (Daniel 6:22). The God who heard the afflicted of Psalm 22 and shut the lions'' mouths for the innocent Daniel is the One who stood with Paul and strengthened him. And Paul reaches past every present rescue to the last one: *And Yahuah (Lord) shall deliver me from every evil work, and will preserve me unto his heavenly kingdom: to whom be glory for ever and ever. Amen* (2 Timothy 4:18) — the same deliverer who shut the lions'' mouths will bring him safe into the kingdom.',
       sv.verse_id, ev.verse_id, 'free', 8628
  FROM _s236_t236c4_lookup sv, _s236_t236c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=4 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-timothy-4-preach-the-word-against-itching-ears-turned-unto-fables-isaiah-30-jeremiah-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 30:10 — *speak unto us smooth things, prophesy deceits* the lying children who will not hear the law of Yahuah (LORD); the itching ears that *will not endure sound doctrine* (2 Timothy 4:3).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-preach-the-word-against-itching-ears-turned-unto-fables-isaiah-30-jeremiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=30 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 5:31 — *the prophets prophesy falsely... and my people love to have it so* the welcomed lie; those who *shall turn away their ears from the truth, and shall be turned unto fables* (2 Timothy 4:4).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-preach-the-word-against-itching-ears-turned-unto-fables-isaiah-30-jeremiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=5 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:9 — *the Ancient of days did sit... his throne was like the fiery flame* the judgment-throne behind Paul''s charge *before Elohim... who shall judge the quick and the dead at his appearing* (2 Timothy 4:1).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:10 — *the judgment was set, and the books were opened* the day Paul means; *which Yahuah (Lord), the righteous judge, shall give me at that day* (2 Timothy 4:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 5:15 — *the righteous live for evermore; their reward also is with Yahuah (God)* the reward laid up with Yahuah; *there is laid up for me a crown of righteousness* (2 Timothy 4:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 5:16 — *a glorious kingdom, and a beautiful crown from the hand of Yahuah (God)* the crown made explicit; *a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me* (2 Timothy 4:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Philippians 3:14 — *the prize of the high calling of Elohim (God)* the mark Paul pressed toward; the course now *finished* and the crown laid up (2 Timothy 4:7-8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Corinthians 9:25 — *they do it to obtain a corruptible crown; but we an incorruptible* the incorruptible crown of the race; the crown of righteousness of the finished course (2 Timothy 4:7-8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=9 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Revelation 2:10 — *be thou faithful unto death, and I will give thee a crown of life* the crown for the faithful unto death; the crown of righteousness for the one who *kept the faith* (2 Timothy 4:7-8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-the-crown-of-righteousness-the-righteous-judge-at-that-day-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-timothy-4-reward-him-according-to-his-works-psalm-62-proverbs-24
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 62:12 — *thou renderest to every man according to his work* the settled rule, mercy and just rendering both Yahuah''s; *Yahuah (Lord) reward him according to his works* (2 Timothy 4:14).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-reward-him-according-to-his-works-psalm-62-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=62 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 24:12 — *shall not he render to every man according to his works?* the heart-pondering God who knows; the recompense Paul leaves to Yahuah (2 Timothy 4:14).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-reward-him-according-to-his-works-psalm-62-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 2:6 — *who will render to every man according to his deeds* the rule Paul wrote into the gospel; the righteous judge who renders justly (2 Timothy 4:14, cf. 4:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-reward-him-according-to-his-works-psalm-62-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-timothy-4-delivered-out-of-the-mouth-of-the-lion-psalm-22-daniel-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 22:21 — *Save me from the lion''s mouth: for thou hast heard me* the afflicted righteous heard and saved; *I was delivered out of the mouth of the lion* (2 Timothy 4:17).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-delivered-out-of-the-mouth-of-the-lion-psalm-22-daniel-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 6:22 — *my Elohim (God)... hath shut the lions'' mouths, that they have not hurt me* the den-deliverance of the innocent Daniel; the God who stood with Paul and delivered him (2 Timothy 4:17).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c4_lookup sv, _s236_t236c4_lookup tv
 WHERE t.slug='2-timothy-4-delivered-out-of-the-mouth-of-the-lion-psalm-22-daniel-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session236 — 2 Timothy cross-references complete.'
