-- ----- fragment: minion_1enoch_69.sql (session250 1-enoch 69) -----
-- Source anchor: enoch/1-enoch ch69. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en69 (view _session250_en69_lookup). Sort band base 51700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en69_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-69-watchers-named-forbidden-arts
  ('enoch', '1-enoch', 69, 4, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The descent and the taking of wives that frames Enoch''s roll of named Watchers is the canon''s own Genesis 6.'),
  ('enoch', '1-enoch', 69, 5, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The giants of Genesis are the offspring of the very leaders Enoch names teaching swords, sorcery, and the metals of war.'),
  ('enoch', '1-enoch', 69, 6, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude carries Enoch''s fallen Watchers straight into the New Testament — it ain''t new.'),
  ('enoch', '1-enoch', 69, 6, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter holds the same reserved-in-chains sentence over the named angels who corrupted all their ways.'),
  ('enoch', '1-enoch', 69, 7, 'jubilees', 'jubilees', 7, 21, 'extras', E'Jubilees 7:21 — *For owing to these three things came the flood upon the earth, namely, owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness. And they begat sons the Nâphîdîm, and they were all unlike, and they devoured one another: and the Giants slew the Nâphîl, and the Nâphîl slew the Eljô, and the Eljô mankind, and one man another.* Jubilees keeps the same Watcher-account — rebellion against the law of their ordinances — that Enoch lays out by name.'),
  -- thread: 1-enoch-69-gadreel-eve-weapons-of-death
  ('enoch', '1-enoch', 69, 10, 'canon', 'genesis', 6, 1, 'free', E'Genesis 6:1 — *And it came to pass, when men began to multiply on the face of the earth, and daughters were born unto them.* The multiplying generations into which Gâdreêl loosed the weapons of death are the very days Genesis opens before the Watchers'' descent.'),
  ('enoch', '1-enoch', 69, 15, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* Men made pure and like the angels were corrupted into the world of giants and bloodshed that Genesis names.'),
  -- thread: 1-enoch-69-hidden-oath-creative-word
  ('enoch', '1-enoch', 69, 20, 'canon', 'psalms', 33, 6, 'free', E'Psalm 33:6 — *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth.* The oath by which heaven was suspended before the world is the spoken Word by which the Psalm says the heavens were made.'),
  ('enoch', '1-enoch', 69, 21, 'canon', 'psalms', 33, 9, 'free', E'Psalm 33:9 — *For he spake, and it was done; he commanded, and it stood fast.* The oath that founded the earth upon the water is the creative command of which the Psalm says he spake and it stood fast.'),
  ('enoch', '1-enoch', 69, 22, 'canon', 'job', 38, 11, 'free', E'Job 38:11 — *And said, Hitherto shalt thou come, but no further: and here shall thy proud waves be stayed?* The sand set against the sea''s anger so it dare not pass its bound is the very boundary Job hears the Creator decree over the proud waves.'),
  ('enoch', '1-enoch', 69, 22, 'canon', 'jeremiah', 5, 22, 'free', E'Jeremiah 5:22 — *Fear ye not me? saith Yahuah (LORD): will ye not tremble at my presence, which have placed the sand for the bound of the sea by a perpetual decree, that it cannot pass it: and though the waves thereof toss themselves, yet can they not prevail; though they roar, yet can they not pass over it?* Jeremiah names the same sand, the same perpetual decree binding the sea, that Enoch ascribes to the hidden oath.'),
  ('enoch', '1-enoch', 69, 23, 'canon', 'proverbs', 8, 29, 'free', E'Proverbs 8:29 — *When he gave to the sea his decree, that the waters should not pass his commandment: when he appointed the foundations of the earth.* Wisdom stands at the founding of the deep and the bounding of the sea that Enoch''s oath makes fast from eternity to eternity.'),
  ('enoch', '1-enoch', 69, 20, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The hidden oath suspended before the world was created is the Word who was in the beginning, the Formed Son with the Head of Days.'),
  ('enoch', '1-enoch', 69, 21, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The oath by which earth, sea, and depths were founded is the Word by whom John says all things were made.'),
  ('enoch', '1-enoch', 69, 24, 'canon', 'colossians', 1, 16, 'free', E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him.* The oath that orders sun, moon, and stars in their courses is the Son by whom Paul says all things in heaven were created.'),
  ('enoch', '1-enoch', 69, 25, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high.* The oath that keeps the stars in their paths and calls them by name is the Son still upholding all things by the word of his power.'),
  -- thread: 1-enoch-69-son-of-adam-name-revealed-throne
  ('enoch', '1-enoch', 69, 30, 'enoch', '1-enoch', 48, 2, 'extras', E'1 Enoch 48:2 — *And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* The name now revealed in joy is the name Enoch already said was named before the Head of Days — election before confession.'),
  ('enoch', '1-enoch', 69, 31, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel sees the figure in the kaph-comparative — one like the Son of Adam — whom Enoch names outright as he takes the throne of judgement.'),
  ('enoch', '1-enoch', 69, 31, 'canon', 'daniel', 7, 14, 'free', E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The sum of judgement given to the Son of Adam is the dominion and everlasting kingdom Daniel sees given to the One like the Son of Adam.'),
  ('enoch', '1-enoch', 69, 31, 'canon', 'matthew', 25, 31, 'free', E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory.* The Gospel says without the ''like'' what Enoch foresees — the Named Son of Adam seated on the throne of his glory to judge.'),
  ('enoch', '1-enoch', 69, 33, 'canon', 'philippians', 2, 9, 'free', E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name.* The name of the Son of Adam revealed to the righteous in joy is the name above every name given to the exalted Yahusha.'),
  ('enoch', '1-enoch', 69, 33, 'canon', 'philippians', 2, 10, 'free', E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth.* Before that revealed name every knee bows, even as Enoch says all evil passes away before the face of the Son of Adam.'),
  -- thread: 1-enoch-69-judgement-testimony-blood-cries-up
  ('enoch', '1-enoch', 69, 38, 'canon', 'genesis', 6, 11, 'free', E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The whole earth filled with blood and unrighteousness by the giants is Genesis''s earth filled with violence before the flood.'),
  ('enoch', '1-enoch', 69, 38, 'canon', 'genesis', 6, 13, 'free', E'Genesis 6:13 — *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth.* The judgement Michael names as testimony is the end of all flesh Genesis decrees because the earth is filled with violence through them.'),
  ('enoch', '1-enoch', 69, 38, 'jubilees', 'jubilees', 7, 23, 'extras', E'Jubilees 7:23 — *And every one sold himself to work iniquity and to shed much blood, and the earth was filled with iniquity.* Jubilees keeps the same charge — the earth filled with blood and iniquity through the Watchers'' offspring — that Enoch lays before the judgement.'),
  ('enoch', '1-enoch', 69, 39, 'canon', 'revelation', 6, 9, 'free', E'Revelation 6:9 — *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held.* The spirits of the dead crying up to the gates of heaven are the souls under the altar in the Revelation.'),
  ('enoch', '1-enoch', 69, 39, 'canon', 'revelation', 6, 10, 'free', E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The lamentation reaching the gates of heaven in Enoch is the same How-long cry for the avenging of innocent blood.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en69_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en69_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-69-watchers-named-forbidden-arts',
       E'The Watchers named, and the forbidden arts they taught',
       E'Enoch sets down the roll of the fallen by name and the secrets each loosed upon men: *And these are the names of the chiefs who taught mankind: Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them, and bracelets, and ornaments, and the use of antimony, and the beautifying of the eyelids, and all kinds of costly stones, and all colouring tinctures* (1 Enoch 69:5), and *Semjâzâ taught enchantments, and root-cuttings, ‘Armârôs the resolving of enchantments,’ Barâqîjâl (taught) astrology, Kôkabêl the constellations, Êzêqêêl the knowledge of the clouds, Araqiêl the signs of the earth, Samsiêl the signs of the sun, and Sariêl the course of the moon* (1 Enoch 69:7). This is the canon''s own Genesis 6, where *the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2). It is not new: Jude and Peter carry it forward, *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6), and *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). The Watchers'' sin is rebellion against the Creator''s order — the seed-war sown among men — and Jubilees keeps the same account, *owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose* (Jubilees 7:21).',
       sv.verse_id, ev.verse_id, 'extras', 51700
  FROM _session250_en69_lookup sv, _session250_en69_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=69 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-69-gadreel-eve-weapons-of-death',
       E'Gâdreêl, who led Eve astray and showed the weapons of death',
       E'Among the named chiefs Enoch singles out the one who struck at the beginning: *And the third was named Gâdreêl: he it is who showed the children of men all the blows of death, and he led astray Eve, and showed [the weapons of death to the sons of men] the shield and the coat of mail, and the sword for battle, and all the weapons of death to the children of men* (1 Enoch 69:10), and *from his hand they have proceeded against those who dwell on the earth from that day and for evermore* (1 Enoch 69:11). The deceiver of Eve and the loosing of death''s instruments is the canon''s serpent — *the same called the Devil, and Satan, which deceiveth the whole world* — and Pênemûe''s secret-wisdom that turned men from purity echoes the tree the man was not made to seize, for Enoch says *men were created exactly like the angels, to the intent that they should continue pure and righteous, and death, which destroys everything, could not have taken hold of them, but through this their knowledge they are perishing* (1 Enoch 69:15). This is the seed-war begun in the garden: the deceiver''s hand bringing death where the Creator had made men for life. Torah stands — the blows of death come not from the Maker''s order but from the rebel''s deceit.',
       sv.verse_id, ev.verse_id, 'extras', 51703
  FROM _session250_en69_lookup sv, _session250_en69_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=69 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-69-hidden-oath-creative-word',
       E'The hidden oath: the secret Name by which all was founded',
       E'At the heart of the chapter stands the hidden oath, the secret Name placed in Michael''s hand by which heaven and earth were established: *And these are the secrets of this oath, and they are strong through his oath: and the heaven was suspended before the world was created, and for ever* (1 Enoch 69:20); *And through it the earth was founded upon the water* (1 Enoch 69:21); *And through that oath the sea was created, and †as its foundation† He set for it the sand against the time of its anger, and it dare not pass beyond it from the creation of the world unto eternity* (1 Enoch 69:22); *And through that oath are the depths made fast, and abide and stir not from their place from eternity to eternity* (1 Enoch 69:23). This oath, this Word by which the worlds stand, is no new doctrine. The Psalm says *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth* (Psalm 33:6), *For he spake, and it was done; he commanded, and it stood fast* (Psalm 33:9). The sea bounded by the oath is the sea bounded in Job, *And said, Hitherto shalt thou come, but no further: and here shall thy proud waves be stayed* (Job 38:11), and in Jeremiah, *which have placed the sand for the bound of the sea by a perpetual decree, that it cannot pass it* (Jeremiah 5:22). Wisdom was present at that founding, *When he gave to the sea his decree, that the waters should not pass his commandment: when he appointed the foundations of the earth* (Proverbs 8:29). The New Testament names the oath plainly: it is the Word, the Formed Son who proceeds from the Head of Days, *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), *All things were made by him; and without him was not any thing made that was made* (John 1:3); *For by him were all things created... all things were created by him, and for him* (Colossians 1:16); and he is still *upholding all things by the word of his power* (Hebrews 1:3). Enoch''s hidden Name and the Logos are one — the creative Word by whom all was made.',
       sv.verse_id, ev.verse_id, 'extras', 51706
  FROM _session250_en69_lookup sv, _session250_en69_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=17
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=69 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-69-son-of-adam-name-revealed-throne',
       E'The Name of the Son of Adam revealed; he sits on the throne of glory',
       E'When the oath has founded all things, joy breaks out, *because the name of that son of Adam had been revealed unto them* (1 Enoch 69:30), and *he sat on the throne of his glory, and the sum of judgement was given unto the son of Adam, and he caused the sinners to pass away and be destroyed from off the face of the earth* (1 Enoch 69:31); *for that son of Adam has appeared, and has seated himself on the throne of his glory, and all evil shall pass away before his face, and the word of that son of Adam shall go forth and be strong before Yahuah (God) of Spirits* (1 Enoch 69:33). Enoch *names* the Son of Adam — the Formed Son who proceeds from the Head of Days, chosen and named before creation: *And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days* (1 Enoch 48:2). Daniel sees that same One but in the kaph-comparative, *one like the Son of Adam* — resembling mortal-man because he would take on flesh, while remaining the Formed cloud-rider: *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him. And there was given him dominion, and glory, and a kingdom* (Daniel 7:13-14). The Gospel speaks his enthronement without the ''like,'' for the Named One has come: *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory* (Matthew 25:31). And his name, hidden then revealed, is the name above every name: *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name: That at the name of Yahusha (Jesus) every knee should bow* (Philippians 2:9-10). The Son of Adam is worshipped with the Father yet ordered under Him — not co-equal-persons, not a mere man, not a created angel; election precedes confession, and his name was named before creation.',
       sv.verse_id, ev.verse_id, 'extras', 51709
  FROM _session250_en69_lookup sv, _session250_en69_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=30
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=69 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-69-judgement-testimony-blood-cries-up',
       E'The judgement of the Watchers, and the blood that cries from the earth',
       E'Michael closes the chapter declaring the verdict a testimony, and tells how the corruption came: *Because these are the ones who revealed the eternal secrets which were in heaven, which men were striving to learn* (1 Enoch 69:36); *And they went to the daughters of men upon the earth, and had intercourse with the women, and defiled themselves, and revealed to them all kinds of sins. And the women have borne giants, and the whole earth has thereby been filled with blood and unrighteousness* (1 Enoch 69:37-38); *And now, behold, the spirits of the souls of the dead shall rise up, and their cry shall reach unto heaven, and their lamentation shall reach unto the gates of heaven* (1 Enoch 69:39). The earth filled with blood is the canon''s flood-world, *The earth also was corrupt before Elohim (God), and the earth was filled with violence* (Genesis 6:11), *for the earth is filled with violence through them* (Genesis 6:13). Jubilees tells the same, *And every one sold himself to work iniquity and to shed much blood, and the earth was filled with iniquity* (Jubilees 7:23). And the cry of the slain that ascends to the gates of heaven is the cry under the altar in the Revelation, *I saw under the altar the souls of them that were slain for the word of Elohim (God)... And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:9-10). The judgement falls for breaking the Creator''s covenant; the slain are answered.',
       sv.verse_id, ev.verse_id, 'extras', 51712
  FROM _session250_en69_lookup sv, _session250_en69_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=35
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=69 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-69-watchers-named-forbidden-arts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The descent and the taking of wives that frames Enoch''s roll of named Watchers is the canon''s own Genesis 6.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-watchers-named-forbidden-arts'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The giants of Genesis are the offspring of the very leaders Enoch names teaching swords, sorcery, and the metals of war.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-watchers-named-forbidden-arts'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude carries Enoch''s fallen Watchers straight into the New Testament — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-watchers-named-forbidden-arts'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter holds the same reserved-in-chains sentence over the named angels who corrupted all their ways.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-watchers-named-forbidden-arts'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 7:21 — *For owing to these three things came the flood upon the earth, namely, owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness. And they begat sons the Nâphîdîm, and they were all unlike, and they devoured one another: and the Giants slew the Nâphîl, and the Nâphîl slew the Eljô, and the Eljô mankind, and one man another.* Jubilees keeps the same Watcher-account — rebellion against the law of their ordinances — that Enoch lays out by name.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-watchers-named-forbidden-arts'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-69-gadreel-eve-weapons-of-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:1 — *And it came to pass, when men began to multiply on the face of the earth, and daughters were born unto them.* The multiplying generations into which Gâdreêl loosed the weapons of death are the very days Genesis opens before the Watchers'' descent.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-gadreel-eve-weapons-of-death'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* Men made pure and like the angels were corrupted into the world of giants and bloodshed that Genesis names.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-gadreel-eve-weapons-of-death'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-69-hidden-oath-creative-word
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 33:6 — *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth.* The oath by which heaven was suspended before the world is the spoken Word by which the Psalm says the heavens were made.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-hidden-oath-creative-word'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 33:9 — *For he spake, and it was done; he commanded, and it stood fast.* The oath that founded the earth upon the water is the creative command of which the Psalm says he spake and it stood fast.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-hidden-oath-creative-word'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 38:11 — *And said, Hitherto shalt thou come, but no further: and here shall thy proud waves be stayed?* The sand set against the sea''s anger so it dare not pass its bound is the very boundary Job hears the Creator decree over the proud waves.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-hidden-oath-creative-word'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 5:22 — *Fear ye not me? saith Yahuah (LORD): will ye not tremble at my presence, which have placed the sand for the bound of the sea by a perpetual decree, that it cannot pass it: and though the waves thereof toss themselves, yet can they not prevail; though they roar, yet can they not pass over it?* Jeremiah names the same sand, the same perpetual decree binding the sea, that Enoch ascribes to the hidden oath.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-hidden-oath-creative-word'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=5 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 8:29 — *When he gave to the sea his decree, that the waters should not pass his commandment: when he appointed the foundations of the earth.* Wisdom stands at the founding of the deep and the bounding of the sea that Enoch''s oath makes fast from eternity to eternity.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-hidden-oath-creative-word'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The hidden oath suspended before the world was created is the Word who was in the beginning, the Formed Son with the Head of Days.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-hidden-oath-creative-word'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The oath by which earth, sea, and depths were founded is the Word by whom John says all things were made.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-hidden-oath-creative-word'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him.* The oath that orders sun, moon, and stars in their courses is the Son by whom Paul says all things in heaven were created.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-hidden-oath-creative-word'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high.* The oath that keeps the stars in their paths and calls them by name is the Son still upholding all things by the word of his power.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-hidden-oath-creative-word'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-69-son-of-adam-name-revealed-throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 48:2 — *And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* The name now revealed in joy is the name Enoch already said was named before the Head of Days — election before confession.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-son-of-adam-name-revealed-throne'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=30
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel sees the figure in the kaph-comparative — one like the Son of Adam — whom Enoch names outright as he takes the throne of judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-son-of-adam-name-revealed-throne'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The sum of judgement given to the Son of Adam is the dominion and everlasting kingdom Daniel sees given to the One like the Son of Adam.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-son-of-adam-name-revealed-throne'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory.* The Gospel says without the ''like'' what Enoch foresees — the Named Son of Adam seated on the throne of his glory to judge.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-son-of-adam-name-revealed-throne'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name.* The name of the Son of Adam revealed to the righteous in joy is the name above every name given to the exalted Yahusha.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-son-of-adam-name-revealed-throne'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth.* Before that revealed name every knee bows, even as Enoch says all evil passes away before the face of the Son of Adam.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-son-of-adam-name-revealed-throne'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-69-judgement-testimony-blood-cries-up
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The whole earth filled with blood and unrighteousness by the giants is Genesis''s earth filled with violence before the flood.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-judgement-testimony-blood-cries-up'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:13 — *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth.* The judgement Michael names as testimony is the end of all flesh Genesis decrees because the earth is filled with violence through them.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-judgement-testimony-blood-cries-up'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 7:23 — *And every one sold himself to work iniquity and to shed much blood, and the earth was filled with iniquity.* Jubilees keeps the same charge — the earth filled with blood and iniquity through the Watchers'' offspring — that Enoch lays before the judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-judgement-testimony-blood-cries-up'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=38
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 6:9 — *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held.* The spirits of the dead crying up to the gates of heaven are the souls under the altar in the Revelation.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-judgement-testimony-blood-cries-up'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The lamentation reaching the gates of heaven in Enoch is the same How-long cry for the avenging of innocent blood.'
  FROM cross_reference_threads t, cross_references x, _session250_en69_lookup sv, _session250_en69_lookup tv
 WHERE t.slug='1-enoch-69-judgement-testimony-blood-cries-up'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=69 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

