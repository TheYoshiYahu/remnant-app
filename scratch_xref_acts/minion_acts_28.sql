-- ----- fragment: minion_acts_28.sql (S217 Acts 28) -----
-- =====================================================================
-- S217 minion — ACTS 28 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ACTS 28 (the closing chapter of Acts). Tag: a28 (temp view _s217_a28_lookup).
-- Sort band: 5950-5965 (base 5950, step 3).
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- WATCHPOINTS (HIGHEST IN THE BOOK — Red Lines #7/#11, Christology, son-of-Adam):
--  * The Isaiah-6 / Romans-11 closing prophecy (28:25-28): the judicial blindness is IN PART
--    and FOR A SEASON — *blindness in part is happened to Yashar'el (Israel), until the fulness
--    of the Gentiles be come in* (Romans 11:25) — NEVER permanent rejection, NEVER replacement.
--    *And so all Yashar'el (Israel) shall be saved* (Romans 11:26) is the closing word over any
--    Romans-11 / Isaiah-6 weave. The hardening is the husbandry that scatters the seed so the
--    dispersed might be gathered — the remnant according to the election of grace remains.
--  * "The salvation of Elohim (God) is sent unto the Gentiles" (28:28): read as the scattered
--    seed / the dispersed of Yashar'el among the nations who WILL hear — the servant's light to
--    the nations within the restoration (Isaiah 49:6), the provoking-to-jealousy that gathers
--    (Romans 11:11), the ends of the earth seeing the salvation of the house of Yashar'el
--    (Psalms 98:2-3). NOT a graft of non-seed by confession; NOT the replacement of Yashar'el
--    by a new people. Paired with the deafness-in-part so the verse is never a supersessionist
--    proof-text.
--  * "The hope of Yashar'el (Israel)" (28:20) = the twelve-tribe restoration hope — *He that
--    scattered Yashar'el (Israel) will gather him* (Jeremiah 31:10), the two sticks made one
--    nation (Ezekiel 37:21-22). Not a generic afterlife hope; the prophetic ingathering.
--  * Yahusha proved *both out of the law of Moses, and out of the prophets* (28:23) = the
--    Tanakh's own Messiah, the whole witness the risen One opened on the Emmaus road
--    (Luke 24:27,44). Not a new religion; the law and the prophets read aright.
--  * The viper (28:3-6): the serpent fastens and is shaken into the fire, no harm — the enmity
--    of Genesis 3:15, the treading on serpents of Luke 10:19 / Psalms 91:13, the sign of
--    Mark 16:18. Christology held: the One who gave the power to tread is the Formed who came
--    in the flesh; the servant who bore our griefs (Isaiah 53:4) is the healer at Publius's bed.
--  * Grace / sola-fide: Acts 28 does not carry a *saved by grace* formula; no Red Line #10
--    surface here. The kingdom of Elohim (God) preached open-ended (28:31) is the gathering
--    proclaimed, no man forbidding.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 28:
--   v.1-2   Melita / barbarous kindness  Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative landing)
--   v.3-6   the viper shaken into fire   Tanakh: Genesis 3:15, Psalms 91:13  Extras: none warranted  NT: Luke 10:19, Mark 16:18
--   v.7-9   Publius's father healed      Tanakh: Isaiah 53:4 (the servant bore our griefs — the healer)  Extras: none warranted  NT: none added (laying-on-of-hands carried in the Acts/gospel healing threads, not re-added)
--   v.10-16 Syracuse->Rome / brethren    Tanakh: none warranted  Extras: none warranted  NT: none warranted (travel narrative; took courage)
--   v.17-19 called the chief Yahudim     Tanakh: none warranted  Extras: none warranted  NT: none warranted (apologia narrative)
--   v.20    the hope of Yashar'el        Tanakh: Jeremiah 14:8, Jeremiah 31:10, Ezekiel 37:21, Ezekiel 37:22  Extras: none warranted  NT: none added
--   v.21-22 this sect spoken against     Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.23    out of Moses and the prophets Tanakh: none added (the whole-Tanakh witness carried via Luke 24 NT targets)  Extras: none warranted  NT: Luke 24:27, Luke 24:44
--   v.24    some believed, some not      Tanakh: none warranted  Extras: none warranted  NT: none warranted (carried into the blindness-in-part thread, v.25-27)
--   v.25-27 Isaiah 6 closing prophecy    Tanakh: Isaiah 6:9, Isaiah 6:10  Extras: none warranted  NT: Romans 11:7, Romans 11:8, Romans 11:25
--   v.28    salvation sent to the nations Tanakh: Isaiah 49:6, Psalms 98:3  Extras: none warranted  NT: Romans 11:11
--   v.29    departed / great reasoning   Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.30-31 two years, kingdom preached  Tanakh: none warranted  Extras: none warranted  NT: none warranted (open-ended close; kingdom-of-Elohim carried throughout Acts)
--
-- THREADS (slug -> target libraries):
--   5950 acts-28-the-viper-on-his-hand-the-serpent-shaken-into-the-fire        (Tanakh + NT)
--   5953 acts-28-the-hope-of-yasharel-bound-with-this-chain                    (Tanakh)
--   5956 acts-28-yahusha-proved-both-out-of-moses-and-out-of-the-prophets      (NT, Acts<->Luke)
--   5959 acts-28-hearing-ye-shall-hear-the-blindness-in-part-for-a-season      (Tanakh + NT)
--   5962 acts-28-the-salvation-of-god-sent-the-dispersed-gathered-not-replaced (Tanakh + NT)
--   5965 acts-28-he-bore-our-griefs-the-laying-on-of-hands-and-the-healer      (Tanakh)
--
-- ON THE "FOR YOSHI'S BLESSING" LIST: Acts 28 closes the book on the Isaiah-6 / Romans-11
-- blindness-in-part-for-a-season reading and the salvation-to-the-nations-as-gathering
-- (not replacement) framing — the highest-risk verses in Acts handled per Red Lines #7/#11.
-- =====================================================================

CREATE TEMP VIEW _s217_a28_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-28-the-viper-on-his-hand-the-serpent-shaken-into-the-fire
  ('canon', 'acts', 28, 3, 'canon', 'genesis', 3, 15, 'free', E'*And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). When *there came a viper out of the heat, and fastened on his hand* (Acts 28:3), the oldest enmity reaches for the heel and finds no purchase. The serpent struck the heel in the garden, but the seed of the woman bruises the head — and the servant who walks in the One who crushed the serpent shakes the viper off and feels no harm.'),
  ('canon', 'acts', 28, 5, 'canon', 'psalms', 91, 13, 'free', E'*Thou shalt tread upon the lion and adder: the young lion and the dragon shalt thou trample under feet.* (Psalms 91:13). *And he shook off the beast into the fire, and felt no harm* (Acts 28:5). The promise of the psalm is enacted on the shore of Melita: the adder is trodden, the venomous beast shaken into the flame, and the one who dwells in the secret place is not hurt. The serpent''s bite cannot fasten where the Most High is the refuge.'),
  ('canon', 'acts', 28, 5, 'canon', 'luke', 10, 19, 'free', E'*Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you.* (Luke 10:19). The word the Master spoke is shown true on the island: *he shook off the beast into the fire, and felt no harm* (Acts 28:5). The power to tread on serpents was given by the One who beheld Satan fall as lightning, and the viper that fastened on the hand by no means hurts the servant who carries that word.'),
  ('canon', 'acts', 28, 5, 'canon', 'mark', 16, 18, 'free', E'*They shall take up serpents; and if they drink any deadly thing, it shall not hurt them; they shall lay hands on the sick, and they shall recover.* (Mark 16:18). The sign the Master named follows: the serpent is taken up and shaken into the fire and does not hurt him (Acts 28:5), and in the next breath Paul *laid his hands on him, and healed him* (Acts 28:8). The serpent harmless and the sick recovered — both signs of the one word, worked on Melita.'),
  -- thread: acts-28-the-hope-of-yasharel-bound-with-this-chain
  ('canon', 'acts', 28, 20, 'canon', 'jeremiah', 14, 8, 'free', E'*O the hope of Yashar''el (Israel), the saviour thereof in time of trouble, why shouldest thou be as a stranger in the land, and as a wayfaring man that turneth aside to tarry for a night?* (Jeremiah 14:8). Paul names the very thing the prophet named: *for the hope of Yashar''el (Israel) I am bound with this chain* (Acts 28:20). The hope of Yashar''el is not a private hope of one man''s afterlife — it is the Saviour of the whole house in the time of trouble, the One the prophet pleaded would not remain a stranger. For that hope Paul wears the chain.'),
  ('canon', 'acts', 28, 20, 'canon', 'jeremiah', 31, 10, 'free', E'*Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock.* (Jeremiah 31:10). The *hope of Yashar''el (Israel)* for which Paul is bound (Acts 28:20) is this declared word: the One who scattered the house will gather it again and keep it as a shepherd keeps the flock. The hope is the ingathering of the scattered seed, proclaimed even in the isles afar off — the very isles where the prisoner''s ship had wintered.'),
  ('canon', 'acts', 28, 20, 'canon', 'ezekiel', 37, 21, 'free', E'*And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* (Ezekiel 37:21). The *hope of Yashar''el (Israel)* (Acts 28:20) is the promise of the dry-bones valley and the two sticks: the children of Yashar''el taken from among the nations where they were scattered and gathered on every side. The hope Paul is chained for is the twelve-tribe ingathering the prophet was shown.'),
  ('canon', 'acts', 28, 20, 'canon', 'ezekiel', 37, 22, 'free', E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* (Ezekiel 37:22). The *hope of Yashar''el (Israel)* (Acts 28:20) reaches its end here: the two houses — Yahudah and Yosef, the two sticks — made one nation under one king, divided no more. This is the restoration the prisoner''s chain bears witness to: not Yahudah alone, but all twelve tribes made one.'),
  -- thread: acts-28-yahusha-proved-both-out-of-moses-and-out-of-the-prophets
  ('canon', 'acts', 28, 23, 'canon', 'luke', 24, 27, 'free', E'*And beginning at Moses and all the prophets, he expounded unto them in all the scriptures the things concerning himself.* (Luke 24:27). From morning till evening Paul *expounded and testified the kingdom of Elohim (God), persuading them concerning Yahusha (Jesus), both out of the law of Moses, and out of the prophets* (Acts 28:23). It is the same opening the risen One worked on the Emmaus road — beginning at Moses and all the prophets, the whole Tanakh testifying of him. Paul does in Rome what his Master did on the road: he proves Yahusha from the law and the prophets that were always speaking of him.'),
  ('canon', 'acts', 28, 23, 'canon', 'luke', 24, 44, 'free', E'*And he said unto them, These are the words which I spake unto you, while I was yet with you, that all things must be fulfilled, which were written in the law of Moses, and in the prophets, and in the psalms, concerning me.* (Luke 24:44). Paul persuades them concerning Yahusha *both out of the law of Moses, and out of the prophets, from morning till evening* (Acts 28:23) — the very witness the Master named: the law of Moses, the prophets, and the psalms, all fulfilled concerning him. The Messiah is not proved from a new book but from the whole Tanakh read aright.'),
  -- thread: acts-28-hearing-ye-shall-hear-the-blindness-in-part-for-a-season
  ('canon', 'acts', 28, 26, 'canon', 'isaiah', 6, 9, 'free', E'*And he said, Go, and tell this people, Hear ye indeed, but understand not; and see ye indeed, but perceive not.* (Isaiah 6:9). Paul speaks the one word the Ruach HaKodesh (Holy Spirit) gave Esaias: *Saying, Go unto this people, and say, Hearing ye shall hear, and shall not understand; and seeing ye shall see, and not perceive* (Acts 28:26). The same commission the prophet received in the year king Uzziah died is spoken now in Rome — the hearing that does not understand, a hardness that is judicial, but never the end of the prophet''s own people; the same vision ends with a *tenth* that returns, the holy seed in the stump.'),
  ('canon', 'acts', 28, 27, 'canon', 'isaiah', 6, 10, 'free', E'*Make the heart of this people fat, and make their ears heavy, and shut their eyes; lest they see with their eyes, and hear with their ears, and understand with their heart, and convert, and be healed.* (Isaiah 6:10). Paul quotes it almost word for word: *For the heart of this people is waxed gross, and their ears are dull of hearing, and their eyes have they closed; lest they should … be converted, and I should heal them* (Acts 28:27). It is the prophet''s own grief carried into Rome — a heart waxed gross, eyes closed. Yet the closing is *lest … I should heal them*: the healing is held back, not cancelled; the husbandry hardens for a season, that in the appointed time the people might yet be converted and healed.'),
  ('canon', 'acts', 28, 25, 'canon', 'romans', 11, 7, 'free', E'*What then? Yashar''el (Israel) hath not obtained that which he seeketh for; but the election hath obtained it, and the rest were blinded* (Romans 11:7). When *some believed the things which were spoken, and some believed not* (Acts 28:24), it is the very pattern Paul named: the election obtains, the rest are blinded. The blinding is real, but it is *the rest* against a remnant that has obtained — the election according to grace stands within the hardened people, never a casting-off of the whole.'),
  ('canon', 'acts', 28, 27, 'canon', 'romans', 11, 8, 'free', E'*(According as it is written, Elohim (God) hath given them the spirit of slumber, eyes that they should not see, and ears that they should not hear;) unto this day.* (Romans 11:8). The *eyes have they closed* and *ears are dull of hearing* (Acts 28:27) are the same spirit of slumber Paul names — *eyes that they should not see, and ears that they should not hear.* It is a slumber, not a death; a heaviness laid on for a time, the deafness-in-part that the prophet and the apostle both read as the husbandry of mercy, not the end of the people.'),
  ('canon', 'acts', 28, 27, 'canon', 'romans', 11, 25, 'free', E'*For I would not, brethren, that ye should be ignorant of this mystery, lest ye should be wise in your own conceits; that blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in.* (Romans 11:25). This is the mystery that reads the closing prophecy aright: the gross heart and closed eyes of Acts 28:27 are *blindness in part* — in part, not in whole — and *until the fulness*, not for ever. The hardening has a measure and a season, and at the end of it the word stands: *And so all Yashar''el (Israel) shall be saved* (Romans 11:26). The blindness is the door held for the gathering, never the casting-away of the people.'),
  -- thread: acts-28-the-salvation-of-god-sent-the-dispersed-gathered-not-replaced
  ('canon', 'acts', 28, 28, 'canon', 'isaiah', 49, 6, 'free', E'*And he said, It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth.* (Isaiah 49:6). *Be it known therefore unto you, that the salvation of Elohim (God) is sent unto the Gentiles* (Acts 28:28) — and Isaiah tells whose salvation and to what end: the same servant raises up the tribes of Jacob and restores the preserved of Yashar''el, AND is given for a light to the nations. The salvation sent abroad is the servant''s light reaching the scattered to the end of the earth — the restoration carried outward, not a new people set in Yashar''el''s place.'),
  ('canon', 'acts', 28, 28, 'canon', 'psalms', 98, 3, 'free', E'*He hath remembered his mercy and his truth toward the house of Yashar''el (Israel): all the ends of the earth have seen the salvation of our Elohim (God).* (Psalms 98:3). When *the salvation of Elohim (God) is sent unto the Gentiles* (Acts 28:28), the psalm has already said what that salvation is: the mercy and truth remembered *toward the house of Yashar''el (Israel),* seen now by all the ends of the earth. The salvation that reaches the nations is the salvation of the house of Yashar''el made visible to the ends of the earth — the dispersed seeing what was always theirs.'),
  ('canon', 'acts', 28, 28, 'canon', 'romans', 11, 11, 'free', E'*I say then, Have they stumbled that they should fall? Elohim (God) forbid: but rather through their fall salvation is come unto the Gentiles, for to provoke them to jealousy.* (Romans 11:11). *The salvation of Elohim (God) is sent unto the Gentiles, and that they will hear it* (Acts 28:28) — and Paul has already named the purpose: the salvation come to the nations is *to provoke them to jealousy,* to stir the scattered house to come home. The sending abroad is not the replacing of Yashar''el; it is the mechanism by which the diminished are provoked toward their own fulness.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a28_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a28_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Separate INSERT for the healing thread's single member (kept in its own block for clarity)
WITH input2(src_edition, src_slug, src_ch, src_v,
            tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-28-he-bore-our-griefs-the-laying-on-of-hands-and-the-healer
  ('canon', 'acts', 28, 8, 'canon', 'isaiah', 53, 4, 'free', E'*Surely he hath borne our griefs, and carried our sorrows: yet we did esteem him stricken, smitten of Elohim (God), and afflicted.* (Isaiah 53:4). When *the father of Publius lay sick of a fever and of a bloody flux: to whom Paul entered in, and prayed, and laid his hands on him, and healed him* (Acts 28:8), the healing flows from the One the prophet saw — the servant who *hath borne our griefs, and carried our sorrows.* The hands laid on the sick of Melita carry the virtue of the One who bore the griefs in his own body; the healer at the bedside heals in the name of the stricken servant.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input2 i
  JOIN _s217_a28_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a28_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-28-the-viper-on-his-hand-the-serpent-shaken-into-the-fire',
       E'The viper on his hand — the serpent shaken into the fire',
       E'Safe ashore on Melita, Paul gathers sticks for the fire, and *there came a viper out of the heat, and fastened on his hand* (Acts 28:3). The islanders wait for him to swell and fall dead; instead *he shook off the beast into the fire, and felt no harm* (Acts 28:5). The scene is the oldest enmity playing out in miniature. In the garden the word went out: *I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15) — the serpent strikes the heel, the seed crushes the head. The psalm promised the one who dwells in the secret place: *Thou shalt tread upon the lion and adder: the young lion and the dragon shalt thou trample under feet* (Psalms 91:13). And the Master had given the word to his own: *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you* (Luke 10:19), naming the sign that *they shall take up serpents … and it shall not hurt them; they shall lay hands on the sick, and they shall recover* (Mark 16:18). Both halves of the sign land on Melita: the serpent harmless, and in the next breath Publius''s father healed (Acts 28:8). The viper that fastened on the hand by no means hurts the servant who walks in the One who crushed the serpent''s head.',
       sv.verse_id, ev.verse_id, 'free', 5950
  FROM _s217_a28_lookup sv, _s217_a28_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=28 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-28-the-hope-of-yasharel-bound-with-this-chain',
       E'The hope of Yashar''el (Israel) — bound with this chain',
       E'Paul calls the chief of the Yahudim (Jews) together and tells them why he wears the chain: *because that for the hope of Yashar''el (Israel) I am bound with this chain* (Acts 28:20). The hope he names is not a private hope of one man''s resurrection — it is the hope the prophets carried for the whole house. Jeremiah pleaded with it as a name of the Saviour: *O the hope of Yashar''el (Israel), the saviour thereof in time of trouble, why shouldest thou be as a stranger in the land …?* (Jeremiah 14:8). And the substance of that hope is the ingathering of the scattered: *Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10) — declared, the prophet said, in the very isles afar off where the prisoner''s ship had wintered. Ezekiel was shown its end: *Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21), and *I will make them one nation in the land … and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The hope of Yashar''el is the twelve-tribe ingathering — Yahudah and Yosef, the two sticks made one nation under one king. For that gathering, not for himself, Paul is bound.',
       sv.verse_id, ev.verse_id, 'free', 5953
  FROM _s217_a28_lookup sv, _s217_a28_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=28 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-28-yahusha-proved-both-out-of-moses-and-out-of-the-prophets',
       E'Yahusha (Jesus) proved — both out of Moses and out of the prophets',
       E'They appoint Paul a day, and from morning till evening he *expounded and testified the kingdom of Elohim (God), persuading them concerning Yahusha (Jesus), both out of the law of Moses, and out of the prophets* (Acts 28:23). The Messiah is not proved from a new book or a new religion — he is proved from the Tanakh that was always speaking of him. It is exactly what the risen One did on the Emmaus road: *beginning at Moses and all the prophets, he expounded unto them in all the scriptures the things concerning himself* (Luke 24:27). And it is the witness the Master named to the eleven: *all things must be fulfilled, which were written in the law of Moses, and in the prophets, and in the psalms, concerning me* (Luke 24:44). The law of Moses and the prophets are not left behind when Yahusha (Jesus) is preached; they are the very ground on which he is proved. Paul in Rome does what his Master did on the road — opens the whole Tanakh and shows the Messiah it was testifying of all along.',
       sv.verse_id, ev.verse_id, 'free', 5956
  FROM _s217_a28_lookup sv, _s217_a28_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=28 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-28-hearing-ye-shall-hear-the-blindness-in-part-for-a-season',
       E'Hearing ye shall hear — the blindness in part, for a season',
       E'Some believed and some believed not (Acts 28:24), and Paul speaks one closing word — the word the Ruach HaKodesh (Holy Spirit) gave Esaias: *Go unto this people, and say, Hearing ye shall hear, and shall not understand; and seeing ye shall see, and not perceive: For the heart of this people is waxed gross, and their ears are dull of hearing, and their eyes have they closed; lest they should … be converted, and I should heal them* (Acts 28:26-27). It is Isaiah''s own commission, almost word for word: *Hear ye indeed, but understand not; and see ye indeed, but perceive not* (Isaiah 6:9); *Make the heart of this people fat … shut their eyes; lest … they convert, and be healed* (Isaiah 6:10). The hardness is real and it is judicial — but it is never the end of the prophet''s people. Isaiah''s own vision closes with a *tenth* that returns, the holy seed in the stump; and the apostle reads the same hardening as a thing with a measure and a season. *Yashar''el (Israel) hath not obtained that which he seeketh for; but the election hath obtained it, and the rest were blinded* (Romans 11:7) — the rest, against a remnant that has obtained. *Elohim (God) hath given them the spirit of slumber, eyes that they should not see, and ears that they should not hear* (Romans 11:8) — a slumber, not a death. And the mystery that reads it aright: *blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25) — in part, not in whole; until the fulness, not for ever — *And so all Yashar''el (Israel) shall be saved* (Romans 11:26). The closed eyes of Acts 28:27 are the door held open for the gathering, never the casting-away of the people.',
       sv.verse_id, ev.verse_id, 'free', 5959
  FROM _s217_a28_lookup sv, _s217_a28_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=28 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-28-the-salvation-of-god-sent-the-dispersed-gathered-not-replaced',
       E'The salvation of Elohim (God) sent — the dispersed gathered, not replaced',
       E'*Be it known therefore unto you, that the salvation of Elohim (God) is sent unto the Gentiles, and that they will hear it* (Acts 28:28). Read alone, the verse has been pressed into a supersessionist proof-text — as though the salvation passed from Yashar''el (Israel) to a new people. But the prophets it draws from say otherwise. Isaiah names the same servant who carries it: *It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth* (Isaiah 49:6) — the one servant both restores the tribes of Jacob AND is the light to the nations; the salvation sent abroad is the restoration carried outward, never a replacement of the house. The psalm says whose salvation reaches the ends of the earth: *He hath remembered his mercy and his truth toward the house of Yashar''el (Israel): all the ends of the earth have seen the salvation of our Elohim (God)* (Psalms 98:3) — the salvation of the house of Yashar''el, made visible to the ends of the earth, the dispersed seeing what was always theirs. And Paul has already named the purpose of the sending: *through their fall salvation is come unto the Gentiles, for to provoke them to jealousy* (Romans 11:11) — the salvation come to the nations is the very thing that stirs the scattered house toward its own fulness. The salvation sent is the gathering reaching the dispersed seed among the nations, the deafness-in-part of the closing prophecy paired with it so the verse can never be made to cast Yashar''el away.',
       sv.verse_id, ev.verse_id, 'free', 5962
  FROM _s217_a28_lookup sv, _s217_a28_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=28 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-28-he-bore-our-griefs-the-laying-on-of-hands-and-the-healer',
       E'He bore our griefs — the laying on of hands and the healer',
       E'In the same quarters lay the father of Publius, *sick of a fever and of a bloody flux: to whom Paul entered in, and prayed, and laid his hands on him, and healed him* (Acts 28:8), and after him *others also, which had diseases in the island, came, and were healed* (Acts 28:9). The hands laid on the sick carry a virtue that is not Paul''s own. The prophet saw its source long before: *Surely he hath borne our griefs, and carried our sorrows: yet we did esteem him stricken, smitten of Elohim (God), and afflicted* (Isaiah 53:4). The healer at the bedside heals in the name of the servant who bore the griefs in his own body — the One who carried the sorrows is the One whose power flows through the hands laid on the fevered and the sick of Melita. The closing chapter of Acts ends as the Master''s ministry began: the griefs borne, the sick made whole.',
       sv.verse_id, ev.verse_id, 'free', 5965
  FROM _s217_a28_lookup sv, _s217_a28_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=28 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-28-the-viper-on-his-hand-the-serpent-shaken-into-the-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* the oldest enmity; the serpent strikes the heel and finds no purchase (Acts 28:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a28_lookup sv, _s217_a28_lookup tv
 WHERE t.slug='acts-28-the-viper-on-his-hand-the-serpent-shaken-into-the-fire'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 91:13 — *Thou shalt tread upon the lion and adder … the dragon shalt thou trample under feet* the adder trodden, the venomous beast shaken into the flame, no harm (Acts 28:5).'
  FROM cross_reference_threads t, cross_references x, _s217_a28_lookup sv, _s217_a28_lookup tv
 WHERE t.slug='acts-28-the-viper-on-his-hand-the-serpent-shaken-into-the-fire'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 10:19 — *I give unto you power to tread on serpents and scorpions … and nothing shall by any means hurt you* the Master''s word shown true on the island (Acts 28:5).'
  FROM cross_reference_threads t, cross_references x, _s217_a28_lookup sv, _s217_a28_lookup tv
 WHERE t.slug='acts-28-the-viper-on-his-hand-the-serpent-shaken-into-the-fire'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Mark 16:18 — *they shall take up serpents … it shall not hurt them; they shall lay hands on the sick, and they shall recover* both halves of the sign land on Melita — serpent harmless, then Publius''s father healed (Acts 28:5,8).'
  FROM cross_reference_threads t, cross_references x, _s217_a28_lookup sv, _s217_a28_lookup tv
 WHERE t.slug='acts-28-the-viper-on-his-hand-the-serpent-shaken-into-the-fire'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-28-the-hope-of-yasharel-bound-with-this-chain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 14:8 — *O the hope of Yashar''el (Israel), the saviour thereof in time of trouble* the hope Paul names is the Saviour of the whole house, not a private hope (Acts 28:20).'
  FROM cross_reference_threads t, cross_references x, _s217_a28_lookup sv, _s217_a28_lookup tv
 WHERE t.slug='acts-28-the-hope-of-yasharel-bound-with-this-chain'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:10 — *He that scattered Yashar''el (Israel) will gather him … as a shepherd doth his flock* the hope is the ingathering, declared in the isles afar off (Acts 28:20).'
  FROM cross_reference_threads t, cross_references x, _s217_a28_lookup sv, _s217_a28_lookup tv
 WHERE t.slug='acts-28-the-hope-of-yasharel-bound-with-this-chain'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:21 — *I will take the children of Yashar''el (Israel) from among the heathen … and will gather them on every side* the dry-bones ingathering, the hope''s substance (Acts 28:20).'
  FROM cross_reference_threads t, cross_references x, _s217_a28_lookup sv, _s217_a28_lookup tv
 WHERE t.slug='acts-28-the-hope-of-yasharel-bound-with-this-chain'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 37:22 — *I will make them one nation … and they shall be no more two nations* the two sticks made one under one king — the twelve-tribe hope (Acts 28:20).'
  FROM cross_reference_threads t, cross_references x, _s217_a28_lookup sv, _s217_a28_lookup tv
 WHERE t.slug='acts-28-the-hope-of-yasharel-bound-with-this-chain'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-28-yahusha-proved-both-out-of-moses-and-out-of-the-prophets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 24:27 — *beginning at Moses and all the prophets, he expounded … the things concerning himself* the Emmaus opening; Paul does the same in Rome (Acts 28:23).'
  FROM cross_reference_threads t, cross_references x, _s217_a28_lookup sv, _s217_a28_lookup tv
 WHERE t.slug='acts-28-yahusha-proved-both-out-of-moses-and-out-of-the-prophets'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 24:44 — *all things must be fulfilled, which were written in the law of Moses, and in the prophets, and in the psalms, concerning me* the whole-Tanakh witness Paul preaches (Acts 28:23).'
  FROM cross_reference_threads t, cross_references x, _s217_a28_lookup sv, _s217_a28_lookup tv
 WHERE t.slug='acts-28-yahusha-proved-both-out-of-moses-and-out-of-the-prophets'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-28-hearing-ye-shall-hear-the-blindness-in-part-for-a-season
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 6:9 — *Hear ye indeed, but understand not; and see ye indeed, but perceive not* the prophet''s commission Paul speaks in Rome (Acts 28:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a28_lookup sv, _s217_a28_lookup tv
 WHERE t.slug='acts-28-hearing-ye-shall-hear-the-blindness-in-part-for-a-season'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 6:10 — *shut their eyes; lest … they convert, and be healed* the heart waxed gross; the healing held back, not cancelled (Acts 28:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a28_lookup sv, _s217_a28_lookup tv
 WHERE t.slug='acts-28-hearing-ye-shall-hear-the-blindness-in-part-for-a-season'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 11:7 — *the election hath obtained it, and the rest were blinded* the rest blinded against a remnant that has obtained — when some believed not (Acts 28:24).'
  FROM cross_reference_threads t, cross_references x, _s217_a28_lookup sv, _s217_a28_lookup tv
 WHERE t.slug='acts-28-hearing-ye-shall-hear-the-blindness-in-part-for-a-season'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 11:8 — *the spirit of slumber, eyes that they should not see, and ears that they should not hear* a slumber, not a death — the deafness-in-part (Acts 28:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a28_lookup sv, _s217_a28_lookup tv
 WHERE t.slug='acts-28-hearing-ye-shall-hear-the-blindness-in-part-for-a-season'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 11:25 — *blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* the mystery: in part, not in whole; until the fulness, not for ever — *And so all Yashar''el shall be saved* (Acts 28:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a28_lookup sv, _s217_a28_lookup tv
 WHERE t.slug='acts-28-hearing-ye-shall-hear-the-blindness-in-part-for-a-season'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-28-the-salvation-of-god-sent-the-dispersed-gathered-not-replaced
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:6 — *to raise up the tribes of Jacob, and to restore the preserved of Yashar''el … a light to the Gentiles* one servant restores the tribes AND lights the nations; the salvation sent abroad is the restoration carried outward (Acts 28:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a28_lookup sv, _s217_a28_lookup tv
 WHERE t.slug='acts-28-the-salvation-of-god-sent-the-dispersed-gathered-not-replaced'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 98:3 — *his mercy and his truth toward the house of Yashar''el (Israel): all the ends of the earth have seen the salvation of our Elohim (God)* the salvation of the house made visible to the ends of the earth (Acts 28:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a28_lookup sv, _s217_a28_lookup tv
 WHERE t.slug='acts-28-the-salvation-of-god-sent-the-dispersed-gathered-not-replaced'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=98 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 11:11 — *through their fall salvation is come unto the Gentiles, for to provoke them to jealousy* the sending abroad provokes the scattered house toward its own fulness — not replacement (Acts 28:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a28_lookup sv, _s217_a28_lookup tv
 WHERE t.slug='acts-28-the-salvation-of-god-sent-the-dispersed-gathered-not-replaced'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-28-he-bore-our-griefs-the-laying-on-of-hands-and-the-healer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:4 — *Surely he hath borne our griefs, and carried our sorrows* the healer at the bedside heals in the name of the servant who bore the griefs (Acts 28:8).'
  FROM cross_reference_threads t, cross_references x, _s217_a28_lookup sv, _s217_a28_lookup tv
 WHERE t.slug='acts-28-he-bore-our-griefs-the-laying-on-of-hands-and-the-healer'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=28 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
