-- ----- fragment: minion_romans_08.sql (S219 Romans 8) -----
-- =====================================================================
-- S219 minion — ROMANS 8 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 8.  Tag: r08 (temp view _s219_r08_lookup).  Sort band: 6175, step 3 (<6200).
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Red Lines #4/#5/#6/#7): Romans 8 is the chapter most weaponized against the
-- law, and the weapon is the misreading of *no condemnation … who walk not after the flesh, but
-- after the Spirit* (8:1) as freedom-from-Torah. The chapter says the opposite. *That the
-- righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the
-- Spirit* (8:4) — the Spirit WRITES and FULFILLS the Torah in the walker; the two are one work,
-- never opposed. The carnal mind *is not subject to the law of Elohim (God)* (8:7) — the flesh is
-- the enemy of the law, the Spirit its fulfilment. This is exactly the new-covenant promise of
-- the prophets: *I will put my law in their inward parts, and write it in their hearts*
-- (Jeremiah 31:33); *I will put my spirit within you, and cause you to walk in my statutes, and
-- ye shall keep my judgments, and do them* (Ezekiel 36:27). Led by the Spirit = sons (8:14); the
-- Spirit of adoption, heirs (8:15-17). Creation groans for the redemption / the manifestation of
-- the sons (8:19-23) — the ground cursed at Eden (Genesis 3:17) waiting for the restoration the
-- prophet saw (Isaiah 11). *For thy sake we are killed all the day long* (8:36) = Psalm 44:22,
-- and the psalm names the slain as the covenant-faithful whose *steps declined* not from his way.
-- Nothing separates from the love of Elohim (8:35-39).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   no condemnation / righteousness of the law fulfilled by the Spirit
--           Tanakh: Jeremiah 31:33 (law in inward parts), Ezekiel 36:27 (Spirit causes walking)  Extras: none warranted  NT: none added (Romans 7:22-25 carried in prose; same hand)
--   v.5-8   carnal mind enmity, not subject to the law of Elohim
--           Tanakh: none added (carried at v.1-4)  Extras: none warranted  NT: none warranted
--   v.9-14  Spirit dwells / quickens mortal bodies / led by the Spirit are sons
--           Tanakh: Ezekiel 36:26 (new heart), Ezekiel 37:14 (Spirit put in you, ye shall live)  Extras: none warranted  NT: none added (Galatians carried at v.14-17)
--   v.14-17 Spirit of adoption, Abba, heirs, joint-heirs
--           Tanakh: none warranted  Extras: none warranted  NT: Galatians 4:6 (Spirit of his Son, Abba), Galatians 5:18 (led of the Spirit, not under the law)
--   v.18-23 creation groaneth, waiteth for the manifestation of the sons / redemption of the body
--           Tanakh: Genesis 3:17 (ground cursed), Isaiah 11:6 (the restored creation), Isaiah 11:9 (none hurt nor destroy)  Extras: none warranted  NT: none warranted
--   v.24-30 hope, the Spirit's intercession, foreknown, predestinate, glorified
--           Tanakh: none warranted (the chain is internal)  Extras: none warranted  NT: none warranted
--   v.31-34 if Elohim be for us / who shall lay charge / who condemneth
--           Tanakh: Isaiah 50:8 (who will contend with me), Isaiah 50:9 (who is he that shall condemn me)  Extras: none warranted  NT: none warranted
--   v.35-39 killed all the day long / nothing separates from the love of Elohim
--           Tanakh: Psalm 44:22 (quoted verbatim), Psalm 44:18 (steps declined not from thy way)  Extras: none warranted  NT: none warranted
--
-- THREADS (slug -> target libraries):
--   6175 romans-8-the-righteousness-of-the-law-fulfilled-in-us-by-the-spirit        (Tanakh)
--   6178 romans-8-i-will-put-my-spirit-within-you-the-new-heart-that-walks          (Tanakh)
--   6181 romans-8-the-spirit-of-adoption-led-by-the-spirit-are-sons                  (NT)
--   6184 romans-8-the-whole-creation-groaneth-for-the-manifestation-of-the-sons      (Tanakh)
--   6187 romans-8-who-shall-lay-charge-who-condemneth-isaiah                          (Tanakh)
--   6190 romans-8-for-thy-sake-we-are-killed-all-the-day-long-psalm-44               (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s219_r08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-8-the-righteousness-of-the-law-fulfilled-in-us-by-the-spirit
  ('canon', 'romans', 8, 4, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). The whole purpose of the Son sent and sin condemned in the flesh is *that the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit* (Romans 8:4). This is the new covenant the prophet foretold: not the law abolished but the law *put in their inward parts* and *written in their hearts.* The Spirit who fulfils the righteousness of the law in the walker is the Spirit who writes that very law within — the two are one work, never opposed.'),
  ('canon', 'romans', 8, 4, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). The Spirit-walk Paul names — *who walk not after the flesh, but after the Spirit* (Romans 8:4) — is exactly what the prophet promised the Spirit would do: *cause you to walk in my statutes,* that *ye shall keep my judgments, and do them.* The indwelling Spirit does not lead away from the commandments; he is given precisely to bring about their doing. The righteousness of the law fulfilled in us is the Spirit keeping the statutes through us.'),
  ('canon', 'romans', 8, 7, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). *Because the carnal mind is enmity against Elohim (God): for it is not subject to the law of Elohim (God), neither indeed can be* (Romans 8:7). It is the flesh, not the Spirit, that cannot be subject to the law. The promised Spirit is the One who causes the walk in the statutes; the carnal mind is its enemy. The chapter pits the flesh against the law, never the Spirit against the law.'),
  -- thread: romans-8-i-will-put-my-spirit-within-you-the-new-heart-that-walks
  ('canon', 'romans', 8, 11, 'canon', 'ezekiel', 37, 14, 'free', E'*And shall put my spirit in you, and ye shall live, and I shall place you in your own land: then shall ye know that I Yahuah (LORD) have spoken it, and performed it, saith Yahuah (LORD).* (Ezekiel 37:14). *But if the Spirit of him that raised up Yahusha (Jesus) from the dead dwell in you, he that raised up Messiah (Christ) from the dead shall also quicken your mortal bodies by his Spirit that dwelleth in you* (Romans 8:11). The prophet stood in the valley of dry bones and heard the promise: *I will put my spirit in you, and ye shall live.* Paul names the same Spirit, now indwelling, who quickens the mortal body — the resurrection-life of the whole house of Yashar''el (Israel) the prophet saw, worked by the Spirit that raised the Messiah.'),
  ('canon', 'romans', 8, 13, 'canon', 'ezekiel', 36, 26, 'free', E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26). *For if ye live after the flesh, ye shall die: but if ye through the Spirit do mortify the deeds of the body, ye shall live* (Romans 8:13). The mortifying of the deeds of the body *through the Spirit* is the new heart at work — the stony heart taken away, the heart of flesh given, the new spirit put within. Death follows the old flesh; life follows the Spirit that the prophet said Yahuah (LORD) would put within his people.'),
  ('canon', 'romans', 8, 14, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). *For as many as are led by the Spirit of Elohim (God), they are the sons of Elohim (God)* (Romans 8:14). To be *led by the Spirit* is to be caused to *walk in my statutes* and to *keep my judgments, and do them.* The leading and the walking are one motion. The sons of Elohim are marked not by escape from the commandments but by the Spirit''s work of keeping them — the promise of the new heart bearing its fruit.'),
  -- thread: romans-8-the-spirit-of-adoption-led-by-the-spirit-are-sons
  ('canon', 'romans', 8, 15, 'canon', 'galatians', 4, 6, 'free', E'*And because ye are sons, Elohim (God) hath sent forth the Spirit of his Son into your hearts, crying, Abba, Father.* (Galatians 4:6). *For ye have not received the spirit of bondage again to fear; but ye have received the Spirit of adoption, whereby we cry, Abba, Father* (Romans 8:15). Paul says the same thing twice: the Spirit poured into the heart is the Spirit of the Son, and he cries *Abba, Father.* The order is the framework''s own — *because ye are sons,* the Spirit is sent; the Spirit reveals the sonship that was already true, the scattered seed brought to know the Father who was always theirs.'),
  ('canon', 'romans', 8, 14, 'canon', 'galatians', 5, 18, 'free', E'*But if ye be led of the Spirit, ye are not under the law.* (Galatians 5:18). *For as many as are led by the Spirit of Elohim (God), they are the sons of Elohim (God)* (Romans 8:14). To be *led of the Spirit* is to be no longer *under the law* — under its condemnation and penalty as a system that holds the transgressor; it is never freedom to transgress. The same Spirit who leads the sons is the One who causes the walk in the statutes. Led by the Spirit, the son is lifted out from under the law''s sentence and set to keep it from the heart.'),
  -- thread: romans-8-the-whole-creation-groaneth-for-the-manifestation-of-the-sons
  ('canon', 'romans', 8, 20, 'canon', 'genesis', 3, 17, 'free', E'*And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* (Genesis 3:17). *For the creature was made subject to vanity, not willingly, but by reason of him who hath subjected the same in hope* (Romans 8:20). The subjection of the creature to vanity is the curse spoken in the garden: *cursed is the ground for thy sake.* The ground was bound to thorn and sorrow not for its own fault but by reason of Adam''s fall — subjected, yet *in hope,* groaning toward the day the curse is lifted.'),
  ('canon', 'romans', 8, 21, 'canon', 'isaiah', 11, 6, 'free', E'*The wolf also shall dwell with the lamb, and the leopard shall lie down with the kid; and the calf and the young lion and the fatling together; and a little child shall lead them.* (Isaiah 11:6). *Because the creature itself also shall be delivered from the bondage of corruption into the glorious liberty of the children of Elohim (God)* (Romans 8:21). The deliverance of the creature from the bondage of corruption is the restored creation the prophet saw: wolf with lamb, leopard with kid, a little child leading them. The same root of Jesse who fulfils the law by the Spirit unbinds the very ground from the curse — the creation set free with the children of Elohim.'),
  ('canon', 'romans', 8, 22, 'canon', 'isaiah', 11, 9, 'free', E'*They shall not hurt nor destroy in all my holy mountain: for the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea.* (Isaiah 11:9). *For we know that the whole creation groaneth and travaileth in pain together until now* (Romans 8:22). The travail of the whole creation strains toward the mountain where *they shall not hurt nor destroy,* where the earth is *full of the knowledge of Yahuah (LORD), as the waters cover the sea.* The groaning is birth-pain, not despair — the creation labouring toward the day the prophet promised, the manifestation of the sons.'),
  -- thread: romans-8-who-shall-lay-charge-who-condemneth-isaiah
  ('canon', 'romans', 8, 33, 'canon', 'isaiah', 50, 8, 'free', E'*He is near that justifieth me; who will contend with me? let us stand together: who is mine adversary? let him come near to me.* (Isaiah 50:8). *Who shall lay any thing to the charge of Elohim''s (God''s) elect? It is Elohim (God) that justifieth* (Romans 8:33). Paul presses the prophet''s own challenge: with Yahuah (LORD) *near that justifieth,* who dares contend? The adversary who would lay a charge is summoned to come near — and falls silent, for the One who justifies has spoken. The elect stand because Elohim himself is their justifier.'),
  ('canon', 'romans', 8, 34, 'canon', 'isaiah', 50, 9, 'free', E'*Behold, Adonai Yahuah (the Lord GOD) will help me; who is he that shall condemn me? lo, they all shall wax old as a garment; the moth shall eat them up.* (Isaiah 50:9). *Who is he that condemneth? It is Messiah (Christ) that died, yea rather, that is risen again, who is even at the right hand of Elohim (God), who also maketh intercession for us* (Romans 8:34). The prophet''s cry — *who is he that shall condemn me?* — is answered in the risen Messiah at the right hand, interceding. The condemners *wax old as a garment;* the One who died and rose abides to plead for his own. No condemnation stands where he is the advocate.'),
  -- thread: romans-8-for-thy-sake-we-are-killed-all-the-day-long-psalm-44
  ('canon', 'romans', 8, 36, 'canon', 'psalms', 44, 22, 'free', E'*Yea, for thy sake are we killed all the day long; we are counted as sheep for the slaughter.* (Psalm 44:22). *As it is written, For thy sake we are killed all the day long; we are accounted as sheep for the slaughter* (Romans 8:36). Paul quotes the psalm word for word. The suffering of the faithful is not a sign of separation from the love of Elohim but the very portion of those who belong to him — slain *for thy sake,* counted as sheep for the slaughter, yet held fast.'),
  ('canon', 'romans', 8, 35, 'canon', 'psalms', 44, 18, 'free', E'*Our heart is not turned back, neither have our steps declined from thy way;* (Psalm 44:18). *Who shall separate us from the love of Messiah (Christ)? shall tribulation, or distress, or persecution, or famine, or nakedness, or peril, or sword?* (Romans 8:35). The psalm Paul quotes names the slaughtered plainly: those whose *heart is not turned back, neither have our steps declined from thy way.* The sheep for the slaughter are the covenant-faithful walking in his way — not the lawless. Tribulation and sword fall on the faithful and cannot separate them; their steps had not declined, and the love of Messiah holds them through every peril.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-8-the-righteousness-of-the-law-fulfilled-in-us-by-the-spirit',
       E'The righteousness of the law fulfilled in us by the Spirit',
       E'This is the chapter most often turned into a weapon against the law, and the turning rests on misreading *who walk not after the flesh, but after the Spirit* (Romans 8:1) as freedom from the commandments. The chapter says the opposite. The Son was sent and sin was condemned in the flesh *that the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit* (Romans 8:4). The Spirit-walk is the law fulfilled, not the law set aside. And it is the carnal mind, not the Spirit, that stands against the commandments: *the carnal mind is enmity against Elohim (God): for it is not subject to the law of Elohim (God), neither indeed can be* (Romans 8:7). The flesh is the law''s enemy; the Spirit is its fulfilment. This is precisely the new covenant the prophets promised — not Torah abolished but Torah internalised: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). And the Spirit given is given to do this very thing: *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The Spirit who writes the law within is the Spirit who keeps it through the walker. The Spirit and the Torah are one work, never opposed.',
       sv.verse_id, ev.verse_id, 'free', 6175
  FROM _s219_r08_lookup sv, _s219_r08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=8 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-8-i-will-put-my-spirit-within-you-the-new-heart-that-walks',
       E'I will put my spirit within you — the new heart that walks',
       E'The indwelling Spirit of Romans 8 is the Spirit the prophets said Yahuah (LORD) would put within his people. *But if the Spirit of him that raised up Yahusha (Jesus) from the dead dwell in you, he that raised up Messiah (Christ) from the dead shall also quicken your mortal bodies by his Spirit that dwelleth in you* (Romans 8:11) — and Ezekiel had stood in the valley of dry bones and heard the same promise to the whole house of Yashar''el (Israel): *I will put my spirit in you, and ye shall live* (Ezekiel 37:14). The mortifying of the deeds of the body is the new heart at work: *if ye through the Spirit do mortify the deeds of the body, ye shall live* (Romans 8:13) — the heart of stone taken away, the heart of flesh given, *a new heart also will I give you, and a new spirit will I put within you* (Ezekiel 36:26). And to be *led by the Spirit of Elohim (God)* and so be *the sons of Elohim (God)* (Romans 8:14) is to be caused to *walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The leading, the new heart, the resurrection-life, and the walking in the statutes are one promise — the Spirit given precisely to bring the commandments to their doing.',
       sv.verse_id, ev.verse_id, 'free', 6178
  FROM _s219_r08_lookup sv, _s219_r08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=8 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-8-the-spirit-of-adoption-led-by-the-spirit-are-sons',
       E'The Spirit of adoption — led by the Spirit are sons',
       E'*For as many as are led by the Spirit of Elohim (God), they are the sons of Elohim (God)* (Romans 8:14); *ye have received the Spirit of adoption, whereby we cry, Abba, Father* (Romans 8:15); *and if children, then heirs; heirs of Elohim (God), and joint-heirs with Messiah (Christ)* (Romans 8:17). Paul says the same in his letter to the Galatians, and the order there is the framework''s own: *because ye are sons, Elohim (God) hath sent forth the Spirit of his Son into your hearts, crying, Abba, Father* (Galatians 4:6). The Spirit is sent *because* they are sons — he reveals the sonship that was already theirs, the scattered seed brought home to the Father who was always their Father. And the leading of this Spirit is no licence: *if ye be led of the Spirit, ye are not under the law* (Galatians 5:18) — lifted out from under the law''s condemnation and penalty, the son is set to keep the law from the heart, for the same Spirit who leads is the One who causes the walk in the statutes. Led by the Spirit, crying Abba, the heir walks as a son.',
       sv.verse_id, ev.verse_id, 'free', 6181
  FROM _s219_r08_lookup sv, _s219_r08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=8 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-8-the-whole-creation-groaneth-for-the-manifestation-of-the-sons',
       E'The whole creation groaneth for the manifestation of the sons',
       E'*For the earnest expectation of the creature waiteth for the manifestation of the sons of Elohim (God)* (Romans 8:19); *the creature was made subject to vanity, not willingly, but by reason of him who hath subjected the same in hope* (Romans 8:20); *the whole creation groaneth and travaileth in pain together until now* (Romans 8:22). The subjection of the creation to vanity is the curse spoken over Adam in the garden: *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17). The ground was bound to thorn and sorrow not for its own fault but by reason of the fall — subjected, yet in hope. And the hope is the restored creation the prophet saw under the root of Jesse: *the wolf also shall dwell with the lamb, and the leopard shall lie down with the kid … and a little child shall lead them* (Isaiah 11:6), the mountain where *they shall not hurt nor destroy … for the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea* (Isaiah 11:9). The groaning is birth-pain, not despair: *the creature itself also shall be delivered from the bondage of corruption into the glorious liberty of the children of Elohim (God)* (Romans 8:21). The same root of Jesse who fulfils the law by the Spirit will unbind the ground itself from the curse, and the creation labours toward that day — the manifestation of the sons.',
       sv.verse_id, ev.verse_id, 'free', 6184
  FROM _s219_r08_lookup sv, _s219_r08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=8 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-8-who-shall-lay-charge-who-condemneth-isaiah',
       E'Who shall lay a charge, who condemneth — the prophet''s challenge answered',
       E'*Who shall lay any thing to the charge of Elohim''s (God''s) elect? It is Elohim (God) that justifieth. Who is he that condemneth? It is Messiah (Christ) that died, yea rather, that is risen again, who is even at the right hand of Elohim (God), who also maketh intercession for us* (Romans 8:33-34). Paul is pressing the prophet''s own courtroom challenge. *He is near that justifieth me; who will contend with me? let us stand together: who is mine adversary? let him come near to me* (Isaiah 50:8) — with Yahuah (LORD) near to justify, the adversary who would lay a charge is summoned forward, and falls silent. *Behold, Adonai Yahuah (the Lord GOD) will help me; who is he that shall condemn me? lo, they all shall wax old as a garment; the moth shall eat them up* (Isaiah 50:9). The condemners wax old as a garment; the One who died and rose abides at the right hand, interceding for his own. There is therefore now no condemnation (Romans 8:1) — not because the law is silenced, but because the elect''s justifier is Elohim himself and their advocate is the risen Messiah.',
       sv.verse_id, ev.verse_id, 'free', 6187
  FROM _s219_r08_lookup sv, _s219_r08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=8 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-8-for-thy-sake-we-are-killed-all-the-day-long-psalm-44',
       E'For thy sake we are killed all the day long — Psalm 44',
       E'*Who shall separate us from the love of Messiah (Christ)? shall tribulation, or distress, or persecution, or famine, or nakedness, or peril, or sword?* (Romans 8:35). Paul answers with the psalm, quoted word for word: *As it is written, For thy sake we are killed all the day long; we are accounted as sheep for the slaughter* (Romans 8:36) — *Yea, for thy sake are we killed all the day long; we are counted as sheep for the slaughter* (Psalm 44:22). And the psalm names plainly who the slaughtered are: *our heart is not turned back, neither have our steps declined from thy way* (Psalm 44:18). The sheep for the slaughter are the covenant-faithful, those whose steps had not declined from his way — not the lawless. Suffering is no sign of separation from the love of Elohim; it is the very portion of those who belong to him and walk in his way. *Nay, in all these things we are more than conquerors through him that loved us* (Romans 8:37), and *neither death, nor life … nor any other creature, shall be able to separate us from the love of Elohim (God), which is in HaMashiach Yahusha (Christ Jesus) our Lord* (Romans 8:38-39). The faithful are slain and held fast at once — nothing severs them from his love.',
       sv.verse_id, ev.verse_id, 'free', 6190
  FROM _s219_r08_lookup sv, _s219_r08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=35
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=8 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-8-the-righteousness-of-the-law-fulfilled-in-us-by-the-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* the new covenant is Torah internalised, not abolished; the Spirit fulfils the very law he writes within (Romans 8:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-the-righteousness-of-the-law-fulfilled-in-us-by-the-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* the Spirit-walk Paul names is the Spirit causing the keeping of the statutes (Romans 8:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-the-righteousness-of-the-law-fulfilled-in-us-by-the-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:27 — *cause you to walk in my statutes, and ye shall keep my judgments, and do them* it is the carnal mind, not the Spirit, that *is not subject to the law of Elohim (God)* (Romans 8:7).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-the-righteousness-of-the-law-fulfilled-in-us-by-the-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-8-i-will-put-my-spirit-within-you-the-new-heart-that-walks
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:14 — *I will put my spirit in you, and ye shall live* the valley of dry bones: the indwelling Spirit quickens the mortal body (Romans 8:11).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-i-will-put-my-spirit-within-you-the-new-heart-that-walks'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:26 — *a new heart also will I give you … I will give you an heart of flesh* the mortifying of the deeds of the body through the Spirit is the new heart at work (Romans 8:13).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-i-will-put-my-spirit-within-you-the-new-heart-that-walks'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:27 — *cause you to walk in my statutes* to be led by the Spirit and be a son is to be caused to walk in the statutes (Romans 8:14).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-i-will-put-my-spirit-within-you-the-new-heart-that-walks'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-8-the-spirit-of-adoption-led-by-the-spirit-are-sons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 4:6 — *because ye are sons, Elohim (God) hath sent forth the Spirit of his Son into your hearts, crying, Abba, Father* the Spirit reveals the sonship already true, the scattered seed brought home (Romans 8:15).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-the-spirit-of-adoption-led-by-the-spirit-are-sons'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 5:18 — *if ye be led of the Spirit, ye are not under the law* led out from under the law''s sentence, the son is set to keep it from the heart — never freedom to transgress (Romans 8:14).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-the-spirit-of-adoption-led-by-the-spirit-are-sons'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-8-the-whole-creation-groaneth-for-the-manifestation-of-the-sons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:17 — *cursed is the ground for thy sake; in sorrow shalt thou eat of it* the creature subjected to vanity is the ground bound by the curse, in hope (Romans 8:20).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-the-whole-creation-groaneth-for-the-manifestation-of-the-sons'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:6 — *the wolf also shall dwell with the lamb … and a little child shall lead them* the deliverance of the creature from corruption is the restored creation under the root of Jesse (Romans 8:21).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-the-whole-creation-groaneth-for-the-manifestation-of-the-sons'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:9 — *they shall not hurt nor destroy in all my holy mountain … the earth shall be full of the knowledge of Yahuah (LORD)* the groaning is birth-pain straining toward that mountain (Romans 8:22).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-the-whole-creation-groaneth-for-the-manifestation-of-the-sons'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-8-who-shall-lay-charge-who-condemneth-isaiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 50:8 — *He is near that justifieth me; who will contend with me?* the adversary who would lay a charge is summoned forward and falls silent (Romans 8:33).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-who-shall-lay-charge-who-condemneth-isaiah'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=50 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 50:9 — *who is he that shall condemn me? lo, they all shall wax old as a garment* the condemners wax old; the risen Messiah at the right hand intercedes (Romans 8:34).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-who-shall-lay-charge-who-condemneth-isaiah'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=50 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-8-for-thy-sake-we-are-killed-all-the-day-long-psalm-44
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 44:22 — *for thy sake are we killed all the day long; we are counted as sheep for the slaughter* quoted word for word; suffering is the portion of those who belong to him (Romans 8:36).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-for-thy-sake-we-are-killed-all-the-day-long-psalm-44'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 44:18 — *our heart is not turned back, neither have our steps declined from thy way* the slaughtered sheep are the covenant-faithful, not the lawless; the love of Messiah holds them through every peril (Romans 8:35).'
  FROM cross_reference_threads t, cross_references x, _s219_r08_lookup sv, _s219_r08_lookup tv
 WHERE t.slug='romans-8-for-thy-sake-we-are-killed-all-the-day-long-psalm-44'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=8 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
