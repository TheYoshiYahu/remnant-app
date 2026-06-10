-- ----- fragment: minion_romans_06.sql (S219 Romans 6) -----
-- =====================================================================
-- S219 minion — ROMANS 6 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 6.  Tag: r06 (temp view _s219_r06_lookup).  Sort band: 6125, step 3 (<6150).
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Red Lines #4/#5/#6/#10): Romans 6 is the anti-license core of the epistle.
-- *Shall we continue in sin, that grace may abound? Elohim (God) forbid* (6:1-2); *shall we sin,
-- because we are not under the law, but under grace? Elohim (God) forbid* (6:15). "Not under the
-- law" (6:14) is NOT freedom to transgress — it is the believer no longer under the law's
-- condemnation/penalty as a justifying system; the curse-verdict of death no longer holds dominion
-- over the one made alive in Messiah. Grace is the MEANS OF RETURN to walking in obedience, never
-- a license against the commandments. The dead-to-sin / alive-unto-Elohim reckoning issues in
-- *servants of righteousness unto holiness* (6:16-22). The Tanakh roots of the new-heart, new-spirit
-- walk — *I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27),
-- *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33), the
-- choose-life of Deuteronomy 30 — are exactly the obedience-unto-holiness Paul names. The Master's
-- own *Whosoever committeth sin is the servant of sin* and *go, and sin no more* (John 8:34, 8:11)
-- are the NT root of the servant-of-sin teaching. *The wages of sin is death* (6:23) is Ezekiel's
-- *the soul that sinneth, it shall die* (18:4) and Deuteronomy's *life and death, blessing and
-- cursing: therefore choose life* (30:19) — the operative consequence-system, never annulled.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   shall we continue in sin / dead to sin  Tanakh: Ezekiel 18:30-31, Deuteronomy 30:19  Extras: none warranted  NT: John 8:11 (go, and sin no more)
--   v.3-5   baptized into his death / newness of life  Tanakh: Ezekiel 36:25 (sprinkle clean water)  Extras: none warranted  NT: Colossians 2:12 (buried with him in baptism, risen with him)
--   v.6-7   old man crucified / body of sin destroyed  Tanakh: none warranted  Extras: none warranted  NT: Galatians 2:20, Colossians 3:9-10 (put off the old man, put on the new)
--   v.8-11  dead with Messiah / alive unto Elohim     Tanakh: none added (carried at 6:3-5)  Extras: none warranted  NT: none added (carried at 6:3-5 baptism thread)
--   v.12-15 not under law but under grace / shall we sin  Tanakh: Ezekiel 18:21, Deuteronomy 30:8  Extras: none warranted  NT: John 8:34 (whosoever committeth sin is the servant of sin)
--   v.16-19 servants of righteousness unto holiness     Tanakh: Ezekiel 36:27, Jeremiah 31:33  Extras: none warranted  NT: John 8:36 (if the Son make you free, ye shall be free indeed)
--   v.20-23 wages of sin is death / gift is eternal life  Tanakh: Ezekiel 18:4, Deuteronomy 30:19  Extras: none warranted  NT: John 8:51 (if a man keep my saying, he shall never see death)
--
-- Extras: NONE warranted for Romans 6. The chapter's weave is Tanakh new-heart/choose-life roots
-- and the Master's own servant-of-sin teaching; no extra-canonical witness adds load-bearing weight
-- over those. (Curated, not a dump — "none warranted" recorded per the brief.)
--
-- THREADS (slug -> target libraries):
--   6125 romans-6-shall-we-continue-in-sin-that-grace-may-abound-god-forbid            (Tanakh + NT)
--   6128 romans-6-baptized-into-his-death-buried-and-raised-to-walk-in-newness-of-life (Tanakh + NT)
--   6131 romans-6-the-old-man-crucified-that-the-body-of-sin-might-be-destroyed        (NT)
--   6134 romans-6-not-under-the-law-but-under-grace-shall-we-sin-god-forbid            (Tanakh + NT)
--   6137 romans-6-servants-of-righteousness-unto-holiness-the-new-heart-walk          (Tanakh + NT)
--   6140 romans-6-the-wages-of-sin-is-death-but-the-gift-of-elohim-is-eternal-life     (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s219_r06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-6-shall-we-continue-in-sin-that-grace-may-abound-god-forbid
  ('canon', 'romans', 6, 2, 'canon', 'ezekiel', 18, 30, 'free', E'*Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* (Ezekiel 18:30). Paul answers his own question — *shall we continue in sin, that grace may abound?* (Romans 6:1) — with *Elohim (God) forbid. How shall we, that are dead to sin, live any longer therein?* (Romans 6:2). The prophet had already set the only true posture toward sin: not continuance under cover of mercy but *repent, and turn yourselves from all your transgressions.* Grace is the call to turn from iniquity, never the permission to abide in it.'),
  ('canon', 'romans', 6, 2, 'canon', 'ezekiel', 18, 31, 'free', E'*Cast away from you all your transgressions, whereby ye have transgressed; and make you a new heart and a new spirit: for why will ye die, O house of Yashar''el (Israel)?* (Ezekiel 18:31). To be *dead to sin* and to *live any longer therein* (Romans 6:2) are contraries — and the prophet names the same contradiction: the one given a new heart casts away his transgressions, for clinging to them is to choose death. *Why will ye die?* is Yahuah''s (the LORD''s) own answer to anyone who would continue in sin that grace might abound.'),
  ('canon', 'romans', 6, 2, 'canon', 'john', 8, 11, 'free', E'*She said, No man, Yahuah (Lord). And Yahusha (Jesus) said unto her, Neither do I condemn thee: go, and sin no more.* (John 8:11). The Master''s mercy to the woman is the very shape of Romans 6: the one not condemned is sent *to sin no more* — not loosed to continue. *How shall we, that are dead to sin, live any longer therein?* (Romans 6:2) unfolds what the King''s pardon already commanded; the grace that does not condemn is the grace that says sin no more.'),
  -- thread: romans-6-baptized-into-his-death-buried-and-raised-to-walk-in-newness-of-life
  ('canon', 'romans', 6, 4, 'canon', 'colossians', 2, 12, 'free', E'*Buried with him in baptism, wherein also ye are risen with him through the faith of the operation of Elohim (God), who hath raised him from the dead.* (Colossians 2:12). Paul says the same thing twice: *we are buried with him by baptism into death: that like as Messiah (Christ) was raised up from the dead by the glory of the Father, even so we also should walk in newness of life* (Romans 6:4). The burial and the rising are one passage — and the rising is unto a walk, *newness of life,* not a return to the old. Baptism is death to the old way and entrance on the new walk.'),
  ('canon', 'romans', 6, 4, 'canon', 'ezekiel', 36, 25, 'free', E'*Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you.* (Ezekiel 36:25). The cleansing water of the prophet stands behind the baptism Paul names: *we are buried with him by baptism into death … even so we also should walk in newness of life* (Romans 6:4). Yahuah (the LORD) promised to sprinkle clean water and cleanse from all filthiness — and the very next breath gives the new heart and the new spirit that walks in his statutes (Ezekiel 36:26-27). The washing is never an end in itself; it opens onto the new walk.'),
  ('canon', 'romans', 6, 5, 'canon', 'colossians', 3, 1, 'free', E'*If ye then be risen with Messiah (Christ), seek those things which are above, where Messiah (Christ) sitteth on the right hand of Elohim (God).* (Colossians 3:1). *For if we have been planted together in the likeness of his death, we shall be also in the likeness of his resurrection* (Romans 6:5). The likeness of his resurrection is no idle status — Paul makes it the ground of a command: those risen with Messiah seek the things above. To share his rising is to be set on a new course, the affection lifted from the old life to the life now hid with Messiah in Elohim (God).'),
  -- thread: romans-6-the-old-man-crucified-that-the-body-of-sin-might-be-destroyed
  ('canon', 'romans', 6, 6, 'canon', 'galatians', 2, 20, 'free', E'*I am crucified with Messiah (Christ): nevertheless I live; yet not I, but Messiah (Christ) liveth in me: and the life which I now live in the flesh I live by the faith of the Son of Elohim (God), who loved me, and gave himself for me.* (Galatians 2:20). *Our old man is crucified with him, that the body of sin might be destroyed, that henceforth we should not serve sin* (Romans 6:6). The crucifixion of the old man is not the end of living but the beginning of a new life — *nevertheless I live; yet not I, but Messiah (Christ) liveth in me.* The self that served sin is put to death precisely so that the Formed One who took on flesh may live his life in the believer, the life lived by the faithfulness of the Son of Elohim.'),
  ('canon', 'romans', 6, 6, 'canon', 'colossians', 3, 9, 'free', E'*Lie not one to another, seeing that ye have put off the old man with his deeds;* (Colossians 3:9). The *old man* who *is crucified with him, that the body of sin might be destroyed* (Romans 6:6) is the old man Paul elsewhere says is *put off* — and the putting off is concrete, naming the deeds laid down. The crucifixion of the old self is not an abstraction but the end of the old deeds: the lying, the wrath, the uncleanness left behind because the old man who did them is dead.'),
  ('canon', 'romans', 6, 6, 'canon', 'colossians', 3, 10, 'free', E'*And have put on the new man, which is renewed in knowledge after the image of him that created him:* (Colossians 3:10). *That henceforth we should not serve sin* (Romans 6:6) is the destination Paul names again as putting on *the new man, which is renewed … after the image of him that created him.* The old man crucified and the new man put on are one motion: the body of sin destroyed so that the renewed self, remade after the Creator''s image, walks no longer in the service of sin.'),
  -- thread: romans-6-not-under-the-law-but-under-grace-shall-we-sin-god-forbid
  ('canon', 'romans', 6, 15, 'canon', 'ezekiel', 18, 21, 'free', E'*But if the wicked will turn from all his sins that he hath committed, and keep all my statutes, and do that which is lawful and right, he shall surely live, he shall not die.* (Ezekiel 18:21). *Shall we sin, because we are not under the law, but under grace? Elohim (God) forbid* (Romans 6:15). To be under grace and not under the law''s condemnation is exactly the turning the prophet describes — the wicked who turns from his sins to *keep all my statutes, and do that which is lawful and right* and so lives. Grace does not loose the believer from the statutes; it is the mercy that turns him toward keeping them, that he may live and not die.'),
  ('canon', 'romans', 6, 14, 'canon', 'deuteronomy', 30, 8, 'free', E'*And thou shalt return and obey the voice of Yahuah (LORD), and do all his commandments which I command thee this day.* (Deuteronomy 30:8). *Sin shall not have dominion over you: for ye are not under the law, but under grace* (Romans 6:14). When the heart is circumcised and the captivity turned (Deuteronomy 30:6), the fruit is the return that *obeys the voice of Yahuah (LORD), and does all his commandments* — sin no longer reigning. Being under grace, freed from sin''s dominion, is the very state in which the commandments are kept, not the state in which they are discarded.'),
  ('canon', 'romans', 6, 15, 'canon', 'john', 8, 34, 'free', E'*Yahusha (Jesus) answered them, Verily, verily, I say unto you, Whosoever committeth sin is the servant of sin.* (John 8:34). The Master''s word exposes the lie behind *shall we sin, because we are not under the law, but under grace?* (Romans 6:15). The one who returns to sin does not enter freedom but bondage — *whosoever committeth sin is the servant of sin.* To sin under cover of grace is to crawl back under the very mastery grace delivered from; it is no liberty at all.'),
  -- thread: romans-6-servants-of-righteousness-unto-holiness-the-new-heart-walk
  ('canon', 'romans', 6, 16, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). *Being then made free from sin, ye became the servants of righteousness* (Romans 6:18) — and the service of righteousness is precisely the walk the prophet promised: the Spirit put within, causing the believer to *walk in my statutes,* to *keep my judgments, and do them.* The freedom from sin is freedom INTO obedience; the same Spirit who raises from sin''s death is the Spirit who writes and keeps the statutes in the walker.'),
  ('canon', 'romans', 6, 17, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). *Ye have obeyed from the heart that form of doctrine which was delivered you* (Romans 6:17). The obedience *from the heart* is the new-covenant promise come to pass: the law written in the inward parts, in the heart, so that obedience flows from within rather than from an outward yoke. The doctrine obeyed from the heart is the Torah inscribed there by the Spirit.'),
  ('canon', 'romans', 6, 18, 'canon', 'john', 8, 36, 'free', E'*If the Son therefore shall make you free, ye shall be free indeed.* (John 8:36). *Being then made free from sin, ye became the servants of righteousness* (Romans 6:18). The freedom the Son gives is not freedom from all service but freedom from sin into the service of righteousness — the only true freedom, for the alternative is bondage to sin (John 8:34). To be made free indeed by the Son is to be loosed from sin''s mastery and bound to righteousness unto holiness.'),
  -- thread: romans-6-the-wages-of-sin-is-death-but-the-gift-of-elohim-is-eternal-life
  ('canon', 'romans', 6, 23, 'canon', 'ezekiel', 18, 4, 'free', E'*Behold, all souls are mine; as the soul of the father, so also the soul of the son is mine: the soul that sinneth, it shall die.* (Ezekiel 18:4). *For the wages of sin is death; but the gift of Elohim (God) is eternal life through Yahusha HaMashiach (Jesus Christ) our Lord* (Romans 6:23). Paul''s *wages of sin is death* is the prophet''s standing verdict — *the soul that sinneth, it shall die.* The consequence-system is not annulled by grace; it stands. What grace adds is the gift set over against the wage: eternal life given through the Master, where sin earns only death.'),
  ('canon', 'romans', 6, 21, 'canon', 'deuteronomy', 30, 19, 'free', E'*I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* (Deuteronomy 30:19). *What fruit had ye then in those things whereof ye are now ashamed? for the end of those things is death* (Romans 6:21). The two ends Paul sets before his readers — death as the end of sin, everlasting life as the end of holiness (Romans 6:22) — are the very choice Moses laid before Yashar''el (Israel): *life and death, blessing and cursing: therefore choose life.* The gospel does not erase the two ways; it presses the same choice, that the seed may live.'),
  ('canon', 'romans', 6, 22, 'canon', 'john', 8, 51, 'free', E'*Verily, verily, I say unto you, If a man keep my saying, he shall never see death.* (John 8:51). *But now being made free from sin, and become servants to Elohim (God), ye have your fruit unto holiness, and the end everlasting life* (Romans 6:22). The Master had already named the end of the keeping walk: the one who keeps his saying *shall never see death.* The fruit unto holiness whose end is everlasting life is the keeping of the King''s word — life, not death, the portion of the servant of Elohim (God).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-6-shall-we-continue-in-sin-that-grace-may-abound-god-forbid',
       E'Shall we continue in sin, that grace may abound? Elohim (God) forbid',
       E'Romans 6 opens by slamming the door on the lie that grace licenses sin: *What shall we say then? Shall we continue in sin, that grace may abound? Elohim (God) forbid. How shall we, that are dead to sin, live any longer therein?* (Romans 6:1-2). The question is not idle — it is the very abuse the false gospel makes of grace, and Paul answers it with horror. The prophets had already set the only true posture toward sin: not continuance under cover of mercy but turning. *Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin* (Ezekiel 18:30); *cast away from you all your transgressions … and make you a new heart and a new spirit: for why will ye die, O house of Yashar''el (Israel)?* (Ezekiel 18:31). To be dead to sin and to go on living in it are contraries — and the one given a new heart casts his transgressions away, for clinging to them is to choose death. The Master himself gave the shape of grace in one sentence to the woman not condemned: *Neither do I condemn thee: go, and sin no more* (John 8:11). The grace that does not condemn is the grace that says sin no more. Mercy is the call to turn, never the permission to abide.',
       sv.verse_id, ev.verse_id, 'free', 6125
  FROM _s219_r06_lookup sv, _s219_r06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=6 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-6-baptized-into-his-death-buried-and-raised-to-walk-in-newness-of-life',
       E'Baptized into his death — buried and raised to walk in newness of life',
       E'Paul grounds the death-to-sin in baptism: *so many of us as were baptized into Yahusha HaMashiach (Jesus Christ) were baptized into his death* (Romans 6:3), *therefore we are buried with him by baptism into death: that like as Messiah (Christ) was raised up from the dead by the glory of the Father, even so we also should walk in newness of life* (Romans 6:4), *for if we have been planted together in the likeness of his death, we shall be also in the likeness of his resurrection* (Romans 6:5). The burial and the rising are one passage, and the rising is unto a walk — *newness of life* — never a return to the old. The prophet''s cleansing water stands behind the washing: *then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you* (Ezekiel 36:25), and the very next breath gives the new heart and the new spirit that walks in his statutes. Paul says the same thing twice elsewhere: *buried with him in baptism, wherein also ye are risen with him through the faith of the operation of Elohim (God)* (Colossians 2:12) — and the rising lays an obligation: *if ye then be risen with Messiah (Christ), seek those things which are above* (Colossians 3:1). The washing is never an end in itself; it is death to the old way and entrance on the new walk.',
       sv.verse_id, ev.verse_id, 'free', 6128
  FROM _s219_r06_lookup sv, _s219_r06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=6 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-6-the-old-man-crucified-that-the-body-of-sin-might-be-destroyed',
       E'The old man crucified — that the body of sin might be destroyed',
       E'*Knowing this, that our old man is crucified with him, that the body of sin might be destroyed, that henceforth we should not serve sin. For he that is dead is freed from sin* (Romans 6:6-7). The crucifixion of the old man is not the end of living but its beginning under a new master. Paul says it of himself: *I am crucified with Messiah (Christ): nevertheless I live; yet not I, but Messiah (Christ) liveth in me: and the life which I now live in the flesh I live by the faith of the Son of Elohim (God), who loved me, and gave himself for me* (Galatians 2:20). The self that served sin is put to death precisely so the Formed One who took on flesh may live his life in the believer. And the death is concrete, naming the deeds laid down: *seeing that ye have put off the old man with his deeds; and have put on the new man, which is renewed in knowledge after the image of him that created him* (Colossians 3:9-10). The old man crucified and the new man put on are one motion — the body of sin destroyed so the renewed self, remade after the Creator''s image, walks no longer in the service of sin.',
       sv.verse_id, ev.verse_id, 'free', 6131
  FROM _s219_r06_lookup sv, _s219_r06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-6-not-under-the-law-but-under-grace-shall-we-sin-god-forbid',
       E'Not under the law but under grace — shall we sin? Elohim (God) forbid',
       E'*Sin shall not have dominion over you: for ye are not under the law, but under grace* (Romans 6:14). The false gospel hears in this a license: *what then? shall we sin, because we are not under the law, but under grace? Elohim (God) forbid* (Romans 6:15). Paul recoils. To be *not under the law* is to be no longer under the law''s condemnation and death-penalty as a justifying system — not loosed to transgress. The prophet names the very turn that grace works: *if the wicked will turn from all his sins that he hath committed, and keep all my statutes, and do that which is lawful and right, he shall surely live, he shall not die* (Ezekiel 18:21). And Moses had named the fruit of the circumcised heart and the turned captivity: *thou shalt return and obey the voice of Yahuah (LORD), and do all his commandments which I command thee this day* (Deuteronomy 30:8) — sin no longer reigning, the commandments kept, not discarded. The Master exposes the lie behind the question: *Whosoever committeth sin is the servant of sin* (John 8:34). To sin under cover of grace is to crawl back under the very mastery grace delivered from; it is no liberty at all. Grace breaks sin''s dominion so that the freed walk in the statutes.',
       sv.verse_id, ev.verse_id, 'free', 6134
  FROM _s219_r06_lookup sv, _s219_r06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-6-servants-of-righteousness-unto-holiness-the-new-heart-walk',
       E'Servants of righteousness unto holiness — the new-heart walk',
       E'Freedom from sin in Romans 6 is freedom INTO obedience, never freedom from the standard: *to whom ye yield yourselves servants to obey, his servants ye are to whom ye obey; whether of sin unto death, or of obedience unto righteousness* (Romans 6:16); *being then made free from sin, ye became the servants of righteousness* (Romans 6:18); *yield your members servants to righteousness unto holiness* (Romans 6:19). This service of righteousness is precisely the walk the prophets promised. *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27) — the same Spirit who raises from sin''s death is the Spirit who keeps the statutes in the walker. The obedience Paul praises is *from the heart*: *ye have obeyed from the heart that form of doctrine which was delivered you* (Romans 6:17), the new-covenant promise come to pass — *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33), so obedience flows from within rather than from an outward yoke. And the Son who frees does not free into idleness but into this very service: *if the Son therefore shall make you free, ye shall be free indeed* (John 8:36) — loosed from sin''s mastery, bound to righteousness unto holiness.',
       sv.verse_id, ev.verse_id, 'free', 6137
  FROM _s219_r06_lookup sv, _s219_r06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=6 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-6-the-wages-of-sin-is-death-but-the-gift-of-elohim-is-eternal-life',
       E'The wages of sin is death — but the gift of Elohim (God) is eternal life',
       E'The chapter closes by setting the two ends side by side: *what fruit had ye then in those things whereof ye are now ashamed? for the end of those things is death* (Romans 6:21); *but now being made free from sin, and become servants to Elohim (God), ye have your fruit unto holiness, and the end everlasting life* (Romans 6:22); *for the wages of sin is death; but the gift of Elohim (God) is eternal life through Yahusha HaMashiach (Jesus Christ) our Lord* (Romans 6:23). The wage of sin is the prophet''s standing verdict, not annulled by grace: *the soul that sinneth, it shall die* (Ezekiel 18:4). The consequence-system stands; what grace adds is the gift set over against the wage. Moses had laid the same two ways before Yashar''el (Israel): *I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). And the Master named the end of the keeping walk: *if a man keep my saying, he shall never see death* (John 8:51). The gospel does not erase the two ways or the death that sin earns; it presses the same choice the Torah and the prophets pressed — and holds out the gift of eternal life through the Master to the one who chooses life and bears fruit unto holiness.',
       sv.verse_id, ev.verse_id, 'free', 6140
  FROM _s219_r06_lookup sv, _s219_r06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=6 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-6-shall-we-continue-in-sin-that-grace-may-abound-god-forbid
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 18:30 — *Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin* the only true posture toward sin is turning, not continuance under cover of grace (Romans 6:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-shall-we-continue-in-sin-that-grace-may-abound-god-forbid'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:31 — *make you a new heart and a new spirit: for why will ye die, O house of Yashar''el (Israel)?* the new-heart soul casts away transgressions; to cling to them is to choose death (Romans 6:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-shall-we-continue-in-sin-that-grace-may-abound-god-forbid'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:11 — *Neither do I condemn thee: go, and sin no more* the Master''s pardon sends to sin no more; the grace that does not condemn says sin no more (Romans 6:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-shall-we-continue-in-sin-that-grace-may-abound-god-forbid'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-6-baptized-into-his-death-buried-and-raised-to-walk-in-newness-of-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Colossians 2:12 — *buried with him in baptism, wherein also ye are risen with him* the burial and rising are one passage, the rising unto a new walk (Romans 6:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-baptized-into-his-death-buried-and-raised-to-walk-in-newness-of-life'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:25 — *then will I sprinkle clean water upon you, and ye shall be clean* the prophet''s cleansing water, opening onto the new heart and the statute-walk (Romans 6:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-baptized-into-his-death-buried-and-raised-to-walk-in-newness-of-life'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 3:1 — *if ye then be risen with Messiah (Christ), seek those things which are above* the likeness of his resurrection grounds a command: seek the things above (Romans 6:5).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-baptized-into-his-death-buried-and-raised-to-walk-in-newness-of-life'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-6-the-old-man-crucified-that-the-body-of-sin-might-be-destroyed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 2:20 — *I am crucified with Messiah (Christ): nevertheless I live; yet not I, but Messiah (Christ) liveth in me* the old self put to death so the Formed One may live his life in the believer (Romans 6:6).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-the-old-man-crucified-that-the-body-of-sin-might-be-destroyed'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Colossians 3:9 — *ye have put off the old man with his deeds* the crucified old man is the old man put off, the old deeds left behind (Romans 6:6).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-the-old-man-crucified-that-the-body-of-sin-might-be-destroyed'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 3:10 — *have put on the new man, which is renewed in knowledge after the image of him that created him* the renewed self walks no longer in the service of sin (Romans 6:6).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-the-old-man-crucified-that-the-body-of-sin-might-be-destroyed'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-6-not-under-the-law-but-under-grace-shall-we-sin-god-forbid
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 18:21 — *if the wicked will turn from all his sins … and keep all my statutes … he shall surely live* grace is the mercy that turns toward keeping the statutes, that he may live and not die (Romans 6:15).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-not-under-the-law-but-under-grace-shall-we-sin-god-forbid'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:8 — *thou shalt return and obey the voice of Yahuah (LORD), and do all his commandments* the fruit of the circumcised heart: sin no longer reigning, the commandments kept (Romans 6:14).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-not-under-the-law-but-under-grace-shall-we-sin-god-forbid'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:34 — *Whosoever committeth sin is the servant of sin* to sin under cover of grace is to crawl back under sin''s mastery; it is no liberty (Romans 6:15).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-not-under-the-law-but-under-grace-shall-we-sin-god-forbid'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-6-servants-of-righteousness-unto-holiness-the-new-heart-walk
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* the Spirit who frees from sin is the Spirit who keeps the statutes in the walker (Romans 6:16).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-servants-of-righteousness-unto-holiness-the-new-heart-walk'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* obedience from the heart is the Torah inscribed there by the Spirit (Romans 6:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-servants-of-righteousness-unto-holiness-the-new-heart-walk'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:36 — *if the Son therefore shall make you free, ye shall be free indeed* the Son frees not into idleness but into the service of righteousness unto holiness (Romans 6:18).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-servants-of-righteousness-unto-holiness-the-new-heart-walk'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-6-the-wages-of-sin-is-death-but-the-gift-of-elohim-is-eternal-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 18:4 — *the soul that sinneth, it shall die* the prophet''s standing verdict; the wage of sin is death, not annulled by grace (Romans 6:23).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-the-wages-of-sin-is-death-but-the-gift-of-elohim-is-eternal-life'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I have set before you life and death, blessing and cursing: therefore choose life* the same two ways Paul presses; the gospel does not erase the choice (Romans 6:21).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-the-wages-of-sin-is-death-but-the-gift-of-elohim-is-eternal-life'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:51 — *If a man keep my saying, he shall never see death* the fruit unto holiness whose end is everlasting life is the keeping of the King''s word (Romans 6:22).'
  FROM cross_reference_threads t, cross_references x, _s219_r06_lookup sv, _s219_r06_lookup tv
 WHERE t.slug='romans-6-the-wages-of-sin-is-death-but-the-gift-of-elohim-is-eternal-life'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=6 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
