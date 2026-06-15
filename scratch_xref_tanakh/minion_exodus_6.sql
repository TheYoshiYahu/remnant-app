-- ----- fragment: minion_exodus_6.sql (Exodus 6) -----
-- Chapter: Exodus 6 — the covenant Name I AM / Yahuah self-disclosed in redemptive power;
--   the seven "I will" of redemption and the betrothal formula ("I will take you to me for a
--   people"); the knowing-Yahuah refrain; the priestly bloodline (Reuben, Simeon, Levi → Aaron).
-- Session: s305   Tag: ex06   Sort band base 29125 (step 3: 29125, 29128, 29131, 29134)
--
-- Exodus 6 coverage checklist:
--   v.1   NT: none warranted   Extras: Jasher 81:4 (strong-hand deliverance — held for thread 2)
--         Tanakh: 6:6 echo (strong hand)  → folded into thread 2
--   v.2-3 NT: John 8:58 (Formed Son speaks the Name)   Extras: none warranted
--         Tanakh: Exodus 3:14, 3:15 (I AM THAT I AM / the Name forever), Genesis 17:1 (El Shaddai)
--         → THREAD 1 (i-am-yahuah-the-name-newly-disclosed)
--   v.4-5 NT: none warranted   Extras: Jubilees 48:7 (covenant with Abraham remembered) → thread 2
--         Tanakh: covenant-remembered → folded into thread 2
--   v.6-8 NT: 2 Corinthians 6:16, Revelation 21:3 (the betrothal/dwelling formula consummated)
--         Extras: Jubilees 48:7 (covenant kept), Jasher 81:4 (brought out with a strong hand)
--         Tanakh: Ezekiel 37:23, 37:27; Hosea 2:19, 2:23; Jeremiah 31:33 → THREAD 2
--   v.7   NT: none warranted   Extras: none warranted
--         Tanakh: Ezekiel 6:7 (the knowing-Yahuah refrain) → THREAD 3
--   v.9-13 NT: none warranted   Extras: none warranted   Tanakh: none warranted (narrative bridge)
--   v.14-15 NT: none warranted   Extras: none warranted   Tanakh: tribal heads (Reuben, Simeon)
--         → opening of THREAD 4
--   v.16-25 NT: none warranted   Extras: none warranted
--         Tanakh: Genesis 46:11 (sons of Levi, verbatim), Numbers 3:6, 3:10 (Levi → Aaron the
--         priesthood) → THREAD 4 (the-house-of-levi-the-priestly-bloodline)
--   v.26-30 NT: none warranted   Extras: none warranted   Tanakh: none warranted (recap/narrative)
--
-- Threads:
--   1. exodus-6-i-am-yahuah-the-name-newly-disclosed        (free)   Tanakh + NT
--      v.2-3 → Exodus 3:14, 3:15, Genesis 17:1, John 8:58
--   2. exodus-6-the-seven-i-will-redemption-and-the-betrothal (extras) Tanakh + NT + Jubilees + Jasher
--      v.6-8 → Ezek 37:23, 37:27; Hosea 2:19, 2:23; Jer 31:33; 2 Cor 6:16; Rev 21:3; Jub 48:7; Jasher 81:4
--   3. exodus-6-ye-shall-know-that-i-am-yahuah               (free)   Tanakh
--      v.7 → Ezekiel 6:7
--   4. exodus-6-the-house-of-levi-the-priestly-bloodline     (free)   Tanakh
--      v.16-25 → Genesis 46:11, Numbers 3:6, Numbers 3:10
--
-- Framework-load-bearing framing:
--   * 6:2-3 the Name newly DISCLOSED (not newly invented) — the Father's self-disclosure carried
--     by the Formed Son who is the I AM (John 8:58), the El Shaddai who appeared to Abram.
--   * 6:6-8 redemption is UNTO covenant belonging — the betrothal of the SAME Yashar'el, the
--     two-house regathering and marriage; never replacement, never a new people by confession.

CREATE TEMP VIEW _s305_ex06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (
  VALUES
  -- THREAD 1 — the Name newly disclosed (v.2-3)
  ('canon','exodus',6,3,'canon','exodus',3,14,'free',
   E'*And Elohim (God) said unto Moses, Ehyeh asher Ehyeh (I AM THAT I AM): and he said, Thus shalt thou say unto the children of Yashar''el (Israel), I AM hath sent me unto you* (Exodus 3:14). At the bush the Name is uttered as sheer self-existent being; here at *I am Yahuah (LORD)... but by my name JEHOVAH was I not known to them* (Exodus 6:3) that same Name steps into redemptive power. The fathers knew Him as El Shaddai who provides; now Yashar''el will know Him as the I AM who delivers.'),
  ('canon','exodus',6,3,'canon','exodus',3,15,'free',
   E'*Thus shalt thou say unto the children of Yashar''el (Israel), Yahuah Elohim (The LORD God) of your fathers... hath sent me unto you: this is my name for ever, and this is my memorial unto all generations* (Exodus 3:15). The Name *was I not known to them* (Exodus 6:3) by its redemptive weight is the very Name declared *for ever* — not a new deity, but the covenant Name now unsheathed to bring the people out.'),
  ('canon','exodus',6,3,'canon','genesis',17,1,'free',
   E'*And when Abram was ninety years old and nine, Yahuah (LORD) appeared to Abram, and said unto him, I am the El Shaddai (Almighty God); walk before me, and be thou perfect* (Genesis 17:1). This is the very title 6:3 names: *I appeared unto Abraham, unto Isaac, and unto Jacob, by the name of El Shaddai (God Almighty)*. The patriarchs met the Almighty who promised; their sons meet the Yahuah who keeps it.'),
  ('canon','exodus',6,3,'canon','john',8,58,'free',
   E'*Yahusha (Jesus) said unto them, Verily, verily, I say unto you, Before Abraham was, I am* (John 8:58). The One who tells Moses *I am Yahuah (LORD)* (Exodus 6:2) and unveils the I AM Name is the Formed Son — the same who appeared to Abraham, drawn from the Formless Father, speaking the Name He has carried from of old. *Before Abraham was, I am* claims the bush and this disclosure as His own voice.'),

  -- THREAD 2 — the seven "I will" of redemption + the betrothal (v.6-8)
  ('canon','exodus',6,7,'canon','ezekiel',37,23,'free',
   E'*so shall they be my people, and I will be their Elohim (God)* (Ezekiel 37:23). The betrothal formula of 6:7 — *I will take you to me for a people, and I will be to you a Elohim (God)* — is the marriage-bond Ezekiel sees consummated in the gathering of the two sticks: the SAME Yashar''el cleansed and made one, *my people* again, never a people replaced.'),
  ('canon','exodus',6,7,'canon','ezekiel',37,27,'free',
   E'*My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people* (Ezekiel 37:27). What begins as *I will take you to me for a people* (Exodus 6:7) at the Exodus is the everlasting end Ezekiel names — Yahuah dwelling in the midst of His regathered people, the two houses made one under His tabernacle.'),
  ('canon','exodus',6,7,'canon','hosea',2,19,'free',
   E'*And I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19). Hosea makes plain that *I will take you to me for a people* (Exodus 6:7) is covenant-marriage language. Yahuah does not merely free Yashar''el; He betroths her — the redemption of chapter 6 is unto belonging, the wife taken to Himself for ever.'),
  ('canon','exodus',6,7,'canon','hosea',2,23,'free',
   E'*and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23). The scattered northern house, *Lo-Ammi*, is restored to the very formula spoken in Egypt — *I will take you to me for a people, and I will be to you a Elohim (God)* (Exodus 6:7). The divorced bride is betrothed again; the not-my-people become my people, the SAME Yashar''el regathered.'),
  ('canon','exodus',6,7,'canon','jeremiah',31,33,'free',
   E'*I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The new covenant carries the identical betrothal of 6:7 — *I will be to you a Elohim (God)* — now with the Torah written within. Not a covenant that abolishes the Law but one that engraves it on the heart of the same redeemed people.'),
  ('canon','exodus',6,7,'canon','2-corinthians',6,16,'free',
   E'*I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16). Sha''ul (Paul) quotes the Exodus-and-prophets formula straight: the betrothal Yahuah swore in Egypt — *I will be to you a Elohim (God)* (Exodus 6:7) — is the dwelling of Yahuah among His own, the same promise reaching forward to those grafted into Yashar''el.'),
  ('canon','exodus',6,8,'canon','revelation',21,3,'free',
   E'*Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). The chain that begins *I will bring you out... I will bring you in unto the land* (Exodus 6:6,8) ends here, in the New Yerushalayim: the betrothal formula of 6:7 spoken over the consummated dwelling of Yahuah with His people for ever.'),
  ('canon','exodus',6,6,'jubilees','jubilees',48,7,'extras',
   E'*ten great and terrible judgments came on the land of Egypt that you might execute vengeance on it for Yashar’el (Israel). And Yahuah (God) did everything for Yashar’el’s (Israel’s) sake, and according to His covenant, which He had ordained with Abraham that He would take vengeance on them as they had brought them by force into bondage* (Jubilees 48:7). Jubilees grounds *I will redeem you with a stretched out arm, and with great judgments* (Exodus 6:6) in the covenant with Abraham — the deliverance is Yahuah keeping the oath He swore, *I have remembered my covenant* (Exodus 6:5).'),
  ('canon','exodus',6,6,'jasher','jasher',81,4,'extras',
   E'*And at the end of two hundred and ten years, Yahuah (the Lord) brought forth the children of Israel from Egypt with a strong hand* (Jasher 81:4). Jasher echoes the very promise of chapter 6 — *I will bring you out from under the burdens of the Egyptians... I will redeem you with a stretched out arm* (Exodus 6:6) — and the *strong hand* of 6:1. The seven "I will" become recorded history: the bringing-out accomplished.'),

  -- THREAD 3 — ye shall know that I am Yahuah (v.7)
  ('canon','exodus',6,7,'canon','ezekiel',6,7,'free',
   E'*And the slain shall fall in the midst of you, and ye shall know that I am Yahuah (LORD)* (Ezekiel 6:7). The refrain born in the Exodus — *ye shall know that I am Yahuah Elohaychem (the LORD your God), which bringeth you out from under the burdens of the Egyptians* (Exodus 6:7) — runs the whole prophetic word. By redemption Yashar''el comes to know the Name; by judgment the nations and the wayward come to know it too. To know Yahuah is the covenant''s aim.'),

  -- THREAD 4 — the house of Levi, the priestly bloodline (v.16-25)
  ('canon','exodus',6,16,'canon','genesis',46,11,'free',
   E'*And the sons of Levi; Gershon, Kohath, and Merari* (Genesis 46:11). The genealogy of 6:16 — *the names of the sons of Levi according to their generations; Gershon, and Kohath, and Merari* — repeats verbatim the line recorded when Yashar''el went down into Egypt. The covenant is carried by paternal bloodline: the same three houses of Levi from which Aaron and Moses will rise.'),
  ('canon','exodus',6,20,'canon','numbers',3,6,'free',
   E'*Bring the tribe of Levi near, and present them before Aaron the priest, that they may minister unto him* (Numbers 3:6). The bloodline traced in 6:20 — *she bare him Aaron and Moses* — is precisely the line set apart for service. Levi descends to Amram, Amram to Aaron; the genealogy is not mere record but the establishing of the priesthood that will minister before Yahuah.'),
  ('canon','exodus',6,25,'canon','numbers',3,10,'free',
   E'*And thou shalt appoint Aaron and his sons, and they shall wait on their priest’s office: and the stranger that cometh nigh shall be put to death* (Numbers 3:10). The line that ends in 6:25 with *Eleazar Aaron’s son... bare him Phinehas: these are the heads of the fathers of the Levites* is the very household appointed to the priest''s office. The covenant is carried by bloodline AND charge together — Aaron''s sons, and no stranger.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-6-i-am-yahuah-the-name-newly-disclosed',
       E'I am Yahuah: the covenant Name newly disclosed',
       E'*And Elohim (God) spake unto Moses, and said unto him, I am Yahuah (LORD): And I appeared unto Abraham, unto Isaac, and unto Jacob, by the name of El Shaddai (God Almighty), but by my name JEHOVAH was I not known to them* (Exodus 6:2-3). The Name is not newly invented — it is newly DISCLOSED in redemptive power. The fathers walked with *I am the El Shaddai (Almighty God)* (Genesis 17:1), the Almighty who promises and provides; now their enslaved sons will know Him as the Yahuah who delivers. At the bush this same Name was spoken as sheer being — *Ehyeh asher Ehyeh (I AM THAT I AM)* (Exodus 3:14) — *this is my name for ever, and this is my memorial unto all generations* (Exodus 3:15). And the voice that speaks it is the Formed Son, drawn from the Formless Father: *Yahusha (Jesus) said unto them, Verily, verily, I say unto you, Before Abraham was, I am* (John 8:58). He who appeared to Abraham and to Moses claims the I AM as His own — Yahuah, and yet having a Father.',
       sv.verse_id, ev.verse_id, 'free', 29125
  FROM _s305_ex06_lookup sv, _s305_ex06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=6 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-6-the-seven-i-will-redemption-and-the-betrothal',
       E'The seven "I will" of redemption and the betrothal',
       E'*I will bring you out from under the burdens of the Egyptians, and I will rid you out of their bondage, and I will redeem you with a stretched out arm, and with great judgments: And I will take you to me for a people, and I will be to you a Elohim (God)... And I will bring you in unto the land* (Exodus 6:6-8). Seven times Yahuah says *I will* — and at the heart of them stands a betrothal: *I will take you to me for a people, and I will be to you a Elohim (God)*. Redemption is UNTO belonging. This is marriage-language: *I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19), and the scattered house *which were not my people* is told *Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23). The prophets carry the same formula to the regathering of the two houses — *so shall they be my people, and I will be their Elohim (God)* (Ezekiel 37:23); *My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people* (Ezekiel 37:27) — and into the new covenant: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). Sha''ul (Paul) quotes it whole — *I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16) — and John hears it spoken over the consummated dwelling: *the tabernacle of Elohim (God) is with men... and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). The restored library remembers that the deliverance kept an oath: *Yahuah (God) did everything for Yashar’el’s (Israel’s) sake, and according to His covenant, which He had ordained with Abraham* (Jubilees 48:7), and *Yahuah (the Lord) brought forth the children of Israel from Egypt with a strong hand* (Jasher 81:4). One betrothal, one people taken to Himself — never replaced, the same Yashar''el gathered and made His.',
       sv.verse_id, ev.verse_id, 'extras', 29128
  FROM _s305_ex06_lookup sv, _s305_ex06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-6-ye-shall-know-that-i-am-yahuah',
       E'Ye shall know that I am Yahuah',
       E'*And I will be to you a Elohim (God): and ye shall know that I am Yahuah Elohaychem (the LORD your God), which bringeth you out from under the burdens of the Egyptians* (Exodus 6:7). The aim of redemption is knowledge of the Name. This refrain, born in the Exodus, runs the length of the prophets — *And the slain shall fall in the midst of you, and ye shall know that I am Yahuah (LORD)* (Ezekiel 6:7). By deliverance the covenant people come to know Yahuah; by judgment the wayward and the nations come to know Him too. To know Yahuah — not as a fact but as the One who acts — is the covenant''s very purpose, here sealed to the bringing-out of Yashar''el.',
       sv.verse_id, ev.verse_id, 'free', 29131
  FROM _s305_ex06_lookup sv, _s305_ex06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-6-the-house-of-levi-the-priestly-bloodline',
       E'The house of Levi: the priestly bloodline established',
       E'*And these are the names of the sons of Levi according to their generations; Gershon, and Kohath, and Merari* (Exodus 6:16). In the midst of the redemption narrative the chapter pauses to trace a bloodline — and the line it follows is the priestly one. The three houses of Levi repeat verbatim the record from when Yashar''el went down into Egypt: *And the sons of Levi; Gershon, Kohath, and Merari* (Genesis 46:11). Through Kohath to Amram the genealogy descends: *she bare him Aaron and Moses* (Exodus 6:20), and on to *Eleazar Aaron’s son... bare him Phinehas: these are the heads of the fathers of the Levites* (Exodus 6:25). This is no idle list. It is the establishing of the priesthood: *Bring the tribe of Levi near, and present them before Aaron the priest, that they may minister unto him* (Numbers 3:6); *And thou shalt appoint Aaron and his sons, and they shall wait on their priest’s office: and the stranger that cometh nigh shall be put to death* (Numbers 3:10). The covenant is carried by paternal bloodline AND charge together — the same Yashar''el, the same Levi, the appointed house through which Yahuah will be approached.',
       sv.verse_id, ev.verse_id, 'free', 29134
  FROM _s305_ex06_lookup sv, _s305_ex06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=6 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Ehyeh asher Ehyeh (I AM THAT I AM)* (Exodus 3:14) — the Name uttered as sheer being at the bush, now unsheathed in redemptive power.'
  FROM cross_reference_threads t
  JOIN _s305_ex06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s305_ex06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-6-i-am-yahuah-the-name-newly-disclosed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*this is my name for ever, and this is my memorial unto all generations* (Exodus 3:15) — the Name not new, but now disclosed by its delivering weight.'
  FROM cross_reference_threads t
  JOIN _s305_ex06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s305_ex06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-6-i-am-yahuah-the-name-newly-disclosed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I am the El Shaddai (Almighty God)* (Genesis 17:1) — the very title 6:3 names: the Almighty who appeared to the fathers.'
  FROM cross_reference_threads t
  JOIN _s305_ex06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s305_ex06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-6-i-am-yahuah-the-name-newly-disclosed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Before Abraham was, I am* (John 8:58) — the Formed Son claims the I AM Name as His own voice, Yahuah and yet having a Father.'
  FROM cross_reference_threads t
  JOIN _s305_ex06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s305_ex06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=58
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-6-i-am-yahuah-the-name-newly-disclosed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*so shall they be my people, and I will be their Elohim (God)* (Ezekiel 37:23) — the betrothal of 6:7 consummated in the gathering of the two sticks.'
  FROM cross_reference_threads t
  JOIN _s305_ex06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s305_ex06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-6-the-seven-i-will-redemption-and-the-betrothal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will be their Elohim (God), and they shall be my people* (Ezekiel 37:27) — Yahuah dwelling in the midst of His regathered, two houses made one.'
  FROM cross_reference_threads t
  JOIN _s305_ex06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s305_ex06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-6-the-seven-i-will-redemption-and-the-betrothal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will betroth thee unto me for ever* (Hosea 2:19) — naming plainly that "I will take you to me for a people" is marriage-language.'
  FROM cross_reference_threads t
  JOIN _s305_ex06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s305_ex06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-6-the-seven-i-will-redemption-and-the-betrothal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23) — the divorced northern house, Lo-Ammi, betrothed again into the same formula.'
  FROM cross_reference_threads t
  JOIN _s305_ex06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s305_ex06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-6-the-seven-i-will-redemption-and-the-betrothal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*will be their Elohim (God), and they shall be my people* (Jeremiah 31:33) — the new covenant carries the same betrothal, now with Torah written on the heart.'
  FROM cross_reference_threads t
  JOIN _s305_ex06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s305_ex06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-6-the-seven-i-will-redemption-and-the-betrothal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16) — Sha''ul quotes the Exodus-and-prophets formula straight as the dwelling of Yahuah among His own.'
  FROM cross_reference_threads t
  JOIN _s305_ex06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s305_ex06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-6-the-seven-i-will-redemption-and-the-betrothal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3) — the "I will bring you in" chain ended in the New Yerushalayim.'
  FROM cross_reference_threads t
  JOIN _s305_ex06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s305_ex06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-6-the-seven-i-will-redemption-and-the-betrothal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*according to His covenant, which He had ordained with Abraham* (Jubilees 48:7) — the deliverance keeping the oath, "I have remembered my covenant" (Exodus 6:5).'
  FROM cross_reference_threads t
  JOIN _s305_ex06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s305_ex06_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-6-the-seven-i-will-redemption-and-the-betrothal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*Yahuah (the Lord) brought forth the children of Israel from Egypt with a strong hand* (Jasher 81:4) — the seven "I will" become recorded history, the bringing-out accomplished.'
  FROM cross_reference_threads t
  JOIN _s305_ex06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s305_ex06_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=81 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-6-the-seven-i-will-redemption-and-the-betrothal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*ye shall know that I am Yahuah (LORD)* (Ezekiel 6:7) — the Exodus refrain running the length of the prophets, the covenant''s aim to know the Name.'
  FROM cross_reference_threads t
  JOIN _s305_ex06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s305_ex06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-6-ye-shall-know-that-i-am-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And the sons of Levi; Gershon, Kohath, and Merari* (Genesis 46:11) — the three houses of Levi, verbatim from the going-down into Egypt.'
  FROM cross_reference_threads t
  JOIN _s305_ex06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s305_ex06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-6-the-house-of-levi-the-priestly-bloodline'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Bring the tribe of Levi near, and present them before Aaron the priest* (Numbers 3:6) — the bloodline of 6:20 (Aaron and Moses) set apart for service.'
  FROM cross_reference_threads t
  JOIN _s305_ex06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=20
  JOIN _s305_ex06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-6-the-house-of-levi-the-priestly-bloodline'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*thou shalt appoint Aaron and his sons, and they shall wait on their priest’s office* (Numbers 3:10) — the household ending 6:25 (Eleazar, Phinehas) appointed to the priesthood.'
  FROM cross_reference_threads t
  JOIN _s305_ex06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=6 AND sv.verse_number=25
  JOIN _s305_ex06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-6-the-house-of-levi-the-priestly-bloodline'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
