-- ----- fragment: minion_ascensionisaiah_02.sql (session403 ascension-isaiah 2) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci2 (view _session403_asci2_lookup). Sort band base 67525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-2-sammael-in-manasseh
  ('ascension-isaiah', 'ascension-isaiah', 2, 1, 'canon', '2-chronicles', 33, 6, 'free', E'2 Chronicles 33:6 — *And he caused his children to pass through the fire in the valley of the son of Hinnom: also he observed times, and used enchantments, and used witchcraft, and dealt with a familiar spirit, and with wizards: he wrought much evil in the sight of Yahuah (LORD), to provoke him to anger.* The canon confirms the sorcery the Ascension ties to Sammael''s dwelling in Manasseh at 2:1.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 1, 'canon', '2-chronicles', 33, 9, 'free', E'2 Chronicles 33:9 — *So Manasseh made Yahudah (Judah) and the inhabitants of Jerusalem to err, and to do worse than the heathen, whom Yahuah (LORD) had destroyed before the children of Yashar''el (Israel).* The king who forgat his father''s commands led the whole land astray, exactly as Ascension-Isaiah 2:1 reports.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 2, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The Satan whom Manasseh served at 2:2 is the murderer and liar from the beginning.'),
  -- thread: ascension-isaiah-2-beliar-the-ruler-of-this-world
  ('ascension-isaiah', 'ascension-isaiah', 2, 4, 'canon', '2-corinthians', 6, 15, 'free', E'2 Corinthians 6:15 — *And what concord hath Messiah (Christ) with Belial? or what part hath he that believeth with an infidel?* Paul names the same Beliar/Belial whom Manasseh served at 2:4 — no concord with the angel of lawlessness.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 4, 'canon', '2-thessalonians', 2, 3, 'free', E'2 Thessalonians 2:3 — *Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition;* The apostasy Beliar spread in Jerusalem at 2:4 is the very pattern of the falling-away and the man of sin.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 4, 'canon', '2-thessalonians', 2, 4, 'free', E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* Beliar''s delight in Jerusalem and his enthroned lawlessness at 2:4 foreshadows the one who seats himself in the temple.'),
  -- thread: ascension-isaiah-2-persecution-of-the-righteous
  ('ascension-isaiah', 'ascension-isaiah', 2, 5, 'canon', '2-kings', 21, 16, 'free', E'2 Kings 21:16 — *Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another; beside his sin wherewith he made Yahudah (Judah) to sin, in doing that which was evil in the sight of Yahuah (LORD).* The canon names the innocent blood behind the Ascension''s persecution of the righteous at 2:5.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 5, 'canon', 'matthew', 23, 35, 'free', E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The Messiah reckons all the persecuted-righteous blood — including Manasseh''s victims of 2:5 — into one account.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 5, 'canon', '2-timothy', 3, 12, 'free', E'2 Timothy 3:12 — *Yea, and all that will live godly in HaMashiach Yahusha (Christ Jesus) shall suffer persecution.* The persecution of the righteous at 2:5 is the standing lot of the godly Paul affirms.'),
  -- thread: ascension-isaiah-2-the-faithful-withdraw-to-the-wilderness
  ('ascension-isaiah', 'ascension-isaiah', 2, 9, 'canon', 'hebrews', 11, 37, 'free', E'Hebrews 11:37 — *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented;* The sheepskin-clad prophets withdrawing at 2:9-10 are Hebrews'' very roll of the afflicted faithful — and the sawn-asunder names Isaiah''s own coming death.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 10, 'canon', 'hebrews', 11, 38, 'free', E'Hebrews 11:38 — *(Of whom the world was not worthy:) they wandered in deserts, and in mountains, and in dens and caves of the earth.* The faithful naked on the desert mountain at 2:10 are precisely those of whom the world was not worthy.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 7, 'canon', '1-kings', 19, 10, 'free', E'1 Kings 19:10 — *And he said, I have been very jealous for Yahuah Elohim (the LORD God) of hosts: for the children of Yashar''el (Israel) have forsaken thy covenant, thrown down thine altars, and slain thy prophets with the sword; and I, even I only, am left; and they seek my life, to take it away.* Isaiah''s withdrawal from a Satan-worshipping Jerusalem at 2:7 echoes Elijah''s wilderness flight from the same apostasy.'),
  -- thread: ascension-isaiah-2-elijah-micaiah-the-true-prophets
  ('ascension-isaiah', 'ascension-isaiah', 2, 13, 'canon', '1-kings', 22, 8, 'free', E'1 Kings 22:8 — *And the king of Yashar''el (Israel) said unto Jehoshaphat, There is yet one man, Micaiah the son of Imlah, by whom we may enquire of Yahuah (LORD): but I hate him; for he doth not prophesy good concerning me, but evil. And Jehoshaphat said, Let not the king say so.* This is the very Micaiah whom Ahab imprisoned and the Ascension recalls at 2:13 — hated for prophesying truth.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 14, 'canon', '2-kings', 1, 16, 'free', E'2 Kings 1:16 — *And he said unto him, Thus saith Yahuah (LORD), Forasmuch as thou hast sent messengers to enquire of Baal-zebub the god of Ekron, is it not because there is no Elohim (God) in Yashar''el (Israel) to enquire of his word? therefore thou shalt not come down off that bed on which thou art gone up, but shalt surely die.* The canon gives the exact deathbed prophecy against Ahaziah that the Ascension summarizes at 2:14.'),
  ('ascension-isaiah', 'ascension-isaiah', 2, 14, 'canon', '1-kings', 17, 1, 'free', E'1 Kings 17:1 — *And Elijah the Tishbite, who was of the inhabitants of Gilead, said unto Ahab, As Yahuah Elohim (the LORD God) of Yashar''el (Israel) liveth, before whom I stand, there shall not be dew nor rain these years, but according to my word.* Elijah of Gilead, named at 2:14, is the same Tishbite of Gilead who confronted Ahab — the true prophet against Baal.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-2-sammael-in-manasseh',
       E'Sammael abode in Manasseh — the adversary in the apostate king',
       E'*AND it came to pass after that Hezekiah died and Manasseh became king, that he did not remember the commands of Hezekiah his father, but forgat them, and Sammael abode in Manasseh and clung fast to him.* The Ascension names what Kings records: the moment Manasseh forsook the covenant, the adversary took up his dwelling in him. Scripture testifies to the same king''s witchcraft: *And he caused his children to pass through the fire in the valley of the son of Hinnom: also he observed times, and used enchantments, and used witchcraft, and dealt with a familiar spirit, and with wizards: he wrought much evil in the sight of Yahuah (LORD), to provoke him to anger.* (2 Chronicles 33:6); *So Manasseh made Yahudah (Judah) and the inhabitants of Jerusalem to err, and to do worse than the heathen, whom Yahuah (LORD) had destroyed before the children of Yashar''el (Israel).* (2 Chronicles 33:9). The Beloved later names the source of such a will: *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* (John 8:44). It ain''t new — the adversary who clung to Manasseh is the murderer from the beginning.',
       sv.verse_id, ev.verse_id, 'extras', 67525
  FROM _session403_asci2_lookup sv, _session403_asci2_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-2-beliar-the-ruler-of-this-world',
       E'Beliar, the angel of lawlessness, the ruler of this world',
       E'*And Manasseh turned aside his heart to serve Beliar; for the angel of lawlessness, who is the ruler of this world, is Beliar, whose name is Mantanbuchus. and he delighted in Jerusalem because of Manasseh, and he made him strong in apostatizing (Israel) and in the lawlessness which were spread abroad in Jerusalem.* The Ascension names BELIAR — and Paul uses the very same name when he forbids the covenant people any concord with him: *And what concord hath Messiah (Christ) with Belial? or what part hath he that believeth with an infidel?* (2 Corinthians 6:15). The angel of lawlessness who made Manasseh strong in apostasy is the pattern of the coming man of sin: *Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition;* (2 Thessalonians 2:3); *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* (2 Thessalonians 2:4). It ain''t new — the lawless one who seats himself in Jerusalem is no novelty of the end; he is the old Beliar.',
       sv.verse_id, ev.verse_id, 'extras', 67528
  FROM _session403_asci2_lookup sv, _session403_asci2_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=2 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-2-persecution-of-the-righteous',
       E'The persecution of the righteous by Manasseh',
       E'*And witchcraft and magic increased and divination and auguration, and fornication, and adultery, and the persecution of the righteous by Manasseh and Belachira, and Tobia the Canaanite, and John of Anathoth, and by Zadok the chief of the works.* The Ascension says plainly that Manasseh persecuted the righteous — and Kings measures the blood: *Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another; beside his sin wherewith he made Yahudah (Judah) to sin, in doing that which was evil in the sight of Yahuah (LORD).* (2 Kings 21:16). The Beloved gathers all such shed righteous blood into one reckoning: *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* (Matthew 23:35). And the apostle states the rule the prophets lived: *Yea, and all that will live godly in HaMashiach Yahusha (Christ Jesus) shall suffer persecution.* (2 Timothy 3:12). It ain''t new — the righteous have always been hunted by the lawless.',
       sv.verse_id, ev.verse_id, 'extras', 67531
  FROM _session403_asci2_lookup sv, _session403_asci2_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=5
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=2 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-2-the-faithful-withdraw-to-the-wilderness',
       E'Isaiah and the faithful withdraw to the mountain in the desert',
       E'*And, when Isaiah, the son of Amoz, saw the lawlessness which was being perpetrated in Jerusalem and the worship of Satan and his wantonness, he withdrew from Jerusalem and settled in Bethlehem of Yahudah (Judah).* The prophet and his company flee the apostate city: *And Micaiah the prophet, and the aged Ananias, and Joel and Habakkuk, and his son Josab, and many of the faithful who believed in the ascension into heaven, withdrew and settled on the mountain.* *They were all clothed with garments of hair, and they were all prophets. And they had nothing with them but were naked, and they all lamented with a great lamentation because of the going astray of Yashar''el (Israel).* This is the very portrait the Letter to the Hebrews draws of the persecuted faithful: *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented;* (Hebrews 11:37); *(Of whom the world was not worthy:) they wandered in deserts, and in mountains, and in dens and caves of the earth.* (Hebrews 11:38). Elijah before them grieved the same apostasy in the same wilderness: *I have been very jealous for Yahuah Elohim (the LORD God) of hosts: for the children of Yashar''el (Israel) have forsaken thy covenant, thrown down thine altars, and slain thy prophets with the sword; and I, even I only, am left; and they seek my life, to take it away.* (1 Kings 19:10). It ain''t new — the faithful remnant has always withdrawn to the mountains while Israel went astray.',
       sv.verse_id, ev.verse_id, 'extras', 67534
  FROM _session403_asci2_lookup sv, _session403_asci2_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=2 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-2-elijah-micaiah-the-true-prophets',
       E'Elijah and Micaiah — the true prophets against the prophets of Baal',
       E'The Ascension recalls the old contest between the true prophet and the king''s flatterers: *And he, Micaiah, had been reproved by Ahab and cast into prison.* and *And Elijah the prophet of Tebon of Gilead was reproving Ahaziah and Samaria, and prophesied regarding Ahaziah that he should die on his bed of sickness, and that Samaria should be delivered into the hand of Leba Nasr because he had slain the prophets of Elohim (God).* Kings preserves the very Micaiah Ahab hated: *And the king of Yashar''el (Israel) said unto Jehoshaphat, There is yet one man, Micaiah the son of Imlah, by whom we may enquire of Yahuah (LORD): but I hate him; for he doth not prophesy good concerning me, but evil. And Jehoshaphat said, Let not the king say so.* (1 Kings 22:8). And the very word Elijah spoke against Ahaziah''s deathbed: *And he said unto him, Thus saith Yahuah (LORD), Forasmuch as thou hast sent messengers to enquire of Baal-zebub the god of Ekron, is it not because there is no Elohim (God) in Yashar''el (Israel) to enquire of his word? therefore thou shalt not come down off that bed on which thou art gone up, but shalt surely die.* (2 Kings 1:16). Elijah''s stand began here: *And Elijah the Tishbite, who was of the inhabitants of Gilead, said unto Ahab, As Yahuah Elohim (the LORD God) of Yashar''el (Israel) liveth, before whom I stand, there shall not be dew nor rain these years, but according to my word.* (1 Kings 17:1). It ain''t new — the false prophet who accuses Isaiah descends from the old line that hated Micaiah and slew the prophets of Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 67537
  FROM _session403_asci2_lookup sv, _session403_asci2_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-2-sammael-in-manasseh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 33:6 — *And he caused his children to pass through the fire in the valley of the son of Hinnom: also he observed times, and used enchantments, and used witchcraft, and dealt with a familiar spirit, and with wizards: he wrought much evil in the sight of Yahuah (LORD), to provoke him to anger.* The canon confirms the sorcery the Ascension ties to Sammael''s dwelling in Manasseh at 2:1.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-sammael-in-manasseh'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=33 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 33:9 — *So Manasseh made Yahudah (Judah) and the inhabitants of Jerusalem to err, and to do worse than the heathen, whom Yahuah (LORD) had destroyed before the children of Yashar''el (Israel).* The king who forgat his father''s commands led the whole land astray, exactly as Ascension-Isaiah 2:1 reports.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-sammael-in-manasseh'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=33 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The Satan whom Manasseh served at 2:2 is the murderer and liar from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-sammael-in-manasseh'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-2-beliar-the-ruler-of-this-world
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 6:15 — *And what concord hath Messiah (Christ) with Belial? or what part hath he that believeth with an infidel?* Paul names the same Beliar/Belial whom Manasseh served at 2:4 — no concord with the angel of lawlessness.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-beliar-the-ruler-of-this-world'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Thessalonians 2:3 — *Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition;* The apostasy Beliar spread in Jerusalem at 2:4 is the very pattern of the falling-away and the man of sin.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-beliar-the-ruler-of-this-world'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* Beliar''s delight in Jerusalem and his enthroned lawlessness at 2:4 foreshadows the one who seats himself in the temple.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-beliar-the-ruler-of-this-world'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-2-persecution-of-the-righteous
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 21:16 — *Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another; beside his sin wherewith he made Yahudah (Judah) to sin, in doing that which was evil in the sight of Yahuah (LORD).* The canon names the innocent blood behind the Ascension''s persecution of the righteous at 2:5.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-persecution-of-the-righteous'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=21 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The Messiah reckons all the persecuted-righteous blood — including Manasseh''s victims of 2:5 — into one account.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-persecution-of-the-righteous'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Timothy 3:12 — *Yea, and all that will live godly in HaMashiach Yahusha (Christ Jesus) shall suffer persecution.* The persecution of the righteous at 2:5 is the standing lot of the godly Paul affirms.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-persecution-of-the-righteous'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-2-the-faithful-withdraw-to-the-wilderness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:37 — *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented;* The sheepskin-clad prophets withdrawing at 2:9-10 are Hebrews'' very roll of the afflicted faithful — and the sawn-asunder names Isaiah''s own coming death.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-the-faithful-withdraw-to-the-wilderness'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:38 — *(Of whom the world was not worthy:) they wandered in deserts, and in mountains, and in dens and caves of the earth.* The faithful naked on the desert mountain at 2:10 are precisely those of whom the world was not worthy.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-the-faithful-withdraw-to-the-wilderness'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 19:10 — *And he said, I have been very jealous for Yahuah Elohim (the LORD God) of hosts: for the children of Yashar''el (Israel) have forsaken thy covenant, thrown down thine altars, and slain thy prophets with the sword; and I, even I only, am left; and they seek my life, to take it away.* Isaiah''s withdrawal from a Satan-worshipping Jerusalem at 2:7 echoes Elijah''s wilderness flight from the same apostasy.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-the-faithful-withdraw-to-the-wilderness'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-2-elijah-micaiah-the-true-prophets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 22:8 — *And the king of Yashar''el (Israel) said unto Jehoshaphat, There is yet one man, Micaiah the son of Imlah, by whom we may enquire of Yahuah (LORD): but I hate him; for he doth not prophesy good concerning me, but evil. And Jehoshaphat said, Let not the king say so.* This is the very Micaiah whom Ahab imprisoned and the Ascension recalls at 2:13 — hated for prophesying truth.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-elijah-micaiah-the-true-prophets'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=22 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 1:16 — *And he said unto him, Thus saith Yahuah (LORD), Forasmuch as thou hast sent messengers to enquire of Baal-zebub the god of Ekron, is it not because there is no Elohim (God) in Yashar''el (Israel) to enquire of his word? therefore thou shalt not come down off that bed on which thou art gone up, but shalt surely die.* The canon gives the exact deathbed prophecy against Ahaziah that the Ascension summarizes at 2:14.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-elijah-micaiah-the-true-prophets'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 17:1 — *And Elijah the Tishbite, who was of the inhabitants of Gilead, said unto Ahab, As Yahuah Elohim (the LORD God) of Yashar''el (Israel) liveth, before whom I stand, there shall not be dew nor rain these years, but according to my word.* Elijah of Gilead, named at 2:14, is the same Tishbite of Gilead who confronted Ahab — the true prophet against Baal.'
  FROM cross_reference_threads t, cross_references x, _session403_asci2_lookup sv, _session403_asci2_lookup tv
 WHERE t.slug='ascension-isaiah-2-elijah-micaiah-the-true-prophets'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

