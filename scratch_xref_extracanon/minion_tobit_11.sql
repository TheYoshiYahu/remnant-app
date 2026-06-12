-- ----- fragment: minion_tobit_11.sql (session253 tobit 11) -----
-- Source anchor: apocrypha/tobit ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob11 (view _session253_tob11_lookup). Sort band base 59850, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-11-gall-the-blind-see
  ('apocrypha', 'tobit', 11, 7, 'canon', 'isaiah', 35, 5, 'free', E'Isaiah 35:5 — *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* The prophet''s promise of opened eyes is the very thing Raphael foretells over Tobit in Tobit 11:7.'),
  ('apocrypha', 'tobit', 11, 8, 'canon', 'john', 9, 6, 'free', E'John 9:6 — *When he had thus spoken, he spat on the ground, and made clay of the spittle, and he anointed the eyes of the blind man with the clay,* The Messiah anoints blind eyes by hand just as Tobias is told to anoint with the gall in Tobit 11:8.'),
  ('apocrypha', 'tobit', 11, 8, 'canon', 'john', 9, 7, 'free', E'John 9:7 — *And said unto him, Go, wash in the pool of Siloam, (which is by interpretation, Sent.) He went his way therefore, and washed, and came seeing.* The blind man comes seeing after the washing, as Tobit''s whiteness falls away and he sees in Tobit 11:8.'),
  ('apocrypha', 'tobit', 11, 8, 'canon', 'mark', 8, 25, 'free', E'Mark 8:25 — *After that he put his hands again upon his eyes, and made him look up: and he was restored, and saw every man clearly.* The two-stage touch that ends in clear sight mirrors the rubbing and peeling of the whiteness in Tobit 11:8.'),
  -- thread: tobit-11-whiteness-peeled-sight
  ('apocrypha', 'tobit', 11, 13, 'canon', 'psalms', 146, 8, 'free', E'Psalm 146:8 — *Yahuah (LORD) openeth the eyes of the blind: Yahuah (LORD) raiseth them that are bowed down: Yahuah (LORD) loveth the righteous:* The psalm names Yahuah as the One who opens blind eyes, the true healer behind the gall that peels the whiteness in Tobit 11:13.'),
  ('apocrypha', 'tobit', 11, 11, 'canon', 'isaiah', 35, 5, 'free', E'Isaiah 35:5 — *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* The son''s striking of the gall on his father''s eyes accomplishes the prophesied opening of the blind in Tobit 11:11.'),
  -- thread: tobit-11-scourged-and-pitied
  ('apocrypha', 'tobit', 11, 15, 'canon', 'job', 5, 18, 'free', E'Job 5:18 — *For he maketh sore, and bindeth up: he woundeth, and his hands make whole.* The same hand that scourged Tobit now takes pity and heals, exactly as Job describes in Tobit 11:15.'),
  ('apocrypha', 'tobit', 11, 15, 'canon', 'hebrews', 12, 6, 'free', E'Hebrews 12:6 — *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* Tobit''s scourging-then-pity is read as a Father''s loving correction, not a curse, in Tobit 11:15.'),
  ('apocrypha', 'tobit', 11, 15, 'canon', 'psalms', 30, 5, 'free', E'Psalm 30:5 — *For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning.* Tobit''s tears turn to joy at the sight of his son, the morning after the night of weeping in Tobit 11:15.'),
  -- thread: tobit-11-ran-fell-on-the-neck
  ('apocrypha', 'tobit', 11, 9, 'canon', 'luke', 15, 20, 'free', E'Luke 15:20 — *And he arose, and came to his father. But when he was yet a great way off, his father saw him, and had compassion, and ran, and fell on his neck, and kissed him.* The father who runs and falls on the returning son''s neck is the very gesture Anna makes over Tobias in Tobit 11:9.'),
  -- thread: tobit-11-gathered-rejoicing-gate
  ('apocrypha', 'tobit', 11, 16, 'canon', 'isaiah', 60, 4, 'free', E'Isaiah 60:4 — *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* The sons and daughters gathered home is the great pattern of which Tobit''s regathered household at the gate is a token in Tobit 11:16.'),
  ('apocrypha', 'tobit', 11, 17, 'canon', 'isaiah', 49, 18, 'free', E'Isaiah 49:18 — *Lift up thine eyes round about, and behold: all these gather themselves together, and come to thee. As I live, saith Yahuah (LORD), thou shalt surely clothe thee with them all, as with an ornament, and bind them on thee, as a bride doeth.* The gathering joy among all Tobit''s brethren mirrors the regathered children of restored Zion in Tobit 11:17.'),
  ('apocrypha', 'tobit', 11, 17, 'canon', 'psalms', 147, 2, 'free', E'Psalm 147:2 — *Yahuah (LORD) doth build up Jerusalem: he gathereth together the outcasts of Yashar''el (Israel).* Yahuah''s gathering of the outcasts of Israel is the larger hope behind the joy among Tobit''s kindred at Nineveh in Tobit 11:17.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-11-gall-the-blind-see',
       E'The gall on the eyes — the blind shall see',
       E'Raphael''s word over the homecoming is a healing oracle: *Then said Raphael, I know, Tobias, that your father will open his eyes.* (Tobit 11:7) *Therefore anoint you his eyes with the gall, and being pricked with it, he shall rub, and the whiteness shall fall away, and he shall see you.* (Tobit 11:8) The prophets had already sung this hope of opened eyes — *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* (Isaiah 35:5) — and Yahusha works the very sign Tobias enacts, anointing eyes with His own hand: *When he had thus spoken, he spat on the ground, and made clay of the spittle, and he anointed the eyes of the blind man with the clay,* (John 9:6) and bids him *Go, wash in the pool of Siloam... He went his way therefore, and washed, and came seeing.* (John 9:7) At Bethsaida He lays hands twice till sight returns clear — *After that he put his hands again upon his eyes, and made him look up: and he was restored, and saw every man clearly.* (Mark 8:25) It ain''t new: the touch that opens blind eyes runs from Tobit''s gall to the Messiah''s clay.',
       sv.verse_id, ev.verse_id, 'extras', 59850
  FROM _session253_tob11_lookup sv, _session253_tob11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=11 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-11-whiteness-peeled-sight',
       E'The whiteness peeled away — Yahuah openeth the eyes of the blind',
       E'The healing is done in the son''s hands: *And took hold of his father: and he strake of the gall on his fathers'' eyes, saying, Be of good hope, my father.* (Tobit 11:11) *And the whiteness pilled away from the corners of his eyes: and when he saw his son, he fell upon his neck.* (Tobit 11:13) Scripture names the One who does this work behind the gall — *Yahuah (LORD) openeth the eyes of the blind: Yahuah (LORD) raiseth them that are bowed down: Yahuah (LORD) loveth the righteous:* (Psalm 146:8). Tobit, the alms-giving righteous man bowed by his affliction, is lifted up; the gall is the means, but Yahuah is the healer, the prophesied opening of the blind made flesh — *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* (Isaiah 35:5).',
       sv.verse_id, ev.verse_id, 'extras', 59853
  FROM _session253_tob11_lookup sv, _session253_tob11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=11 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-11-scourged-and-pitied',
       E'Scourged, yet taken pity on — the chastening that heals',
       E'Tobit''s blessing reads his blindness as a Father''s discipline now turned to mercy: *And he wept, and said, Blessed art you, O Yahuah (God), and blessed is your name for ever; and blessed are all yours holy angels:* (Tobit 11:14) *For you have scourged, and have taken pity on me: for, behold, I see my son Tobias.* (Tobit 11:15) Job knew the same hand that wounds and binds — *For he maketh sore, and bindeth up: he woundeth, and his hands make whole.* (Job 5:18) — and the Spirit applies it to every son: *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* (Hebrews 12:6). This is never law-as-curse but a Father''s love; the night of weeping gives way to morning — *For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning.* (Psalm 30:5).',
       sv.verse_id, ev.verse_id, 'extras', 59856
  FROM _session253_tob11_lookup sv, _session253_tob11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=11 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-11-ran-fell-on-the-neck',
       E'She ran and fell upon his neck — the embrace of the returned',
       E'The mother''s watching breaks into running joy: *Now Anna sat looking about toward the way for her son.* (Tobit 11:5) *Then Anna ran forth, and fell upon the neck of her son, and said to him, Seeing I have seen you, my son, from henceforth I am content to die. And they wept both.* (Tobit 11:9) The Messiah hangs the homecoming of the lost on this very picture — the father watching the road and running to embrace: *And he arose, and came to his father. But when he was yet a great way off, his father saw him, and had compassion, and ran, and fell on his neck, and kissed him.* (Luke 15:20). Aged Anna''s content-to-die at the sight of her child is the joy of the long-awaited one beheld at last.',
       sv.verse_id, ev.verse_id, 'extras', 59859
  FROM _session253_tob11_lookup sv, _session253_tob11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=11 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-11-gathered-rejoicing-gate',
       E'Joy at the gate — the kindred gathered home',
       E'The healed Tobit goes out to the gate and the scattered kindred are gathered in gladness: *Then Tobit went out to meet his daughter in law at the gate of Nineve, rejoicing and praising Yahuah (God): and they which saw him go marvelled, because he had received his sight.* (Tobit 11:16) *...And there was joy among all his brothers which were at Nineve.* (Tobit 11:17) Even in exile at Nineveh the household is regathered — a small token of the great ingathering of the scattered house (Ezekiel 37), never a church supplanting Israel but Israel itself drawn home. *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* (Isaiah 60:4); *Lift up thine eyes round about, and behold: all these gather themselves together, and come to thee...* (Isaiah 49:18); for Yahuah Himself *doth build up Jerusalem: he gathereth together the outcasts of Yashar''el (Israel).* (Psalm 147:2).',
       sv.verse_id, ev.verse_id, 'extras', 59862
  FROM _session253_tob11_lookup sv, _session253_tob11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=11 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-11-gall-the-blind-see
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 35:5 — *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* The prophet''s promise of opened eyes is the very thing Raphael foretells over Tobit in Tobit 11:7.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-gall-the-blind-see'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 9:6 — *When he had thus spoken, he spat on the ground, and made clay of the spittle, and he anointed the eyes of the blind man with the clay,* The Messiah anoints blind eyes by hand just as Tobias is told to anoint with the gall in Tobit 11:8.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-gall-the-blind-see'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 9:7 — *And said unto him, Go, wash in the pool of Siloam, (which is by interpretation, Sent.) He went his way therefore, and washed, and came seeing.* The blind man comes seeing after the washing, as Tobit''s whiteness falls away and he sees in Tobit 11:8.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-gall-the-blind-see'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Mark 8:25 — *After that he put his hands again upon his eyes, and made him look up: and he was restored, and saw every man clearly.* The two-stage touch that ends in clear sight mirrors the rubbing and peeling of the whiteness in Tobit 11:8.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-gall-the-blind-see'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=8 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-11-whiteness-peeled-sight
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 146:8 — *Yahuah (LORD) openeth the eyes of the blind: Yahuah (LORD) raiseth them that are bowed down: Yahuah (LORD) loveth the righteous:* The psalm names Yahuah as the One who opens blind eyes, the true healer behind the gall that peels the whiteness in Tobit 11:13.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-whiteness-peeled-sight'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=146 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 35:5 — *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped.* The son''s striking of the gall on his father''s eyes accomplishes the prophesied opening of the blind in Tobit 11:11.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-whiteness-peeled-sight'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-11-scourged-and-pitied
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 5:18 — *For he maketh sore, and bindeth up: he woundeth, and his hands make whole.* The same hand that scourged Tobit now takes pity and heals, exactly as Job describes in Tobit 11:15.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-scourged-and-pitied'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 12:6 — *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* Tobit''s scourging-then-pity is read as a Father''s loving correction, not a curse, in Tobit 11:15.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-scourged-and-pitied'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 30:5 — *For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning.* Tobit''s tears turn to joy at the sight of his son, the morning after the night of weeping in Tobit 11:15.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-scourged-and-pitied'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=30 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-11-ran-fell-on-the-neck
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 15:20 — *And he arose, and came to his father. But when he was yet a great way off, his father saw him, and had compassion, and ran, and fell on his neck, and kissed him.* The father who runs and falls on the returning son''s neck is the very gesture Anna makes over Tobias in Tobit 11:9.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-ran-fell-on-the-neck'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-11-gathered-rejoicing-gate
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 60:4 — *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* The sons and daughters gathered home is the great pattern of which Tobit''s regathered household at the gate is a token in Tobit 11:16.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-gathered-rejoicing-gate'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 49:18 — *Lift up thine eyes round about, and behold: all these gather themselves together, and come to thee. As I live, saith Yahuah (LORD), thou shalt surely clothe thee with them all, as with an ornament, and bind them on thee, as a bride doeth.* The gathering joy among all Tobit''s brethren mirrors the regathered children of restored Zion in Tobit 11:17.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-gathered-rejoicing-gate'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 147:2 — *Yahuah (LORD) doth build up Jerusalem: he gathereth together the outcasts of Yashar''el (Israel).* Yahuah''s gathering of the outcasts of Israel is the larger hope behind the joy among Tobit''s kindred at Nineveh in Tobit 11:17.'
  FROM cross_reference_threads t, cross_references x, _session253_tob11_lookup sv, _session253_tob11_lookup tv
 WHERE t.slug='tobit-11-gathered-rejoicing-gate'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=147 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

