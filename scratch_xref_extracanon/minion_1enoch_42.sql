-- ----- fragment: minion_1enoch_42.sql (session250 1-enoch 42) -----
-- Source anchor: enoch/1-enoch ch42. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en42 (view _session250_en42_lookup). Sort band base 51025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en42_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-42-wisdom-found-no-place
  ('enoch', '1-enoch', 42, 2, 'canon', 'john', 1, 10, 'free', E'John 1:10 — *He was in the world, and the world was made by him, and the world knew him not.* The Logos who made all things finds no dwelling-place among the children of men, exactly as Enoch''s Wisdom found no place where she might dwell.'),
  ('enoch', '1-enoch', 42, 2, 'canon', 'john', 1, 11, 'free', E'John 1:11 — *He came unto his own, and his own received him not.* Wisdom going forth to make her dwelling among men and being refused is the Word coming to His own and being turned away.'),
  ('enoch', '1-enoch', 42, 1, 'canon', 'proverbs', 1, 24, 'free', E'Proverbs 1:24 — *Because I have called, and ye refused; I have stretched out my hand, and no man regarded;* personified Wisdom in the streets is rebuffed, so she finds no place among men just as in Enoch 42:1.'),
  ('enoch', '1-enoch', 42, 2, 'canon', 'proverbs', 1, 28, 'free', E'Proverbs 1:28 — *Then shall they call upon me, but I will not answer; they shall seek me early, but they shall not find me:* refused Wisdom withdraws, mirroring her return to her seat among the angels in Enoch 42:2.'),
  ('enoch', '1-enoch', 42, 1, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 12, 'extras', E'Baruch 3:12 — *You have forsaken the fountain of wisdom.* Yashar''el''s abandoning the fountain of wisdom is why Wisdom finds no dwelling-place among men in Enoch 42:1.'),
  ('enoch', '1-enoch', 42, 2, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 37, 'extras', E'Baruch 3:37 — *Afterward did he shew himself upon earth, and conversed with men.* The Wisdom-of-Yahuah whom Enoch sees withdraw to heaven would afterward come down and walk among men — the incarnation answering 42:2.'),
  ('enoch', '1-enoch', 42, 1, 'apocrypha', 'the-wisdom-of-solomon', 7, 26, 'extras', E'Wisdom of Solomon 7:26 — *For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness.* The Wisdom denied a dwelling in Enoch 42:1 is the Father''s own image and brightness — the Formed Logos.'),
  -- thread: 1-enoch-42-unrighteousness-dwelt-where-wisdom-was-not
  ('enoch', '1-enoch', 42, 3, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 11, 'extras', E'Baruch 3:11 — *That you are counted with them that go down into the grave?* Forsaking Wisdom counts a people with the dead, the same desolation that unrighteousness brings where it dwells in Enoch 42:3.'),
  ('enoch', '1-enoch', 42, 3, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 13, 'extras', E'Baruch 3:13 — *For if you had walked in the way of Yahuah (God), you should have dwelled in peace for ever.* Walking in the way of Yahuah would have kept the place Wisdom held; refusing it lets unrighteousness dwell there, as in Enoch 42:3.'),
  -- thread: 1-enoch-42-voice-of-the-elect-one-throne-of-glory
  ('enoch', '1-enoch', 42, 6, 'enoch', '1-enoch', 48, 2, 'extras', E'1 Enoch 48:2 — *And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* The Elect One whose voice sounds from the throne of glory in 42:6 is the named Son of Adam, set in the presence of the Head of Days.'),
  ('enoch', '1-enoch', 42, 6, 'enoch', '1-enoch', 48, 3, 'extras', E'1 Enoch 48:3 — *Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* Election precedes confession — the Elect One of 42:6 was named before creation itself.'),
  ('enoch', '1-enoch', 42, 6, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel keeps the kaph and sees one *like* the Son of Adam approach the Ancient of days; Enoch in 42:6 names that same One the Elect One on the throne of glory.'),
  ('enoch', '1-enoch', 42, 6, 'canon', 'isaiah', 11, 2, 'free', E'Isaiah 11:2 — *And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD);* the Spirit of wisdom rests on the chosen Branch — the Elect One whose voice answers from the throne of glory in 42:6.'),
  -- thread: 1-enoch-42-elect-dwell-with-yahuah-never-separated
  ('enoch', '1-enoch', 42, 8, 'apocrypha', 'ecclesiasticus', 24, 8, 'extras', E'Sirach 24:8 — *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* Wisdom, denied a dwelling among men, is given her resting-place in Jacob — the elect with whom Yahuah of Spirits abides in Enoch 42:7-8.'),
  ('enoch', '1-enoch', 42, 8, 'canon', 'revelation', 21, 3, 'free', E'Revelation 21:3 — *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* Yahuah of Spirits abiding over His elect and dwelling with them in 42:8 is the tabernacle of Elohim finally set among His people.'),
  -- thread: 1-enoch-42-mountains-leap-righteous-victorious
  ('enoch', '1-enoch', 42, 9, 'canon', 'psalms', 114, 4, 'free', E'Psalm 114:4 — *The mountains skipped like rams, and the little hills like lambs.* The Exodus-redemption image of leaping hills is the exact figure Enoch uses in 42:9 for creation rejoicing as the righteous are made victorious.'),
  ('enoch', '1-enoch', 42, 9, 'canon', 'isaiah', 60, 1, 'free', E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* The glory rising on the gathered people matches the victory of the righteous in the name of Yahuah of Spirits in Enoch 42:9.'),
  -- thread: 1-enoch-42-light-of-the-righteous-shines-like-the-sun
  ('enoch', '1-enoch', 42, 10, 'canon', 'daniel', 12, 3, 'free', E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The wise shining like the firmament at the resurrection is the light of the righteous shining like the sun in Enoch 42:10.'),
  ('enoch', '1-enoch', 42, 10, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The division of righteous-light from sinner-darkness in Enoch 42:10 is Daniel''s waking of the dead to life or to shame.'),
  ('enoch', '1-enoch', 42, 10, 'canon', 'matthew', 13, 43, 'free', E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Yahusha''s harvest of the righteous shining as the sun is the same radiance Enoch foresaw in 42:10.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en42_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en42_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-42-wisdom-found-no-place',
       E'Wisdom found no place — the rejected Logos returns to her seat',
       E'Enoch sees Wisdom homeless among men and welcomed only in heaven: *Wisdom found no place where she might dwell; then a dwelling-place was assigned her in the heavens.* (1 Enoch 42:1) — *Wisdom went forth to make her dwelling among the children of men, but she found no dwelling-place: Wisdom returned to her place, and took her seat among the angels.* (1 Enoch 42:2) This is the Logos motif: the Word who is the Wisdom of the Father comes to His own and is turned away, *He was in the world, and the world was made by him, and the world knew him not.* (John 1:10) — *He came unto his own, and his own received him not.* (John 1:11) Tanakh''s Wisdom already cried in the streets and was refused: *Because I have called, and ye refused; I have stretched out my hand, and no man regarded;* (Proverbs 1:24) and so she withdraws, *Then shall they call upon me, but I will not answer; they shall seek me early, but they shall not find me:* (Proverbs 1:28) Baruch names the rejection as covenant-abandonment by the scattered tribes, *You have forsaken the fountain of wisdom.* (Baruch 3:12), with the promise that the same Wisdom would yet walk among men, *Afterward did he shew himself upon earth, and conversed with men.* (Baruch 3:37) — the incarnation foretold. Wisdom is the very breath and image of the Father, *For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness.* (Wisdom of Solomon 7:26) It ain''t new: Enoch already knew the Wisdom of Yahuah of Spirits would be refused her dwelling among men before she was received again above.',
       sv.verse_id, ev.verse_id, 'extras', 51025
  FROM _session250_en42_lookup sv, _session250_en42_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=42 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-42-unrighteousness-dwelt-where-wisdom-was-not',
       E'Iniquity took the seat Wisdom was refused',
       E'Where Wisdom was not welcomed, her opposite moved in: *And unrighteousness went forth from her chambers: she found whom she sought, and dwelt with them, as rain in a desert and dew in a thirsty land.* (1 Enoch 42:3) The vacancy is never neutral — refuse Wisdom and iniquity finds eager soil, the seed-war''s tares sown where the wheat was thrown out. Baruch frames this as covenant-forsaking that drives a people into exile and the grave, *That you are counted with them that go down into the grave?* (Baruch 3:11) — for *if you had walked in the way of Yahuah (God), you should have dwelled in peace for ever.* (Baruch 3:13) The way of knowledge is offered and refused, and the refusal, not the law, is the curse. It ain''t new: long before the Gospels named the kingdom snatched from the unwilling, Enoch saw unrighteousness rush in to fill the room from which Wisdom was turned away.',
       sv.verse_id, ev.verse_id, 'extras', 51028
  FROM _session250_en42_lookup sv, _session250_en42_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=42 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-42-voice-of-the-elect-one-throne-of-glory',
       E'The Holy One and the Elect One — two voices from the throne of glory',
       E'Enoch hears two distinct voices from heaven: *And in those days the voice of the Holy One shall be heard in the heaven, and the voice of the Elect One shall be heard from the throne of glory.* (1 Enoch 42:6) The Holy One is the Head of Days, the formless Father; the Elect One is the Formed Son ordered under Him, seated on the throne of glory yet distinct from Him. Enoch elsewhere NAMES this Son and sets His naming before creation, *And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* (1 Enoch 48:2) — *Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* (1 Enoch 48:3) Election precedes confession: the name was named before the heavens were made. Daniel sees this same One but keeps the kaph-comparative — *one like* mortal-man, because He took flesh while remaining the Formed cloud-rider: *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13) Daniel sees one *like* the Son of Adam; Enoch names that same One outright. And the Spirit rests on Him as the Elect, *And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD);* (Isaiah 11:2) — this is the chosen Branch, the Wisdom of 42:1 now enthroned and vindicated. It ain''t new: the second voice from the throne of glory is Yahusha, the Elect One named before the stars.',
       sv.verse_id, ev.verse_id, 'extras', 51031
  FROM _session250_en42_lookup sv, _session250_en42_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=42 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-42-elect-dwell-with-yahuah-never-separated',
       E'The elect dwell with Yahuah of Spirits, never separated',
       E'After Wisdom''s withdrawal, Enoch sees the gathered remnant settled with their Elohim: *And in those days the elect shall dwell upon the earth, and the righteous shall dwell with them, and they shall not be separated.* (1 Enoch 42:7) — *And Yahuah (God) of Spirits shall abide over them, and with them they shall eat and drink and praise Yahuah (God) of Spirits.* (1 Enoch 42:8) This is the gathering of the people, not a class self-selected by confession: the elect and the righteous dwell together and are not scattered again. Wisdom, refused a dwelling among rebellious men, is given her resting-place among the people of Yahuah — *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* (Sirach 24:8) The end of Revelation seals the same dwelling: *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* (Revelation 21:3) It ain''t new: the tabernacling of Yahuah with His regathered people — eating, drinking, never separated — was Enoch''s hope long before John saw the new Jerusalem.',
       sv.verse_id, ev.verse_id, 'extras', 51034
  FROM _session250_en42_lookup sv, _session250_en42_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=7
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=42 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-42-mountains-leap-righteous-victorious',
       E'The mountains leap like rams; the righteous are victorious',
       E'Creation itself rejoices at the deliverance of the people: *And in those days the mountains shall leap like rams, and the hills shall skip like lambs, and the righteous shall be victorious in the name of Yahuah (God) of Spirits.* (1 Enoch 42:9) This is the Exodus-language of redemption — when Yahuah brings His people out, the hills dance: *The mountains skipped like rams, and the little hills like lambs.* (Psalm 114:4) Enoch borrows the very figure to mark the victory of the righteous in the name of Yahuah of Spirits — the same name in which they overcome. And the glory rises on the gathered remnant, *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* (Isaiah 60:1) It ain''t new: the leaping mountains of the redeemed Yashar''el in the Psalms are the leaping mountains of the victorious righteous in Enoch 42:9.',
       sv.verse_id, ev.verse_id, 'extras', 51037
  FROM _session250_en42_lookup sv, _session250_en42_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=9
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=42 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-42-light-of-the-righteous-shines-like-the-sun',
       E'The light of the righteous shall shine like the sun',
       E'Enoch closes the chapter with the radiance of the vindicated: *And the light of the righteous shall shine like the light of the sun, and the sinners shall be as darkness, and they shall not be able to stand before the face of the Holy One.* (1 Enoch 42:10) — *And the righteous shall be victorious, and the elect shall be victorious, and they shall not be ashamed, and they shall not be confounded.* (1 Enoch 42:11) Daniel sees the same shining at the resurrection, after *many of them that sleep in the dust of the earth shall awake* (Daniel 12:2): *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* (Daniel 12:3) Yahusha makes the figure His own: *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* (Matthew 13:43) — the wheat shining after the tares are gathered out, the seed-war resolved. It ain''t new: the righteous shining like the sun before the face of the Holy One is Enoch''s word, carried into Daniel''s resurrection and the Gospel''s harvest.',
       sv.verse_id, ev.verse_id, 'extras', 51040
  FROM _session250_en42_lookup sv, _session250_en42_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=42 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-42-wisdom-found-no-place
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:10 — *He was in the world, and the world was made by him, and the world knew him not.* The Logos who made all things finds no dwelling-place among the children of men, exactly as Enoch''s Wisdom found no place where she might dwell.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-wisdom-found-no-place'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:11 — *He came unto his own, and his own received him not.* Wisdom going forth to make her dwelling among men and being refused is the Word coming to His own and being turned away.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-wisdom-found-no-place'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 1:24 — *Because I have called, and ye refused; I have stretched out my hand, and no man regarded;* personified Wisdom in the streets is rebuffed, so she finds no place among men just as in Enoch 42:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-wisdom-found-no-place'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 1:28 — *Then shall they call upon me, but I will not answer; they shall seek me early, but they shall not find me:* refused Wisdom withdraws, mirroring her return to her seat among the angels in Enoch 42:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-wisdom-found-no-place'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Baruch 3:12 — *You have forsaken the fountain of wisdom.* Yashar''el''s abandoning the fountain of wisdom is why Wisdom finds no dwelling-place among men in Enoch 42:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-wisdom-found-no-place'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Baruch 3:37 — *Afterward did he shew himself upon earth, and conversed with men.* The Wisdom-of-Yahuah whom Enoch sees withdraw to heaven would afterward come down and walk among men — the incarnation answering 42:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-wisdom-found-no-place'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=3 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Wisdom of Solomon 7:26 — *For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness.* The Wisdom denied a dwelling in Enoch 42:1 is the Father''s own image and brightness — the Formed Logos.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-wisdom-found-no-place'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-42-unrighteousness-dwelt-where-wisdom-was-not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Baruch 3:11 — *That you are counted with them that go down into the grave?* Forsaking Wisdom counts a people with the dead, the same desolation that unrighteousness brings where it dwells in Enoch 42:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-unrighteousness-dwelt-where-wisdom-was-not'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Baruch 3:13 — *For if you had walked in the way of Yahuah (God), you should have dwelled in peace for ever.* Walking in the way of Yahuah would have kept the place Wisdom held; refusing it lets unrighteousness dwell there, as in Enoch 42:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-unrighteousness-dwelt-where-wisdom-was-not'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-42-voice-of-the-elect-one-throne-of-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 48:2 — *And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* The Elect One whose voice sounds from the throne of glory in 42:6 is the named Son of Adam, set in the presence of the Head of Days.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-voice-of-the-elect-one-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 48:3 — *Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* Election precedes confession — the Elect One of 42:6 was named before creation itself.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-voice-of-the-elect-one-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel keeps the kaph and sees one *like* the Son of Adam approach the Ancient of days; Enoch in 42:6 names that same One the Elect One on the throne of glory.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-voice-of-the-elect-one-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 11:2 — *And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD);* the Spirit of wisdom rests on the chosen Branch — the Elect One whose voice answers from the throne of glory in 42:6.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-voice-of-the-elect-one-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-42-elect-dwell-with-yahuah-never-separated
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach 24:8 — *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* Wisdom, denied a dwelling among men, is given her resting-place in Jacob — the elect with whom Yahuah of Spirits abides in Enoch 42:7-8.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-elect-dwell-with-yahuah-never-separated'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 21:3 — *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* Yahuah of Spirits abiding over His elect and dwelling with them in 42:8 is the tabernacle of Elohim finally set among His people.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-elect-dwell-with-yahuah-never-separated'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-42-mountains-leap-righteous-victorious
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 114:4 — *The mountains skipped like rams, and the little hills like lambs.* The Exodus-redemption image of leaping hills is the exact figure Enoch uses in 42:9 for creation rejoicing as the righteous are made victorious.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-mountains-leap-righteous-victorious'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=114 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* The glory rising on the gathered people matches the victory of the righteous in the name of Yahuah of Spirits in Enoch 42:9.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-mountains-leap-righteous-victorious'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-42-light-of-the-righteous-shines-like-the-sun
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The wise shining like the firmament at the resurrection is the light of the righteous shining like the sun in Enoch 42:10.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-light-of-the-righteous-shines-like-the-sun'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The division of righteous-light from sinner-darkness in Enoch 42:10 is Daniel''s waking of the dead to life or to shame.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-light-of-the-righteous-shines-like-the-sun'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Yahusha''s harvest of the righteous shining as the sun is the same radiance Enoch foresaw in 42:10.'
  FROM cross_reference_threads t, cross_references x, _session250_en42_lookup sv, _session250_en42_lookup tv
 WHERE t.slug='1-enoch-42-light-of-the-righteous-shines-like-the-sun'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=42 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

