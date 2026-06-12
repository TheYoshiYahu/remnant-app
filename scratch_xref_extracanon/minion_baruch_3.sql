-- ----- fragment: minion_baruchwiththeletterofjeremiah_03.sql (session253 baruch-with-the-letter-of-jeremiah 3) -----
-- Source anchor: apocrypha/baruch-with-the-letter-of-jeremiah ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: bar3 (view _session253_bar3_lookup). Sort band base 60750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_bar3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: baruch-3-fountain-of-wisdom
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 12, 'canon', 'jeremiah', 2, 12, 'free', E'Jeremiah 2:12 — *Be astonished, O ye heavens, at this, and be horribly afraid, be ye very desolate, saith Yahuah (LORD).* Jeremiah''s heavens are summoned to be astonished at the very crime Baruch 3:12 confesses — Israel forsaking the fountain.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 9, 'canon', 'proverbs', 1, 20, 'free', E'Proverbs 1:20 — *Wisdom crieth without; she uttereth her voice in the streets:* the same Wisdom Baruch 3:9 bids Israel hear has been crying aloud all along, never hidden from the one who would listen.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 9, 'canon', 'proverbs', 1, 22, 'free', E'Proverbs 1:22 — *How long, ye simple ones, will ye love simplicity? and the scorners delight in their scorning, and fools hate knowledge?* Wisdom''s reproach in Proverbs is the rebuke beneath Baruch 3:9''s summons to give ear and understand.'),
  -- thread: baruch-3-where-is-wisdom-found
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 15, 'canon', 'job', 28, 12, 'free', E'Job 28:12 — *But where shall wisdom be found? and where is the place of understanding?* Job''s question is Baruch 3:15''s question exactly — who has found out her place.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 17, 'canon', 'job', 28, 15, 'free', E'Job 28:15 — *It cannot be gotten for gold, neither shall silver be weighed for the price thereof.* The silver-hoarders of Baruch 3:17 could never purchase the wisdom Job says no gold can buy.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 14, 'canon', 'proverbs', 8, 11, 'free', E'Proverbs 8:11 — wisdom is better than rubies; Baruch 3:14 sends Israel to learn where she is, for she is worth more than the strength and length of days men chase without her.'),
  -- thread: baruch-3-princes-and-giants-perished
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 16, 'canon', '1-corinthians', 2, 6, 'free', E'1 Corinthians 2:6 — *Howbeit we speak wisdom among them that are perfect: yet not the wisdom of this world, nor of the princes of this world, that come to nought:* Paul''s princes who come to nought are Baruch 3:16''s vanished princes of the heathen, ruling without the way of knowledge.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 28, 'canon', '1-corinthians', 2, 8, 'free', E'1 Corinthians 2:8 — *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* The mighty perish through their own foolishness in Baruch 3:28 precisely because the hidden Wisdom was never given them to know.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 26, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of God came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The famous giants of Baruch 3:26 are the Nephilim of Genesis, mighty in war yet destroyed for want of wisdom.'),
  -- thread: baruch-3-not-in-heaven-nor-beyond-the-sea
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 29, 'canon', 'deuteronomy', 30, 12, 'free', E'Deuteronomy 30:12 — *It is not in heaven, that thou shouldest say, Who shall go up for us to heaven, and bring it unto us, that we may hear it, and do it?* Baruch 3:29''s ''who has gone up into heaven'' is Moses'' own rhetorical climb, answered: the word need not be fetched down.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 30, 'canon', 'deuteronomy', 30, 13, 'free', E'Deuteronomy 30:13 — *Neither is it beyond the sea, that thou shouldest say, Who shall go over the sea for us, and bring it unto us, that we may hear it, and do it?* Baruch 3:30''s voyage over the sea for wisdom is the very crossing Moses says is unnecessary, for the word is already given.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 31, 'canon', 'deuteronomy', 30, 14, 'free', E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* Where Baruch 3:31 says no man knows her way, Moses answers that the word-wisdom is set as near as the mouth and the heart.'),
  -- thread: baruch-3-he-that-knoweth-all-things
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 32, 'canon', 'job', 28, 23, 'free', E'Job 28:23 — *Elohim (God) understandeth the way thereof, and he knoweth the place thereof.* Job''s verdict is Baruch 3:32 exactly: the One who knoweth all things alone has found wisdom''s way out.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 32, 'canon', 'proverbs', 8, 22, 'free', E'Proverbs 8:22 — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old.* The Maker who ''prepared the earth'' and found out wisdom in Baruch 3:32 is the same who possessed her before the works of old.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 34, 'canon', 'proverbs', 8, 27, 'free', E'Proverbs 8:27 — *When he prepared the heavens, I was there: when he set a compass upon the face of the depth:* the stars that answer ''Here we be'' in Baruch 3:34 were set in heavens Wisdom watched her Maker prepare.'),
  -- thread: baruch-3-shewed-himself-upon-earth
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 37, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* Baruch 3:37''s Wisdom who ''shewed himself upon earth, and conversed with men'' is the Word made flesh who dwelt among us.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 36, 'apocrypha', 'ecclesiasticus', 24, 8, 'extras', E'Sirach 24:8 — *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* Sirach''s Wisdom given to dwell in Jacob is the very Wisdom Baruch 3:36 says was given to Jacob his servant.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 36, 'canon', 'proverbs', 8, 31, 'free', E'Proverbs 8:31 — *Rejoicing in the habitable part of his earth; and my delights were with the sons of men.* The Wisdom given to Israel in Baruch 3:36 is she whose delight was always with the sons of men, foreshadowing the conversing of 3:37.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 37, 'canon', 'colossians', 1, 17, 'free', E'Colossians 1:17 — *And he is before all things, and by him all things consist.* The One who shewed himself upon earth in Baruch 3:37 is the pre-existent Wisdom-Logos by whom all things hold together.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_bar3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_bar3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-3-fountain-of-wisdom',
       E'Israel forsook the fountain of wisdom',
       E'Baruch turns from the captives'' confession to the heart of the matter: *Hear, Yashar''el (Israel), the commandments of life: give ear to understand wisdom* (Baruch 3:9) — *That you are counted with them that go down into the grave?* (Baruch 3:11) — *You have forsaken the fountain of wisdom* (Baruch 3:12) — *For if you had walked in the way of Yahuah (God), you should have dwelled in peace for ever* (Baruch 3:13). The diagnosis is not new. Jeremiah had already named the double crime: *Be astonished, O ye heavens, at this, and be horribly afraid, be ye very desolate, saith Yahuah (LORD)* (Jeremiah 2:12) — for they forsook the fountain of living waters and hewed out broken cisterns. And the fountain still cries aloud in the streets to the simple: *Wisdom crieth without; she uttereth her voice in the streets* (Proverbs 1:20), *How long, ye simple ones, will ye love simplicity? and the scorners delight in their scorning, and fools hate knowledge?* (Proverbs 1:22). Wisdom here is Torah — the commandments of life — and to forsake her is to choose the grave. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 60750
  FROM _session253_bar3_lookup sv, _session253_bar3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-3-where-is-wisdom-found',
       E'Where shall wisdom be found',
       E'Baruch asks the oldest question: *Learn where is wisdom, where is strength, where is understanding* (Baruch 3:14) — *Who has found out her place? or who has come into her treasures?* (Baruch 3:15). This is Job''s question, word for word in spirit: *But where shall wisdom be found? and where is the place of understanding?* (Job 28:12). Job has already searched the mines and the deep and found that *It cannot be gotten for gold, neither shall silver be weighed for the price thereof* (Job 28:15). The merchants and the princes who *hoarded up silver and gold* (Baruch 3:17) never bought her. It ain''t new — Baruch is singing Job''s twenty-eighth chapter back to the exiles.',
       sv.verse_id, ev.verse_id, 'extras', 60753
  FROM _session253_bar3_lookup sv, _session253_bar3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-3-princes-and-giants-perished',
       E'The princes and the giants perished without her',
       E'Baruch surveys the dead who ruled without wisdom: *Where are the princes of the heathen become, and such as ruled the beasts upon the earth* (Baruch 3:16) — *There were the giants famous from the beginning, that were of so great stature, and so expert in war* (Baruch 3:26) — *Those did not Yahuah (God) choose, neither gave he the way of knowledge to them* (Baruch 3:27) — *But they were destroyed, because they had no wisdom, and perished through their own foolishness* (Baruch 3:28). The giants are the Nephilim of the days before the flood, the mighty men of renown — and their end is the same as Paul''s verdict on the rulers of this age: *Howbeit we speak wisdom among them that are perfect: yet not the wisdom of this world, nor of the princes of this world, that come to nought* (1 Corinthians 2:6), *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory* (1 Corinthians 2:8). Power without wisdom always comes to nought. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 60756
  FROM _session253_bar3_lookup sv, _session253_bar3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=3 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-3-not-in-heaven-nor-beyond-the-sea',
       E'Not in heaven, nor beyond the sea',
       E'Baruch asks who can ascend or cross the deep to fetch her: *Who has gone up into heaven, and taken her, and brought her down from the clouds?* (Baruch 3:29) — *Who has gone over the sea, and found her, and will bring her for pure gold?* (Baruch 3:30) — *No man knoweth her way, nor thinketh of her path* (Baruch 3:31). This is Moses'' word at the end of Deuteronomy, only flipped to its glory: the commandment is NOT out of reach. *It is not in heaven, that thou shouldest say, Who shall go up for us to heaven, and bring it unto us, that we may hear it, and do it?* (Deuteronomy 30:12) — *Neither is it beyond the sea, that thou shouldest say, Who shall go over the sea for us, and bring it unto us, that we may hear it, and do it?* (Deuteronomy 30:13) — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* (Deuteronomy 30:14). No man can climb to wisdom or sail to her — yet Yahuah set her near in the Torah. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 60759
  FROM _session253_bar3_lookup sv, _session253_bar3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=29
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=3 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-3-he-that-knoweth-all-things',
       E'He that knoweth all things found her out',
       E'If no man can reach wisdom, One can: *But he that knoweth all things knoweth her, and has found her out with his understanding: he that prepared the earth for evermore has filled it with fourfooted beasts* (Baruch 3:32) — *He that sends forth light, and it goes, calls it again, and it obeyeth him with fear* (Baruch 3:33) — *The stars shined in their watches, and rejoiced: when he calls them, they say, Here we be; and so with cheerfulness they shewed light to him that made them* (Baruch 3:34). The Maker who possesses Wisdom is the same who possessed her at creation: *Elohim (God) understandeth the way thereof, and he knoweth the place thereof* (Job 28:23). And Wisdom answers from before the world: *Yahuah (LORD) possessed me in the beginning of his way, before his works of old* (Proverbs 8:22) — *When he prepared the heavens, I was there: when he set a compass upon the face of the depth* (Proverbs 8:27). The stars that come at His call in Baruch 3:34 are the same heavens Wisdom watched Him stretch. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 60762
  FROM _session253_bar3_lookup sv, _session253_bar3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=32
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=3 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-3-shewed-himself-upon-earth',
       E'Afterward he shewed himself upon earth',
       E'The chapter crowns its hymn to Wisdom with the line the early church could not stop quoting: *This is our Elohim (God), and there shall none other be accounted of in comparison of him* (Baruch 3:35) — *He has found out all the way of knowledge, and has given it to Jacob his servant, and to Yashar''el (Israel) his beloved* (Baruch 3:36) — *Afterward did he shew himself upon earth, and conversed with men* (Baruch 3:37). The Wisdom given to Jacob is Torah, and that same Wisdom came and dwelt: *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14). Sirach already heard Wisdom say where she was sent to abide: *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel)* (Sirach 24:8). And Paul names the Wisdom by whom all was made: *And he is before all things, and by him all things consist* (Colossians 1:17), the same who *rejoicing in the habitable part of his earth; and my delights were with the sons of men* (Proverbs 8:31). Wisdom = Torah = the Logos who came and conversed with men. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 60765
  FROM _session253_bar3_lookup sv, _session253_bar3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=35
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=3 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: baruch-3-fountain-of-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 2:12 — *Be astonished, O ye heavens, at this, and be horribly afraid, be ye very desolate, saith Yahuah (LORD).* Jeremiah''s heavens are summoned to be astonished at the very crime Baruch 3:12 confesses — Israel forsaking the fountain.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-fountain-of-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 1:20 — *Wisdom crieth without; she uttereth her voice in the streets:* the same Wisdom Baruch 3:9 bids Israel hear has been crying aloud all along, never hidden from the one who would listen.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-fountain-of-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 1:22 — *How long, ye simple ones, will ye love simplicity? and the scorners delight in their scorning, and fools hate knowledge?* Wisdom''s reproach in Proverbs is the rebuke beneath Baruch 3:9''s summons to give ear and understand.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-fountain-of-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-3-where-is-wisdom-found
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 28:12 — *But where shall wisdom be found? and where is the place of understanding?* Job''s question is Baruch 3:15''s question exactly — who has found out her place.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-where-is-wisdom-found'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 28:15 — *It cannot be gotten for gold, neither shall silver be weighed for the price thereof.* The silver-hoarders of Baruch 3:17 could never purchase the wisdom Job says no gold can buy.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-where-is-wisdom-found'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:11 — wisdom is better than rubies; Baruch 3:14 sends Israel to learn where she is, for she is worth more than the strength and length of days men chase without her.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-where-is-wisdom-found'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-3-princes-and-giants-perished
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 2:6 — *Howbeit we speak wisdom among them that are perfect: yet not the wisdom of this world, nor of the princes of this world, that come to nought:* Paul''s princes who come to nought are Baruch 3:16''s vanished princes of the heathen, ruling without the way of knowledge.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-princes-and-giants-perished'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 2:8 — *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* The mighty perish through their own foolishness in Baruch 3:28 precisely because the hidden Wisdom was never given them to know.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-princes-and-giants-perished'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of God came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The famous giants of Baruch 3:26 are the Nephilim of Genesis, mighty in war yet destroyed for want of wisdom.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-princes-and-giants-perished'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-3-not-in-heaven-nor-beyond-the-sea
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:12 — *It is not in heaven, that thou shouldest say, Who shall go up for us to heaven, and bring it unto us, that we may hear it, and do it?* Baruch 3:29''s ''who has gone up into heaven'' is Moses'' own rhetorical climb, answered: the word need not be fetched down.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-not-in-heaven-nor-beyond-the-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:13 — *Neither is it beyond the sea, that thou shouldest say, Who shall go over the sea for us, and bring it unto us, that we may hear it, and do it?* Baruch 3:30''s voyage over the sea for wisdom is the very crossing Moses says is unnecessary, for the word is already given.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-not-in-heaven-nor-beyond-the-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* Where Baruch 3:31 says no man knows her way, Moses answers that the word-wisdom is set as near as the mouth and the heart.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-not-in-heaven-nor-beyond-the-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-3-he-that-knoweth-all-things
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 28:23 — *Elohim (God) understandeth the way thereof, and he knoweth the place thereof.* Job''s verdict is Baruch 3:32 exactly: the One who knoweth all things alone has found wisdom''s way out.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-he-that-knoweth-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 8:22 — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old.* The Maker who ''prepared the earth'' and found out wisdom in Baruch 3:32 is the same who possessed her before the works of old.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-he-that-knoweth-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:27 — *When he prepared the heavens, I was there: when he set a compass upon the face of the depth:* the stars that answer ''Here we be'' in Baruch 3:34 were set in heavens Wisdom watched her Maker prepare.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-he-that-knoweth-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-3-shewed-himself-upon-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* Baruch 3:37''s Wisdom who ''shewed himself upon earth, and conversed with men'' is the Word made flesh who dwelt among us.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-shewed-himself-upon-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 24:8 — *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* Sirach''s Wisdom given to dwell in Jacob is the very Wisdom Baruch 3:36 says was given to Jacob his servant.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-shewed-himself-upon-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=36
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:31 — *Rejoicing in the habitable part of his earth; and my delights were with the sons of men.* The Wisdom given to Israel in Baruch 3:36 is she whose delight was always with the sons of men, foreshadowing the conversing of 3:37.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-shewed-himself-upon-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 1:17 — *And he is before all things, and by him all things consist.* The One who shewed himself upon earth in Baruch 3:37 is the pre-existent Wisdom-Logos by whom all things hold together.'
  FROM cross_reference_threads t, cross_references x, _session253_bar3_lookup sv, _session253_bar3_lookup tv
 WHERE t.slug='baruch-3-shewed-himself-upon-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=3 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

