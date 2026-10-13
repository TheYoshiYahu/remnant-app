-- session417: 3 Maccabees full-library cross-references (Brenton text rebuild)
BEGIN;
-- ----- fragment: minion_3maccabees_01.sql (session417 3-maccabees 1) -----
-- Source anchor: apocrypha-charles-vol1/3-maccabees ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3m01 (view _session417_3m01_lookup). Sort band base 95000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session417_3m01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-maccabees-1-stranger-cometh-nigh
  ('apocrypha-charles-vol1', '3-maccabees', 1, 11, 'canon', 'numbers', 18, 7, 'free', E'Numbers 18:7 — *Therefore thou and thy sons with thee shall keep your priest’s office for every thing of the altar, and within the vail; and ye shall serve: I have given your priest’s office unto you as a service of gift: and the stranger that cometh nigh shall be put to death.* The one-in-a-year, high-priest-only access Ptolemy is told of is the Torah''s standing penalty against any stranger pressing within the vail.'),
  ('apocrypha-charles-vol1', '3-maccabees', 1, 11, 'canon', 'numbers', 18, 3, 'free', E'Numbers 18:3 — *And they shall keep thy charge, and the charge of all the tabernacle: only they shall not come nigh the vessels of the sanctuary and the altar, that neither they, nor ye also, die.* If even the ministering Levites die for nearing the holy vessels, a Greek king has no claim at all.'),
  ('apocrypha-charles-vol1', '3-maccabees', 1, 12, 'canon', 'numbers', 18, 4, 'free', E'Numbers 18:4 — *And they shall be joined unto thee, and keep the charge of the tabernacle of the congregation, for all the service of the tabernacle: and a stranger shall not come nigh unto you.* When they read the law to Ptolemy (3 Macc 1:12), this is the word that barred him — the stranger comes not nigh.'),
  -- thread: 3-maccabees-1-no-stranger-enters-sanctuary
  ('apocrypha-charles-vol1', '3-maccabees', 1, 15, 'canon', 'ezekiel', 44, 9, 'free', E'Ezekiel 44:9 — *Thus saith Adonai Yahuah (the Lord GOD); No stranger, uncircumcised in heart, nor uncircumcised in flesh, shall enter into my sanctuary, of any stranger that is among the children of Yashar''el (Israel).* Ptolemy''s demand to enter with or without consent runs straight into Yahuah''s flat refusal of any stranger within the sanctuary.'),
  ('apocrypha-charles-vol1', '3-maccabees', 1, 13, 'canon', 'ezekiel', 44, 7, 'free', E'Ezekiel 44:7 — *In that ye have brought into my sanctuary strangers, uncircumcised in heart, and uncircumcised in flesh, to be in my sanctuary, to pollute it, even my house, when ye offer my bread, the fat and the blood, and they have broken my covenant because of all your abominations.* The king reasons from the open doors of heathen temples, but admitting the uncircumcised stranger is named here as the very pollution of Yahuah''s house.'),
  -- thread: 3-maccabees-1-uzziah-usurps-priestly-act
  ('apocrypha-charles-vol1', '3-maccabees', 1, 25, 'canon', '2-chronicles', 26, 16, 'free', E'2 Chronicles 26:16 — *But when he was strong, his heart was lifted up to his destruction: for he transgressed against Yahuah Elohav (the LORD his God), and went into the temple of Yahuah (LORD) to burn incense upon the altar of incense.* Uzziah''s lifted-up heart is the pattern of Ptolemy''s haughty, hardened design to force the sanctuary.'),
  ('apocrypha-charles-vol1', '3-maccabees', 1, 12, 'canon', '2-chronicles', 26, 18, 'free', E'2 Chronicles 26:18 — *And they withstood Uzziah the king, and said unto him, It appertaineth not unto thee, Uzziah, to burn incense unto Yahuah (LORD), but to the priests the sons of Aaron, that are consecrated to burn incense: go out of the sanctuary; for thou hast trespassed; neither shall it be for thine honour from Yahuah Elohim (the LORD God).* As Azariah''s priests withstood Uzziah, so the priests read the law and forbid Ptolemy the inner room.'),
  ('apocrypha-charles-vol1', '3-maccabees', 1, 26, 'canon', '2-chronicles', 26, 19, 'free', E'2 Chronicles 26:19 — *Then Uzziah was wroth, and had a censer in his hand to burn incense: and while he was wroth with the priests, the leprosy even rose up in his forehead before the priests in the house of Yahuah (LORD), from beside the incense altar.* The presuming king is answered by Yahuah Himself, not by men — the fate the hardened Ptolemy is courting.'),
  ('apocrypha-charles-vol1', '3-maccabees', 1, 26, 'canon', '2-chronicles', 26, 21, 'free', E'2 Chronicles 26:21 — *And Uzziah the king was a leper unto the day of his death, and dwelt in a several house, being a leper; for he was cut off from the house of Yahuah (LORD): and Jotham his son was over the king’s house, judging the people of the land.* He who would usurp the house is shut out of it forever — the just end of the trespass Ptolemy is set upon.'),
  -- thread: 3-maccabees-1-priests-prostrate-call-for-help
  ('apocrypha-charles-vol1', '3-maccabees', 1, 16, 'apocrypha', '2-maccabees', 3, 15, 'extras', E'2 Maccabees 3:15 — *But the priests, prostrating themselves before the altar in their priests’ vestments, called to heaven upon him that made a law concerning things given to be kept, that they should safely be preserved for such as had committed them to be kept.* The priests prostrate in their vestments and crying to heaven is the same response that met Heliodorus'' assault on the temple.'),
  ('apocrypha-charles-vol1', '3-maccabees', 1, 18, 'apocrypha', '2-maccabees', 3, 19, 'extras', E'2 Maccabees 3:19 — *And the women, girt with sackcloth under their breasts, abounded in the streets, and the virgins that were kept in ran, some to the gates, and some to the walls, and others looked out of the windows.* The virgins and mothers pouring into the streets in 3 Macc 1:18 mirror the very uproar of the city when Heliodorus came.'),
  ('apocrypha-charles-vol1', '3-maccabees', 1, 16, 'apocrypha', '2-maccabees', 3, 39, 'extras', E'2 Maccabees 3:39 — *For he that dwells in heaven has his eye on that place, and defendeth it; and he beateth and destroys them that come to hurt it.* The Greatest Elohim the priests implore to come and help is the same Defender who beat back every man that came to hurt His house — deliverance as the Father''s mercy, not reward.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session417_3m01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session417_3m01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-1-stranger-cometh-nigh',
       E'The stranger that cometh nigh — only the high priest enters',
       E'When Ptolemy, dazzled by the temple, *conceived the purpose of entering the sanctuary itself* (3 Maccabees 1:10), they told him *that this was not permissible, none of the nation, no, nor even the priests in general, but only the supreme high priest of all, and he only once in a year, being allowed to go in* (3 Maccabees 1:11). It ain''t new: the bar he met was the bar Yahuah set at Sinai. *Therefore thou and thy sons with thee shall keep your priest''s office for every thing of the altar, and within the vail; and ye shall serve: I have given your priest''s office unto you as a service of gift: and the stranger that cometh nigh shall be put to death.* (Numbers 18:7). Even the Levites were warned, *only they shall not come nigh the vessels of the sanctuary and the altar, that neither they, nor ye also, die.* (Numbers 18:3); *and a stranger shall not come nigh unto you.* (Numbers 18:4). The Holy of Holies is no spectacle for a curious king — it is guarded ground, the Formed-Son''s house, kept by Torah and not by a man''s consent.',
       sv.verse_id, ev.verse_id, 'extras', 95000
  FROM _session417_3m01_lookup sv, _session417_3m01_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=1 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-1-no-stranger-enters-sanctuary',
       E'No stranger, uncircumcised in heart, shall enter my sanctuary',
       E'Ptolemy boasted, *Why, when he entered all temples, none of the priests who were present forbad him?* and pressed, *shall I not enter with or without your consent?* (3 Maccabees 1:13, 15). The pagan shrines let any man walk in; the house of Yahuah does not. It ain''t new — Yahuah''s word through Ezekiel set the wall long before any Ptolemy: *Thus saith Adonai Yahuah (the Lord GOD); No stranger, uncircumcised in heart, nor uncircumcised in flesh, shall enter into my sanctuary, of any stranger that is among the children of Yashar''el (Israel).* (Ezekiel 44:9). The offence was named already: *In that ye have brought into my sanctuary strangers, uncircumcised in heart, and uncircumcised in flesh, to be in my sanctuary, to pollute it* (Ezekiel 44:7). What pollutes is not the man''s nation but the heart uncircumcised to the covenant — the very thing the Formed-Son''s house is kept clean of.',
       sv.verse_id, ev.verse_id, 'extras', 95003
  FROM _session417_3m01_lookup sv, _session417_3m01_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=1 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=1 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-1-uzziah-usurps-priestly-act',
       E'Uzziah usurps the priest''s office and is struck',
       E'Ptolemy *persisted in obtruding himself, exclaiming, that he ought to be allowed* (3 Maccabees 1:12), *in his hardened mood, insensible to all persuasion* (3 Maccabees 1:26), while the elders strove to *divert his haughty mind* (3 Maccabees 1:25). It ain''t new — Yashar''el had already watched a king''s heart lifted up to seize what belongs to the priesthood alone. *But when he was strong, his heart was lifted up to his destruction: for he transgressed against Yahuah Elohav (the LORD his God), and went into the temple of Yahuah (LORD) to burn incense upon the altar of incense.* (2 Chronicles 26:16). The priests withstood him as they now withstand Ptolemy: *It appertaineth not unto thee, Uzziah, to burn incense unto Yahuah (LORD), but to the priests the sons of Aaron... go out of the sanctuary; for thou hast trespassed* (2 Chronicles 26:18). And the answer came from heaven, not from men: *while he was wroth with the priests, the leprosy even rose up in his forehead* (2 Chronicles 26:19), *for he was cut off from the house of Yahuah (LORD)* (2 Chronicles 26:21). The same hardened presumption stands at the door in 3 Maccabees, awaiting the same hand.',
       sv.verse_id, ev.verse_id, 'extras', 95006
  FROM _session417_3m01_lookup sv, _session417_3m01_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=1 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=1 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-1-priests-prostrate-call-for-help',
       E'The priests fall down and cry to the Greatest Elohim',
       E'*And when the priests fell down in their sacred vestments imploring the Greatest Elohim (God) to come and help in time of need, and to avert the violence of the fierce aggressor, and when they filled the temple with lamentations and tears* (3 Maccabees 1:16), the whole city ran to the *El Elyon (Most High) temple* in dread (3 Maccabees 1:20). It ain''t new — this is the very scene Yahuah''s house has played before. When Heliodorus came to plunder it, *the priests, prostrating themselves before the altar in their priests'' vestments, called to heaven upon him that made a law concerning things given to be kept* (2 Maccabees 3:15), and the women *abounded in the streets, and the virgins that were kept in ran, some to the gates, and some to the walls* (2 Maccabees 3:19). The deliverance there came not as reward but as the Father''s own defence of His place: *For he that dwells in heaven has his eye on that place, and defendeth it; and he beateth and destroys them that come to hurt it.* (2 Maccabees 3:39). The same eye watches over Jerusalem now, and the same mercy is implored.',
       sv.verse_id, ev.verse_id, 'extras', 95009
  FROM _session417_3m01_lookup sv, _session417_3m01_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=1 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=1 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-maccabees-1-stranger-cometh-nigh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 18:7 — *Therefore thou and thy sons with thee shall keep your priest’s office for every thing of the altar, and within the vail; and ye shall serve: I have given your priest’s office unto you as a service of gift: and the stranger that cometh nigh shall be put to death.* The one-in-a-year, high-priest-only access Ptolemy is told of is the Torah''s standing penalty against any stranger pressing within the vail.'
  FROM cross_reference_threads t, cross_references x, _session417_3m01_lookup sv, _session417_3m01_lookup tv
 WHERE t.slug='3-maccabees-1-stranger-cometh-nigh'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 18:3 — *And they shall keep thy charge, and the charge of all the tabernacle: only they shall not come nigh the vessels of the sanctuary and the altar, that neither they, nor ye also, die.* If even the ministering Levites die for nearing the holy vessels, a Greek king has no claim at all.'
  FROM cross_reference_threads t, cross_references x, _session417_3m01_lookup sv, _session417_3m01_lookup tv
 WHERE t.slug='3-maccabees-1-stranger-cometh-nigh'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 18:4 — *And they shall be joined unto thee, and keep the charge of the tabernacle of the congregation, for all the service of the tabernacle: and a stranger shall not come nigh unto you.* When they read the law to Ptolemy (3 Macc 1:12), this is the word that barred him — the stranger comes not nigh.'
  FROM cross_reference_threads t, cross_references x, _session417_3m01_lookup sv, _session417_3m01_lookup tv
 WHERE t.slug='3-maccabees-1-stranger-cometh-nigh'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-1-no-stranger-enters-sanctuary
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 44:9 — *Thus saith Adonai Yahuah (the Lord GOD); No stranger, uncircumcised in heart, nor uncircumcised in flesh, shall enter into my sanctuary, of any stranger that is among the children of Yashar''el (Israel).* Ptolemy''s demand to enter with or without consent runs straight into Yahuah''s flat refusal of any stranger within the sanctuary.'
  FROM cross_reference_threads t, cross_references x, _session417_3m01_lookup sv, _session417_3m01_lookup tv
 WHERE t.slug='3-maccabees-1-no-stranger-enters-sanctuary'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 44:7 — *In that ye have brought into my sanctuary strangers, uncircumcised in heart, and uncircumcised in flesh, to be in my sanctuary, to pollute it, even my house, when ye offer my bread, the fat and the blood, and they have broken my covenant because of all your abominations.* The king reasons from the open doors of heathen temples, but admitting the uncircumcised stranger is named here as the very pollution of Yahuah''s house.'
  FROM cross_reference_threads t, cross_references x, _session417_3m01_lookup sv, _session417_3m01_lookup tv
 WHERE t.slug='3-maccabees-1-no-stranger-enters-sanctuary'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=44 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-1-uzziah-usurps-priestly-act
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 26:16 — *But when he was strong, his heart was lifted up to his destruction: for he transgressed against Yahuah Elohav (the LORD his God), and went into the temple of Yahuah (LORD) to burn incense upon the altar of incense.* Uzziah''s lifted-up heart is the pattern of Ptolemy''s haughty, hardened design to force the sanctuary.'
  FROM cross_reference_threads t, cross_references x, _session417_3m01_lookup sv, _session417_3m01_lookup tv
 WHERE t.slug='3-maccabees-1-uzziah-usurps-priestly-act'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=26 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 26:18 — *And they withstood Uzziah the king, and said unto him, It appertaineth not unto thee, Uzziah, to burn incense unto Yahuah (LORD), but to the priests the sons of Aaron, that are consecrated to burn incense: go out of the sanctuary; for thou hast trespassed; neither shall it be for thine honour from Yahuah Elohim (the LORD God).* As Azariah''s priests withstood Uzziah, so the priests read the law and forbid Ptolemy the inner room.'
  FROM cross_reference_threads t, cross_references x, _session417_3m01_lookup sv, _session417_3m01_lookup tv
 WHERE t.slug='3-maccabees-1-uzziah-usurps-priestly-act'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=26 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Chronicles 26:19 — *Then Uzziah was wroth, and had a censer in his hand to burn incense: and while he was wroth with the priests, the leprosy even rose up in his forehead before the priests in the house of Yahuah (LORD), from beside the incense altar.* The presuming king is answered by Yahuah Himself, not by men — the fate the hardened Ptolemy is courting.'
  FROM cross_reference_threads t, cross_references x, _session417_3m01_lookup sv, _session417_3m01_lookup tv
 WHERE t.slug='3-maccabees-1-uzziah-usurps-priestly-act'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=1 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Chronicles 26:21 — *And Uzziah the king was a leper unto the day of his death, and dwelt in a several house, being a leper; for he was cut off from the house of Yahuah (LORD): and Jotham his son was over the king’s house, judging the people of the land.* He who would usurp the house is shut out of it forever — the just end of the trespass Ptolemy is set upon.'
  FROM cross_reference_threads t, cross_references x, _session417_3m01_lookup sv, _session417_3m01_lookup tv
 WHERE t.slug='3-maccabees-1-uzziah-usurps-priestly-act'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=1 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=26 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-1-priests-prostrate-call-for-help
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Maccabees 3:15 — *But the priests, prostrating themselves before the altar in their priests’ vestments, called to heaven upon him that made a law concerning things given to be kept, that they should safely be preserved for such as had committed them to be kept.* The priests prostrate in their vestments and crying to heaven is the same response that met Heliodorus'' assault on the temple.'
  FROM cross_reference_threads t, cross_references x, _session417_3m01_lookup sv, _session417_3m01_lookup tv
 WHERE t.slug='3-maccabees-1-priests-prostrate-call-for-help'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 3:19 — *And the women, girt with sackcloth under their breasts, abounded in the streets, and the virgins that were kept in ran, some to the gates, and some to the walls, and others looked out of the windows.* The virgins and mothers pouring into the streets in 3 Macc 1:18 mirror the very uproar of the city when Heliodorus came.'
  FROM cross_reference_threads t, cross_references x, _session417_3m01_lookup sv, _session417_3m01_lookup tv
 WHERE t.slug='3-maccabees-1-priests-prostrate-call-for-help'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 3:39 — *For he that dwells in heaven has his eye on that place, and defendeth it; and he beateth and destroys them that come to hurt it.* The Greatest Elohim the priests implore to come and help is the same Defender who beat back every man that came to hurt His house — deliverance as the Father''s mercy, not reward.'
  FROM cross_reference_threads t, cross_references x, _session417_3m01_lookup sv, _session417_3m01_lookup tv
 WHERE t.slug='3-maccabees-1-priests-prostrate-call-for-help'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=3 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


-- ----- fragment: minion_3maccabees_02.sql (session417 3-maccabees 2) -----
-- Source anchor: apocrypha-charles-vol1/3-maccabees ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3m02 (view _session417_3m02_lookup). Sort band base 95025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session417_3m02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-maccabees-2-king-of-heavens-creator-of-all
  ('apocrypha-charles-vol1', '3-maccabees', 2, 2, 'canon', 'nehemiah', 9, 6, 'free', E'Nehemiah 9:6 — *Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee.* The same confession Simon makes — the one Creator-Father, King of the heavens, before whom the oppressor''s strength is nothing.'),
  ('apocrypha-charles-vol1', '3-maccabees', 2, 3, 'canon', 'daniel', 4, 37, 'free', E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The righteous Governor who judges all who act with pride and insolence — the very lesson the humbled king learned.'),
  -- thread: 3-maccabees-2-he-judged-the-proud-of-old
  ('apocrypha-charles-vol1', '3-maccabees', 2, 6, 'canon', 'nehemiah', 9, 10, 'free', E'Nehemiah 9:10 — *And shewedst signs and wonders upon Pharaoh, and on all his servants, and on all the people of his land: for thou knewest that they dealt proudly against them. So didst thou get thee a name, as it is this day.* The same bold Pharaoh, the enslaver who dealt proudly, brought low by the Father''s hand.'),
  ('apocrypha-charles-vol1', '3-maccabees', 2, 7, 'canon', 'nehemiah', 9, 11, 'free', E'Nehemiah 9:11 — *And thou didst divide the sea before them, so that they went through the midst of the sea on the dry land; and their persecutors thou threwest into the deeps, as a stone into the mighty waters.* Simon''s rolling of the depths over the pursuer with his chariots, and the safe passage for those who trust — the same deliverance, the same Deliverer.'),
  -- thread: 3-maccabees-2-this-house-of-prayer
  ('apocrypha-charles-vol1', '3-maccabees', 2, 10, 'canon', 'nehemiah', 9, 3, 'free', E'Nehemiah 9:3 — *And they stood up in their place, and read in the book of the law of Yahuah (LORD) their Elohim (God) one fourth part of the day; and another fourth part they confessed, and worshipped Yahuah (LORD) their Elohim (God).* Simon''s plea is the same covenant posture — sin confessed at the holy place, the Father faithful to hear.'),
  ('apocrypha-charles-vol1', '3-maccabees', 2, 19, 'canon', 'daniel', 4, 34, 'free', E'Daniel 4:34 — *And at the end of the days I Nebuchadnezzar lifted up mine eyes unto heaven, and mine understanding returned unto me, and I blessed the El Elyon (most High), and I praised and honoured him that liveth for ever, whose dominion is an everlasting dominion, and his kingdom is from generation to generation.* The Most High who blots out iniquity and restores — the One whose mercy Simon implores.'),
  -- thread: 3-maccabees-2-hezekiahs-prayer-against-the-blasphemer
  ('apocrypha-charles-vol1', '3-maccabees', 2, 17, 'canon', '2-kings', 19, 15, 'free', E'2 Kings 19:15 — *And Hezekiah prayed before Yahuah (LORD), and said, O Yahuah Elohim (LORD God) of Yashar''el (Israel), which dwellest between the cherubims, thou art the Elohim (God), even thou alone, of all the kingdoms of the earth; thou hast made heaven and earth.* Simon prays as Hezekiah prayed — appealing to the sole Creator against the lawless boaster who would trample the holy house.'),
  ('apocrypha-charles-vol1', '3-maccabees', 2, 18, 'canon', '2-kings', 19, 19, 'free', E'2 Kings 19:19 — *Now therefore, O Yahuah (LORD) our Elohim (God), I beseech thee, save thou us out of his hand, that all the kingdoms of the earth may know that thou art Yahuah Elohim (the LORD God), even thou only.* The deliverance Simon seeks is for the Father''s Name — that none may boast he trampled his house like an idol''s.'),
  ('apocrypha-charles-vol1', '3-maccabees', 2, 15, 'canon', 'isaiah', 37, 16, 'free', E'Isaiah 37:16 — *O Yahuah Tseva''ot (LORD of hosts), Elohim (God) of Yashar''el (Israel), that dwellest between the cherubims, thou art the Elohim (God), even thou alone, of all the kingdoms of the earth: thou hast made heaven and earth.* The unapproachable dwelling-place, the heaven of heavens — the same Father whose throne is above the cherubim, against whom no king may presume.'),
  -- thread: 3-maccabees-2-the-proud-king-scourged-and-struck-down
  ('apocrypha-charles-vol1', '3-maccabees', 2, 21, 'apocrypha', '2-maccabees', 3, 26, 'extras', E'2 Maccabees 3:26 — *Moreover two other young men appeared before him, notable in strength, excellent in beauty, and comely in apparel, who stood by him on either side; and scourged him continually, and gave him many sore stripes.* The same scourging of a proud intruder at the holy place — Heliodorus then, Ptolemy now.'),
  ('apocrypha-charles-vol1', '3-maccabees', 2, 22, 'apocrypha', '2-maccabees', 3, 29, 'extras', E'2 Maccabees 3:29 — *For he by the hand of Yahuah (God) was cast down, and lay speechless without all hope of life.* Cast down powerless and deprived of speech — the identical righteous judgment that paralyzed Ptolemy and silenced his boast.'),
  ('apocrypha-charles-vol1', '3-maccabees', 2, 22, 'canon', 'daniel', 4, 37, 'free', E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The King of heaven who abases the proud — the same hand that shook Ptolemy to and fro like a reed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session417_3m02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session417_3m02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-2-king-of-heavens-creator-of-all',
       E'King of the heavens, Creator of all',
       E'Simon the high priest bows over against the holy place and lifts his prayer: *O Yahuah (Lord), Yahuah (Lord), King of the heavens, and Ruler of the whole creation, Holy among the holy, sole Governor, Almighty, give ear to us who are oppressed by a wicked and profane one, who exulteth in his confidence and strength* (3 Maccabees 2:2); *It is thou, the Creator of all, Yahuah (Lord) of the universe, who art a righteous Governor, and judgest all who act with pride and insolence* (3 Maccabees 2:3). It ain''t new — this is the very ground on which the Levites taught Yashar''el to bless the Father: *Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee* (Nehemiah 9:6). Simon does not plead a rival power; he pleads the one Creator-Father who alone made the heaven of heavens, the same One Nebuchadnezzar at last confessed: *those that walk in pride he is able to abase* (Daniel 4:37). The proud king''s strength is nothing before the Maker of all the host.',
       sv.verse_id, ev.verse_id, 'extras', 95025
  FROM _session417_3m02_lookup sv, _session417_3m02_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-2-he-judged-the-proud-of-old',
       E'He judged the proud of old — giants, Sodom, Pharaoh',
       E'Simon rehearses the Father''s old judgments on those who trusted their own might: *It was thou who didst destroy the former workers of unrighteousness, among whom were the giants, who trusted in their strength and hardihood, by covering them with a measureless flood* (3 Maccabees 2:4); *It was thou who didst make the Sodomites... an example to after generations, when thou didst consume them with fire and brimstone* (3 Maccabees 2:5); *Thou didst make known thy power when thou causedst the bold Pharaoh, the enslaver of thy people, to pass through the ordeal of many and diverse inflictions* (3 Maccabees 2:6); *And thou rolledst the depths of the sea over him, when he made pursuit with chariots... and gavest a safe passage to those who put their trust in thee* (3 Maccabees 2:7). It ain''t new — Yashar''el''s confession names the same Pharaoh and the same sea: *And shewedst signs and wonders upon Pharaoh, and on all his servants... for thou knewest that they dealt proudly against them* (Nehemiah 9:10); *And thou didst divide the sea before them, so that they went through the midst of the sea on the dry land; and their persecutors thou threwest into the deeps, as a stone into the mighty waters* (Nehemiah 9:11). The Father who drowned the proud enslaver is the same who now hears Simon against a new proud king.',
       sv.verse_id, ev.verse_id, 'extras', 95028
  FROM _session417_3m02_lookup sv, _session417_3m02_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-2-this-house-of-prayer',
       E'If we come to this house and pray, thou wilt hear',
       E'Simon pleads the covenant promise tied to the sanctuary: *And thou didst promise, out of love to the house of Yashar''el (Israel), that should we fall away from thee, and become afflicted, and then come to this house and pray, thou wouldest hear our prayer* (3 Maccabees 2:10); *Verily thou art faithful and true* (3 Maccabees 2:11). His confession is not merit but covenant — *see now, holy King, how through our many and great sins we are borne down* (3 Maccabees 2:13) — and he asks mercy: *Blot out our iniquities, and do away with our errors, and shew forth thy compassion in this hour* (3 Maccabees 2:19). It ain''t new: this is the very posture of the great confession at the wall, where Yashar''el stood and *read in the book of the law of Yahuah (LORD) their Elohim (God)... and another fourth part they confessed, and worshipped Yahuah (LORD) their Elohim (God)* (Nehemiah 9:3). Deliverance here is the Father''s MERCY toward a covenant people who turn and pray — not a prosperity reward for the strong.',
       sv.verse_id, ev.verse_id, 'extras', 95031
  FROM _session417_3m02_lookup sv, _session417_3m02_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=2 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-2-hezekiahs-prayer-against-the-blasphemer',
       E'Hear the boast of the lawless one — Hezekiah''s prayer',
       E'Simon names the danger that the proud king will defile the holy place and boast: *Punish us not by means of the uncleanness of their men... lest the lawless ones should boast in their rage, and exult in exuberant pride of speech, and say, We have trampled upon the holy house, as idolatrous houses are trampled upon* (3 Maccabees 2:17-18). The dwelling is the Father''s alone: *Thy dwelling-place, the heaven of heavens, is indeed unapproachable to men* (3 Maccabees 2:15). It ain''t new — this is Hezekiah''s prayer against Sennacherib, word for word in posture: *And Hezekiah prayed before Yahuah (LORD), and said, O Yahuah Elohim (LORD God) of Yashar''el (Israel), which dwellest between the cherubims, thou art the Elohim (God), even thou alone, of all the kingdoms of the earth; thou hast made heaven and earth* (2 Kings 19:15); *Now therefore, O Yahuah (LORD) our Elohim (God), I beseech thee, save thou us out of his hand, that all the kingdoms of the earth may know that thou art Yahuah Elohim (the LORD God), even thou only* (2 Kings 19:19). Isaiah records the same plea: *O Yahuah Tseva''ot (LORD of hosts), Elohim (God) of Yashar''el (Israel), that dwellest between the cherubims, thou art the Elohim (God), even thou alone... thou hast made heaven and earth* (Isaiah 37:16). The Father vindicates his Name against every blasphemer who would trample his house.',
       sv.verse_id, ev.verse_id, 'extras', 95034
  FROM _session417_3m02_lookup sv, _session417_3m02_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=2 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=2 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-2-the-proud-king-scourged-and-struck-down',
       E'The proud king scourged, paralyzed, struck speechless',
       E'At the prayer, the Father answers swiftly: *At that time Elohim (God), who seeth all things, who is beyond all Holy among the holy, heard that prayer, so suitable; and scourged the man greatly uplifted with scorn and insolence* (3 Maccabees 2:21); *Shaking him to and fro as a reed is shaken with the wind, he cast him upon the pavement, powerless, with limbs paralyzed; by a righteous judgment deprived of the faculty of speech* (3 Maccabees 2:22). It ain''t new — this is the same manifestation that felled Heliodorus when he presumed against the treasury: *Moreover two other young men appeared before him, notable in strength, excellent in beauty, and comely in apparel, who stood by him on either side; and scourged him continually, and gave him many sore stripes* (2 Maccabees 3:26); *For he by the hand of Yahuah (God) was cast down, and lay speechless without all hope of life* (2 Maccabees 3:29). And it is the same lesson Nebuchadnezzar learned in his own body — that the King of heaven *is able to abase* those that walk in pride: *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase* (Daniel 4:37). The proud are scourged and struck speechless; the Father defends his place.',
       sv.verse_id, ev.verse_id, 'extras', 95037
  FROM _session417_3m02_lookup sv, _session417_3m02_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=2 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=2 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-maccabees-2-king-of-heavens-creator-of-all
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Nehemiah 9:6 — *Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee.* The same confession Simon makes — the one Creator-Father, King of the heavens, before whom the oppressor''s strength is nothing.'
  FROM cross_reference_threads t, cross_references x, _session417_3m02_lookup sv, _session417_3m02_lookup tv
 WHERE t.slug='3-maccabees-2-king-of-heavens-creator-of-all'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The righteous Governor who judges all who act with pride and insolence — the very lesson the humbled king learned.'
  FROM cross_reference_threads t, cross_references x, _session417_3m02_lookup sv, _session417_3m02_lookup tv
 WHERE t.slug='3-maccabees-2-king-of-heavens-creator-of-all'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-2-he-judged-the-proud-of-old
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Nehemiah 9:10 — *And shewedst signs and wonders upon Pharaoh, and on all his servants, and on all the people of his land: for thou knewest that they dealt proudly against them. So didst thou get thee a name, as it is this day.* The same bold Pharaoh, the enslaver who dealt proudly, brought low by the Father''s hand.'
  FROM cross_reference_threads t, cross_references x, _session417_3m02_lookup sv, _session417_3m02_lookup tv
 WHERE t.slug='3-maccabees-2-he-judged-the-proud-of-old'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 9:11 — *And thou didst divide the sea before them, so that they went through the midst of the sea on the dry land; and their persecutors thou threwest into the deeps, as a stone into the mighty waters.* Simon''s rolling of the depths over the pursuer with his chariots, and the safe passage for those who trust — the same deliverance, the same Deliverer.'
  FROM cross_reference_threads t, cross_references x, _session417_3m02_lookup sv, _session417_3m02_lookup tv
 WHERE t.slug='3-maccabees-2-he-judged-the-proud-of-old'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-2-this-house-of-prayer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Nehemiah 9:3 — *And they stood up in their place, and read in the book of the law of Yahuah (LORD) their Elohim (God) one fourth part of the day; and another fourth part they confessed, and worshipped Yahuah (LORD) their Elohim (God).* Simon''s plea is the same covenant posture — sin confessed at the holy place, the Father faithful to hear.'
  FROM cross_reference_threads t, cross_references x, _session417_3m02_lookup sv, _session417_3m02_lookup tv
 WHERE t.slug='3-maccabees-2-this-house-of-prayer'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 4:34 — *And at the end of the days I Nebuchadnezzar lifted up mine eyes unto heaven, and mine understanding returned unto me, and I blessed the El Elyon (most High), and I praised and honoured him that liveth for ever, whose dominion is an everlasting dominion, and his kingdom is from generation to generation.* The Most High who blots out iniquity and restores — the One whose mercy Simon implores.'
  FROM cross_reference_threads t, cross_references x, _session417_3m02_lookup sv, _session417_3m02_lookup tv
 WHERE t.slug='3-maccabees-2-this-house-of-prayer'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-2-hezekiahs-prayer-against-the-blasphemer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:15 — *And Hezekiah prayed before Yahuah (LORD), and said, O Yahuah Elohim (LORD God) of Yashar''el (Israel), which dwellest between the cherubims, thou art the Elohim (God), even thou alone, of all the kingdoms of the earth; thou hast made heaven and earth.* Simon prays as Hezekiah prayed — appealing to the sole Creator against the lawless boaster who would trample the holy house.'
  FROM cross_reference_threads t, cross_references x, _session417_3m02_lookup sv, _session417_3m02_lookup tv
 WHERE t.slug='3-maccabees-2-hezekiahs-prayer-against-the-blasphemer'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 19:19 — *Now therefore, O Yahuah (LORD) our Elohim (God), I beseech thee, save thou us out of his hand, that all the kingdoms of the earth may know that thou art Yahuah Elohim (the LORD God), even thou only.* The deliverance Simon seeks is for the Father''s Name — that none may boast he trampled his house like an idol''s.'
  FROM cross_reference_threads t, cross_references x, _session417_3m02_lookup sv, _session417_3m02_lookup tv
 WHERE t.slug='3-maccabees-2-hezekiahs-prayer-against-the-blasphemer'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 37:16 — *O Yahuah Tseva''ot (LORD of hosts), Elohim (God) of Yashar''el (Israel), that dwellest between the cherubims, thou art the Elohim (God), even thou alone, of all the kingdoms of the earth: thou hast made heaven and earth.* The unapproachable dwelling-place, the heaven of heavens — the same Father whose throne is above the cherubim, against whom no king may presume.'
  FROM cross_reference_threads t, cross_references x, _session417_3m02_lookup sv, _session417_3m02_lookup tv
 WHERE t.slug='3-maccabees-2-hezekiahs-prayer-against-the-blasphemer'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-2-the-proud-king-scourged-and-struck-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Maccabees 3:26 — *Moreover two other young men appeared before him, notable in strength, excellent in beauty, and comely in apparel, who stood by him on either side; and scourged him continually, and gave him many sore stripes.* The same scourging of a proud intruder at the holy place — Heliodorus then, Ptolemy now.'
  FROM cross_reference_threads t, cross_references x, _session417_3m02_lookup sv, _session417_3m02_lookup tv
 WHERE t.slug='3-maccabees-2-the-proud-king-scourged-and-struck-down'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=3 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 3:29 — *For he by the hand of Yahuah (God) was cast down, and lay speechless without all hope of life.* Cast down powerless and deprived of speech — the identical righteous judgment that paralyzed Ptolemy and silenced his boast.'
  FROM cross_reference_threads t, cross_references x, _session417_3m02_lookup sv, _session417_3m02_lookup tv
 WHERE t.slug='3-maccabees-2-the-proud-king-scourged-and-struck-down'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=2 AND sv.verse_number=22
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=3 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The King of heaven who abases the proud — the same hand that shook Ptolemy to and fro like a reed.'
  FROM cross_reference_threads t, cross_references x, _session417_3m02_lookup sv, _session417_3m02_lookup tv
 WHERE t.slug='3-maccabees-2-the-proud-king-scourged-and-struck-down'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=2 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


-- ----- fragment: minion_3maccabees_03.sql (session417 3-maccabees 3) -----
-- Source anchor: apocrypha-charles-vol1/3-maccabees ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3m03 (view _session417_3m03_lookup). Sort band base 95050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session417_3m03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-maccabees-3-laws-diverse-from-all-people
  ('apocrypha-charles-vol1', '3-maccabees', 3, 4, 'canon', 'esther', 3, 8, 'free', E'Esther 3:8 — *And Haman said unto king Ahasuerus, There is a certain people scattered abroad and dispersed among the people in all the provinces of thy kingdom; and their laws are diverse from all people; neither keep they the king''s laws: therefore it is not for the king''s profit to suffer them.* Haman''s slander is word-for-word the charge laid against the Yahudim of Egypt — Torah-fidelity read as disloyalty.'),
  ('apocrypha-charles-vol1', '3-maccabees', 3, 7, 'apocrypha', 'the-rest-of-esther', 13, 4, 'extras', E'the-rest-of-esther 13:4 — *Declared to us, that in all nations throughout the world there was scattered a certain malicious people, that had laws contrary to all nations, and continually despised the commandments of kings, so as the uniting of our kingdoms, honourably intended by us cannot go forward.* The Greek decree of Artaxerxes frames the same accusation as 3 Macc 3:7 — a people whose laws set them apart is named an enemy of the realm.'),
  -- thread: 3-maccabees-3-the-kings-of-the-earth-rage
  ('apocrypha-charles-vol1', '3-maccabees', 3, 11, 'canon', 'psalms', 2, 1, 'free', E'Psalm 2:1 — *Why do the heathen rage, and the people imagine a vain thing?* Ptolemy''s letter-writing rage against the Yahudim is the empty raging of the heathen against the covenant.'),
  ('apocrypha-charles-vol1', '3-maccabees', 3, 11, 'canon', 'psalms', 2, 2, 'free', E'Psalm 2:2 — *The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed, saying,* The king who writes against Yahuah''s people writes, in truth, against Yahuah and his Anointed.'),
  ('apocrypha-charles-vol1', '3-maccabees', 3, 19, 'canon', 'psalms', 2, 4, 'free', E'Psalm 2:4 — *He that sitteth in the heavens shall laugh: Yahuah (Lord) shall have them in derision.* The king who thinks the people *lift up their heads against kings* (3 Macc 3:19) is himself the one held in derision by the enthroned Father.'),
  -- thread: 3-maccabees-3-decree-to-destroy-all-the-jews
  ('apocrypha-charles-vol1', '3-maccabees', 3, 25, 'canon', 'esther', 3, 13, 'free', E'Esther 3:13 — *And the letters were sent by posts into all the king''s provinces, to destroy, to kill, and to cause to perish, all Yahudim (Jews), both young and old, little children and women, in one day, even upon the thirteenth day of the twelfth month, which is the month Adar, and to take the spoil of them for a prey.* Ptolemy''s letter to *destroy* with *wives and children* is the very decree of Esther 3:13 — the same extermination-edict, the same enemy.'),
  ('apocrypha-charles-vol1', '3-maccabees', 3, 25, 'apocrypha', 'the-rest-of-esther', 13, 6, 'extras', E'the-rest-of-esther 13:6 — *Therefore have we commanded, that all they that are signified in writing to you by Aman, who is ordained over the affairs, and is next to us, shall all, with their wives and children, be utterly destroyed by the sword of their enemies, without all mercy and pity, the fourteenth day of the twelfth month Adar of this present year:* The Greek text of Artaxerxes'' decree matches 3 Macc 3:25 phrase for phrase — total destruction of the people *with wives and children*.'),
  -- thread: 3-maccabees-3-they-serve-not-thy-gods
  ('apocrypha-charles-vol1', '3-maccabees', 3, 2, 'canon', 'daniel', 3, 8, 'free', E'Daniel 3:8 — *Wherefore at that time certain Chaldeans came near, and accused the Yahudim (Jews).* The *invidious rumour... uttered abroad by men who had banded together to injure the Yahudi race* (3 Macc 3:2) is the same malicious accusation the Chaldeans brought in Babylon.'),
  ('apocrypha-charles-vol1', '3-maccabees', 3, 4, 'canon', 'daniel', 3, 12, 'free', E'Daniel 3:12 — *There are certain Yahudim (Jews) whom thou hast set over the affairs of the province of Babylon, Shadrach, Meshach, and Abed-nego; these men, O king, have not regarded thee: they serve not thy gods, nor worship the golden image which thou hast set up.* As the three were charged for serving Elohim alone, so the Egyptian Yahudim are charged because *they worshipped Elohim (God), and observed his law* (3 Macc 3:4).'),
  ('apocrypha-charles-vol1', '3-maccabees', 3, 7, 'canon', 'daniel', 3, 28, 'free', E'Daniel 3:28 — *Then Nebuchadnezzar spake, and said, Blessed be the Elohim (God) of Shadrach, Meshach, and Abed-nego, who hath sent his angel, and delivered his servants that trusted in him, and have changed the king''s word, and yielded their bodies, that they might not serve nor worship any god, except their own Elohim (God).* The deliverance promised over the slandered seed of 3 Macc 3 is the deliverance already shown in the furnace — the Father sends his angel to those who will not bow.'),
  -- thread: 3-maccabees-3-new-king-over-egypt
  ('apocrypha-charles-vol1', '3-maccabees', 3, 1, 'canon', 'exodus', 1, 9, 'free', E'Exodus 1:9 — *And he said unto his people, Behold, the people of the children of Yashar''el (Israel) are more and mightier than we:* Ptolemy''s dread of the Yahudim is the first Pharaoh''s dread — the king of Egypt who again turns on the seed dwelling in his land.'),
  ('apocrypha-charles-vol1', '3-maccabees', 3, 1, 'canon', 'exodus', 1, 10, 'free', E'Exodus 1:10 — *Come on, let us deal wisely with them; lest they multiply, and it come to pass, that, when there falleth out any war, they join also unto our enemies, and fight against us, and so get them up out of the land.* Pharaoh''s slander that the people are a disloyal danger in war is exactly Ptolemy''s charge that they are *hostile to the king''s interests* (3 Macc 3:7) and might *turn traitors* (3 Macc 3:24).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session417_3m03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session417_3m03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-3-laws-diverse-from-all-people',
       E'A people whose laws are diverse',
       E'The charge against the covenant people is their fidelity to the Torah. The slanderers complain *who said much of the exclusiveness of the Yahudim (Jews) with regard to their worship and meats; they alleged that they were men unsociable, hostile to the king''s interests, refusing to associate with him or his troops. By this way of speaking, they brought much odium upon them* (3 Maccabees 3:7) — yet the real ground was that *they worshipped Elohim (God), and observed his law, they made certain distinctions, and avoided certain things* (3 Maccabees 3:4). It ain''t new: this is Haman''s identical libel before Ahasuerus — *There is a certain people scattered abroad and dispersed among the people in all the provinces of thy kingdom; and their laws are diverse from all people; neither keep they the king''s laws: therefore it is not for the king''s profit to suffer them* (Esther 3:8). The very same words echo in the lost portions of that book — *that in all nations throughout the world there was scattered a certain malicious people, that had laws contrary to all nations, and continually despised the commandments of kings* (the-rest-of-esther 13:4). The world has always read covenant obedience as treason; the distinctions of clean and unclean, the set-apart worship, are not abolished but criminalized by the kingdoms of men.',
       sv.verse_id, ev.verse_id, 'extras', 95050
  FROM _session417_3m03_lookup sv, _session417_3m03_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=3 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-3-the-kings-of-the-earth-rage',
       E'The king''s letter against the people of Yahuah',
       E'Drunk on victory, *the king, elated with his prosperous fortune, and not regarding the superior power of Elohim (God), but thinking to persevere in his present purpose, wrote the following letter to the prejudice of the Yahudim (Jews)* (3 Maccabees 3:11), boasting that all was won *by the aid of the gods* (3 Maccabees 3:14). It ain''t new: every earthly throne that lifts itself against the covenant people lifts itself against the Most High and his Anointed — *Why do the heathen rage, and the people imagine a vain thing? The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed* (Psalm 2:1-2). The raging of Ptolemy is the raging of Psalm 2; but *He that sitteth in the heavens shall laugh: Yahuah (Lord) shall have them in derision* (Psalm 2:4). The conspiracy of kings is vanity before the Father who has set his King upon Zion and given the Formed-Son the nations for his inheritance.',
       sv.verse_id, ev.verse_id, 'extras', 95053
  FROM _session417_3m03_lookup sv, _session417_3m03_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=3 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-3-decree-to-destroy-all-the-jews',
       E'The decree to destroy all the Yahudim',
       E'The letter ends in a sentence of extermination: *in that same hour we order those Yahudim (Jews) who dwell among you, with wives and children, to be sent to us, vilified and abused, in chains of iron, to undergo a death, cruel and ignominious, suitable to men disaffected* (3 Maccabees 3:25), reasoning that *by the punishment of them in one body... we have found the only means of establishing our affairs* (3 Maccabees 3:26). It ain''t new: the same genocidal post went out under Ahasuerus — *And the letters were sent by posts into all the king''s provinces, to destroy, to kill, and to cause to perish, all Yahudim (Jews), both young and old, little children and women, in one day* (Esther 3:13). The Greek decree spells out the identical sentence — *all they that are signified in writing to you by Aman... shall all, with their wives and children, be utterly destroyed by the sword of their enemies, without all mercy and pity* (the-rest-of-esther 13:6). One decree, one adversary, one seed marked for destruction across the ages — and a covenant-keeping Deliverer who will not let the seed be cut off.',
       sv.verse_id, ev.verse_id, 'extras', 95056
  FROM _session417_3m03_lookup sv, _session417_3m03_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=3 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=3 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-3-they-serve-not-thy-gods',
       E'Accused for refusing the king''s gods',
       E'The seed is hated because it will not conform: *they worshipped Elohim (God), and observed his law, they made certain distinctions, and avoided certain things. Hence some persons held them in odium* (3 Maccabees 3:4), and informers came forward charging them as *men unsociable, hostile to the king''s interests* (3 Maccabees 3:7). It ain''t new: so the Chaldeans came forward against the three in Babylon — *Wherefore at that time certain Chaldeans came near, and accused the Yahudim (Jews)* (Daniel 3:8) — *There are certain Yahudim (Jews) whom thou hast set over the affairs of the province of Babylon, Shadrach, Meshach, and Abed-nego; these men, O king, have not regarded thee: they serve not thy gods, nor worship the golden image which thou hast set up* (Daniel 3:12). The charge is always the same and the deliverance is always the same Deliverer — *Blessed be the Elohim (God) of Shadrach, Meshach, and Abed-nego, who hath sent his angel, and delivered his servants that trusted in him... that they might not serve nor worship any god, except their own Elohim (God)* (Daniel 3:28). The Father sends his messenger to keep the faithful through the fire; the same hand will be looked for over Egypt.',
       sv.verse_id, ev.verse_id, 'extras', 95059
  FROM _session417_3m03_lookup sv, _session417_3m03_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=3 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-3-new-king-over-egypt',
       E'Bondage and slaughter in Egypt again',
       E'The wrath falls first on the Yahudim of the Egyptian countryside: *Laying his hand more heavily upon those who lived in the country, he gave orders that they should be quickly collected into one place, and most cruelly deprived of their lives* (3 Maccabees 3:1). It ain''t new: this is Egypt''s oldest sin against the seed. *Now there arose up a new king over Egypt, which knew not Joseph. And he said unto his people, Behold, the people of the children of Yashar''el (Israel) are more and mightier than we* (Exodus 1:8-9) — and Pharaoh too schemed to crush them and slay their little ones. Ptolemy is the new Pharaoh; the covenant people again afflicted in the land of their old bondage. But the Father who *dealt well* with the faithful and *made them houses* (Exodus 1:21) and who once brought Yashar''el out of Egypt is the same Deliverer the seed will look to now.',
       sv.verse_id, ev.verse_id, 'extras', 95062
  FROM _session417_3m03_lookup sv, _session417_3m03_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=3 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-maccabees-3-laws-diverse-from-all-people
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 3:8 — *And Haman said unto king Ahasuerus, There is a certain people scattered abroad and dispersed among the people in all the provinces of thy kingdom; and their laws are diverse from all people; neither keep they the king''s laws: therefore it is not for the king''s profit to suffer them.* Haman''s slander is word-for-word the charge laid against the Yahudim of Egypt — Torah-fidelity read as disloyalty.'
  FROM cross_reference_threads t, cross_references x, _session417_3m03_lookup sv, _session417_3m03_lookup tv
 WHERE t.slug='3-maccabees-3-laws-diverse-from-all-people'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'the-rest-of-esther 13:4 — *Declared to us, that in all nations throughout the world there was scattered a certain malicious people, that had laws contrary to all nations, and continually despised the commandments of kings, so as the uniting of our kingdoms, honourably intended by us cannot go forward.* The Greek decree of Artaxerxes frames the same accusation as 3 Macc 3:7 — a people whose laws set them apart is named an enemy of the realm.'
  FROM cross_reference_threads t, cross_references x, _session417_3m03_lookup sv, _session417_3m03_lookup tv
 WHERE t.slug='3-maccabees-3-laws-diverse-from-all-people'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-rest-of-esther' AND tv.chapter_number=13 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-3-the-kings-of-the-earth-rage
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:1 — *Why do the heathen rage, and the people imagine a vain thing?* Ptolemy''s letter-writing rage against the Yahudim is the empty raging of the heathen against the covenant.'
  FROM cross_reference_threads t, cross_references x, _session417_3m03_lookup sv, _session417_3m03_lookup tv
 WHERE t.slug='3-maccabees-3-the-kings-of-the-earth-rage'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 2:2 — *The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed, saying,* The king who writes against Yahuah''s people writes, in truth, against Yahuah and his Anointed.'
  FROM cross_reference_threads t, cross_references x, _session417_3m03_lookup sv, _session417_3m03_lookup tv
 WHERE t.slug='3-maccabees-3-the-kings-of-the-earth-rage'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 2:4 — *He that sitteth in the heavens shall laugh: Yahuah (Lord) shall have them in derision.* The king who thinks the people *lift up their heads against kings* (3 Macc 3:19) is himself the one held in derision by the enthroned Father.'
  FROM cross_reference_threads t, cross_references x, _session417_3m03_lookup sv, _session417_3m03_lookup tv
 WHERE t.slug='3-maccabees-3-the-kings-of-the-earth-rage'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=3 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-3-decree-to-destroy-all-the-jews
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 3:13 — *And the letters were sent by posts into all the king''s provinces, to destroy, to kill, and to cause to perish, all Yahudim (Jews), both young and old, little children and women, in one day, even upon the thirteenth day of the twelfth month, which is the month Adar, and to take the spoil of them for a prey.* Ptolemy''s letter to *destroy* with *wives and children* is the very decree of Esther 3:13 — the same extermination-edict, the same enemy.'
  FROM cross_reference_threads t, cross_references x, _session417_3m03_lookup sv, _session417_3m03_lookup tv
 WHERE t.slug='3-maccabees-3-decree-to-destroy-all-the-jews'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=3 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'the-rest-of-esther 13:6 — *Therefore have we commanded, that all they that are signified in writing to you by Aman, who is ordained over the affairs, and is next to us, shall all, with their wives and children, be utterly destroyed by the sword of their enemies, without all mercy and pity, the fourteenth day of the twelfth month Adar of this present year:* The Greek text of Artaxerxes'' decree matches 3 Macc 3:25 phrase for phrase — total destruction of the people *with wives and children*.'
  FROM cross_reference_threads t, cross_references x, _session417_3m03_lookup sv, _session417_3m03_lookup tv
 WHERE t.slug='3-maccabees-3-decree-to-destroy-all-the-jews'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=3 AND sv.verse_number=25
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-rest-of-esther' AND tv.chapter_number=13 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-3-they-serve-not-thy-gods
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 3:8 — *Wherefore at that time certain Chaldeans came near, and accused the Yahudim (Jews).* The *invidious rumour... uttered abroad by men who had banded together to injure the Yahudi race* (3 Macc 3:2) is the same malicious accusation the Chaldeans brought in Babylon.'
  FROM cross_reference_threads t, cross_references x, _session417_3m03_lookup sv, _session417_3m03_lookup tv
 WHERE t.slug='3-maccabees-3-they-serve-not-thy-gods'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 3:12 — *There are certain Yahudim (Jews) whom thou hast set over the affairs of the province of Babylon, Shadrach, Meshach, and Abed-nego; these men, O king, have not regarded thee: they serve not thy gods, nor worship the golden image which thou hast set up.* As the three were charged for serving Elohim alone, so the Egyptian Yahudim are charged because *they worshipped Elohim (God), and observed his law* (3 Macc 3:4).'
  FROM cross_reference_threads t, cross_references x, _session417_3m03_lookup sv, _session417_3m03_lookup tv
 WHERE t.slug='3-maccabees-3-they-serve-not-thy-gods'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 3:28 — *Then Nebuchadnezzar spake, and said, Blessed be the Elohim (God) of Shadrach, Meshach, and Abed-nego, who hath sent his angel, and delivered his servants that trusted in him, and have changed the king''s word, and yielded their bodies, that they might not serve nor worship any god, except their own Elohim (God).* The deliverance promised over the slandered seed of 3 Macc 3 is the deliverance already shown in the furnace — the Father sends his angel to those who will not bow.'
  FROM cross_reference_threads t, cross_references x, _session417_3m03_lookup sv, _session417_3m03_lookup tv
 WHERE t.slug='3-maccabees-3-they-serve-not-thy-gods'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-3-new-king-over-egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:9 — *And he said unto his people, Behold, the people of the children of Yashar''el (Israel) are more and mightier than we:* Ptolemy''s dread of the Yahudim is the first Pharaoh''s dread — the king of Egypt who again turns on the seed dwelling in his land.'
  FROM cross_reference_threads t, cross_references x, _session417_3m03_lookup sv, _session417_3m03_lookup tv
 WHERE t.slug='3-maccabees-3-new-king-over-egypt'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:10 — *Come on, let us deal wisely with them; lest they multiply, and it come to pass, that, when there falleth out any war, they join also unto our enemies, and fight against us, and so get them up out of the land.* Pharaoh''s slander that the people are a disloyal danger in war is exactly Ptolemy''s charge that they are *hostile to the king''s interests* (3 Macc 3:7) and might *turn traitors* (3 Macc 3:24).'
  FROM cross_reference_threads t, cross_references x, _session417_3m03_lookup sv, _session417_3m03_lookup tv
 WHERE t.slug='3-maccabees-3-new-king-over-egypt'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


-- ----- fragment: minion_3maccabees_04.sql (session417 3-maccabees 4) -----
-- Source anchor: apocrypha-charles-vol1/3-maccabees ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3m04 (view _session417_3m04_lookup). Sort band base 95075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session417_3m04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-maccabees-4-mourning-and-the-decree
  ('apocrypha-charles-vol1', '3-maccabees', 4, 2, 'canon', 'esther', 4, 3, 'free', E'Esther 4:3 — *And in every province, whithersoever the king''s commandment and his decree came, there was great mourning among the Yahudim (Jews), and fasting, and weeping, and wailing; and many lay in sackcloth and ashes.* The identical mourning of the covenant people under a royal decree of destruction, ch4:2 in Egypt mirroring Persia.'),
  ('apocrypha-charles-vol1', '3-maccabees', 4, 2, 'canon', 'esther', 4, 1, 'free', E'Esther 4:1 — *When Mordecai perceived all that was done, Mordecai rent his clothes, and put on sackcloth with ashes, and went out into the midst of the city, and cried with a loud and a bitter cry;* the loud bitter cry of grief that fills 3 Macc 4:2-3 has its pattern in Mordecai''s own.'),
  ('apocrypha-charles-vol1', '3-maccabees', 4, 3, 'canon', 'lamentations', 2, 10, 'free', E'Lamentations 2:10 — *The elders of the daughter of Zion sit upon the ground, and keep silence: they have cast up dust upon their heads; they have girded themselves with sackcloth: the virgins of Jerusalem hang down their heads to the ground.* The streets filled with wailing in 3 Macc 4:3 echo the dust-strewn mourning of Zion''s daughter.'),
  -- thread: 3-maccabees-4-weddings-turned-to-mourning
  ('apocrypha-charles-vol1', '3-maccabees', 4, 6, 'canon', 'lamentations', 2, 21, 'free', E'Lamentations 2:21 — *The young and the old lie on the ground in the streets: my virgins and my young men are fallen by the sword; thou hast slain them in the day of thine anger; thou hast killed, and not pitied.* The young brides and bridegrooms hurried to misery in 3 Macc 4:6-8 match Zion''s fallen virgins and young men.'),
  ('apocrypha-charles-vol1', '3-maccabees', 4, 8, 'canon', 'lamentations', 2, 6, 'free', E'Lamentations 2:6 — *And he hath violently taken away his tabernacle, as if it were of a garden: he hath destroyed his places of the assembly: Yahuah (LORD) hath caused the solemn feasts and sabbaths to be forgotten in Zion, and hath despised in the indignation of his anger the king and the priest.* Feasting and jollity turned to wailing in 3 Macc 4:8 as the solemn joy of Zion was likewise forgotten.'),
  -- thread: 3-maccabees-4-bondage-and-affliction-in-egypt
  ('apocrypha-charles-vol1', '3-maccabees', 4, 9, 'canon', 'exodus', 1, 14, 'free', E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* The chains and fetters of 3 Macc 4:9 are the bitter Egyptian bondage returning upon the same people.'),
  ('apocrypha-charles-vol1', '3-maccabees', 4, 9, 'canon', 'exodus', 1, 13, 'free', E'Exodus 1:13 — *And the Egyptians made the children of Yashar''el (Israel) to serve with rigour:* the merciless treatment of 3 Macc 4:9 echoes Egypt''s first rigour against the covenant seed.'),
  ('apocrypha-charles-vol1', '3-maccabees', 4, 11, 'canon', 'exodus', 1, 9, 'free', E'Exodus 1:9 — *And he said unto his people, Behold, the people of the children of Yashar''el (Israel) are more and mightier than we:* the king who herds the multitude to the hippodrome in 3 Macc 4:11 shares the first Pharaoh''s dread of the multiplying people.'),
  -- thread: 3-maccabees-4-counted-as-sheep-for-the-slaughter
  ('apocrypha-charles-vol1', '3-maccabees', 4, 17, 'canon', 'psalms', 44, 22, 'free', E'Psalm 44:22 — *Yea, for thy sake are we killed all the day long; we are counted as sheep for the slaughter.* The registration of the whole nation for destruction in 3 Macc 4:17 is the covenant people counted as slaughter-sheep — yet, as here, not abandoned.'),
  ('apocrypha-charles-vol1', '3-maccabees', 4, 21, 'canon', 'psalms', 44, 26, 'free', E'Psalm 44:26 — *Arise for our help, and redeem us for thy mercies'' sake.* The unconquerable Providence that assists from heaven in 3 Macc 4:21 answers the cry to be redeemed for mercy''s sake, not for merit.'),
  ('apocrypha-charles-vol1', '3-maccabees', 4, 21, 'canon', 'psalms', 44, 23, 'free', E'Psalm 44:23 — *Awake, why sleepest thou, O Yahuah (Lord)? arise, cast us not off for ever.* The apparent silence before heaven''s interference in 3 Macc 4:21 matches the psalmist''s plea against the Deliverer''s seeming sleep.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session417_3m04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session417_3m04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-4-mourning-and-the-decree',
       E'Sackcloth and ashes among the Yahudim at the decree',
       E'The decree falls and the covenant people are plunged into mourning: *The Yahudim (Jews) suffered great throes of sorrow, and wept much; while their hearts, all things around being lamentable, were set on fire as they bewailed the sudden destruction which was decreed against them* (3 Maccabees 4:2). No corner of Egypt is left untouched — *What home, or city, or place at all inhabited, or what streets were there, which their condition did not fill with wailing and lamentation?* (3 Maccabees 4:3). It ain''t new. The same wailing rose under Haman''s decree in Persia: *And in every province, whithersoever the king''s commandment and his decree came, there was great mourning among the Yahudim (Jews), and fasting, and weeping, and wailing; and many lay in sackcloth and ashes* (Esther 4:3) — Mordecai himself *rent his clothes, and put on sackcloth with ashes, and went out into the midst of the city, and cried with a loud and a bitter cry* (Esther 4:1). And the prophet had already mapped the grief of a doomed people onto the daughter of Zion: *The elders of the daughter of Zion sit upon the ground, and keep silence: they have cast up dust upon their heads; they have girded themselves with sackcloth: the virgins of Jerusalem hang down their heads to the ground* (Lamentations 2:10). One Adversary, one decree, one lamentation of the covenant seed — across Persia, across Egypt, across Zion.',
       sv.verse_id, ev.verse_id, 'extras', 95075
  FROM _session417_3m04_lookup sv, _session417_3m04_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-4-weddings-turned-to-mourning',
       E'The marriage hymn turned to a lamentable cry',
       E'The cruelty reaches even the wedding chamber: *Girls who had entered the bridal chamber quite lately, to enjoy the partnership of marriage, exchanged pleasure for misery; and with dust scattered upon their myrrh-anointed heads, were hurried along unveiled, and, in the midst of outlandish insults, set up with one accord a lamentable cry in lieu of the marriage hymn* (3 Maccabees 4:6); and their husbands, *in the prime of their youthful vigour, instead of crowns wore halters round their necks; instead of feasting and youthful jollity, spent the rest of their nuptial days in wailings, and saw only the grave at hand* (3 Maccabees 4:8). It ain''t new — when the daughter of Zion fell, joy was likewise plundered: *Yahuah (LORD) hath caused the solemn feasts and sabbaths to be forgotten in Zion, and hath despised in the indignation of his anger the king and the priest* (Lamentations 2:6), and *The young and the old lie on the ground in the streets: my virgins and my young men are fallen by the sword; thou hast slain them in the day of thine anger; thou hast killed, and not pitied* (Lamentations 2:21). The bride and bridegroom of the covenant people, robbed of the wedding-song — yet the Deliverer who keeps the seed will turn mourning to dancing again.',
       sv.verse_id, ev.verse_id, 'extras', 95078
  FROM _session417_3m04_lookup sv, _session417_3m04_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-4-bondage-and-affliction-in-egypt',
       E'Chains, ships, and the affliction returns to Egypt',
       E'The covenant people are again afflicted on Egyptian soil: *They were dragged along by unyielding chains, like wild beasts: of these, some had their necks thrust into the benches of the rowers; while the feet of others were enclosed in hard fetters* (3 Maccabees 4:9), and the hippodrome was readied so they could *hold no communication with his forces; nay, were deemed unworthy of any civilized accommodation* (3 Maccabees 4:11). It ain''t new — this is the old Egyptian bondage come round again: *And the Egyptians made the children of Yashar''el (Israel) to serve with rigour: And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour* (Exodus 1:13-14). And as the first Pharaoh feared the multiplying seed — *Behold, the people of the children of Yashar''el (Israel) are more and mightier than we* (Exodus 1:9) — so Philopator now rages at a people too many to count. The bondage is the same; so is the Deliverer who heard the groaning then and will hear it again.',
       sv.verse_id, ev.verse_id, 'extras', 95081
  FROM _session417_3m04_lookup sv, _session417_3m04_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-4-counted-as-sheep-for-the-slaughter',
       E'The seed too many to register — counted as sheep for the slaughter',
       E'The whole nation is to be enrolled by name for destruction: *The registering of these men was carried on cruelly, zealously, assiduously, from the rising of the sun to its going down, and was not brought to an end in forty days* (3 Maccabees 4:15) — yet the count breaks down, *the multitude of the Yahudim (Jews) was too great for registration* (3 Maccabees 4:17), and at last *they said, and proved, that paper and pens had failed them for the carrying out of their purpose* (3 Maccabees 4:20). The narrator names the cause outright: *Now this was the active interference of the unconquerable Providence which assisted the Yahudim (Jews) from heaven* (3 Maccabees 4:21). It ain''t new. The covenant people are ever counted for slaughter, yet preserved: *Yea, for thy sake are we killed all the day long; we are counted as sheep for the slaughter* (Psalm 44:22) — and even in apparent silence the faithful cry, *Awake, why sleepest thou, O Yahuah (Lord)? arise, cast us not off for ever* (Psalm 44:23), *Arise for our help, and redeem us for thy mercies'' sake* (Psalm 44:26). The Father''s hidden hand defeats the scribes'' pens; the seed cannot be numbered to destruction, for it is kept by mercy, not blotted out.',
       sv.verse_id, ev.verse_id, 'extras', 95084
  FROM _session417_3m04_lookup sv, _session417_3m04_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=4 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=4 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-maccabees-4-mourning-and-the-decree
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 4:3 — *And in every province, whithersoever the king''s commandment and his decree came, there was great mourning among the Yahudim (Jews), and fasting, and weeping, and wailing; and many lay in sackcloth and ashes.* The identical mourning of the covenant people under a royal decree of destruction, ch4:2 in Egypt mirroring Persia.'
  FROM cross_reference_threads t, cross_references x, _session417_3m04_lookup sv, _session417_3m04_lookup tv
 WHERE t.slug='3-maccabees-4-mourning-and-the-decree'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Esther 4:1 — *When Mordecai perceived all that was done, Mordecai rent his clothes, and put on sackcloth with ashes, and went out into the midst of the city, and cried with a loud and a bitter cry;* the loud bitter cry of grief that fills 3 Macc 4:2-3 has its pattern in Mordecai''s own.'
  FROM cross_reference_threads t, cross_references x, _session417_3m04_lookup sv, _session417_3m04_lookup tv
 WHERE t.slug='3-maccabees-4-mourning-and-the-decree'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Lamentations 2:10 — *The elders of the daughter of Zion sit upon the ground, and keep silence: they have cast up dust upon their heads; they have girded themselves with sackcloth: the virgins of Jerusalem hang down their heads to the ground.* The streets filled with wailing in 3 Macc 4:3 echo the dust-strewn mourning of Zion''s daughter.'
  FROM cross_reference_threads t, cross_references x, _session417_3m04_lookup sv, _session417_3m04_lookup tv
 WHERE t.slug='3-maccabees-4-mourning-and-the-decree'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-4-weddings-turned-to-mourning
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Lamentations 2:21 — *The young and the old lie on the ground in the streets: my virgins and my young men are fallen by the sword; thou hast slain them in the day of thine anger; thou hast killed, and not pitied.* The young brides and bridegrooms hurried to misery in 3 Macc 4:6-8 match Zion''s fallen virgins and young men.'
  FROM cross_reference_threads t, cross_references x, _session417_3m04_lookup sv, _session417_3m04_lookup tv
 WHERE t.slug='3-maccabees-4-weddings-turned-to-mourning'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Lamentations 2:6 — *And he hath violently taken away his tabernacle, as if it were of a garden: he hath destroyed his places of the assembly: Yahuah (LORD) hath caused the solemn feasts and sabbaths to be forgotten in Zion, and hath despised in the indignation of his anger the king and the priest.* Feasting and jollity turned to wailing in 3 Macc 4:8 as the solemn joy of Zion was likewise forgotten.'
  FROM cross_reference_threads t, cross_references x, _session417_3m04_lookup sv, _session417_3m04_lookup tv
 WHERE t.slug='3-maccabees-4-weddings-turned-to-mourning'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-4-bondage-and-affliction-in-egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* The chains and fetters of 3 Macc 4:9 are the bitter Egyptian bondage returning upon the same people.'
  FROM cross_reference_threads t, cross_references x, _session417_3m04_lookup sv, _session417_3m04_lookup tv
 WHERE t.slug='3-maccabees-4-bondage-and-affliction-in-egypt'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:13 — *And the Egyptians made the children of Yashar''el (Israel) to serve with rigour:* the merciless treatment of 3 Macc 4:9 echoes Egypt''s first rigour against the covenant seed.'
  FROM cross_reference_threads t, cross_references x, _session417_3m04_lookup sv, _session417_3m04_lookup tv
 WHERE t.slug='3-maccabees-4-bondage-and-affliction-in-egypt'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 1:9 — *And he said unto his people, Behold, the people of the children of Yashar''el (Israel) are more and mightier than we:* the king who herds the multitude to the hippodrome in 3 Macc 4:11 shares the first Pharaoh''s dread of the multiplying people.'
  FROM cross_reference_threads t, cross_references x, _session417_3m04_lookup sv, _session417_3m04_lookup tv
 WHERE t.slug='3-maccabees-4-bondage-and-affliction-in-egypt'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-4-counted-as-sheep-for-the-slaughter
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 44:22 — *Yea, for thy sake are we killed all the day long; we are counted as sheep for the slaughter.* The registration of the whole nation for destruction in 3 Macc 4:17 is the covenant people counted as slaughter-sheep — yet, as here, not abandoned.'
  FROM cross_reference_threads t, cross_references x, _session417_3m04_lookup sv, _session417_3m04_lookup tv
 WHERE t.slug='3-maccabees-4-counted-as-sheep-for-the-slaughter'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 44:26 — *Arise for our help, and redeem us for thy mercies'' sake.* The unconquerable Providence that assists from heaven in 3 Macc 4:21 answers the cry to be redeemed for mercy''s sake, not for merit.'
  FROM cross_reference_threads t, cross_references x, _session417_3m04_lookup sv, _session417_3m04_lookup tv
 WHERE t.slug='3-maccabees-4-counted-as-sheep-for-the-slaughter'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 44:23 — *Awake, why sleepest thou, O Yahuah (Lord)? arise, cast us not off for ever.* The apparent silence before heaven''s interference in 3 Macc 4:21 matches the psalmist''s plea against the Deliverer''s seeming sleep.'
  FROM cross_reference_threads t, cross_references x, _session417_3m04_lookup sv, _session417_3m04_lookup tv
 WHERE t.slug='3-maccabees-4-counted-as-sheep-for-the-slaughter'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


-- ----- fragment: minion_3maccabees_05.sql (session417 3-maccabees 5) -----
-- Source anchor: apocrypha-charles-vol1/3-maccabees ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3m05 (view _session417_3m05_lookup). Sort band base 95100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session417_3m05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-maccabees-5-stand-still-and-see
  ('apocrypha-charles-vol1', '3-maccabees', 5, 6, 'canon', 'exodus', 14, 13, 'free', E'Exodus 14:13 — *And Moses said unto the people, Fear ye not, stand still, and see the salvation of Yahuah (LORD), which he will shew to you to day: for the Egyptians whom ye have seen to day, ye shall see them again no more for ever.* Hemmed in by chains and beasts, the bound remnant of Egypt is set in the same posture Moses commanded at the sea — wait and watch for a salvation no hand of theirs can earn.'),
  ('apocrypha-charles-vol1', '3-maccabees', 5, 7, 'canon', 'exodus', 14, 14, 'free', E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* As they invoke the Almighty Yahuah and beseech the Lord of every power, the battle is the Father''s, not the captives''.'),
  ('apocrypha-charles-vol1', '3-maccabees', 5, 51, 'canon', 'exodus', 14, 30, 'free', E'Exodus 14:30 — *Thus Yahuah (LORD) saved Yashar''el (Israel) that day out of the hand of the Egyptians; and Yashar''el (Israel) saw the Egyptians dead upon the sea shore.* The cry for Yahuah to reveal himself at the gates of Hades looks for the same hand that once saved Israel out of Egypt''s own grip.'),
  -- thread: 3-maccabees-5-enemy-host-overthrown
  ('apocrypha-charles-vol1', '3-maccabees', 5, 2, 'canon', 'exodus', 14, 27, 'free', E'Exodus 14:27 — *And Moses stretched forth his hand over the sea, and the sea returned to his strength when the morning appeared; and the Egyptians fled against it; and Yahuah (LORD) overthrew the Egyptians in the midst of the sea.* The host massed for execution will, like Pharaoh''s, be turned back upon itself in the morning.'),
  ('apocrypha-charles-vol1', '3-maccabees', 5, 3, 'canon', 'exodus', 14, 28, 'free', E'Exodus 14:28 — *And the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them.* The friends and army gathered to hate and destroy stand in the place of Pharaoh''s vanished host.'),
  ('apocrypha-charles-vol1', '3-maccabees', 5, 1, 'canon', '2-kings', 19, 35, 'free', E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Hermon''s five hundred enraged beasts are no match for the One who alone can rout an army in a night.'),
  -- thread: 3-maccabees-5-kings-heart-in-his-hand
  ('apocrypha-charles-vol1', '3-maccabees', 5, 12, 'canon', 'proverbs', 21, 1, 'free', E'Proverbs 21:1 — *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* The king''s unflinching resolve is held fast and turned aside by the hand that channels every royal will.'),
  ('apocrypha-charles-vol1', '3-maccabees', 5, 42, 'canon', 'proverbs', 21, 30, 'free', E'Proverbs 21:30 — *There is no wisdom nor understanding nor counsel against Yahuah (LORD).* The king''s repeated counsel to destroy keeps collapsing because no plotting can stand against the Father''s purpose to deliver.'),
  ('apocrypha-charles-vol1', '3-maccabees', 5, 1, 'canon', 'proverbs', 21, 31, 'free', E'Proverbs 21:31 — *The horse is prepared against the day of battle: but safety is of Yahuah (LORD).* Hermon may ready the elephants for the day of slaughter, but the safety of the covenant people rests with Yahuah, not the strength of the beasts.'),
  -- thread: 3-maccabees-5-providential-sleep-and-forgetting
  ('apocrypha-charles-vol1', '3-maccabees', 5, 11, 'canon', 'esther', 6, 1, 'free', E'Esther 6:1 — *On that night could not the king sleep, and he commanded to bring the book of records of the chronicles; and they were read before the king.* As one king is kept from sleep to save the Yahudim, this king is sent into sleep to the same providential end — the small turning that overthrows the gallows and the hippodrome alike.'),
  ('apocrypha-charles-vol1', '3-maccabees', 5, 27, 'canon', 'esther', 6, 1, 'free', E'Esther 6:1 — *On that night could not the king sleep, and he commanded to bring the book of records of the chronicles; and they were read before the king.* The spirit of oblivion that empties this king''s memory of his own decree mirrors the sleepless night that began Haman''s undoing — providence governing a king''s restless or clouded mind.'),
  -- thread: 3-maccabees-5-defend-this-city-and-deliver
  ('apocrypha-charles-vol1', '3-maccabees', 5, 7, 'canon', '2-kings', 19, 34, 'free', E'2 Kings 19:34 — *For I will defend this city, to save it, for mine own sake, and for my servant David''s sake.* The Father overthrows the evil purpose for his own sake and for David''s line, the same covenant ground on which Egypt''s remnant casts its plea.'),
  ('apocrypha-charles-vol1', '3-maccabees', 5, 25, 'canon', '2-kings', 19, 20, 'free', E'2 Kings 19:20 — *Then Isaiah the son of Amoz sent to Hezekiah, saying, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), That which thou hast prayed to me against Sennacherib king of Assyria I have heard.* The hands stretched out in mournful strains are heard by the same God who answered Hezekiah''s prayer against the blasphemer.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session417_3m05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session417_3m05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-5-stand-still-and-see',
       E'Bound at the hippodrome — stand still and see the salvation of Yahuah',
       E'The miserable victims are bound, the elephants drugged, and the heathen reckon the whole race already dead: *The heathen believed the Yahudim (Jews) to be destitute of all protection; for chains fettered them about.* (3 Maccabees 5:6) Then at the gates of Hades they lift the cry of Egypt''s first deliverance: *sent up an exceeding great cry, entreating Yahuah (Lord) of all power to reveal himself, and have mercy upon those who now lay at the gates of Hades.* (3 Maccabees 5:51) It ain''t new — penned between Migdol and the sea, hemmed in with no way out, Moses spoke the very posture this Egyptian remnant takes: *And Moses said unto the people, Fear ye not, stand still, and see the salvation of Yahuah (LORD), which he will shew to you to day: for the Egyptians whom ye have seen to day, ye shall see them again no more for ever.* (Exodus 14:13) The deliverance is not won by the arm of the bound but by the One who fights: *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* (Exodus 14:14) The cry to "reveal himself" reaches toward the Father''s saving arm made manifest — the Formed-Son who delivers, not the merit of the chained.',
       sv.verse_id, ev.verse_id, 'extras', 95100
  FROM _session417_3m05_lookup sv, _session417_3m05_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=5 AND ev.verse_number=51
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-5-enemy-host-overthrown',
       E'The drugged host turned back — the enemy he will see no more',
       E'Five hundred elephants are infuriated and the king''s whole hateful army is marshalled for the slaughter: *These five hundred elephants were, when infuriated by the copious draughts of frankincense, to be led up to the execution of death upon the Yahudim (Jews).* (3 Maccabees 5:2) The friends and soldiers gathered are *those of his friends and of the army who hated the Yahudim (Jews) the most.* (3 Maccabees 5:3) It ain''t new — the same God who armed and then drowned a pursuing host stands ready again. At the Red Sea the morning watch turned Egypt''s strength to ruin: *And Moses stretched forth his hand over the sea, and the sea returned to his strength when the morning appeared; and the Egyptians fled against it; and Yahuah (LORD) overthrew the Egyptians in the midst of the sea.* (Exodus 14:27) Not one of the proud host remained: *And the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them.* (Exodus 14:28) And when Assyria''s host massed against the city, one angel laid them all down dead: *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* (2 Kings 19:35) The weapon raised against the covenant people is the weapon the Father turns back upon the proud.',
       sv.verse_id, ev.verse_id, 'extras', 95103
  FROM _session417_3m05_lookup sv, _session417_3m05_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=5 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-5-kings-heart-in-his-hand',
       E'The murderous purpose twice frustrated — the king''s heart in Yahuah''s hand',
       E'Twice the tyrant''s settled, furious design is supernaturally undone — first by sleep, then by forgetfulness: *By this sweet and profound influence of Yahuah (Lord) he was held fast, and thus his unjust purpose was quite frustrated, and his unflinching resolve greatly falsified.* (3 Maccabees 5:12) And again: *But this was the working of that El Shaddai (Almighty God) who had made him forget all his purpose.* (3 Maccabees 5:28) His own kinsmen marvel at his instability, not knowing the hidden hand: *The king, just like another Phalaris, a prey to thoughtlessness, made no account of the changes which his own mind had undergone, issuing in the deliverance of the Yahudim (Jews).* (3 Maccabees 5:42) It ain''t new — the proverb already named the secret governor of every throne: *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* (Proverbs 21:1) Let the horse be drugged and the host be armed; the outcome is the Father''s: *The horse is prepared against the day of battle: but safety is of Yahuah (LORD).* (Proverbs 21:31) For no scheme stands against him: *There is no wisdom nor understanding nor counsel against Yahuah (LORD).* (Proverbs 21:30) The deliverance is the Father''s mercy overruling a tyrant''s will — not a wage the bound have earned.',
       sv.verse_id, ev.verse_id, 'extras', 95106
  FROM _session417_3m05_lookup sv, _session417_3m05_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=5 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=5 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-5-providential-sleep-and-forgetting',
       E'Sent into sleep and oblivion — the king that could not sleep',
       E'The Father''s mercy comes wearing the smallest of providences — a gift of sleep and a fog of forgetting at the very hour of execution: *He, however, who has sent his good creature sleep from all time, by night or by day thus gratifying whom he wills, diffused a portion thereof [now] upon the king.* (3 Maccabees 5:11) And when sleep is spent, the king''s mind is emptied of its own command: *The king, receiving him, was astonished at his unwonted exit; and, overwhelmed with a spirit of oblivion about everything, enquired the object of this earnest preparation.* (3 Maccabees 5:27) The text names the hidden Author plainly: *for, by the Providence of Elohim (God) regarding these things, his mind had become entirely confused.* (3 Maccabees 5:30) It ain''t new — the same providence once kept a Persian king from sleep on the night a noose was being readied, and the reversal saved the Yahudim: *On that night could not the king sleep, and he commanded to bring the book of records of the chronicles; and they were read before the king.* (Esther 6:1) The Father needs no army to save his people — only a sleepless or a sleeping king, turned in the secret hour.',
       sv.verse_id, ev.verse_id, 'extras', 95109
  FROM _session417_3m05_lookup sv, _session417_3m05_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=5 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=5 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-5-defend-this-city-and-deliver',
       E'Prayer through the night — I will defend this city to save it',
       E'The bound remnant prays ceaselessly through the watches, casting themselves wholly on the mercy of their God: *They invoked the Almighty Yahuah (Lord), and ceaselessly besought with tears their merciful Elohim (God) and Father, Ruler of all, Yahuah (Lord) of every power, to overthrow the evil purpose which was gone out against them, and to deliver them by extraordinary manifestation from that death which was in store for them.* (3 Maccabees 5:7) Spared one hour, they pray again for the power of the powerful hand (3 Maccabees 5:13), and at the dawn stretch forth their hands: *The Yahudim (Jews), breathless with momentary suspense, stretched forth their hands, and prayed the Greatest Elohim (God), in mournful strains, again to help them speedily.* (3 Maccabees 5:25) It ain''t new — when Sennacherib''s blasphemy threatened the holy city, the answer came as a sworn defense for the covenant and the King to come: *For I will defend this city, to save it, for mine own sake, and for my servant David''s sake.* (2 Kings 19:34) And the deliverance was the Father''s reply to prayer: *That which thou hast prayed to me against Sennacherib king of Assyria I have heard.* (2 Kings 19:20) The Father guards his people for his own name''s sake and for the seed of David — the line of the Formed-Son Deliverer — not because the captives have merited it.',
       sv.verse_id, ev.verse_id, 'extras', 95112
  FROM _session417_3m05_lookup sv, _session417_3m05_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=5 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=5 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-maccabees-5-stand-still-and-see
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 14:13 — *And Moses said unto the people, Fear ye not, stand still, and see the salvation of Yahuah (LORD), which he will shew to you to day: for the Egyptians whom ye have seen to day, ye shall see them again no more for ever.* Hemmed in by chains and beasts, the bound remnant of Egypt is set in the same posture Moses commanded at the sea — wait and watch for a salvation no hand of theirs can earn.'
  FROM cross_reference_threads t, cross_references x, _session417_3m05_lookup sv, _session417_3m05_lookup tv
 WHERE t.slug='3-maccabees-5-stand-still-and-see'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace.* As they invoke the Almighty Yahuah and beseech the Lord of every power, the battle is the Father''s, not the captives''.'
  FROM cross_reference_threads t, cross_references x, _session417_3m05_lookup sv, _session417_3m05_lookup tv
 WHERE t.slug='3-maccabees-5-stand-still-and-see'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 14:30 — *Thus Yahuah (LORD) saved Yashar''el (Israel) that day out of the hand of the Egyptians; and Yashar''el (Israel) saw the Egyptians dead upon the sea shore.* The cry for Yahuah to reveal himself at the gates of Hades looks for the same hand that once saved Israel out of Egypt''s own grip.'
  FROM cross_reference_threads t, cross_references x, _session417_3m05_lookup sv, _session417_3m05_lookup tv
 WHERE t.slug='3-maccabees-5-stand-still-and-see'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=5 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-5-enemy-host-overthrown
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 14:27 — *And Moses stretched forth his hand over the sea, and the sea returned to his strength when the morning appeared; and the Egyptians fled against it; and Yahuah (LORD) overthrew the Egyptians in the midst of the sea.* The host massed for execution will, like Pharaoh''s, be turned back upon itself in the morning.'
  FROM cross_reference_threads t, cross_references x, _session417_3m05_lookup sv, _session417_3m05_lookup tv
 WHERE t.slug='3-maccabees-5-enemy-host-overthrown'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 14:28 — *And the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them.* The friends and army gathered to hate and destroy stand in the place of Pharaoh''s vanished host.'
  FROM cross_reference_threads t, cross_references x, _session417_3m05_lookup sv, _session417_3m05_lookup tv
 WHERE t.slug='3-maccabees-5-enemy-host-overthrown'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Hermon''s five hundred enraged beasts are no match for the One who alone can rout an army in a night.'
  FROM cross_reference_threads t, cross_references x, _session417_3m05_lookup sv, _session417_3m05_lookup tv
 WHERE t.slug='3-maccabees-5-enemy-host-overthrown'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-5-kings-heart-in-his-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 21:1 — *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* The king''s unflinching resolve is held fast and turned aside by the hand that channels every royal will.'
  FROM cross_reference_threads t, cross_references x, _session417_3m05_lookup sv, _session417_3m05_lookup tv
 WHERE t.slug='3-maccabees-5-kings-heart-in-his-hand'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 21:30 — *There is no wisdom nor understanding nor counsel against Yahuah (LORD).* The king''s repeated counsel to destroy keeps collapsing because no plotting can stand against the Father''s purpose to deliver.'
  FROM cross_reference_threads t, cross_references x, _session417_3m05_lookup sv, _session417_3m05_lookup tv
 WHERE t.slug='3-maccabees-5-kings-heart-in-his-hand'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=5 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 21:31 — *The horse is prepared against the day of battle: but safety is of Yahuah (LORD).* Hermon may ready the elephants for the day of slaughter, but the safety of the covenant people rests with Yahuah, not the strength of the beasts.'
  FROM cross_reference_threads t, cross_references x, _session417_3m05_lookup sv, _session417_3m05_lookup tv
 WHERE t.slug='3-maccabees-5-kings-heart-in-his-hand'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-5-providential-sleep-and-forgetting
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 6:1 — *On that night could not the king sleep, and he commanded to bring the book of records of the chronicles; and they were read before the king.* As one king is kept from sleep to save the Yahudim, this king is sent into sleep to the same providential end — the small turning that overthrows the gallows and the hippodrome alike.'
  FROM cross_reference_threads t, cross_references x, _session417_3m05_lookup sv, _session417_3m05_lookup tv
 WHERE t.slug='3-maccabees-5-providential-sleep-and-forgetting'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Esther 6:1 — *On that night could not the king sleep, and he commanded to bring the book of records of the chronicles; and they were read before the king.* The spirit of oblivion that empties this king''s memory of his own decree mirrors the sleepless night that began Haman''s undoing — providence governing a king''s restless or clouded mind.'
  FROM cross_reference_threads t, cross_references x, _session417_3m05_lookup sv, _session417_3m05_lookup tv
 WHERE t.slug='3-maccabees-5-providential-sleep-and-forgetting'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=5 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-5-defend-this-city-and-deliver
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:34 — *For I will defend this city, to save it, for mine own sake, and for my servant David''s sake.* The Father overthrows the evil purpose for his own sake and for David''s line, the same covenant ground on which Egypt''s remnant casts its plea.'
  FROM cross_reference_threads t, cross_references x, _session417_3m05_lookup sv, _session417_3m05_lookup tv
 WHERE t.slug='3-maccabees-5-defend-this-city-and-deliver'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 19:20 — *Then Isaiah the son of Amoz sent to Hezekiah, saying, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), That which thou hast prayed to me against Sennacherib king of Assyria I have heard.* The hands stretched out in mournful strains are heard by the same God who answered Hezekiah''s prayer against the blasphemer.'
  FROM cross_reference_threads t, cross_references x, _session417_3m05_lookup sv, _session417_3m05_lookup tv
 WHERE t.slug='3-maccabees-5-defend-this-city-and-deliver'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=5 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


-- ----- fragment: minion_3maccabees_06.sql (session417 3-maccabees 6) -----
-- Source anchor: apocrypha-charles-vol1/3-maccabees ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3m06 (view _session417_3m06_lookup). Sort band base 95125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session417_3m06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-maccabees-6-pharaoh-and-the-red-sea
  ('apocrypha-charles-vol1', '3-maccabees', 6, 4, 'canon', 'exodus', 14, 27, 'free', E'Exodus 14:27 — *And Moses stretched forth his hand over the sea, and the sea returned to his strength when the morning appeared; and the Egyptians fled against it; and Yahuah (LORD) overthrew the Egyptians in the midst of the sea.* The overthrow Eleazar rehearses in 3 Macc 6:4 is the very deed of the Sea.'),
  ('apocrypha-charles-vol1', '3-maccabees', 6, 4, 'canon', 'exodus', 14, 28, 'free', E'Exodus 14:28 — *And the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them.* ''His proud army'' overwhelmed (3 Macc 6:4) leaves not so much as one — the same Egypt twice undone.'),
  -- thread: 3-maccabees-6-sennacherib-the-angel-smites-the-host
  ('apocrypha-charles-vol1', '3-maccabees', 6, 5, 'canon', '2-kings', 19, 35, 'free', E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* The demolishing of Sennacherim (3 Macc 6:5) was wrought by one angel of the Father''s hosts.'),
  ('apocrypha-charles-vol1', '3-maccabees', 6, 5, 'canon', 'isaiah', 37, 36, 'free', E'Isaiah 37:36 — *Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Isaiah seals the same deliverance Eleazar pleads in 3 Macc 6:5 — the boaster against the holy city undone.'),
  -- thread: 3-maccabees-6-furnace-and-lions
  ('apocrypha-charles-vol1', '3-maccabees', 6, 6, 'canon', 'daniel', 3, 25, 'free', E'Daniel 3:25 — *He answered and said, Lo, I see four men loose, walking in the midst of the fire, and they have no hurt; and the form of the fourth is like the Son of Elohim (God).* The ''dewy coolness'' of 3 Macc 6:6 is the presence of the Formed-Son in the furnace with the three.'),
  ('apocrypha-charles-vol1', '3-maccabees', 6, 6, 'canon', 'daniel', 3, 28, 'free', E'Daniel 3:28 — *Then Nebuchadnezzar spake, and said, Blessed be the Elohim (God) of Shadrach, Meshach, and Abed-nego, who hath sent his angel, and delivered his servants that trusted in him, and have changed the king''s word, and yielded their bodies, that they might not serve nor worship any god, except their own Elohim (God).* The three ''rather than serve vain things'' (3 Macc 6:6) were delivered by the angel the Father sent.'),
  ('apocrypha-charles-vol1', '3-maccabees', 6, 7, 'canon', 'daniel', 6, 22, 'free', E'Daniel 6:22 — *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me; and also before thee, O king, have I done no hurt.* Daniel ''hurled through slander and envy as a prey to lions'' (3 Macc 6:7) was brought back unhurt by the sent angel.'),
  -- thread: 3-maccabees-6-jonah-from-the-deep
  ('apocrypha-charles-vol1', '3-maccabees', 6, 8, 'canon', 'jonah', 2, 1, 'free', E'Jonah 2:1 — *Then Jonah prayed unto Yahuah Elohav (the LORD his God) out of the fish''s belly,* The ''pining away in the belly of the sea-bred monster'' of 3 Macc 6:8 is Jonah''s cry from the deep.'),
  ('apocrypha-charles-vol1', '3-maccabees', 6, 8, 'canon', 'jonah', 2, 6, 'free', E'Jonah 2:6 — *I went down to the bottoms of the mountains; the earth with her bars was about me for ever: yet hast thou brought up my life from corruption, O Yahuah (LORD) my Elohim (God).* The Father who ''looked upon him'' (3 Macc 6:8) brought his life up from corruption.'),
  ('apocrypha-charles-vol1', '3-maccabees', 6, 8, 'canon', 'jonah', 2, 10, 'free', E'Jonah 2:10 — *And Yahuah (LORD) spake unto the fish, and it vomited out Jonah upon the dry land.* ''Recover him to the sight of his own'' (3 Macc 6:8) — the deep gives Jonah back at the Deliverer''s word.'),
  -- thread: 3-maccabees-6-two-angels-rout-the-host
  ('apocrypha-charles-vol1', '3-maccabees', 6, 18, 'canon', 'psalms', 34, 7, 'free', E'Psalms 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* The two dreadful angels of 3 Macc 6:18 are the standing promise of the angel-armies about the faithful.'),
  ('apocrypha-charles-vol1', '3-maccabees', 6, 18, 'apocrypha', '2-maccabees', 3, 24, 'extras', E'2 Maccabees 3:24 — *Now as he was there present himself with his guard about the treasury, Yahuah (God) of spirits, and the Prince of all power, caused a great apparition, so that all that presumed to come in with him were astonished at the power of Yahuah (God), and fainted, and were sore afraid.* The same Prince of all power who routed Heliodorus'' guard opens heaven over Ptolemy''s host (3 Macc 6:18).'),
  ('apocrypha-charles-vol1', '3-maccabees', 6, 18, 'apocrypha', '2-maccabees', 3, 26, 'extras', E'2 Maccabees 3:26 — *Moreover two other young men appeared before him, notable in strength, excellent in beauty, and comely in apparel, who stood by him on either side; and scourged him continually, and gave him many sore stripes.* The two angels of 3 Macc 6:18 echo the two manifest deliverers at the temple — it ain''t new.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session417_3m06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session417_3m06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-6-pharaoh-and-the-red-sea',
       E'Thou destroyedst Pharaoh — the same Deliverer at the Sea',
       E'Eleazar the aged priest opens his prayer by rehearsing the oldest deliverance of all: *Thou destroyedst Pharaoh, with his host of chariots, when that lord of this same Egypt was uplifted with lawless hardihood and loud-sounding tongue. Shedding the beams of thy mercy upon the race of Yashar''el (Israel), thou didst overwhelm him with his proud army.* (3 Maccabees 6:4). It ain''t new — Ptolemy of Egypt is only the latest Pharaoh, and the Father who once drowned the chariots will deliver again. The pattern is fixed in the Torah: *And Moses stretched forth his hand over the sea, and the sea returned to his strength when the morning appeared; and the Egyptians fled against it; and Yahuah (LORD) overthrew the Egyptians in the midst of the sea.* (Exodus 14:27) — *And the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them.* (Exodus 14:28). Same Egypt, same proud host, same overwhelming mercy poured out upon the covenant race.',
       sv.verse_id, ev.verse_id, 'extras', 95125
  FROM _session417_3m06_lookup sv, _session417_3m06_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=6 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=6 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-6-sennacherib-the-angel-smites-the-host',
       E'Sennacherim demolished — the angel smites the camp',
       E'Eleazar''s second remembrance: *When Sennacherim, the grievous king of the Assyrians, glorying in his countless hosts, had subdued the whole land with his spear, and was lifting himself against thy holy city, with boastings grievous to be endured, thou, O Yahuah (Lord), didst demolish him and didst shew forth thy might to many nations.* (3 Maccabees 6:5). The boasting tyrant against the holy city is no new thing; it ain''t new. So it was in Hezekiah''s day: *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* (2 Kings 19:35) — and Isaiah records the same single stroke of the angel-armies of the Father: *Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* (Isaiah 37:36). One angel, one night, the countless host demolished.',
       sv.verse_id, ev.verse_id, 'extras', 95128
  FROM _session417_3m06_lookup sv, _session417_3m06_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=6 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=6 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-6-furnace-and-lions',
       E'The three in the furnace, Daniel in the lions'' den',
       E'Eleazar presses on through the recent deliverances of the exile: *When the three friends in the land of Babylon of their own will exposed their lives to the fire rather than serve vain things, thou didst send a dewy coolness through the fiery furnace, and bring the fire upon all their adversaries.* (3 Maccabees 6:6) — *It was thou who, when Daniel was hurled, through slander and envy, as a prey to lions down below, didst bring him back again unhurt to light.* (3 Maccabees 6:7). The Yahudim of Egypt face the same choice the three faced — death rather than the vain idols — and the same Deliverer answers. In the furnace a fourth appeared: *He answered and said, Lo, I see four men loose, walking in the midst of the fire, and they have no hurt; and the form of the fourth is like the Son of Elohim (God).* (Daniel 3:25) — the Formed-Son sent by the Father — *who hath sent his angel, and delivered his servants that trusted in him* (Daniel 3:28). And in the den it was the selfsame angel: *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me; and also before thee, O king, have I done no hurt.* (Daniel 6:22). It ain''t new — slander and envy hurl the faithful down, and the Father''s angel brings them back unhurt to light.',
       sv.verse_id, ev.verse_id, 'extras', 95131
  FROM _session417_3m06_lookup sv, _session417_3m06_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-6-jonah-from-the-deep',
       E'Jonah recovered from the belly of the deep',
       E'Eleazar''s last remembrance reaches into the sea itself: *When Jonah was pining away in the belly of the sea-bred monster, thou didst look upon him, O Father, and recover him to the sight of his own.* (3 Maccabees 6:8). No grave is too deep for the Father''s reach — it ain''t new. So Jonah prayed and was heard: *Then Jonah prayed unto Yahuah Elohav (the LORD his God) out of the fish''s belly,* (Jonah 2:1) — *I went down to the bottoms of the mountains; the earth with her bars was about me for ever: yet hast thou brought up my life from corruption, O Yahuah (LORD) my Elohim (God).* (Jonah 2:6) — and at the word of the Deliverer the deep gave him up: *And Yahuah (LORD) spake unto the fish, and it vomited out Jonah upon the dry land.* (Jonah 2:10). The same Father who looked upon Jonah looks now upon the Yahudim of Egypt, recovering his own from the very mouth of Hades.',
       sv.verse_id, ev.verse_id, 'extras', 95134
  FROM _session417_3m06_lookup sv, _session417_3m06_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-6-two-angels-rout-the-host',
       E'Two angels appear — the angel-armies encamp round about',
       E'The prayer is answered in the hippodrome: *Then the all-glorious, all-powerful, and true Elohim (God), displayed his holy countenance, and opened the gates of heaven, from which two angels, dreadful of form, came down, and were visible to all but the Yahudim (Jews).* (3 Maccabees 6:18) — *They turned back the animals upon the armed forces which followed them; and the animals trod them down, and destroyed them.* (3 Maccabees 6:21). It ain''t new: the Father''s angel-hosts have ever encamped about his covenant people — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* (Psalms 34:7). And it was so at the temple in the days of Heliodorus, when two visible deliverers stood by: *Moreover two other young men appeared before him, notable in strength, excellent in beauty, and comely in apparel, who stood by him on either side; and scourged him continually, and gave him many sore stripes.* (2 Maccabees 3:26) — *Now as he was there present himself with his guard about the treasury, Yahuah (God) of spirits, and the Prince of all power, caused a great apparition* (2 Maccabees 3:24). The same Prince of all power, the same dreadful host, routs Ptolemy''s army as it routed Heliodorus'' guard.',
       sv.verse_id, ev.verse_id, 'extras', 95137
  FROM _session417_3m06_lookup sv, _session417_3m06_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=6 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=6 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-maccabees-6-pharaoh-and-the-red-sea
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 14:27 — *And Moses stretched forth his hand over the sea, and the sea returned to his strength when the morning appeared; and the Egyptians fled against it; and Yahuah (LORD) overthrew the Egyptians in the midst of the sea.* The overthrow Eleazar rehearses in 3 Macc 6:4 is the very deed of the Sea.'
  FROM cross_reference_threads t, cross_references x, _session417_3m06_lookup sv, _session417_3m06_lookup tv
 WHERE t.slug='3-maccabees-6-pharaoh-and-the-red-sea'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 14:28 — *And the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them.* ''His proud army'' overwhelmed (3 Macc 6:4) leaves not so much as one — the same Egypt twice undone.'
  FROM cross_reference_threads t, cross_references x, _session417_3m06_lookup sv, _session417_3m06_lookup tv
 WHERE t.slug='3-maccabees-6-pharaoh-and-the-red-sea'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-6-sennacherib-the-angel-smites-the-host
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:35 — *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* The demolishing of Sennacherim (3 Macc 6:5) was wrought by one angel of the Father''s hosts.'
  FROM cross_reference_threads t, cross_references x, _session417_3m06_lookup sv, _session417_3m06_lookup tv
 WHERE t.slug='3-maccabees-6-sennacherib-the-angel-smites-the-host'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 37:36 — *Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses.* Isaiah seals the same deliverance Eleazar pleads in 3 Macc 6:5 — the boaster against the holy city undone.'
  FROM cross_reference_threads t, cross_references x, _session417_3m06_lookup sv, _session417_3m06_lookup tv
 WHERE t.slug='3-maccabees-6-sennacherib-the-angel-smites-the-host'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-6-furnace-and-lions
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 3:25 — *He answered and said, Lo, I see four men loose, walking in the midst of the fire, and they have no hurt; and the form of the fourth is like the Son of Elohim (God).* The ''dewy coolness'' of 3 Macc 6:6 is the presence of the Formed-Son in the furnace with the three.'
  FROM cross_reference_threads t, cross_references x, _session417_3m06_lookup sv, _session417_3m06_lookup tv
 WHERE t.slug='3-maccabees-6-furnace-and-lions'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 3:28 — *Then Nebuchadnezzar spake, and said, Blessed be the Elohim (God) of Shadrach, Meshach, and Abed-nego, who hath sent his angel, and delivered his servants that trusted in him, and have changed the king''s word, and yielded their bodies, that they might not serve nor worship any god, except their own Elohim (God).* The three ''rather than serve vain things'' (3 Macc 6:6) were delivered by the angel the Father sent.'
  FROM cross_reference_threads t, cross_references x, _session417_3m06_lookup sv, _session417_3m06_lookup tv
 WHERE t.slug='3-maccabees-6-furnace-and-lions'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 6:22 — *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me; and also before thee, O king, have I done no hurt.* Daniel ''hurled through slander and envy as a prey to lions'' (3 Macc 6:7) was brought back unhurt by the sent angel.'
  FROM cross_reference_threads t, cross_references x, _session417_3m06_lookup sv, _session417_3m06_lookup tv
 WHERE t.slug='3-maccabees-6-furnace-and-lions'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-6-jonah-from-the-deep
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jonah 2:1 — *Then Jonah prayed unto Yahuah Elohav (the LORD his God) out of the fish''s belly,* The ''pining away in the belly of the sea-bred monster'' of 3 Macc 6:8 is Jonah''s cry from the deep.'
  FROM cross_reference_threads t, cross_references x, _session417_3m06_lookup sv, _session417_3m06_lookup tv
 WHERE t.slug='3-maccabees-6-jonah-from-the-deep'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jonah 2:6 — *I went down to the bottoms of the mountains; the earth with her bars was about me for ever: yet hast thou brought up my life from corruption, O Yahuah (LORD) my Elohim (God).* The Father who ''looked upon him'' (3 Macc 6:8) brought his life up from corruption.'
  FROM cross_reference_threads t, cross_references x, _session417_3m06_lookup sv, _session417_3m06_lookup tv
 WHERE t.slug='3-maccabees-6-jonah-from-the-deep'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jonah 2:10 — *And Yahuah (LORD) spake unto the fish, and it vomited out Jonah upon the dry land.* ''Recover him to the sight of his own'' (3 Macc 6:8) — the deep gives Jonah back at the Deliverer''s word.'
  FROM cross_reference_threads t, cross_references x, _session417_3m06_lookup sv, _session417_3m06_lookup tv
 WHERE t.slug='3-maccabees-6-jonah-from-the-deep'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-6-two-angels-rout-the-host
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* The two dreadful angels of 3 Macc 6:18 are the standing promise of the angel-armies about the faithful.'
  FROM cross_reference_threads t, cross_references x, _session417_3m06_lookup sv, _session417_3m06_lookup tv
 WHERE t.slug='3-maccabees-6-two-angels-rout-the-host'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 3:24 — *Now as he was there present himself with his guard about the treasury, Yahuah (God) of spirits, and the Prince of all power, caused a great apparition, so that all that presumed to come in with him were astonished at the power of Yahuah (God), and fainted, and were sore afraid.* The same Prince of all power who routed Heliodorus'' guard opens heaven over Ptolemy''s host (3 Macc 6:18).'
  FROM cross_reference_threads t, cross_references x, _session417_3m06_lookup sv, _session417_3m06_lookup tv
 WHERE t.slug='3-maccabees-6-two-angels-rout-the-host'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 3:26 — *Moreover two other young men appeared before him, notable in strength, excellent in beauty, and comely in apparel, who stood by him on either side; and scourged him continually, and gave him many sore stripes.* The two angels of 3 Macc 6:18 echo the two manifest deliverers at the temple — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session417_3m06_lookup sv, _session417_3m06_lookup tv
 WHERE t.slug='3-maccabees-6-two-angels-rout-the-host'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=3 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


-- ----- fragment: minion_3maccabees_07.sql (session417 3-maccabees 7) -----
-- Source anchor: apocrypha-charles-vol1/3-maccabees ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3m07 (view _session417_3m07_lookup). Sort band base 95150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session417_3m07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-maccabees-7-the-king-reverses-his-decree
  ('apocrypha-charles-vol1', '3-maccabees', 7, 1, 'canon', 'esther', 9, 1, 'free', E'Esther 9:1 — *Now in the twelfth month, that is, the month Adar, on the thirteenth day of the same, when the king’s commandment and his decree drew near to be put in execution, in the day that the enemies of the Yahudim (Jews) hoped to have power over them, (though it was turned to the contrary, that the Yahudim (Jews) had rule over them that hated them;)* The day appointed for destruction is turned to the contrary, exactly as the king''s letter reverses his own decree in 3 Macc 7.'),
  ('apocrypha-charles-vol1', '3-maccabees', 7, 9, 'canon', 'esther', 9, 25, 'free', E'Esther 9:25 — *But when Esther came before the king, he commanded by letters that his wicked device, which he devised against the Yahudim (Jews), should return upon his own head, and that he and his sons should be hanged on the gallows.* The evil designed against the covenant people falls back on its author, as Ptolemy warns it would in 3 Macc 7:9.'),
  -- thread: 3-maccabees-7-judgment-on-the-apostates
  ('apocrypha-charles-vol1', '3-maccabees', 7, 10, 'canon', 'esther', 9, 2, 'free', E'Esther 9:2 — *The Yahudim (Jews) gathered themselves together in their cities throughout all the provinces of the king Ahasuerus, to lay hand on such as sought their hurt: and no man could withstand them; for the fear of them fell upon all people.* The same authorized self-defence of the covenant people that 3 Macc 7:10-12 grants against the apostates.'),
  ('apocrypha-charles-vol1', '3-maccabees', 7, 15, 'canon', 'esther', 9, 16, 'free', E'Esther 9:16 — *But the other Yahudim (Jews) that were in the king’s provinces gathered themselves together, and stood for their lives, and had rest from their enemies, and slew of their foes seventy and five thousand, but they laid not their hands on the prey,* The same pattern of striking down the enemies and then having rest that closes the deliverance in 3 Macc 7:15-16.'),
  -- thread: 3-maccabees-7-the-eternal-saviour-of-yasharel
  ('apocrypha-charles-vol1', '3-maccabees', 7, 16, 'canon', 'isaiah', 49, 26, 'free', E'Isaiah 49:26 — *And I will feed them that oppress thee with their own flesh; and they shall be drunken with their own blood, as with sweet wine: and all flesh shall know that I Yahuah (LORD) am thy Saviour and thy Redeemer, the mighty One of Jacob.* The eternal Saviour of Yashar''el whom they hymn in 3 Macc 7:16 is the one who repays the oppressor and redeems His own.'),
  ('apocrypha-charles-vol1', '3-maccabees', 7, 16, 'canon', 'isaiah', 49, 7, 'free', E'Isaiah 49:7 — *Thus saith Yahuah (LORD), the Redeemer of Yashar''el (Israel), and his Holy One, to him whom man despiseth, to him whom the nation abhorreth, to a servant of rulers, Kings shall see and arise, princes also shall worship, because of Yahuah (LORD) that is faithful, and the Holy One of Yashar''el (Israel), and he shall choose thee.* The Redeemer of Yashar''el — the same title sung in 3 Macc 7:16 and sealed in 7:23.'),
  ('apocrypha-charles-vol1', '3-maccabees', 7, 16, 'canon', 'psalms', 111, 4, 'free', E'Psalms 111:4 — *He hath made his wonderful works to be remembered: Yahuah (LORD) is gracious and full of compassion.* The deliverance is set to song and remembrance precisely because His wonders are made to be remembered, as in 3 Macc 7:16.'),
  -- thread: 3-maccabees-7-days-of-joy-registered-as-a-memorial
  ('apocrypha-charles-vol1', '3-maccabees', 7, 19, 'canon', 'esther', 9, 22, 'free', E'Esther 9:22 — *As the days wherein the Yahudim (Jews) rested from their enemies, and the month which was turned unto them from sorrow to joy, and from mourning into a good day: that they should make them days of feasting and joy, and of sending portions one to another, and gifts to the poor.* The days of joyfulness kept in 3 Macc 7:19 mirror the Purim days of feasting and joy the people themselves appointed.'),
  ('apocrypha-charles-vol1', '3-maccabees', 7, 20, 'canon', 'esther', 9, 28, 'free', E'Esther 9:28 — *And that these days should be remembered and kept throughout every generation, every family, every province, and every city; and that these days of Purim should not fail from among the Yahudim (Jews), nor the memorial of them perish from their seed.* The deliverance registered as sacred on a pillar in 3 Macc 7:20 is the same kind of perpetual memorial the Jews ordained for Purim — a freely instituted remembrance, not a commanded feast of the law.'),
  ('apocrypha-charles-vol1', '3-maccabees', 7, 17, 'canon', 'exodus', 12, 14, 'free', E'Exodus 12:14 — *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* The first memorial of deliverance out of Egypt stands behind the seven-day feast of deliverance kept at Ptolemais in 3 Macc 7:17.'),
  -- thread: 3-maccabees-7-blessed-be-the-redeemer-of-yasharel
  ('apocrypha-charles-vol1', '3-maccabees', 7, 23, 'canon', 'isaiah', 44, 6, 'free', E'Isaiah 44:6 — *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* The Redeemer of Yashar''el blessed unto everlasting in 3 Macc 7:23 is the King and Redeemer who is the first and the last.'),
  ('apocrypha-charles-vol1', '3-maccabees', 7, 23, 'canon', 'isaiah', 44, 22, 'free', E'Isaiah 44:22 — *I have blotted out, as a thick cloud, thy transgressions, and, as a cloud, thy sins: return unto me; for I have redeemed thee.* The Redeemer of Yashar''el is the one who redeems by blotting out sin and calling His people home, the salvation celebrated in 3 Macc 7:22-23.'),
  ('apocrypha-charles-vol1', '3-maccabees', 7, 22, 'canon', 'psalms', 111, 9, 'free', E'Psalms 111:9 — *He sent redemption unto his people: he hath commanded his covenant for ever: holy and reverend is his name.* The wonders wrought for their salvation in 3 Macc 7:22 are the sent redemption of the covenant Redeemer whose name is holy.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session417_3m07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session417_3m07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-7-the-king-reverses-his-decree',
       E'The king''s letter — the decree turned to the contrary',
       E'The king who had drugged the elephants to trample them now writes for them: *Certain of our friends did of malice vehemently urge us to punish the Yahudim (Jews) of our realm in a body, with the infliction of a monstrous punishment* (3 Maccabees 7:3), confessing *Finding that the Elohim (God) of heaven cast a shield of protection over the Yahudim (Jews) so as to preserve them, and that he fought for them as a father always fights for his sons* (3 Maccabees 7:6). It ain''t new — this is Esther''s reversal again, where the slander that *their laws are diverse from all people* and the decree of death were overturned: *though it was turned to the contrary, that the Yahudim (Jews) had rule over them that hated them* (Esther 9:1). The wicked device returns on the deviser''s own head: *he commanded by letters that his wicked device, which he devised against the Yahudim (Jews), should return upon his own head* (Esther 9:25). The Father fights for His sons — the deliverance is His mercy, not a reward earned by the king.',
       sv.verse_id, ev.verse_id, 'extras', 95150
  FROM _session417_3m07_lookup sv, _session417_3m07_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=7 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-7-judgment-on-the-apostates',
       E'Power to punish those who transgressed the law of Elohim',
       E'The delivered did not first feast — they asked leave to purge the covenant: *They petitioned the king to be allowed to inflict fitting punishment upon those of their race who had willingly transgressed the holy Elohim (God), and the law of Elohim (God)* (3 Maccabees 7:10), reasoning *that men who had for their bellies'' sake transgressed the ordinances of Elohim (God), would never be faithful to the interests of the king* (3 Maccabees 7:11). It ain''t new — in Esther''s deliverance the people first laid hand on those who sought their hurt: *The Yahudim (Jews) gathered themselves together in their cities throughout all the provinces of the king Ahasuerus, to lay hand on such as sought their hurt: and no man could withstand them; for the fear of them fell upon all people* (Esther 9:2), and *the other Yahudim (Jews) that were in the king''s provinces gathered themselves together, and stood for their lives, and had rest from their enemies* (Esther 9:16). The covenant is guarded against those who would break it from within, the law of Elohim still standing as the measure of faithfulness.',
       sv.verse_id, ev.verse_id, 'extras', 95153
  FROM _session417_3m07_lookup sv, _session417_3m07_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=7 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=7 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-7-the-eternal-saviour-of-yasharel',
       E'The eternal Saviour of Yashar''el — songs of deliverance',
       E'Garlanded and singing, they go up: *They themselves having held fast their Elohim (God) unto death, and having enjoyed a full deliverance, departed from the city garlanded with sweet-flowered wreaths of every kind. Uttering exclamations of joy, with songs of praise, and melodious hymns they thanked the Elohim (God) of their fathers, the eternal Saviour of Yashar''el (Israel)* (3 Maccabees 7:16). It ain''t new — He who delivered Egypt is the one Saviour and Redeemer of His people: *all flesh shall know that I Yahuah (LORD) am thy Saviour and thy Redeemer, the mighty One of Jacob* (Isaiah 49:26); *Thus saith Yahuah (LORD), the Redeemer of Yashar''el (Israel), and his Holy One* (Isaiah 49:7). The works of deliverance are made to be remembered: *He hath made his wonderful works to be remembered: Yahuah (LORD) is gracious and full of compassion* (Psalms 111:4). The eternal Saviour of Yashar''el is the Formed-Son Redeemer sent by the Father to gather the covenant people.',
       sv.verse_id, ev.verse_id, 'extras', 95156
  FROM _session417_3m07_lookup sv, _session417_3m07_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=7 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=7 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-7-days-of-joy-registered-as-a-memorial',
       E'Seven days kept — the feast of deliverance made a memorial',
       E'At Ptolemais they wait seven days and keep a feast: *Having arrived at Ptolemais, called from the specialty of that district Rose-bearing, where the fleet, in accordance with the general wish, waited for them seven days* (3 Maccabees 7:17), and *they determined to keep these days during their sojourn as days of joyfulness* (3 Maccabees 7:19), *These they registered as sacred upon a pillar, when they had dedicated the place of their festivity to be one of prayer* (3 Maccabees 7:20). It ain''t new — this is Purim''s pattern, a remembrance the people themselves ordained: *that they should make them days of feasting and joy, and of sending portions one to another, and gifts to the poor* (Esther 9:22), *that these days should be remembered and kept throughout every generation, every family, every province, and every city; and that these days of Purim should not fail from among the Yahudim (Jews), nor the memorial of them perish from their seed* (Esther 9:28). And behind both stands the first memorial of deliverance from Egypt: *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever* (Exodus 12:14). The feast they institute is a freely ordained remembrance of mercy — like Purim, not a Leviticus-23 commanded moed.',
       sv.verse_id, ev.verse_id, 'extras', 95159
  FROM _session417_3m07_lookup sv, _session417_3m07_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=7 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=7 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-maccabees-7-blessed-be-the-redeemer-of-yasharel',
       E'Blessed be the Redeemer of Yashar''el unto everlasting',
       E'The book seals itself with the highest praise: *For the greatest Elohim (God) wrought with perfectness wonders for their salvation* (3 Maccabees 7:22), *Blessed be the Redeemer of Yashar''el (Israel) unto everlasting. Amen* (3 Maccabees 7:23). It ain''t new — this is the very name Yahuah claims over His covenant people, the first and the last: *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God)* (Isaiah 44:6). He is the Redeemer who blots out transgression and gathers His own: *I have blotted out, as a thick cloud, thy transgressions, and, as a cloud, thy sins: return unto me; for I have redeemed thee* (Isaiah 44:22); *He sent redemption unto his people: he hath commanded his covenant for ever: holy and reverend is his name* (Psalms 111:9). The Redeemer of Yashar''el — the Formed-Son Deliverer of the covenant people, two houses gathered — is blessed unto everlasting; the salvation is the Father''s mercy.',
       sv.verse_id, ev.verse_id, 'extras', 95162
  FROM _session417_3m07_lookup sv, _session417_3m07_lookup ev
 WHERE sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=7 AND sv.verse_number=22
   AND ev.edition_slug='apocrypha-charles-vol1' AND ev.book_slug='3-maccabees' AND ev.chapter_number=7 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-maccabees-7-the-king-reverses-his-decree
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 9:1 — *Now in the twelfth month, that is, the month Adar, on the thirteenth day of the same, when the king’s commandment and his decree drew near to be put in execution, in the day that the enemies of the Yahudim (Jews) hoped to have power over them, (though it was turned to the contrary, that the Yahudim (Jews) had rule over them that hated them;)* The day appointed for destruction is turned to the contrary, exactly as the king''s letter reverses his own decree in 3 Macc 7.'
  FROM cross_reference_threads t, cross_references x, _session417_3m07_lookup sv, _session417_3m07_lookup tv
 WHERE t.slug='3-maccabees-7-the-king-reverses-his-decree'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Esther 9:25 — *But when Esther came before the king, he commanded by letters that his wicked device, which he devised against the Yahudim (Jews), should return upon his own head, and that he and his sons should be hanged on the gallows.* The evil designed against the covenant people falls back on its author, as Ptolemy warns it would in 3 Macc 7:9.'
  FROM cross_reference_threads t, cross_references x, _session417_3m07_lookup sv, _session417_3m07_lookup tv
 WHERE t.slug='3-maccabees-7-the-king-reverses-his-decree'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=9 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-7-judgment-on-the-apostates
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 9:2 — *The Yahudim (Jews) gathered themselves together in their cities throughout all the provinces of the king Ahasuerus, to lay hand on such as sought their hurt: and no man could withstand them; for the fear of them fell upon all people.* The same authorized self-defence of the covenant people that 3 Macc 7:10-12 grants against the apostates.'
  FROM cross_reference_threads t, cross_references x, _session417_3m07_lookup sv, _session417_3m07_lookup tv
 WHERE t.slug='3-maccabees-7-judgment-on-the-apostates'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Esther 9:16 — *But the other Yahudim (Jews) that were in the king’s provinces gathered themselves together, and stood for their lives, and had rest from their enemies, and slew of their foes seventy and five thousand, but they laid not their hands on the prey,* The same pattern of striking down the enemies and then having rest that closes the deliverance in 3 Macc 7:15-16.'
  FROM cross_reference_threads t, cross_references x, _session417_3m07_lookup sv, _session417_3m07_lookup tv
 WHERE t.slug='3-maccabees-7-judgment-on-the-apostates'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=9 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-7-the-eternal-saviour-of-yasharel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:26 — *And I will feed them that oppress thee with their own flesh; and they shall be drunken with their own blood, as with sweet wine: and all flesh shall know that I Yahuah (LORD) am thy Saviour and thy Redeemer, the mighty One of Jacob.* The eternal Saviour of Yashar''el whom they hymn in 3 Macc 7:16 is the one who repays the oppressor and redeems His own.'
  FROM cross_reference_threads t, cross_references x, _session417_3m07_lookup sv, _session417_3m07_lookup tv
 WHERE t.slug='3-maccabees-7-the-eternal-saviour-of-yasharel'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=7 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 49:7 — *Thus saith Yahuah (LORD), the Redeemer of Yashar''el (Israel), and his Holy One, to him whom man despiseth, to him whom the nation abhorreth, to a servant of rulers, Kings shall see and arise, princes also shall worship, because of Yahuah (LORD) that is faithful, and the Holy One of Yashar''el (Israel), and he shall choose thee.* The Redeemer of Yashar''el — the same title sung in 3 Macc 7:16 and sealed in 7:23.'
  FROM cross_reference_threads t, cross_references x, _session417_3m07_lookup sv, _session417_3m07_lookup tv
 WHERE t.slug='3-maccabees-7-the-eternal-saviour-of-yasharel'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=7 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 111:4 — *He hath made his wonderful works to be remembered: Yahuah (LORD) is gracious and full of compassion.* The deliverance is set to song and remembrance precisely because His wonders are made to be remembered, as in 3 Macc 7:16.'
  FROM cross_reference_threads t, cross_references x, _session417_3m07_lookup sv, _session417_3m07_lookup tv
 WHERE t.slug='3-maccabees-7-the-eternal-saviour-of-yasharel'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=7 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=111 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-7-days-of-joy-registered-as-a-memorial
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 9:22 — *As the days wherein the Yahudim (Jews) rested from their enemies, and the month which was turned unto them from sorrow to joy, and from mourning into a good day: that they should make them days of feasting and joy, and of sending portions one to another, and gifts to the poor.* The days of joyfulness kept in 3 Macc 7:19 mirror the Purim days of feasting and joy the people themselves appointed.'
  FROM cross_reference_threads t, cross_references x, _session417_3m07_lookup sv, _session417_3m07_lookup tv
 WHERE t.slug='3-maccabees-7-days-of-joy-registered-as-a-memorial'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=9 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Esther 9:28 — *And that these days should be remembered and kept throughout every generation, every family, every province, and every city; and that these days of Purim should not fail from among the Yahudim (Jews), nor the memorial of them perish from their seed.* The deliverance registered as sacred on a pillar in 3 Macc 7:20 is the same kind of perpetual memorial the Jews ordained for Purim — a freely instituted remembrance, not a commanded feast of the law.'
  FROM cross_reference_threads t, cross_references x, _session417_3m07_lookup sv, _session417_3m07_lookup tv
 WHERE t.slug='3-maccabees-7-days-of-joy-registered-as-a-memorial'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=7 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=9 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 12:14 — *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* The first memorial of deliverance out of Egypt stands behind the seven-day feast of deliverance kept at Ptolemais in 3 Macc 7:17.'
  FROM cross_reference_threads t, cross_references x, _session417_3m07_lookup sv, _session417_3m07_lookup tv
 WHERE t.slug='3-maccabees-7-days-of-joy-registered-as-a-memorial'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-maccabees-7-blessed-be-the-redeemer-of-yasharel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:6 — *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* The Redeemer of Yashar''el blessed unto everlasting in 3 Macc 7:23 is the King and Redeemer who is the first and the last.'
  FROM cross_reference_threads t, cross_references x, _session417_3m07_lookup sv, _session417_3m07_lookup tv
 WHERE t.slug='3-maccabees-7-blessed-be-the-redeemer-of-yasharel'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=7 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:22 — *I have blotted out, as a thick cloud, thy transgressions, and, as a cloud, thy sins: return unto me; for I have redeemed thee.* The Redeemer of Yashar''el is the one who redeems by blotting out sin and calling His people home, the salvation celebrated in 3 Macc 7:22-23.'
  FROM cross_reference_threads t, cross_references x, _session417_3m07_lookup sv, _session417_3m07_lookup tv
 WHERE t.slug='3-maccabees-7-blessed-be-the-redeemer-of-yasharel'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=7 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 111:9 — *He sent redemption unto his people: he hath commanded his covenant for ever: holy and reverend is his name.* The wonders wrought for their salvation in 3 Macc 7:22 are the sent redemption of the covenant Redeemer whose name is holy.'
  FROM cross_reference_threads t, cross_references x, _session417_3m07_lookup sv, _session417_3m07_lookup tv
 WHERE t.slug='3-maccabees-7-blessed-be-the-redeemer-of-yasharel'
   AND sv.edition_slug='apocrypha-charles-vol1' AND sv.book_slug='3-maccabees' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=111 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
