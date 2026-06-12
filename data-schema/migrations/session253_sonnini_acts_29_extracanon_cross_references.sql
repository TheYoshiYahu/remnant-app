-- =====================================================================
-- Session 253 — Sonnini Acts 29 FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session253_sonnini_acts_29_extracanon_cross_references.sql
-- =====================================================================

\echo 'session253 — Sonnini Acts 29 cross-references starting...'
BEGIN;

-- ----- fragment: minion_sonniniacts29_29.sql (session253 sonnini-acts-29 29) -----
-- Source anchor: sonnini-acts-29/sonnini-acts-29 ch29. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: son29 (view _session253_son29_lookup). Sort band base 68500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_son29_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sonnini-acts-29-29-into-spain
  ('sonnini-acts-29', 'sonnini-acts-29', 29, 1, 'canon', 'romans', 15, 24, 'free', E'Romans 15:24 — *Whensoever I take my journey into Spain, I will come to you: for I trust to see you in my journey, and to be brought on my way thitherward by you, if first I be somewhat filled with your company.* Paul''s own stated purpose toward Spain is exactly the journey Acts 29:1 takes up.'),
  ('sonnini-acts-29', 'sonnini-acts-29', 29, 1, 'canon', 'romans', 15, 28, 'free', E'Romans 15:28 — *When therefore I have performed this, and have sealed to them this fruit, I will come by you into Spain.* The apostle twice names Spain as his goal, the westward aim Acts 29:1 echoes.'),
  ('sonnini-acts-29', 'sonnini-acts-29', 29, 1, 'canon', 'romans', 15, 20, 'free', E'Romans 15:20 — *Yea, so have I strived to preach the gospel, not where Messiah (Christ) was named, lest I should build upon another man''s foundation:* Paul''s drive to virgin ground frames why Acts 29:1 sends him beyond Rome to the far west.'),
  ('sonnini-acts-29', 'sonnini-acts-29', 29, 1, 'canon', 'acts', 1, 8, 'free', E'Acts 1:8 — *But ye shall receive power, after that the Ruach HaKodesh (Holy Spirit) is come upon you: and ye shall be witnesses unto me both in Jerusalem, and in all Judæa, and in Samaria, and unto the uttermost part of the earth.* The commission to the uttermost part of the earth is the reach Acts 29:1 carries toward Spain and Britain.'),
  -- thread: sonnini-acts-29-29-lost-sheep-isles
  ('sonnini-acts-29', 'sonnini-acts-29', 29, 2, 'canon', 'isaiah', 49, 1, 'free', E'Isaiah 49:1 — *Listen, O isles, unto me; and hearken, ye people, from far; Yahuah (LORD) hath called me from the womb; from the bowels of my mother hath he made mention of my name.* The prophet''s address to the isles afar off is the very word Acts 29:2 invokes for the escaped of Israel.'),
  ('sonnini-acts-29', 'sonnini-acts-29', 29, 2, 'canon', 'isaiah', 11, 11, 'free', E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The second-time regathering from the islands of the sea matches Acts 29:2''s children of Israel fled by sea since the Assyrian captivity.'),
  ('sonnini-acts-29', 'sonnini-acts-29', 29, 3, 'canon', 'matthew', 10, 6, 'free', E'Matthew 10:6 — *But go rather to the lost sheep of the house of Yashar''el (Israel).* The Master''s own commission gives Acts 29:3 its exact phrase: the gospel to the lost sheep of the House of Israel.'),
  ('sonnini-acts-29', 'sonnini-acts-29', 29, 3, 'canon', 'matthew', 15, 24, 'free', E'Matthew 15:24 — *But he answered and said, I am not sent but unto the lost sheep of the house of Yashar''el (Israel).* The Lord names the same flock Acts 29:3 says Yahuah commanded sought out.'),
  ('sonnini-acts-29', 'sonnini-acts-29', 29, 3, 'canon', 'james', 1, 1, 'free', E'James 1:1 — *James, a servant of Elohim (God) and of the Lord Yahusha HaMashiach (Lord Jesus Christ), to the twelve tribes which are scattered abroad, greeting.* The scattered twelve tribes are precisely the dispersed of Israel Acts 29:3 sends the gospel after.'),
  -- thread: sonnini-acts-29-29-other-sheep-one-fold
  ('sonnini-acts-29', 'sonnini-acts-29', 29, 6, 'canon', 'john', 10, 16, 'free', E'John 10:16 — *And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* The Shepherd''s other sheep, brought into one fold, frame Paul''s preaching in Spain in Acts 29:6.'),
  ('sonnini-acts-29', 'sonnini-acts-29', 29, 4, 'canon', 'acts', 9, 15, 'free', E'Acts 9:15 — *But Yahuah (Lord) said unto him, Go thy way: for he is a chosen vessel unto me, to bear my name before the Gentiles, and kings, and the children of Yashar''el (Israel):* The Lord''s choice of Paul to bear his name before Gentiles, kings, and Israel is the testifying boldness Acts 29:4 shows before the tribunes.'),
  ('sonnini-acts-29', 'sonnini-acts-29', 29, 6, 'canon', 'romans', 15, 16, 'free', E'Romans 15:16 — *That I should be the minister of Yahusha HaMashiach (Jesus Christ) to the Gentiles, ministering the gospel of Elohim (God), that the offering up of the Gentiles might be acceptable, being sanctified by the Ruach HaKodesh (Holy Spirit).* Paul''s appointed ministry to the Gentiles is the apostleship the Spaniards perceive in Acts 29:6.'),
  -- thread: sonnini-acts-29-29-isles-wait-his-law
  ('sonnini-acts-29', 'sonnini-acts-29', 29, 12, 'canon', 'isaiah', 42, 4, 'free', E'Isaiah 42:4 — *He shall not fail nor be discouraged, till he have set judgment in the earth: and the isles shall wait for his law.* The isles waiting for his law undergird Acts 29:12''s king whose sword heals the nations.'),
  ('sonnini-acts-29', 'sonnini-acts-29', 29, 11, 'canon', '1-thessalonians', 1, 9, 'free', E'1 Thessalonians 1:9 — *For they themselves shew of us what manner of entering in we had unto you, and how ye turned to Elohim (God) from idols to serve the living and true Elohim (God);* The Gentiles turning from idols to the living Elohim is the fruit of the new gospel-tidings Acts 29:11 foretells.'),
  ('sonnini-acts-29', 'sonnini-acts-29', 29, 12, 'canon', 'matthew', 24, 6, 'free', E'Matthew 24:6 — *And ye shall hear of wars and rumours of wars: see that ye be not troubled: for all these things must come to pass, but the end is not yet.* The Master''s own wars and rumours of wars are echoed verbatim in Acts 29:12''s latter-day word.'),
  ('sonnini-acts-29', 'sonnini-acts-29', 29, 11, 'canon', 'matthew', 24, 14, 'free', E'Matthew 24:14 — *And this gospel of the kingdom shall be preached in all the world for a witness unto all nations; and then shall the end come.* The gospel issuing forth and reaching all nations is the witness Acts 29:11 sets in the latter days.'),
  -- thread: sonnini-acts-29-29-pilate-washed-hands
  ('sonnini-acts-29', 'sonnini-acts-29', 29, 22, 'canon', 'matthew', 27, 24, 'free', E'Matthew 27:24 — *When Pilate saw that he could prevail nothing, but that rather a tumult was made, he took water, and washed his hands before the multitude, saying, I am innocent of the blood of this just person: see ye to it.* Pilate''s washing of his hands before the multitude is the gospel detail Acts 29:22 builds its sign upon.'),
  ('sonnini-acts-29', 'sonnini-acts-29', 29, 20, 'canon', 'matthew', 27, 4, 'free', E'Matthew 27:4 — *Saying, I have sinned in that I have betrayed the innocent blood. And they said, What is that to us? see thou to that.* The innocent blood Judas confesses is the same blood-shedding Acts 29:20 says Pilate answered for.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_son29_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_son29_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sonnini-acts-29-29-into-spain',
       E'Paul into Spain — the regions beyond',
       E'*And Paul, full of the blessings of Messiah (Christ), and abounding in the spirit, departed out of Rome, determining to go into Spain, for he had a long time purposed to journey thitherward, and was minded also to go from thence into Britain.* The Sonnini text takes up the very intention Paul names in his own letter — though the journey westward is disputed history, the *purpose* toward Spain is plainly his. *Whensoever I take my journey into Spain, I will come to you: for I trust to see you in my journey, and to be brought on my way thitherward by you, if first I be somewhat filled with your company.* (Romans 15:24) And again, sealing the contribution first: *When therefore I have performed this, and have sealed to them this fruit, I will come by you into Spain.* (Romans 15:28) It is the apostle''s settled aim to preach where Messiah was not named — *Yea, so have I strived to preach the gospel, not where Messiah (Christ) was named, lest I should build upon another man''s foundation* (Romans 15:20) — the same reach the Lord set from the first: *But ye shall receive power, after that the Ruach HaKodesh (Holy Spirit) is come upon you: and ye shall be witnesses unto me both in Jerusalem, and in all Judæa, and in Samaria, and unto the uttermost part of the earth.* (Acts 1:8)',
       sv.verse_id, ev.verse_id, 'extras', 68500
  FROM _session253_son29_lookup sv, _session253_son29_lookup ev
 WHERE sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=1
   AND ev.edition_slug='sonnini-acts-29' AND ev.book_slug='sonnini-acts-29' AND ev.chapter_number=29 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sonnini-acts-29-29-lost-sheep-isles',
       E'The lost sheep of Israel in the isles afar off',
       E'*For he had heard in Phoenicia that certain of the children of Yashar''el (Israel), about the time of the Assyrian captivity, had escaped by sea to "the isles afar off," as spoken by the prophet, and called by the Romans, Britain. And Yahuah (Lord) commanded the gospel to be preached far hence to the Gentiles, and to the lost sheep of the House of Yashar''el (Israel).* The text reaches for a genuine prophetic refrain — Israel scattered among the isles, to be sought out. *Listen, O isles, unto me; and hearken, ye people, from far; Yahuah (LORD) hath called me from the womb; from the bowels of my mother hath he made mention of my name.* (Isaiah 49:1) The Master sent the twelve on the same errand: *But go rather to the lost sheep of the house of Yashar''el (Israel).* (Matthew 10:6) — *I am not sent but unto the lost sheep of the house of Yashar''el (Israel).* (Matthew 15:24) The second-time regathering names the very islands: *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people... and from the islands of the sea.* (Isaiah 11:11) And James writes to them where they are: *James, a servant of Elohim (God) and of the Lord Yahusha HaMashiach (Lord Jesus Christ), to the twelve tribes which are scattered abroad, greeting.* (James 1:1) This is not a church replacing Israel but the dispersed seed sought out.',
       sv.verse_id, ev.verse_id, 'extras', 68503
  FROM _session253_son29_lookup sv, _session253_son29_lookup ev
 WHERE sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=2
   AND ev.edition_slug='sonnini-acts-29' AND ev.book_slug='sonnini-acts-29' AND ev.chapter_number=29 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sonnini-acts-29-29-other-sheep-one-fold',
       E'Other sheep, one fold, one shepherd',
       E'*And no man hindered Paul; for he testified boldly of Yahusha (Jesus) before the tribunes and among the people... And Paul preached mightily in Spain, and great multitudes believed and were converted, for they perceived he was an apostle sent from Elohim (God).* The chosen vessel goes where the flock is scattered. *And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* (John 10:16) The Lord had marked Paul out for this very reach: *But Yahuah (Lord) said unto him, Go thy way: for he is a chosen vessel unto me, to bear my name before the Gentiles, and kings, and the children of Yashar''el (Israel):* (Acts 9:15) — Gentiles, kings, and the children of Israel, the threefold company Acts 29 sends him to.',
       sv.verse_id, ev.verse_id, 'extras', 68506
  FROM _session253_son29_lookup sv, _session253_son29_lookup ev
 WHERE sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=4
   AND ev.edition_slug='sonnini-acts-29' AND ev.book_slug='sonnini-acts-29' AND ev.chapter_number=29 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sonnini-acts-29-29-isles-wait-his-law',
       E'The isles shall wait for his law — idols turned from',
       E'*And in the latter days new tidings of the Gospel shall issue forth out of Jerusalem, and the hearts of the people shall rejoice... In those days there shall be wars and rumours of wars; and a king shall rise up, and his sword shall be for the healing of the nations, and his peacemaking shall abide, and the glory of his kingdom a wonder among princes.* The prophesied turning of the far nations rests on a true word: *He shall not fail nor be discouraged, till he have set judgment in the earth: and the isles shall wait for his law.* (Isaiah 42:4) The fruit of such preaching is the nations forsaking their idols: *For they themselves shew of us what manner of entering in we had unto you, and how ye turned to Elohim (God) from idols to serve the living and true Elohim (God);* (1 Thessalonians 1:9) And the wars-and-rumours and the gospel sounded to all nations are the Master''s own latter-day signs: *And ye shall hear of wars and rumours of wars: see that ye be not troubled: for all these things must come to pass, but the end is not yet.* (Matthew 24:6) — *And this gospel of the kingdom shall be preached in all the world for a witness unto all nations; and then shall the end come.* (Matthew 24:14)',
       sv.verse_id, ev.verse_id, 'extras', 68509
  FROM _session253_son29_lookup sv, _session253_son29_lookup ev
 WHERE sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=11
   AND ev.edition_slug='sonnini-acts-29' AND ev.book_slug='sonnini-acts-29' AND ev.chapter_number=29 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sonnini-acts-29-29-pilate-washed-hands',
       E'Pilate who washed his hands',
       E'*And Paul stretched forth his hands upon the water and prayed unto Yahuah (Lord), saying, O Yahuah Elohim (LORD God), give a sign unto all nations that here Pontius Pilate, which condemned thine only-begotten Son, plunged down headlong into the pit... And a voice came out of heaven saying, Even Pilate hath escaped the wrath to come, for he washed his hands before the multitude at the blood-shedding of Yahuah (Lord) Yahusha (Jesus).* The Sonnini legend hangs upon a true gospel detail — Pilate''s hand-washing. *When Pilate saw that he could prevail nothing, but that rather a tumult was made, he took water, and washed his hands before the multitude, saying, I am innocent of the blood of this just person: see ye to it.* (Matthew 27:24) Judas too, who saw him condemned, owned the innocent blood: *Saying, I have sinned in that I have betrayed the innocent blood. And they said, What is that to us? see thou to that.* (Matthew 27:4) — the very blood Acts 29:22 names.',
       sv.verse_id, ev.verse_id, 'extras', 68512
  FROM _session253_son29_lookup sv, _session253_son29_lookup ev
 WHERE sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=20
   AND ev.edition_slug='sonnini-acts-29' AND ev.book_slug='sonnini-acts-29' AND ev.chapter_number=29 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: sonnini-acts-29-29-into-spain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 15:24 — *Whensoever I take my journey into Spain, I will come to you: for I trust to see you in my journey, and to be brought on my way thitherward by you, if first I be somewhat filled with your company.* Paul''s own stated purpose toward Spain is exactly the journey Acts 29:1 takes up.'
  FROM cross_reference_threads t, cross_references x, _session253_son29_lookup sv, _session253_son29_lookup tv
 WHERE t.slug='sonnini-acts-29-29-into-spain'
   AND sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=15 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 15:28 — *When therefore I have performed this, and have sealed to them this fruit, I will come by you into Spain.* The apostle twice names Spain as his goal, the westward aim Acts 29:1 echoes.'
  FROM cross_reference_threads t, cross_references x, _session253_son29_lookup sv, _session253_son29_lookup tv
 WHERE t.slug='sonnini-acts-29-29-into-spain'
   AND sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=15 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 15:20 — *Yea, so have I strived to preach the gospel, not where Messiah (Christ) was named, lest I should build upon another man''s foundation:* Paul''s drive to virgin ground frames why Acts 29:1 sends him beyond Rome to the far west.'
  FROM cross_reference_threads t, cross_references x, _session253_son29_lookup sv, _session253_son29_lookup tv
 WHERE t.slug='sonnini-acts-29-29-into-spain'
   AND sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=15 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 1:8 — *But ye shall receive power, after that the Ruach HaKodesh (Holy Spirit) is come upon you: and ye shall be witnesses unto me both in Jerusalem, and in all Judæa, and in Samaria, and unto the uttermost part of the earth.* The commission to the uttermost part of the earth is the reach Acts 29:1 carries toward Spain and Britain.'
  FROM cross_reference_threads t, cross_references x, _session253_son29_lookup sv, _session253_son29_lookup tv
 WHERE t.slug='sonnini-acts-29-29-into-spain'
   AND sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sonnini-acts-29-29-lost-sheep-isles
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:1 — *Listen, O isles, unto me; and hearken, ye people, from far; Yahuah (LORD) hath called me from the womb; from the bowels of my mother hath he made mention of my name.* The prophet''s address to the isles afar off is the very word Acts 29:2 invokes for the escaped of Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_son29_lookup sv, _session253_son29_lookup tv
 WHERE t.slug='sonnini-acts-29-29-lost-sheep-isles'
   AND sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The second-time regathering from the islands of the sea matches Acts 29:2''s children of Israel fled by sea since the Assyrian captivity.'
  FROM cross_reference_threads t, cross_references x, _session253_son29_lookup sv, _session253_son29_lookup tv
 WHERE t.slug='sonnini-acts-29-29-lost-sheep-isles'
   AND sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 10:6 — *But go rather to the lost sheep of the house of Yashar''el (Israel).* The Master''s own commission gives Acts 29:3 its exact phrase: the gospel to the lost sheep of the House of Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_son29_lookup sv, _session253_son29_lookup tv
 WHERE t.slug='sonnini-acts-29-29-lost-sheep-isles'
   AND sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 15:24 — *But he answered and said, I am not sent but unto the lost sheep of the house of Yashar''el (Israel).* The Lord names the same flock Acts 29:3 says Yahuah commanded sought out.'
  FROM cross_reference_threads t, cross_references x, _session253_son29_lookup sv, _session253_son29_lookup tv
 WHERE t.slug='sonnini-acts-29-29-lost-sheep-isles'
   AND sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=15 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'James 1:1 — *James, a servant of Elohim (God) and of the Lord Yahusha HaMashiach (Lord Jesus Christ), to the twelve tribes which are scattered abroad, greeting.* The scattered twelve tribes are precisely the dispersed of Israel Acts 29:3 sends the gospel after.'
  FROM cross_reference_threads t, cross_references x, _session253_son29_lookup sv, _session253_son29_lookup tv
 WHERE t.slug='sonnini-acts-29-29-lost-sheep-isles'
   AND sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sonnini-acts-29-29-other-sheep-one-fold
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 10:16 — *And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* The Shepherd''s other sheep, brought into one fold, frame Paul''s preaching in Spain in Acts 29:6.'
  FROM cross_reference_threads t, cross_references x, _session253_son29_lookup sv, _session253_son29_lookup tv
 WHERE t.slug='sonnini-acts-29-29-other-sheep-one-fold'
   AND sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 9:15 — *But Yahuah (Lord) said unto him, Go thy way: for he is a chosen vessel unto me, to bear my name before the Gentiles, and kings, and the children of Yashar''el (Israel):* The Lord''s choice of Paul to bear his name before Gentiles, kings, and Israel is the testifying boldness Acts 29:4 shows before the tribunes.'
  FROM cross_reference_threads t, cross_references x, _session253_son29_lookup sv, _session253_son29_lookup tv
 WHERE t.slug='sonnini-acts-29-29-other-sheep-one-fold'
   AND sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=9 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 15:16 — *That I should be the minister of Yahusha HaMashiach (Jesus Christ) to the Gentiles, ministering the gospel of Elohim (God), that the offering up of the Gentiles might be acceptable, being sanctified by the Ruach HaKodesh (Holy Spirit).* Paul''s appointed ministry to the Gentiles is the apostleship the Spaniards perceive in Acts 29:6.'
  FROM cross_reference_threads t, cross_references x, _session253_son29_lookup sv, _session253_son29_lookup tv
 WHERE t.slug='sonnini-acts-29-29-other-sheep-one-fold'
   AND sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=15 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sonnini-acts-29-29-isles-wait-his-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 42:4 — *He shall not fail nor be discouraged, till he have set judgment in the earth: and the isles shall wait for his law.* The isles waiting for his law undergird Acts 29:12''s king whose sword heals the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_son29_lookup sv, _session253_son29_lookup tv
 WHERE t.slug='sonnini-acts-29-29-isles-wait-his-law'
   AND sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Thessalonians 1:9 — *For they themselves shew of us what manner of entering in we had unto you, and how ye turned to Elohim (God) from idols to serve the living and true Elohim (God);* The Gentiles turning from idols to the living Elohim is the fruit of the new gospel-tidings Acts 29:11 foretells.'
  FROM cross_reference_threads t, cross_references x, _session253_son29_lookup sv, _session253_son29_lookup tv
 WHERE t.slug='sonnini-acts-29-29-isles-wait-his-law'
   AND sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:6 — *And ye shall hear of wars and rumours of wars: see that ye be not troubled: for all these things must come to pass, but the end is not yet.* The Master''s own wars and rumours of wars are echoed verbatim in Acts 29:12''s latter-day word.'
  FROM cross_reference_threads t, cross_references x, _session253_son29_lookup sv, _session253_son29_lookup tv
 WHERE t.slug='sonnini-acts-29-29-isles-wait-his-law'
   AND sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 24:14 — *And this gospel of the kingdom shall be preached in all the world for a witness unto all nations; and then shall the end come.* The gospel issuing forth and reaching all nations is the witness Acts 29:11 sets in the latter days.'
  FROM cross_reference_threads t, cross_references x, _session253_son29_lookup sv, _session253_son29_lookup tv
 WHERE t.slug='sonnini-acts-29-29-isles-wait-his-law'
   AND sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sonnini-acts-29-29-pilate-washed-hands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 27:24 — *When Pilate saw that he could prevail nothing, but that rather a tumult was made, he took water, and washed his hands before the multitude, saying, I am innocent of the blood of this just person: see ye to it.* Pilate''s washing of his hands before the multitude is the gospel detail Acts 29:22 builds its sign upon.'
  FROM cross_reference_threads t, cross_references x, _session253_son29_lookup sv, _session253_son29_lookup tv
 WHERE t.slug='sonnini-acts-29-29-pilate-washed-hands'
   AND sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 27:4 — *Saying, I have sinned in that I have betrayed the innocent blood. And they said, What is that to us? see thou to that.* The innocent blood Judas confesses is the same blood-shedding Acts 29:20 says Pilate answered for.'
  FROM cross_reference_threads t, cross_references x, _session253_son29_lookup sv, _session253_son29_lookup tv
 WHERE t.slug='sonnini-acts-29-29-pilate-washed-hands'
   AND sv.edition_slug='sonnini-acts-29' AND sv.book_slug='sonnini-acts-29' AND sv.chapter_number=29 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session253 — Sonnini Acts 29 cross-references complete.'
