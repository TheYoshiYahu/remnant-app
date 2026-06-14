-- ----- fragment: minion_ignatiusmagnesians_01.sql (session253 ignatius-magnesians 1) -----
-- Source anchor: lightfoot-apostolic-fathers/ignatius-magnesians ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: igmag1 (view _session253_igmag1_lookup). Sort band base 70300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_igmag1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ignatius-magnesians-1-prophets-lived-by-messiah
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'hebrews', 1, 1, 'free', E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* the one Elohim who spoke through the prophets is the same who manifested Himself through the Son, exactly Ignatius''s claim that the divine prophets lived after the Messiah.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', '1-peter', 1, 11, 'free', E'1 Peter 1:11 — *Searching what, or what manner of time the Spirit of Messiah (Christ) which was in them did signify, when it testified beforehand the sufferings of Messiah (Christ), and the glory that should follow.* Peter names the very grace by which Ignatius says the prophets were inspired — the Spirit of Messiah testifying in them beforehand.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'luke', 24, 27, 'free', E'Luke 24:27 — *And beginning at Moses and all the prophets, he expounded unto them in all the scriptures the things concerning himself.* The Messiah reading Himself out of Moses and the prophets is the ground of Ignatius''s word that the prophets were His disciples expecting Him.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'john', 5, 46, 'free', E'John 5:46 — *For had ye believed Moses, ye would have believed me: for he wrote of me.* That Moses wrote of Him answers Ignatius''s point that the prophets, being His disciples, awaited Him as their teacher.'),
  -- thread: ignatius-magnesians-1-one-elohim-through-the-son
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'john', 1, 18, 'free', E'John 1:18 — *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* The Son who declares the unseen Father is Ignatius''s one Elohim manifesting Himself through Yahusha His Son, the Word from silence.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'john', 14, 9, 'free', E'John 14:9 — *Yahusha (Jesus) saith unto him, Have I been so long time with you, and yet hast thou not known me, Philip? he that hath seen me hath seen the Father; and how sayest thou then, Shew us the Father?* To see the Son is to see the Father — the manifestation Ignatius means by the one Elohim revealed through the Son.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 6, 'canon', 'colossians', 1, 16, 'free', E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* the Son by whom all things were made is the One Ignatius says was with the Father before the worlds and appeared at the end of time.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'john', 8, 29, 'free', E'John 8:29 — *And he that sent me is with me: the Father hath not left me alone; for I do always those things that please him.* The Son always doing the Father''s pleasure is Ignatius''s Word who in all things was well-pleasing unto Him that sent Him.'),
  -- thread: ignatius-magnesians-1-real-birth-passion-resurrection
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 11, 'canon', 'romans', 1, 3, 'free', E'Romans 1:3 — *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh;* the real flesh of David''s seed is exactly the birth Ignatius says was truly and certainly done.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 11, 'canon', 'romans', 1, 4, 'free', E'Romans 1:4 — *And declared to be the Son of Elohim (God) with power, according to the spirit of holiness, by the resurrection from the dead:* the resurrection that declares Him Son matches the resurrection Ignatius binds to the birth and passion under Pilate.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 11, 'canon', '2-timothy', 2, 8, 'free', E'2 Timothy 2:8 — *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel:* Paul''s “remember” of David''s seed raised is the same persuasion Ignatius urges concerning the birth, passion, and resurrection.'),
  -- thread: ignatius-magnesians-1-two-coinages-two-ways
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 4, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Moses'' two set before Israel is the very pair Ignatius names — life and death set before us together.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 4, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* the call to choose life answers Ignatius''s free choice between the two coinages of Elohim and of the world.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 4, 'canon', 'matthew', 7, 13, 'free', E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* the Messiah''s two gates are Ignatius''s two ways, each man going to his own place.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 4, 'canon', 'matthew', 7, 14, 'free', E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The narrow way unto life is the stamp of Elohim the Father which Ignatius bids the faithful bear.'),
  -- thread: ignatius-magnesians-1-the-law-is-not-abolished
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'matthew', 5, 17, 'free', E'Matthew 5:17 — *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil.* Against the anti-sabbath gloss of 1:9, the Messiah''s own word upholds the law and the prophets — the apparatus shows the canon underneath the error.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'mark', 2, 27, 'free', E'Mark 2:27 — *And he said unto them, The sabbath was made for man, and not man for the sabbath:* the sabbath is a gift made for man, not a thing to be discarded as 1:9 would have it.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'mark', 2, 28, 'free', E'Mark 2:28 — *Therefore the Son of Adam is Yahuah (Lord) also of the sabbath.* The Messiah is the sabbath''s Lord, not its abolisher — the truth that corrects the antinomian turn of 1:9.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'isaiah', 66, 23, 'free', E'Isaiah 66:23 — *And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD).* The everlasting sabbath worship of all flesh refutes the notion of no longer observing sabbaths.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 10, 'canon', '1-corinthians', 5, 8, 'free', E'1 Corinthians 5:8 — *Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth.* Paul''s leaven figure purges malice while keeping the feast — the leaven of 1:10 is the leaven of wickedness, not the appointed times themselves.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_igmag1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_igmag1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-magnesians-1-prophets-lived-by-messiah',
       E'The divine prophets lived after the Messiah — it ain''t new',
       E'Ignatius will not have the witness of the Messiah severed from the witness of the prophets: *“For if even unto this day we live after the manner of Judaism, we avow that we have not received grace: for the divine prophets lived after HaMashiach Yahusha (Christ Jesus). For this cause also they were perse-cuted, being inspired by His grace... seeing that even the prophets, being His disciples, were expecting Him as their teacher through the Spirit”* (Ignatius to the Magnesians 1:8-9). This is the apostolic confession exactly: the Spirit of Messiah spoke in the prophets before ever He came in flesh. *“Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets”* (Hebrews 1:1). Peter says the prophets *“prophesied of the grace that should come unto you”*, *“Searching what... the Spirit of Messiah (Christ) which was in them did signify, when it testified beforehand the sufferings of Messiah”* (1 Peter 1:10-11). And the risen Messiah Himself, *“beginning at Moses and all the prophets, he expounded unto them in all the scriptures the things concerning himself”* (Luke 24:27) — for, as He told them, Moses *“wrote of me”* (John 5:46). The prophets were never a discarded scaffolding; they were His disciples awaiting their Teacher.',
       sv.verse_id, ev.verse_id, 'extras', 70300
  FROM _session253_igmag1_lookup sv, _session253_igmag1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-magnesians' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-magnesians-1-one-elohim-through-the-son',
       E'One Elohim manifested through the Son, the Word from silence',
       E'Against strange doctrines Ignatius confesses the one Elohim made known through His Son: *“there is one Elohim (God) who mani-fested Himself through Yahusha HaMashiach (Jesus Christ) His Son, who is His Word that proceeded from silence, who in all things was well-pleasing unto Him that sent Him”* (Ignatius to the Magnesians 1:8); the Son *“who was with the Father before the worlds and appeared at the end of time”* (1:6), *“who came forth from One Father and is with One and departed unto One”* (1:7). This is the Logos of the apostle: *“No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him”* (John 1:18) — and *“he that hath seen me hath seen the Father”* (John 14:9). The Son by whom all was made: *“For by him were all things created, that are in heaven, and that are in earth, visible and invisible”* (Colossians 1:16), and *“he is before all things, and by him all things consist”* (Colossians 1:17). The Word ever well-pleasing: *“he that sent me is with me: the Father hath not left me alone; for I do always those things that please him”* (John 8:29).',
       sv.verse_id, ev.verse_id, 'extras', 70303
  FROM _session253_igmag1_lookup sv, _session253_igmag1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-magnesians' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-magnesians-1-real-birth-passion-resurrection',
       E'Truly born, truly suffered, truly raised — under Pontius Pilate',
       E'Ignatius guards the real incarnation against every emptying gloss: *“be ye fully persuaded concerning the birth and the passion and the resurrection, which took place in the time of the governorship of Pontius Pilate; for these things were truly and certainly done by Yahusha HaMashiach (Jesus Christ) our hope”* (Ignatius to the Magnesians 1:11). The Messiah is the Son truly come in David''s flesh and truly raised: *“Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh”* (Romans 1:3), *“And declared to be the Son of Elohim (God) with power, according to the spirit of holiness, by the resurrection from the dead”* (Romans 1:4). Paul presses the same anchored gospel: *“Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel”* (2 Timothy 2:8). The birth, the passion, the resurrection — truly and certainly done, never a phantom.',
       sv.verse_id, ev.verse_id, 'extras', 70306
  FROM _session253_igmag1_lookup sv, _session253_igmag1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=11
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-magnesians' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-magnesians-1-two-coinages-two-ways',
       E'Two coinages, two ways — life and death set before us',
       E'Ignatius sets the ancient choice of the Two Ways before the assembly: *“all things have an end, and these two—life and death—are set before us together, and each man shall go to his own place; for just as there are two coinages, the one of Elohim (God) and the other of the world, and each of them hath its proper stamp impressed upon it”* (Ignatius to the Magnesians 1:5). This is Moses'' covenant summons: *“See, I have set before thee this day life and good, and death and evil”* (Deuteronomy 30:15), *“I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live”* (Deuteronomy 30:19). The Messiah set the same two gates: *“Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction”* (Matthew 7:13), *“strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it”* (Matthew 7:14). And the faithful stamp is the one undivided love for which Ignatius prays — *“That they all may be one; as thou, Father, art in me, and I in thee”* (John 17:21).',
       sv.verse_id, ev.verse_id, 'extras', 70309
  FROM _session253_igmag1_lookup sv, _session253_igmag1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-magnesians' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-magnesians-1-the-law-is-not-abolished',
       E'The everlasting Torah stands — the Son of Adam is Lord of the sabbath',
       E'Here the reader must weigh carefully. Ignatius, pressing for the real Messiah against those who would Judaize *away* from Him, lets fall a line — *“no longer observing sabbaths but fashioning their lives after Yahuah''s (Lord''s) day”* (Ignatius to the Magnesians 1:9) — and a Passover figure, *“put away the vile leaven which hath waxed stale and sour, and betake yourselves to the new leaven, which is Yahusha HaMashiach”* (1:10). We do not build a thread that endorses setting aside the sabbath; that gloss runs contrary to the everlasting Torah, and the apparatus shows the canon underneath, never the error. For the Messiah Himself said, *“Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil”* (Matthew 5:17); *“Whosoever therefore shall break one of these least commandments, and shall teach men so, he shall be called the least in the kingdom of heaven”* (Matthew 5:19). He is no abolisher of the sabbath but its Lord: *“The sabbath was made for man, and not man for the sabbath”* (Mark 2:27), *“Therefore the Son of Adam is Yahuah (Lord) also of the sabbath”* (Mark 2:28). And the prophet sets the everlasting horizon — *“from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah”* (Isaiah 66:23). The leaven to purge is malice; the feast to keep abides: *“let us keep the feast... with the unleavened bread of sincerity and truth”* (1 Corinthians 5:8).',
       sv.verse_id, ev.verse_id, 'extras', 70312
  FROM _session253_igmag1_lookup sv, _session253_igmag1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-magnesians' AND ev.chapter_number=1 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ignatius-magnesians-1-prophets-lived-by-messiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* the one Elohim who spoke through the prophets is the same who manifested Himself through the Son, exactly Ignatius''s claim that the divine prophets lived after the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-prophets-lived-by-messiah'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 1:11 — *Searching what, or what manner of time the Spirit of Messiah (Christ) which was in them did signify, when it testified beforehand the sufferings of Messiah (Christ), and the glory that should follow.* Peter names the very grace by which Ignatius says the prophets were inspired — the Spirit of Messiah testifying in them beforehand.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-prophets-lived-by-messiah'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 24:27 — *And beginning at Moses and all the prophets, he expounded unto them in all the scriptures the things concerning himself.* The Messiah reading Himself out of Moses and the prophets is the ground of Ignatius''s word that the prophets were His disciples expecting Him.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-prophets-lived-by-messiah'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 5:46 — *For had ye believed Moses, ye would have believed me: for he wrote of me.* That Moses wrote of Him answers Ignatius''s point that the prophets, being His disciples, awaited Him as their teacher.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-prophets-lived-by-messiah'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-magnesians-1-one-elohim-through-the-son
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:18 — *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* The Son who declares the unseen Father is Ignatius''s one Elohim manifesting Himself through Yahusha His Son, the Word from silence.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-one-elohim-through-the-son'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 14:9 — *Yahusha (Jesus) saith unto him, Have I been so long time with you, and yet hast thou not known me, Philip? he that hath seen me hath seen the Father; and how sayest thou then, Shew us the Father?* To see the Son is to see the Father — the manifestation Ignatius means by the one Elohim revealed through the Son.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-one-elohim-through-the-son'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* the Son by whom all things were made is the One Ignatius says was with the Father before the worlds and appeared at the end of time.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-one-elohim-through-the-son'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 8:29 — *And he that sent me is with me: the Father hath not left me alone; for I do always those things that please him.* The Son always doing the Father''s pleasure is Ignatius''s Word who in all things was well-pleasing unto Him that sent Him.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-one-elohim-through-the-son'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-magnesians-1-real-birth-passion-resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:3 — *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh;* the real flesh of David''s seed is exactly the birth Ignatius says was truly and certainly done.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-real-birth-passion-resurrection'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 1:4 — *And declared to be the Son of Elohim (God) with power, according to the spirit of holiness, by the resurrection from the dead:* the resurrection that declares Him Son matches the resurrection Ignatius binds to the birth and passion under Pilate.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-real-birth-passion-resurrection'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Timothy 2:8 — *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel:* Paul''s “remember” of David''s seed raised is the same persuasion Ignatius urges concerning the birth, passion, and resurrection.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-real-birth-passion-resurrection'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-magnesians-1-two-coinages-two-ways
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Moses'' two set before Israel is the very pair Ignatius names — life and death set before us together.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-two-coinages-two-ways'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* the call to choose life answers Ignatius''s free choice between the two coinages of Elohim and of the world.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-two-coinages-two-ways'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* the Messiah''s two gates are Ignatius''s two ways, each man going to his own place.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-two-coinages-two-ways'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The narrow way unto life is the stamp of Elohim the Father which Ignatius bids the faithful bear.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-two-coinages-two-ways'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-magnesians-1-the-law-is-not-abolished
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 5:17 — *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil.* Against the anti-sabbath gloss of 1:9, the Messiah''s own word upholds the law and the prophets — the apparatus shows the canon underneath the error.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-the-law-is-not-abolished'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Mark 2:27 — *And he said unto them, The sabbath was made for man, and not man for the sabbath:* the sabbath is a gift made for man, not a thing to be discarded as 1:9 would have it.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-the-law-is-not-abolished'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=2 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Mark 2:28 — *Therefore the Son of Adam is Yahuah (Lord) also of the sabbath.* The Messiah is the sabbath''s Lord, not its abolisher — the truth that corrects the antinomian turn of 1:9.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-the-law-is-not-abolished'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=2 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 66:23 — *And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD).* The everlasting sabbath worship of all flesh refutes the notion of no longer observing sabbaths.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-the-law-is-not-abolished'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Corinthians 5:8 — *Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth.* Paul''s leaven figure purges malice while keeping the feast — the leaven of 1:10 is the leaven of wickedness, not the appointed times themselves.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-the-law-is-not-abolished'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

