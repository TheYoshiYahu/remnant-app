-- ----- fragment: minion_jubilees_07.sql (session251 jubilees 7) -----
-- Source anchor: jubilees/jubilees ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju07 (view _session251_ju07_lookup). Sort band base 53150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-7-noah-vineyard-firstfruits
  ('jubilees', 'jubilees', 7, 1, 'canon', 'genesis', 9, 20, 'free', E'Genesis 9:20 — *And Noah began to be an husbandman, and he planted a vineyard:* the bare Genesis planting that Jubilees 7:1 retells as a guarded, calendared firstfruits crop.'),
  ('jubilees', 'jubilees', 7, 1, 'canon', 'leviticus', 19, 23, 'free', E'Leviticus 19:23 — *And when ye shall come into the land, and shall have planted all manner of trees for food, then ye shall count the fruit thereof as uncircumcised: three years shall it be as uncircumcised unto you: it shall not be eaten of:* the very law for which Noah *guarded their fruit* through three years in Jubilees 7:1.'),
  ('jubilees', 'jubilees', 7, 1, 'canon', 'leviticus', 19, 24, 'free', E'Leviticus 19:24 — *But in the fourth year all the fruit thereof shall be holy to praise Yahuah (LORD) withal:* why Noah gathers in *the fourth year* — the fruit is now holy, kept before Sinai (Jubilees 7:1).'),
  -- thread: jubilees-7-firstfruits-wine-oil-feast
  ('jubilees', 'jubilees', 7, 36, 'canon', 'leviticus', 19, 24, 'free', E'Leviticus 19:24 — *But in the fourth year all the fruit thereof shall be holy to praise Yahuah (LORD) withal:* the fourth-year holiness Jubilees 7:36 spells out as *in the fourth year its fruit will be accounted holy.*'),
  ('jubilees', 'jubilees', 7, 37, 'canon', 'leviticus', 19, 25, 'free', E'Leviticus 19:25 — *And in the fifth year shall ye eat of the fruit thereof, that it may yield unto you the increase thereof: I am Yahuah Elohaychem (the LORD your God):* the fifth-year release Jubilees 7:37 commands, the same reckoning Noah began keeping in 7:2.'),
  -- thread: jubilees-7-curse-of-canaan
  ('jubilees', 'jubilees', 7, 6, 'canon', 'genesis', 9, 21, 'free', E'Genesis 9:21 — *And he drank of the wine, and was drunken; and he was uncovered within his tent:* the Genesis source Jubilees 7:6 retells almost verbatim.'),
  ('jubilees', 'jubilees', 7, 8, 'canon', 'genesis', 9, 22, 'free', E'Genesis 9:22 — *And Ham, the father of Canaan, saw the nakedness of his father, and told his two brethren without:* matched almost word for word by Jubilees 7:8.'),
  ('jubilees', 'jubilees', 7, 9, 'canon', 'genesis', 9, 23, 'free', E'Genesis 9:23 — *And Shem and Japheth took a garment, and laid it upon both their shoulders, and went backward, and covered the nakedness of their father; and their faces were backward, and they saw not their father''s nakedness:* the same backward-covering Jubilees 7:9 recounts.'),
  ('jubilees', 'jubilees', 7, 10, 'canon', 'genesis', 9, 25, 'free', E'Genesis 9:25 — *And he said, Cursed be Canaan; a servant of servants shall he be unto his brethren:* the curse Jubilees 7:10 gives as *Cursed be Canaan; an enslaved servant shall he be to his brethren.*'),
  ('jubilees', 'jubilees', 7, 11, 'canon', 'genesis', 9, 26, 'free', E'Genesis 9:26 — *And he said, Blessed be Yahuah Elohim (the LORD God) of Shem; and Canaan shall be his servant:* the blessing of the Shem-line, kept verbatim in Jubilees 7:11.'),
  -- thread: jubilees-7-division-of-the-nations
  ('jubilees', 'jubilees', 7, 18, 'canon', 'genesis', 10, 1, 'free', E'Genesis 10:1 — *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood:* the heading of the table Jubilees 7:18 retells with the sons of Shem.'),
  ('jubilees', 'jubilees', 7, 19, 'canon', 'genesis', 10, 2, 'free', E'Genesis 10:2 — *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras:* the same seven sons of Japheth listed in Jubilees 7:19.'),
  ('jubilees', 'jubilees', 7, 19, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel):* the division of the earth that names Jubilees the Book of Division (7:19), with Israel as the measure.'),
  -- thread: jubilees-7-watchers-flood-cause
  ('jubilees', 'jubilees', 7, 21, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose:* the Watchers'' fornication Jubilees 7:21 names as the first of the three causes of the flood.'),
  ('jubilees', 'jubilees', 7, 21, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown:* the giants Jubilees 7:21 calls the Nâphîdîm who devoured one another.'),
  ('jubilees', 'jubilees', 7, 21, 'enoch', '1-enoch', 7, 2, 'extras', E'1 Enoch 7:2 — *And they became pregnant, and they bare great giants, whose height was three thousand ells:* the live Enoch witness to the giants Jubilees 7:21 names from the Watchers.'),
  ('jubilees', 'jubilees', 7, 21, 'enoch', '1-enoch', 7, 3, 'extras', E'1 Enoch 7:3 — *Who consumed all the acquisitions of men. And when men could no longer sustain them, the giants turned against them and devoured mankind:* the same mutual devouring Jubilees 7:21 describes among the Nâphîdîm.'),
  ('jubilees', 'jubilees', 7, 25, 'canon', 'genesis', 6, 5, 'free', E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually:* the wickedness for which, in Jubilees 7:25, Yahuah destroyed everything from the face of the earth.'),
  -- thread: jubilees-7-blood-prohibition
  ('jubilees', 'jubilees', 7, 28, 'canon', 'genesis', 9, 4, 'free', E'Genesis 9:4 — *But flesh with the life thereof, which is the blood thereof, shall ye not eat:* the Noahic blood prohibition Jubilees 7:28 restates as eating the blood of any flesh.'),
  ('jubilees', 'jubilees', 7, 28, 'canon', 'genesis', 9, 6, 'free', E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man:* the shed-blood half of the charge Jubilees 7:28 carries — *whoso sheds man''s blood... will all be destroyed.*'),
  ('jubilees', 'jubilees', 7, 31, 'canon', 'leviticus', 17, 11, 'free', E'Leviticus 17:11 — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul:* the heavenly-tablet ground of why Noah, in Jubilees 7:31-32, says the blood is the life and may not be eaten.'),
  ('jubilees', 'jubilees', 7, 31, 'canon', 'leviticus', 17, 13, 'free', E'Leviticus 17:13 — *...he shall even pour out the blood thereof, and cover it with dust:* the covering-of-blood command Noah gives in Jubilees 7:31, *cover the blood,* standing word for word in the Torah.'),
  ('jubilees', 'jubilees', 7, 28, 'canon', 'acts', 15, 20, 'free', E'Acts 15:20 — *But that we write unto them, that they abstain from pollutions of idols, and from fornication, and from things strangled, and from blood:* the same blood-law laid on the nations in the renewed covenant — the Noahic charge of Jubilees 7:28 is not abolished.'),
  -- thread: jubilees-7-enoch-fathers-handed-down
  ('jubilees', 'jubilees', 7, 38, 'canon', 'genesis', 6, 9, 'free', E'Genesis 6:9 — *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God):* the walking-line of the fathers Jubilees 7:38 traces from Enoch through Methuselah and Lamech to Noah.'),
  ('jubilees', 'jubilees', 7, 39, 'enoch', '1-enoch', 7, 5, 'extras', E'1 Enoch 7:5 — *Then the earth laid accusation against the lawless ones:* the live Enoch testimony — the *seventh in his generation* whose commandment Jubilees 7:39 says Enoch handed to his sons'' sons.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-7-noah-vineyard-firstfruits',
       E'Noah''s vineyard, the fourth-year fruit, and the feast — it ain''t new',
       E'Jubilees opens Noah''s husbandry as a calendar and a feast, not a casual planting: *And in the seventh week in the first year thereof, in this jubilee, Noah planted vines on the mountain on which the ark had rested, named Lûbâr, one of the Ararat Mountains, and they produced fruit in the fourth year, and he guarded their fruit, and gathered it in this year in the seventh month* (Jubilees 7:1). Genesis tells the same planting plainly — *And Noah began to be an husbandman, and he planted a vineyard* (Genesis 9:20) — and Jubilees lays the heavenly-tablet ordinance over it. The reason Noah *guarded their fruit* until *the fourth year* is the firstfruits law engraved before Sinai: *And when ye shall come into the land, and shall have planted all manner of trees for food... three years shall it be as uncircumcised unto you: it shall not be eaten of* (Leviticus 19:23), and *in the fourth year all the fruit thereof shall be holy to praise Yahuah (LORD) withal* (Leviticus 19:24). Noah keeps it before it is given to Moses — the Appointed Times are ancient.',
       sv.verse_id, ev.verse_id, 'extras', 53150
  FROM _session251_ju07_lookup sv, _session251_ju07_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=7 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-7-firstfruits-wine-oil-feast',
       E'The fourth-year fruit accounted holy — firstfruits of wine and oil',
       E'Noah turns his guarded vintage into a feast-offering, and Jubilees then states the ordinance outright for his sons: *And he made wine therefrom and put it into a vessel, and kept it until the fifth year, until the first day, on the new moon of the first month* (Jubilees 7:2), and *he celebrated with joy the day of this feast, and he made a burnt sacrifice to Yahuah (God)* (Jubilees 7:3). The standing law is spoken to the patriarchs as already engraved: *For three years the fruit of everything that is eaten will not be gathered: and in the fourth year its fruit will be accounted holy and they will offer the first-fruits, acceptable before the El Elyon (Most High) Elohim (God)... Let them offer in abundance the first of the wine and oil (as) first-fruits on the altar of Yahuah (God)* (Jubilees 7:36). This is Leviticus 19 verbatim in substance: *in the fourth year all the fruit thereof shall be holy* (Leviticus 19:24), *and in the fifth year shall ye eat of the fruit thereof* (Leviticus 19:25) — the same three-four-five reckoning Noah keeps in Jubilees 7:2, 36-37. The feast is not new; it is the patriarchs keeping the heavenly tablets.',
       sv.verse_id, ev.verse_id, 'extras', 53153
  FROM _session251_ju07_lookup sv, _session251_ju07_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=36
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=7 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-7-curse-of-canaan',
       E'Noah''s nakedness and the curse of Canaan — retold from Genesis 9',
       E'Jubilees retells the wine, the shame, and the curse exactly as Genesis: *And he rejoiced and drank of this wine, he and his children with joy. And it was evening, and he went into his tent, and being drunken he lay down and slept, and was uncovered in his tent as he slept* (Jubilees 7:6); *And Ham saw Noah his father naked, and went forth and told his two brethren without* (Jubilees 7:8); and the curse, *Cursed be Canaan; an enslaved servant shall he be to his brethren* (Jubilees 7:10). Genesis is the source quoted beside it: *And he drank of the wine, and was drunken; and he was uncovered within his tent* (Genesis 9:21); *And Ham, the father of Canaan, saw the nakedness of his father, and told his two brethren without* (Genesis 9:22); *And he said, Cursed be Canaan; a servant of servants shall he be unto his brethren* (Genesis 9:25). And the blessing of Shem in Jubilees 7:11 — *Blessed be Yahuah Elohim (the LORD God) of Shem* — is Genesis 9:26 word for word. The line of blessing runs through Shem; the seed is kept.',
       sv.verse_id, ev.verse_id, 'extras', 53156
  FROM _session251_ju07_lookup sv, _session251_ju07_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=6
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=7 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-7-division-of-the-nations',
       E'The sons of Noah and the dividing of the nations',
       E'Jubilees names the sons and the cities they founded, then the table of nations: *And these are the sons of Shem: Elam, and Asshur, and Arpachshad–this (son) was born two years after the flood–and Lud, and Aram* (Jubilees 7:18), and *The sons of Japheth: Gomer and Magog and Madai and Javan, Tubal and Meshech and Tiras: these are the sons of Noah* (Jubilees 7:19). This is the Genesis table retold: *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood* (Genesis 10:1); *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras* (Genesis 10:2). Behind the whole scattering stands the Most High''s ordering of the peoples — the ''Book of Division'' that gives Jubilees its name: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8). Israel is the measure by which the nations are divided; the seed is the Most High''s portion.',
       sv.verse_id, ev.verse_id, 'extras', 53159
  FROM _session251_ju07_lookup sv, _session251_ju07_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=18
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=7 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-7-watchers-flood-cause',
       E'Why the flood came — the Watchers, the giants, and the bloodshed',
       E'Noah charges his grandsons with the ordinances and tells them plainly why the flood came: *For owing to these three things came the flood upon the earth, namely, owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness. And they begat sons the Nâphîdîm, and they were all unlike, and they devoured one another: and the Giants slew the Nâphîl* (Jubilees 7:21). This is Genesis 6 and 1 Enoch''s Watchers in one breath. Genesis: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2); *There were giants in the earth in those days* (Genesis 6:4). 1 Enoch tells the same devouring: *And they became pregnant, and they bare great giants* (1 Enoch 7:2), and *the giants turned against them and devoured mankind* (1 Enoch 7:3). The earth filled with blood — *And Yahuah (God) destroyed everything from off the face of the earth; because of the wickedness of their deeds, and because of the blood which they had shed* (Jubilees 7:25) — and *GOD saw that the wickedness of man was great in the earth* (Genesis 6:5). The seed-war is the same across all three witnesses.',
       sv.verse_id, ev.verse_id, 'extras', 53162
  FROM _session251_ju07_lookup sv, _session251_ju07_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=20
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=7 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-7-blood-prohibition',
       E'Eat not the blood — Noah''s charge and the eternal blood-law',
       E'Noah''s central ordinance to his sons is the blood prohibition, given as a testimony engraved for all flesh: *For whoso sheds man''s blood, and whoso eats the blood of any flesh, will all be destroyed from the earth* (Jubilees 7:28), and *guard yourselves that none may eat blood before you: cover the blood, for thus have I been commanded to testify to you and your children, together with all flesh* (Jubilees 7:31). This is the Noahic charge of Genesis 9 — *But flesh with the life thereof, which is the blood thereof, shall ye not eat* (Genesis 9:4); *Whoso sheddeth man''s blood, by man shall his blood be shed* (Genesis 9:6) — carried forward into the standing Torah: *For the life of the flesh is in the blood... it is the blood that maketh an atonement for the soul* (Leviticus 17:11), and the hunter shall *pour out the blood thereof, and cover it with dust* (Leviticus 17:13), the very covering Noah commands. And the same law is laid on the nations in the renewed covenant: *that they abstain from pollutions of idols, and from fornication, and from things strangled, and from blood* (Acts 15:20). One blood-law, from Noah to the heavenly tablets to the assembly of the nations — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53165
  FROM _session251_ju07_lookup sv, _session251_ju07_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=28
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=7 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-7-enoch-fathers-handed-down',
       E'From Enoch to Methuselah to Lamech to Noah — the testimony handed down',
       E'Noah closes by tracing the ordinances back through the fathers, naming the chain of the kept testimony: *For thus did Enoch, the father of your father command Methuselah, his son, and Methuselah his son Lamech, and Lamech commanded me all the things which his fathers commanded him* (Jubilees 7:38), and *I also will give you commandment, my sons, as Enoch commanded his son in the first jubilees: whilst still living, the seventh in his generation, he commanded and testified to his son and to his sons'' sons until the day of his death* (Jubilees 7:39). The chain is the seed kept and the testimony handed down before Sinai. Genesis names the same line of walking-with-Elohim: *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God)* (Genesis 6:9). And 1 Enoch is the very testimony Jubilees says Enoch *commanded his son* — the live witness self-links here: *Then the earth laid accusation against the lawless ones* (1 Enoch 7:5). The commandments are not later inventions; they are the fathers'' deposit, Enoch to Noah, engraved on the heavenly tablets.',
       sv.verse_id, ev.verse_id, 'extras', 53168
  FROM _session251_ju07_lookup sv, _session251_ju07_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=38
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=7 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-7-noah-vineyard-firstfruits
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:20 — *And Noah began to be an husbandman, and he planted a vineyard:* the bare Genesis planting that Jubilees 7:1 retells as a guarded, calendared firstfruits crop.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-noah-vineyard-firstfruits'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:23 — *And when ye shall come into the land, and shall have planted all manner of trees for food, then ye shall count the fruit thereof as uncircumcised: three years shall it be as uncircumcised unto you: it shall not be eaten of:* the very law for which Noah *guarded their fruit* through three years in Jubilees 7:1.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-noah-vineyard-firstfruits'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:24 — *But in the fourth year all the fruit thereof shall be holy to praise Yahuah (LORD) withal:* why Noah gathers in *the fourth year* — the fruit is now holy, kept before Sinai (Jubilees 7:1).'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-noah-vineyard-firstfruits'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-7-firstfruits-wine-oil-feast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:24 — *But in the fourth year all the fruit thereof shall be holy to praise Yahuah (LORD) withal:* the fourth-year holiness Jubilees 7:36 spells out as *in the fourth year its fruit will be accounted holy.*'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-firstfruits-wine-oil-feast'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:25 — *And in the fifth year shall ye eat of the fruit thereof, that it may yield unto you the increase thereof: I am Yahuah Elohaychem (the LORD your God):* the fifth-year release Jubilees 7:37 commands, the same reckoning Noah began keeping in 7:2.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-firstfruits-wine-oil-feast'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-7-curse-of-canaan
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:21 — *And he drank of the wine, and was drunken; and he was uncovered within his tent:* the Genesis source Jubilees 7:6 retells almost verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-curse-of-canaan'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:22 — *And Ham, the father of Canaan, saw the nakedness of his father, and told his two brethren without:* matched almost word for word by Jubilees 7:8.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-curse-of-canaan'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 9:23 — *And Shem and Japheth took a garment, and laid it upon both their shoulders, and went backward, and covered the nakedness of their father; and their faces were backward, and they saw not their father''s nakedness:* the same backward-covering Jubilees 7:9 recounts.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-curse-of-canaan'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 9:25 — *And he said, Cursed be Canaan; a servant of servants shall he be unto his brethren:* the curse Jubilees 7:10 gives as *Cursed be Canaan; an enslaved servant shall he be to his brethren.*'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-curse-of-canaan'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 9:26 — *And he said, Blessed be Yahuah Elohim (the LORD God) of Shem; and Canaan shall be his servant:* the blessing of the Shem-line, kept verbatim in Jubilees 7:11.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-curse-of-canaan'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-7-division-of-the-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:1 — *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood:* the heading of the table Jubilees 7:18 retells with the sons of Shem.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-division-of-the-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:2 — *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras:* the same seven sons of Japheth listed in Jubilees 7:19.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-division-of-the-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel):* the division of the earth that names Jubilees the Book of Division (7:19), with Israel as the measure.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-division-of-the-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-7-watchers-flood-cause
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose:* the Watchers'' fornication Jubilees 7:21 names as the first of the three causes of the flood.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-watchers-flood-cause'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown:* the giants Jubilees 7:21 calls the Nâphîdîm who devoured one another.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-watchers-flood-cause'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 7:2 — *And they became pregnant, and they bare great giants, whose height was three thousand ells:* the live Enoch witness to the giants Jubilees 7:21 names from the Watchers.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-watchers-flood-cause'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=21
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 7:3 — *Who consumed all the acquisitions of men. And when men could no longer sustain them, the giants turned against them and devoured mankind:* the same mutual devouring Jubilees 7:21 describes among the Nâphîdîm.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-watchers-flood-cause'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=21
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually:* the wickedness for which, in Jubilees 7:25, Yahuah destroyed everything from the face of the earth.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-watchers-flood-cause'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-7-blood-prohibition
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:4 — *But flesh with the life thereof, which is the blood thereof, shall ye not eat:* the Noahic blood prohibition Jubilees 7:28 restates as eating the blood of any flesh.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-blood-prohibition'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man:* the shed-blood half of the charge Jubilees 7:28 carries — *whoso sheds man''s blood... will all be destroyed.*'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-blood-prohibition'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 17:11 — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul:* the heavenly-tablet ground of why Noah, in Jubilees 7:31-32, says the blood is the life and may not be eaten.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-blood-prohibition'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 17:13 — *...he shall even pour out the blood thereof, and cover it with dust:* the covering-of-blood command Noah gives in Jubilees 7:31, *cover the blood,* standing word for word in the Torah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-blood-prohibition'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 15:20 — *But that we write unto them, that they abstain from pollutions of idols, and from fornication, and from things strangled, and from blood:* the same blood-law laid on the nations in the renewed covenant — the Noahic charge of Jubilees 7:28 is not abolished.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-blood-prohibition'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-7-enoch-fathers-handed-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:9 — *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God):* the walking-line of the fathers Jubilees 7:38 traces from Enoch through Methuselah and Lamech to Noah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-enoch-fathers-handed-down'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 7:5 — *Then the earth laid accusation against the lawless ones:* the live Enoch testimony — the *seventh in his generation* whose commandment Jubilees 7:39 says Enoch handed to his sons'' sons.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-enoch-fathers-handed-down'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=39
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

