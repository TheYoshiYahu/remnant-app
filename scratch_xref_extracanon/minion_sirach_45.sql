-- ----- fragment: minion_ecclesiasticus_45.sql (session253 ecclesiasticus 45) -----
-- Source anchor: apocrypha/ecclesiasticus ch45. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir45 (view _session253_sir45_lookup). Sort band base 59400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir45_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sirach-45-moses-beloved
  ('apocrypha', 'ecclesiasticus', 45, 1, 'canon', 'deuteronomy', 34, 10, 'free', E'Deuteronomy 34:10 — *And there arose not a prophet since in Yashar''el (Israel) like unto Moses, whom Yahuah (LORD) knew face to face,* — Sirach 45:1''s *beloved of Yahuah (God) and men, whose memorial is blessed* is the Torah''s own unmatched testimony of Moses.'),
  ('apocrypha', 'ecclesiasticus', 45, 1, 'canon', 'hebrews', 11, 23, 'free', E'Hebrews 11:23 — *By faith Moses, when he was born, was hid three months of his parents, because they saw he was a proper child; and they were not afraid of the king''s commandment.* — the cloud of witnesses opens Moses'' story where Sirach 45:1 opens its praise, with the merciful man Yahuah brought forth.'),
  ('apocrypha', 'ecclesiasticus', 45, 2, 'canon', 'hebrews', 11, 27, 'free', E'Hebrews 11:27 — *By faith he forsook Egypt, not fearing the wrath of the king: for he endured, as seeing him who is invisible.* — that Moses'' *enemies stood in fear of him* (Sirach 45:2) is the outward face of the faith that did not fear Pharaoh''s wrath.'),
  -- thread: sirach-45-law-of-life-face-to-face
  ('apocrypha', 'ecclesiasticus', 45, 5, 'canon', 'exodus', 33, 11, 'free', E'Exodus 33:11 — *And Yahuah (LORD) spake unto Moses face to face, as a man speaketh unto his friend. And he turned again into the camp: but his servant Joshua, the son of Nun, a young man, departed not out of the tabernacle.* — Sirach 45:5''s *gave him commandments before his face* is exactly this face-to-face speaking in the cloud.'),
  ('apocrypha', 'ecclesiasticus', 45, 5, 'canon', 'exodus', 34, 28, 'free', E'Exodus 34:28 — *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water. And he wrote upon the tables the words of the covenant, the ten commandments.* — the *law of life and knowledge* of Sirach 45:5 is the very covenant written in the dark cloud.'),
  ('apocrypha', 'ecclesiasticus', 45, 5, 'canon', 'john', 1, 17, 'free', E'John 1:17 — *For the law was given by Moses, but grace and truth came by Yahusha HaMashiach (Jesus Christ).* — the law that *might teach Jacob his covenants* (Sirach 45:5) is the same law John names as given by Moses.'),
  ('apocrypha', 'ecclesiasticus', 45, 5, 'jasher', 'jasher', 82, 6, 'extras', E'Jasher 82:6 — *And in the third month from the children of Israel''s departure from Egypt, on the sixth day of it, Yahuah (the Lord) gave to Israel the ten commandments on Mount Sinai.* — the restored chronicle dates the *commandments before his face* that Sirach 45:5 praises.'),
  -- thread: sirach-45-moses-wonders-chosen
  ('apocrypha', 'ecclesiasticus', 45, 3, 'jubilees', 'jubilees', 48, 4, 'extras', E'Jubilees 48:4 — *And I delivered you out of his hand, and you did perform the signs and wonders which you were sent to perform in Egypt against Pharaoh, and against all his house, and against his servants and his people.* — Sirach 45:3''s *by his words he caused the wonders to cease... in the sight of kings* is the same plague-witness before Pharaoh.'),
  ('apocrypha', 'ecclesiasticus', 45, 4, 'canon', 'hebrews', 11, 25, 'free', E'Hebrews 11:25 — *Choosing rather to suffer affliction with the people of Elohim (God), than to enjoy the pleasures of sin for a season;* — that Yahuah *chose him out of all men* in meekness (Sirach 45:4) is the man''s own choosing of the afflicted people over Pharaoh''s house.'),
  -- thread: sirach-45-aaron-priesthood
  ('apocrypha', 'ecclesiasticus', 45, 7, 'canon', 'exodus', 28, 2, 'free', E'Exodus 28:2 — *And thou shalt make holy garments for Aaron thy brother for glory and for beauty.* — the *comely ornaments* and *robe of glory* of Sirach 45:7 are the very holy garments commanded for Aaron''s glory and beauty.'),
  ('apocrypha', 'ecclesiasticus', 45, 6, 'canon', 'numbers', 18, 1, 'free', E'Numbers 18:1 — *And Yahuah (LORD) said unto Aaron, Thou and thy sons and thy father''s house with thee shall bear the iniquity of the sanctuary: and thou and thy sons with thee shall bear the iniquity of your priesthood.* — Aaron *of the tribe of Levi* (Sirach 45:6) is given the priesthood and its charge in this word.'),
  ('apocrypha', 'ecclesiasticus', 45, 7, 'canon', 'hebrews', 5, 4, 'free', E'Hebrews 5:4 — *And no man taketh this honour unto himself, but he that is called of Elohim (God), as was Aaron.* — the *everlasting covenant* of priesthood Yahuah *made with him* (Sirach 45:7) is the honour Hebrews says no man may seize but must be called to, as Aaron was.'),
  -- thread: sirach-45-aaron-garments-urim
  ('apocrypha', 'ecclesiasticus', 45, 9, 'canon', 'exodus', 28, 33, 'free', E'Exodus 28:33 — *And beneath upon the hem of it thou shalt make pomegranates of blue, and of purple, and of scarlet, round about the hem thereof; and bells of gold between them round about:* — Sirach 45:9''s *pomegranates, and... many golden bells round about* that sound in the temple are these very hem-bells of the robe.'),
  ('apocrypha', 'ecclesiasticus', 45, 10, 'canon', 'exodus', 28, 30, 'free', E'Exodus 28:30 — *And thou shalt put in the breastplate of judgment the Urim and the Thummim; and they shall be upon Aaron''s heart, when he goeth in before Yahuah (LORD): and Aaron shall bear the judgment of the children of Yashar''el (Israel) upon his heart before Yahuah (LORD) continually.* — the *breastplate of judgment, and with Urim and Thummim* of Sirach 45:10 is named piece for piece here.'),
  ('apocrypha', 'ecclesiasticus', 45, 12, 'canon', 'exodus', 28, 36, 'free', E'Exodus 28:36 — *And thou shalt make a plate of pure gold, and grave upon it, like the engravings of a signet, HOLINESS TO THE Yahuah (LORD).* — the *crown of gold upon the mitre, in which was engraved Holiness* (Sirach 45:12) is this engraved golden plate of the high priest.'),
  -- thread: sirach-45-aaron-portion-inheritance
  ('apocrypha', 'ecclesiasticus', 45, 20, 'canon', 'numbers', 18, 8, 'free', E'Numbers 18:8 — *And Yahuah (LORD) spake unto Aaron, Behold, I also have given thee the charge of mine heave offerings of all the hallowed things of the children of Yashar''el (Israel); unto thee have I given them by reason of the anointing, and to thy sons, by an ordinance for ever.* — Sirach 45:20''s *divided to him the firstfruits of the increase* is this ordinance of the heave offerings given to Aaron and his sons.'),
  ('apocrypha', 'ecclesiasticus', 45, 22, 'canon', 'numbers', 18, 1, 'free', E'Numbers 18:1 — *And Yahuah (LORD) said unto Aaron, Thou and thy sons and thy father''s house with thee shall bear the iniquity of the sanctuary: and thou and thy sons with thee shall bear the iniquity of your priesthood.* — that Aaron *had no inheritance... for Yahuah (God) himself is his portion* (Sirach 45:22) flows from this charge that set the priesthood, not the land, as Aaron''s lot.'),
  -- thread: sirach-45-phinehas-zeal-covenant
  ('apocrypha', 'ecclesiasticus', 45, 24, 'canon', 'numbers', 25, 13, 'free', E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* — Sirach 45:24''s *covenant of peace... the dignity of the priesthood for ever* is this very everlasting-priesthood grant for Phinehas''s zeal.'),
  ('apocrypha', 'ecclesiasticus', 45, 23, 'canon', 'psalms', 106, 31, 'free', E'Psalm 106:31 — *And that was counted unto him for righteousness unto all generations for evermore.* — that Phinehas *had zeal in the fear of Yahuah (God), and stood up with good courage* (Sirach 45:23) is the very act the Psalm reckons as righteousness for ever.'),
  ('apocrypha', 'ecclesiasticus', 45, 23, 'canon', 'malachi', 2, 5, 'free', E'Malachi 2:5 — *My covenant was with him of life and peace; and I gave them to him for the fear wherewith he feared me, and was afraid before my name.* — the *covenant of peace* of Sirach 45:24 is the covenant of Levi Malachi calls one *of life and peace*, given for the same fear of Yahuah.'),
  ('apocrypha', 'ecclesiasticus', 45, 23, 'jubilees', 'jubilees', 30, 18, 'extras', E'Jubilees 30:18 — *And the seed of Levi was chosen for the priesthood, and to be Levites, that they might minister before Yahuah (God), as we, continually, and that Levi and his sons may be blessed for ever; for he was zealous to execute righteousness and judgment and vengeance on all those who arose against Yashar''el (Israel).* — the restored record grounds Phinehas''s zeal of Sirach 45:23 in Levi''s whole house being chosen for zeal to execute judgment.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir45_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir45_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-45-moses-beloved',
       E'Moses, beloved of Yahuah, whose memorial is blessed',
       E'Ben Sira opens his praise of the fathers'' return to the deliverer: *And he brought out of him a merciful man, which found favour in the sight of all flesh, even Moses, beloved of Yahuah (God) and men, whose memorial is blessed* (Sirach 45:1). It ain''t new — the Torah''s own elegy says no prophet ever stood like him: *And there arose not a prophet since in Yashar''el (Israel) like unto Moses, whom Yahuah (LORD) knew face to face* (Deuteronomy 34:10). The writer to the Hebrews counts that same faith among the cloud of witnesses: *By faith Moses, when he was born, was hid three months of his parents, because they saw he was a proper child; and they were not afraid of the king''s commandment* (Hebrews 11:23). The fathers carry one witness.',
       sv.verse_id, ev.verse_id, 'extras', 59400
  FROM _session253_sir45_lookup sv, _session253_sir45_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=45 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-45-law-of-life-face-to-face',
       E'The dark cloud, his voice, the law of life and knowledge',
       E'Sirach gathers Sinai into one breath: *He made him to hear his voice, and brought him into the dark cloud, and gave him commandments before his face, even the law of life and knowledge, that he might teach Jacob his covenants, and Yashar''el (Israel) his judgments* (Sirach 45:5). The Torah records the very meeting *face to face*: *And Yahuah (LORD) spake unto Moses face to face, as a man speaketh unto his friend* (Exodus 33:11), and the forty days that wrote the covenant: *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water. And he wrote upon the tables the words of the covenant, the ten commandments* (Exodus 34:28). The restored Book of Jasher tells the same giving — *Yahuah (the Lord) gave to Israel the ten commandments on Mount Sinai* (Jasher 82:6) — and John names whence that law came: *For the law was given by Moses, but grace and truth came by Yahusha HaMashiach (Jesus Christ)* (John 1:17). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 59403
  FROM _session253_sir45_lookup sv, _session253_sir45_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=45 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-45-moses-wonders-chosen',
       E'By his words the wonders, the chosen and sanctified man',
       E'The praise turns to the signs in Egypt: *By his words he caused the wonders to cease, and he made him glorious in the sight of kings, and gave him a commandment for his people, and shewed him part of his glory* (Sirach 45:3), and *He sanctified him in his faithfuless and meekness, and chose him out of all men* (Sirach 45:4). The restored Book of Jubilees records the same sending with signs against Pharaoh: *And I delivered you out of his hand, and you did perform the signs and wonders which you were sent to perform in Egypt against Pharaoh, and against all his house, and against his servants and his people* (Jubilees 48:4). Hebrews seals the choosing — Moses preferred reproach with Yahuah''s people to Egypt''s treasures: *Choosing rather to suffer affliction with the people of Elohim (God), than to enjoy the pleasures of sin for a season* (Hebrews 11:25).',
       sv.verse_id, ev.verse_id, 'extras', 59406
  FROM _session253_sir45_lookup sv, _session253_sir45_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=45 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-45-aaron-priesthood',
       E'Aaron exalted, the everlasting covenant of the priesthood',
       E'Ben Sira lifts the second father: *He exalted Aaron, an holy man like to him, even his brother, of the tribe of Levi* (Sirach 45:6), and *An everlasting covenant he made with him and gave him the priesthood among the people; he beautified him with comely ornaments, and clothed him with a robe of glory* (Sirach 45:7). The Torah''s own commission is the source: *And thou shalt make holy garments for Aaron thy brother for glory and for beauty* (Exodus 28:2), and the charge given to Aaron''s house: *And Yahuah (LORD) said unto Aaron, Thou and thy sons and thy father''s house with thee shall bear the iniquity of the sanctuary: and thou and thy sons with thee shall bear the iniquity of your priesthood* (Numbers 18:1). Hebrews holds the same rule of calling: *And no man taketh this honour unto himself, but he that is called of Elohim (God), as was Aaron* (Hebrews 5:4).',
       sv.verse_id, ev.verse_id, 'extras', 59409
  FROM _session253_sir45_lookup sv, _session253_sir45_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=45 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-45-aaron-garments-urim',
       E'The holy garments: bells, breastplate, Urim and Thummim, the crown of gold',
       E'The vesture is told stone by stone: *And he compassed him with pomegranates, and with many golden bells round about, that as he went there might be a sound, and a noise made that might be heard in the temple, for a memorial to the children of his people* (Sirach 45:9); *With an holy garment, with gold, and blue silk, and purple, the work of the embroiderer, with a breastplate of judgment, and with Urim and Thummim* (Sirach 45:10); *He set a crown of gold upon the mitre, in which was engraved Holiness, an ornament of honour, a costly work, the desires of the eyes, goodly and beautiful* (Sirach 45:12). The Torah dictated every piece: *And beneath upon the hem of it thou shalt make pomegranates of blue, and of purple, and of scarlet, round about the hem thereof; and bells of gold between them round about* (Exodus 28:33); *And thou shalt put in the breastplate of judgment the Urim and the Thummim; and they shall be upon Aaron''s heart, when he goeth in before Yahuah (LORD)* (Exodus 28:30); and the engraved plate: *And thou shalt make a plate of pure gold, and grave upon it, like the engravings of a signet, HOLINESS TO THE Yahuah (LORD)* (Exodus 28:36). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 59412
  FROM _session253_sir45_lookup sv, _session253_sir45_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=45 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-45-aaron-portion-inheritance',
       E'No inheritance in the land: Yahuah himself is his portion',
       E'The praise closes Aaron''s section with the Levite''s strange wealth: *But he made Aaron more honourable, and gave him an heritage, and divided to him the firstfruits of the increase; especially he prepared bread in abundance* (Sirach 45:20), and *Howbeit in the land of the people he had no inheritance, neither had he any portion among the people: for Yahuah (God) himself is his portion and inheritance* (Sirach 45:22). The Torah set that very lot upon Aaron''s house: *And Yahuah (LORD) spake unto Aaron, Behold, I also have given thee the charge of mine heave offerings of all the hallowed things of the children of Yashar''el (Israel); unto thee have I given them by reason of the anointing, and to thy sons, by an ordinance for ever* (Numbers 18:8). The rebellion of Korah that Sirach 45:18-19 recalls is the dark frame: the strangers who *maligned him in the wilderness* were consumed, but Aaron''s portion stood.',
       sv.verse_id, ev.verse_id, 'extras', 59415
  FROM _session253_sir45_lookup sv, _session253_sir45_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=45 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-45-phinehas-zeal-covenant',
       E'Phinehas the third in glory: zeal and the everlasting priesthood',
       E'Ben Sira names the third father: *The third in glory is Phinees the son of Eleazar, because he had zeal in the fear of Yahuah (God), and stood up with good courage of heart: when the people were turned back, and made reconciliation for Yashar''el (Israel)* (Sirach 45:23), and *Therefore was there a covenant of peace made with him, that he should be the chief of the sanctuary and of his people, and that he and his posterity should have the dignity of the priesthood for ever* (Sirach 45:24). The Torah grants it word for word: *Wherefore say, Behold, I give unto him my covenant of peace: And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel)* (Numbers 25:12-13). The Psalm reckons it righteousness — *And that was counted unto him for righteousness unto all generations for evermore* (Psalm 106:31) — and Malachi names it the covenant of Levi: *My covenant was with him of life and peace; and I gave them to him for the fear wherewith he feared me, and was afraid before my name* (Malachi 2:5). The restored Book of Jubilees seals the same: Levi''s seed *was chosen for the priesthood... for he was zealous to execute righteousness and judgment* (Jubilees 30:18). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 59418
  FROM _session253_sir45_lookup sv, _session253_sir45_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=45 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: sirach-45-moses-beloved
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 34:10 — *And there arose not a prophet since in Yashar''el (Israel) like unto Moses, whom Yahuah (LORD) knew face to face,* — Sirach 45:1''s *beloved of Yahuah (God) and men, whose memorial is blessed* is the Torah''s own unmatched testimony of Moses.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-moses-beloved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=34 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:23 — *By faith Moses, when he was born, was hid three months of his parents, because they saw he was a proper child; and they were not afraid of the king''s commandment.* — the cloud of witnesses opens Moses'' story where Sirach 45:1 opens its praise, with the merciful man Yahuah brought forth.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-moses-beloved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:27 — *By faith he forsook Egypt, not fearing the wrath of the king: for he endured, as seeing him who is invisible.* — that Moses'' *enemies stood in fear of him* (Sirach 45:2) is the outward face of the faith that did not fear Pharaoh''s wrath.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-moses-beloved'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-45-law-of-life-face-to-face
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 33:11 — *And Yahuah (LORD) spake unto Moses face to face, as a man speaketh unto his friend. And he turned again into the camp: but his servant Joshua, the son of Nun, a young man, departed not out of the tabernacle.* — Sirach 45:5''s *gave him commandments before his face* is exactly this face-to-face speaking in the cloud.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-law-of-life-face-to-face'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=33 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 34:28 — *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water. And he wrote upon the tables the words of the covenant, the ten commandments.* — the *law of life and knowledge* of Sirach 45:5 is the very covenant written in the dark cloud.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-law-of-life-face-to-face'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 1:17 — *For the law was given by Moses, but grace and truth came by Yahusha HaMashiach (Jesus Christ).* — the law that *might teach Jacob his covenants* (Sirach 45:5) is the same law John names as given by Moses.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-law-of-life-face-to-face'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 82:6 — *And in the third month from the children of Israel''s departure from Egypt, on the sixth day of it, Yahuah (the Lord) gave to Israel the ten commandments on Mount Sinai.* — the restored chronicle dates the *commandments before his face* that Sirach 45:5 praises.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-law-of-life-face-to-face'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=5
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=82 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-45-moses-wonders-chosen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 48:4 — *And I delivered you out of his hand, and you did perform the signs and wonders which you were sent to perform in Egypt against Pharaoh, and against all his house, and against his servants and his people.* — Sirach 45:3''s *by his words he caused the wonders to cease... in the sight of kings* is the same plague-witness before Pharaoh.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-moses-wonders-chosen'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:25 — *Choosing rather to suffer affliction with the people of Elohim (God), than to enjoy the pleasures of sin for a season;* — that Yahuah *chose him out of all men* in meekness (Sirach 45:4) is the man''s own choosing of the afflicted people over Pharaoh''s house.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-moses-wonders-chosen'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-45-aaron-priesthood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 28:2 — *And thou shalt make holy garments for Aaron thy brother for glory and for beauty.* — the *comely ornaments* and *robe of glory* of Sirach 45:7 are the very holy garments commanded for Aaron''s glory and beauty.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-aaron-priesthood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 18:1 — *And Yahuah (LORD) said unto Aaron, Thou and thy sons and thy father''s house with thee shall bear the iniquity of the sanctuary: and thou and thy sons with thee shall bear the iniquity of your priesthood.* — Aaron *of the tribe of Levi* (Sirach 45:6) is given the priesthood and its charge in this word.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-aaron-priesthood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 5:4 — *And no man taketh this honour unto himself, but he that is called of Elohim (God), as was Aaron.* — the *everlasting covenant* of priesthood Yahuah *made with him* (Sirach 45:7) is the honour Hebrews says no man may seize but must be called to, as Aaron was.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-aaron-priesthood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-45-aaron-garments-urim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 28:33 — *And beneath upon the hem of it thou shalt make pomegranates of blue, and of purple, and of scarlet, round about the hem thereof; and bells of gold between them round about:* — Sirach 45:9''s *pomegranates, and... many golden bells round about* that sound in the temple are these very hem-bells of the robe.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-aaron-garments-urim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 28:30 — *And thou shalt put in the breastplate of judgment the Urim and the Thummim; and they shall be upon Aaron''s heart, when he goeth in before Yahuah (LORD): and Aaron shall bear the judgment of the children of Yashar''el (Israel) upon his heart before Yahuah (LORD) continually.* — the *breastplate of judgment, and with Urim and Thummim* of Sirach 45:10 is named piece for piece here.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-aaron-garments-urim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 28:36 — *And thou shalt make a plate of pure gold, and grave upon it, like the engravings of a signet, HOLINESS TO THE Yahuah (LORD).* — the *crown of gold upon the mitre, in which was engraved Holiness* (Sirach 45:12) is this engraved golden plate of the high priest.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-aaron-garments-urim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-45-aaron-portion-inheritance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 18:8 — *And Yahuah (LORD) spake unto Aaron, Behold, I also have given thee the charge of mine heave offerings of all the hallowed things of the children of Yashar''el (Israel); unto thee have I given them by reason of the anointing, and to thy sons, by an ordinance for ever.* — Sirach 45:20''s *divided to him the firstfruits of the increase* is this ordinance of the heave offerings given to Aaron and his sons.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-aaron-portion-inheritance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 18:1 — *And Yahuah (LORD) said unto Aaron, Thou and thy sons and thy father''s house with thee shall bear the iniquity of the sanctuary: and thou and thy sons with thee shall bear the iniquity of your priesthood.* — that Aaron *had no inheritance... for Yahuah (God) himself is his portion* (Sirach 45:22) flows from this charge that set the priesthood, not the land, as Aaron''s lot.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-aaron-portion-inheritance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-45-phinehas-zeal-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* — Sirach 45:24''s *covenant of peace... the dignity of the priesthood for ever* is this very everlasting-priesthood grant for Phinehas''s zeal.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-phinehas-zeal-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 106:31 — *And that was counted unto him for righteousness unto all generations for evermore.* — that Phinehas *had zeal in the fear of Yahuah (God), and stood up with good courage* (Sirach 45:23) is the very act the Psalm reckons as righteousness for ever.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-phinehas-zeal-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 2:5 — *My covenant was with him of life and peace; and I gave them to him for the fear wherewith he feared me, and was afraid before my name.* — the *covenant of peace* of Sirach 45:24 is the covenant of Levi Malachi calls one *of life and peace*, given for the same fear of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-phinehas-zeal-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 30:18 — *And the seed of Levi was chosen for the priesthood, and to be Levites, that they might minister before Yahuah (God), as we, continually, and that Levi and his sons may be blessed for ever; for he was zealous to execute righteousness and judgment and vengeance on all those who arose against Yashar''el (Israel).* — the restored record grounds Phinehas''s zeal of Sirach 45:23 in Levi''s whole house being chosen for zeal to execute judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_sir45_lookup sv, _session253_sir45_lookup tv
 WHERE t.slug='sirach-45-phinehas-zeal-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=45 AND sv.verse_number=23
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=30 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

