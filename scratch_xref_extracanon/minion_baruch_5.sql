-- ----- fragment: minion_baruchwiththeletterofjeremiah_05.sql (session253 baruch-with-the-letter-of-jeremiah 5) -----
-- Source anchor: apocrypha/baruch-with-the-letter-of-jeremiah ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: bar5 (view _session253_bar5_lookup). Sort band base 60800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_bar5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: baruch-5-robe-of-righteousness
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 1, 'canon', 'isaiah', 52, 1, 'free', E'Isaiah 52:1 — *Awake, awake; put on thy strength, O Zion; put on thy beautiful garments, O Jerusalem, the holy city: for henceforth there shall no more come into thee the uncircumcised and the unclean.* Baruch 5:1''s command to put off mourning and put on glory is Isaiah''s very summons to Jerusalem to change her garments.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 1, 'canon', 'isaiah', 61, 10, 'free', E'Isaiah 61:10 — *I will greatly rejoice in Yahuah (LORD), my soul shall be joyful in my Elohim (God); for he hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness, as a bridegroom decketh himself with ornaments, and as a bride adorneth herself with her jewels.* The robe of righteousness that *comes from Yahuah* in Baruch 5:1-2 is Isaiah''s garment of salvation, given not earned.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 2, 'canon', 'isaiah', 61, 3, 'free', E'Isaiah 61:3 — *To appoint unto them that mourn in Zion, to give unto them beauty for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness; that they might be called trees of righteousness, the planting of Yahuah (LORD), that he might be glorified.* Baruch''s exchange of the garment of mourning for the garment of glory is the beauty-for-ashes Yahuah appoints to Zion''s mourners.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 1, 'canon', 'revelation', 21, 2, 'free', E'Revelation 21:2 — *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* The mourning city of Baruch 5:1, re-clothed in glory, is the adorned bride John beholds at the last.'),
  -- thread: baruch-5-new-name-diadem
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 2, 'canon', 'isaiah', 62, 3, 'free', E'Isaiah 62:3 — *Thou shalt also be a crown of glory in the hand of Yahuah (LORD), and a royal diadem in the hand of thy Elohim (God).* The diadem of the glory of the Everlasting set on Jerusalem''s head in Baruch 5:2 is Isaiah''s royal diadem in the hand of her Elohim.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 4, 'canon', 'isaiah', 62, 2, 'free', E'Isaiah 62:2 — *And the Gentiles shall see thy righteousness, and all kings thy glory: and thou shalt be called by a new name, which the mouth of Yahuah (LORD) shall name.* Baruch 5:4''s new name spoken by Yahuah, ''The peace of righteousness,'' is Isaiah''s new name which the mouth of Yahuah shall name.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 3, 'canon', 'isaiah', 60, 3, 'free', E'Isaiah 60:3 — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising.* Baruch 5:3''s promise that Yahuah will show Jerusalem''s brightness to every country under heaven is Isaiah''s nations drawn to her risen light.'),
  -- thread: baruch-5-children-gathered-east-west
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 5, 'canon', 'ezekiel', 37, 21, 'free', E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* Baruch 5:5''s children gathered from west to east are Ezekiel''s children of Israel gathered on every side and brought back to their land.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 5, 'canon', 'isaiah', 49, 12, 'free', E'Isaiah 49:12 — *Behold, these shall come from far: and, lo, these from the north and from the west; and these from the land of Sinim.* The children Baruch 5:5 watches return from the west are Isaiah''s exiles coming from far, from every direction, to the waiting city.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 6, 'canon', 'isaiah', 49, 22, 'free', E'Isaiah 49:22 — *Thus saith Adonai Yahuah (the Lord GOD), Behold, I will lift up mine hand to the Gentiles, and set up my standard to the people: and they shall bring thy sons in their arms, and thy daughters shall be carried upon their shoulders.* Baruch 5:6''s children, led away on foot but brought back exalted with glory, are Isaiah''s sons borne home in arms and on shoulders.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 5, 'apocrypha', 'tobit', 13, 13, 'extras', E'Tobit 13:13 — *Rejoice and be glad for the children of the just: for they shall be gathered together, and shall bless Yahuah (God) of the just.* Baruch 5:5''s children gathered home rejoicing in the remembrance of Yahuah are Tobit''s children of the just, gathered together to bless Him.'),
  -- thread: baruch-5-every-valley-filled
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 7, 'canon', 'isaiah', 40, 4, 'free', E'Isaiah 40:4 — *Every valley shall be exalted, and every mountain and hill shall be made low: and the crooked shall be made straight, and the rough places plain:* Baruch 5:7''s hills cast down and valleys filled to make even ground is Isaiah''s levelled highway, prepared for the homecoming.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 7, 'canon', 'isaiah', 40, 5, 'free', E'Isaiah 40:5 — *And the glory of Yahuah (LORD) shall be revealed, and all flesh shall see it together: for the mouth of Yahuah (LORD) hath spoken it.* The even road of Baruch 5:7, on which Israel goes safely ''in the glory of Yahuah,'' is the way on which Isaiah says that glory shall be revealed to all flesh.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 7, 'canon', 'luke', 3, 5, 'free', E'Luke 3:5 — *Every valley shall be filled, and every mountain and hill shall be brought low; and the crooked shall be made straight, and the rough ways shall be made smooth;* The leveling of the land in Baruch 5:7 is the very prophecy the Baptist proclaims to prepare the way of Yahuah.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 7, 'canon', 'luke', 3, 6, 'free', E'Luke 3:6 — *And all flesh shall see the salvation of Elohim (God).* Baruch 5:7''s safe homeward road in the glory of Yahuah ends where Luke does: all flesh seeing the salvation of Elohim.'),
  -- thread: baruch-5-led-home-in-light-and-mercy
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 8, 'canon', 'isaiah', 35, 1, 'free', E'Isaiah 35:1 — *The wilderness and the solitary place shall be glad for them; and the desert shall rejoice, and blossom as the rose.* Baruch 5:8''s woods and sweetsmelling trees overshadowing Israel are Isaiah''s wilderness made glad and blossoming for the returning people.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 9, 'canon', 'isaiah', 35, 10, 'free', E'Isaiah 35:10 — *And the ransomed of Yahuah (LORD) shall return, and come to Zion with songs and everlasting joy upon their heads: they shall obtain joy and gladness, and sorrow and sighing shall flee away.* Baruch 5:9''s Israel led with joy in the light of His glory is Isaiah''s ransomed returning to Zion with everlasting joy, their sorrow fled away.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 9, 'canon', 'isaiah', 60, 19, 'free', E'Isaiah 60:19 — *The sun shall be no more thy light by day; neither for brightness shall the moon give light unto thee: but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory.* The light of His glory leading Israel home in Baruch 5:9 is Isaiah''s everlasting light, Yahuah Himself become her lamp.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_bar5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_bar5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-5-robe-of-righteousness',
       E'Put off mourning, put on the robe of righteousness',
       E'Baruch calls the bereaved city to be unrobed of her grief and clothed anew: *Put off, O Jerusalem, the garment of mourning and affliction, and put on the comeliness of the glory that comes from Yahuah (God) for ever* (Baruch 5:1), *Cast about you a double garment of the righteousness which comes from Yahuah (God); and set a diadem on yours head of the glory of the Everlasting* (Baruch 5:2). It ain''t new — this is Isaiah''s bridal exchange. *Awake, awake; put on thy strength, O Zion; put on thy beautiful garments, O Jerusalem, the holy city* (Isaiah 52:1); *he hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness, as a bridegroom decketh himself with ornaments, and as a bride adorneth herself with her jewels* (Isaiah 61:10). The mourning of the captivity is ended and beauty given for ashes, and John sees the same city *coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2). The garment is not earned — it *comes from Yahuah*; the righteousness is His gift, the double for the double sorrow she had borne.',
       sv.verse_id, ev.verse_id, 'extras', 60800
  FROM _session253_bar5_lookup sv, _session253_bar5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=5 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-5-new-name-diadem',
       E'The diadem and the new name of Jerusalem',
       E'The city receives a crown and a new title: *set a diadem on yours head of the glory of the Everlasting* (Baruch 5:2), and *For your name shall be called of Yahuah (God) for ever The peace of righteousness, and The glory of the worship of Yahuah (God)* (Baruch 5:4). Isaiah had promised both the royal crown and the renaming: *thou shalt be called by a new name, which the mouth of Yahuah (LORD) shall name* (Isaiah 62:2), *Thou shalt also be a crown of glory in the hand of Yahuah (LORD), and a royal diadem in the hand of thy Elohim (God)* (Isaiah 62:3). The renamed, crowned city is no longer Forsaken but the *peace of righteousness* — the same righteousness-and-peace that meet when Yahuah brings His people home, and her brightness is shown to every country (Isaiah 60:3).',
       sv.verse_id, ev.verse_id, 'extras', 60803
  FROM _session253_bar5_lookup sv, _session253_bar5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=5 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-5-children-gathered-east-west',
       E'Thy children gathered from the west to the east',
       E'The exiled city lifts her eyes and sees her scattered seed brought home: *Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God)* (Baruch 5:5), for *they departed from you on foot, and were led away of their enemies: but Yahuah (God) brings them to you exalted with glory, as children of the kingdom* (Baruch 5:6). This is the two-house regathering, not a church replacing Israel: Yahuah declares *I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21), making the divided kingdoms one nation again. Isaiah saw them streaming from every quarter — *these shall come from far: and, lo, these from the north and from the west; and these from the land of Sinim* (Isaiah 49:12) — borne home in arms and on shoulders (Isaiah 49:22). Tobit sang the same: *they shall be gathered together, and shall bless Yahuah (God) of the just* (Tobit 13:13). They left on foot in chains; they return carried in glory, as children of the kingdom.',
       sv.verse_id, ev.verse_id, 'extras', 60806
  FROM _session253_bar5_lookup sv, _session253_bar5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=5 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-5-every-valley-filled',
       E'Every high hill cast down, the valleys filled',
       E'So that the returning exiles may walk home unhindered, the land itself is levelled: *For Yahuah (God) has appointed that every high hill, and banks of long continuance, should be cast down, and valleys filled up, to make even the ground, that Yashar''el (Israel) may go safely in the glory of Yahuah (God)* (Baruch 5:7). This is the highway of the prophets, word for word: *Every valley shall be exalted, and every mountain and hill shall be made low: and the crooked shall be made straight, and the rough places plain* (Isaiah 40:4), *And the glory of Yahuah (LORD) shall be revealed, and all flesh shall see it together* (Isaiah 40:5). The Baptist took up the same cry to prepare the way — *Every valley shall be filled, and every mountain and hill shall be brought low* (Luke 3:5), *And all flesh shall see the salvation of Elohim (God)* (Luke 3:6). The road that brings Israel home in glory is the road on which all flesh will see the salvation of Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 60809
  FROM _session253_bar5_lookup sv, _session253_bar5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=5 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-5-led-home-in-light-and-mercy',
       E'Led home in the light of His glory, with mercy and righteousness',
       E'The trees of the field shade the pilgrims, and Yahuah Himself is their guide: *Moreover even the woods and every sweetsmelling tree shall overshadow Yashar''el (Israel) by the commandment of Yahuah (God)* (Baruch 5:8), *For Yahuah (God) shall lead Yashar''el (Israel) with joy in the light of his glory with the mercy and righteousness that comes from him* (Baruch 5:9). Isaiah''s ransomed return the same way — *and the ransomed of Yahuah (LORD) shall return, and come to Zion with songs and everlasting joy upon their heads: they shall obtain joy and gladness, and sorrow and sighing shall flee away* (Isaiah 35:10) — and the desert itself blossoms before them (Isaiah 35:1). The everlasting light is Yahuah Himself: *the sun shall be no more thy light by day; neither for brightness shall the moon give light unto thee: but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory* (Isaiah 60:19). The homecoming is led by joy, lit by glory, and carried by mercy — never cheap, always His.',
       sv.verse_id, ev.verse_id, 'extras', 60812
  FROM _session253_bar5_lookup sv, _session253_bar5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=5 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: baruch-5-robe-of-righteousness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 52:1 — *Awake, awake; put on thy strength, O Zion; put on thy beautiful garments, O Jerusalem, the holy city: for henceforth there shall no more come into thee the uncircumcised and the unclean.* Baruch 5:1''s command to put off mourning and put on glory is Isaiah''s very summons to Jerusalem to change her garments.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-robe-of-righteousness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 61:10 — *I will greatly rejoice in Yahuah (LORD), my soul shall be joyful in my Elohim (God); for he hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness, as a bridegroom decketh himself with ornaments, and as a bride adorneth herself with her jewels.* The robe of righteousness that *comes from Yahuah* in Baruch 5:1-2 is Isaiah''s garment of salvation, given not earned.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-robe-of-righteousness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 61:3 — *To appoint unto them that mourn in Zion, to give unto them beauty for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness; that they might be called trees of righteousness, the planting of Yahuah (LORD), that he might be glorified.* Baruch''s exchange of the garment of mourning for the garment of glory is the beauty-for-ashes Yahuah appoints to Zion''s mourners.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-robe-of-righteousness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 21:2 — *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* The mourning city of Baruch 5:1, re-clothed in glory, is the adorned bride John beholds at the last.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-robe-of-righteousness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-5-new-name-diadem
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 62:3 — *Thou shalt also be a crown of glory in the hand of Yahuah (LORD), and a royal diadem in the hand of thy Elohim (God).* The diadem of the glory of the Everlasting set on Jerusalem''s head in Baruch 5:2 is Isaiah''s royal diadem in the hand of her Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-new-name-diadem'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 62:2 — *And the Gentiles shall see thy righteousness, and all kings thy glory: and thou shalt be called by a new name, which the mouth of Yahuah (LORD) shall name.* Baruch 5:4''s new name spoken by Yahuah, ''The peace of righteousness,'' is Isaiah''s new name which the mouth of Yahuah shall name.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-new-name-diadem'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 60:3 — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising.* Baruch 5:3''s promise that Yahuah will show Jerusalem''s brightness to every country under heaven is Isaiah''s nations drawn to her risen light.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-new-name-diadem'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-5-children-gathered-east-west
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* Baruch 5:5''s children gathered from west to east are Ezekiel''s children of Israel gathered on every side and brought back to their land.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-children-gathered-east-west'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 49:12 — *Behold, these shall come from far: and, lo, these from the north and from the west; and these from the land of Sinim.* The children Baruch 5:5 watches return from the west are Isaiah''s exiles coming from far, from every direction, to the waiting city.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-children-gathered-east-west'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 49:22 — *Thus saith Adonai Yahuah (the Lord GOD), Behold, I will lift up mine hand to the Gentiles, and set up my standard to the people: and they shall bring thy sons in their arms, and thy daughters shall be carried upon their shoulders.* Baruch 5:6''s children, led away on foot but brought back exalted with glory, are Isaiah''s sons borne home in arms and on shoulders.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-children-gathered-east-west'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 13:13 — *Rejoice and be glad for the children of the just: for they shall be gathered together, and shall bless Yahuah (God) of the just.* Baruch 5:5''s children gathered home rejoicing in the remembrance of Yahuah are Tobit''s children of the just, gathered together to bless Him.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-children-gathered-east-west'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-5-every-valley-filled
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 40:4 — *Every valley shall be exalted, and every mountain and hill shall be made low: and the crooked shall be made straight, and the rough places plain:* Baruch 5:7''s hills cast down and valleys filled to make even ground is Isaiah''s levelled highway, prepared for the homecoming.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-every-valley-filled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 40:5 — *And the glory of Yahuah (LORD) shall be revealed, and all flesh shall see it together: for the mouth of Yahuah (LORD) hath spoken it.* The even road of Baruch 5:7, on which Israel goes safely ''in the glory of Yahuah,'' is the way on which Isaiah says that glory shall be revealed to all flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-every-valley-filled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 3:5 — *Every valley shall be filled, and every mountain and hill shall be brought low; and the crooked shall be made straight, and the rough ways shall be made smooth;* The leveling of the land in Baruch 5:7 is the very prophecy the Baptist proclaims to prepare the way of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-every-valley-filled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 3:6 — *And all flesh shall see the salvation of Elohim (God).* Baruch 5:7''s safe homeward road in the glory of Yahuah ends where Luke does: all flesh seeing the salvation of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-every-valley-filled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-5-led-home-in-light-and-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 35:1 — *The wilderness and the solitary place shall be glad for them; and the desert shall rejoice, and blossom as the rose.* Baruch 5:8''s woods and sweetsmelling trees overshadowing Israel are Isaiah''s wilderness made glad and blossoming for the returning people.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-led-home-in-light-and-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 35:10 — *And the ransomed of Yahuah (LORD) shall return, and come to Zion with songs and everlasting joy upon their heads: they shall obtain joy and gladness, and sorrow and sighing shall flee away.* Baruch 5:9''s Israel led with joy in the light of His glory is Isaiah''s ransomed returning to Zion with everlasting joy, their sorrow fled away.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-led-home-in-light-and-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 60:19 — *The sun shall be no more thy light by day; neither for brightness shall the moon give light unto thee: but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory.* The light of His glory leading Israel home in Baruch 5:9 is Isaiah''s everlasting light, Yahuah Himself become her lamp.'
  FROM cross_reference_threads t, cross_references x, _session253_bar5_lookup sv, _session253_bar5_lookup tv
 WHERE t.slug='baruch-5-led-home-in-light-and-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

