-- ----- fragment: minion_jasher_91.sql (session252 jasher 91) -----
-- Source anchor: jasher/jasher ch91. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja91 (view _session252_ja91_lookup). Sort band base 57250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja91_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-91-judah-goes-up-first
  ('jasher', 'jasher', 91, 2, 'canon', 'judges', 1, 1, 'free', E'Judges 1:1 — *Now after the death of Joshua it came to pass, that the children of Yashar''el (Israel) asked Yahuah (LORD), saying, Who shall go up for us against the Canaanites first, to fight against them?* Jasher 91:1-2 retells the very opening of Judges, picking up the story after Joshua''s death.'),
  ('jasher', 'jasher', 91, 2, 'canon', 'judges', 1, 2, 'free', E'Judges 1:2 — *And Yahuah (LORD) said, Yahudah (Judah) shall go up: behold, I have delivered the land into his hand.* Jasher 91:2 carries the same oracle — Judah the lion-tribe leads the conquest of the inheritance.'),
  ('jasher', 'jasher', 91, 3, 'canon', 'judges', 1, 3, 'free', E'Judges 1:3 — *And Yahudah (Judah) said unto Simeon his brother, Come up with me into my lot, that we may fight against the Canaanites; and I likewise will go with thee into thy lot. So Simeon went with him.* Jasher 91:3 matches the brother-tribes'' alliance verse for verse.'),
  ('jasher', 'jasher', 91, 4, 'canon', 'judges', 1, 4, 'free', E'Judges 1:4 — *And Yahudah (Judah) went up; and Yahuah (LORD) delivered the Canaanites and the Perizzites into their hand: and they slew of them in Bezek ten thousand men.* Jasher 91:4 names the same ten thousand smitten in Bezek.'),
  ('jasher', 'jasher', 91, 6, 'canon', 'judges', 1, 7, 'free', E'Judges 1:7 — *And Adoni-bezek said, Threescore and ten kings, having their thumbs and their great toes cut off, gathered their meat under my table: as I have done, so Elohim (God) hath requited me. And they brought him to Jerusalem, and there he died.* Jasher 91:6 carries the king''s own confession that Elohim has requited his cruelty in kind.'),
  -- thread: jasher-91-joseph-takes-bethel-luz
  ('jasher', 'jasher', 91, 8, 'canon', 'judges', 1, 22, 'free', E'Judges 1:22 — *And the house of Joseph, they also went up against Beth-el: and Yahuah (LORD) was with them.* Jasher 91:8 carries the same line — Joseph''s house goes up to Bethel and Yahuah is with them.'),
  ('jasher', 'jasher', 91, 9, 'canon', 'judges', 1, 24, 'free', E'Judges 1:24 — *And the spies saw a man come forth out of the city, and they said unto him, Shew us, we pray thee, the entrance into the city, and we will shew thee mercy.* Jasher 91:9 retells the spies catching the man at the gate and pledging kindness.'),
  ('jasher', 'jasher', 91, 10, 'canon', 'judges', 1, 25, 'free', E'Judges 1:25 — *And when he shewed them the entrance into the city, they smote the city with the edge of the sword; but they let go the man and all his family.* Jasher 91:10-11 matches it — the city smitten, the man and his family spared.'),
  ('jasher', 'jasher', 91, 11, 'canon', 'judges', 1, 26, 'free', E'Judges 1:26 — *And the man went into the land of the Hittites, and built a city, and called the name thereof Luz: which is the name thereof unto this day.* Jasher 91:11 carries the spared man building a city among the Hittites and calling its name Luz.'),
  -- thread: jasher-91-oath-to-the-fathers-fulfilled
  ('jasher', 'jasher', 91, 14, 'canon', 'joshua', 21, 43, 'free', E'Joshua 21:43 — *And Yahuah (LORD) gave unto Yashar''el (Israel) all the land which he sware to give unto their fathers; and they possessed it, and dwelt therein.* Jasher 91:14-15 declares the same completion — the land sworn to the fathers given and possessed.'),
  ('jasher', 'jasher', 91, 15, 'canon', 'joshua', 21, 45, 'free', E'Joshua 21:45 — *There failed not ought of any good thing which Yahuah (LORD) had spoken unto the house of Yashar''el (Israel); all came to pass.* Jasher 91:14''s ''he accomplished all the words which he had spoken'' echoes the canon''s tally that none of Yahuah''s good words failed.'),
  ('jasher', 'jasher', 91, 14, 'canon', 'genesis', 15, 18, 'free', E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates.* Jasher 91:14 names the oath to Abraham, Isaac, and Jacob now accomplished — this is its origin in the cut covenant.'),
  ('jasher', 'jasher', 91, 14, 'canon', 'genesis', 17, 8, 'free', E'Genesis 17:8 — *And I will give unto thee, and to thy seed after thee, the land wherein thou art a stranger, all the land of Canaan, for an everlasting possession; and I will be their Elohim (God).* Jasher 91:14''s land-oath to the patriarchs is the everlasting possession promised here to Abraham''s seed.'),
  ('jasher', 'jasher', 91, 15, 'jubilees', 'jubilees', 13, 20, 'extras', E'Jubilees 13:20 — *For all the land which you see I shall give to you and to your seed for ever, and I shall make your seed as the sand of the sea: though a man may number the dust of the earth, yet your seed shall not be numbered.* The live Jubilees apparatus carries the same land-grant to Abraham''s seed that Jasher 91:15 records as given to all Israel.'),
  -- thread: jasher-91-served-yahuah-all-days-of-joshua
  ('jasher', 'jasher', 91, 11, 'canon', 'joshua', 24, 31, 'free', E'Joshua 24:31 — *And Yashar''el (Israel) served Yahuah (LORD) all the days of Joshua, and all the days of the elders that overlived Joshua, and which had known all the works of Yahuah (LORD), that he had done for Yashar''el (Israel).* Jasher 91:11 carries the same faithfulness of the generation that outlived Joshua and saw Yahuah''s great work.'),
  ('jasher', 'jasher', 91, 15, 'canon', 'joshua', 21, 44, 'free', E'Joshua 21:44 — *And Yahuah (LORD) gave them rest round about, according to all that he sware unto their fathers: and there stood not a man of all their enemies before them; Yahuah (LORD) delivered all their enemies into their hand.* Jasher 91:15''s rest from those around them and secure dwelling is the canon''s same sworn rest.'),
  ('jasher', 'jasher', 91, 15, 'canon', 'joshua', 23, 1, 'free', E'Joshua 23:1 — *And it came to pass a long time after that Yahuah (LORD) had given rest unto Yashar''el (Israel) from all their enemies round about, that Joshua waxed old and stricken in age.* Jasher 91:15 echoes the granted rest from all the surrounding enemies that frames Joshua''s closing days.'),
  -- thread: jasher-91-the-end-be-of-good-courage
  ('jasher', 'jasher', 91, 16, 'canon', 'joshua', 10, 13, 'free', E'Joshua 10:13 — *And the sun stood still, and the moon stayed, until the people had avenged themselves upon their enemies. Is not this written in the book of Jasher? So the sun stood still in the midst of heaven, and hasted not to go down about a whole day.* Jasher 91:16 closes the very Book of Jasher that the canon names by name as its witness to the sun standing still at Gibeon.'),
  ('jasher', 'jasher', 91, 17, 'canon', 'joshua', 1, 9, 'free', E'Joshua 1:9 — *Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest.* Jasher 91:17''s closing charge to be of good courage echoes the very word given Joshua to begin the conquest the book has just finished telling.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja91_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja91_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-91-judah-goes-up-first',
       E'Judah goes up first — Adoni-bezek requited',
       E'Jasher''s last chapter opens after Joshua''s death, exactly where the canon''s book of Judges begins: *And the children of Israel asked of Yahuah (the Lord), saying, Who shall first go up for us to the Canaanites to fight against them? and Yahuah (the Lord) said, Judah shall go up* (Jasher 91:2). The retelling tracks Judges word for word — Judah goes up first, Simeon joins him, and the same king is caught and maimed. **It ain''t new:** the source stands on the page beside it. *Now after the death of Joshua it came to pass, that the children of Yashar''el (Israel) asked Yahuah (LORD), saying, Who shall go up for us against the Canaanites first, to fight against them?* (Judges 1:1). *And Yahuah (LORD) said, Yahudah (Judah) shall go up: behold, I have delivered the land into his hand* (Judges 1:2) — Judah, the lion-tribe of Genesis 49, leads the inheritance. *And Yahudah (Judah) said unto Simeon his brother, Come up with me into my lot, that we may fight against the Canaanites; and I likewise will go with thee into thy lot. So Simeon went with him* (Judges 1:3) — the brother-tribes share the lot. And Adoni-bezek confesses the measure he is measured by: *And Adoni-bezek said, Threescore and ten kings, having their thumbs and their great toes cut off, gathered their meat under my table: as I have done, so Elohim (God) hath requited me. And they brought him to Jerusalem, and there he died* (Judges 1:7).',
       sv.verse_id, ev.verse_id, 'extras', 57250
  FROM _session252_ja91_lookup sv, _session252_ja91_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=2
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=91 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-91-joseph-takes-bethel-luz',
       E'The house of Joseph takes Bethel — the man spared at Luz',
       E'Jasher next follows Joseph''s house to Bethel exactly as Judges 1 does: *And the children of Joseph went up to Bethel, the same is Luz, and Yahuah (the Lord) was with them* (Jasher 91:8). The spies catch a man, he shows the gate, the city falls, and the man is let go to build a new Luz. The canon retells the identical scene: *And the house of Joseph, they also went up against Beth-el: and Yahuah (LORD) was with them* (Judges 1:22). *And the spies saw a man come forth out of the city, and they said unto him, Shew us, we pray thee, the entrance into the city, and we will shew thee mercy* (Judges 1:24). *And when he shewed them the entrance into the city, they smote the city with the edge of the sword; but they let go the man and all his family* (Judges 1:25). And the spared man rebuilds the name elsewhere: *And the man went into the land of the Hittites, and built a city, and called the name thereof Luz: which is the name thereof unto this day* (Judges 1:26). It ain''t new — Jasher 91:9-11 is Judges 1 unfolded.',
       sv.verse_id, ev.verse_id, 'extras', 57253
  FROM _session252_ja91_lookup sv, _session252_ja91_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=8
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=91 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-91-oath-to-the-fathers-fulfilled',
       E'He accomplished His word to Abraham, Isaac, and Jacob — the land oath kept',
       E'Jasher closes the conquest by declaring the covenant kept to the letter: *And he accomplished all the words which he had spoken to Abraham, Isaac, and Jacob, and the oath which he had sworn, to give to them and to their children, the land of the Canaanites* (Jasher 91:14). This is the seed-line oath of Genesis brought home — election precedes confession, the land given because Yahuah swore it. The canon names the same completion: *And Yahuah (LORD) gave unto Yashar''el (Israel) all the land which he sware to give unto their fathers; and they possessed it, and dwelt therein* (Joshua 21:43), *There failed not ought of any good thing which Yahuah (LORD) had spoken unto the house of Yashar''el (Israel); all came to pass* (Joshua 21:45). The oath itself stood from Abraham: *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18), an everlasting possession — *And I will give unto thee, and to thy seed after thee, the land wherein thou art a stranger, all the land of Canaan, for an everlasting possession; and I will be their Elohim (God)* (Genesis 17:8). The Jubilees apparatus carries the identical promise to the same seed: *For all the land which you see I shall give to you and to your seed for ever* (Jubilees 13:20). It ain''t new — Jasher 91:14-15 is the Genesis oath fulfilled.',
       sv.verse_id, ev.verse_id, 'extras', 57256
  FROM _session252_ja91_lookup sv, _session252_ja91_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=91 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-91-served-yahuah-all-days-of-joshua',
       E'Israel served Yahuah all the days of Joshua and the elders — rest in the land',
       E'Jasher records the people''s faithfulness and the rest that followed: *the children of Israel served Yahuah (the Lord) all the days of Joshua, and all the days of the elders, who had lengthened their days after Joshua, and saw the great work of Yahuah (the Lord), which he had performed for Israel* (Jasher 91:11), and *Yahuah (the Lord) gave them rest from those around them, and the children of Israel dwelt securely in their cities* (Jasher 91:15). Torah-keeping stands — the generation that saw the works held the way. The canon says it with the same words: *And Yashar''el (Israel) served Yahuah (LORD) all the days of Joshua, and all the days of the elders that overlived Joshua, and which had known all the works of Yahuah (LORD), that he had done for Yashar''el (Israel)* (Joshua 24:31), and the rest is named too: *And Yahuah (LORD) gave them rest round about, according to all that he sware unto their fathers: and there stood not a man of all their enemies before them; Yahuah (LORD) delivered all their enemies into their hand* (Joshua 21:44), *And it came to pass a long time after that Yahuah (LORD) had given rest unto Yashar''el (Israel) from all their enemies round about* (Joshua 23:1). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 57259
  FROM _session252_ja91_lookup sv, _session252_ja91_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=11
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=91 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-91-the-end-be-of-good-courage',
       E'THE END — be of good courage, all you that trust in Yahuah',
       E'Jasher seals the whole book — the Book of the Upright — with a benediction and a charge: *Blessed be Yahuah (the Lord) for ever, amen, and amen* (Jasher 91:16), *Strengthen yourselves, and let the hearts of all you that trust in Yahuah (the Lord) be of good courage. THE END* (Jasher 91:17). This is the very book the canon names by name. When the sun stood still at Gibeon, Joshua''s own scripture pointed here: *And the sun stood still, and the moon stayed, until the people had avenged themselves upon their enemies. Is not this written in the book of Jasher? So the sun stood still in the midst of heaven, and hasted not to go down about a whole day* (Joshua 10:13) — the canon citing the Upright as witness. The closing charge to be of good courage is the same word given to Joshua at the start of the conquest the book has just narrated to its end: *Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* (Joshua 1:9). It ain''t new — the Upright closes on the trust and courage Torah commanded from the first.',
       sv.verse_id, ev.verse_id, 'extras', 57262
  FROM _session252_ja91_lookup sv, _session252_ja91_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=16
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=91 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-91-judah-goes-up-first
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Judges 1:1 — *Now after the death of Joshua it came to pass, that the children of Yashar''el (Israel) asked Yahuah (LORD), saying, Who shall go up for us against the Canaanites first, to fight against them?* Jasher 91:1-2 retells the very opening of Judges, picking up the story after Joshua''s death.'
  FROM cross_reference_threads t, cross_references x, _session252_ja91_lookup sv, _session252_ja91_lookup tv
 WHERE t.slug='jasher-91-judah-goes-up-first'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 1:2 — *And Yahuah (LORD) said, Yahudah (Judah) shall go up: behold, I have delivered the land into his hand.* Jasher 91:2 carries the same oracle — Judah the lion-tribe leads the conquest of the inheritance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja91_lookup sv, _session252_ja91_lookup tv
 WHERE t.slug='jasher-91-judah-goes-up-first'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judges 1:3 — *And Yahudah (Judah) said unto Simeon his brother, Come up with me into my lot, that we may fight against the Canaanites; and I likewise will go with thee into thy lot. So Simeon went with him.* Jasher 91:3 matches the brother-tribes'' alliance verse for verse.'
  FROM cross_reference_threads t, cross_references x, _session252_ja91_lookup sv, _session252_ja91_lookup tv
 WHERE t.slug='jasher-91-judah-goes-up-first'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Judges 1:4 — *And Yahudah (Judah) went up; and Yahuah (LORD) delivered the Canaanites and the Perizzites into their hand: and they slew of them in Bezek ten thousand men.* Jasher 91:4 names the same ten thousand smitten in Bezek.'
  FROM cross_reference_threads t, cross_references x, _session252_ja91_lookup sv, _session252_ja91_lookup tv
 WHERE t.slug='jasher-91-judah-goes-up-first'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Judges 1:7 — *And Adoni-bezek said, Threescore and ten kings, having their thumbs and their great toes cut off, gathered their meat under my table: as I have done, so Elohim (God) hath requited me. And they brought him to Jerusalem, and there he died.* Jasher 91:6 carries the king''s own confession that Elohim has requited his cruelty in kind.'
  FROM cross_reference_threads t, cross_references x, _session252_ja91_lookup sv, _session252_ja91_lookup tv
 WHERE t.slug='jasher-91-judah-goes-up-first'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-91-joseph-takes-bethel-luz
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Judges 1:22 — *And the house of Joseph, they also went up against Beth-el: and Yahuah (LORD) was with them.* Jasher 91:8 carries the same line — Joseph''s house goes up to Bethel and Yahuah is with them.'
  FROM cross_reference_threads t, cross_references x, _session252_ja91_lookup sv, _session252_ja91_lookup tv
 WHERE t.slug='jasher-91-joseph-takes-bethel-luz'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 1:24 — *And the spies saw a man come forth out of the city, and they said unto him, Shew us, we pray thee, the entrance into the city, and we will shew thee mercy.* Jasher 91:9 retells the spies catching the man at the gate and pledging kindness.'
  FROM cross_reference_threads t, cross_references x, _session252_ja91_lookup sv, _session252_ja91_lookup tv
 WHERE t.slug='jasher-91-joseph-takes-bethel-luz'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judges 1:25 — *And when he shewed them the entrance into the city, they smote the city with the edge of the sword; but they let go the man and all his family.* Jasher 91:10-11 matches it — the city smitten, the man and his family spared.'
  FROM cross_reference_threads t, cross_references x, _session252_ja91_lookup sv, _session252_ja91_lookup tv
 WHERE t.slug='jasher-91-joseph-takes-bethel-luz'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Judges 1:26 — *And the man went into the land of the Hittites, and built a city, and called the name thereof Luz: which is the name thereof unto this day.* Jasher 91:11 carries the spared man building a city among the Hittites and calling its name Luz.'
  FROM cross_reference_threads t, cross_references x, _session252_ja91_lookup sv, _session252_ja91_lookup tv
 WHERE t.slug='jasher-91-joseph-takes-bethel-luz'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-91-oath-to-the-fathers-fulfilled
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 21:43 — *And Yahuah (LORD) gave unto Yashar''el (Israel) all the land which he sware to give unto their fathers; and they possessed it, and dwelt therein.* Jasher 91:14-15 declares the same completion — the land sworn to the fathers given and possessed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja91_lookup sv, _session252_ja91_lookup tv
 WHERE t.slug='jasher-91-oath-to-the-fathers-fulfilled'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=21 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 21:45 — *There failed not ought of any good thing which Yahuah (LORD) had spoken unto the house of Yashar''el (Israel); all came to pass.* Jasher 91:14''s ''he accomplished all the words which he had spoken'' echoes the canon''s tally that none of Yahuah''s good words failed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja91_lookup sv, _session252_ja91_lookup tv
 WHERE t.slug='jasher-91-oath-to-the-fathers-fulfilled'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=21 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates.* Jasher 91:14 names the oath to Abraham, Isaac, and Jacob now accomplished — this is its origin in the cut covenant.'
  FROM cross_reference_threads t, cross_references x, _session252_ja91_lookup sv, _session252_ja91_lookup tv
 WHERE t.slug='jasher-91-oath-to-the-fathers-fulfilled'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 17:8 — *And I will give unto thee, and to thy seed after thee, the land wherein thou art a stranger, all the land of Canaan, for an everlasting possession; and I will be their Elohim (God).* Jasher 91:14''s land-oath to the patriarchs is the everlasting possession promised here to Abraham''s seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja91_lookup sv, _session252_ja91_lookup tv
 WHERE t.slug='jasher-91-oath-to-the-fathers-fulfilled'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 13:20 — *For all the land which you see I shall give to you and to your seed for ever, and I shall make your seed as the sand of the sea: though a man may number the dust of the earth, yet your seed shall not be numbered.* The live Jubilees apparatus carries the same land-grant to Abraham''s seed that Jasher 91:15 records as given to all Israel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja91_lookup sv, _session252_ja91_lookup tv
 WHERE t.slug='jasher-91-oath-to-the-fathers-fulfilled'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=15
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-91-served-yahuah-all-days-of-joshua
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:31 — *And Yashar''el (Israel) served Yahuah (LORD) all the days of Joshua, and all the days of the elders that overlived Joshua, and which had known all the works of Yahuah (LORD), that he had done for Yashar''el (Israel).* Jasher 91:11 carries the same faithfulness of the generation that outlived Joshua and saw Yahuah''s great work.'
  FROM cross_reference_threads t, cross_references x, _session252_ja91_lookup sv, _session252_ja91_lookup tv
 WHERE t.slug='jasher-91-served-yahuah-all-days-of-joshua'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 21:44 — *And Yahuah (LORD) gave them rest round about, according to all that he sware unto their fathers: and there stood not a man of all their enemies before them; Yahuah (LORD) delivered all their enemies into their hand.* Jasher 91:15''s rest from those around them and secure dwelling is the canon''s same sworn rest.'
  FROM cross_reference_threads t, cross_references x, _session252_ja91_lookup sv, _session252_ja91_lookup tv
 WHERE t.slug='jasher-91-served-yahuah-all-days-of-joshua'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=21 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 23:1 — *And it came to pass a long time after that Yahuah (LORD) had given rest unto Yashar''el (Israel) from all their enemies round about, that Joshua waxed old and stricken in age.* Jasher 91:15 echoes the granted rest from all the surrounding enemies that frames Joshua''s closing days.'
  FROM cross_reference_threads t, cross_references x, _session252_ja91_lookup sv, _session252_ja91_lookup tv
 WHERE t.slug='jasher-91-served-yahuah-all-days-of-joshua'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=23 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-91-the-end-be-of-good-courage
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 10:13 — *And the sun stood still, and the moon stayed, until the people had avenged themselves upon their enemies. Is not this written in the book of Jasher? So the sun stood still in the midst of heaven, and hasted not to go down about a whole day.* Jasher 91:16 closes the very Book of Jasher that the canon names by name as its witness to the sun standing still at Gibeon.'
  FROM cross_reference_threads t, cross_references x, _session252_ja91_lookup sv, _session252_ja91_lookup tv
 WHERE t.slug='jasher-91-the-end-be-of-good-courage'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 1:9 — *Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest.* Jasher 91:17''s closing charge to be of good courage echoes the very word given Joshua to begin the conquest the book has just finished telling.'
  FROM cross_reference_threads t, cross_references x, _session252_ja91_lookup sv, _session252_ja91_lookup tv
 WHERE t.slug='jasher-91-the-end-be-of-good-courage'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=91 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

