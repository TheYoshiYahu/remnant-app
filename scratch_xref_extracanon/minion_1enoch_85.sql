-- ----- fragment: minion_1enoch_85.sql (session250 1-enoch 85) -----
-- Source anchor: enoch/1-enoch ch85. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en85 (view _session250_en85_lookup). Sort band base 52100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en85_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-85-white-bull-adam-formed
  ('enoch', '1-enoch', 85, 3, 'canon', 'genesis', 2, 7, 'free', E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* The white bull that "came forth from the earth" is Adam, formed of the dust of the ground.'),
  ('enoch', '1-enoch', 85, 3, 'canon', 'genesis', 5, 1, 'free', E'Genesis 5:1 — *This is the book of the generations of Adam. In the day that Elohim (God) created man, in the likeness of Elohim (God) made he him.* The white bull is Adam, the head of the generations whose seed-line Enoch is about to trace as a herd.'),
  ('enoch', '1-enoch', 85, 3, 'canon', 'genesis', 5, 3, 'free', E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth.* The white bulls that "resembled him" and begat white bulls "which resembled them" are the righteous line bearing Adam''s likeness.'),
  ('enoch', '1-enoch', 85, 3, 'jubilees', 'jubilees', 4, 1, 'extras', E'Jubilees 4:1 — *And in the third week in the second jubilee she gave birth to Cain, and in the fourth she gave birth to Abel, and in the fifth she gave birth to her daughter ’Âwân.* Jubilees names the same first births that Enoch shows as the heifer''s young bulls.'),
  -- thread: 1-enoch-85-black-bull-red-cain-abel-seed-war
  ('enoch', '1-enoch', 85, 4, 'canon', 'genesis', 4, 8, 'free', E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* The black bull goring the red bull "over the earth" until he is seen no more is Cain slaying Abel in the field.'),
  ('enoch', '1-enoch', 85, 3, 'canon', 'genesis', 4, 2, 'free', E'Genesis 4:2 — *And she again bare his brother Abel. And Abel was a keeper of sheep, but Cain was a tiller of the ground.* The two young bulls born with the heifer are Cain and Abel, the first brothers of the herd.'),
  ('enoch', '1-enoch', 85, 4, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* John reads the colours of the two bulls as the seed-war: the line of the wicked one against the righteous line.'),
  ('enoch', '1-enoch', 85, 4, 'canon', 'matthew', 13, 38, 'free', E'Matthew 13:38 — *The field is the world; the good seed are the children of the kingdom; but the tares are the children of the wicked one.* The black bull woven in among the white is the tares-among-the-wheat seed-war that began with Cain.'),
  ('enoch', '1-enoch', 85, 4, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Jude marks the apostate by the way of the black bull, the way of Cain.'),
  -- thread: 1-enoch-85-lament-abel-blood-witness
  ('enoch', '1-enoch', 85, 5, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother’s blood crieth unto me from the ground.* The cow seeking the red bull and finding him not is Abel gone, his blood crying from the ground.'),
  ('enoch', '1-enoch', 85, 5, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The red bull lamented and sought is the righteous Abel who, being dead, yet speaks.'),
  ('enoch', '1-enoch', 85, 5, 'canon', 'matthew', 23, 35, 'free', E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* Abel''s blood, the herd''s first lament, heads the whole tally of righteous blood spilled in the seed-war.'),
  ('enoch', '1-enoch', 85, 5, 'canon', 'hebrews', 12, 24, 'free', E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* The great lamentation over the red bull is answered at last by a better blood than Abel''s.'),
  -- thread: 1-enoch-85-seth-second-white-bull-restored-seed
  ('enoch', '1-enoch', 85, 7, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The second white bull the cow bears is Seth, the seed appointed in Abel''s place.'),
  ('enoch', '1-enoch', 85, 7, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The many white bulls proceeding from the second white bull are the righteous Sethite line that called on the name of Yahuah.'),
  ('enoch', '1-enoch', 85, 7, 'jubilees', 'jubilees', 4, 7, 'extras', E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said “Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him.”* Jubilees tells the comfort after the lament that Enoch shows as the cow quieted and bearing the second white bull.'),
  ('enoch', '1-enoch', 85, 8, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The white bulls proceeding one from another are the righteous line — Enoch among them — that runs from Seth toward the great white bull at the vision''s end.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en85_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en85_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-85-white-bull-adam-formed',
       E'The white bull come forth from the earth — Adam, the formed seed-line',
       E'The Animal Apocalypse opens with the whole history of the world cast as a herd, and the first figure is the white bull formed from the ground: *and behold a bull came forth from the earth, and that bull was white; and after it came forth a heifer* (1 Enoch 85:3). The white bull is Adam, the righteous seed-line; the heifer is Eve drawn from his side. This is the canon''s own forming: *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7) — the bull "came forth from the earth" because the man was formed of the dust. And the line carried the likeness forward: *This is the book of the generations of Adam. In the day that Elohim (God) created man, in the likeness of Elohim (God) made he him* (Genesis 5:1), *and begat a son in his own likeness, after his image; and called his name Seth* (Genesis 5:3) — exactly the white bulls of Enoch that *resembled him* and bred *many white bulls, which resembled them.* Jubilees reckons the same beginning in jubilee-weeks: *And in the third week in the second jubilee she gave birth to Cain, and in the fourth she gave birth to Abel* (Jubilees 4:1). The white is no accident of colour — it is the righteous Adamic line, the seed that will run, blinded and scattered and at last regathered, all the way to the great white bull at the end (the Messiah).',
       sv.verse_id, ev.verse_id, 'extras', 52100
  FROM _session250_en85_lookup sv, _session250_en85_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=85 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-85-black-bull-red-cain-abel-seed-war',
       E'The black bull gores the red — Cain and Abel, and the seed-war begins',
       E'Two young bulls come with the heifer, and at once the seed-war is drawn in their colours: *along with this (heifer) two young bulls, one of them black and the other red. And that black young bull gored the red one and pursued him over the earth, and thereupon I could no longer see that red young bull* (1 Enoch 85:3-4). The black bull is Cain, the red is Abel slain. The canon tells it plainly: *And Abel was a keeper of sheep, but Cain was a tiller of the ground* (Genesis 4:2), and *Cain rose up against Abel his brother, and slew him* (Genesis 4:8). John reads the very seed-war the colours signal: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous* (1 John 3:12) — the line of the wicked one against the righteous line, the tares sown among the wheat from the first field. Yahusha names that same sowing: *his enemy came and sowed tares among the wheat* (Matthew 13:25), *the good seed are the children of the kingdom; but the tares are the children of the wicked one* (Matthew 13:38). Jude marks the apostate by it: *Woe unto them! for they have gone in the way of Cain* (Jude 1:11). The black bull that "grew" and went on while the red was seen no more is the line of Cain woven in among the white — never the church, never a replacement, but the old seed-war Enoch saw before he ever fathered Methuselah.',
       sv.verse_id, ev.verse_id, 'extras', 52103
  FROM _session250_en85_lookup sv, _session250_en85_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=85 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-85-lament-abel-blood-witness',
       E'The cow seeks the red bull and laments — Abel''s blood that yet speaketh',
       E'When the red bull is gone, the first cow grieves for him: *And that cow, that first one, went from the presence of that first bull in order to seek that red one, but found him not, and lamented with a great lamentation over him and sought him* (1 Enoch 85:5). This is Eve''s mourning for Abel, and the canon hears the slain one still crying: *the voice of thy brother’s blood crieth unto me from the ground* (Genesis 4:10). Abel''s death is not erased — it stands as the first witness of the righteous line: *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh* (Hebrews 11:4). Yahusha counts that blood at the head of all the righteous blood the seed-war has spilled: *from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar* (Matthew 23:35). And the lament finds its answer in a better blood: the red bull''s cry is hushed only at the cross, *the blood of sprinkling, that speaketh better things than that of Abel* (Hebrews 12:24). The herd''s first grief is the canon''s standing testimony that the murdered righteous are not lost but kept.',
       sv.verse_id, ev.verse_id, 'extras', 52106
  FROM _session250_en85_lookup sv, _session250_en85_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=85 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-85-seth-second-white-bull-restored-seed',
       E'The second white bull — Seth, the seed appointed, the white line toward Messiah',
       E'The first bull quiets the grieving cow, and the seed-line is restored white: *And I looked till that first bull came to her and quieted her... And after that she bore another white bull... I saw in my sleep that white bull likewise grow and become a great white bull, and from Him proceeded many white bulls, and they resembled him* (1 Enoch 85:6-8). The second white bull is Seth, given in Abel''s place: *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew* (Genesis 4:25), and from him *began men to call upon the name of Yahuah (LORD)* (Genesis 4:26). Jubilees tells the same comfort after the mourning: *Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said “Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him”* (Jubilees 4:7). The white bulls that proceed and resemble Him are the righteous Sethite line — Enoch, Noah, the patriarchs — running unbroken toward the great white bull born at the end of the vision, the Formed Son, the Messiah, in whom the whole flock is at last made white again. The line that survives the seed-war is the same election that gathers the houses of Israel.',
       sv.verse_id, ev.verse_id, 'extras', 52109
  FROM _session250_en85_lookup sv, _session250_en85_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=85 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-85-white-bull-adam-formed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* The white bull that "came forth from the earth" is Adam, formed of the dust of the ground.'
  FROM cross_reference_threads t, cross_references x, _session250_en85_lookup sv, _session250_en85_lookup tv
 WHERE t.slug='1-enoch-85-white-bull-adam-formed'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:1 — *This is the book of the generations of Adam. In the day that Elohim (God) created man, in the likeness of Elohim (God) made he him.* The white bull is Adam, the head of the generations whose seed-line Enoch is about to trace as a herd.'
  FROM cross_reference_threads t, cross_references x, _session250_en85_lookup sv, _session250_en85_lookup tv
 WHERE t.slug='1-enoch-85-white-bull-adam-formed'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth.* The white bulls that "resembled him" and begat white bulls "which resembled them" are the righteous line bearing Adam''s likeness.'
  FROM cross_reference_threads t, cross_references x, _session250_en85_lookup sv, _session250_en85_lookup tv
 WHERE t.slug='1-enoch-85-white-bull-adam-formed'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:1 — *And in the third week in the second jubilee she gave birth to Cain, and in the fourth she gave birth to Abel, and in the fifth she gave birth to her daughter ’Âwân.* Jubilees names the same first births that Enoch shows as the heifer''s young bulls.'
  FROM cross_reference_threads t, cross_references x, _session250_en85_lookup sv, _session250_en85_lookup tv
 WHERE t.slug='1-enoch-85-white-bull-adam-formed'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-85-black-bull-red-cain-abel-seed-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* The black bull goring the red bull "over the earth" until he is seen no more is Cain slaying Abel in the field.'
  FROM cross_reference_threads t, cross_references x, _session250_en85_lookup sv, _session250_en85_lookup tv
 WHERE t.slug='1-enoch-85-black-bull-red-cain-abel-seed-war'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:2 — *And she again bare his brother Abel. And Abel was a keeper of sheep, but Cain was a tiller of the ground.* The two young bulls born with the heifer are Cain and Abel, the first brothers of the herd.'
  FROM cross_reference_threads t, cross_references x, _session250_en85_lookup sv, _session250_en85_lookup tv
 WHERE t.slug='1-enoch-85-black-bull-red-cain-abel-seed-war'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* John reads the colours of the two bulls as the seed-war: the line of the wicked one against the righteous line.'
  FROM cross_reference_threads t, cross_references x, _session250_en85_lookup sv, _session250_en85_lookup tv
 WHERE t.slug='1-enoch-85-black-bull-red-cain-abel-seed-war'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 13:38 — *The field is the world; the good seed are the children of the kingdom; but the tares are the children of the wicked one.* The black bull woven in among the white is the tares-among-the-wheat seed-war that began with Cain.'
  FROM cross_reference_threads t, cross_references x, _session250_en85_lookup sv, _session250_en85_lookup tv
 WHERE t.slug='1-enoch-85-black-bull-red-cain-abel-seed-war'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Jude marks the apostate by the way of the black bull, the way of Cain.'
  FROM cross_reference_threads t, cross_references x, _session250_en85_lookup sv, _session250_en85_lookup tv
 WHERE t.slug='1-enoch-85-black-bull-red-cain-abel-seed-war'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-85-lament-abel-blood-witness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother’s blood crieth unto me from the ground.* The cow seeking the red bull and finding him not is Abel gone, his blood crying from the ground.'
  FROM cross_reference_threads t, cross_references x, _session250_en85_lookup sv, _session250_en85_lookup tv
 WHERE t.slug='1-enoch-85-lament-abel-blood-witness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The red bull lamented and sought is the righteous Abel who, being dead, yet speaks.'
  FROM cross_reference_threads t, cross_references x, _session250_en85_lookup sv, _session250_en85_lookup tv
 WHERE t.slug='1-enoch-85-lament-abel-blood-witness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* Abel''s blood, the herd''s first lament, heads the whole tally of righteous blood spilled in the seed-war.'
  FROM cross_reference_threads t, cross_references x, _session250_en85_lookup sv, _session250_en85_lookup tv
 WHERE t.slug='1-enoch-85-lament-abel-blood-witness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* The great lamentation over the red bull is answered at last by a better blood than Abel''s.'
  FROM cross_reference_threads t, cross_references x, _session250_en85_lookup sv, _session250_en85_lookup tv
 WHERE t.slug='1-enoch-85-lament-abel-blood-witness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-85-seth-second-white-bull-restored-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The second white bull the cow bears is Seth, the seed appointed in Abel''s place.'
  FROM cross_reference_threads t, cross_references x, _session250_en85_lookup sv, _session250_en85_lookup tv
 WHERE t.slug='1-enoch-85-seth-second-white-bull-restored-seed'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The many white bulls proceeding from the second white bull are the righteous Sethite line that called on the name of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session250_en85_lookup sv, _session250_en85_lookup tv
 WHERE t.slug='1-enoch-85-seth-second-white-bull-restored-seed'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said “Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him.”* Jubilees tells the comfort after the lament that Enoch shows as the cow quieted and bearing the second white bull.'
  FROM cross_reference_threads t, cross_references x, _session250_en85_lookup sv, _session250_en85_lookup tv
 WHERE t.slug='1-enoch-85-seth-second-white-bull-restored-seed'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The white bulls proceeding one from another are the righteous line — Enoch among them — that runs from Seth toward the great white bull at the vision''s end.'
  FROM cross_reference_threads t, cross_references x, _session250_en85_lookup sv, _session250_en85_lookup tv
 WHERE t.slug='1-enoch-85-seth-second-white-bull-restored-seed'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=85 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

