-- ----- fragment: minion_acts_19.sql (S217 Acts 19) -----
-- =====================================================================
-- S217 minion — ACTS 19 FULL-LIBRARY cross-references
-- =====================================================================
-- Range:  ACTS 19.  Tag: a19 (temp view _s217_a19_lookup).  Sort band: 5725-5740.
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- WATCHPOINTS (Red Lines, Christology, son-of-Adam, sola-fide):
--  * The twelve disciples / John's baptism (19:1-7): John's baptism is COMPLETED, not
--    repudiated — John baptized unto repentance and pointed forward to the One coming after
--    him (Acts 13:24; Matthew 3:11; John 1:26-27), and the Spirit poured at the laying on of
--    hands (Acts 1:5) is the baptism John always pointed to. The Spirit and the word/way are
--    inseparable (Red Line #6) — the Spirit is the seal of the One John preached, not a thing
--    apart. Twelve men, the number of the tribes: the down-payment of the gathering at Ephesus.
--  * The name not a formula for the unsent (19:13-17, the sons of Sceva): *Yahusha (Jesus) I
--    know, and Paul I know; but who are ye?* The name is not a power-tool wielded by the
--    unsent. Matthew 7:22-23's *I never knew you* is spoken to those who used the name without
--    being known by him — the post-harvest sifting of the unfruitful (Red Line #11), NOT a
--    verdict on tares. Luke 10:17's seventy were SENT; the devils were subject through the name
--    to the sent. Read as the name's authority belonging to the sent and the known, never as a
--    formula or technique.
--  * The idol polemic (19:26-27, *they be no gods, which are made with hands*): the Tanakh's
--    own polemic against the work of men's hands (Isaiah 44, Jeremiah 10, Psalm 115, Habakkuk
--    2) and Wisdom of Solomon's *that which is made with hands is cursed.* The living Elohim
--    (God) who made the heavens against the dumb idol that cannot speak — the Formed-one's own
--    word through the prophets, now preached by Paul against Diana.
--  * The books burned (19:18-19): turning from the abominations of divination (Deuteronomy
--    18:10-12) — the price counted, the curious arts renounced. Repentance unto the way, the
--    homecoming that turns from what Yahuah (LORD) calls abomination. Not a how-to of practice
--    but the dismantling of the divination the nations hearkened to.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 19:
--   v.1-7   the twelve disciples / John's baptism completed
--           Tanakh: none warranted (the forward-pointing of John carried in the NT targets)
--           Extras: none warranted
--           NT: Acts 13:24, Matthew 3:11, John 1:26, John 1:27, Acts 1:5
--   v.8-10  synagogue / school of Tyrannus / all Asia heard the word
--           Tanakh: Isaiah 55:11 (the word that goeth forth shall not return void; carried in the v.20 grew-and-prevailed thread)
--           Extras: none warranted   NT: none warranted (narrative)
--   v.11-12 special miracles / handkerchiefs   Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.13-17 the seven sons of Sceva / the name  Tanakh: none warranted (the name-over-spirits carried in NT)  Extras: none warranted
--           NT: Matthew 7:22, Matthew 7:23, Luke 10:17, Mark 9:39, Acts 16:17
--   v.18-19 confessed deeds / burned the books   Tanakh: Deuteronomy 18:10, Deuteronomy 18:12  Extras: none warranted  NT: none warranted
--   v.20    so mightily grew the word and prevailed  Tanakh: Isaiah 55:11  Extras: none warranted  NT: none warranted
--   v.21-22 Paul purposed ... I must also see Rome   Tanakh: none warranted  Extras: none warranted  NT: Acts 23:11 (Acts<->Acts: the Lord confirms the witness at Rome)
--   v.23-34 the riot of Demetrius / Diana / no gods made with hands
--           Tanakh: Isaiah 44:9, Jeremiah 10:5, Jeremiah 10:11, Psalm 115:4, Habakkuk 2:18
--           Extras: Wisdom of Solomon 14:8 (that which is made with hands is cursed)   NT: none warranted
--   v.35-41 the townclerk appeases the assembly   Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--
-- THREADS (slug -> target libraries):
--   5725 acts-19-johns-baptism-completed-the-one-who-comes-after-and-the-spirit  (NT)
--   5728 acts-19-the-name-is-not-a-formula-for-the-unsent-the-sons-of-sceva       (NT)
--   5731 acts-19-they-burned-their-books-turning-from-the-abominations           (Tanakh)
--   5734 acts-19-so-mightily-grew-the-word-of-god-and-prevailed                  (Tanakh)
--   5737 acts-19-i-must-also-see-rome-the-witness-the-lord-confirms              (NT, Acts<->Acts)
--   5740 acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic      (Tanakh + Extras)
-- =====================================================================

CREATE TEMP VIEW _s217_a19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-19-johns-baptism-completed-the-one-who-comes-after-and-the-spirit
  ('canon', 'acts', 19, 3, 'canon', 'acts', 13, 24, 'free', E'*When John had first preached before his coming the baptism of repentance to all the people of Yashar''el (Israel).* (Acts 13:24). The twelve at Ephesus had received *John''s baptism* (Acts 19:3) — and John''s baptism was never an end in itself. It was *the baptism of repentance* preached *before his coming,* turning the people toward the One who was to come. The Ephesian disciples are not being told John was wrong; they are being shown what John''s baptism always pointed to and is now fulfilled in.'),
  ('canon', 'acts', 19, 4, 'canon', 'matthew', 3, 11, 'free', E'*I indeed baptize you with water unto repentance: but he that cometh after me is mightier than I, whose shoes I am not worthy to bear: he shall baptize you with the Ruach HaKodesh (Holy Spirit), and with fire:* (Matthew 3:11). Paul tells the Ephesians the very thing John himself said: *John verily baptized with the baptism of repentance, saying unto the people, that they should believe on him which should come after him, that is, on HaMashiach Yahusha (Christ Jesus)* (Acts 19:4). John baptized with water and pointed forward; the One coming after baptizes with the Ruach HaKodesh (Holy Spirit). The water-baptism was the pointing; the Spirit is the One pointed to.'),
  ('canon', 'acts', 19, 4, 'canon', 'john', 1, 26, 'free', E'*John answered them, saying, I baptize with water: but there standeth one among you, whom ye know not;* (John 1:26). John''s own testimony was that his water-baptism stood in the shadow of Another *whom ye know not* — the One *which should come after him* (Acts 19:4). The Ephesian twelve had John''s water and not yet the One John named; Paul brings them the One who was always standing just beyond the water.'),
  ('canon', 'acts', 19, 4, 'canon', 'john', 1, 27, 'free', E'*He it is, who coming after me is preferred before me, whose shoe''s latchet I am not worthy to unloose.* (John 1:27). John pointed past himself to the One *coming after* — the same word Paul puts in John''s mouth at Ephesus: *they should believe on him which should come after him, that is, on HaMashiach Yahusha (Christ Jesus)* (Acts 19:4). The forerunner''s whole office was the finger pointing forward; the believing the twelve are brought to is belief in the One the finger named.'),
  ('canon', 'acts', 19, 6, 'canon', 'acts', 1, 5, 'free', E'*For John truly baptized with water; but ye shall be baptized with the Ruach HaKodesh (Holy Spirit) not many days hence.* (Acts 1:5). The Master''s own word divides the water of John from the Spirit to come — and at Ephesus the division is closed: *when Paul had laid his hands upon them, the Ruach HaKodesh (Holy Spirit) came on them; and they spake with tongues, and prophesied* (Acts 19:6). The baptism John always pointed to falls on the twelve. The Spirit is not a thing apart from the way they believed; he is the seal of the One John preached.'),
  -- thread: acts-19-the-name-is-not-a-formula-for-the-unsent-the-sons-of-sceva
  ('canon', 'acts', 19, 13, 'canon', 'matthew', 7, 22, 'free', E'*Many will say to me in that day, Yahuah (Lord), Yahuah (Lord), have we not prophesied in thy name? and in thy name have cast out devils? and in thy name done many wonderful works?* (Matthew 7:22). The vagabond exorcists *took upon them to call over them which had evil spirits the name of the Lord Yahusha (Lord Jesus), saying, We adjure you by Yahusha (Jesus) whom Paul preacheth* (Acts 19:13). The name is not a tool in the hand of the unsent. Those who use the name without being known by him are the ones to whom the word *I never knew you* is spoken — the name borrowed, the man unknown.'),
  ('canon', 'acts', 19, 15, 'canon', 'matthew', 7, 23, 'free', E'*And then will I profess unto them, I never knew you: depart from me, ye that work iniquity.* (Matthew 7:23). The evil spirit makes the same distinction the Master makes: *Yahusha (Jesus) I know, and Paul I know; but who are ye?* (Acts 19:15). Even the demon knows the difference between the sent and the borrower. The name carries no power for the man the One it names *never knew* — the sons of Sceva flee naked and wounded, exposed as the unknown who handled what was not theirs.'),
  ('canon', 'acts', 19, 13, 'canon', 'luke', 10, 17, 'free', E'*And the seventy returned again with joy, saying, Yahuah (Lord), even the devils are subject unto us through thy name.* (Luke 10:17). The seventy were SENT, and to the sent the devils were subject through the name. The sons of Sceva were not sent — they *took upon them* (Acts 19:13) a name they had no commission to wield. The same name that bows the spirits for those the Master sends does nothing for those who snatch it up as a formula.'),
  ('canon', 'acts', 19, 15, 'canon', 'mark', 9, 39, 'free', E'*But Yahusha (Jesus) said, Forbid him not: for there is no man which shall do a miracle in my name, that can lightly speak evil of me.* (Mark 9:39). A true work in the name binds a man to the One named. But the sons of Sceva do no work at all — the spirit answers *Yahusha (Jesus) I know, and Paul I know; but who are ye?* (Acts 19:15) and overcomes them. The name does not honour the borrower; it exposes him. The contrast is sharp: the one casting out in his name truly cannot speak evil of him, while the one merely invoking the name is left naked.'),
  ('canon', 'acts', 19, 13, 'canon', 'acts', 16, 17, 'free', E'*The same followed Paul and us, and cried, saying, These men are the servants of the El Elyon (most high God), which shew unto us the way of salvation.* (Acts 16:17). Even the spirit of divination at Philippi confessed who the sent men were — *the servants of the El Elyon (most high God).* So too at Ephesus the evil spirit knows Paul and knows Yahusha (Jesus), but not the seven who borrow the name (Acts 19:13,15). The spirits recognize the sent; what they will not yield to is the unsent mouthing the name as an incantation.'),
  -- thread: acts-19-they-burned-their-books-turning-from-the-abominations
  ('canon', 'acts', 19, 19, 'canon', 'deuteronomy', 18, 10, 'free', E'*There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch,* (Deuteronomy 18:10). *Many of them also which used curious arts brought their books together, and burned them before all men* (Acts 19:19). The curious arts are the very divination Moses forbade — the enchantments, the observing of times, the wizardry the nations practiced. The burning of the books is the turning Moses called for: the abomination renounced, cast into the fire, the price of it counted and let go.'),
  ('canon', 'acts', 19, 19, 'canon', 'deuteronomy', 18, 12, 'free', E'*For all that do these things are an abomination unto Yahuah (LORD): and because of these abominations Yahuah Elohayka (the LORD thy God) doth drive them out from before thee.* (Deuteronomy 18:12). The divination that made the nations an abomination — and drove them from the land — is what the Ephesian believers now burn from their own hands: they *counted the price of them, and found it fifty thousand pieces of silver* (Acts 19:19). The homecoming turns from what Yahuah (LORD) calls abomination; the books go into the fire and the word of Elohim (God) grows.'),
  -- thread: acts-19-so-mightily-grew-the-word-of-god-and-prevailed
  ('canon', 'acts', 19, 20, 'canon', 'isaiah', 55, 11, 'free', E'*So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it.* (Isaiah 55:11). *So mightily grew the word of Elohim (God) and prevailed* (Acts 19:20), so that *all they which dwelt in Asia heard the word of the Lord Yahusha (Lord Jesus), both Yahudim (Jews) and Greeks* (Acts 19:10). The word that goeth forth from his mouth does not return void; it accomplishes and prospers in the thing whereto he sent it. Two years in the school of Tyrannus and all Asia hearing — the word prospering, exactly as the prophet said it would.'),
  -- thread: acts-19-i-must-also-see-rome-the-witness-the-lord-confirms
  ('canon', 'acts', 19, 21, 'canon', 'acts', 23, 11, 'free', E'*And the night following Yahuah (Lord) stood by him, and said, Be of good cheer, Paul: for as thou hast testified of me in Jerusalem, so must thou bear witness also at Rome.* (Acts 23:11). At Ephesus Paul *purposed in the spirit … to go to Jerusalem, saying, After I have been there, I must also see Rome* (Acts 19:21). What he purposed in the spirit, the Lord himself stands by him in the night to confirm: the witness at Jerusalem and then at Rome. The purpose was not Paul''s ambition; it was the Lord''s sending, spoken back to him as comfort when the road grew dark.'),
  -- thread: acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic
  ('canon', 'acts', 19, 26, 'canon', 'isaiah', 44, 9, 'free', E'*They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* (Isaiah 44:9). Demetrius rages that Paul *hath persuaded and turned away much people, saying that they be no gods, which are made with hands* (Acts 19:26). But Paul preaches nothing new: Isaiah long since named the makers of graven images vanity, the idol no god at all. The silversmith''s shrines for Diana are the very delectable things that shall not profit — the work of hands that see not, nor know.'),
  ('canon', 'acts', 19, 26, 'canon', 'jeremiah', 10, 5, 'free', E'*They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* (Jeremiah 10:5). The idols *which are made with hands* (Acts 19:26) cannot speak, cannot walk, cannot do evil or good — they must be carried. Jeremiah''s polemic stands behind Paul''s preaching at Ephesus: the great goddess Diana, for all her magnificence, is a thing that must be borne, no god to be feared.'),
  ('canon', 'acts', 19, 27, 'canon', 'jeremiah', 10, 11, 'free', E'*Thus shall ye say unto them, The gods that have not made the heavens and the earth, even they shall perish from the earth, and from under these heavens.* (Jeremiah 10:11). The craftsmen fear *that the temple of the great goddess Diana should be despised, and her magnificence should be destroyed* (Acts 19:27). Jeremiah pronounced the sentence already: the gods that did not make the heavens and the earth shall perish. Diana''s magnificence is the magnificence of a god that made nothing — and what made nothing shall be unmade.'),
  ('canon', 'acts', 19, 26, 'canon', 'psalms', 115, 4, 'free', E'*Their idols are silver and gold, the work of men''s hands.* (Psalm 115:4). Demetrius is a *silversmith, which made silver shrines for Diana* (Acts 19:24) — and the psalm names exactly that: idols of silver and gold, the work of men''s hands. Paul''s charge that *they be no gods, which are made with hands* (Acts 19:26) is the psalm''s own verdict on the silversmith''s trade. The hands that fashion the god prove it is no god.'),
  ('canon', 'acts', 19, 26, 'canon', 'habakkuk', 2, 18, 'free', E'*What profiteth the graven image that the maker thereof hath graven it; the molten image, and a teacher of lies, that the maker of his work trusteth therein, to make dumb idols?* (Habakkuk 2:18). The molten image is *a teacher of lies* — and the lie the craftsmen of Ephesus defend is that Diana, made with hands, is a god (Acts 19:26). Habakkuk asks what such an image profits its maker; Paul has turned away much people from trusting the dumb idol. The maker trusts the work of his own hands, and the work cannot speak.'),
  ('canon', 'acts', 19, 26, 'apocrypha', 'the-wisdom-of-solomon', 14, 8, 'extras', E'*But that which is made with hands is cursed, as well it, as he that made it: he, because he made it; and it, because, being corruptible, it was called god.* (Wisdom of Solomon 14:8). Paul''s phrase is exact — *they be no gods, which are made with hands* (Acts 19:26) — and the wisdom of the fathers had already said it: that which is made with hands is cursed, both the idol and its maker. The corruptible thing called god, and the man who called it so, fall under one verdict. The idol of Diana and the silversmith who shaped her share it.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-19-johns-baptism-completed-the-one-who-comes-after-and-the-spirit',
       E'John''s baptism completed — the One who comes after, and the Spirit',
       E'At Ephesus Paul finds *certain disciples* who had received *John''s baptism* (Acts 19:3) and had *not so much as heard whether there be any Ruach HaKodesh (Holy Spirit)* (Acts 19:2). John''s baptism is not repudiated; it is completed. *John verily baptized with the baptism of repentance, saying unto the people, that they should believe on him which should come after him, that is, on HaMashiach Yahusha (Christ Jesus)* (Acts 19:4). This was John''s own testimony from the first: *I baptize with water: but there standeth one among you, whom ye know not* (John 1:26), *He it is, who coming after me is preferred before me, whose shoe''s latchet I am not worthy to unloose* (John 1:27), and *he that cometh after me is mightier than I … he shall baptize you with the Ruach HaKodesh (Holy Spirit), and with fire* (Matthew 3:11). The forerunner''s whole office was the finger pointing forward; he had *first preached before his coming the baptism of repentance to all the people of Yashar''el (Israel)* (Acts 13:24). And the Master had divided the water from the Spirit by his own word: *John truly baptized with water; but ye shall be baptized with the Ruach HaKodesh (Holy Spirit) not many days hence* (Acts 1:5). So at Ephesus the division is closed — *when Paul had laid his hands upon them, the Ruach HaKodesh (Holy Spirit) came on them; and they spake with tongues, and prophesied* (Acts 19:6). The Spirit is not a thing apart from the way they believed; he is the seal of the One John always pointed to. *And all the men were about twelve* (Acts 19:7) — the number of the tribes, the down-payment of the gathering at Ephesus.',
       sv.verse_id, ev.verse_id, 'free', 5725
  FROM _s217_a19_lookup sv, _s217_a19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=19 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-19-the-name-is-not-a-formula-for-the-unsent-the-sons-of-sceva',
       E'The name is not a formula for the unsent — the sons of Sceva',
       E'*Then certain of the vagabond Yahudim (Jews), exorcists, took upon them to call over them which had evil spirits the name of the Lord Yahusha (Lord Jesus), saying, We adjure you by Yahusha (Jesus) whom Paul preacheth* (Acts 19:13). The seven sons of Sceva treat the name as a technique — a power-word to be wielded by anyone who hears it work. But the name carries no power for the unsent. *And the evil spirit answered and said, Yahusha (Jesus) I know, and Paul I know; but who are ye?* (Acts 19:15) — and the man in whom the spirit was leaped on them and overcame them, so they fled naked and wounded. Even the demon makes the distinction the Master makes. To those who used the name without being known by him, the word is *Many will say to me in that day, Yahuah (Lord), Yahuah (Lord), have we not prophesied in thy name? and in thy name have cast out devils?* (Matthew 7:22) — *and then will I profess unto them, I never knew you: depart from me, ye that work iniquity* (Matthew 7:23). The name does not honour the borrower; it exposes him. To the SENT it is otherwise: *the seventy returned again with joy, saying, Yahuah (Lord), even the devils are subject unto us through thy name* (Luke 10:17), for *there is no man which shall do a miracle in my name, that can lightly speak evil of me* (Mark 9:39). The spirits recognize the sent — even the divination spirit at Philippi confessed *these men are the servants of the El Elyon (most high God)* (Acts 16:17). What they will not yield to is the unsent mouthing the name as an incantation. The name belongs to the known and the sent, never to the one who snatches it up as a formula.',
       sv.verse_id, ev.verse_id, 'free', 5728
  FROM _s217_a19_lookup sv, _s217_a19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=19 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-19-they-burned-their-books-turning-from-the-abominations',
       E'They burned their books — turning from the abominations',
       E'*And many that believed came, and confessed, and shewed their deeds. Many of them also which used curious arts brought their books together, and burned them before all men: and they counted the price of them, and found it fifty thousand pieces of silver* (Acts 19:18-19). The curious arts are the divination Moses forbade in the land: *There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch* (Deuteronomy 18:10). These are the very things that made the nations an abomination — *for all that do these things are an abomination unto Yahuah (LORD): and because of these abominations Yahuah Elohayka (the LORD thy God) doth drive them out from before thee* (Deuteronomy 18:12). The burning of the books is the turning Moses called for: the abomination renounced, the price of it counted and let go, cast into the fire before all men. This is the homecoming — not a new rulebook handed to the Ephesians but the dismantling of the divination the nations hearkened to, and the word of Elohim (God) growing where the books once stood.',
       sv.verse_id, ev.verse_id, 'free', 5731
  FROM _s217_a19_lookup sv, _s217_a19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=19 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-19-so-mightily-grew-the-word-of-god-and-prevailed',
       E'So mightily grew the word of Elohim (God) and prevailed',
       E'Two years in the school of Tyrannus, *so that all they which dwelt in Asia heard the word of the Lord Yahusha (Lord Jesus), both Yahudim (Jews) and Greeks* (Acts 19:10); and after the books were burned, *so mightily grew the word of Elohim (God) and prevailed* (Acts 19:20). This is the prophet''s own promise at work: *So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it* (Isaiah 55:11). The word that goeth forth from his mouth does not return void — it accomplishes and prospers in the thing whereto he sent it. All Asia hearing, the word growing and prevailing where divination once held the city: the proclamation of the kingdom prospering exactly as Isaiah said it would, gathering the hearers the Father sends it to.',
       sv.verse_id, ev.verse_id, 'free', 5734
  FROM _s217_a19_lookup sv, _s217_a19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=19 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-19-i-must-also-see-rome-the-witness-the-lord-confirms',
       E'I must also see Rome — the witness the Lord confirms',
       E'*After these things were ended, Paul purposed in the spirit, when he had passed through Macedonia and Achaia, to go to Jerusalem, saying, After I have been there, I must also see Rome* (Acts 19:21). What Paul purposed in the spirit at Ephesus the Lord himself stands by him to confirm when the road has grown dark in Jerusalem: *And the night following Yahuah (Lord) stood by him, and said, Be of good cheer, Paul: for as thou hast testified of me in Jerusalem, so must thou bear witness also at Rome* (Acts 23:11). The purpose was not Paul''s ambition spun out of his own plans; it was the Lord''s sending, spoken first as a stirring in the spirit and then spoken back to him as comfort in the night. Jerusalem first, then Rome — the witness the Lord intended, confirmed by the One who stood by him.',
       sv.verse_id, ev.verse_id, 'free', 5737
  FROM _s217_a19_lookup sv, _s217_a19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=19 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic',
       E'They be no gods, which are made with hands — the idol polemic',
       E'Demetrius the silversmith, *which made silver shrines for Diana* (Acts 19:24), gathers the craftsmen and rages: *not alone at Ephesus, but almost throughout all Asia, this Paul hath persuaded and turned away much people, saying that they be no gods, which are made with hands* (Acts 19:26) — and the fear is *that the temple of the great goddess Diana should be despised, and her magnificence should be destroyed* (Acts 19:27). But Paul preaches nothing new under the sun; the Tanakh''s own polemic against the work of men''s hands stands behind every word. *They that make a graven image are all of them vanity … they see not, nor know* (Isaiah 44:9). *Their idols are silver and gold, the work of men''s hands* (Psalm 115:4) — the silversmith''s very trade named. *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go … for they cannot do evil, neither also is it in them to do good* (Jeremiah 10:5). The molten image is *a teacher of lies … to make dumb idols* (Habakkuk 2:18). And the sentence is already pronounced: *The gods that have not made the heavens and the earth, even they shall perish from the earth, and from under these heavens* (Jeremiah 10:11). The wisdom of the fathers said it plainly too: *that which is made with hands is cursed, as well it, as he that made it: he, because he made it; and it, because, being corruptible, it was called god* (Wisdom of Solomon 14:8). Diana''s magnificence is the magnificence of a god that made nothing — and what made nothing, what is made with hands, shall be unmade. The living Elohim (God) who stretched out the heavens against the dumb idol that cannot speak: this is what Paul preached, and all Asia heard.',
       sv.verse_id, ev.verse_id, 'extras', 5740
  FROM _s217_a19_lookup sv, _s217_a19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=19 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-19-johns-baptism-completed-the-one-who-comes-after-and-the-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 13:24 — *When John had first preached before his coming the baptism of repentance* John''s baptism preached before the One coming, never an end in itself (Acts 19:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-johns-baptism-completed-the-one-who-comes-after-and-the-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 3:11 — *he that cometh after me is mightier than I … he shall baptize you with the Ruach HaKodesh (Holy Spirit)* John''s own word: water points to the One who baptizes with the Spirit (Acts 19:4).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-johns-baptism-completed-the-one-who-comes-after-and-the-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 1:26 — *I baptize with water: but there standeth one among you, whom ye know not* the One standing just beyond the water, whom the twelve had not yet known (Acts 19:4).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-johns-baptism-completed-the-one-who-comes-after-and-the-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 1:27 — *who coming after me is preferred before me* the *coming after* John pointed to, the One the twelve are brought to believe (Acts 19:4).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-johns-baptism-completed-the-one-who-comes-after-and-the-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 1:5 — *John truly baptized with water; but ye shall be baptized with the Ruach HaKodesh (Holy Spirit)* the division closed when the Spirit falls on the twelve (Acts 19:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-johns-baptism-completed-the-one-who-comes-after-and-the-spirit'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-19-the-name-is-not-a-formula-for-the-unsent-the-sons-of-sceva
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:22 — *have we not … in thy name have cast out devils?* the name borrowed by those not known by him, as the exorcists took it up (Acts 19:13).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-the-name-is-not-a-formula-for-the-unsent-the-sons-of-sceva'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:23 — *I never knew you: depart from me* the same distinction the demon makes: *who are ye?* — the unknown exposed (Acts 19:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-the-name-is-not-a-formula-for-the-unsent-the-sons-of-sceva'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 10:17 — *the devils are subject unto us through thy name* but to the SENT seventy; the sons of Sceva were not sent (Acts 19:13).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-the-name-is-not-a-formula-for-the-unsent-the-sons-of-sceva'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Mark 9:39 — *no man which shall do a miracle in my name, that can lightly speak evil of me* a true work binds a man to him; the borrower does no work and is overcome (Acts 19:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-the-name-is-not-a-formula-for-the-unsent-the-sons-of-sceva'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=9 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 16:17 — *These men are the servants of the El Elyon (most high God)* even the divination spirit confesses the sent; the spirits know Paul, not the borrowers (Acts 19:13).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-the-name-is-not-a-formula-for-the-unsent-the-sons-of-sceva'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=16 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-19-they-burned-their-books-turning-from-the-abominations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 18:10 — *or that useth divination, or an observer of times, or an enchanter, or a witch* the curious arts Moses forbade, now brought together and burned (Acts 19:19).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-they-burned-their-books-turning-from-the-abominations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 18:12 — *all that do these things are an abomination unto Yahuah (LORD)* the abomination renounced, the price counted and let go (Acts 19:19).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-they-burned-their-books-turning-from-the-abominations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-19-so-mightily-grew-the-word-of-god-and-prevailed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 55:11 — *it shall not return unto me void … it shall prosper in the thing whereto I sent it* all Asia hearing, the word growing and prevailing as the prophet promised (Acts 19:20).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-so-mightily-grew-the-word-of-god-and-prevailed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-19-i-must-also-see-rome-the-witness-the-lord-confirms
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 23:11 — *so must thou bear witness also at Rome* the Lord stands by Paul in the night and confirms what he purposed in the spirit (Acts 19:21).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-i-must-also-see-rome-the-witness-the-lord-confirms'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=23 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:9 — *They that make a graven image are all of them vanity … they see not, nor know* the makers of idols named vanity, behind Paul''s *no gods, made with hands* (Acts 19:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands* the silversmith''s very trade, named no god by the psalm (Acts 19:24,26).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 10:5 — *they … speak not … cannot do evil, neither also is it in them to do good* the idol that must be borne, no god to be feared (Acts 19:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Habakkuk 2:18 — *the molten image, and a teacher of lies … to make dumb idols* the lie the craftsmen defend, that Diana made with hands is a god (Acts 19:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jeremiah 10:11 — *The gods that have not made the heavens and the earth … shall perish* Diana''s magnificence is a god that made nothing, and shall be unmade (Acts 19:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Wisdom of Solomon 14:8 — *that which is made with hands is cursed, as well it, as he that made it* the idol and its maker under one verdict — Diana and the silversmith (Acts 19:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a19_lookup sv, _s217_a19_lookup tv
 WHERE t.slug='acts-19-they-be-no-gods-which-are-made-with-hands-the-idol-polemic'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=19 AND sv.verse_number=26
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
