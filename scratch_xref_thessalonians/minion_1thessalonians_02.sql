-- ----- fragment: minion_1thessalonians_02.sql (S233 1 Thessalonians 2) -----
-- =====================================================================
-- S233 minion — 1 THESSALONIANS 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 THESSALONIANS 2 (20 verses) — the apostle's manner among them, the word received as
--   the word of Elohim, the ⚠ persecutors who killed the Lord and the prophets, the crown of
--   rejoicing at his coming.
-- Tag: t102 (temp view _s233_t102_lookup).
-- Sort band: floor 8075, step 3 (8075, 8078, 8081, 8084 used; under 8100).
-- Source is ALWAYS the canon 1-thessalonians verse; targets span Tanakh + NT (no extras warranted).
-- Tiers per-row: canon target (Tanakh + NT) = 'free'.
--
-- GOVERNING FRAME: Paul, Silvanus and Timotheus write to the called-out ones at Thessalonica —
--   Yashar'el (Israel) and the grafted-in seed of the nations. ⚠ The high watchpoint is 2:14-16, the
--   verse-block about *the Yahudim (Jews): Who both killed the Lord Yahusha (Lord Jesus), and their own
--   prophets, and have persecuted us... for the wrath is come upon them to the uttermost.* This is NOT
--   a blanket curse on the Jewish people and NOT replacement theology. Paul is himself a Yahudi (Jew)
--   writing of the SPECIFIC persecutors — the same prophets-killed pattern the Tanakh and the Messiah
--   name (Nehemiah 9:26, 2 Chronicles 36:16, Matthew 23:31-37, Acts 7:52). The wrath falls on the
--   persecuting opposition, not on Israel-as-such — *Elohim (God) hath not cast away his people*
--   (Romans 11:1-2), woven in as the explicit guard. DO NOT render as "the Jews rejected / the church
--   replaces Israel."
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-11  the apostle's gentle, blameless, fatherly manner among them (not flattering, not covetous)
--           Tanakh: none warranted (the manner is descriptive; no load-bearing parallel)
--           Extras: none warranted   NT: none warranted
--   v.12    walk worthy of Elohim, who hath called you unto his kingdom and glory
--           Tanakh: Daniel 7:18, 7:27 (the saints take and possess the everlasting kingdom)
--           Extras: none warranted   NT: none warranted (the kingdom-call carried by Daniel 7)
--   v.13    ye received... not as the word of men, but as it is in truth, the word of Elohim
--           Tanakh: Jeremiah 1:9 (Behold, I have put my words in thy mouth), Deuteronomy 18:18
--                   (will put my words in his mouth... speak all that I shall command), Jeremiah
--                   15:16 (Thy words were found, and I did eat them)
--           Extras: none warranted   NT: none warranted (the prophetic-word root is the Tanakh)
--   v.14-16 ⚠ the persecutors: killed the Lord and their own prophets; the wrath come to the uttermost
--           Tanakh: Nehemiah 9:26 (slew thy prophets which testified against them), 2 Chronicles
--                   36:16 (misused his prophets, until the wrath of Yahuah arose)
--           Extras: none warranted   NT: Matthew 23:31 (children of them which killed the prophets),
--                   Matthew 23:37 (O Jerusalem... thou that killest the prophets), Acts 7:52 (which
--                   of the prophets have not your fathers persecuted?), Romans 11:1-2 (GUARD: Elohim
--                   hath not cast away his people)
--   v.17-18 taken from you for a short time... Satan hindered us
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.19-20 our hope, joy, crown of rejoicing... in the presence of our Lord at his coming (parousia)
--           Tanakh: Isaiah 62:3 (a crown of glory in the hand of Yahuah), Daniel 12:3 (they that be
--                   wise shall shine... they that turn many to righteousness as the stars)
--           Extras: none warranted   NT: Philippians 4:1 (my brethren... my joy and crown)
--
-- THREADS (slug -> target libraries):
--   8075 1-thessalonians-2-ye-received-it-as-the-word-of-elohim-jeremiah-1-deuteronomy-18  (Tanakh)
--   8078 1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11  (Tanakh + NT)  [⚠ WATCHPOINT]
--   8081 1-thessalonians-2-called-unto-his-kingdom-and-glory-daniel-7  (Tanakh)
--   8084 1-thessalonians-2-our-crown-of-rejoicing-at-his-coming-isaiah-62-daniel-12  (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s233_t102_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-thessalonians-2-ye-received-it-as-the-word-of-elohim-jeremiah-1-deuteronomy-18
  ('canon', '1-thessalonians', 2, 13, 'canon', 'jeremiah', 1, 9, 'free', E'*Then Yahuah (LORD) put forth his hand, and touched my mouth. And Yahuah (LORD) said unto me, Behold, I have put my words in thy mouth.* (Jeremiah 1:9). When Yahuah (LORD) called Jeremiah, the word in the prophet''s mouth was not the prophet''s own but Yahuah''s — *I have put my words in thy mouth.* This is why Paul gives thanks that the Thessalonians *received the word of Elohim (God) which ye heard of us, ye received it not as the word of men, but as it is in truth, the word of Elohim (God)* (1 Thessalonians 2:13). The apostle stands in the prophets'' line: what he speaks is the word Elohim (God) put in his mouth, and the hearers rightly took it as the word of Elohim (God), *which effectually worketh also in you that believe.*'),
  ('canon', '1-thessalonians', 2, 13, 'canon', 'deuteronomy', 18, 18, 'free', E'*I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth; and he shall speak unto them all that I shall command him.* (Deuteronomy 18:18). The pattern of the true messenger is set at Horeb: Yahuah (LORD) *will put my words in his mouth,* and he speaks not his own but *all that I shall command him.* So the word the Thessalonians received through Paul was not the word of men: *ye received it not as the word of men, but as it is in truth, the word of Elohim (God)* (1 Thessalonians 2:13). The test of Deuteronomy is whether the word is Yahuah''s; the Thessalonians discerned rightly, and the word worked in them as the living word of Elohim (God), not the speech of a man.'),
  ('canon', '1-thessalonians', 2, 13, 'canon', 'jeremiah', 15, 16, 'free', E'*Thy words were found, and I did eat them; and thy word was unto me the joy and rejoicing of mine heart: for I am called by thy name, O Yahuah Elohim (LORD God) of hosts.* (Jeremiah 15:16). Jeremiah received the word of Yahuah (LORD) as food and as joy — *thy word was unto me the joy and rejoicing of mine heart.* The Thessalonians received the same way, taking it *not as the word of men, but as it is in truth, the word of Elohim (God), which effectually worketh also in you that believe* (1 Thessalonians 2:13). The word found and eaten becomes the joy of the heart and the power at work within; what the prophet knew, the gathered ones at Thessalonica knew, because the word is one and the same — the word of Elohim (God).'),
  -- thread: 1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11  [⚠ WATCHPOINT]
  ('canon', '1-thessalonians', 2, 15, 'canon', 'nehemiah', 9, 26, 'free', E'*Nevertheless they were disobedient, and rebelled against thee, and cast thy law behind their backs, and slew thy prophets which testified against them to turn them to thee, and they wrought great provocations.* (Nehemiah 9:26). The Levites'' confession names an old and specific pattern: a rebellious party that *slew thy prophets which testified against them.* It is that very pattern Paul invokes of the persecutors who *both killed the Lord Yahusha (Lord Jesus), and their own prophets, and have persecuted us* (1 Thessalonians 2:15). Note what Nehemiah''s prayer also confesses — that Yahuah (LORD) *didst not utterly consume them, nor forsake them; for thou art a gracious and merciful Elohim (God)* (Nehemiah 9:31): the indictment falls on the prophet-killers, not on the people Yahuah (LORD) refuses to forsake. Paul, himself a Yahudi (Jew), names the same specific persecutors, not a curse on Yashar''el (Israel).'),
  ('canon', '1-thessalonians', 2, 16, 'canon', '2-chronicles', 36, 16, 'free', E'*But they mocked the messengers of Elohim (God), and despised his words, and misused his prophets, until the wrath of Yahuah (LORD) arose against his people, till there was no remedy.* (2 Chronicles 36:16). The chronicler shows the end of the pattern: when a generation *misused his prophets,* the *wrath of Yahuah (LORD) arose... till there was no remedy.* Paul speaks of the same mounting measure when the persecutors fill *up their sins alway: for the wrath is come upon them to the uttermost* (1 Thessalonians 2:16). The wrath is the just answer to the persecuting opposition who silence the messengers — the same word and the same wrath the Tanakh records — not a sentence pronounced over the covenant people as such.'),
  ('canon', '1-thessalonians', 2, 15, 'canon', 'matthew', 23, 31, 'free', E'*Wherefore ye be witnesses unto yourselves, that ye are the children of them which killed the prophets.* (Matthew 23:31). Yahusha (Jesus) named the persecuting party by the very pattern: *the children of them which killed the prophets,* who fill up *the measure of your fathers* (Matthew 23:32). Paul echoes his Master''s own words when he writes of those who *killed the Lord Yahusha (Lord Jesus), and their own prophets... to fill up their sins alway* (1 Thessalonians 2:15-16). It is the same indictment of the same prophet-killing opposition — the scribes and Pharisees Yahusha (Jesus) rebuked — not the nation of Yashar''el (Israel), to whom he longed to gather *thy children together, even as a hen gathereth her chickens* (Matthew 23:37).'),
  ('canon', '1-thessalonians', 2, 15, 'canon', 'matthew', 23, 37, 'free', E'*O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* (Matthew 23:37). Here is the heart of the matter and the guard against misreading it: the One who names *thou that killest the prophets* is the One who *would have gathered thy children together* — grief, not rejection. Paul writes in the same spirit of those who *killed the Lord Yahusha (Lord Jesus), and their own prophets, and have persecuted us* (1 Thessalonians 2:15). The lament falls on the prophet-killing resistance, while the yearning is to gather the children of Yashar''el (Israel); the wrath is for the persecutors, the longing is for the people.'),
  ('canon', '1-thessalonians', 2, 15, 'canon', 'acts', 7, 52, 'free', E'*Which of the prophets have not your fathers persecuted? and they have slain them which shewed before of the coming of the Just One; of whom ye have been now the betrayers and murderers:* (Acts 7:52). Stephen, a Yahudi (Jew) speaking to the council, frames the charge precisely as Paul will: *which of the prophets have not your fathers persecuted?* — the persecution of the prophets crowned by the killing of *the Just One.* Paul writes of those who *both killed the Lord Yahusha (Lord Jesus), and their own prophets, and have persecuted us* (1 Thessalonians 2:15). It is the one prophet-killed pattern, leveled at the specific persecutors who stoned Stephen and drove out the apostles — not a verdict against Israel, whom the same Stephen calls the people of the covenant and the living oracles.'),
  ('canon', '1-thessalonians', 2, 16, 'canon', 'romans', 11, 1, 'free', E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* (Romans 11:1). This is the explicit guard over the hard words of 1 Thessalonians 2. The same Paul who wrote of the persecutors who *killed the Lord Yahusha (Lord Jesus), and their own prophets* (1 Thessalonians 2:15) flatly denies that Elohim (God) has cast off his people — *Elohim (God) forbid* — and points to himself, *I also am an Israelite, of the seed of Abraham.* The wrath that *is come upon them to the uttermost* (2:16) falls on the persecuting opposition, never on Yashar''el (Israel) as such; the apostle who names the persecutors is himself a son of that people Elohim (God) will not abandon.'),
  ('canon', '1-thessalonians', 2, 16, 'canon', 'romans', 11, 2, 'free', E'*Elohim (God) hath not cast away his people which he foreknew. Wot ye not what the scripture saith of Elias? how he maketh intercession to Elohim (God) against Yashar''el (Israel),* (Romans 11:2). Paul states the principle outright: *Elohim (God) hath not cast away his people which he foreknew.* Even when Elijah cried *they have killed thy prophets* (Romans 11:3), Yahuah (LORD) answered that he had *reserved... seven thousand* (Romans 11:4) — a remnant always remains. So the persecutors of 1 Thessalonians 2:15-16, who *killed the Lord Yahusha (Lord Jesus), and their own prophets,* and on whom *the wrath is come... to the uttermost,* are the prophet-killing opposition, not the foreknown people. The hard verse must be read inside this guard: the wrath is for the persecutors; the people are not cast away.'),
  -- thread: 1-thessalonians-2-called-unto-his-kingdom-and-glory-daniel-7
  ('canon', '1-thessalonians', 2, 12, 'canon', 'daniel', 7, 18, 'free', E'*But the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever, even for ever and ever.* (Daniel 7:18). Daniel saw the destiny of the gathered righteous: *the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever.* This is the kingdom into which Paul says the Thessalonians are summoned, charging them to *walk worthy of Elohim (God), who hath called you unto his kingdom and glory* (1 Thessalonians 2:12). The everlasting kingdom of Daniel''s vision is the kingdom and glory of the calling; to walk worthy is to walk as those appointed to possess it with the saints of the El Elyon (most High).'),
  ('canon', '1-thessalonians', 2, 12, 'canon', 'daniel', 7, 27, 'free', E'*And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* (Daniel 7:27). The vision ends with the kingdom *given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom.* It is unto this very kingdom and glory that the called-out ones are summoned — Paul exhorts them to *walk worthy of Elohim (God), who hath called you unto his kingdom and glory* (1 Thessalonians 2:12). The kingdom Daniel saw given to the saints is the inheritance of the calling; the worthy walk is the manner of life that befits a people destined for an everlasting kingdom.'),
  -- thread: 1-thessalonians-2-our-crown-of-rejoicing-at-his-coming-isaiah-62-daniel-12
  ('canon', '1-thessalonians', 2, 19, 'canon', 'isaiah', 62, 3, 'free', E'*Thou shalt also be a crown of glory in the hand of Yahuah (LORD), and a royal diadem in the hand of thy Elohim (God).* (Isaiah 62:3). Isaiah promises restored Yashar''el (Israel) shall be *a crown of glory in the hand of Yahuah (LORD).* Paul speaks of his converts in the same key: *what is our hope, or joy, or crown of rejoicing? Are not even ye in the presence of our Lord Yahusha HaMashiach (Lord Jesus Christ) at his coming?* (1 Thessalonians 2:19). The gathered ones are the apostle''s crown as the redeemed people are Yahuah''s crown — held up not for self-glory but in the presence of the returning Lord at his coming. The crown is the redeemed people themselves, presented at the parousia.'),
  ('canon', '1-thessalonians', 2, 19, 'canon', 'daniel', 12, 3, 'free', E'*And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* (Daniel 12:3). Daniel promises that *they that turn many to righteousness* shall shine *as the stars for ever and ever.* Paul, who turned the Thessalonians from idols to the living Elohim (God), names them his glory at the end: *what is our hope, or joy, or crown of rejoicing? Are not even ye in the presence of our Lord Yahusha HaMashiach (Lord Jesus Christ) at his coming? For ye are our glory and joy* (1 Thessalonians 2:19-20). Those turned to righteousness are the shining reward of the one who turned them; the crown of rejoicing is the gathered people, displayed in glory at his coming.'),
  ('canon', '1-thessalonians', 2, 19, 'canon', 'philippians', 4, 1, 'free', E'*Therefore, my brethren dearly beloved and longed for, my joy and crown, so stand fast in Yahuah (Lord), my dearly beloved.* (Philippians 4:1). Paul calls another assembly the same thing he calls the Thessalonians: *my joy and crown.* To the Thessalonians he asks, *what is our hope, or joy, or crown of rejoicing? Are not even ye in the presence of our Lord Yahusha HaMashiach (Lord Jesus Christ) at his coming?* (1 Thessalonians 2:19). The apostle''s crown is never a trophy of his own making but the people themselves, beloved and longed for, to be presented standing fast in Yahuah (Lord) at the coming of the Lord.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s233_t102_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s233_t102_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-2-ye-received-it-as-the-word-of-elohim-jeremiah-1-deuteronomy-18',
       E'Ye received it not as the word of men, but as the word of Elohim (God) (Jeremiah 1, Deuteronomy 18)',
       E'Paul gives thanks for a particular discernment in the Thessalonians: *when ye received the word of Elohim (God) which ye heard of us, ye received it not as the word of men, but as it is in truth, the word of Elohim (God), which effectually worketh also in you that believe* (1 Thessalonians 2:13). The apostle stands in the line of the prophets, and the mark of the true messenger is that the word in his mouth is not his own. At Horeb the pattern was set: Yahuah (LORD) *will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth; and he shall speak unto them all that I shall command him* (Deuteronomy 18:18). When Yahuah (LORD) called Jeremiah he did the same — *Then Yahuah (LORD) put forth his hand, and touched my mouth. And Yahuah (LORD) said unto me, Behold, I have put my words in thy mouth* (Jeremiah 1:9). And the prophet who eats that word knows it as life and joy: *Thy words were found, and I did eat them; and thy word was unto me the joy and rejoicing of mine heart* (Jeremiah 15:16). The word the Thessalonians received was this word — placed by Elohim (God) in the mouth of his messenger, taken in not as the speech of men but as the living word that works in those who believe. They discerned it rightly, and it bore its proper fruit in them.',
       sv.verse_id, ev.verse_id, 'free', 8075
  FROM _s233_t102_lookup sv, _s233_t102_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11',
       E'Who killed the Lord and their own prophets — the prophets-killed pattern, not a curse on Israel (Nehemiah 9, Romans 11)',
       E'Paul writes the hardest words of the letter: the Thessalonians *have suffered like things of your own countrymen, even as they have of the Yahudim (Jews): Who both killed the Lord Yahusha (Lord Jesus), and their own prophets, and have persecuted us; and they please not Elohim (God), and are contrary to all men: Forbidding us to speak to the Gentiles that they might be saved, to fill up their sins alway: for the wrath is come upon them to the uttermost* (1 Thessalonians 2:14-16). Read this exactly as it stands: it is NOT a blanket curse on the Jewish people, and NOT replacement theology. Paul is himself a Yahudi (Jew); he names the SPECIFIC persecutors by the one pattern the Tanakh and the Messiah named — the killing of the prophets. The Levites confessed it of old: the rebellious party *slew thy prophets which testified against them to turn them to thee* (Nehemiah 9:26), yet the same prayer confesses that Yahuah (LORD) *didst not utterly consume them, nor forsake them* (Nehemiah 9:31). The chronicler shows where the pattern ends: when men *misused his prophets,* the *wrath of Yahuah (LORD) arose against his people, till there was no remedy* (2 Chronicles 36:16) — the very mounting measure Paul means when he says they *fill up their sins alway: for the wrath is come upon them to the uttermost.* Yahusha (Jesus) named the persecutors the same way: *ye are the children of them which killed the prophets* (Matthew 23:31), even as he wept, *O Jerusalem, Jerusalem, thou that killest the prophets... how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* (Matthew 23:37) — grief, not rejection. Stephen, a Yahudi (Jew) before the council, charged the same: *which of the prophets have not your fathers persecuted? and they have slain them which shewed before of the coming of the Just One* (Acts 7:52). And the guard is set by Paul''s own hand: *Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham* (Romans 11:1); *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The wrath falls on the prophet-killing opposition that silenced the messengers and forbade the gospel to the nations — never on Yashar''el (Israel) as such. The apostle who names the persecutors is himself a son of the people Elohim (God) will not abandon.',
       sv.verse_id, ev.verse_id, 'free', 8078
  FROM _s233_t102_lookup sv, _s233_t102_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-2-called-unto-his-kingdom-and-glory-daniel-7',
       E'Called unto his kingdom and glory — the saints take the everlasting kingdom (Daniel 7)',
       E'Paul charges the Thessalonians as a father his children, *That ye would walk worthy of Elohim (God), who hath called you unto his kingdom and glory* (1 Thessalonians 2:12). The kingdom and glory of the calling is no vague hope: Daniel saw it given to the gathered righteous. *The saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever, even for ever and ever* (Daniel 7:18); and again, *the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him* (Daniel 7:27). This is the kingdom into which the called-out ones are summoned — the everlasting kingdom of Daniel''s vision, the inheritance of the saints. To walk worthy of Elohim (God) is to walk as those appointed to possess that kingdom with the saints of the El Elyon (most High); the calling and the worthy walk belong together, for the people of the kingdom must live as the kingdom''s heirs.',
       sv.verse_id, ev.verse_id, 'free', 8081
  FROM _s233_t102_lookup sv, _s233_t102_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-2-our-crown-of-rejoicing-at-his-coming-isaiah-62-daniel-12',
       E'Our hope, joy, and crown of rejoicing at his coming (Isaiah 62, Daniel 12)',
       E'Paul ends the chapter with the apostle''s reward laid up at the return of the Lord: *what is our hope, or joy, or crown of rejoicing? Are not even ye in the presence of our Lord Yahusha HaMashiach (Lord Jesus Christ) at his coming? For ye are our glory and joy* (1 Thessalonians 2:19-20). The crown of rejoicing is no trophy of his own making — it is the gathered people themselves, presented at his coming. Isaiah said the redeemed people are exactly that: restored Yashar''el (Israel) shall be *a crown of glory in the hand of Yahuah (LORD), and a royal diadem in the hand of thy Elohim (God)* (Isaiah 62:3). And those who turned them have their shining reward: *they that turn many to righteousness as the stars for ever and ever* (Daniel 12:3). Paul calls the Philippians the same — *my brethren dearly beloved and longed for, my joy and crown, so stand fast in Yahuah (Lord)* (Philippians 4:1). The crown is the people, beloved and longed for, the harvest of those turned from idols to the living Elohim (God) — to be displayed not for the apostle''s glory but in the presence of the Lord at his coming, the parousia toward which the whole letter leans.',
       sv.verse_id, ev.verse_id, 'free', 8084
  FROM _s233_t102_lookup sv, _s233_t102_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=2 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-thessalonians-2-ye-received-it-as-the-word-of-elohim-jeremiah-1-deuteronomy-18
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 1:9 — *Behold, I have put my words in thy mouth* the word in the prophet''s mouth is Yahuah''s own; the Thessalonians *received it not as the word of men, but... the word of Elohim (God)* (1 Thessalonians 2:13).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-ye-received-it-as-the-word-of-elohim-jeremiah-1-deuteronomy-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 18:18 — *will put my words in his mouth; and he shall speak... all that I shall command him* the Horeb pattern of the true messenger; the word received *not as the word of men* (1 Thessalonians 2:13).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-ye-received-it-as-the-word-of-elohim-jeremiah-1-deuteronomy-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 15:16 — *Thy words were found, and I did eat them; and thy word was unto me the joy and rejoicing of mine heart* the word eaten as joy and power; *which effectually worketh also in you that believe* (1 Thessalonians 2:13).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-ye-received-it-as-the-word-of-elohim-jeremiah-1-deuteronomy-18'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=15 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Nehemiah 9:26 — *slew thy prophets which testified against them* the old prophets-killed pattern; the persecutors who *killed the Lord Yahusha (Lord Jesus), and their own prophets* (1 Thessalonians 2:15) — yet Yahuah *forsookest them not* (Nehemiah 9:31).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 36:16 — *misused his prophets, until the wrath of Yahuah (LORD) arose against his people, till there was no remedy* the mounting measure; *to fill up their sins alway: for the wrath is come upon them to the uttermost* (1 Thessalonians 2:16).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=36 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 23:31 — *ye are the children of them which killed the prophets* Yahusha (Jesus) naming the persecuting party; Paul echoes his Master of those who *killed... their own prophets* (1 Thessalonians 2:15).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 23:37 — *O Jerusalem... thou that killest the prophets... how often would I have gathered thy children together* the lament that is grief, not rejection; the wrath is for the persecutors, the longing is for the people (1 Thessalonians 2:15).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 7:52 — *which of the prophets have not your fathers persecuted? and they have slain them which shewed before of the coming of the Just One* Stephen, a Yahudi (Jew), naming the same pattern; those who *killed the Lord Yahusha... and their own prophets* (1 Thessalonians 2:15).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Romans 11:1 — *Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite* the GUARD; the wrath of 1 Thessalonians 2:16 falls on the persecutors, never on Yashar''el (Israel), and Paul is himself a son of that people.'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Romans 11:2 — *Elohim (God) hath not cast away his people which he foreknew* the principle that fixes the reading; even Elijah''s *they have killed thy prophets* met a reserved remnant (Romans 11:3-4). The hard verse stands inside this guard (1 Thessalonians 2:16).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-who-killed-the-lord-and-their-own-prophets-the-wrath-nehemiah-9-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-2-called-unto-his-kingdom-and-glory-daniel-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:18 — *the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever* the everlasting kingdom of the calling; *who hath called you unto his kingdom and glory* (1 Thessalonians 2:12).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-called-unto-his-kingdom-and-glory-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:27 — *the kingdom... shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom* the inheritance of the calling; walk worthy of *his kingdom and glory* (1 Thessalonians 2:12).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-called-unto-his-kingdom-and-glory-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-2-our-crown-of-rejoicing-at-his-coming-isaiah-62-daniel-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 62:3 — *Thou shalt also be a crown of glory in the hand of Yahuah (LORD), and a royal diadem* the redeemed people as Yahuah''s crown; the gathered ones are the apostle''s *crown of rejoicing... at his coming* (1 Thessalonians 2:19).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-our-crown-of-rejoicing-at-his-coming-isaiah-62-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:3 — *they that turn many to righteousness as the stars for ever and ever* the shining reward of the one who turns them; *ye are our glory and joy* (1 Thessalonians 2:20).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-our-crown-of-rejoicing-at-his-coming-isaiah-62-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Philippians 4:1 — *my brethren dearly beloved and longed for, my joy and crown* the apostle''s crown is the people themselves; *Are not even ye... at his coming?* (1 Thessalonians 2:19).'
  FROM cross_reference_threads t, cross_references x, _s233_t102_lookup sv, _s233_t102_lookup tv
 WHERE t.slug='1-thessalonians-2-our-crown-of-rejoicing-at-his-coming-isaiah-62-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
