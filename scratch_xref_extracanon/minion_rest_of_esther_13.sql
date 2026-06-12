-- ----- fragment: minion_therestofesther_13.sql (session253 the-rest-of-esther 13) -----
-- Source anchor: apocrypha/the-rest-of-esther ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: roe13 (view _session253_roe13_lookup). Sort band base 60475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_roe13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: rest-of-esther-13-the-decree-against-the-nation
  ('apocrypha', 'the-rest-of-esther', 13, 4, 'canon', 'esther', 3, 8, 'free', E'Esther 3:8 — *And Haman said unto king Ahasuerus, There is a certain people scattered abroad and dispersed among the people in all the provinces of thy kingdom; and their laws are diverse from all people; neither keep they the king''s laws: therefore it is not for the king''s profit to suffer them.* The Greek letter merely formalizes the very accusation Haman makes in the Hebrew Esther — a scattered people whose Torah-difference is cast as treason.'),
  ('apocrypha', 'the-rest-of-esther', 13, 6, 'canon', 'esther', 3, 13, 'free', E'Esther 3:13 — *And the letters were sent by posts into all the king''s provinces, to destroy, to kill, and to cause to perish, all Yahudim (Jews), both young and old, little children and women, in one day, even upon the thirteenth day of the twelfth month, which is the month Adar, and to take the spoil of them for a prey.* This is the same sword-without-mercy edict against wives and children that the rest-of-Esther letter publishes against the whole people.'),
  ('apocrypha', 'the-rest-of-esther', 13, 7, 'canon', 'psalms', 83, 4, 'free', E'Psalm 83:4 — *They have said, Come, and let us cut them off from being a nation; that the name of Yashar''el (Israel) may be no more in remembrance.* Haman''s plot to send a people "in one day" into the grave is one episode of the recurring confederate vow to erase Israel from the earth.'),
  -- thread: rest-of-esther-13-i-bowed-not-to-haman
  ('apocrypha', 'the-rest-of-esther', 13, 14, 'canon', 'exodus', 20, 3, 'free', E'Exodus 20:3 — *Thou shalt have no other gods before me.* Mordecai''s refusal to bow to Haman is simple obedience to the first commandment — no glory of man placed before the glory of Elohim.'),
  ('apocrypha', 'the-rest-of-esther', 13, 14, 'canon', 'exodus', 20, 5, 'free', E'Exodus 20:5 — *Thou shalt not bow down thyself to them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God), visiting the iniquity of the fathers upon the children unto the third and fourth generation of them that hate me;* The very posture Mordecai withholds from Haman — bowing down and serving — is the act Sinai reserves for Yahuah alone.'),
  ('apocrypha', 'the-rest-of-esther', 13, 12, 'canon', 'daniel', 3, 18, 'free', E'Daniel 3:18 — *But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up.* Mordecai in Persia and the three in Babylon make the identical confession: no image, no man, gets the worship due to Elohim, whatever the cost.'),
  ('apocrypha', 'the-rest-of-esther', 13, 14, 'canon', 'psalms', 115, 1, 'free', E'Psalm 115:1 — *Not unto us, O Yahuah (LORD), not unto us, but unto thy name give glory, for thy mercy, and for thy truth''s sake.* Mordecai''s refusal "to prefer the glory of man above the glory of Yahuah" is this psalm enacted — the Name keeps its glory.'),
  -- thread: rest-of-esther-13-king-almighty-maker-of-heaven-and-earth
  ('apocrypha', 'the-rest-of-esther', 13, 10, 'canon', 'nehemiah', 9, 6, 'free', E'Nehemiah 9:6 — *Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee.* Mordecai''s "you have made heaven and earth" is the same monotheist confession the Levites pray over the returned exiles.'),
  ('apocrypha', 'the-rest-of-esther', 13, 11, 'canon', 'psalms', 115, 4, 'free', E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands.* Against the made-by-hands gods of the nations, Mordecai owns the living Yahuah whom no man can resist — the system of dead gods is empty, the Maker is not.'),
  ('apocrypha', 'the-rest-of-esther', 13, 10, 'canon', 'isaiah', 44, 23, 'free', E'Isaiah 44:23 — *Sing, O ye heavens; for Yahuah (LORD) hath done it: shout, ye lower parts of the earth: break forth into singing, ye mountains, O forest, and every tree therein: for Yahuah (LORD) hath redeemed Jacob, and glorified himself in Yashar''el (Israel).* The Maker of heaven and earth in Mordecai''s prayer is the same who, having made all things, redeems Jacob — creation and salvation in one hand.'),
  -- thread: rest-of-esther-13-spare-thine-inheritance-out-of-egypt
  ('apocrypha', 'the-rest-of-esther', 13, 15, 'canon', 'deuteronomy', 32, 9, 'free', E'Deuteronomy 32:9 — *For the LORD''S portion is his people; Jacob is the lot of his inheritance.* Mordecai''s word "the inheritance, that has been yours from the beginning" rests on the Song of Moses'' claim that Israel is Yahuah''s own allotted portion.'),
  ('apocrypha', 'the-rest-of-esther', 13, 16, 'canon', 'deuteronomy', 9, 26, 'free', E'Deuteronomy 9:26 — *I prayed therefore unto Yahuah (LORD), and said, O Yahuah (Lord) GOD, destroy not thy people and thine inheritance, which thou hast redeemed through thy greatness, which thou hast brought forth out of Egypt with a mighty hand.* Mordecai''s "despise not the portion delivered out of Egypt" is Moses'' very intercession pleading the Exodus-redeemed inheritance against ruin.'),
  ('apocrypha', 'the-rest-of-esther', 13, 17, 'canon', 'joel', 2, 13, 'free', E'Joel 2:13 — *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil.* Mordecai''s appeal to be "merciful to your inheritance" and to "turn our sorrow into joy" leans on this very mercy that relents from the threatened evil.'),
  -- thread: rest-of-esther-13-haman-the-agagite-the-seed-of-amalek
  ('apocrypha', 'the-rest-of-esther', 13, 3, 'canon', 'exodus', 17, 16, 'free', E'Exodus 17:16 — *For he said, Because Yahuah (LORD) hath sworn that Yahuah (LORD) will have war with Amalek from generation to generation.* Haman the Agagite, of Amalek''s royal seed, is exactly the perpetual foe against whom Yahuah swore this generational war.'),
  ('apocrypha', 'the-rest-of-esther', 13, 6, 'canon', 'deuteronomy', 25, 17, 'free', E'Deuteronomy 25:17 — *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt;* Haman''s edict to slay "with their wives and children" is Amalek''s old work, the very thing Israel is commanded never to forget.'),
  ('apocrypha', 'the-rest-of-esther', 13, 6, 'canon', 'deuteronomy', 25, 18, 'free', E'Deuteronomy 25:18 — *How he met thee by the way, and smote the hindmost of thee, even all that were feeble behind thee, when thou wast faint and weary; and he feared not Elohim (God).* As Amalek struck the feeble hindmost, so Haman the Agagite targets the children and women of the scattered people — the same fearless cruelty.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_roe13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_roe13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-13-the-decree-against-the-nation',
       E'The decree to destroy a people in one day',
       E'Artaxerxes'' letter, drafted by Haman, indicts the covenant people as a scattered law-keeping nation to be wiped out: *Declared to us, that in all nations throughout the world there was scattered a certain malicious people, that had laws contrary to all nations, and continually despised the commandments of kings, so as the uniting of our kingdoms, honourably intended by us cannot go forward.* It ain''t new — it is the same slander Haman whispered in the Hebrew Esther: *And Haman said unto king Ahasuerus, There is a certain people scattered abroad and dispersed among the people in all the provinces of thy kingdom; and their laws are diverse from all people; neither keep they the king''s laws: therefore it is not for the king''s profit to suffer them.* (Esther 3:8). The decree dooms them in a single day — *And the letters were sent by posts into all the king''s provinces, to destroy, to kill, and to cause to perish, all Yahudim (Jews), both young and old, little children and women, in one day, even upon the thirteenth day of the twelfth month, which is the month Adar, and to take the spoil of them for a prey.* (Esther 3:13). And the conspirators'' true aim is older still, the standing oath of the nations against the seed: *They have said, Come, and let us cut them off from being a nation; that the name of Yashar''el (Israel) may be no more in remembrance.* (Psalm 83:4).',
       sv.verse_id, ev.verse_id, 'extras', 60475
  FROM _session253_roe13_lookup sv, _session253_roe13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=13 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-13-i-bowed-not-to-haman',
       E'I bowed not to proud Haman — to no man above Elohim',
       E'Mordecai answers the king''s gate at the price of his life, and explains his refusal before Yahuah: *You know all things, and you know, Yahuah (God), that it was neither in contempt nor pride, nor for any desire of glory, that I did not bow down to proud Aman.* He will not give a man the worship owed to Elohim alone: *But I did this, that I might not prefer the glory of man above the glory of Yahuah (God): neither will I worship any but you, O Yahuah (God), neither will I do it in pride.* It ain''t new — it is the first word of Sinai: *Thou shalt have no other gods before me.* (Exodus 20:3), *Thou shalt not bow down thyself to them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God), visiting the iniquity of the fathers upon the children unto the third and fourth generation of them that hate me;* (Exodus 20:5). Three Hebrew youths take the same stand before another image and another furnace: *But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up.* (Daniel 3:18). And the heart of it — glory to the Name, not to man — is the cry of the Psalms: *Not unto us, O Yahuah (LORD), not unto us, but unto thy name give glory, for thy mercy, and for thy truth''s sake.* (Psalm 115:1).',
       sv.verse_id, ev.verse_id, 'extras', 60478
  FROM _session253_roe13_lookup sv, _session253_roe13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=13 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-13-king-almighty-maker-of-heaven-and-earth',
       E'O Yahuah, the King Almighty, maker of heaven and earth',
       E'Mordecai opens his prayer by confessing the one God over all creation: *Saying, O Yahuah (God), Yahuah (God), the King Almighty: for the whole world is in your power, and if you have appointed to save Yashar''el (Israel), there is no man that can gainsay you.* He grounds the plea in creation and in the uniqueness of Yahuah: *For you have made heaven and earth, and all the wondrous things under the heaven.* — *You are Yahuah (God) of all things, and there is no man that can resist you, which are Yahuah (God).* It ain''t new — it is Nehemiah''s confession and Israel''s creed: *Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee.* (Nehemiah 9:6). The idols of the nations are dumb and dead — *Their idols are silver and gold, the work of men''s hands.* (Psalm 115:4) — but Israel''s God is the living Maker who alone fashioned all things and redeems His own: *Sing, O ye heavens; for Yahuah (LORD) hath done it: shout, ye lower parts of the earth: break forth into singing, ye mountains, O forest, and every tree therein: for Yahuah (LORD) hath redeemed Jacob, and glorified himself in Yashar''el (Israel).* (Isaiah 44:23).',
       sv.verse_id, ev.verse_id, 'extras', 60481
  FROM _session253_roe13_lookup sv, _session253_roe13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=13 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-13-spare-thine-inheritance-out-of-egypt',
       E'Spare thy people, the portion redeemed out of Egypt',
       E'Mordecai pleads not on Israel''s merit but on Yahuah''s own claim — they are His portion, His inheritance: *And now, O Yahuah (God) and King, spare your people: for their eyes are upon us to bring us to nought; yes, they desire to destroy the inheritance, that has been yours from the beginning.* He invokes the Exodus as the title-deed: *Despise not the portion, which you have delivered out of Egypt for your own self.* It ain''t new — it is the song of Moses naming Israel as Yahuah''s own lot: *For the LORD''S portion is his people; Jacob is the lot of his inheritance.* (Deuteronomy 32:9). And it is Moses'' own intercession on the mountain, pleading the redeemed inheritance against destruction: *I prayed therefore unto Yahuah (LORD), and said, O Yahuah (Lord) GOD, destroy not thy people and thine inheritance, which thou hast redeemed through thy greatness, which thou hast brought forth out of Egypt with a mighty hand.* (Deuteronomy 9:26). The plea closes in turning and mercy — "be merciful to your inheritance: turn our sorrow into joy" — the heart of Joel''s call: *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil.* (Joel 2:13).',
       sv.verse_id, ev.verse_id, 'extras', 60484
  FROM _session253_roe13_lookup sv, _session253_roe13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=13 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-13-haman-the-agagite-the-seed-of-amalek',
       E'Haman the Agagite — the seed-war with Amalek',
       E'The whole crisis traces to one man''s pride, the second in the kingdom: *Now when I asked my counsellors how this might be brought to pass, Aman, that excelled in wisdom among us, and was approved for his constant good will and steadfast fidelity, and had the honour of the second place in the kingdom,* Read his Hebrew name and the war comes into focus — Haman the son of Hammedatha the Agagite, of Agag the Amalekite king — so this decree against "a certain malicious people" is the latest assault in an ancient feud. It ain''t new — Yahuah swore the war Himself at Rephidim: *For he said, Because Yahuah (LORD) hath sworn that Yahuah (LORD) will have war with Amalek from generation to generation.* (Exodus 17:16). Moses charged Israel never to forget the cowardly assault on the weak: *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt;* (Deuteronomy 25:17) and *How he met thee by the way, and smote the hindmost of thee, even all that were feeble behind thee, when thou wast faint and weary; and he feared not Elohim (God).* (Deuteronomy 25:18). Haman the Agagite reaches once more for "little children and women" — the hindmost — and so the deliverance through Esther and Mordecai is one more chapter of blotting out the remembrance of Amalek.',
       sv.verse_id, ev.verse_id, 'extras', 60487
  FROM _session253_roe13_lookup sv, _session253_roe13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=13 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: rest-of-esther-13-the-decree-against-the-nation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 3:8 — *And Haman said unto king Ahasuerus, There is a certain people scattered abroad and dispersed among the people in all the provinces of thy kingdom; and their laws are diverse from all people; neither keep they the king''s laws: therefore it is not for the king''s profit to suffer them.* The Greek letter merely formalizes the very accusation Haman makes in the Hebrew Esther — a scattered people whose Torah-difference is cast as treason.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-the-decree-against-the-nation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Esther 3:13 — *And the letters were sent by posts into all the king''s provinces, to destroy, to kill, and to cause to perish, all Yahudim (Jews), both young and old, little children and women, in one day, even upon the thirteenth day of the twelfth month, which is the month Adar, and to take the spoil of them for a prey.* This is the same sword-without-mercy edict against wives and children that the rest-of-Esther letter publishes against the whole people.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-the-decree-against-the-nation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 83:4 — *They have said, Come, and let us cut them off from being a nation; that the name of Yashar''el (Israel) may be no more in remembrance.* Haman''s plot to send a people "in one day" into the grave is one episode of the recurring confederate vow to erase Israel from the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-the-decree-against-the-nation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=83 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-13-i-bowed-not-to-haman
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:3 — *Thou shalt have no other gods before me.* Mordecai''s refusal to bow to Haman is simple obedience to the first commandment — no glory of man placed before the glory of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-i-bowed-not-to-haman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:5 — *Thou shalt not bow down thyself to them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God), visiting the iniquity of the fathers upon the children unto the third and fourth generation of them that hate me;* The very posture Mordecai withholds from Haman — bowing down and serving — is the act Sinai reserves for Yahuah alone.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-i-bowed-not-to-haman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 3:18 — *But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up.* Mordecai in Persia and the three in Babylon make the identical confession: no image, no man, gets the worship due to Elohim, whatever the cost.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-i-bowed-not-to-haman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 115:1 — *Not unto us, O Yahuah (LORD), not unto us, but unto thy name give glory, for thy mercy, and for thy truth''s sake.* Mordecai''s refusal "to prefer the glory of man above the glory of Yahuah" is this psalm enacted — the Name keeps its glory.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-i-bowed-not-to-haman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-13-king-almighty-maker-of-heaven-and-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Nehemiah 9:6 — *Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee.* Mordecai''s "you have made heaven and earth" is the same monotheist confession the Levites pray over the returned exiles.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-king-almighty-maker-of-heaven-and-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands.* Against the made-by-hands gods of the nations, Mordecai owns the living Yahuah whom no man can resist — the system of dead gods is empty, the Maker is not.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-king-almighty-maker-of-heaven-and-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:23 — *Sing, O ye heavens; for Yahuah (LORD) hath done it: shout, ye lower parts of the earth: break forth into singing, ye mountains, O forest, and every tree therein: for Yahuah (LORD) hath redeemed Jacob, and glorified himself in Yashar''el (Israel).* The Maker of heaven and earth in Mordecai''s prayer is the same who, having made all things, redeems Jacob — creation and salvation in one hand.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-king-almighty-maker-of-heaven-and-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-13-spare-thine-inheritance-out-of-egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:9 — *For the LORD''S portion is his people; Jacob is the lot of his inheritance.* Mordecai''s word "the inheritance, that has been yours from the beginning" rests on the Song of Moses'' claim that Israel is Yahuah''s own allotted portion.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-spare-thine-inheritance-out-of-egypt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 9:26 — *I prayed therefore unto Yahuah (LORD), and said, O Yahuah (Lord) GOD, destroy not thy people and thine inheritance, which thou hast redeemed through thy greatness, which thou hast brought forth out of Egypt with a mighty hand.* Mordecai''s "despise not the portion delivered out of Egypt" is Moses'' very intercession pleading the Exodus-redeemed inheritance against ruin.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-spare-thine-inheritance-out-of-egypt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=9 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:13 — *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil.* Mordecai''s appeal to be "merciful to your inheritance" and to "turn our sorrow into joy" leans on this very mercy that relents from the threatened evil.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-spare-thine-inheritance-out-of-egypt'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-13-haman-the-agagite-the-seed-of-amalek
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 17:16 — *For he said, Because Yahuah (LORD) hath sworn that Yahuah (LORD) will have war with Amalek from generation to generation.* Haman the Agagite, of Amalek''s royal seed, is exactly the perpetual foe against whom Yahuah swore this generational war.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-haman-the-agagite-the-seed-of-amalek'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 25:17 — *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt;* Haman''s edict to slay "with their wives and children" is Amalek''s old work, the very thing Israel is commanded never to forget.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-haman-the-agagite-the-seed-of-amalek'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 25:18 — *How he met thee by the way, and smote the hindmost of thee, even all that were feeble behind thee, when thou wast faint and weary; and he feared not Elohim (God).* As Amalek struck the feeble hindmost, so Haman the Agagite targets the children and women of the scattered people — the same fearless cruelty.'
  FROM cross_reference_threads t, cross_references x, _session253_roe13_lookup sv, _session253_roe13_lookup tv
 WHERE t.slug='rest-of-esther-13-haman-the-agagite-the-seed-of-amalek'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=13 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

