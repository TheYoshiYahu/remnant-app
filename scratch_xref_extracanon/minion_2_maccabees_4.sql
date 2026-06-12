-- ----- fragment: minion_2maccabees_04.sql (session253 2-maccabees 4) -----
-- Source anchor: apocrypha/2-maccabees ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac4 (view _session253_2mac4_lookup). Sort band base 62075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-4-priesthood-for-sale
  ('apocrypha', '2-maccabees', 4, 8, 'canon', 'micah', 3, 11, 'free', E'Micah 3:11 — *The heads thereof judge for reward, and the priests thereof teach for hire, and the prophets thereof divine for money: yet will they lean upon Yahuah (LORD), and say, Is not Yahuah (LORD) among us? none evil can come upon us.* Jason''s purchase of the priesthood for silver is exactly the priests-teaching-for-hire the prophet condemned, the office turned to gain.'),
  ('apocrypha', '2-maccabees', 4, 24, 'canon', 'acts', 8, 20, 'free', E'Acts 8:20 — *But Peter said unto him, Thy money perish with thee, because thou hast thought that the gift of Elohim (God) may be purchased with money.* Menelaus outbidding Jason for the holy office is the very simony Peter rebukes — the gift of Elohim treated as a thing to be bought.'),
  ('apocrypha', '2-maccabees', 4, 24, 'canon', '1-timothy', 6, 10, 'free', E'1 Timothy 6:10 — *For the love of money is the root of all evil: which while some coveted after, they have erred from the faith, and pierced themselves through with many sorrows.* Menelaus erring from the covenant for silver, then sliding into theft and murder, traces the very pierced-through path Paul names.'),
  ('apocrypha', '2-maccabees', 4, 7, 'apocrypha', '1-maccabees', 1, 15, 'extras', E'1 Maccabees 1:15 — *And made themselves uncircumcised, and forsook the holy covenant, and joined themselves to the heathen, and were sold to do mischief.* The sister history names the same apostasy under Jason: the leaders forsook the holy covenant and were sold to do mischief.'),
  -- thread: 2-maccabees-4-customs-against-the-law
  ('apocrypha', '2-maccabees', 4, 11, 'canon', 'daniel', 11, 30, 'free', E'Daniel 11:30 — *For the ships of Chittim shall come against him: therefore he shall be grieved, and return, and have indignation against the holy covenant: so shall he do; he shall even return, and have intelligence with them that forsake the holy covenant.* Jason and his Antiochians are the men who forsake the holy covenant whom Antiochus has intelligence with, the inside hand of Daniel''s vision.'),
  ('apocrypha', '2-maccabees', 4, 12, 'canon', 'daniel', 11, 31, 'free', E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* The gymnasium built under the temple tower is the first pollution of the sanctuary that ripens into Daniel''s abomination of desolation.'),
  ('apocrypha', '2-maccabees', 4, 13, 'canon', 'matthew', 24, 15, 'free', E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah reaches back through this Greekifying of the holy place to warn of the last abomination — the same antichrist pattern of the kingdom-of-man.'),
  ('apocrypha', '2-maccabees', 4, 11, 'apocrypha', '1-maccabees', 1, 15, 'extras', E'1 Maccabees 1:15 — *And made themselves uncircumcised, and forsook the holy covenant, and joined themselves to the heathen, and were sold to do mischief.* The parallel record makes the gymnasium''s meaning plain: the new customs against the law were a forsaking of the holy covenant itself.'),
  -- thread: 2-maccabees-4-priests-from-the-altar
  ('apocrypha', '2-maccabees', 4, 14, 'canon', 'malachi', 2, 7, 'free', E'Malachi 2:7 — *For the priest''s lips should keep knowledge, and they should seek the law at his mouth: for he is the messenger of Yahuah Tseva''ot (LORD of hosts).* The priests who lose courage to serve at the altar have abandoned the very office Malachi defines — the messenger meant to keep knowledge and the law.'),
  ('apocrypha', '2-maccabees', 4, 14, 'canon', 'malachi', 2, 8, 'free', E'Malachi 2:8 — *But ye are departed out of the way; ye have caused many to stumble at the law; ye have corrupted the covenant of Levi, saith Yahuah Tseva''ot (LORD of hosts).* Priests despising the temple and running to the gymnasium are the departed-out-of-the-way who corrupt the covenant of Levi — corruption from within.'),
  ('apocrypha', '2-maccabees', 4, 15, 'canon', 'hosea', 4, 6, 'free', E'Hosea 4:6 — *My people are destroyed for lack of knowledge: because thou hast rejected knowledge, I will also reject thee, that thou shalt be no priest to me: seeing thou hast forgotten the law of thy Elohim (God), I will also forget thy children.* Choosing the glory of the Grecians over the honours of the fathers is exactly the forgotten law of Elohim that unmakes a priesthood.'),
  ('apocrypha', '2-maccabees', 4, 16, 'canon', 'hosea', 4, 8, 'free', E'Hosea 4:8 — *They eat up the sin of my people, and they set their heart on their iniquity.* The priests partaking of the unlawful allowance, profiting off the people''s apostasy, are Hosea''s priests who eat up the sin of the people.'),
  -- thread: 2-maccabees-4-hireling-shepherds
  ('apocrypha', '2-maccabees', 4, 25, 'canon', 'john', 10, 12, 'free', E'John 10:12 — *But he that is an hireling, and not the shepherd, whose own the sheep are not, seeth the wolf coming, and leaveth the sheep, and fleeth: and the wolf catcheth them, and scattereth the sheep.* Menelaus, a cruel tyrant who brought nothing worthy the priesthood, is the very hireling the Good Shepherd contrasts with Himself.'),
  ('apocrypha', '2-maccabees', 4, 50, 'canon', 'isaiah', 56, 11, 'free', E'Isaiah 56:11 — *Yea, they are greedy dogs which can never have enough, and they are shepherds that cannot understand: they all look to their own way, every one for his gain, from his quarter.* Menelaus increasing in malice and covetousness while in authority is Isaiah''s greedy shepherd who looks only to his own gain.'),
  ('apocrypha', '2-maccabees', 4, 25, 'canon', 'ezekiel', 34, 2, 'free', E'Ezekiel 34:2 — *Son of Adam, prophesy against the shepherds of Yashar''el (Israel), prophesy, and say unto them, Thus saith Adonai Yahuah (the Lord GOD) unto the shepherds; Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* The Woe over shepherds who feed themselves falls squarely on Menelaus, the beast-tempered high priest who devours rather than tends the flock.'),
  ('apocrypha', '2-maccabees', 4, 32, 'canon', 'ezekiel', 34, 3, 'free', E'Ezekiel 34:3 — *Ye eat the fat, and ye clothe you with the wool, ye kill them that are fed: but ye feed not the flock.* Menelaus stealing the gold vessels of the temple to enrich himself is the shepherd of Ezekiel who plunders the flock he was set to feed.'),
  -- thread: 2-maccabees-4-innocent-blood-onias
  ('apocrypha', '2-maccabees', 4, 35, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The unjust murder of righteous Onias, grieved over by Jew and Gentile alike, is innocent blood that cries from the ground as Abel''s did before it.'),
  ('apocrypha', '2-maccabees', 4, 34, 'canon', 'deuteronomy', 27, 25, 'free', E'Deuteronomy 27:25 — *Cursed be he that taketh reward to slay an innocent person. And all the people shall say, Amen.* Andronicus, persuaded by Menelaus to seize Onias and slay him, falls under Torah''s express curse on the hired killer of an innocent man.'),
  ('apocrypha', '2-maccabees', 4, 35, 'canon', 'matthew', 23, 35, 'free', E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The shedding of righteous Onias'' blood near the sanctuary belongs to the long reckoning of all the righteous blood the Messiah names.'),
  ('apocrypha', '2-maccabees', 4, 33, 'apocrypha', 'the-wisdom-of-solomon', 2, 12, 'extras', E'Wisdom of Solomon 2:12 — *Therefore let us lie in wait for the righteous; because he is not for our turn, and he is clean contrary to our doings: he upbraideth us with our offending the law, and objecteth to our infamy the transgressings of our education.* The ungodly lying in wait for Onias, who reproved their sacrilege, is exactly Wisdom''s plot of the wicked against the law-keeping righteous man.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-4-priesthood-for-sale',
       E'The high priesthood bought and sold',
       E'The holy office is put up for auction. *Promising to the king by intercession three hundred and threescore talents of silver, and of another revenue eighty talents* (2 Maccabees 4:8) — Jason buys what Yahuah gave by covenant, and Menelaus simply outbids him: *got the priesthood to himself, offering more than Jason by three hundred talents of silver* (2 Maccabees 4:24). The prophets named this rot in the house of Yahuah: *The heads thereof judge for reward, and the priests thereof teach for hire, and the prophets thereof divine for money: yet will they lean upon Yahuah (LORD), and say, Is not Yahuah (LORD) among us? none evil can come upon us* (Micah 3:11). The Renewed Covenant calls the same sin by its first New-Testament name when Simon Magus would purchase the Spirit: *But Peter said unto him, Thy money perish with thee, because thou hast thought that the gift of Elohim (God) may be purchased with money* (Acts 8:20) — the very *simony* that takes its name from this traffic. And the root is laid bare: *For the love of money is the root of all evil: which while some coveted after, they have erred from the faith, and pierced themselves through with many sorrows* (1 Timothy 6:10). It ain''t new — the man who would buy the altar has already sold the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 62075
  FROM _session253_2mac4_lookup sv, _session253_2mac4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=4 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-4-customs-against-the-law',
       E'New customs against the law — the gymnasium and the abomination',
       E'Jason dismantles the covenant order from within: *putting down the governments which were according to the law, he brought up new customs against the law* (2 Maccabees 4:11), building *a place of exercise under the tower itself* and making the young men *wear a hat* (2 Maccabees 4:12) in the fashion of the heathen. This is the abomination Daniel saw — not first a foreign army but a domestic betrayal: *he shall even return, and have intelligence with them that forsake the holy covenant* (Daniel 11:30), and *they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate* (Daniel 11:31). The Messiah Himself pointed the last generation back to this very desolation: *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* (Matthew 24:15). Antiochus is the pattern of the kingdom-of-man that always works by flattery from inside the camp — *And made themselves uncircumcised, and forsook the holy covenant, and joined themselves to the heathen, and were sold to do mischief* (1 Maccabees 1:15). The fight was never against Torah; it was for it.',
       sv.verse_id, ev.verse_id, 'extras', 62078
  FROM _session253_2mac4_lookup sv, _session253_2mac4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=4 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-4-priests-from-the-altar',
       E'The priests despise the altar — corruption from within',
       E'The deepest wound is that the priests themselves abandon the service: *the priests had no courage to serve any more at the altar, but despising the temple, and neglecting the sacrifices, hastened to be partakers of the unlawful allowance in the place of exercise* (2 Maccabees 4:14), *not setting by the honours of their fathers, but liking the glory of the Grecians best of all* (2 Maccabees 4:15). This is Malachi''s indictment to the letter — the priest who should guard knowledge instead leads the stumble: *For the priest''s lips should keep knowledge, and they should seek the law at his mouth: for he is the messenger of Yahuah Tseva''ot (LORD of hosts)* (Malachi 2:7), *But ye are departed out of the way; ye have caused many to stumble at the law; ye have corrupted the covenant of Levi, saith Yahuah Tseva''ot (LORD of hosts)* (Malachi 2:8). And Hosea weighs the harvest of a priesthood that forgets Torah: *My people are destroyed for lack of knowledge: because thou hast rejected knowledge, I will also reject thee, that thou shalt be no priest to me: seeing thou hast forgotten the law of thy Elohim (God), I will also forget thy children* (Hosea 4:6), *They eat up the sin of my people, and they set their heart on their iniquity* (Hosea 4:8). The covenant is corrupted not by the heathen at the gate but by the shepherds at the altar.',
       sv.verse_id, ev.verse_id, 'extras', 62081
  FROM _session253_2mac4_lookup sv, _session253_2mac4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=4 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-4-hireling-shepherds',
       E'The cruel hireling — shepherds who devour the flock',
       E'Menelaus brings *nothing worthy the high priesthood, but having the fury of a cruel tyrant, and the rage of a savage beast* (2 Maccabees 4:25), and to the end *remained still in authority, increasing in malice, and being a great traitor to the citizens* (2 Maccabees 4:50). He is the hireling who fleeces and never feeds. The Good Shepherd set him in sharpest relief: *But he that is an hireling, and not the shepherd, whose own the sheep are not, seeth the wolf coming, and leaveth the sheep, and fleeth: and the wolf catcheth them, and scattereth the sheep* (John 10:12). Isaiah saw the same self-serving watchmen: *Yea, they are greedy dogs which can never have enough, and they are shepherds that cannot understand: they all look to their own way, every one for his gain, from his quarter* (Isaiah 56:11). And Ezekiel pronounced the Woe that hangs over every Menelaus: *Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* (Ezekiel 34:2), *Ye eat the fat, and ye clothe you with the wool, ye kill them that are fed: but ye feed not the flock* (Ezekiel 34:3). The false shepherd is no new thing — and Yahuah promises to seek out His own sheep from his hand.',
       sv.verse_id, ev.verse_id, 'extras', 62084
  FROM _session253_2mac4_lookup sv, _session253_2mac4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=4 AND ev.verse_number=50
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-4-innocent-blood-onias',
       E'The blood of righteous Onias',
       E'The righteous high priest, who had withdrawn into sanctuary, is lured out by a false oath and murdered: Andronicus *coming to Onias in deceit, gave him his right hand with oaths... whom forthwith he shut up without regard of justice* (2 Maccabees 4:34), so that *not only the Yahudim (Jews), but many also of other nations, took great indignation, and were much grieved for the unjust murder of the man* (2 Maccabees 4:35) — innocent blood, even the heathen knowing it. From the first murder, such blood has a voice: *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10). Torah set the curse upon the hired killer: *Cursed be he that taketh reward to slay an innocent person. And all the people shall say, Amen* (Deuteronomy 27:25). The Messiah gathered every such slaying into one reckoning: *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar* (Matthew 23:35). And Wisdom had already drawn the portrait of this very plot against the just man: *Therefore let us lie in wait for the righteous; because he is not for our turn, and he is clean contrary to our doings: he upbraideth us with our offending the law* (Wisdom of Solomon 2:12). Yahuah Himself avenged the deed: *Thus Yahuah (God) rewarded him his punishment, as he had deserved* (2 Maccabees 4:38) — the innocent blood does not cry in vain.',
       sv.verse_id, ev.verse_id, 'extras', 62087
  FROM _session253_2mac4_lookup sv, _session253_2mac4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=33
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=4 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-4-priesthood-for-sale
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Micah 3:11 — *The heads thereof judge for reward, and the priests thereof teach for hire, and the prophets thereof divine for money: yet will they lean upon Yahuah (LORD), and say, Is not Yahuah (LORD) among us? none evil can come upon us.* Jason''s purchase of the priesthood for silver is exactly the priests-teaching-for-hire the prophet condemned, the office turned to gain.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-priesthood-for-sale'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 8:20 — *But Peter said unto him, Thy money perish with thee, because thou hast thought that the gift of Elohim (God) may be purchased with money.* Menelaus outbidding Jason for the holy office is the very simony Peter rebukes — the gift of Elohim treated as a thing to be bought.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-priesthood-for-sale'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=8 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 6:10 — *For the love of money is the root of all evil: which while some coveted after, they have erred from the faith, and pierced themselves through with many sorrows.* Menelaus erring from the covenant for silver, then sliding into theft and murder, traces the very pierced-through path Paul names.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-priesthood-for-sale'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 1:15 — *And made themselves uncircumcised, and forsook the holy covenant, and joined themselves to the heathen, and were sold to do mischief.* The sister history names the same apostasy under Jason: the leaders forsook the holy covenant and were sold to do mischief.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-priesthood-for-sale'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-4-customs-against-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:30 — *For the ships of Chittim shall come against him: therefore he shall be grieved, and return, and have indignation against the holy covenant: so shall he do; he shall even return, and have intelligence with them that forsake the holy covenant.* Jason and his Antiochians are the men who forsake the holy covenant whom Antiochus has intelligence with, the inside hand of Daniel''s vision.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-customs-against-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* The gymnasium built under the temple tower is the first pollution of the sanctuary that ripens into Daniel''s abomination of desolation.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-customs-against-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah reaches back through this Greekifying of the holy place to warn of the last abomination — the same antichrist pattern of the kingdom-of-man.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-customs-against-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 1:15 — *And made themselves uncircumcised, and forsook the holy covenant, and joined themselves to the heathen, and were sold to do mischief.* The parallel record makes the gymnasium''s meaning plain: the new customs against the law were a forsaking of the holy covenant itself.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-customs-against-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-4-priests-from-the-altar
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 2:7 — *For the priest''s lips should keep knowledge, and they should seek the law at his mouth: for he is the messenger of Yahuah Tseva''ot (LORD of hosts).* The priests who lose courage to serve at the altar have abandoned the very office Malachi defines — the messenger meant to keep knowledge and the law.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-priests-from-the-altar'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 2:8 — *But ye are departed out of the way; ye have caused many to stumble at the law; ye have corrupted the covenant of Levi, saith Yahuah Tseva''ot (LORD of hosts).* Priests despising the temple and running to the gymnasium are the departed-out-of-the-way who corrupt the covenant of Levi — corruption from within.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-priests-from-the-altar'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 4:6 — *My people are destroyed for lack of knowledge: because thou hast rejected knowledge, I will also reject thee, that thou shalt be no priest to me: seeing thou hast forgotten the law of thy Elohim (God), I will also forget thy children.* Choosing the glory of the Grecians over the honours of the fathers is exactly the forgotten law of Elohim that unmakes a priesthood.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-priests-from-the-altar'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hosea 4:8 — *They eat up the sin of my people, and they set their heart on their iniquity.* The priests partaking of the unlawful allowance, profiting off the people''s apostasy, are Hosea''s priests who eat up the sin of the people.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-priests-from-the-altar'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-4-hireling-shepherds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 10:12 — *But he that is an hireling, and not the shepherd, whose own the sheep are not, seeth the wolf coming, and leaveth the sheep, and fleeth: and the wolf catcheth them, and scattereth the sheep.* Menelaus, a cruel tyrant who brought nothing worthy the priesthood, is the very hireling the Good Shepherd contrasts with Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-hireling-shepherds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 56:11 — *Yea, they are greedy dogs which can never have enough, and they are shepherds that cannot understand: they all look to their own way, every one for his gain, from his quarter.* Menelaus increasing in malice and covetousness while in authority is Isaiah''s greedy shepherd who looks only to his own gain.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-hireling-shepherds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 34:2 — *Son of Adam, prophesy against the shepherds of Yashar''el (Israel), prophesy, and say unto them, Thus saith Adonai Yahuah (the Lord GOD) unto the shepherds; Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* The Woe over shepherds who feed themselves falls squarely on Menelaus, the beast-tempered high priest who devours rather than tends the flock.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-hireling-shepherds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 34:3 — *Ye eat the fat, and ye clothe you with the wool, ye kill them that are fed: but ye feed not the flock.* Menelaus stealing the gold vessels of the temple to enrich himself is the shepherd of Ezekiel who plunders the flock he was set to feed.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-hireling-shepherds'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-4-innocent-blood-onias
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The unjust murder of righteous Onias, grieved over by Jew and Gentile alike, is innocent blood that cries from the ground as Abel''s did before it.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-innocent-blood-onias'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 27:25 — *Cursed be he that taketh reward to slay an innocent person. And all the people shall say, Amen.* Andronicus, persuaded by Menelaus to seize Onias and slay him, falls under Torah''s express curse on the hired killer of an innocent man.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-innocent-blood-onias'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The shedding of righteous Onias'' blood near the sanctuary belongs to the long reckoning of all the righteous blood the Messiah names.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-innocent-blood-onias'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 2:12 — *Therefore let us lie in wait for the righteous; because he is not for our turn, and he is clean contrary to our doings: he upbraideth us with our offending the law, and objecteth to our infamy the transgressings of our education.* The ungodly lying in wait for Onias, who reproved their sacrilege, is exactly Wisdom''s plot of the wicked against the law-keeping righteous man.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac4_lookup sv, _session253_2mac4_lookup tv
 WHERE t.slug='2-maccabees-4-innocent-blood-onias'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=4 AND sv.verse_number=33
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

