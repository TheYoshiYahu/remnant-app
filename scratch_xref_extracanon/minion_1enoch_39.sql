-- ----- fragment: minion_1enoch_39.sql (session250 1-enoch 39) -----
-- Source anchor: enoch/1-enoch ch39. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en39 (view _session250_en39_lookup). Sort band base 50950, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en39_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-39-dwellings-of-the-elect
  ('enoch', '1-enoch', 39, 3, 'canon', 'john', 14, 2, 'free', E'John 14:2 — *In my Father''s house are many mansions: if it were not so, I would have told you. I go to prepare a place for you.* Yahusha names the very dwelling-places Enoch''s spirit longed for in 1 Enoch 39:3, and says He goes ahead to prepare them.'),
  ('enoch', '1-enoch', 39, 4, 'canon', 'revelation', 7, 15, 'free', E'Revelation 7:15 — *Therefore are they before the throne of Elohim (God), and serve him day and night in his temple: and he that sitteth on the throne shall dwell among them.* John sees the righteous lodged with the holy before the throne, the same resting-places among His angels that Enoch saw in 1 Enoch 39:4.'),
  ('enoch', '1-enoch', 39, 6, 'canon', 'revelation', 21, 3, 'free', E'Revelation 21:3 — *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* The Father dwelling un-separated with His people in 1 Enoch 39:6 is the same tabernacling John hears announced over the renewed earth.'),
  -- thread: 1-enoch-39-elect-one-on-the-throne-of-glory
  ('enoch', '1-enoch', 39, 5, 'canon', 'isaiah', 42, 1, 'free', E'Isaiah 42:1 — *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him: he shall bring forth judgment to the Gentiles.* Isaiah''s "mine elect" is Enoch''s "Elect One" of 1 Enoch 39:5 — the chosen Servant in whom the Father delights, on whom the Spirit rests.'),
  ('enoch', '1-enoch', 39, 5, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel sees one LIKE the Son of Adam brought before the Ancient of days; Enoch NAMES that same Elect One whose voice sounds from the throne of glory in 1 Enoch 39:5 — keep the "like," for the figure resembles mortal-man having taken flesh.'),
  ('enoch', '1-enoch', 39, 5, 'canon', 'matthew', 25, 31, 'free', E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* The Elect One''s throne of glory in 1 Enoch 39:5 is where the Son of Adam sits in His glory to judge.'),
  ('enoch', '1-enoch', 39, 5, 'enoch', '1-enoch', 45, 3, 'extras', E'1 Enoch 45:3 — *On that day Mine Elect One shall sit on the throne of glory and shall try their works, and their place shall be nothing and their dwelling shall be with the faithless.* The same Elect One on the same throne of glory; what He speaks from it in 1 Enoch 39:5 He executes here as judgement of works.'),
  -- thread: 1-enoch-39-righteousness-flows-like-water
  ('enoch', '1-enoch', 39, 4, 'canon', 'amos', 5, 24, 'free', E'Amos 5:24 — *But let judgment run down as waters, and righteousness as a mighty stream.* Amos''s flowing waters of righteousness are the very stream Enoch sees pour before the holy in 1 Enoch 39:4.'),
  ('enoch', '1-enoch', 39, 4, 'canon', 'revelation', 22, 1, 'free', E'Revelation 22:1 — *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* The water-like righteousness flowing in 1 Enoch 39:4 has its source in the river that proceeds from the throne of the Father and the Lamb.'),
  ('enoch', '1-enoch', 39, 4, 'enoch', '1-enoch', 48, 1, 'extras', E'1 Enoch 48:1 — *And in that place I saw the fountain of righteousness Which was inexhaustible: And around it were many fountains of wisdom: And all the thirsty drank of them, And were filled with wisdom, And their dwellings were with the righteous and holy and elect.* The righteousness flowing like water in 1 Enoch 39:4 draws from this inexhaustible fountain that Enoch sees later in the Parables.'),
  -- thread: 1-enoch-39-light-of-the-righteous-shines
  ('enoch', '1-enoch', 39, 9, 'canon', 'daniel', 12, 3, 'free', E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* Daniel''s shining of the wise at the resurrection is the light of the righteous that blazes like the sun in 1 Enoch 39:9.'),
  ('enoch', '1-enoch', 39, 9, 'canon', 'matthew', 13, 43, 'free', E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Yahusha names the same sun-bright shining of the righteous that Enoch sees in 1 Enoch 39:9, set at the harvest when the sinners-as-darkness are separated out.'),
  ('enoch', '1-enoch', 39, 8, 'canon', 'psalms', 114, 4, 'free', E'Psalm 114:4 — *The mountains skipped like rams, and the little hills like lambs.* The Exodus exultation Enoch borrows for the day of victory in 1 Enoch 39:8, where the mountains leap like rams and the righteous are victorious in His name.'),
  -- thread: 1-enoch-39-four-presences-around-the-throne
  ('enoch', '1-enoch', 39, 11, 'canon', 'revelation', 4, 8, 'free', E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* John''s four living creatures praising ceaselessly about the throne are Enoch''s four presences who surround the throne of glory and praise in 1 Enoch 39:11.'),
  ('enoch', '1-enoch', 39, 16, 'canon', 'revelation', 12, 10, 'free', E'Revelation 12:10 — *And I heard a loud voice saying in heaven, Now is come salvation, and strength, and the kingdom of our Elohim (God), and the power of his Messiah (Christ): for the accuser of our brethren is cast down, which accused them before our Elohim (God) day and night.* The fourth presence in 1 Enoch 39:16 fends off the Satans who would accuse the dwellers of earth; John proclaims that accuser finally cast down.'),
  ('enoch', '1-enoch', 39, 16, 'canon', 'zechariah', 3, 1, 'free', E'Zechariah 3:1 — *And he shewed me Joshua the high priest standing before the angel of Yahuah (LORD), and Satan standing at his right hand to resist him.* The accusing adversary the fourth presence forbids from the throne in 1 Enoch 39:16 is the same Satan who stands to accuse in Zechariah''s heavenly court.'),
  ('enoch', '1-enoch', 39, 15, 'apocrypha', 'tobit', 12, 15, 'extras', E'Tobit 12:15 — *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* Raphael, named among Enoch''s four presences, holds the office Enoch''s third voice performs in 1 Enoch 39:15 — praying and presenting the supplications of those on earth before the Holy One.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en39_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en39_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-39-dwellings-of-the-elect',
       E'The dwelling-places of the righteous and the elect',
       E'Enoch''s spirit is drawn upward: *And I saw the dwellings of the elect and the dwellings of the holy, and my spirit longed for those dwellings.* (1 Enoch 39:3), and there *mine eyes saw their dwellings with His righteous angels, and their resting-places with the holy* (1 Enoch 39:4). This is the same hope Yahusha names to His own — *In my Father''s house are many mansions: if it were not so, I would have told you. I go to prepare a place for you.* (John 14:2) — and the same scene John is shown at the throne: *Therefore are they before the throne of Elohim (God), and serve him day and night in his temple: and he that sitteth on the throne shall dwell among them.* (Revelation 7:15). The promise is not escape but indwelling-with: *And in those days the elect shall dwell upon the earth, and the righteous shall dwell with them, and they shall not be separated.* (1 Enoch 39:6), which John hears proclaimed over the renewed earth — *Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people* (Revelation 21:3). The elect here are a people gathered, not a self-chosen class; the dwelling is prepared for them before they arrive.',
       sv.verse_id, ev.verse_id, 'extras', 50950
  FROM _session250_en39_lookup sv, _session250_en39_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=39 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-39-elect-one-on-the-throne-of-glory',
       E'The Elect One''s voice from the throne of glory',
       E'From the assembled heaven two voices sound: *And in those days the voice of the Holy One shall be heard in the heaven, and the voice of the Elect One shall be heard from the throne of glory.* (1 Enoch 39:5). The Holy One is the Head of Days, the formless Father; the Elect One is the Formed Son, ordered under Him yet enthroned beside Him — and the title is no accident. Isaiah names this same chosen One: *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him: he shall bring forth judgment to the Gentiles.* (Isaiah 42:1). When Yahusha takes up the title in the flesh, He sets that same throne of glory at the centre of the judgement — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* (Matthew 25:31). Enoch *names* the Elect One enthroned where Daniel will only see *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13): keep the kaph — Daniel watches a figure who *resembles* mortal-man because He took flesh while remaining the Formed cloud-rider; Enoch names that same One whose voice goes out from the throne of glory. Election precedes confession: He is the chosen One, named before any tongue could call on Him.',
       sv.verse_id, ev.verse_id, 'extras', 50953
  FROM _session250_en39_lookup sv, _session250_en39_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=39 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-39-righteousness-flows-like-water',
       E'Righteousness flowing before them like water',
       E'Of the resting-places of the holy Enoch says they *intercede and pray for the children of men, and righteousness flows before them like water, and mercy like dew upon the earth.* (1 Enoch 39:4). The prophet pleads for exactly this outpouring against a crooked generation: *But let judgment run down as waters, and righteousness as a mighty stream.* (Amos 5:24). And the image finds its source at the throne John is shown, where the river of life issues from the Father and the Lamb: *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* (Revelation 22:1). Within Enoch''s own Parables the source is named — *And in that place I saw the fountain of righteousness Which was inexhaustible* (1 Enoch 48:1) — so the righteousness that flows like water before the holy is not their own manufacture but draws from an inexhaustible fount in the Elect One. Righteousness here is gift flowing out and mercy coming down as dew; the holy do not hoard it, they intercede.',
       sv.verse_id, ev.verse_id, 'extras', 50956
  FROM _session250_en39_lookup sv, _session250_en39_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=39 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-39-light-of-the-righteous-shines',
       E'The light of the righteous shall shine like the sun',
       E'The vindication of the elect is luminous: *And the light of the righteous shall shine like the light of the sun, and the sinners shall be as darkness, and they shall not be able to stand before the face of the Holy One.* (1 Enoch 39:9). Daniel was shown the same shining at the resurrection — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* (Daniel 12:3) — and Yahusha spells it out at the harvest, when the tares sown among the wheat are gathered out: *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* (Matthew 13:43). The exultation that frames it is straight out of the Psalms of the Exodus — *The mountains skipped like rams, and the little hills like lambs.* (Psalm 114:4) — which Enoch echoes: *And in those days the mountains shall leap like rams, and the hills shall skip like lambs, and the righteous shall be victorious in the name of Yahuah (God) of Spirits.* (1 Enoch 39:8). The righteous are vindicated as a body, victorious in His name; this is no merit of their own but the shining of those kept in the covenant way.',
       sv.verse_id, ev.verse_id, 'extras', 50959
  FROM _session250_en39_lookup sv, _session250_en39_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=39 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-39-four-presences-around-the-throne',
       E'The four presences around the throne and the accuser cast out',
       E'Enoch sees the heavenly court ranged about the throne: *And I saw the four presences which surround the throne of glory, and they praise Yahuah (God) of Spirits, and they intercede for the children of men.* (1 Enoch 39:11) — Michael, Raphael, Gabriel, and Phanuel (1 Enoch 39:18). John is shown the same four about the throne, unceasing in their praise: *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* (Revelation 4:8). One of the four, Enoch says, is set *fending off the Satans and forbidding them to come before Yahuah (God) of Spirits to accuse them who dwell on the earth* (1 Enoch 39:16) — the very office whose victory John proclaims: *the accuser of our brethren is cast down, which accused them before our Elohim (God) day and night.* (Revelation 12:10), the accuser who in Zechariah''s court stood *at his right hand to resist* the high priest (Zechariah 3:1). Raphael''s ministry of presenting prayers is named outright in the parallel witness — *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* (Tobit 12:15) — matching Enoch''s third voice that prays and intercedes. These are created servants of the Father; they surround the throne and plead for men, but they do not share His seat.',
       sv.verse_id, ev.verse_id, 'extras', 50962
  FROM _session250_en39_lookup sv, _session250_en39_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=11
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=39 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-39-dwellings-of-the-elect
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 14:2 — *In my Father''s house are many mansions: if it were not so, I would have told you. I go to prepare a place for you.* Yahusha names the very dwelling-places Enoch''s spirit longed for in 1 Enoch 39:3, and says He goes ahead to prepare them.'
  FROM cross_reference_threads t, cross_references x, _session250_en39_lookup sv, _session250_en39_lookup tv
 WHERE t.slug='1-enoch-39-dwellings-of-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 7:15 — *Therefore are they before the throne of Elohim (God), and serve him day and night in his temple: and he that sitteth on the throne shall dwell among them.* John sees the righteous lodged with the holy before the throne, the same resting-places among His angels that Enoch saw in 1 Enoch 39:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en39_lookup sv, _session250_en39_lookup tv
 WHERE t.slug='1-enoch-39-dwellings-of-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 21:3 — *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* The Father dwelling un-separated with His people in 1 Enoch 39:6 is the same tabernacling John hears announced over the renewed earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en39_lookup sv, _session250_en39_lookup tv
 WHERE t.slug='1-enoch-39-dwellings-of-the-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-39-elect-one-on-the-throne-of-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 42:1 — *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him: he shall bring forth judgment to the Gentiles.* Isaiah''s "mine elect" is Enoch''s "Elect One" of 1 Enoch 39:5 — the chosen Servant in whom the Father delights, on whom the Spirit rests.'
  FROM cross_reference_threads t, cross_references x, _session250_en39_lookup sv, _session250_en39_lookup tv
 WHERE t.slug='1-enoch-39-elect-one-on-the-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel sees one LIKE the Son of Adam brought before the Ancient of days; Enoch NAMES that same Elect One whose voice sounds from the throne of glory in 1 Enoch 39:5 — keep the "like," for the figure resembles mortal-man having taken flesh.'
  FROM cross_reference_threads t, cross_references x, _session250_en39_lookup sv, _session250_en39_lookup tv
 WHERE t.slug='1-enoch-39-elect-one-on-the-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* The Elect One''s throne of glory in 1 Enoch 39:5 is where the Son of Adam sits in His glory to judge.'
  FROM cross_reference_threads t, cross_references x, _session250_en39_lookup sv, _session250_en39_lookup tv
 WHERE t.slug='1-enoch-39-elect-one-on-the-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 45:3 — *On that day Mine Elect One shall sit on the throne of glory and shall try their works, and their place shall be nothing and their dwelling shall be with the faithless.* The same Elect One on the same throne of glory; what He speaks from it in 1 Enoch 39:5 He executes here as judgement of works.'
  FROM cross_reference_threads t, cross_references x, _session250_en39_lookup sv, _session250_en39_lookup tv
 WHERE t.slug='1-enoch-39-elect-one-on-the-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=45 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-39-righteousness-flows-like-water
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Amos 5:24 — *But let judgment run down as waters, and righteousness as a mighty stream.* Amos''s flowing waters of righteousness are the very stream Enoch sees pour before the holy in 1 Enoch 39:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en39_lookup sv, _session250_en39_lookup tv
 WHERE t.slug='1-enoch-39-righteousness-flows-like-water'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:1 — *And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb.* The water-like righteousness flowing in 1 Enoch 39:4 has its source in the river that proceeds from the throne of the Father and the Lamb.'
  FROM cross_reference_threads t, cross_references x, _session250_en39_lookup sv, _session250_en39_lookup tv
 WHERE t.slug='1-enoch-39-righteousness-flows-like-water'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 48:1 — *And in that place I saw the fountain of righteousness Which was inexhaustible: And around it were many fountains of wisdom: And all the thirsty drank of them, And were filled with wisdom, And their dwellings were with the righteous and holy and elect.* The righteousness flowing like water in 1 Enoch 39:4 draws from this inexhaustible fountain that Enoch sees later in the Parables.'
  FROM cross_reference_threads t, cross_references x, _session250_en39_lookup sv, _session250_en39_lookup tv
 WHERE t.slug='1-enoch-39-righteousness-flows-like-water'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-39-light-of-the-righteous-shines
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* Daniel''s shining of the wise at the resurrection is the light of the righteous that blazes like the sun in 1 Enoch 39:9.'
  FROM cross_reference_threads t, cross_references x, _session250_en39_lookup sv, _session250_en39_lookup tv
 WHERE t.slug='1-enoch-39-light-of-the-righteous-shines'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Yahusha names the same sun-bright shining of the righteous that Enoch sees in 1 Enoch 39:9, set at the harvest when the sinners-as-darkness are separated out.'
  FROM cross_reference_threads t, cross_references x, _session250_en39_lookup sv, _session250_en39_lookup tv
 WHERE t.slug='1-enoch-39-light-of-the-righteous-shines'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 114:4 — *The mountains skipped like rams, and the little hills like lambs.* The Exodus exultation Enoch borrows for the day of victory in 1 Enoch 39:8, where the mountains leap like rams and the righteous are victorious in His name.'
  FROM cross_reference_threads t, cross_references x, _session250_en39_lookup sv, _session250_en39_lookup tv
 WHERE t.slug='1-enoch-39-light-of-the-righteous-shines'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=114 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-39-four-presences-around-the-throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* John''s four living creatures praising ceaselessly about the throne are Enoch''s four presences who surround the throne of glory and praise in 1 Enoch 39:11.'
  FROM cross_reference_threads t, cross_references x, _session250_en39_lookup sv, _session250_en39_lookup tv
 WHERE t.slug='1-enoch-39-four-presences-around-the-throne'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 12:10 — *And I heard a loud voice saying in heaven, Now is come salvation, and strength, and the kingdom of our Elohim (God), and the power of his Messiah (Christ): for the accuser of our brethren is cast down, which accused them before our Elohim (God) day and night.* The fourth presence in 1 Enoch 39:16 fends off the Satans who would accuse the dwellers of earth; John proclaims that accuser finally cast down.'
  FROM cross_reference_threads t, cross_references x, _session250_en39_lookup sv, _session250_en39_lookup tv
 WHERE t.slug='1-enoch-39-four-presences-around-the-throne'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 3:1 — *And he shewed me Joshua the high priest standing before the angel of Yahuah (LORD), and Satan standing at his right hand to resist him.* The accusing adversary the fourth presence forbids from the throne in 1 Enoch 39:16 is the same Satan who stands to accuse in Zechariah''s heavenly court.'
  FROM cross_reference_threads t, cross_references x, _session250_en39_lookup sv, _session250_en39_lookup tv
 WHERE t.slug='1-enoch-39-four-presences-around-the-throne'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 12:15 — *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* Raphael, named among Enoch''s four presences, holds the office Enoch''s third voice performs in 1 Enoch 39:15 — praying and presenting the supplications of those on earth before the Holy One.'
  FROM cross_reference_threads t, cross_references x, _session250_en39_lookup sv, _session250_en39_lookup tv
 WHERE t.slug='1-enoch-39-four-presences-around-the-throne'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=39 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

