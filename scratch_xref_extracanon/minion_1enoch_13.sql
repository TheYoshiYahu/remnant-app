-- ----- fragment: minion_1enoch_13.sql (session250 1-enoch 13) -----
-- Source anchor: enoch/1-enoch ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en13 (view _session250_en13_lookup). Sort band base 50300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-13-no-peace-to-the-wicked
  ('enoch', '1-enoch', 13, 1, 'canon', 'isaiah', 48, 22, 'free', E'Isaiah 48:22 — *There is no peace, saith Yahuah (LORD), unto the wicked.* The same standing verdict Enoch pronounces on Azazel in 13:1 — no peace for the one who broke the Creator''s order.'),
  ('enoch', '1-enoch', 13, 1, 'canon', 'isaiah', 57, 21, 'free', E'Isaiah 57:21 — *There is no peace, saith my Elohim (God), to the wicked.* The prophet repeats word-for-word the sentence already gone forth against Azazel in 13:1.'),
  ('enoch', '1-enoch', 13, 1, 'enoch', '1-enoch', 12, 5, 'extras', E'1 Enoch 12:5 — *And ye shall have no peace nor forgiveness of sin: and inasmuch as they delight themselves in their children,* — the verdict over all the Watchers that 13:1 now lays specifically on their chief, Azazel.'),
  ('enoch', '1-enoch', 13, 2, 'jubilees', 'jubilees', 5, 16, 'extras', E'Jubilees 5:16 — *He is not one who will regard the person (of any), nor is He one who will receive gifts, if He says that He will execute judgment on each* — why no toleration nor request can be granted to Azazel in 13:2: the Judge accepts no bribe to overturn the sentence.'),
  -- thread: 1-enoch-13-petition-refused-reserved-in-chains
  ('enoch', '1-enoch', 13, 2, 'enoch', '1-enoch', 10, 10, 'extras', E'1 Enoch 10:10 — *And no request that they (i.e. their fathers) make of thee shall be granted unto their fathers on their behalf; for they hope to live an eternal life, and that each one of them will live five hundred years.* The decree that explains why no request is granted to Azazel in 13:2 — the refusal was settled before Enoch ever drafted the petition.'),
  ('enoch', '1-enoch', 13, 5, 'canon', 'isaiah', 24, 22, 'free', E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The host on high held in prison until the appointed visitation — the same reserved sentence that leaves the Watchers in 13:5 unable to lift their eyes to heaven.'),
  ('enoch', '1-enoch', 13, 4, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude states the verdict Enoch records in 13:4 — the Watchers'' petition for forgiveness cannot reverse a reservation in chains unto the judgement.'),
  ('enoch', '1-enoch', 13, 4, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter echoes Enoch 13:4 — angels reserved unto judgement, their requested forgiveness withheld.'),
  -- thread: 1-enoch-13-the-arts-he-taught-genesis-six
  ('enoch', '1-enoch', 13, 2, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The Watchers'' descent that bred the giants — the very rebellion whose teaching of unrighteousness Enoch arraigns Azazel for in 13:2.'),
  ('enoch', '1-enoch', 13, 2, 'canon', 'genesis', 6, 5, 'free', E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The whole-earth corruption that flowed from the works Azazel taught men in 13:2.'),
  ('enoch', '1-enoch', 13, 2, 'jubilees', 'jubilees', 5, 2, 'extras', E'Jubilees 5:2 — *And lawlessness increased on the earth and all flesh corrupted its way, alike men and cattle and beasts and birds and everything that walks on the earth-all of them corrupted their ways and their orders, and they began to devour each other, and lawlessness increased on the earth and every imagination of the thoughts of all men (was) thus evil continually.* Jubilees describes the spreading corruption that 13:2 charges to the unrighteousness Azazel taught.'),
  ('enoch', '1-enoch', 13, 2, 'enoch', '1-enoch', 10, 8, 'extras', E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* Enoch''s own indictment naming Azazel as the source of the unrighteousness he is sentenced for in 13:2.'),
  -- thread: 1-enoch-13-waters-of-dan-dream-of-chastisement
  ('enoch', '1-enoch', 13, 8, 'canon', 'numbers', 12, 6, 'free', E'Numbers 12:6 — *And he said, Hear now my words: If there be a prophet among you, I Yahuah (LORD) will make myself known unto him in a vision, and will speak unto him in a dream.* The Torah''s own rule for prophetic revelation — exactly the vision-and-voice by which Enoch is commissioned to reprimand the sons of heaven in 13:8.'),
  ('enoch', '1-enoch', 13, 7, 'canon', 'job', 33, 15, 'free', E'Job 33:15 — *In a dream, in a vision of the night, when deep sleep falleth upon men, in slumberings upon the bed;* — the very scene of 13:7, Enoch falling asleep over the petition and a dream of chastisement falling upon him.'),
  ('enoch', '1-enoch', 13, 8, 'canon', 'genesis', 6, 3, 'free', E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The Creator''s limit on rebellious flesh — the chastisement the night vision of 13:8 confirms against the Watchers and their works.'),
  -- thread: 1-enoch-13-enoch-scribe-reads-petition-before-god
  ('enoch', '1-enoch', 13, 6, 'enoch', '1-enoch', 14, 1, 'extras', E'1 Enoch 14:1 — *The book of the words of righteousness, and of the reproof of the Watchers, who belong to the world, according to that which He, who is blessed and righteous, commanded in the vision.* The heading of the very document Enoch writes out and reads before God in 13:6,10 — a book of reproof, not of pardon.'),
  ('enoch', '1-enoch', 13, 10, 'jubilees', 'jubilees', 5, 10, 'extras', E'Jubilees 5:10 — *And their fathers were witnesses (of their destruction), and after this they were bound in the depths of the earth for ever, until the day of the great condemnation when judgment is executed on all those who have corrupted their ways and their works before Yahuah (God).* Why the petition Enoch reads before God in 13:10 fails — the Watcher-fathers are bound, not forgiven.'),
  ('enoch', '1-enoch', 13, 4, 'canon', 'leviticus', 16, 22, 'free', E'Leviticus 16:22 — *And the goat shall bear upon him all their iniquities unto a land not inhabited: and he shall let go the goat in the wilderness.* The Torah''s scapegoat — the same Azazel bound in the desert (1 Enoch 10) — showing iniquity is carried off by the Creator''s appointed judgement, not by the forbearance the Watchers beg for in 13:4.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-13-no-peace-to-the-wicked',
       E'No peace for Azazel — the sentence that is older than Sinai',
       E'Enoch carries the verdict to the chief of the Watchers: *And Enoch went and said: ’Azâzêl, thou shalt have no peace: a severe sentence has gone forth against thee to put thee in bonds* (1 Enoch 13:1). This is not Enoch''s invention — it is the standing word of the Creator against rebellion, the same word the prophet hears: *There is no peace, saith Yahuah (LORD), unto the wicked* (Isaiah 48:22), and again, *There is no peace, saith my Elohim (God), to the wicked* (Isaiah 57:21). The sentence here on Azazel is the same one already spoken over all the Watchers a chapter earlier — *And ye shall have no peace nor forgiveness of sin* (1 Enoch 12:5) — and Jubilees confirms there is no buying it back: of the Judge it is written, *He is not one who will regard the person (of any), nor is He one who will receive gifts* (Jubilees 5:16). The Watchers'' sin is rebellion against the Creator''s order; the peace they forfeit is the peace of the covenant they broke. It ain''t new — the no-peace verdict on the rebel runs from Enoch straight through the prophets.',
       sv.verse_id, ev.verse_id, 'extras', 50300
  FROM _session250_en13_lookup sv, _session250_en13_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=13 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-13-petition-refused-reserved-in-chains',
       E'The Watchers'' petition refused — reserved in chains unto judgement',
       E'The trembling Watchers ask Enoch to draft their appeal: *And they besought me to write out for them the record of a petition, that they might have forgiveness* (1 Enoch 13:4) — yet Azazel is told plainly, *And thou shalt not have toleration nor request granted to thee* (1 Enoch 13:2). The refusal was already decreed in the previous chapter: *And no request that they (i.e. their fathers) make of thee shall be granted unto their fathers on their behalf* (1 Enoch 10:10). This is the canon''s own doctrine of the bound Watchers. Isaiah sees the same host shut away and held for the appointed day: *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high... And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited* (Isaiah 24:21-22). The apostles carry it forward without softening it: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6), and *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). No appeal, no parole — the rebels are held, not pardoned. It ain''t new; Jude and Peter are reading Enoch.',
       sv.verse_id, ev.verse_id, 'extras', 50303
  FROM _session250_en13_lookup sv, _session250_en13_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=13 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-13-the-arts-he-taught-genesis-six',
       E'The unrighteousness he taught — Azazel and the corruption of all flesh',
       E'Enoch names the charge: *And thou shalt not have toleration nor request granted to thee, because of the unrighteousness which thou hast taught, and because of all the works of godlessness and unrighteousness and sin which thou hast shown to men* (1 Enoch 13:2). This is the canon''s own Genesis 6 unfolded. The fallen Watchers are the *sons of Elohim (God)* who *came in unto the daughters of men*, and the fruit was the giants and a world drowned in evil: *There were giants in the earth in those days... And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually* (Genesis 6:4-5). Jubilees tells the same story — *And lawlessness increased on the earth and all flesh corrupted its way... and every imagination of the thoughts of all men (was) thus evil continually* (Jubilees 5:2) — and Enoch itself lays the root at Azazel''s feet: *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin* (1 Enoch 10:8). The Watchers'' descent and forbidden teaching is the seed sown among the wheat; the seed-war begins here. It ain''t new — Genesis 6 is the headline, Enoch is the full account.',
       sv.verse_id, ev.verse_id, 'extras', 50306
  FROM _session250_en13_lookup sv, _session250_en13_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=13 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-13-waters-of-dan-dream-of-chastisement',
       E'The waters of Dan — the night vision of chastisement',
       E'Enoch withdraws to read the petition and is given a dream: *And I went off and sat down at the waters of Dan, in the land of Dan, to the south of the west of Hermon: I read their petition till I fell asleep. And behold a dream came to me, and visions fell upon me, and I saw visions of chastisement, and a voice came to me saying: ‘Speak to the sons of heaven, and reprimand them.’* (1 Enoch 13:7-8). This is how Yahuah (God) speaks to His prophets — not a strange new channel but the appointed one: *If there be a prophet among you, I Yahuah (LORD) will make myself known unto him in a vision, and will speak unto him in a dream* (Numbers 12:6). Elihu names the very setting — sleep upon the bed, the night vision, the purpose of chastisement and turning back: *In a dream, in a vision of the night, when deep sleep falleth upon men, in slumberings upon the bed; Then he openeth the ears of men, and sealeth their instruction* (Job 33:15-16). And the verdict the vision confirms is Genesis 6''s own line over flesh that will not turn: *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years* (Genesis 6:3). It ain''t new — the dream-vision, the reproof of the sons of heaven, the limit set on the rebel: all already in the Torah and the Wisdom books.',
       sv.verse_id, ev.verse_id, 'extras', 50309
  FROM _session250_en13_lookup sv, _session250_en13_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=13 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-13-enoch-scribe-reads-petition-before-god',
       E'Enoch the scribe — the petition read before Yahuah (God), and bearing iniquity away',
       E'Enoch becomes the mediating scribe: *Then I wrote out their petition, and the prayer in regard to their spirits and their deeds individually... that they should have forgiveness and forbearance* (1 Enoch 13:6), and at last *I took their petition and read it before Yahuah (God) of heaven* (1 Enoch 13:10). His commission is the book of reproof itself — *The book of the words of righteousness, and of the reproof of the Watchers, who belong to the world, according to that which He, who is blessed and righteous, commanded in the vision* (1 Enoch 14:1). Yet the appeal cannot stand, for the fathers are kept only as witnesses to their sons'' ruin and then bound: *And their fathers were witnesses (of their destruction), and after this they were bound in the depths of the earth for ever, until the day of the great condemnation when judgment is executed on all those who have corrupted their ways* (Jubilees 5:10). The Torah already pictured how guilt is carried off — not pardoned in place but laid on the head of Azazel and sent away: *And the goat shall bear upon him all their iniquities unto a land not inhabited: and he shall let go the goat in the wilderness* (Leviticus 16:22). That scapegoat is the very Azazel of chapter 10, bound in the desert; the sin is removed by judgement, not by a request for forbearance. Torah stands — the way of atonement is the Creator''s, not the rebel''s petition. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50312
  FROM _session250_en13_lookup sv, _session250_en13_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=13 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-13-no-peace-to-the-wicked
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 48:22 — *There is no peace, saith Yahuah (LORD), unto the wicked.* The same standing verdict Enoch pronounces on Azazel in 13:1 — no peace for the one who broke the Creator''s order.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-no-peace-to-the-wicked'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=48 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 57:21 — *There is no peace, saith my Elohim (God), to the wicked.* The prophet repeats word-for-word the sentence already gone forth against Azazel in 13:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-no-peace-to-the-wicked'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 12:5 — *And ye shall have no peace nor forgiveness of sin: and inasmuch as they delight themselves in their children,* — the verdict over all the Watchers that 13:1 now lays specifically on their chief, Azazel.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-no-peace-to-the-wicked'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=12 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:16 — *He is not one who will regard the person (of any), nor is He one who will receive gifts, if He says that He will execute judgment on each* — why no toleration nor request can be granted to Azazel in 13:2: the Judge accepts no bribe to overturn the sentence.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-no-peace-to-the-wicked'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-13-petition-refused-reserved-in-chains
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:10 — *And no request that they (i.e. their fathers) make of thee shall be granted unto their fathers on their behalf; for they hope to live an eternal life, and that each one of them will live five hundred years.* The decree that explains why no request is granted to Azazel in 13:2 — the refusal was settled before Enoch ever drafted the petition.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-petition-refused-reserved-in-chains'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* The host on high held in prison until the appointed visitation — the same reserved sentence that leaves the Watchers in 13:5 unable to lift their eyes to heaven.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-petition-refused-reserved-in-chains'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude states the verdict Enoch records in 13:4 — the Watchers'' petition for forgiveness cannot reverse a reservation in chains unto the judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-petition-refused-reserved-in-chains'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter echoes Enoch 13:4 — angels reserved unto judgement, their requested forgiveness withheld.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-petition-refused-reserved-in-chains'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-13-the-arts-he-taught-genesis-six
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The Watchers'' descent that bred the giants — the very rebellion whose teaching of unrighteousness Enoch arraigns Azazel for in 13:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-the-arts-he-taught-genesis-six'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The whole-earth corruption that flowed from the works Azazel taught men in 13:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-the-arts-he-taught-genesis-six'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:2 — *And lawlessness increased on the earth and all flesh corrupted its way, alike men and cattle and beasts and birds and everything that walks on the earth-all of them corrupted their ways and their orders, and they began to devour each other, and lawlessness increased on the earth and every imagination of the thoughts of all men (was) thus evil continually.* Jubilees describes the spreading corruption that 13:2 charges to the unrighteousness Azazel taught.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-the-arts-he-taught-genesis-six'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* Enoch''s own indictment naming Azazel as the source of the unrighteousness he is sentenced for in 13:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-the-arts-he-taught-genesis-six'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-13-waters-of-dan-dream-of-chastisement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 12:6 — *And he said, Hear now my words: If there be a prophet among you, I Yahuah (LORD) will make myself known unto him in a vision, and will speak unto him in a dream.* The Torah''s own rule for prophetic revelation — exactly the vision-and-voice by which Enoch is commissioned to reprimand the sons of heaven in 13:8.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-waters-of-dan-dream-of-chastisement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 33:15 — *In a dream, in a vision of the night, when deep sleep falleth upon men, in slumberings upon the bed;* — the very scene of 13:7, Enoch falling asleep over the petition and a dream of chastisement falling upon him.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-waters-of-dan-dream-of-chastisement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=33 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The Creator''s limit on rebellious flesh — the chastisement the night vision of 13:8 confirms against the Watchers and their works.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-waters-of-dan-dream-of-chastisement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-13-enoch-scribe-reads-petition-before-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 14:1 — *The book of the words of righteousness, and of the reproof of the Watchers, who belong to the world, according to that which He, who is blessed and righteous, commanded in the vision.* The heading of the very document Enoch writes out and reads before God in 13:6,10 — a book of reproof, not of pardon.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-enoch-scribe-reads-petition-before-god'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 5:10 — *And their fathers were witnesses (of their destruction), and after this they were bound in the depths of the earth for ever, until the day of the great condemnation when judgment is executed on all those who have corrupted their ways and their works before Yahuah (God).* Why the petition Enoch reads before God in 13:10 fails — the Watcher-fathers are bound, not forgiven.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-enoch-scribe-reads-petition-before-god'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 16:22 — *And the goat shall bear upon him all their iniquities unto a land not inhabited: and he shall let go the goat in the wilderness.* The Torah''s scapegoat — the same Azazel bound in the desert (1 Enoch 10) — showing iniquity is carried off by the Creator''s appointed judgement, not by the forbearance the Watchers beg for in 13:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en13_lookup sv, _session250_en13_lookup tv
 WHERE t.slug='1-enoch-13-enoch-scribe-reads-petition-before-god'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

