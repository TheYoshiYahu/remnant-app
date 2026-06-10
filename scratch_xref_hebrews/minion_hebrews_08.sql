-- ----- fragment: minion_hebrews_08.sql (S222 Hebrews 8) -----
-- =====================================================================
-- S222 minion — HEBREWS 8 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 8.  Tag: h08 (temp view _s222_h08_lookup).  Sort band: 7950, step 1 (<= 7956).
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (the new-covenant chapter — handled with high care):
-- Hebrews 8 announces the superiority and finality of Messiah's priesthood and the covenant
-- RENEWED in him — NOT the abolition of the Torah. The earthly priests *serve unto the example
-- and shadow of heavenly things* (8:5); the sanctuary is the God-given copy of the heavenly
-- reality, made *according to the pattern shewed to thee in the mount* (8:5 / Exodus 25:40) —
-- real and pointing to its fulfilment, not a mistake corrected. The *better covenant* of *better
-- promises* (8:6) is defined word for word by Jeremiah 31:31-34, quoted in full at 8:8-12:
-- *I will put my laws into their mind, and write them in their hearts* (8:10). This is the SAME
-- Torah — now written on the mind and heart instead of on tablets of stone — with full
-- forgiveness and inward knowing; the change is INTERNALIZATION, not a different or abolished law.
-- It is the heart-circumcision the prophets foretold (Ezekiel 36:26-27; Deuteronomy 30:6), made
-- with the house of Yashar'el (Israel) AND the house of Yahudah (Judah) — the two houses, the
-- gathering. And 8:13 — *that which decayeth and waxeth old is ready to vanish away* — names the
-- old PRIESTLY and SACRIFICIAL administration (the Levitical mediation that could not perfect),
-- vanishing as the priesthood is changed (Hebrews 7:11-12) and the animal-sacrifice system is
-- taken away (Hebrews 10:9); the moral law/Torah is never annulled — its ordinances *depart not*
-- (Jeremiah 31:35-36).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   high priest, minister of the true tabernacle which Yahuah pitched
--           Tanakh: none added (carried at v.5)  Extras: none warranted  NT: none warranted
--   v.3-5   serve the example and shadow / make all things according to the pattern in the mount
--           Tanakh: Exodus 25:40 (the pattern in the mount), Exodus 25:9 (after the pattern of the tabernacle)
--           Extras: Wisdom of Solomon 9:8 (a resemblance of the holy tabernacle prepared from the beginning)
--           NT: Acts 7:44 (the tabernacle made according to the fashion Moses had seen)
--   v.6-7   mediator of a better covenant, established upon better promises / the first faulty
--           Tanakh: none added (the covenant defined at v.8-12)  Extras: none warranted  NT: none added (carried at v.8-12)
--   v.8-12  Jeremiah 31:31-34 quoted in full — the new covenant, laws written on mind and heart
--           Tanakh: Jeremiah 31:31, 31:33, 31:34 (the source text); Ezekiel 36:26, 36:27 (new heart, Spirit causes walking); Deuteronomy 30:6 (circumcise thine heart)
--           Extras: none warranted  NT: Hebrews 10:16 (the same covenant re-quoted — laws in hearts and minds)
--   v.13    a new covenant hath made the first old; that which waxeth old is ready to vanish away
--           Tanakh: Jeremiah 31:35 (the ordinances depart not from before me)
--           Extras: none warranted  NT: Hebrews 7:11, 7:12 (priesthood changed -> the law regulating it changed); Hebrews 10:9 (he taketh away the first -> the animal-sacrifice system)
--
-- THREADS (slug -> target libraries):
--   7950 hebrews-8-make-all-things-according-to-the-pattern-shewed-in-the-mount-exodus-25  (Tanakh + Extras + NT)
--   7951 hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31                          (Tanakh + NT)
--   7952 hebrews-8-the-first-made-old-ready-to-vanish-away                                   (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s222_h08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-8-make-all-things-according-to-the-pattern-shewed-in-the-mount-exodus-25
  ('canon', 'hebrews', 8, 5, 'canon', 'exodus', 25, 40, 'free', E'*And look that thou make them after their pattern, which was shewed thee in the mount.* (Exodus 25:40). The Hebrews writer quotes this charge word for word: the priests *serve unto the example and shadow of heavenly things, as Moses was admonished of Elohim (God) when he was about to make the tabernacle: for, See, saith he, that thou make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5). The earthly sanctuary is not a human invention nor a mistake to be discarded; it is the God-given copy of a heavenly reality, made by direct command after a pattern Moses was shown. The shadow is real and it points — to the heavenly things it was drawn from.'),
  ('canon', 'hebrews', 8, 5, 'canon', 'exodus', 25, 9, 'free', E'*According to all that I shew thee, after the pattern of the tabernacle, and the pattern of all the instruments thereof, even so shall ye make it.* (Exodus 25:9). Before the single charge of the mount, Yahuah (LORD) gives the whole principle: every part of the sanctuary is built *after the pattern* he shews. So when Hebrews calls the priests servants of *the example and shadow of heavenly things* (Hebrews 8:5), it is naming what Exodus already declared — the tabernacle and all its instruments are the copy of a heavenly original, framed by Yahuah''s (LORD''s) own shewing, that he might dwell among his people.'),
  ('canon', 'hebrews', 8, 5, 'canon', 'acts', 7, 44, 'free', E'*Our fathers had the tabernacle of witness in the wilderness, as he had appointed, speaking unto Moses, that he should make it according to the fashion that he had seen.* (Acts 7:44). Stephen, standing before the council, names the same heavenly pattern Hebrews names: the tabernacle was made *according to the fashion that he had seen* — shown, appointed, copied from above. Where Hebrews says *make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5), Stephen says the fathers built it by the fashion Moses *had seen.* Two witnesses to one truth: the sanctuary is the God-appointed copy of the heavenly reality.'),
  ('canon', 'hebrews', 8, 5, 'apocrypha', 'the-wisdom-of-solomon', 9, 8, 'extras', E'*You have commanded me to build a temple upon your holy mount, and an altar in the city in which you dwellest, a resemblance of the holy tabernacle, which you have prepared from the beginning.* (Wisdom of Solomon 9:8). The temple itself is confessed to be *a resemblance of the holy tabernacle, which you have prepared from the beginning* — a heavenly original prepared before the earthly copy was ever framed. This is precisely what Hebrews means by *the example and shadow of heavenly things* (Hebrews 8:5): the earthly sanctuary resembles a holy tabernacle that already stood in heaven, real and prior, the pattern the builder was commanded to follow.'),
  -- thread: hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31
  ('canon', 'hebrews', 8, 8, 'canon', 'jeremiah', 31, 31, 'free', E'*Behold, the days come, saith Yahuah (LORD), that I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah):* (Jeremiah 31:31). Hebrews quotes the prophet directly: *Behold, the days come, saith Yahuah (Lord), when I will make a new covenant with the house of Yashar''el (Israel) and with the house of Yahudah (Judah)* (Hebrews 8:8). The covenant is *new,* and it is made with the two houses named together — Yashar''el (Israel) and Yahudah (Judah), the northern and the southern house — the gathering of the whole covenant people the prophet foretold, not the founding of a different people.'),
  ('canon', 'hebrews', 8, 10, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). This is the defining clause, and Hebrews quotes it: *I will put my laws into their mind, and write them in their hearts: and I will be to them a Elohim (God), and they shall be to me a people* (Hebrews 8:10). The new covenant is the SAME law — *my law,* *my laws* — now moved from tablets of stone into the mind and the heart. The change is the place of the writing, not the content of the law: internalization, not abolition. Torah written within is still Torah.'),
  ('canon', 'hebrews', 8, 11, 'canon', 'jeremiah', 31, 34, 'free', E'*And they shall teach no more every man his neighbour, and every man his brother, saying, Know Yahuah (LORD): for they shall all know me, from the least of them unto the greatest of them, saith Yahuah (LORD): for I will forgive their iniquity, and I will remember their sin no more.* (Jeremiah 31:34). Hebrews carries the promise whole: *they shall all know me, from the least to the greatest. For I will be merciful to their unrighteousness, and their sins and their iniquities will I remember no more* (Hebrews 8:11-12). The new covenant brings two gifts the old administration could not finally give: an inward knowing of Yahuah (LORD) in every heart, and full forgiveness — the sin remembered no more. This is mercy completing the law written within, not mercy replacing the law.'),
  ('canon', 'hebrews', 8, 10, 'canon', 'ezekiel', 36, 26, 'free', E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26). To *write* the laws *in their hearts* (Hebrews 8:10) the heart must first be remade. Ezekiel names the very gift: the stony heart taken away, a heart of flesh given. The new covenant''s writing of the Torah within is this new heart at work — the surface that can hold the law inscribed, the heart-circumcision the prophets foretold.'),
  ('canon', 'hebrews', 8, 10, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). The companion promise to the law written in the heart (Hebrews 8:10) is the Spirit put within who *causes* the walking: *cause you to walk in my statutes, and ye shall keep my judgments, and do them.* The new covenant does not lift the statutes off the people; it puts the Spirit within so that the statutes are at last kept and done. Law written within, Spirit working it out — one promise, the same Torah brought to its doing.'),
  ('canon', 'hebrews', 8, 10, 'canon', 'deuteronomy', 30, 6, 'free', E'*And Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, that thou mayest live.* (Deuteronomy 30:6). The promise to *write* the law *in their hearts* (Hebrews 8:10) was already spoken by Moses as a circumcision of the heart — Yahuah Elohayka (the LORD thy God) himself cutting away what resists, that the people would love him and live. The new covenant is the keeping of this ancient promise: the heart made able to love and obey from within, the same Torah the heart is circumcised to keep.'),
  ('canon', 'hebrews', 8, 10, 'canon', 'hebrews', 10, 16, 'free', E'*This is the covenant that I will make with them after those days, saith Yahuah (Lord), I will put my laws into their hearts, and in their minds will I write them;* (Hebrews 10:16). The writer quotes the same Jeremiah clause a second time, sealing the reading: the covenant''s heart is *I will put my laws into their hearts, and in their minds will I write them.* What 8:10 announces, 10:16 confirms — the new covenant is the law written within, said twice so it cannot be missed. The laws are kept; only the tablet has changed, from stone to the mind and heart.'),
  -- thread: hebrews-8-the-first-made-old-ready-to-vanish-away
  ('canon', 'hebrews', 8, 13, 'canon', 'hebrews', 7, 11, 'free', E'*If therefore perfection were by the Levitical priesthood, (for under it the people received the law,) what further need was there that another priest should rise after the order of Melek Tsadiq (Melchizedek), and not be called after the order of Aaron?* (Hebrews 7:11). When 8:13 says *he hath made the first old,* the first is what chapter 7 has just named: the Levitical priesthood that could not bring perfection. The thing made old and ready to vanish is the priestly mediation through Aaron''s line — superseded by the priest after the order of Melek Tsadiq (Melchizedek) — not the moral law given to the people.'),
  ('canon', 'hebrews', 8, 13, 'canon', 'hebrews', 7, 12, 'free', E'*For the priesthood being changed, there is made of necessity a change also of the law.* (Hebrews 7:12). The change behind 8:13''s *waxeth old* is named here: *the priesthood being changed.* And the law that changes with it is the law regulating the priesthood and the altar — which tribe may serve — for the priest now arises out of Yahudah (Judah) after the order of Melek Tsadiq (Melchizedek). It is the administration of the priesthood that is altered and made old, never the Torah of righteousness written on the heart.'),
  ('canon', 'hebrews', 8, 13, 'canon', 'hebrews', 10, 9, 'free', E'*Then said he, Lo, I come to do thy will, O Elohim (God). He taketh away the first, that he may establish the second.* (Hebrews 10:9). What 8:13 calls *the first* made old, chapter 10 says he *taketh away* — and names exactly what it is: the system of animal sacrifice that *can never take away sins* (Hebrews 10:11), taken away so that the once-for-all offering of the body of Messiah (Christ) may be established in its place. The vanishing is the sacrificial administration fulfilled and superseded, not the law annulled.'),
  ('canon', 'hebrews', 8, 13, 'canon', 'jeremiah', 31, 35, 'free', E'*Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night, which divideth the sea when the waves thereof roar; Yahuah Tseva''ot (LORD of hosts) is his name:* (Jeremiah 31:35). The same prophet whose new-covenant promise Hebrews quotes guards it against any reading that the law could be cast off. In the very next breath Jeremiah binds Yahuah''s (LORD''s) ordinances to the fixed order of sun, moon, and stars: *if those ordinances depart from before me … then the seed of Yashar''el (Israel) also shall cease from being a nation before me for ever* (Jeremiah 31:36). The covenant''s *first* made old in Hebrews 8:13 is the priestly administration; the prophet who gave the new covenant swears its ordinances do not depart.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-8-make-all-things-according-to-the-pattern-shewed-in-the-mount-exodus-25',
       E'Make all things according to the pattern shewed thee in the mount',
       E'The high priest of Hebrews is *a minister of the sanctuary, and of the true tabernacle, which Yahuah (Lord) pitched, and not man* (Hebrews 8:2); the earthly priests *serve unto the example and shadow of heavenly things, as Moses was admonished of Elohim (God) when he was about to make the tabernacle: for, See, saith he, that thou make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5). The writer is quoting Yahuah''s (LORD''s) own charge at Sinai word for word: *And look that thou make them after their pattern, which was shewed thee in the mount* (Exodus 25:40), the charge that crowns the whole instruction given *after the pattern of the tabernacle, and the pattern of all the instruments thereof* (Exodus 25:9). The sanctuary is no human contrivance and no error to be discarded; it is the God-given copy of a heavenly reality, framed by direct command after a pattern Moses was shown. Stephen confessed the same before the council — the fathers had *the tabernacle of witness in the wilderness, as he had appointed, speaking unto Moses, that he should make it according to the fashion that he had seen* (Acts 7:44) — and Solomon''s prayer over the temple confessed it too: it was *a resemblance of the holy tabernacle, which you have prepared from the beginning* (Wisdom of Solomon 9:8). A holy tabernacle stood in heaven first; the earthly one is its faithful copy, real and pointing to the heavenly things it was drawn from — fulfilled, not corrected, in the minister of the true tabernacle which Yahuah (Lord) pitched.',
       sv.verse_id, ev.verse_id, 'extras', 7950
  FROM _s222_h08_lookup sv, _s222_h08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=8 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31',
       E'I will write my laws in their hearts — the new covenant of Jeremiah 31',
       E'This is the chapter the inherited reading turns into a proof that the law was set aside, and the turning rests on the words *new covenant* and *better.* Read the text and the opposite stands. The mediator of *a better covenant, which was established upon better promises* (Hebrews 8:6) defines that covenant by quoting Jeremiah in full: *Behold, the days come, saith Yahuah (Lord), when I will make a new covenant with the house of Yashar''el (Israel) and with the house of Yahudah (Judah)* (Hebrews 8:8) — the two houses named together, the northern and the southern house gathered, exactly as the prophet said: *Behold, the days come, saith Yahuah (LORD), that I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah)* (Jeremiah 31:31). And the defining clause is not the abolition of the law but its relocation: *I will put my laws into their mind, and write them in their hearts: and I will be to them a Elohim (God), and they shall be to me a people* (Hebrews 8:10), word for word from *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). It is *my law,* *my laws* — the SAME Torah, moved from tablets of stone into the mind and the heart. The change is the place of the writing, not the content of the law. This is the heart-circumcision the prophets foretold: a heart remade to hold it — *a new heart also will I give you, and a new spirit will I put within you … and I will give you an heart of flesh* (Ezekiel 36:26) — and a Spirit put within to keep it — *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27) — the very circumcision Moses promised: *Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart* (Deuteronomy 30:6). With it come the inward knowing and the full forgiveness the old administration could not finally give: *they shall all know me, from the least to the greatest. For I will be merciful to their unrighteousness, and their sins and their iniquities will I remember no more* (Hebrews 8:11-12; Jeremiah 31:34). And the writer quotes the clause a second time to seal it — *I will put my laws into their hearts, and in their minds will I write them* (Hebrews 10:16) — so it cannot be mistaken. The new covenant is the law written within, mercy completing it, the same Torah brought home to the heart.',
       sv.verse_id, ev.verse_id, 'free', 7951
  FROM _s222_h08_lookup sv, _s222_h08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=8 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-8-the-first-made-old-ready-to-vanish-away',
       E'The first made old, ready to vanish away — what waxeth old is the priestly administration',
       E'*In that he saith, A new covenant, he hath made the first old. Now that which decayeth and waxeth old is ready to vanish away* (Hebrews 8:13). Read alone and against the framework, this verse is made to say the Torah itself decayed and vanished. Read with the argument the writer has been building, it says nothing of the kind. The *first* made old is what chapter 7 has just named: *If therefore perfection were by the Levitical priesthood, (for under it the people received the law,) what further need was there that another priest should rise after the order of Melek Tsadiq (Melchizedek), and not be called after the order of Aaron?* (Hebrews 7:11) — the priestly mediation through Aaron''s line that could not bring perfection. And the law that changes with it is named precisely: *For the priesthood being changed, there is made of necessity a change also of the law* (Hebrews 7:12) — the law regulating who may serve at the altar, for the priest now arises out of Yahudah (Judah). Chapter 10 says the same of the sacrificial side: *He taketh away the first, that he may establish the second* (Hebrews 10:9) — the system of animal sacrifice that *can never take away sins,* taken away so the once-for-all offering of the body of Messiah (Christ) may stand in its place. What waxeth old and vanishes is the old priestly and sacrificial administration, fulfilled and superseded in the priest after the order of Melek Tsadiq (Melchizedek). It is never the moral law annulled — for the very prophet who gave the new covenant swore its ordinances do not depart: Yahuah (LORD) *which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night* (Jeremiah 31:35) declares that only if *those ordinances depart from before me … then the seed of Yashar''el (Israel) also shall cease from being a nation before me for ever* (Jeremiah 31:36). The administration of mediation is made old; the covenant is renewed with the law written on the heart, and its ordinances stand.',
       sv.verse_id, ev.verse_id, 'free', 7952
  FROM _s222_h08_lookup sv, _s222_h08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=8 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-8-make-all-things-according-to-the-pattern-shewed-in-the-mount-exodus-25
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 25:40 — *thou make them after their pattern, which was shewed thee in the mount* the charge Hebrews quotes word for word; the sanctuary is the copy of a heavenly original (Hebrews 8:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-make-all-things-according-to-the-pattern-shewed-in-the-mount-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 25:9 — *after the pattern of the tabernacle, and the pattern of all the instruments thereof* the whole sanctuary built after the heavenly pattern, the *example and shadow of heavenly things* (Hebrews 8:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-make-all-things-according-to-the-pattern-shewed-in-the-mount-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:44 — *according to the fashion that he had seen* Stephen''s witness to the same heavenly pattern Hebrews names (Hebrews 8:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-make-all-things-according-to-the-pattern-shewed-in-the-mount-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 9:8 — *a resemblance of the holy tabernacle, which you have prepared from the beginning* the heavenly tabernacle stood first; the earthly is its resemblance (Hebrews 8:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-make-all-things-according-to-the-pattern-shewed-in-the-mount-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:31 — *a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah)* the two houses named together; the source text Hebrews quotes (Hebrews 8:8).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* the defining clause: the SAME Torah, moved to the heart, not abolished (Hebrews 8:10).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:26 — *a new heart also will I give you … I will give you an heart of flesh* the heart remade to hold the law written within (Hebrews 8:10).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* the Spirit put within to keep the statutes; the law written within brought to its doing (Hebrews 8:10).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 30:6 — *Yahuah Elohayka (the LORD thy God) will circumcise thine heart* the heart-circumcision Moses promised; the same gift the new covenant fulfils (Hebrews 8:10).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jeremiah 31:34 — *they shall all know me, from the least … their sin no more* the inward knowing and full forgiveness the new covenant brings (Hebrews 8:11-12).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Hebrews 10:16 — *I will put my laws into their hearts, and in their minds will I write them* the same Jeremiah clause re-quoted, sealing the reading (Hebrews 8:10).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-8-the-first-made-old-ready-to-vanish-away
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 7:11 — *if perfection were by the Levitical priesthood* the *first* made old is the Aaronic priestly mediation that could not perfect (Hebrews 8:13).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-the-first-made-old-ready-to-vanish-away'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 7:12 — *the priesthood being changed, there is made … a change also of the law* the law that changes is the one regulating who serves at the altar (Hebrews 8:13).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-the-first-made-old-ready-to-vanish-away'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 10:9 — *He taketh away the first, that he may establish the second* the *first* taken away is the animal-sacrifice system, not the Torah (Hebrews 8:13).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-the-first-made-old-ready-to-vanish-away'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 31:35 — *the ordinances of the moon and of the stars* the prophet who gave the new covenant swears its ordinances do not depart (Jeremiah 31:36; Hebrews 8:13).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-the-first-made-old-ready-to-vanish-away'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
