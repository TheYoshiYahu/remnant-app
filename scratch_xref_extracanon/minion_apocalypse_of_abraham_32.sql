-- ----- fragment: minion_apocalypseofabraham_32.sql (session253 apocalypse-of-abraham 32) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch32. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa32 (view _session253_aoa32_lookup). Sort band base 67775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa32_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-32-seed-stranger-covenant
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 32, 1, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* Apocalypse of Abraham 32:1 sets this Genesis-15 covenant word inside the heavenly vision, the same prophecy of the strange land and the bondage now heard from the throne.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 32, 1, 'canon', 'acts', 7, 6, 'free', E'Acts 7:6 — *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years.* Stephen recites to the council the same sojourn-and-bondage word that closes Abraham''s vision in 32:1, the covenant carried unbroken from the patriarch to the assembly.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 32, 1, 'canon', 'exodus', 2, 24, 'free', E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* The enslaving and evil-intreating foretold in 32:1 ends precisely because the covenant spoken to Abraham is remembered, the seed kept through the affliction.'),
  -- thread: apocalypse-of-abraham-32-nation-they-serve-i-will-judge
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 32, 1, 'canon', 'genesis', 15, 14, 'free', E'Genesis 15:14 — *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance.* Apocalypse of Abraham 32:1 quotes this judgment-clause almost word for word — the nation that enslaves the seed is itself brought to account, the deliverance assured.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 32, 1, 'canon', 'exodus', 12, 12, 'free', E'Exodus 12:12 — *For I will pass through the land of Egypt this night, and will smite all the firstborn in the land of Egypt, both man and beast; and against all the gods of Egypt I will execute judgment: I am Yahuah (LORD).* The promised judging of the serving-nation in 32:1 lands on Egypt''s gods on Passover night, the covenant word made deed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 32, 1, 'canon', 'joel', 3, 12, 'free', E'Joel 3:12 — *Let the heathen be wakened, and come up to the valley of Jehoshaphat: for there will I sit to judge all the heathen round about.* The same Judge who sentenced Egypt in 32:1 gathers all the nations to judgment at the end, the heathen judged and Abraham''s heritage pleaded for.'),
  -- thread: apocalypse-of-abraham-32-hour-of-the-age-of-ungodliness
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 32, 1, 'enoch', '1-enoch', 10, 6, 'extras', E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* The "Age of ungodliness" whose hour the seed endures in 32:1 has a fixed terminus: Azazel and the corrupters are bound now and reserved for the great judgment by fire.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 32, 1, 'enoch', '1-enoch', 10, 16, 'extras', E'1 Enoch 10:16 — *Destroy all wrong from the face of the earth and let every evil work come to an end: and let the plant of righteousness and truth appear: and it shall prove a blessing; the works of righteousness and truth’ shall be planted in truth and joy for evermore.* The brief hour of ungodliness in 32:1 gives way to the uprooting of all wrong and the planting of the righteous seed — the end Abraham was shown.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 32, 1, 'canon', 'exodus', 12, 41, 'free', E'Exodus 12:41 — *And it came to pass at the end of the four hundred and thirty years, even the selfsame day it came to pass, that all the hosts of Yahuah (LORD) went out from the land of Egypt.* The "hour" of affliction in 32:1 is a measured term that ends on its appointed day, the hosts brought out exactly when the time was full.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa32_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa32_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-32-seed-stranger-covenant',
       E'Thy seed a stranger in a land not theirs — the covenant told before the throne',
       E'The vision closes where Genesis began. *Therefore hear, O Abraham, and see; lo, thy seventh generation shall go with thee, and they shall go out into a strange land, and they shall enslave them, and evil-intreat them as it were an hour of the Age of ungodliness; but the nation whom they shall serve I will judge.* (Apocalypse of Abraham 32:1). It ain''t new — this is the very word spoken over the divided sacrifice in Genesis 15, only now heard from the throne above: *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years* (Genesis 15:13). The horror of great darkness that fell on Abram is the same darkness folded into the heavenly vision. And Stephen, standing before the council, rehearses the selfsame promise: *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years* (Acts 7:6). One covenant, one seed, told at the altar, told before the chariot, told in the synagogue — the election of Abraham''s house standing fast through bondage.',
       sv.verse_id, ev.verse_id, 'extras', 67775
  FROM _session253_aoa32_lookup sv, _session253_aoa32_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=32 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-32-nation-they-serve-i-will-judge',
       E'The nation whom they shall serve I will judge',
       E'The oppressor does not have the last word. *but the nation whom they shall serve I will judge* (Apocalypse of Abraham 32:1). This clause is lifted whole from the covenant: *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance* (Genesis 15:14). It is fulfilled the night judgment falls on Egypt''s gods: *For I will pass through the land of Egypt this night, and will smite all the firstborn in the land of Egypt, both man and beast; and against all the gods of Egypt I will execute judgment: I am Yahuah (LORD)* (Exodus 12:12). And it ain''t new — the same Judge sits over all the heathen at the end: *Let the heathen be wakened, and come up to the valley of Jehoshaphat: for there will I sit to judge all the heathen round about* (Joel 3:12). The judging of Egypt is a pattern of the judging of the nations; the gathering of Abraham''s people stands on the other side of it.',
       sv.verse_id, ev.verse_id, 'extras', 67778
  FROM _session253_aoa32_lookup sv, _session253_aoa32_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=32 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-32-hour-of-the-age-of-ungodliness',
       E'An hour of the Age of ungodliness — and its appointed end',
       E'The bondage is measured against a clock that is running out. *they shall enslave them, and evil-intreat them as it were an hour of the Age of ungodliness* (Apocalypse of Abraham 32:1). The affliction is but "an hour" — bounded, weighed, and headed for the day of reckoning that Abraham has just seen in the vision of the two peoples and the heathen judged. It ain''t new: the age of ungodliness has its sentence already written. *And on the day of the great judgement he shall be cast into the fire* (1 Enoch 10:6) — Azazel, the head of the corrupting Watchers, is bound now and reserved for that day, the same end toward which the oppressing nations are bound. The seed afflicted for "an hour" is the seed kept until that consummation, when the wrong is destroyed from the face of the earth and the plant of righteousness appears (1 Enoch 10:16).',
       sv.verse_id, ev.verse_id, 'extras', 67781
  FROM _session253_aoa32_lookup sv, _session253_aoa32_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=32 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-32-seed-stranger-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* Apocalypse of Abraham 32:1 sets this Genesis-15 covenant word inside the heavenly vision, the same prophecy of the strange land and the bondage now heard from the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa32_lookup sv, _session253_aoa32_lookup tv
 WHERE t.slug='apocalypse-of-abraham-32-seed-stranger-covenant'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:6 — *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years.* Stephen recites to the council the same sojourn-and-bondage word that closes Abraham''s vision in 32:1, the covenant carried unbroken from the patriarch to the assembly.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa32_lookup sv, _session253_aoa32_lookup tv
 WHERE t.slug='apocalypse-of-abraham-32-seed-stranger-covenant'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* The enslaving and evil-intreating foretold in 32:1 ends precisely because the covenant spoken to Abraham is remembered, the seed kept through the affliction.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa32_lookup sv, _session253_aoa32_lookup tv
 WHERE t.slug='apocalypse-of-abraham-32-seed-stranger-covenant'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-32-nation-they-serve-i-will-judge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:14 — *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance.* Apocalypse of Abraham 32:1 quotes this judgment-clause almost word for word — the nation that enslaves the seed is itself brought to account, the deliverance assured.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa32_lookup sv, _session253_aoa32_lookup tv
 WHERE t.slug='apocalypse-of-abraham-32-nation-they-serve-i-will-judge'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 12:12 — *For I will pass through the land of Egypt this night, and will smite all the firstborn in the land of Egypt, both man and beast; and against all the gods of Egypt I will execute judgment: I am Yahuah (LORD).* The promised judging of the serving-nation in 32:1 lands on Egypt''s gods on Passover night, the covenant word made deed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa32_lookup sv, _session253_aoa32_lookup tv
 WHERE t.slug='apocalypse-of-abraham-32-nation-they-serve-i-will-judge'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 3:12 — *Let the heathen be wakened, and come up to the valley of Jehoshaphat: for there will I sit to judge all the heathen round about.* The same Judge who sentenced Egypt in 32:1 gathers all the nations to judgment at the end, the heathen judged and Abraham''s heritage pleaded for.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa32_lookup sv, _session253_aoa32_lookup tv
 WHERE t.slug='apocalypse-of-abraham-32-nation-they-serve-i-will-judge'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-32-hour-of-the-age-of-ungodliness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* The "Age of ungodliness" whose hour the seed endures in 32:1 has a fixed terminus: Azazel and the corrupters are bound now and reserved for the great judgment by fire.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa32_lookup sv, _session253_aoa32_lookup tv
 WHERE t.slug='apocalypse-of-abraham-32-hour-of-the-age-of-ungodliness'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:16 — *Destroy all wrong from the face of the earth and let every evil work come to an end: and let the plant of righteousness and truth appear: and it shall prove a blessing; the works of righteousness and truth’ shall be planted in truth and joy for evermore.* The brief hour of ungodliness in 32:1 gives way to the uprooting of all wrong and the planting of the righteous seed — the end Abraham was shown.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa32_lookup sv, _session253_aoa32_lookup tv
 WHERE t.slug='apocalypse-of-abraham-32-hour-of-the-age-of-ungodliness'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 12:41 — *And it came to pass at the end of the four hundred and thirty years, even the selfsame day it came to pass, that all the hosts of Yahuah (LORD) went out from the land of Egypt.* The "hour" of affliction in 32:1 is a measured term that ends on its appointed day, the hosts brought out exactly when the time was full.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa32_lookup sv, _session253_aoa32_lookup tv
 WHERE t.slug='apocalypse-of-abraham-32-hour-of-the-age-of-ungodliness'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

