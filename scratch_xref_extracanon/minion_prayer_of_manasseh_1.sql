-- ----- fragment: minion_theprayerofmanasseh_01.sql (session253 the-prayer-of-manasseh 1) -----
-- Source anchor: apocrypha/the-prayer-of-manasseh ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: man1 (view _session253_man1_lookup). Sort band base 61300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_man1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: prayer-of-manasseh-1-elohim-of-the-fathers
  ('apocrypha', 'the-prayer-of-manasseh', 1, 1, 'canon', 'exodus', 34, 6, 'free', E'Exodus 34:6 — *And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth,* The very Name proclaimed to the fathers is the Name Manasseh invokes in 1:1.'),
  ('apocrypha', 'the-prayer-of-manasseh', 1, 2, 'canon', 'genesis', 1, 1, 'free', E'Genesis 1:1 — *In the beginning Elohim (God) created the heaven and the earth.* The Maker of heaven and earth in 1:2 is the Creator of the opening verse of Torah.'),
  ('apocrypha', 'the-prayer-of-manasseh', 1, 2, 'canon', 'nehemiah', 9, 6, 'free', E'Nehemiah 9:6 — *Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee.* Israel''s own penitential prayer frames God exactly as Manasseh does in 1:2 — Maker of heaven, earth, and sea.'),
  -- thread: prayer-of-manasseh-1-bound-the-sea
  ('apocrypha', 'the-prayer-of-manasseh', 1, 3, 'canon', 'job', 38, 8, 'free', E'Job 38:8 — *Or who shut up the sea with doors, when it brake forth, as if it had issued out of the womb?* The sea Manasseh says was bound and sealed in 1:3 is the sea God shut up with doors in His charge to Job.'),
  ('apocrypha', 'the-prayer-of-manasseh', 1, 3, 'canon', 'job', 38, 10, 'free', E'Job 38:10 — *And brake up for it my decreed place, and set bars and doors,* The decreed bars and doors set against the deep are the bound and sealed sea of 1:3.'),
  -- thread: prayer-of-manasseh-1-mercy-unmeasurable
  ('apocrypha', 'the-prayer-of-manasseh', 1, 7, 'canon', 'ezekiel', 18, 23, 'free', E'Ezekiel 18:23 — *Have I any pleasure at all that the wicked should die? saith Adonai Yahuah (the Lord GOD): and not that he should return from his ways, and live?* The God who appoints repentance to sinners in 1:7 is the God who takes no pleasure in their death but desires their return.'),
  ('apocrypha', 'the-prayer-of-manasseh', 1, 7, 'canon', 'ezekiel', 18, 32, 'free', E'Ezekiel 18:32 — *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* The promised repentance unto salvation in 1:7 is God''s own plea to turn and live.'),
  ('apocrypha', 'the-prayer-of-manasseh', 1, 6, 'canon', 'isaiah', 1, 18, 'free', E'Isaiah 1:18 — *Come now, and let us reason together, saith Yahuah (LORD): though your sins be as scarlet, they shall be as white as snow; though they be red like crimson, they shall be as wool.* The unmeasurable merciful promise of 1:6 is Yahuah''s own offer to wash scarlet sins white.'),
  ('apocrypha', 'the-prayer-of-manasseh', 1, 7, 'canon', 'exodus', 34, 6, 'free', E'Exodus 34:6 — *And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth,* Manasseh''s confession of God as longsuffering and very merciful in 1:7 quotes the thirteen attributes proclaimed at Sinai.'),
  -- thread: prayer-of-manasseh-1-sins-as-the-sand
  ('apocrypha', 'the-prayer-of-manasseh', 1, 9, 'canon', 'luke', 18, 13, 'free', E'Luke 18:13 — *And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner.* The king who cannot lift his eyes to heaven for his iniquities in 1:9 stands in the very posture Yahusha commends in the publican.'),
  ('apocrypha', 'the-prayer-of-manasseh', 1, 9, 'canon', '1-timothy', 1, 15, 'free', E'1 Timothy 1:15 — *This is a faithful saying, and worthy of all acceptation, that HaMashiach Yahusha (Christ Jesus) came into the world to save sinners; of whom I am chief.* Manasseh sinning above the sands of the sea in 1:9 is the same chief-of-sinners confession Paul makes of himself.'),
  ('apocrypha', 'the-prayer-of-manasseh', 1, 9, 'canon', 'psalms', 130, 3, 'free', E'Psalm 130:3 — *If thou, Yahuah (LORD), shouldest mark iniquities, O Yahuah (Lord), who shall stand?* The multiplied transgressions Manasseh owns in 1:9 are exactly the marked iniquities under which no one could stand.'),
  ('apocrypha', 'the-prayer-of-manasseh', 1, 10, 'canon', '2-chronicles', 33, 9, 'free', E'2 Chronicles 33:9 — *So Manasseh made Yahudah (Judah) and the inhabitants of Jerusalem to err, and to do worse than the heathen, whom Yahuah (LORD) had destroyed before the children of Yashar''el (Israel).* The abominations and multiplied offences Manasseh confesses in 1:10 are the historical sins the Chronicler records of this same king.'),
  -- thread: prayer-of-manasseh-1-bow-the-knee-of-my-heart
  ('apocrypha', 'the-prayer-of-manasseh', 1, 13, 'canon', '2-chronicles', 33, 12, 'free', E'2 Chronicles 33:12 — *And when he was in affliction, he besought Yahuah Elohav (the LORD his God), and humbled himself greatly before the Elohim (God) of his fathers,* The bowing of the knee of the heart in 1:11-13 is the great humbling the Chronicler records of Manasseh in affliction.'),
  ('apocrypha', 'the-prayer-of-manasseh', 1, 13, 'canon', '2-chronicles', 33, 13, 'free', E'2 Chronicles 33:13 — *And prayed unto him: and he was intreated of him, and heard his supplication, and brought him again to Jerusalem into his kingdom. Then Manasseh knew that Yahuah (LORD) he was Elohim (God).* Manasseh''s plea to be forgiven by the God of them that repent in 1:13 is the prayer that, Scripture says, Yahuah was intreated of.'),
  ('apocrypha', 'the-prayer-of-manasseh', 1, 11, 'canon', 'psalms', 51, 17, 'free', E'Psalm 51:17 — *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* The knee of the heart bowed in 1:11 is the broken and contrite heart God will not despise.'),
  ('apocrypha', 'the-prayer-of-manasseh', 1, 13, 'canon', 'isaiah', 57, 15, 'free', E'Isaiah 57:15 — *For thus saith the high and lofty One that inhabiteth eternity, whose name is Holy; I dwell in the high and holy place, with him also that is of a contrite and humble spirit, to revive the spirit of the humble, and to revive the heart of the contrite ones.* The God of them that repent in 1:13 is the high and lofty One who dwells with the contrite to revive them.'),
  ('apocrypha', 'the-prayer-of-manasseh', 1, 12, 'canon', '1-john', 1, 9, 'free', E'1 John 1:9 — *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.* Manasseh''s confession, *I have sinned... and I acknowledge my iniquities* in 1:12, meets the faithful promise that confessed sin is forgiven and cleansed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_man1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_man1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'prayer-of-manasseh-1-elohim-of-the-fathers',
       E'Elohim of our fathers, Maker of heaven and earth',
       E'The penitent king opens not with himself but with the covenant Name and the covenant fathers: *O Yahuah (God), Almighty Yahuah (God) of our fathers, Abraham, Isaac, and Jacob, and of their righteous seed* (Prayer of Manasseh 1:1) — *who have made heaven and earth, with all the ornament thereof* (Prayer of Manasseh 1:2). This is the God of Genesis and of the great congregation: *In the beginning Elohim (God) created the heaven and the earth* (Genesis 1:1), the One whom the Levites confessed, *Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee* (Nehemiah 9:6). The prayer ascends to the Creator before it ever names the sin — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 61300
  FROM _session253_man1_lookup sv, _session253_man1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-prayer-of-manasseh' AND ev.chapter_number=1 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'prayer-of-manasseh-1-bound-the-sea',
       E'Who bound the sea by the word of His commandment',
       E'Manasseh confesses the God whose mere word fences the chaos-deep: *who have bound the sea by the word of your commandment; who have shut up the deep, and sealed it by your terrible and glorious name* (Prayer of Manasseh 1:3) — the God *whom all men fear, and tremble before your power* (Prayer of Manasseh 1:4). This is the answer Yahuah thundered to Job out of the whirlwind: *Or who shut up the sea with doors, when it brake forth, as if it had issued out of the womb?* (Job 38:8), *And brake up for it my decreed place, and set bars and doors* (Job 38:10). The same omnipotence that bars the sea is the omnipotence before which the king now bows.',
       sv.verse_id, ev.verse_id, 'extras', 61303
  FROM _session253_man1_lookup sv, _session253_man1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-prayer-of-manasseh' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'prayer-of-manasseh-1-mercy-unmeasurable',
       E'Mercy unmeasurable — repentance appointed to sinners',
       E'Against the unbearable majesty stands the boundless mercy: *but your merciful promise is unmeasurable and unsearchable* (Prayer of Manasseh 1:6); *for you are the most high Yahuah (God), of great compassion, longsuffering, very merciful, and repentest of the evils of men... have promised repentance and forgiveness to them that have sinned against you... that they may be saved* (Prayer of Manasseh 1:7). This is the heart God revealed through Ezekiel: *Have I any pleasure at all that the wicked should die? saith Adonai Yahuah (the Lord GOD): and not that he should return from his ways, and live?* (Ezekiel 18:23) — *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye* (Ezekiel 18:32). Repentance is no late-invented gospel; it is appointed mercy. Come now — *though your sins be as scarlet, they shall be as white as snow; though they be red like crimson, they shall be as wool* (Isaiah 1:18).',
       sv.verse_id, ev.verse_id, 'extras', 61306
  FROM _session253_man1_lookup sv, _session253_man1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-prayer-of-manasseh' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'prayer-of-manasseh-1-sins-as-the-sand',
       E'I have sinned above the number of the sands of the sea',
       E'The king who filled Jerusalem with abominations now owns it whole: *for I have sinned above the number of the sands of the sea. My transgressions, O Yahuah (God), are multiplied... I am not worthy to behold and see the height of heaven for the multitude of my iniquities* (Prayer of Manasseh 1:9); *I have set up abominations, and have multiplied offences* (Prayer of Manasseh 1:10). This is the publican''s posture exactly: *And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner* (Luke 18:13). It is Paul''s own chief-of-sinners confession: *This is a faithful saying, and worthy of all acceptation, that HaMashiach Yahusha (Christ Jesus) came into the world to save sinners; of whom I am chief* (1 Timothy 1:15). And it is the cry of the Psalmist: *If thou, Yahuah (LORD), shouldest mark iniquities, O Yahuah (Lord), who shall stand?* (Psalm 130:3).',
       sv.verse_id, ev.verse_id, 'extras', 61309
  FROM _session253_man1_lookup sv, _session253_man1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-prayer-of-manasseh' AND ev.chapter_number=1 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'prayer-of-manasseh-1-bow-the-knee-of-my-heart',
       E'I bow the knee of my heart — and Yahuah was intreated',
       E'Here is the prayer''s beating center: *Now therefore I bow the knee of my heart, beseeching you of grace* (Prayer of Manasseh 1:11); *I have sinned, O Yahuah (God), I have sinned, and I acknowledge my iniquities* (Prayer of Manasseh 1:12); *forgive me, O Yahuah (God), forgive me... For you are Yahuah (God), even Yahuah (God) of them that repent* (Prayer of Manasseh 1:13). The Chronicler records that this very prayer was heard: *And when he was in affliction, he besought Yahuah Elohav (the LORD his God), and humbled himself greatly before the Elohim (God) of his fathers* (2 Chronicles 33:12) — *And prayed unto him: and he was intreated of him, and heard his supplication, and brought him again to Jerusalem into his kingdom* (2 Chronicles 33:13). It is the broken-heart sacrifice David sang: *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17), the God who *dwell in the high and holy place, with him also that is of a contrite and humble spirit* (Isaiah 57:15). And the faithful promise of cleansing stands: *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness* (1 John 1:9).',
       sv.verse_id, ev.verse_id, 'extras', 61312
  FROM _session253_man1_lookup sv, _session253_man1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-prayer-of-manasseh' AND ev.chapter_number=1 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: prayer-of-manasseh-1-elohim-of-the-fathers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 34:6 — *And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth,* The very Name proclaimed to the fathers is the Name Manasseh invokes in 1:1.'
  FROM cross_reference_threads t, cross_references x, _session253_man1_lookup sv, _session253_man1_lookup tv
 WHERE t.slug='prayer-of-manasseh-1-elohim-of-the-fathers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:1 — *In the beginning Elohim (God) created the heaven and the earth.* The Maker of heaven and earth in 1:2 is the Creator of the opening verse of Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_man1_lookup sv, _session253_man1_lookup tv
 WHERE t.slug='prayer-of-manasseh-1-elohim-of-the-fathers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Nehemiah 9:6 — *Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee.* Israel''s own penitential prayer frames God exactly as Manasseh does in 1:2 — Maker of heaven, earth, and sea.'
  FROM cross_reference_threads t, cross_references x, _session253_man1_lookup sv, _session253_man1_lookup tv
 WHERE t.slug='prayer-of-manasseh-1-elohim-of-the-fathers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: prayer-of-manasseh-1-bound-the-sea
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:8 — *Or who shut up the sea with doors, when it brake forth, as if it had issued out of the womb?* The sea Manasseh says was bound and sealed in 1:3 is the sea God shut up with doors in His charge to Job.'
  FROM cross_reference_threads t, cross_references x, _session253_man1_lookup sv, _session253_man1_lookup tv
 WHERE t.slug='prayer-of-manasseh-1-bound-the-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 38:10 — *And brake up for it my decreed place, and set bars and doors,* The decreed bars and doors set against the deep are the bound and sealed sea of 1:3.'
  FROM cross_reference_threads t, cross_references x, _session253_man1_lookup sv, _session253_man1_lookup tv
 WHERE t.slug='prayer-of-manasseh-1-bound-the-sea'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: prayer-of-manasseh-1-mercy-unmeasurable
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 18:23 — *Have I any pleasure at all that the wicked should die? saith Adonai Yahuah (the Lord GOD): and not that he should return from his ways, and live?* The God who appoints repentance to sinners in 1:7 is the God who takes no pleasure in their death but desires their return.'
  FROM cross_reference_threads t, cross_references x, _session253_man1_lookup sv, _session253_man1_lookup tv
 WHERE t.slug='prayer-of-manasseh-1-mercy-unmeasurable'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:32 — *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* The promised repentance unto salvation in 1:7 is God''s own plea to turn and live.'
  FROM cross_reference_threads t, cross_references x, _session253_man1_lookup sv, _session253_man1_lookup tv
 WHERE t.slug='prayer-of-manasseh-1-mercy-unmeasurable'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 1:18 — *Come now, and let us reason together, saith Yahuah (LORD): though your sins be as scarlet, they shall be as white as snow; though they be red like crimson, they shall be as wool.* The unmeasurable merciful promise of 1:6 is Yahuah''s own offer to wash scarlet sins white.'
  FROM cross_reference_threads t, cross_references x, _session253_man1_lookup sv, _session253_man1_lookup tv
 WHERE t.slug='prayer-of-manasseh-1-mercy-unmeasurable'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 34:6 — *And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth,* Manasseh''s confession of God as longsuffering and very merciful in 1:7 quotes the thirteen attributes proclaimed at Sinai.'
  FROM cross_reference_threads t, cross_references x, _session253_man1_lookup sv, _session253_man1_lookup tv
 WHERE t.slug='prayer-of-manasseh-1-mercy-unmeasurable'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: prayer-of-manasseh-1-sins-as-the-sand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 18:13 — *And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner.* The king who cannot lift his eyes to heaven for his iniquities in 1:9 stands in the very posture Yahusha commends in the publican.'
  FROM cross_reference_threads t, cross_references x, _session253_man1_lookup sv, _session253_man1_lookup tv
 WHERE t.slug='prayer-of-manasseh-1-sins-as-the-sand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Timothy 1:15 — *This is a faithful saying, and worthy of all acceptation, that HaMashiach Yahusha (Christ Jesus) came into the world to save sinners; of whom I am chief.* Manasseh sinning above the sands of the sea in 1:9 is the same chief-of-sinners confession Paul makes of himself.'
  FROM cross_reference_threads t, cross_references x, _session253_man1_lookup sv, _session253_man1_lookup tv
 WHERE t.slug='prayer-of-manasseh-1-sins-as-the-sand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 130:3 — *If thou, Yahuah (LORD), shouldest mark iniquities, O Yahuah (Lord), who shall stand?* The multiplied transgressions Manasseh owns in 1:9 are exactly the marked iniquities under which no one could stand.'
  FROM cross_reference_threads t, cross_references x, _session253_man1_lookup sv, _session253_man1_lookup tv
 WHERE t.slug='prayer-of-manasseh-1-sins-as-the-sand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=130 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Chronicles 33:9 — *So Manasseh made Yahudah (Judah) and the inhabitants of Jerusalem to err, and to do worse than the heathen, whom Yahuah (LORD) had destroyed before the children of Yashar''el (Israel).* The abominations and multiplied offences Manasseh confesses in 1:10 are the historical sins the Chronicler records of this same king.'
  FROM cross_reference_threads t, cross_references x, _session253_man1_lookup sv, _session253_man1_lookup tv
 WHERE t.slug='prayer-of-manasseh-1-sins-as-the-sand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=33 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: prayer-of-manasseh-1-bow-the-knee-of-my-heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 33:12 — *And when he was in affliction, he besought Yahuah Elohav (the LORD his God), and humbled himself greatly before the Elohim (God) of his fathers,* The bowing of the knee of the heart in 1:11-13 is the great humbling the Chronicler records of Manasseh in affliction.'
  FROM cross_reference_threads t, cross_references x, _session253_man1_lookup sv, _session253_man1_lookup tv
 WHERE t.slug='prayer-of-manasseh-1-bow-the-knee-of-my-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=33 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 33:13 — *And prayed unto him: and he was intreated of him, and heard his supplication, and brought him again to Jerusalem into his kingdom. Then Manasseh knew that Yahuah (LORD) he was Elohim (God).* Manasseh''s plea to be forgiven by the God of them that repent in 1:13 is the prayer that, Scripture says, Yahuah was intreated of.'
  FROM cross_reference_threads t, cross_references x, _session253_man1_lookup sv, _session253_man1_lookup tv
 WHERE t.slug='prayer-of-manasseh-1-bow-the-knee-of-my-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=33 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 51:17 — *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* The knee of the heart bowed in 1:11 is the broken and contrite heart God will not despise.'
  FROM cross_reference_threads t, cross_references x, _session253_man1_lookup sv, _session253_man1_lookup tv
 WHERE t.slug='prayer-of-manasseh-1-bow-the-knee-of-my-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 57:15 — *For thus saith the high and lofty One that inhabiteth eternity, whose name is Holy; I dwell in the high and holy place, with him also that is of a contrite and humble spirit, to revive the spirit of the humble, and to revive the heart of the contrite ones.* The God of them that repent in 1:13 is the high and lofty One who dwells with the contrite to revive them.'
  FROM cross_reference_threads t, cross_references x, _session253_man1_lookup sv, _session253_man1_lookup tv
 WHERE t.slug='prayer-of-manasseh-1-bow-the-knee-of-my-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 John 1:9 — *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.* Manasseh''s confession, *I have sinned... and I acknowledge my iniquities* in 1:12, meets the faithful promise that confessed sin is forgiven and cleansed.'
  FROM cross_reference_threads t, cross_references x, _session253_man1_lookup sv, _session253_man1_lookup tv
 WHERE t.slug='prayer-of-manasseh-1-bow-the-knee-of-my-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-prayer-of-manasseh' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

