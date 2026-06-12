-- ----- fragment: minion_2maccabees_08.sql (session253 2-maccabees 8) -----
-- Source anchor: apocrypha/2-maccabees ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac8 (view _session253_2mac8_lookup). Sort band base 62175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac8_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-8-covenant-remembered
  ('apocrypha', '2-maccabees', 8, 15, 'canon', '2-chronicles', 20, 15, 'free', E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s).* Like Jehoshaphat''s outnumbered remnant, the Maccabees plead the covenant rather than their own strength, knowing the fight belongs to Yahuah.'),
  ('apocrypha', '2-maccabees', 8, 15, 'canon', 'leviticus', 26, 42, 'free', E'Leviticus 26:42 — *Then will I remember my covenant with Jacob, and also my covenant with Isaac, and also my covenant with Abraham will I remember; and I will remember the land.* The very covenants "made with their fathers" that the faithful invoke are the threefold oath Yahuah swore to Jacob, Isaac, and Abraham.'),
  ('apocrypha', '2-maccabees', 8, 15, 'canon', 'leviticus', 26, 44, 'free', E'Leviticus 26:44 — *And yet for all that, when they be in the land of their enemies, I will not cast them away, neither will I abhor them, to destroy them utterly, and to break my covenant with them: for I am Yahuah (LORD) their Elohim (God).* The people trodden down and sold are never abandoned, because Yahuah will not break His covenant with the seed He keeps.'),
  ('apocrypha', '2-maccabees', 8, 29, 'canon', 'deuteronomy', 32, 36, 'free', E'Deuteronomy 32:36 — *For Yahuah (LORD) shall judge his people, and repent himself for his servants, when he seeth that their power is gone, and there is none shut up, or left.* When His servants are reduced to nothing and beseech Him "to be reconciled," it is the Song of Moses fulfilled — Yahuah turning judgment back to mercy for His own.'),
  -- thread: 2-maccabees-8-battle-is-yahuahs
  ('apocrypha', '2-maccabees', 8, 18, 'canon', '1-samuel', 17, 47, 'free', E'1 Samuel 17:47 — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands.* David''s defiance of Goliath is Judas'' creed against Nicanor — the outcome hangs on Yahuah, not on the count of weapons.'),
  ('apocrypha', '2-maccabees', 8, 18, 'canon', 'exodus', 14, 14, 'free', E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* The same Almighty who fought for Israel at the sea is the "confidence" Judas urges on the six thousand.'),
  ('apocrypha', '2-maccabees', 8, 18, 'canon', 'isaiah', 31, 1, 'free', E'Isaiah 31:1 — *Woe to them that go down to Egypt for help; and stay on horses, and trust in chariots, because they are many; and in horsemen, because they are very strong; but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* The heathen "trust in their weapons," exactly the misplaced confidence Isaiah condemns, while the faithful look to the Holy One alone.'),
  ('apocrypha', '2-maccabees', 8, 18, 'apocrypha', '1-maccabees', 3, 19, 'extras', E'1 Maccabees 3:19 — *For the victory of battle stands not in the multitude of an host; but strength comes from heaven.* The sister account puts Judas'' confidence in a single sentence — strength is from heaven, never from numbers.'),
  -- thread: 2-maccabees-8-sennacherib-host-smitten
  ('apocrypha', '2-maccabees', 8, 19, 'canon', '2-kings', 19, 35, 'free', E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Judas cites this very night, "an hundred fourscore and five thousand" to the number, as proof that heaven can undo any host.'),
  ('apocrypha', '2-maccabees', 8, 19, 'canon', 'isaiah', 37, 36, 'free', E'Isaiah 37:36 — *Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* The prophet records the same deliverance Judas recounts, the great army felled by an angel in a single night.'),
  ('apocrypha', '2-maccabees', 8, 19, 'canon', 'psalms', 44, 7, 'free', E'Psalm 44:7 — *But thou hast saved us from our enemies, and hast put them to shame that hated us.* The remembrance of "helps their forefathers had found" is the psalmist''s own boast — that salvation came from Yahuah, not the sword.'),
  -- thread: 2-maccabees-8-ready-to-die-for-the-law
  ('apocrypha', '2-maccabees', 8, 23, 'canon', 'joshua', 1, 8, 'free', E'Joshua 1:8 — *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein: for then thou shalt make thy way prosperous, and then thou shalt have good success.* Eleazar reading the holy book over the army is Joshua''s charge enacted — the Torah goes before them into battle as the source of success.'),
  ('apocrypha', '2-maccabees', 8, 23, 'canon', 'nehemiah', 8, 8, 'free', E'Nehemiah 8:8 — *So they read in the book in the law of Elohim (God) distinctly, and gave the sense, and caused them to understand the reading.* The appointing of Eleazar "to read the holy book" continues the restored practice of reading the law aloud to the gathered people.'),
  ('apocrypha', '2-maccabees', 8, 21, 'canon', 'deuteronomy', 20, 3, 'free', E'Deuteronomy 20:3 — *And shall say unto them, Hear, O Yashar''el (Israel), ye approach this day unto battle against your enemies: let not your hearts faint, fear not, and do not tremble, neither be ye terrified because of them.* Judas exhorting his men "not to be stricken with terror" and made "ready to die for the law" follows the very encouragement Torah commands before war.'),
  ('apocrypha', '2-maccabees', 8, 21, 'canon', 'hebrews', 11, 33, 'free', E'Hebrews 11:33 — *Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions.* The cloud of witnesses remembers these Torah-faithful warriors who by faith "subdued kingdoms," the Maccabees among them.'),
  -- thread: 2-maccabees-8-vengeance-and-the-resurrection-hope
  ('apocrypha', '2-maccabees', 8, 11, 'canon', 'deuteronomy', 32, 35, 'free', E'Deuteronomy 32:35 — *To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste.* Nicanor sells the captives "not expecting the vengeance" — but that recompence belongs to Yahuah alone, who repays in His day.'),
  ('apocrypha', '2-maccabees', 8, 11, 'canon', 'romans', 12, 19, 'free', E'Romans 12:19 — *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord).* The faithful leave Nicanor''s punishment to heaven, exactly the posture Paul commands — vengeance surrendered to Yahuah.'),
  ('apocrypha', '2-maccabees', 8, 27, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The hope that steadies the whole Maccabean resistance is this "better resurrection" — the writer of Hebrews points straight back to the tortured faithful of these very books.'),
  ('apocrypha', '2-maccabees', 8, 27, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The praise of those "preserved to that day" rests on the martyrs'' creed of the chapter before — the King of the world raises up those who die for His laws.'),
  ('apocrypha', '2-maccabees', 8, 27, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The everlasting life the Maccabean martyrs await is Daniel''s promise of the awakening from the dust, the world to come behind their courage.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac8_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac8_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-8-covenant-remembered',
       E'Not for our sakes, but for the covenant with the fathers',
       E'When the captive people are sold off and the sanctuary profaned, they do not plead their own merit but the oath sworn to the patriarchs: *Others sold all that they had left, and withal besought Yahuah (God) to deliver them, sold by the wicked Nicanor before they met together: And if not for their own sakes, yet for the covenants he had made with their fathers, and for his holy and glorious name''s sake, by which they were called* (2 Maccabees 8:14-15). And when the day is won they end where they began — in supplication: *they besought the merciful Yahuah (God) to be reconciled with his servants for ever* (2 Maccabees 8:29). This is no novelty; it is Jehoshaphat''s word in the same crisis: *Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s)* (2 Chronicles 20:15). It is the Song of Moses, which promises that mercy outlasts judgment: *For Yahuah (LORD) shall judge his people, and repent himself for his servants, when he seeth that their power is gone, and there is none shut up, or left* (Deuteronomy 32:36). The ground of that mercy is the unbreakable covenant: *Then will I remember my covenant with Jacob, and also my covenant with Isaac, and also my covenant with Abraham will I remember; and I will remember the land* (Leviticus 26:42). The seed is not cast off; Yahuah will not abhor His own: *And yet for all that, when they be in the land of their enemies, I will not cast them away, neither will I abhor them, to destroy them utterly, and to break my covenant with them: for I am Yahuah (LORD) their Elohim (God)* (Leviticus 26:44).',
       sv.verse_id, ev.verse_id, 'extras', 62175
  FROM _session253_2mac8_lookup sv, _session253_2mac8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=8 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-8-battle-is-yahuahs',
       E'Confidence in the Almighty, not in weapons',
       E'Judas sets the true balance of the war before his men: not numbers, not steel, but heaven. *For they, said he, trust in their weapons and boldness; but our confidence is in the Almighty who at a beck can cast down both them that come against us, and also all the world* (2 Maccabees 8:18). This is David''s word before Goliath, when the boy with a sling answered the armoured giant: *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands* (1 Samuel 17:47). It is Moses at the sea, bidding the trembling people stand: *Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14). It is the rebuke of Isaiah against those who count chariots: *Woe to them that go down to Egypt for help; and stay on horses, and trust in chariots, because they are many; and in horsemen, because they are very strong; but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* (Isaiah 31:1). And in the brother-book Judas says it plainest: *For the victory of battle stands not in the multitude of an host; but strength comes from heaven* (1 Maccabees 3:19). Against the kingdom of man and its twenty thousand of all nations, the remnant''s only weapon is the same one Israel always had.',
       sv.verse_id, ev.verse_id, 'extras', 62178
  FROM _session253_2mac8_lookup sv, _session253_2mac8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=8 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-8-sennacherib-host-smitten',
       E'As under Sennacherib — heaven smites the great army',
       E'To steel his men Judas recounts the past deliverances, chief among them the night Assyria fell without a sword of Israel lifted: *Moreover, he recounted to them what helps their forefathers had found, and how they were delivered, when under Sennacherib an hundred fourscore and five thousand perished* (2 Maccabees 8:19). The figure is exact to the chronicle: *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses* (2 Kings 19:35). Isaiah records the selfsame stroke: *Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses* (Isaiah 37:36). It is the psalmist''s confession that the victory was never theirs to claim: *But thou hast saved us from our enemies, and hast put them to shame that hated us* (Psalm 44:7). The same Hand that broke Sennacherib''s host will break Nicanor''s — the kingdom of man, however vast, is dead corpses by morning when heaven fights.',
       sv.verse_id, ev.verse_id, 'extras', 62181
  FROM _session253_2mac8_lookup sv, _session253_2mac8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=8 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-8-ready-to-die-for-the-law',
       E'Eleazar reads the holy book; ready to die for the law',
       E'The Maccabean host goes into battle not by drill alone but by the Word: *Also he appointed Eleazar to read the holy book: and when he had given them this watchword, The help of Yahuah (God); himself leading the first band* (2 Maccabees 8:23), the men having been made *ready to die for the law and the country* (2 Maccabees 8:21). This is Torah-faithfulness unto death — never the law as a curse, but the covenant held dearer than life. The watchword and the reading are Joshua''s charge: *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein: for then thou shalt make thy way prosperous, and then thou shalt have good success* (Joshua 1:8). It is Ezra''s reform restored: *So they read in the book in the law of Elohim (God) distinctly, and gave the sense, and caused them to understand the reading* (Nehemiah 8:8). It is the priest''s word before Israel went to war: *And shall say unto them, Hear, O Yashar''el (Israel), ye approach this day unto battle against your enemies: let not your hearts faint, fear not, and do not tremble, neither be ye terrified because of them* (Deuteronomy 20:3). And the great cloud of witnesses remembers these very fighters: *Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions* (Hebrews 11:33).',
       sv.verse_id, ev.verse_id, 'extras', 62184
  FROM _session253_2mac8_lookup sv, _session253_2mac8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=8 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-8-vengeance-and-the-resurrection-hope',
       E'Not expecting the vengeance — and the better resurrection',
       E'The slave-trader Nicanor sells the people cheap, *not expecting the vengeance that was to follow upon him from the Almighty Yahuah (God)* (2 Maccabees 8:11) — and the faithful, far from avenging themselves, leave that justice to heaven and end the day yielding *exceeding praise and thanks to Yahuah (God), who had preserved them* (2 Maccabees 8:27). Vengeance is never theirs to seize, for the Song of Moses claims it: *To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste* (Deuteronomy 32:35). Paul cites that very line for the covenant people: *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord)* (Romans 12:19). And the deepest hope undergirding the whole Maccabean stand — the hope for which the seven brothers of the chapter before chose torture over the swine — is the resurrection the writer of Hebrews names directly: *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35). That "better resurrection" is the martyrs'' confidence, *the King of the world shall raise us up* (2 Maccabees 7:9), echoed by Daniel: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2).',
       sv.verse_id, ev.verse_id, 'extras', 62187
  FROM _session253_2mac8_lookup sv, _session253_2mac8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=8 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-8-covenant-remembered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s).* Like Jehoshaphat''s outnumbered remnant, the Maccabees plead the covenant rather than their own strength, knowing the fight belongs to Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-covenant-remembered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 26:42 — *Then will I remember my covenant with Jacob, and also my covenant with Isaac, and also my covenant with Abraham will I remember; and I will remember the land.* The very covenants "made with their fathers" that the faithful invoke are the threefold oath Yahuah swore to Jacob, Isaac, and Abraham.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-covenant-remembered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 26:44 — *And yet for all that, when they be in the land of their enemies, I will not cast them away, neither will I abhor them, to destroy them utterly, and to break my covenant with them: for I am Yahuah (LORD) their Elohim (God).* The people trodden down and sold are never abandoned, because Yahuah will not break His covenant with the seed He keeps.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-covenant-remembered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 32:36 — *For Yahuah (LORD) shall judge his people, and repent himself for his servants, when he seeth that their power is gone, and there is none shut up, or left.* When His servants are reduced to nothing and beseech Him "to be reconciled," it is the Song of Moses fulfilled — Yahuah turning judgment back to mercy for His own.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-covenant-remembered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-8-battle-is-yahuahs
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 17:47 — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands.* David''s defiance of Goliath is Judas'' creed against Nicanor — the outcome hangs on Yahuah, not on the count of weapons.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-battle-is-yahuahs'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* The same Almighty who fought for Israel at the sea is the "confidence" Judas urges on the six thousand.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-battle-is-yahuahs'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 31:1 — *Woe to them that go down to Egypt for help; and stay on horses, and trust in chariots, because they are many; and in horsemen, because they are very strong; but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* The heathen "trust in their weapons," exactly the misplaced confidence Isaiah condemns, while the faithful look to the Holy One alone.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-battle-is-yahuahs'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=31 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 3:19 — *For the victory of battle stands not in the multitude of an host; but strength comes from heaven.* The sister account puts Judas'' confidence in a single sentence — strength is from heaven, never from numbers.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-battle-is-yahuahs'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-8-sennacherib-host-smitten
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Judas cites this very night, "an hundred fourscore and five thousand" to the number, as proof that heaven can undo any host.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-sennacherib-host-smitten'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 37:36 — *Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* The prophet records the same deliverance Judas recounts, the great army felled by an angel in a single night.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-sennacherib-host-smitten'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 44:7 — *But thou hast saved us from our enemies, and hast put them to shame that hated us.* The remembrance of "helps their forefathers had found" is the psalmist''s own boast — that salvation came from Yahuah, not the sword.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-sennacherib-host-smitten'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-8-ready-to-die-for-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 1:8 — *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein: for then thou shalt make thy way prosperous, and then thou shalt have good success.* Eleazar reading the holy book over the army is Joshua''s charge enacted — the Torah goes before them into battle as the source of success.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-ready-to-die-for-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 8:8 — *So they read in the book in the law of Elohim (God) distinctly, and gave the sense, and caused them to understand the reading.* The appointing of Eleazar "to read the holy book" continues the restored practice of reading the law aloud to the gathered people.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-ready-to-die-for-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 20:3 — *And shall say unto them, Hear, O Yashar''el (Israel), ye approach this day unto battle against your enemies: let not your hearts faint, fear not, and do not tremble, neither be ye terrified because of them.* Judas exhorting his men "not to be stricken with terror" and made "ready to die for the law" follows the very encouragement Torah commands before war.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-ready-to-die-for-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:33 — *Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions.* The cloud of witnesses remembers these Torah-faithful warriors who by faith "subdued kingdoms," the Maccabees among them.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-ready-to-die-for-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-8-vengeance-and-the-resurrection-hope
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:35 — *To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste.* Nicanor sells the captives "not expecting the vengeance" — but that recompence belongs to Yahuah alone, who repays in His day.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-vengeance-and-the-resurrection-hope'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 12:19 — *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord).* The faithful leave Nicanor''s punishment to heaven, exactly the posture Paul commands — vengeance surrendered to Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-vengeance-and-the-resurrection-hope'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The hope that steadies the whole Maccabean resistance is this "better resurrection" — the writer of Hebrews points straight back to the tortured faithful of these very books.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-vengeance-and-the-resurrection-hope'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The praise of those "preserved to that day" rests on the martyrs'' creed of the chapter before — the King of the world raises up those who die for His laws.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-vengeance-and-the-resurrection-hope'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The everlasting life the Maccabean martyrs await is Daniel''s promise of the awakening from the dust, the world to come behind their courage.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac8_lookup sv, _session253_2mac8_lookup tv
 WHERE t.slug='2-maccabees-8-vengeance-and-the-resurrection-hope'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=8 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

