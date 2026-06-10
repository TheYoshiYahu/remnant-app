-- ----- fragment: minion_acts_26.sql (S217 Acts 26) -----
-- =====================================================================
-- S217 minion — ACTS 26 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ACTS 26 (Paul before Agrippa — the fullest telling of the call,
--   the twelve-tribe hope, the servant-commission, Messiah suffering-then-rising).
-- Tag: a26 (temp view _s217_a26_lookup).  Sort band: 5900-5924 (step 3 per thread).
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + NT (no extras warranted here).
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'. (All rows 'free'.)
--
-- WATCHPOINTS (Red Lines #7/#11/#10, Christology, son-of-Adam):
--  * The twelve-tribe hope (26:6-7) is the LITERAL restoration of the twelve tribes — the
--    promise made of Elohim (God) unto the fathers, *our twelve tribes, instantly serving
--    Elohim (God) day and night, hope to come.* Read load-bearing: Genesis 49 (the twelve
--    tribes named), Ezekiel 37 (the two sticks made one, gathered out of the heathen). NOT a
--    new-people graft; the prophetic gathering of the paternal blood remnant of all twelve.
--  * The commission's "Gentiles" / "inheritance among the sanctified" (26:17-18,20,23) = the
--    servant's light to the people AND the nations within the restoration — Isaiah 42:6-7
--    (covenant of the people, light, open blind eyes, prison house), Isaiah 49:6 (raise up the
--    tribes, restore the preserved, a light to the nations). The gathering of the dispersed/
--    estranged, the lost sheep made nigh — NEVER false-inclusion of non-seed by confession.
--  * "Sanctified by faith" (26:18) — faith as the MEANS of return and inheritance, never a
--    sola-fide truncation cutting the gospel sentence in half (Red Line #10). "Repent and turn
--    to Elohim (God), and do works meet for repentance" (26:20) — repentance bearing fruit.
--  * Messiah suffering-then-rising (26:22-23) = Moses-and-the-prophets, the Tanakh's own
--    testimony: Isaiah 53 (the servant cut off, dividing the spoil), Psalm 16:10 (the Holy
--    One not left to corruption), confirmed at Luke 24:26-27,46-47. NOT a Christian overlay
--    on the prophets — *none other things than those which the prophets and Moses did say.*
--  * The light and the voice (26:13-15): the Formed himself — the One drawn from the Formless
--    who appeared and spoke through the history of the fathers, now glorified — *I am Yahusha
--    (Jesus) whom thou persecutest.* He who is Yahuah, who came in flesh as Yahusha. The
--    fullest of the three tellings; resolved Acts<->Acts to chapters 9 and 22.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 26:
--   v.1-5   manner of life, a Pharisee   Tanakh: none warranted (Torah-faithful self-witness, narrative)  Extras: none warranted  NT: Acts 22:3 / Philippians 3:5 weighed — narrative self-attestation, carried thematically, not added
--   v.6-7   THE HOPE OF THE PROMISE / twelve tribes  Tanakh: Genesis 49:28 (the twelve tribes), Ezekiel 37:21, Ezekiel 37:22, Ezekiel 37:25  Extras: none warranted (Jubilees tribe-lists weighed, framework weight thin vs. Genesis 49)  NT: none added (the promise-to-the-fathers carried in the resurrection thread at v.8)
--   v.8     raise the dead               Tanakh: Ezekiel 37:12, Daniel 12:2  Extras: none warranted  NT: Acts 13:32, Acts 13:33 (the promise made unto the fathers — raised up)
--   v.9-11  persecuted the saints        Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative; carried in the light-and-voice thread)
--   v.12-15 THE LIGHT AND THE VOICE      Tanakh: none added (the Formed appearing carried by the NT retellings)  Extras: none warranted  NT: Acts 9:4, Acts 9:5, Acts 22:7, Acts 22:8 (Acts<->Acts, fullest telling)
--   v.16-18 THE COMMISSION               Tanakh: Isaiah 42:6, Isaiah 42:7, Isaiah 35:5, Isaiah 61:1, Isaiah 49:6  Extras: none warranted  NT: none added (the servant-light carried in Tanakh thread)
--   v.19-20 not disobedient / works meet Tanakh: none added (repent-and-turn carried; works-meet-for-repentance threaded in commission summary)  Extras: none warranted  NT: none warranted
--   v.21-23 NONE OTHER THAN MOSES AND THE PROPHETS / Messiah suffer and rise  Tanakh: Isaiah 53:8, Isaiah 53:12, Psalm 16:10  Extras: none warranted  NT: Luke 24:26, Luke 24:27, Luke 24:46, Luke 24:47
--   v.24-29 Festus / Agrippa / almost    Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative; *believest thou the prophets?* carried by the Moses-and-prophets thread)
--   v.30-32 nothing worthy of death      Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--
-- THREADS (slug -> target libraries):
--   5900 acts-26-the-hope-of-the-promise-our-twelve-tribes-instantly-serving        (Tanakh)
--   5903 acts-26-that-elohim-should-raise-the-dead-the-resurrection-hope-of-the-fathers (Tanakh + NT, Acts<->Acts)
--   5906 acts-26-the-light-and-the-voice-the-fullest-telling-of-the-damascus-road   (NT, Acts<->Acts)
--   5909 acts-26-to-open-their-eyes-the-servant-a-light-to-the-people-and-the-nations (Tanakh)
--   5912 acts-26-none-other-than-moses-and-the-prophets-messiah-should-suffer-and-rise (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s217_a26_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-26-the-hope-of-the-promise-our-twelve-tribes-instantly-serving
  ('canon', 'acts', 26, 7, 'canon', 'genesis', 49, 28, 'free', E'*All these are the twelve tribes of Yashar''el (Israel): and this is it that their father spake unto them, and blessed them; every one according to his blessing he blessed them.* (Genesis 49:28). Paul stands judged *for the hope of the promise made of Elohim (God) unto our fathers: unto which promise our twelve tribes, instantly serving Elohim (God) day and night, hope to come* (Acts 26:6-7). The twelve tribes are not a figure of speech — they are the named sons Jacob gathered and blessed in the last days. The hope Paul is on trial for is the hope of those twelve, the paternal blood remnant of the whole house, coming to the promise spoken to Abraham, Isaac, and Jacob.'),
  ('canon', 'acts', 26, 7, 'canon', 'ezekiel', 37, 21, 'free', E'*And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* (Ezekiel 37:21). The hope to which *our twelve tribes … hope to come* (Acts 26:7) is the gathering Ezekiel named: the children of Yashar''el (Israel) taken from among the heathen where they were scattered and brought home. The hope of the promise is the ingathering of the dispersed — not a new people, but the very tribes that were scattered being made one again.'),
  ('canon', 'acts', 26, 7, 'canon', 'ezekiel', 37, 22, 'free', E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* (Ezekiel 37:22). The twelve tribes who *hope to come* to the promise (Acts 26:7) are the two houses made one — Yahudah and Yosef, the stick of Ephraim joined to the stick of Yahudah, no more two nations. The hope Paul is accused over is the reunion of the divided kingdom under one king, the twelve restored whole.'),
  ('canon', 'acts', 26, 7, 'canon', 'ezekiel', 37, 25, 'free', E'*And they shall dwell in the land that I have given unto Jacob my servant, wherein your fathers have dwelt; and they shall dwell therein, even they, and their children, and their children''s children for ever: and my servant David shall be their prince for ever.* (Ezekiel 37:25). The *promise made of Elohim (God) unto our fathers* (Acts 26:6) reaches its end here: the gathered twelve dwelling in the land of the fathers for ever, under David''s prince for ever, in an everlasting covenant of peace. This is the hope Paul serves — the consummated restoration, not a partial or counterfeit return.'),
  -- thread: acts-26-that-elohim-should-raise-the-dead-the-resurrection-hope-of-the-fathers
  ('canon', 'acts', 26, 8, 'canon', 'ezekiel', 37, 12, 'free', E'*Therefore prophesy and say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel).* (Ezekiel 37:12). *Why should it be thought a thing incredible with you, that Elohim (God) should raise the dead?* (Acts 26:8). The opening of the graves is the covenant''s own promise: the same Adonai Yahuah (the Lord GOD) who gathers the scattered tribes raises the dry bones and brings them up. The raising of the dead and the gathering of the twelve are one hope, not two.'),
  ('canon', 'acts', 26, 8, 'canon', 'daniel', 12, 2, 'free', E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). The resurrection Paul defends — *that Elohim (God) should raise the dead* (Acts 26:8) — is no new doctrine; Daniel saw those who sleep in the dust awaking, some to everlasting life. The hope of the fathers includes the resurrection of the fathers themselves to stand in their lot at the end of the days.'),
  ('canon', 'acts', 26, 8, 'canon', 'acts', 13, 32, 'free', E'*And we declare unto you glad tidings, how that the promise which was made unto the fathers,* (Acts 13:32). Paul names the same hope in the synagogue at Antioch that he names before Agrippa — *the hope of the promise made of Elohim (God) unto our fathers* (Acts 26:6). The glad tidings are that the promise to the fathers is being fulfilled, and the seal of that fulfilment is the raising of the dead.'),
  ('canon', 'acts', 26, 8, 'canon', 'acts', 13, 33, 'free', E'*Elohim (God) hath fulfilled the same unto us their children, in that he hath raised up Yahusha (Jesus) again; as it is also written in the second psalm, Thou art my Son, this day have I begotten thee.* (Acts 13:33). The promise to the fathers is fulfilled *in that he hath raised up Yahusha (Jesus) again* — and so to ask *why should it be thought a thing incredible … that Elohim (God) should raise the dead?* (Acts 26:8) is to point at the firstfruits already raised. The resurrection of the Messiah is the pledge of the resurrection-hope the twelve tribes serve toward.'),
  -- thread: acts-26-the-light-and-the-voice-the-fullest-telling-of-the-damascus-road
  ('canon', 'acts', 26, 14, 'canon', 'acts', 9, 4, 'free', E'*And he fell to the earth, and heard a voice saying unto him, Saul, Saul, why persecutest thou me?* (Acts 9:4). Before Agrippa Paul tells it fullest: *when we were all fallen to the earth, I heard a voice speaking unto me, and saying in the Hebrew tongue, Saul, Saul, why persecutest thou me? it is hard for thee to kick against the pricks* (Acts 26:14). The voice from the light above the brightness of the sun is the Formed himself — the One who appeared and spoke through all the history of the fathers, now risen and glorified — calling the persecutor by name.'),
  ('canon', 'acts', 26, 15, 'canon', 'acts', 9, 5, 'free', E'*And he said, Who art thou, Yahuah (Lord)? And Yahuah (Lord) said, I am Yahusha (Jesus) whom thou persecutest: it is hard for thee to kick against the pricks.* (Acts 9:5). The same exchange stands at the centre of all three tellings: *And I said, Who art thou, Yahuah (Lord)? And he said, I am Yahusha (Jesus) whom thou persecutest* (Acts 26:15). The One in the light answers to the name Saul cried — he who is Yahuah, the Formed drawn from the Formless, who came in the flesh as Yahusha, persecuted in his disciples and now calling his chosen vessel.'),
  ('canon', 'acts', 26, 14, 'canon', 'acts', 22, 7, 'free', E'*And I fell unto the ground, and heard a voice saying unto me, Saul, Saul, why persecutest thou me?* (Acts 22:7). On the temple stairs Paul told it to the people in the Hebrew tongue; before Agrippa he tells it again — *I heard a voice speaking unto me, and saying in the Hebrew tongue, Saul, Saul, why persecutest thou me?* (Acts 26:14). Three tellings, one voice: the persecuted Messiah counts every blow against his disciples as a blow against himself.'),
  ('canon', 'acts', 26, 15, 'canon', 'acts', 22, 8, 'free', E'*And I answered, Who art thou, Yahuah (Lord)? And he said unto me, I am Yahusha (Jesus) of Nazareth, whom thou persecutest.* (Acts 22:8). The naming is the same in every telling: *I am Yahusha (Jesus) whom thou persecutest* (Acts 26:15). The One who is Yahuah, who walked the history of Yashar''el (Israel) as the Formed and came in the flesh as Yahusha of Nazareth, names himself to the man who thought he served Elohim (God) by hunting the saints.'),
  -- thread: acts-26-to-open-their-eyes-the-servant-a-light-to-the-people-and-the-nations
  ('canon', 'acts', 26, 18, 'canon', 'isaiah', 42, 6, 'free', E'*I Yahuah (LORD) have called thee in righteousness, and will hold thine hand, and will keep thee, and give thee for a covenant of the people, for a light of the Gentiles;* (Isaiah 42:6). The commission Paul receives — *to open their eyes, and to turn them from darkness to light* (Acts 26:18) — is the servant''s own commission: given for a covenant of the people, for a light of the nations. The minister carries forward the work of the servant Yahuah (LORD) called, the light that goes to the people and to the nations alike.'),
  ('canon', 'acts', 26, 18, 'canon', 'isaiah', 42, 7, 'free', E'*To open the blind eyes, to bring out the prisoners from the prison, and them that sit in darkness out of the prison house.* (Isaiah 42:7). Word for word the servant''s task is Paul''s sending: *to open their eyes, and to turn them from darkness to light, and from the power of Satan unto Elohim (God)* (Acts 26:18). The blind eyes opened, the prisoners brought out of the prison house, those that sit in darkness led to light — the scattered and bound brought home and given sight.'),
  ('canon', 'acts', 26, 18, 'canon', 'isaiah', 35, 5, 'free', E'*Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* (Isaiah 35:5). The opening of eyes that the commission names — *to open their eyes* (Acts 26:18) — is the sign of the ransomed of Yahuah (LORD) returning to Zion with songs. The blind eyes opened belong to the highway of holiness, the way home for the redeemed.'),
  ('canon', 'acts', 26, 18, 'canon', 'isaiah', 61, 1, 'free', E'*The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives, and the opening of the prison to them that are bound;* (Isaiah 61:1). The anointed servant is sent to proclaim liberty to the captives and *the opening of the prison to them that are bound* — and Paul is sent into that same work, *to turn them from darkness to light, and from the power of Satan unto Elohim (God), that they may receive forgiveness of sins, and inheritance among them which are sanctified by faith that is in me* (Acts 26:18). The captives loosed and the bound set free are the dispersed receiving back their inheritance; faith is the means of the return, not a release from the covenant.'),
  ('canon', 'acts', 26, 23, 'canon', 'isaiah', 49, 6, 'free', E'*And he said, It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth.* (Isaiah 49:6). Paul witnesses that Messiah (Christ) *should shew light unto the people, and to the Gentiles* (Acts 26:23) — exactly the servant''s double commission: to raise up the tribes of Jacob and restore the preserved of Yashar''el (Israel), AND to be a light to the nations. The light to the nations does not replace the raising of the tribes; it stands beside it, the salvation reaching to the end of the earth where the scattered seed was carried.'),
  -- thread: acts-26-none-other-than-moses-and-the-prophets-messiah-should-suffer-and-rise
  ('canon', 'acts', 26, 23, 'canon', 'isaiah', 53, 8, 'free', E'*He was taken from prison and from judgment: and who shall declare his generation? for he was cut off out of the land of the living: for the transgression of my people was he stricken.* (Isaiah 53:8). Paul says *none other things than those which the prophets and Moses did say should come: That Messiah (Christ) should suffer* (Acts 26:22-23). That Messiah should suffer is Isaiah''s own word: the servant cut off out of the land of the living for the transgression of his people. The suffering is not a Christian overlay on the prophets — it is what the prophet plainly said.'),
  ('canon', 'acts', 26, 23, 'canon', 'isaiah', 53, 12, 'free', E'*Therefore will I divide him a portion with the great, and he shall divide the spoil with the strong; because he hath poured out his soul unto death: and he was numbered with the transgressors; and he bare the sin of many, and made intercession for the transgressors.* (Isaiah 53:12). The Messiah who *should suffer, and … be the first that should rise from the dead* (Acts 26:23) is the servant who poured out his soul unto death and is then given a portion with the great — the suffering and the vindication that follows, both spoken by the prophet Moses and the prophets confirm.'),
  ('canon', 'acts', 26, 23, 'canon', 'psalms', 16, 10, 'free', E'*For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* (Psalm 16:10). That Messiah (Christ) *should be the first that should rise from the dead* (Acts 26:23) was sealed in David''s psalm: the Holy One not left to corruption. The rising Paul witnesses to is the very thing the prophets said should come — the Holy One brought up out of death, the firstfruits of them that slept.'),
  ('canon', 'acts', 26, 22, 'canon', 'luke', 24, 27, 'free', E'*And beginning at Moses and all the prophets, he expounded unto them in all the scriptures the things concerning himself.* (Luke 24:27). Paul says he witnesses *none other things than those which the prophets and Moses did say should come* (Acts 26:22) — the very lesson the risen Messiah taught on the Emmaus road, beginning at Moses and all the prophets, expounding the things concerning himself. Paul preaches nothing the Master had not already shown was written.'),
  ('canon', 'acts', 26, 23, 'canon', 'luke', 24, 26, 'free', E'*Ought not Messiah (Christ) to have suffered these things, and to enter into his glory?* (Luke 24:26). The risen Master''s own question frames Paul''s witness — *That Messiah (Christ) should suffer, and that he should be the first that should rise from the dead* (Acts 26:23). The suffering before the glory, the death before the rising, is the pattern Moses and the prophets laid down and the Messiah himself opened to his own.'),
  ('canon', 'acts', 26, 23, 'canon', 'luke', 24, 46, 'free', E'*And said unto them, Thus it is written, and thus it behoved Messiah (Christ) to suffer, and to rise from the dead the third day:* (Luke 24:46). Paul''s testimony before Agrippa is the testimony the Master gave the eleven: *thus it is written … Messiah (Christ) to suffer, and to rise from the dead.* What is written in the law of Moses, the prophets, and the psalms is what Paul says *the prophets and Moses did say should come* (Acts 26:22) — the suffering and rising Messiah.'),
  ('canon', 'acts', 26, 23, 'canon', 'luke', 24, 47, 'free', E'*And that repentance and remission of sins should be preached in his name among all nations, beginning at Jerusalem.* (Luke 24:47). The Messiah risen sends repentance and remission of sins to be preached *among all nations, beginning at Jerusalem* — and Paul shows *first unto them of Damascus, and at Jerusalem … and then to the Gentiles, that they should repent and turn to Elohim (God), and do works meet for repentance* (Acts 26:20). The repentance preached to the nations bears the fruit meet for repentance; the remission and the turning are one motion, not a faith that leaves the turning undone.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a26_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a26_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-26-the-hope-of-the-promise-our-twelve-tribes-instantly-serving',
       E'The hope of the promise — our twelve tribes, instantly serving',
       E'Paul names the thing he is on trial for plainly: *And now I stand and am judged for the hope of the promise made of Elohim (God) unto our fathers: unto which promise our twelve tribes, instantly serving Elohim (God) day and night, hope to come. For which hope''s sake, king Agrippa, I am accused of the Yahudim (Jews)* (Acts 26:6-7). The hope is not a doctrine of the afterlife in the abstract; it is the hope of *our twelve tribes* — the named sons Jacob gathered in his last words: *All these are the twelve tribes of Yashar''el (Israel): and this is it that their father spake unto them, and blessed them; every one according to his blessing he blessed them* (Genesis 49:28). Those twelve were scattered, the northern house divorced and dispersed among the heathen — and the promise to the fathers is their gathering home: *Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21). The two houses become one: *I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). And the end of the promise is the gathered twelve dwelling in the land of the fathers for ever: *they shall dwell therein, even they, and their children, and their children''s children for ever: and my servant David shall be their prince for ever* (Ezekiel 37:25). This is the hope the twelve tribes serve toward day and night — not a new people grafted in by confession, but the paternal blood remnant of all twelve, scattered and now being gathered, coming to the promise spoken to Abraham, Isaac, and Jacob.',
       sv.verse_id, ev.verse_id, 'free', 5900
  FROM _s217_a26_lookup sv, _s217_a26_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=26 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-26-that-elohim-should-raise-the-dead-the-resurrection-hope-of-the-fathers',
       E'That Elohim (God) should raise the dead — the resurrection hope of the fathers',
       E'In the middle of naming the twelve-tribe hope Paul asks the court a question: *Why should it be thought a thing incredible with you, that Elohim (God) should raise the dead?* (Acts 26:8). The resurrection is not separable from the gathering — it is the same promise. The hand that gathers the scattered tribes is the hand that opens the graves: *Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel)* (Ezekiel 37:12). The dry bones live, and the same covenant promises that the fathers themselves will rise: *many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). Paul preached this same promise in the synagogue at Antioch: *we declare unto you glad tidings, how that the promise which was made unto the fathers, Elohim (God) hath fulfilled the same unto us their children, in that he hath raised up Yahusha (Jesus) again* (Acts 13:32-33). The firstfruits is already raised; the resurrection of the Messiah is the pledge that the hope of the fathers — the gathering and the rising together — is sure. To ask whether Elohim (God) can raise the dead is to point at the One already raised, and through him at the whole house that sleeps in the dust awaiting the end of the days.',
       sv.verse_id, ev.verse_id, 'free', 5903
  FROM _s217_a26_lookup sv, _s217_a26_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=26 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-26-the-light-and-the-voice-the-fullest-telling-of-the-damascus-road',
       E'The light and the voice — the fullest telling of the Damascus road',
       E'Three times Luke records the Damascus road, and this is the fullest: *At midday, O king, I saw in the way a light from heaven, above the brightness of the sun, shining round about me and them which journeyed with me. And when we were all fallen to the earth, I heard a voice speaking unto me, and saying in the Hebrew tongue, Saul, Saul, why persecutest thou me? it is hard for thee to kick against the pricks* (Acts 26:13-14). The bare account stands in the ninth chapter: *he fell to the earth, and heard a voice saying unto him, Saul, Saul, why persecutest thou me?* (Acts 9:4); and on the temple stairs to the people: *I fell unto the ground, and heard a voice saying unto me, Saul, Saul, why persecutest thou me?* (Acts 22:7). The naming is the same in every telling. *Who art thou, Yahuah (Lord)? And he said, I am Yahusha (Jesus) whom thou persecutest* (Acts 26:15); *I am Yahusha (Jesus) whom thou persecutest* (Acts 9:5); *I am Yahusha (Jesus) of Nazareth, whom thou persecutest* (Acts 22:8). The voice from the light above the brightness of the sun is the Formed himself — the One drawn from the Formless who appeared and spoke through all the history of the fathers, now risen and glorified — and he counts every blow Saul struck against the saints as a blow struck against himself. He who is Yahuah, who came in the flesh as Yahusha of Nazareth, names himself to the persecutor and makes him a minister and a witness.',
       sv.verse_id, ev.verse_id, 'free', 5906
  FROM _s217_a26_lookup sv, _s217_a26_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=26 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-26-to-open-their-eyes-the-servant-a-light-to-the-people-and-the-nations',
       E'To open their eyes — the servant a light to the people and the nations',
       E'The commission Paul receives in the light is the servant''s own commission, word for word: *to make thee a minister and a witness … to open their eyes, and to turn them from darkness to light, and from the power of Satan unto Elohim (God), that they may receive forgiveness of sins, and inheritance among them which are sanctified by faith that is in me* (Acts 26:16-18). Isaiah heard the same words spoken to the servant: *I Yahuah (LORD) have called thee in righteousness … and give thee for a covenant of the people, for a light of the Gentiles; to open the blind eyes, to bring out the prisoners from the prison, and them that sit in darkness out of the prison house* (Isaiah 42:6-7). The opening of eyes is the sign of the homecoming — *then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped* (Isaiah 35:5), the highway of holiness for the ransomed returning. It is the anointed work of the servant sent *to proclaim liberty to the captives, and the opening of the prison to them that are bound* (Isaiah 61:1) — the captives loosed are the dispersed receiving back their inheritance, and faith is the means of the return, not a release from the covenant. And the servant''s commission was always double: *It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth* (Isaiah 49:6). The light to the nations does not replace the raising of the tribes — it stands beside it, the salvation reaching to the very ends of the earth where the scattered seed was carried. So Paul shows *first unto them of Damascus, and at Jerusalem … and then to the Gentiles, that they should repent and turn to Elohim (God), and do works meet for repentance* (Acts 26:20): the turning bears fruit, the inheritance is received by those whom faith returns to the covenant.',
       sv.verse_id, ev.verse_id, 'free', 5909
  FROM _s217_a26_lookup sv, _s217_a26_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=26 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-26-none-other-than-moses-and-the-prophets-messiah-should-suffer-and-rise',
       E'None other than Moses and the prophets — Messiah should suffer and rise',
       E'Paul stakes his whole defence on a single claim: he has added nothing to the scriptures. *Having therefore obtained help of Elohim (God), I continue unto this day, witnessing both to small and great, saying none other things than those which the prophets and Moses did say should come: That Messiah (Christ) should suffer, and that he should be the first that should rise from the dead, and should shew light unto the people, and to the Gentiles* (Acts 26:22-23). That Messiah should suffer is Isaiah''s own word: *he was cut off out of the land of the living: for the transgression of my people was he stricken* (Isaiah 53:8), the servant who *hath poured out his soul unto death … and bare the sin of many, and made intercession for the transgressors* (Isaiah 53:12) and is then given a portion with the great. That he should rise was sealed in David''s psalm: *thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10). This is exactly the lesson the risen Master taught on the Emmaus road — *beginning at Moses and all the prophets, he expounded unto them in all the scriptures the things concerning himself* (Luke 24:27), asking *ought not Messiah (Christ) to have suffered these things, and to enter into his glory?* (Luke 24:26), and declaring *thus it is written … Messiah (Christ) to suffer, and to rise from the dead the third day* (Luke 24:46). And the sending follows the same pattern: *that repentance and remission of sins should be preached in his name among all nations, beginning at Jerusalem* (Luke 24:47) — which Paul carries out, preaching *that they should repent and turn to Elohim (God), and do works meet for repentance* (Acts 26:20). When Agrippa is asked *believest thou the prophets?* the whole case rests there: Paul preaches nothing the prophets and Moses did not already say should come.',
       sv.verse_id, ev.verse_id, 'free', 5912
  FROM _s217_a26_lookup sv, _s217_a26_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=26 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-26-the-hope-of-the-promise-our-twelve-tribes-instantly-serving
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:28 — *All these are the twelve tribes of Yashar''el (Israel) … every one according to his blessing he blessed them* the named twelve Jacob gathered; the hope of the promise is the hope of those twelve (Acts 26:7).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-the-hope-of-the-promise-our-twelve-tribes-instantly-serving'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:21 — *I will take the children of Yashar''el (Israel) from among the heathen … and gather them … and bring them into their own land* the ingathering of the dispersed twelve, the hope they serve toward (Acts 26:7).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-the-hope-of-the-promise-our-twelve-tribes-instantly-serving'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:22 — *I will make them one nation … they shall be no more two nations* the two houses, Yahudah and Yosef, made one under one king (Acts 26:7).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-the-hope-of-the-promise-our-twelve-tribes-instantly-serving'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 37:25 — *they shall dwell therein … for ever: and my servant David shall be their prince for ever* the end of the promise to the fathers, the gathered twelve in the land for ever (Acts 26:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-the-hope-of-the-promise-our-twelve-tribes-instantly-serving'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-26-that-elohim-should-raise-the-dead-the-resurrection-hope-of-the-fathers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:12 — *I will open your graves, and cause you to come up out of your graves* the same hand that gathers the tribes opens the graves; raising and gathering one hope (Acts 26:8).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-that-elohim-should-raise-the-dead-the-resurrection-hope-of-the-fathers'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake* the resurrection is no new doctrine; the fathers themselves rise at the end of the days (Acts 26:8).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-that-elohim-should-raise-the-dead-the-resurrection-hope-of-the-fathers'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 13:32 — *the promise which was made unto the fathers* Paul names the same hope at Antioch he names before Agrippa (Acts 26:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-that-elohim-should-raise-the-dead-the-resurrection-hope-of-the-fathers'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 13:33 — *he hath raised up Yahusha (Jesus) again* the promise to the fathers fulfilled; the firstfruits already raised is the pledge of the resurrection-hope (Acts 26:8).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-that-elohim-should-raise-the-dead-the-resurrection-hope-of-the-fathers'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-26-the-light-and-the-voice-the-fullest-telling-of-the-damascus-road
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 9:4 — *Saul, Saul, why persecutest thou me?* the bare account of the voice from the light (Acts 26:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-the-light-and-the-voice-the-fullest-telling-of-the-damascus-road'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 9:5 — *I am Yahusha (Jesus) whom thou persecutest* the One in the light names himself; he who is Yahuah came in the flesh as Yahusha (Acts 26:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-the-light-and-the-voice-the-fullest-telling-of-the-damascus-road'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 22:7 — *I fell unto the ground, and heard a voice* the telling on the temple stairs to the people (Acts 26:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-the-light-and-the-voice-the-fullest-telling-of-the-damascus-road'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=22 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 22:8 — *I am Yahusha (Jesus) of Nazareth, whom thou persecutest* the same naming; the Formed who walked Yashar''el''s history names himself (Acts 26:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-the-light-and-the-voice-the-fullest-telling-of-the-damascus-road'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=22 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-26-to-open-their-eyes-the-servant-a-light-to-the-people-and-the-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 42:6 — *give thee for a covenant of the people, for a light of the Gentiles* the servant''s commission Paul now carries forward (Acts 26:18).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-to-open-their-eyes-the-servant-a-light-to-the-people-and-the-nations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 42:7 — *to open the blind eyes, to bring out the prisoners from the prison* word for word the task: open eyes, lead from darkness (Acts 26:18).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-to-open-their-eyes-the-servant-a-light-to-the-people-and-the-nations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 35:5 — *the eyes of the blind shall be opened* the opening of eyes is the sign of the ransomed returning to Zion (Acts 26:18).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-to-open-their-eyes-the-servant-a-light-to-the-people-and-the-nations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 61:1 — *to proclaim liberty to the captives, and the opening of the prison to them that are bound* the captives loosed are the dispersed receiving back their inheritance; faith the means of return (Acts 26:18).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-to-open-their-eyes-the-servant-a-light-to-the-people-and-the-nations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 49:6 — *raise up the tribes of Jacob … I will also give thee for a light to the Gentiles* the double commission: tribes raised AND light to the nations; the light beside the gathering, not in place of it (Acts 26:23).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-to-open-their-eyes-the-servant-a-light-to-the-people-and-the-nations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-26-none-other-than-moses-and-the-prophets-messiah-should-suffer-and-rise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:8 — *he was cut off out of the land of the living: for the transgression of my people was he stricken* that Messiah should suffer is Isaiah''s own word (Acts 26:23).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-none-other-than-moses-and-the-prophets-messiah-should-suffer-and-rise'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:12 — *he hath poured out his soul unto death … and bare the sin of many* the suffering and the portion that follows, both spoken by the prophet (Acts 26:23).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-none-other-than-moses-and-the-prophets-messiah-should-suffer-and-rise'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 16:10 — *neither wilt thou suffer thine Holy One to see corruption* that he should be the first to rise was sealed in David''s psalm (Acts 26:23).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-none-other-than-moses-and-the-prophets-messiah-should-suffer-and-rise'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 24:27 — *beginning at Moses and all the prophets, he expounded … the things concerning himself* the very lesson the risen Master taught; Paul adds nothing (Acts 26:22).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-none-other-than-moses-and-the-prophets-messiah-should-suffer-and-rise'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Luke 24:26 — *ought not Messiah (Christ) to have suffered these things, and to enter into his glory?* the suffering before the glory, the Master''s own framing (Acts 26:23).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-none-other-than-moses-and-the-prophets-messiah-should-suffer-and-rise'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Luke 24:46 — *thus it is written … Messiah (Christ) to suffer, and to rise from the dead the third day* written in Moses, the prophets, and the psalms (Acts 26:23).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-none-other-than-moses-and-the-prophets-messiah-should-suffer-and-rise'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Luke 24:47 — *repentance and remission of sins should be preached in his name among all nations* the repentance preached bears the works meet for repentance Paul names (Acts 26:20).'
  FROM cross_reference_threads t, cross_references x, _s217_a26_lookup sv, _s217_a26_lookup tv
 WHERE t.slug='acts-26-none-other-than-moses-and-the-prophets-messiah-should-suffer-and-rise'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=26 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
