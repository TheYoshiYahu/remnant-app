-- session410: 3 Baruch extra-canonical cross-references (Track B repaired book)
-- edition pseudepigrapha :: 3-baruch (book_id 788), 17 chapters, bands 81000-81400
BEGIN;
-- ----- fragment: minion_3baruch_01.sql (session410 3-baruch 1) -----
-- Source anchor: pseudepigrapha/3-baruch ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3b01 (view _session410_3b01_lookup). Sort band base 81000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session410_3b01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-baruch-1-weeping-over-jerusalem
  ('pseudepigrapha', '3-baruch', 1, 2, 'canon', 'lamentations', 1, 1, 'free', E'Lamentations 1:1 — *How doth the city sit solitary, that was full of people! how is she become as a widow! she that was great among the nations, and princess among the provinces, how is she become tributary!* Baruch''s weeping over the captivity of Jerusalem is the very lament Jeremiah raises over the solitary city.'),
  ('pseudepigrapha', '3-baruch', 1, 2, 'canon', 'lamentations', 1, 16, 'free', E'Lamentations 1:16 — *For these things I weep; mine eye, mine eye runneth down with water, because the comforter that should relieve my soul is far from me: my children are desolate, because the enemy prevailed.* The scribe''s tears in 3 Baruch 1:2 echo the weeping of Lamentations, where the comforter is far off — until the angel comes.'),
  ('pseudepigrapha', '3-baruch', 1, 3, 'canon', 'jeremiah', 39, 8, 'free', E'Jeremiah 39:8 — *And the Chaldeans burned the king''s house, and the houses of the people, with fire, and brake down the walls of Jerusalem.* Baruch grieves that Nebuchadnezzar was permitted to destroy the city; this is the Chaldean burning Jeremiah''s book records.'),
  ('pseudepigrapha', '3-baruch', 1, 3, 'canon', '2-kings', 25, 9, 'free', E'2 Kings 25:9 — *And he burnt the house of Yahuah (LORD), and the king''s house, and all the houses of Jerusalem, and every great man''s house burnt he with fire.* The destruction of His city in 3 Baruch 1:3 is the burning of Yahuah''s house and Jerusalem the Kings account sets down.'),
  ('pseudepigrapha', '3-baruch', 1, 2, 'canon', 'psalms', 137, 1, 'free', E'Psalms 137:1 — *By the rivers of Babylon, there we sat down, yea, we wept, when we remembered Zion.* Baruch standing upon the river weeping over Jerusalem is the exiles'' own posture by the rivers of Babylon.'),
  -- thread: 3-baruch-1-where-is-their-god
  ('pseudepigrapha', '3-baruch', 1, 3, 'canon', 'psalms', 79, 10, 'free', E'Psalms 79:10 — *Wherefore should the heathen say, Where is their Elohim (God)? let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed.* The nations'' reproach in 3 Baruch 1:3, "Where is their Elohim?", is word for word the heathen''s taunt in Asaph''s lament over a ruined Jerusalem.'),
  ('pseudepigrapha', '3-baruch', 1, 3, 'canon', 'psalms', 42, 3, 'free', E'Psalms 42:3 — *My tears have been my meat day and night, while they continually say unto me, Where is thy Elohim (God)?* Baruch''s tears under the taunt "Where is their Elohim?" are the same tears the psalmist eats day and night under the same reproach.'),
  ('pseudepigrapha', '3-baruch', 1, 3, 'canon', 'jeremiah', 7, 34, 'free', E'Jeremiah 7:34 — *Then will I cause to cease from the cities of Yahudah (Judah), and from the streets of Jerusalem, the voice of mirth, and the voice of gladness, the voice of the bridegroom, and the voice of the bride: for the land shall be desolate.* The desolation Baruch laments, that hands the nations their taunt, is the silencing of Judah''s streets Jeremiah foretold.'),
  -- thread: 3-baruch-1-baruch-the-scribe-comforted
  ('pseudepigrapha', '3-baruch', 1, 4, 'canon', 'jeremiah', 36, 4, 'free', E'Jeremiah 36:4 — *Then Jeremiah called Baruch the son of Neriah: and Baruch wrote from the mouth of Jeremiah all the words of Yahuah (LORD), which he had spoken unto him, upon a roll of a book.* The Baruch the angel addresses is this same son of Neriah, Jeremiah''s scribe who wrote the words of Yahuah on the roll.'),
  ('pseudepigrapha', '3-baruch', 1, 4, 'canon', 'jeremiah', 45, 3, 'free', E'Jeremiah 45:3 — *Thou didst say, Woe is me now! for Yahuah (LORD) hath added grief to my sorrow; I fainted in my sighing, and I find no rest.* The angel''s "trouble not thyself so greatly" answers the very grief Yahuah recorded of Baruch in Jeremiah 45 — the fainting, restless scribe.'),
  ('pseudepigrapha', '3-baruch', 1, 6, 'canon', 'jeremiah', 7, 19, 'free', E'Jeremiah 7:19 — *Do they provoke me to anger? saith Yahuah (LORD): do they not provoke themselves to the confusion of their own faces?* The angel''s charge in 3 Baruch 1:6 to "cease to provoke Elohim" reaches for the prophet''s word, that the people''s provoking falls back to their own confusion.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session410_3b01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session410_3b01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-1-weeping-over-jerusalem',
       E'Baruch weeping over the captivity of Jerusalem',
       E'3 Baruch opens with the scribe by the river, undone by the fall of the city: *A revelation of Baruch, who stood upon the river Gel weeping over the captivity of Jerusalem* (3 Baruch 1:2), grieving *that Nebuchadnezzar the king was permitted by Elohim (God) to destroy His city* (3 Baruch 1:3). This is no new lament — it is Jeremiah''s own book of tears: *How doth the city sit solitary, that was full of people! how is she become as a widow!* (Lamentations 1:1), and *For these things I weep; mine eye, mine eye runneth down with water, because the comforter that should relieve my soul is far from me* (Lamentations 1:16). The burning Baruch mourns is the burning the canon records: *And the Chaldeans burned the king''s house, and the houses of the people, with fire, and brake down the walls of Jerusalem* (Jeremiah 39:8), *And he burnt the house of Yahuah (LORD), and the king''s house, and all the houses of Jerusalem* (2 Kings 25:9). The exiles who sat and wept are heard again here: *By the rivers of Babylon, there we sat down, yea, we wept, when we remembered Zion* (Psalms 137:1). It ain''t new — Baruch by the river Gel is Israel by the rivers of Babylon.',
       sv.verse_id, ev.verse_id, 'extras', 81000
  FROM _session410_3b01_lookup sv, _session410_3b01_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-1-where-is-their-god',
       E'"Where is their Elohim?" — the reproach of the nations',
       E'Baruch voices the captive''s deepest wound — not the loss of stone, but the taunt that Yahuah has failed: *thou didst deliver us to nations such as these, so that they reproach us and say, Where is their Elohim (God)?* (3 Baruch 1:3). This is the cry the Psalms already carry: *Wherefore should the heathen say, Where is their Elohim (God)? let him be known among the heathen in our sight by the revenging of the blood of thy servants* (Psalms 79:10), and *My tears have been my meat day and night, while they continually say unto me, Where is thy Elohim (God)?* (Psalms 42:3). Jeremiah names the desolation that gives the taunt its sting: *Then will I cause to cease from the cities of Yahudah (Judah), and from the streets of Jerusalem, the voice of mirth, and the voice of gladness... for the land shall be desolate* (Jeremiah 7:34). Baruch''s question is old; the answer the angel brings — that the prayer was heard — is older still.',
       sv.verse_id, ev.verse_id, 'extras', 81003
  FROM _session410_3b01_lookup sv, _session410_3b01_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=1 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-1-baruch-the-scribe-comforted',
       E'Baruch the scribe — grief answered, prayer heard',
       E'The man weeping by the river is Jeremiah''s own scribe, and the canon both names him and answers his grief. Baruch wrote the prophet''s words: *Then Jeremiah called Baruch the son of Neriah: and Baruch wrote from the mouth of Jeremiah all the words of Yahuah (LORD)* (Jeremiah 36:4); and a word came to him in his sorrow: *Thou didst say, Woe is me now! for Yahuah (LORD) hath added grief to my sorrow; I fainted in my sighing, and I find no rest* (Jeremiah 45:3). Here the angel meets that same fainting scribe — *trouble not thyself so greatly concerning the salvation of Jerusalem* (3 Baruch 1:4) — and tells him his prayer is not lost: *For thy prayer was heard before Him, and entered into the ears of Yahuah Elohim (the Lord God)* (3 Baruch 1:5), then bids him *Cease to provoke Elohim (God)* (3 Baruch 1:6). The provoking is the word Yahuah used through Jeremiah: *Do they provoke me to anger? saith Yahuah (LORD): do they not provoke themselves to the confusion of their own faces?* (Jeremiah 7:19). It ain''t new — the scribe of Jeremiah is comforted with Jeremiah''s own words.',
       sv.verse_id, ev.verse_id, 'extras', 81006
  FROM _session410_3b01_lookup sv, _session410_3b01_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-baruch-1-weeping-over-jerusalem
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Lamentations 1:1 — *How doth the city sit solitary, that was full of people! how is she become as a widow! she that was great among the nations, and princess among the provinces, how is she become tributary!* Baruch''s weeping over the captivity of Jerusalem is the very lament Jeremiah raises over the solitary city.'
  FROM cross_reference_threads t, cross_references x, _session410_3b01_lookup sv, _session410_3b01_lookup tv
 WHERE t.slug='3-baruch-1-weeping-over-jerusalem'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Lamentations 1:16 — *For these things I weep; mine eye, mine eye runneth down with water, because the comforter that should relieve my soul is far from me: my children are desolate, because the enemy prevailed.* The scribe''s tears in 3 Baruch 1:2 echo the weeping of Lamentations, where the comforter is far off — until the angel comes.'
  FROM cross_reference_threads t, cross_references x, _session410_3b01_lookup sv, _session410_3b01_lookup tv
 WHERE t.slug='3-baruch-1-weeping-over-jerusalem'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 39:8 — *And the Chaldeans burned the king''s house, and the houses of the people, with fire, and brake down the walls of Jerusalem.* Baruch grieves that Nebuchadnezzar was permitted to destroy the city; this is the Chaldean burning Jeremiah''s book records.'
  FROM cross_reference_threads t, cross_references x, _session410_3b01_lookup sv, _session410_3b01_lookup tv
 WHERE t.slug='3-baruch-1-weeping-over-jerusalem'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=39 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Kings 25:9 — *And he burnt the house of Yahuah (LORD), and the king''s house, and all the houses of Jerusalem, and every great man''s house burnt he with fire.* The destruction of His city in 3 Baruch 1:3 is the burning of Yahuah''s house and Jerusalem the Kings account sets down.'
  FROM cross_reference_threads t, cross_references x, _session410_3b01_lookup sv, _session410_3b01_lookup tv
 WHERE t.slug='3-baruch-1-weeping-over-jerusalem'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=25 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalms 137:1 — *By the rivers of Babylon, there we sat down, yea, we wept, when we remembered Zion.* Baruch standing upon the river weeping over Jerusalem is the exiles'' own posture by the rivers of Babylon.'
  FROM cross_reference_threads t, cross_references x, _session410_3b01_lookup sv, _session410_3b01_lookup tv
 WHERE t.slug='3-baruch-1-weeping-over-jerusalem'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=137 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-1-where-is-their-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 79:10 — *Wherefore should the heathen say, Where is their Elohim (God)? let him be known among the heathen in our sight by the revenging of the blood of thy servants which is shed.* The nations'' reproach in 3 Baruch 1:3, "Where is their Elohim?", is word for word the heathen''s taunt in Asaph''s lament over a ruined Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session410_3b01_lookup sv, _session410_3b01_lookup tv
 WHERE t.slug='3-baruch-1-where-is-their-god'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 42:3 — *My tears have been my meat day and night, while they continually say unto me, Where is thy Elohim (God)?* Baruch''s tears under the taunt "Where is their Elohim?" are the same tears the psalmist eats day and night under the same reproach.'
  FROM cross_reference_threads t, cross_references x, _session410_3b01_lookup sv, _session410_3b01_lookup tv
 WHERE t.slug='3-baruch-1-where-is-their-god'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=42 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 7:34 — *Then will I cause to cease from the cities of Yahudah (Judah), and from the streets of Jerusalem, the voice of mirth, and the voice of gladness, the voice of the bridegroom, and the voice of the bride: for the land shall be desolate.* The desolation Baruch laments, that hands the nations their taunt, is the silencing of Judah''s streets Jeremiah foretold.'
  FROM cross_reference_threads t, cross_references x, _session410_3b01_lookup sv, _session410_3b01_lookup tv
 WHERE t.slug='3-baruch-1-where-is-their-god'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-1-baruch-the-scribe-comforted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 36:4 — *Then Jeremiah called Baruch the son of Neriah: and Baruch wrote from the mouth of Jeremiah all the words of Yahuah (LORD), which he had spoken unto him, upon a roll of a book.* The Baruch the angel addresses is this same son of Neriah, Jeremiah''s scribe who wrote the words of Yahuah on the roll.'
  FROM cross_reference_threads t, cross_references x, _session410_3b01_lookup sv, _session410_3b01_lookup tv
 WHERE t.slug='3-baruch-1-baruch-the-scribe-comforted'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=36 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 45:3 — *Thou didst say, Woe is me now! for Yahuah (LORD) hath added grief to my sorrow; I fainted in my sighing, and I find no rest.* The angel''s "trouble not thyself so greatly" answers the very grief Yahuah recorded of Baruch in Jeremiah 45 — the fainting, restless scribe.'
  FROM cross_reference_threads t, cross_references x, _session410_3b01_lookup sv, _session410_3b01_lookup tv
 WHERE t.slug='3-baruch-1-baruch-the-scribe-comforted'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=45 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 7:19 — *Do they provoke me to anger? saith Yahuah (LORD): do they not provoke themselves to the confusion of their own faces?* The angel''s charge in 3 Baruch 1:6 to "cease to provoke Elohim" reaches for the prophet''s word, that the people''s provoking falls back to their own confusion.'
  FROM cross_reference_threads t, cross_references x, _session410_3b01_lookup sv, _session410_3b01_lookup tv
 WHERE t.slug='3-baruch-1-baruch-the-scribe-comforted'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_3baruch_02.sql (session410 3-baruch 2) -----
-- Source anchor: pseudepigrapha/3-baruch ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3b02 (view _session410_3b02_lookup). Sort band base 81025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session410_3b02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-baruch-2-builders-of-the-tower
  ('pseudepigrapha', '3-baruch', 2, 7, 'canon', 'genesis', 11, 4, 'free', E'Genesis 11:4 — *And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth.* The men of the first heaven who "built the tower of strife against Elohim" are the Babel builders of this verse.'),
  ('pseudepigrapha', '3-baruch', 2, 7, 'canon', 'genesis', 11, 8, 'free', E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* That Yahuah "banished them" in 3 Baruch 2:7 is the scattering from Babel Genesis records.'),
  ('pseudepigrapha', '3-baruch', 2, 7, 'canon', 'genesis', 11, 9, 'free', E'Genesis 11:9 — *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth.* The judgment behind the angel''s word in 3 Baruch 2:7 is Babel, where the speech was confounded and the builders scattered.'),
  ('pseudepigrapha', '3-baruch', 2, 7, 'jubilees', 'jubilees', 10, 26, 'extras', E'Jubilees 10:26 — *And Yahuah (God) sent a mighty wind against the tower and overthrew it upon the earth, and behold it was between Asshur and Babylon in the land of Shinar, and they called its name "Overthrow."* Jubilees records the same tower of strife overthrown and its builders judged that 3 Baruch 2:7 places in the first heaven.'),
  -- thread: 3-baruch-2-beast-faces-lost-image
  ('pseudepigrapha', '3-baruch', 2, 3, 'canon', 'isaiah', 14, 13, 'free', E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north:* the beast-faced builders of 3 Baruch 2:3 share the pride that says "I will ascend into heaven" — the same reach against Elohim as the tower.'),
  ('pseudepigrapha', '3-baruch', 2, 3, 'canon', 'isaiah', 14, 15, 'free', E'Isaiah 14:15 — *Yet thou shalt be brought down to hell, to the sides of the pit.* The men disfigured to beasts'' faces in the first heaven are the proud brought low; pride that climbs against Elohim is cast down to the pit.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session410_3b02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session410_3b02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-2-builders-of-the-tower',
       E'The first heaven — the builders of the tower banished',
       E'In the first heaven Baruch is shown a plain of men, and the angel names them: *These are they who built the tower of strife against Elohim (God), and Yahuah (Lord) banished them* (3 Baruch 2:7). This is Babel, and it ain''t new: *And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth* (Genesis 11:4). The banishing the angel speaks of is the scattering Genesis records: *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city* (Genesis 11:8), and *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth* (Genesis 11:9). Jubilees tells the same overthrow: *And Yahuah (God) sent a mighty wind against the tower and overthrew it upon the earth... and they called its name "Overthrow"* (Jubilees 10:26). The tower of strife against Elohim is the oldest pattern of the city of man, judged and scattered.',
       sv.verse_id, ev.verse_id, 'extras', 81025
  FROM _session410_3b02_lookup sv, _session410_3b02_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-2-beast-faces-lost-image',
       E'Faces of oxen and goats — those who lost the image',
       E'The builders of the tower no longer wear the face of man: *there were men dwelling thereon, with the faces of oxen, and the horns of stags, and the feet of goats, and the haunches of lambs* (3 Baruch 2:3). The picture is a parable of judgment, not a doctrine — yet its root is real: man was made in the image of Elohim, and pride that builds against heaven is pride that sinks toward the beast. Isaiah names the same ambition and the same fall: *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God)* (Isaiah 14:13), *I will ascend above the heights of the clouds; I will be like the El Elyon (most High)* (Isaiah 14:14), *Yet thou shalt be brought down to hell, to the sides of the pit* (Isaiah 14:15). The men who reached for heaven by the tower are brought low — the lifting up of self ends in the loss of the face. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 81028
  FROM _session410_3b02_lookup sv, _session410_3b02_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-baruch-2-builders-of-the-tower
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:4 — *And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth.* The men of the first heaven who "built the tower of strife against Elohim" are the Babel builders of this verse.'
  FROM cross_reference_threads t, cross_references x, _session410_3b02_lookup sv, _session410_3b02_lookup tv
 WHERE t.slug='3-baruch-2-builders-of-the-tower'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* That Yahuah "banished them" in 3 Baruch 2:7 is the scattering from Babel Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session410_3b02_lookup sv, _session410_3b02_lookup tv
 WHERE t.slug='3-baruch-2-builders-of-the-tower'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:9 — *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth.* The judgment behind the angel''s word in 3 Baruch 2:7 is Babel, where the speech was confounded and the builders scattered.'
  FROM cross_reference_threads t, cross_references x, _session410_3b02_lookup sv, _session410_3b02_lookup tv
 WHERE t.slug='3-baruch-2-builders-of-the-tower'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 10:26 — *And Yahuah (God) sent a mighty wind against the tower and overthrew it upon the earth, and behold it was between Asshur and Babylon in the land of Shinar, and they called its name "Overthrow."* Jubilees records the same tower of strife overthrown and its builders judged that 3 Baruch 2:7 places in the first heaven.'
  FROM cross_reference_threads t, cross_references x, _session410_3b02_lookup sv, _session410_3b02_lookup tv
 WHERE t.slug='3-baruch-2-builders-of-the-tower'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-2-beast-faces-lost-image
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north:* the beast-faced builders of 3 Baruch 2:3 share the pride that says "I will ascend into heaven" — the same reach against Elohim as the tower.'
  FROM cross_reference_threads t, cross_references x, _session410_3b02_lookup sv, _session410_3b02_lookup tv
 WHERE t.slug='3-baruch-2-beast-faces-lost-image'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 14:15 — *Yet thou shalt be brought down to hell, to the sides of the pit.* The men disfigured to beasts'' faces in the first heaven are the proud brought low; pride that climbs against Elohim is cast down to the pit.'
  FROM cross_reference_threads t, cross_references x, _session410_3b02_lookup sv, _session410_3b02_lookup tv
 WHERE t.slug='3-baruch-2-beast-faces-lost-image'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_3baruch_03.sql (session410 3-baruch 3) -----
-- Source anchor: pseudepigrapha/3-baruch ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3b03 (view _session410_3b03_lookup). Sort band base 81050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session410_3b03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-baruch-3-brick-toil-of-babel
  ('pseudepigrapha', '3-baruch', 3, 5, 'canon', 'genesis', 11, 3, 'free', E'Genesis 11:3 — *And they said one to another, Go to, let us make brick, and burn them throughly. And they had brick for stone, and slime had they for morter.* The brick-making the counsellors of 3 Baruch 3:5 force on the multitudes is the Babel brick of Genesis 11.'),
  ('pseudepigrapha', '3-baruch', 3, 5, 'canon', 'exodus', 1, 14, 'free', E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* The cruel brick-toil that would not release a woman even in childbirth (3 Baruch 3:5) is the same bondage in morter and brick Egypt laid on Israel with rigour.'),
  ('pseudepigrapha', '3-baruch', 3, 5, 'jubilees', 'jubilees', 10, 20, 'extras', E'Jubilees 10:20 — *And they began to build, and in the fourth week they made brick with fire, and the bricks served them for stone, and the clay with which they cemented them together was asphalt which comes out of the sea, and out of the fountains of water in the land of Shinar.* Jubilees records the same brick-making in Shinar that 3 Baruch 3:5 says was driven on the multitudes by force.'),
  -- thread: 3-baruch-3-confused-speech-pierce-heaven
  ('pseudepigrapha', '3-baruch', 3, 8, 'canon', 'genesis', 11, 6, 'free', E'Genesis 11:6 — *And Yahuah (LORD) said, Behold, the people is one, and they have all one language; and this they begin to do: and now nothing will be restrained from them, which they have imagined to do.* The presumption Elohim halts in 3 Baruch 3:8 is the one Yahuah marks at Babel, where the people imagined nothing would be restrained from them.'),
  ('pseudepigrapha', '3-baruch', 3, 8, 'canon', 'genesis', 11, 7, 'free', E'Genesis 11:7 — *Go to, let us go down, and there confound their language, that they may not understand one another''s speech.* The "confusion of speech" with which Elohim smote the builders in 3 Baruch 3:8 is the confounding of language Yahuah pronounces in Genesis 11:7.'),
  ('pseudepigrapha', '3-baruch', 3, 8, 'jubilees', 'jubilees', 10, 24, 'extras', E'Jubilees 10:24 — *And He confounded their language, and they no longer understood one another''s speech, and they ceased then to build the city and the tower.* Jubilees records the same confounding of speech and ceasing of the work that 3 Baruch 3:8 describes.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session410_3b03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session410_3b03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-3-brick-toil-of-babel',
       E'The brick-toil of Babel — bondage in the making of bricks',
       E'In the second heaven are those who drove the multitudes to the tower''s labor: *These are they who gave counsel to build the tower... they whom thou seest drove forth multitudes of both men and women, to make bricks; among whom, a woman making bricks was not allowed to be released in the hour of child-birth, but brought forth while she was making bricks* (3 Baruch 3:5). The brick is the mark of Babel: *And they said one to another, Go to, let us make brick, and burn them throughly. And they had brick for stone* (Genesis 11:3). And the cruelty of forced brick-labor is the very bondage Egypt would later lay on Israel: *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field... was with rigour* (Exodus 1:14). Jubilees records the same brick-making in Shinar: *And they began to build, and in the fourth week they made brick with fire, and the bricks served them for stone* (Jubilees 10:20). The tyrant''s brickyard, from Babel to Egypt, is one old story of man oppressing man. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 81050
  FROM _session410_3b03_lookup sv, _session410_3b03_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=3 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-3-confused-speech-pierce-heaven',
       E'Confounded speech — they sought to pierce the heaven',
       E'The builders'' presumption reaches its height: *they took a gimlet, and sought to pierce the heaven, saying, Let us see whether the heaven is made of clay, or of brass, or of iron* (3 Baruch 3:7); and the judgment falls: *When Elohim (God) saw this He did not permit them, but smote them with blindness and confusion of speech* (3 Baruch 3:8). This is Genesis exactly — the LORD coming down to the tower that reached for heaven: *And Yahuah (LORD) said, Behold, the people is one, and they have all one language; and this they begin to do: and now nothing will be restrained from them, which they have imagined to do* (Genesis 11:6), *Go to, let us go down, and there confound their language, that they may not understand one another''s speech* (Genesis 11:7). Jubilees names the same confounding: *And He confounded their language, and they no longer understood one another''s speech, and they ceased then to build the city and the tower* (Jubilees 10:24). The presumption that would pierce heaven ends in confusion of tongues. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 81053
  FROM _session410_3b03_lookup sv, _session410_3b03_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=3 AND sv.verse_number=6
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-baruch-3-brick-toil-of-babel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:3 — *And they said one to another, Go to, let us make brick, and burn them throughly. And they had brick for stone, and slime had they for morter.* The brick-making the counsellors of 3 Baruch 3:5 force on the multitudes is the Babel brick of Genesis 11.'
  FROM cross_reference_threads t, cross_references x, _session410_3b03_lookup sv, _session410_3b03_lookup tv
 WHERE t.slug='3-baruch-3-brick-toil-of-babel'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:14 — *And they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field: all their service, wherein they made them serve, was with rigour.* The cruel brick-toil that would not release a woman even in childbirth (3 Baruch 3:5) is the same bondage in morter and brick Egypt laid on Israel with rigour.'
  FROM cross_reference_threads t, cross_references x, _session410_3b03_lookup sv, _session410_3b03_lookup tv
 WHERE t.slug='3-baruch-3-brick-toil-of-babel'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 10:20 — *And they began to build, and in the fourth week they made brick with fire, and the bricks served them for stone, and the clay with which they cemented them together was asphalt which comes out of the sea, and out of the fountains of water in the land of Shinar.* Jubilees records the same brick-making in Shinar that 3 Baruch 3:5 says was driven on the multitudes by force.'
  FROM cross_reference_threads t, cross_references x, _session410_3b03_lookup sv, _session410_3b03_lookup tv
 WHERE t.slug='3-baruch-3-brick-toil-of-babel'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-3-confused-speech-pierce-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:6 — *And Yahuah (LORD) said, Behold, the people is one, and they have all one language; and this they begin to do: and now nothing will be restrained from them, which they have imagined to do.* The presumption Elohim halts in 3 Baruch 3:8 is the one Yahuah marks at Babel, where the people imagined nothing would be restrained from them.'
  FROM cross_reference_threads t, cross_references x, _session410_3b03_lookup sv, _session410_3b03_lookup tv
 WHERE t.slug='3-baruch-3-confused-speech-pierce-heaven'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:7 — *Go to, let us go down, and there confound their language, that they may not understand one another''s speech.* The "confusion of speech" with which Elohim smote the builders in 3 Baruch 3:8 is the confounding of language Yahuah pronounces in Genesis 11:7.'
  FROM cross_reference_threads t, cross_references x, _session410_3b03_lookup sv, _session410_3b03_lookup tv
 WHERE t.slug='3-baruch-3-confused-speech-pierce-heaven'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 10:24 — *And He confounded their language, and they no longer understood one another''s speech, and they ceased then to build the city and the tower.* Jubilees records the same confounding of speech and ceasing of the work that 3 Baruch 3:8 describes.'
  FROM cross_reference_threads t, cross_references x, _session410_3b03_lookup sv, _session410_3b03_lookup tv
 WHERE t.slug='3-baruch-3-confused-speech-pierce-heaven'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_3baruch_04.sql (session410 3-baruch 4) -----
-- Source anchor: pseudepigrapha/3-baruch ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3b04 (view _session410_3b04_lookup). Sort band base 81075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session410_3b04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-baruch-4-vine-the-tree-that-led-adam-astray
  ('pseudepigrapha', '3-baruch', 4, 8, 'canon', 'genesis', 3, 1, 'free', E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* The angel''s account that the devil deceived Adam through the tree reaches for the subtil serpent of the Eden narrative.'),
  ('pseudepigrapha', '3-baruch', 4, 8, 'canon', 'genesis', 3, 6, 'free', E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* That Adam was led astray by the tree, in 3 Baruch 4:7-8, is the eating of the forbidden fruit Genesis records.'),
  ('pseudepigrapha', '3-baruch', 4, 8, 'canon', 'genesis', 3, 13, 'free', E'Genesis 3:13 — *And Yahuah Elohim (the LORD God) said unto the woman, What is this that thou hast done? And the woman said, The serpent beguiled me, and I did eat.* The deception "through his vine" in 3 Baruch 4:8 is the serpent''s beguiling the woman confesses in Eden.'),
  -- thread: 3-baruch-4-deluge-and-the-giants
  ('pseudepigrapha', '3-baruch', 4, 10, 'canon', 'genesis', 7, 20, 'free', E'Genesis 7:20 — *Fifteen cubits upward did the waters prevail; and the mountains were covered.* The angel''s measure in 3 Baruch 4:10 — the water rising fifteen cubits above the highest mountains — is the exact depth Genesis gives for the flood.'),
  ('pseudepigrapha', '3-baruch', 4, 10, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The giants the deluge destroyed in 3 Baruch 4:10 are the giants of the earth Genesis names before the flood.'),
  -- thread: 3-baruch-4-noah-replants-the-vine
  ('pseudepigrapha', '3-baruch', 4, 11, 'canon', 'genesis', 9, 20, 'free', E'Genesis 9:20 — *And Noah began to be an husbandman, and he planted a vineyard:* the Noah who comes out of the ark and plants the shoot of the vine in 3 Baruch 4:11-15 is the husbandman who plants a vineyard in Genesis.'),
  ('pseudepigrapha', '3-baruch', 4, 15, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The angel''s word that the curse becomes a blessing through the Immanuel rests on the first promise of the seed who would bruise the serpent''s head.'),
  ('pseudepigrapha', '3-baruch', 4, 15, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* the angel''s "as through it the human race obtained condemnation" is Paul''s one-man entry of sin and death.'),
  ('pseudepigrapha', '3-baruch', 4, 15, 'canon', '1-corinthians', 15, 22, 'free', E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive.* The "so again through Yahusha HaMashiach" of 3 Baruch 4:15 is Paul''s Adam-to-Messiah pattern: condemnation in the first, life in the last.'),
  -- thread: 3-baruch-4-warning-against-drunkenness
  ('pseudepigrapha', '3-baruch', 4, 17, 'canon', 'proverbs', 23, 31, 'free', E'Proverbs 23:31 — *Look not thou upon the wine when it is red, when it giveth his colour in the cup, when it moveth itself aright;* the angel''s warning against drinking wine insatiably (3 Baruch 4:16-17) is the wisdom of Proverbs: beware the wine in the cup.'),
  ('pseudepigrapha', '3-baruch', 4, 17, 'canon', 'proverbs', 23, 32, 'free', E'Proverbs 23:32 — *At the last it biteth like a serpent, and stingeth like an adder.* That the wine of 3 Baruch 4:17 breeds all evils echoes Proverbs, where wine at the last bites like a serpent — fitting, since the serpent met man at the vine.'),
  ('pseudepigrapha', '3-baruch', 4, 16, 'canon', 'isaiah', 5, 11, 'free', E'Isaiah 5:11 — *Woe unto them that rise up early in the morning, that they may follow strong drink; that continue until night, till wine inflame them!* The insatiable drinkers of 3 Baruch 4:16 stand under the prophet''s woe upon those inflamed by strong drink.'),
  ('pseudepigrapha', '3-baruch', 4, 16, 'canon', 'ephesians', 5, 18, 'free', E'Ephesians 5:18 — *And be not drunk with wine, wherein is excess; but be filled with the Spirit;* the angel''s caution against drinking wine to surfeit (3 Baruch 4:16) is Paul''s command not to be drunk with wine, wherein is excess.'),
  ('pseudepigrapha', '3-baruch', 4, 17, 'canon', 'galatians', 5, 21, 'free', E'Galatians 5:21 — *Envyings, murders, drunkenness, revellings, and such like: of the which I tell you before... that they which do such things shall not inherit the kingdom of Elohim (God).* The murders and evils that the angel says come from wine (3 Baruch 4:17), and surrender to eternal fire, are the works Paul says bar the kingdom.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session410_3b04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session410_3b04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-4-vine-the-tree-that-led-adam-astray',
       E'The vine — the tree by which the serpent deceived Adam',
       E'Baruch asks to be shown *which is the tree which led Adam astray* (3 Baruch 4:7), and the angel answers that it was the vine, planted by the deceiver: *It is the vine... and therefore the devil being envious deceived him through his vine* (3 Baruch 4:8). The naming of the tree as a vine is this apocalypse''s own embellishment, not Torah — but the root it reaches for is the true Eden account: a serpent''s cunning, a tree forbidden, and a deception. *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made* (Genesis 3:1); *And the serpent said unto the woman, Ye shall not surely die* (Genesis 3:4); *she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat* (Genesis 3:6); and the woman confesses, *The serpent beguiled me, and I did eat* (Genesis 3:13). Whatever the tree, the canon is plain: the serpent deceived, the fruit was eaten, and judgment came. 3 Baruch confirms the old account; it does not amend it. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 81075
  FROM _session410_3b04_lookup sv, _session410_3b04_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=4 AND sv.verse_number=7
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-4-deluge-and-the-giants',
       E'The deluge, the giants, and the vine washed from paradise',
       E'The angel recalls the flood that judged a world of violence: *When Elohim (God) caused the deluge upon earth, and destroyed all flesh, and four hundred and nine thousand giants, and the water rose fifteen cubits above the highest mountains, then the water entered into paradise and destroyed every flower; but it removed wholly without the bounds the shoot of the vine and cast it outside* (3 Baruch 4:10). The flood and its measure are Genesis: *Fifteen cubits upward did the waters prevail; and the mountains were covered* (Genesis 7:20). The giants belong to the generation the flood swept away: *There were giants in the earth in those days... the same became mighty men which were of old, men of renown* (Genesis 6:4). The detail of the vine cast from paradise is the apocalypse''s own thread, but the deluge it hangs on is the canon''s exactly — fifteen cubits, all flesh destroyed, the world of the giants ended. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 81078
  FROM _session410_3b04_lookup sv, _session410_3b04_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=4 AND sv.verse_number=10
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=4 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-4-noah-replants-the-vine',
       E'Noah replants the vine — curse turned to blessing in Messiah',
       E'After the flood Noah finds the vine''s shoot and dares not plant it until Elohim answers: *Arise, Noah, and plant the shoot of the vine, for thus saith Yahuah (Lord): Its bitterness shall be changed into sweetness, and its curse shall become a blessing... and as through it the human race obtained condemnation, so again through Yahusha HaMashiach (Jesus Christ) the Immanuel will they receive in Him the upward calling, and the entry into paradise* (3 Baruch 4:15). That Noah was a husbandman who planted the vine is Genesis: *And Noah began to be an husbandman, and he planted a vineyard* (Genesis 9:20). And the structure the angel preaches — condemnation by one, life through another — is the apostle''s: *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12), *For as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:22). Even the first promise of the bruised serpent stands behind it: *I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head* (Genesis 3:15). The curse turned to blessing through the seed of the woman — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 81081
  FROM _session410_3b04_lookup sv, _session410_3b04_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=4 AND sv.verse_number=11
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=4 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-4-warning-against-drunkenness',
       E'The wine that begets all evils — the warning against drunkenness',
       E'The angel turns the vine''s blessing into a sober warning: those who drink it without measure *transgress worse than Adam, and are far from the glory of Elohim (God), and are surrendering themselves to the eternal fire* (3 Baruch 4:16); for from the drinking of wine *come all evils, such as murders, adulteries, fornications, perjuries, thefts* (3 Baruch 4:17). This is the counsel of the prophets and the apostles. Wisdom warns: *Look not thou upon the wine when it is red, when it giveth his colour in the cup, when it moveth itself aright* (Proverbs 23:31), for *At the last it biteth like a serpent, and stingeth like an adder* (Proverbs 23:32). Isaiah pronounces woe: *Woe unto them that rise up early in the morning, that they may follow strong drink; that continue until night, till wine inflame them!* (Isaiah 5:11). And Paul commands: *And be not drunk with wine, wherein is excess; but be filled with the Spirit* (Ephesians 5:18), warning that *drunkenness, revellings, and such like... they which do such things shall not inherit the kingdom of Elohim (God)* (Galatians 5:21). The serpent first met man at the vine; the warning against its excess is as old as Eden. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 81084
  FROM _session410_3b04_lookup sv, _session410_3b04_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=4 AND sv.verse_number=16
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=4 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-baruch-4-vine-the-tree-that-led-adam-astray
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* The angel''s account that the devil deceived Adam through the tree reaches for the subtil serpent of the Eden narrative.'
  FROM cross_reference_threads t, cross_references x, _session410_3b04_lookup sv, _session410_3b04_lookup tv
 WHERE t.slug='3-baruch-4-vine-the-tree-that-led-adam-astray'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* That Adam was led astray by the tree, in 3 Baruch 4:7-8, is the eating of the forbidden fruit Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session410_3b04_lookup sv, _session410_3b04_lookup tv
 WHERE t.slug='3-baruch-4-vine-the-tree-that-led-adam-astray'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:13 — *And Yahuah Elohim (the LORD God) said unto the woman, What is this that thou hast done? And the woman said, The serpent beguiled me, and I did eat.* The deception "through his vine" in 3 Baruch 4:8 is the serpent''s beguiling the woman confesses in Eden.'
  FROM cross_reference_threads t, cross_references x, _session410_3b04_lookup sv, _session410_3b04_lookup tv
 WHERE t.slug='3-baruch-4-vine-the-tree-that-led-adam-astray'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-4-deluge-and-the-giants
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:20 — *Fifteen cubits upward did the waters prevail; and the mountains were covered.* The angel''s measure in 3 Baruch 4:10 — the water rising fifteen cubits above the highest mountains — is the exact depth Genesis gives for the flood.'
  FROM cross_reference_threads t, cross_references x, _session410_3b04_lookup sv, _session410_3b04_lookup tv
 WHERE t.slug='3-baruch-4-deluge-and-the-giants'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The giants the deluge destroyed in 3 Baruch 4:10 are the giants of the earth Genesis names before the flood.'
  FROM cross_reference_threads t, cross_references x, _session410_3b04_lookup sv, _session410_3b04_lookup tv
 WHERE t.slug='3-baruch-4-deluge-and-the-giants'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-4-noah-replants-the-vine
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:20 — *And Noah began to be an husbandman, and he planted a vineyard:* the Noah who comes out of the ark and plants the shoot of the vine in 3 Baruch 4:11-15 is the husbandman who plants a vineyard in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session410_3b04_lookup sv, _session410_3b04_lookup tv
 WHERE t.slug='3-baruch-4-noah-replants-the-vine'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The angel''s word that the curse becomes a blessing through the Immanuel rests on the first promise of the seed who would bruise the serpent''s head.'
  FROM cross_reference_threads t, cross_references x, _session410_3b04_lookup sv, _session410_3b04_lookup tv
 WHERE t.slug='3-baruch-4-noah-replants-the-vine'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* the angel''s "as through it the human race obtained condemnation" is Paul''s one-man entry of sin and death.'
  FROM cross_reference_threads t, cross_references x, _session410_3b04_lookup sv, _session410_3b04_lookup tv
 WHERE t.slug='3-baruch-4-noah-replants-the-vine'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive.* The "so again through Yahusha HaMashiach" of 3 Baruch 4:15 is Paul''s Adam-to-Messiah pattern: condemnation in the first, life in the last.'
  FROM cross_reference_threads t, cross_references x, _session410_3b04_lookup sv, _session410_3b04_lookup tv
 WHERE t.slug='3-baruch-4-noah-replants-the-vine'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-4-warning-against-drunkenness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 23:31 — *Look not thou upon the wine when it is red, when it giveth his colour in the cup, when it moveth itself aright;* the angel''s warning against drinking wine insatiably (3 Baruch 4:16-17) is the wisdom of Proverbs: beware the wine in the cup.'
  FROM cross_reference_threads t, cross_references x, _session410_3b04_lookup sv, _session410_3b04_lookup tv
 WHERE t.slug='3-baruch-4-warning-against-drunkenness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 23:32 — *At the last it biteth like a serpent, and stingeth like an adder.* That the wine of 3 Baruch 4:17 breeds all evils echoes Proverbs, where wine at the last bites like a serpent — fitting, since the serpent met man at the vine.'
  FROM cross_reference_threads t, cross_references x, _session410_3b04_lookup sv, _session410_3b04_lookup tv
 WHERE t.slug='3-baruch-4-warning-against-drunkenness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 5:11 — *Woe unto them that rise up early in the morning, that they may follow strong drink; that continue until night, till wine inflame them!* The insatiable drinkers of 3 Baruch 4:16 stand under the prophet''s woe upon those inflamed by strong drink.'
  FROM cross_reference_threads t, cross_references x, _session410_3b04_lookup sv, _session410_3b04_lookup tv
 WHERE t.slug='3-baruch-4-warning-against-drunkenness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 5:18 — *And be not drunk with wine, wherein is excess; but be filled with the Spirit;* the angel''s caution against drinking wine to surfeit (3 Baruch 4:16) is Paul''s command not to be drunk with wine, wherein is excess.'
  FROM cross_reference_threads t, cross_references x, _session410_3b04_lookup sv, _session410_3b04_lookup tv
 WHERE t.slug='3-baruch-4-warning-against-drunkenness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Galatians 5:21 — *Envyings, murders, drunkenness, revellings, and such like: of the which I tell you before... that they which do such things shall not inherit the kingdom of Elohim (God).* The murders and evils that the angel says come from wine (3 Baruch 4:17), and surrender to eternal fire, are the works Paul says bar the kingdom.'
  FROM cross_reference_threads t, cross_references x, _session410_3b04_lookup sv, _session410_3b04_lookup tv
 WHERE t.slug='3-baruch-4-warning-against-drunkenness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_3baruch_05.sql (session410 3-baruch 5) -----
-- Source anchor: pseudepigrapha/3-baruch ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3b05 (view _session410_3b05_lookup). Sort band base 81100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session410_3b05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-baruch-5-his-belly-is-hades
  ('pseudepigrapha', '3-baruch', 5, 3, 'canon', 'isaiah', 5, 14, 'free', E'Isaiah 5:14 — *Therefore hell hath enlarged herself, and opened her mouth without measure: and their glory, and their multitude, and their pomp, and he that rejoiceth, shall descend into it.* The dragon''s belly that is Hades is the same grave Isaiah sees opening its mouth without measure.'),
  ('pseudepigrapha', '3-baruch', 5, 3, 'canon', 'proverbs', 27, 20, 'extras', E'Proverbs 27:20 — *Hell and destruction are never full; so the eyes of man are never satisfied.* The vast belly that no plummet can sound is the never-full grave the wise already knew.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session410_3b05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session410_3b05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-5-his-belly-is-hades',
       E'The dragon whose belly is Hades',
       E'*And the angel said, His belly is Hades.* It ain''t new. Baruch asks how great is the belly of the devouring dragon, and the answer names it Hades — the grave that is never satisfied. The prophets already measure this same insatiable maw: *Therefore hell hath enlarged herself, and opened her mouth without measure* (Isaiah 5:14); *Hell and destruction are never full; so the eyes of man are never satisfied* (Proverbs 27:20). The apocalypse''s monstrous belly is the picture; the prophets give the name and the meaning.',
       sv.verse_id, ev.verse_id, 'extras', 81100
  FROM _session410_3b05_lookup sv, _session410_3b05_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=5 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=5 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-baruch-5-his-belly-is-hades
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 5:14 — *Therefore hell hath enlarged herself, and opened her mouth without measure: and their glory, and their multitude, and their pomp, and he that rejoiceth, shall descend into it.* The dragon''s belly that is Hades is the same grave Isaiah sees opening its mouth without measure.'
  FROM cross_reference_threads t, cross_references x, _session410_3b05_lookup sv, _session410_3b05_lookup tv
 WHERE t.slug='3-baruch-5-his-belly-is-hades'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 27:20 — *Hell and destruction are never full; so the eyes of man are never satisfied.* The vast belly that no plummet can sound is the never-full grave the wise already knew.'
  FROM cross_reference_threads t, cross_references x, _session410_3b05_lookup sv, _session410_3b05_lookup tv
 WHERE t.slug='3-baruch-5-his-belly-is-hades'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=27 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_3baruch_06.sql (session410 3-baruch 6) -----
-- Source anchor: pseudepigrapha/3-baruch ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3b06 (view _session410_3b06_lookup). Sort band base 81125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session410_3b06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-baruch-6-the-sun-set-in-the-heavens
  ('pseudepigrapha', '3-baruch', 6, 1, 'canon', 'genesis', 1, 16, 'free', E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The fiery sun Baruch sees go forth is the greater light God made on the fourth day to rule the day.'),
  ('pseudepigrapha', '3-baruch', 6, 1, 'canon', 'psalms', 104, 22, 'extras', E'Psalm 104:22 — *The sun ariseth, they gather themselves together, and lay them down in their dens.* The sun''s daily going-forth orders the whole creation''s day, exactly as Baruch is shown.'),
  -- thread: 3-baruch-6-guardian-bird-preserves-the-living
  ('pseudepigrapha', '3-baruch', 6, 6, 'canon', 'psalms', 104, 24, 'extras', E'Psalm 104:24 — *O Yahuah (LORD), how manifold are thy works! in wisdom hast thou made them all: the earth is full of thy riches.* That any living creature is preserved under the sun is the wisdom of God, who appointed every means, not the merit of the bird.'),
  ('pseudepigrapha', '3-baruch', 6, 5, 'canon', 'psalms', 19, 6, 'extras', E'Psalm 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The fiery rays the bird is said to receive are the same heat God set over all the earth''s circuit.'),
  -- thread: 3-baruch-6-manna-of-heaven-and-dew
  ('pseudepigrapha', '3-baruch', 6, 10, 'canon', 'exodus', 16, 4, 'free', E'Exodus 16:4 — *Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them.* The manna of heaven the bird is said to eat is the bread God rained on Israel.'),
  ('pseudepigrapha', '3-baruch', 6, 10, 'canon', 'exodus', 16, 14, 'extras', E'Exodus 16:14 — *And when the dew that lay was gone up, behold, upon the face of the wilderness there lay a small round thing, as small as the hoar frost on the ground.* Manna and dew came together in the wilderness, the same pairing the apocalypse names.'),
  -- thread: 3-baruch-6-light-separated-from-darkness
  ('pseudepigrapha', '3-baruch', 6, 12, 'canon', 'genesis', 1, 4, 'free', E'Genesis 1:4 — *And Elohim (God) saw the light, that it was good: and Elohim (God) divided the light from the darkness.* The daily separating of light from darkness at the gates is the first-day work of God, repeated every morning.'),
  ('pseudepigrapha', '3-baruch', 6, 13, 'canon', 'genesis', 1, 5, 'extras', E'Genesis 1:5 — *And Elohim (God) called the light Day, and the darkness he called Night. And the evening and the morning were the first day.* The voice calling for radiance to be given the world echoes God naming Day and Night at creation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session410_3b06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session410_3b06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-6-the-sun-set-in-the-heavens',
       E'The sun set in the firmament to give light',
       E'*And he took me and led me where the sun goes forth.* It ain''t new. Baruch is brought to the sun''s gate; whatever the chariot and the crown of fire embellish, the root is the fourth day, when Elohim set the great light to rule. *And Elohim made two great lights; the greater light to rule the day* (Genesis 1:16); the psalmist watches it keep its appointed round — *the sun knoweth his going down* (Psalm 104:19), *the sun ariseth... man goeth forth unto his work and to his labour until the evening* (Psalm 104:22-23). The sun does not go forth of itself; God appointed it, and it obeys.',
       sv.verse_id, ev.verse_id, 'extras', 81125
  FROM _session410_3b06_lookup sv, _session410_3b06_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=6 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-6-guardian-bird-preserves-the-living',
       E'The bird appointed to shield the living creatures',
       E'*This bird flies alongside of the sun, and expanding his wings receives its fiery rays. For if he were not receiving them, the human race would not be preserved... But Elohim appointed this bird thereto.* It ain''t new. The phoenix is the apocalypse''s embellishment, but the truth it reaches for is sound: it is God, not the creature, who tempers the heat so that life is preserved. The same God measures the sun''s heat so *there is nothing hid from the heat thereof* (Psalm 19:6), and it is by His wisdom — not a guardian bird''s — that *the earth is full of thy riches* (Psalm 104:24). The preserving of all flesh is God''s appointment.',
       sv.verse_id, ev.verse_id, 'extras', 81128
  FROM _session410_3b06_lookup sv, _session410_3b06_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=6 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=6 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-6-manna-of-heaven-and-dew',
       E'Fed with the manna of heaven and the dew of earth',
       E'*And what does he eat? ... The manna of heaven and the dew of earth.* It ain''t new. The bird''s food names the very provision God rained on Israel in the wilderness — bread from heaven that came with the dew. *I will rain bread from heaven for you* (Exodus 16:4); *when the dew that lay was gone up... they said one to another, It is manna* (Exodus 16:14-15). The apocalypse borrows the wilderness words; the original gift is God feeding His people by hand each morning.',
       sv.verse_id, ev.verse_id, 'extras', 81131
  FROM _session410_3b06_lookup sv, _session410_3b06_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=6 AND sv.verse_number=10
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=6 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-6-light-separated-from-darkness',
       E'The light separated from the darkness at the gates of heaven',
       E'*The angels are opening the three hundred and sixty-five gates of heaven, and the light is being separated from the darkness. And a voice came which said, Light-giver, give to the world radiance.* It ain''t new. The daily dividing of light from darkness is no new wonder — it is the first day''s word repeated every dawn. *And Elohim divided the light from the darkness. And Elohim called the light Day, and the darkness he called Night* (Genesis 1:4-5). What God spoke once He upholds without ceasing.',
       sv.verse_id, ev.verse_id, 'extras', 81134
  FROM _session410_3b06_lookup sv, _session410_3b06_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=6 AND sv.verse_number=12
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=6 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-baruch-6-the-sun-set-in-the-heavens
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The fiery sun Baruch sees go forth is the greater light God made on the fourth day to rule the day.'
  FROM cross_reference_threads t, cross_references x, _session410_3b06_lookup sv, _session410_3b06_lookup tv
 WHERE t.slug='3-baruch-6-the-sun-set-in-the-heavens'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 104:22 — *The sun ariseth, they gather themselves together, and lay them down in their dens.* The sun''s daily going-forth orders the whole creation''s day, exactly as Baruch is shown.'
  FROM cross_reference_threads t, cross_references x, _session410_3b06_lookup sv, _session410_3b06_lookup tv
 WHERE t.slug='3-baruch-6-the-sun-set-in-the-heavens'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-6-guardian-bird-preserves-the-living
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 104:24 — *O Yahuah (LORD), how manifold are thy works! in wisdom hast thou made them all: the earth is full of thy riches.* That any living creature is preserved under the sun is the wisdom of God, who appointed every means, not the merit of the bird.'
  FROM cross_reference_threads t, cross_references x, _session410_3b06_lookup sv, _session410_3b06_lookup tv
 WHERE t.slug='3-baruch-6-guardian-bird-preserves-the-living'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The fiery rays the bird is said to receive are the same heat God set over all the earth''s circuit.'
  FROM cross_reference_threads t, cross_references x, _session410_3b06_lookup sv, _session410_3b06_lookup tv
 WHERE t.slug='3-baruch-6-guardian-bird-preserves-the-living'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-6-manna-of-heaven-and-dew
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 16:4 — *Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them.* The manna of heaven the bird is said to eat is the bread God rained on Israel.'
  FROM cross_reference_threads t, cross_references x, _session410_3b06_lookup sv, _session410_3b06_lookup tv
 WHERE t.slug='3-baruch-6-manna-of-heaven-and-dew'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 16:14 — *And when the dew that lay was gone up, behold, upon the face of the wilderness there lay a small round thing, as small as the hoar frost on the ground.* Manna and dew came together in the wilderness, the same pairing the apocalypse names.'
  FROM cross_reference_threads t, cross_references x, _session410_3b06_lookup sv, _session410_3b06_lookup tv
 WHERE t.slug='3-baruch-6-manna-of-heaven-and-dew'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-6-light-separated-from-darkness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:4 — *And Elohim (God) saw the light, that it was good: and Elohim (God) divided the light from the darkness.* The daily separating of light from darkness at the gates is the first-day work of God, repeated every morning.'
  FROM cross_reference_threads t, cross_references x, _session410_3b06_lookup sv, _session410_3b06_lookup tv
 WHERE t.slug='3-baruch-6-light-separated-from-darkness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:5 — *And Elohim (God) called the light Day, and the darkness he called Night. And the evening and the morning were the first day.* The voice calling for radiance to be given the world echoes God naming Day and Night at creation.'
  FROM cross_reference_threads t, cross_references x, _session410_3b06_lookup sv, _session410_3b06_lookup tv
 WHERE t.slug='3-baruch-6-light-separated-from-darkness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_3baruch_07.sql (session410 3-baruch 7) -----
-- Source anchor: pseudepigrapha/3-baruch ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3b07 (view _session410_3b07_lookup). Sort band base 81150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session410_3b07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-baruch-7-the-sun-third-heaven-gives-light
  ('pseudepigrapha', '3-baruch', 7, 2, 'canon', 'genesis', 1, 15, 'free', E'Genesis 1:15 — *And let them be for lights in the firmament of the heaven to give light upon the earth: and it was so.* The sun passing through to give light to the world is doing the very work God set it for on the fourth day.'),
  -- thread: 3-baruch-7-crowned-sun-glory-too-great-to-behold
  ('pseudepigrapha', '3-baruch', 7, 4, 'canon', 'psalms', 19, 5, 'free', E'Psalm 19:5 — *Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race.* The shining sun drawn forth in such glory that Baruch cannot gaze on it is the psalmist''s bridegroom and strong man coming out of his chamber.'),
  ('pseudepigrapha', '3-baruch', 7, 4, 'canon', 'psalms', 19, 4, 'extras', E'Psalm 19:4 — *In them hath he set a tabernacle for the sun.* The sun''s appointed chamber in the heavens is the tabernacle God set for it, which Baruch is shown.'),
  ('pseudepigrapha', '3-baruch', 7, 4, 'canon', 'malachi', 4, 2, 'extras', E'Malachi 4:2 — *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings.* The crowned sun whose glory cannot be gazed upon points beyond itself to the true Sun of righteousness the prophet promised.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session410_3b07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session410_3b07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-7-the-sun-third-heaven-gives-light',
       E'The sun passing through to give light to the world',
       E'*In the third heaven the sun passes through and gives light to the world.* It ain''t new. Strip away the named heavens and the truth remains the sun''s appointed task — to give light upon the earth, just as God made it on the fourth day. *And let them be for lights in the firmament of the heaven to give light upon the earth* (Genesis 1:15). The sun is a servant on its circuit, not a thing to be marvelled at for its own sake.',
       sv.verse_id, ev.verse_id, 'extras', 81150
  FROM _session410_3b07_lookup sv, _session410_3b07_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=7 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-7-crowned-sun-glory-too-great-to-behold',
       E'The crowned sun, a glory too great to gaze upon',
       E'*And behind him I saw the shining sun, and the angels which draw it, and a crown upon its head, the sight of which we were not able to gaze upon... when I beheld such great glory, I was brought low with great fear.* It ain''t new. The sun''s overwhelming brightness is the psalmist''s own picture: *In them hath he set a tabernacle for the sun, which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race* (Psalm 19:4-5). And the crowned sun points past itself, for the prophet names the true crowned Light: *unto you that fear my name shall the Sun of righteousness arise with healing in his wings* (Malachi 4:2). The dread Baruch feels before the lesser light prepares the eye for the greater.',
       sv.verse_id, ev.verse_id, 'extras', 81153
  FROM _session410_3b07_lookup sv, _session410_3b07_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=7 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=7 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-baruch-7-the-sun-third-heaven-gives-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:15 — *And let them be for lights in the firmament of the heaven to give light upon the earth: and it was so.* The sun passing through to give light to the world is doing the very work God set it for on the fourth day.'
  FROM cross_reference_threads t, cross_references x, _session410_3b07_lookup sv, _session410_3b07_lookup tv
 WHERE t.slug='3-baruch-7-the-sun-third-heaven-gives-light'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-7-crowned-sun-glory-too-great-to-behold
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 19:5 — *Which is as a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race.* The shining sun drawn forth in such glory that Baruch cannot gaze on it is the psalmist''s bridegroom and strong man coming out of his chamber.'
  FROM cross_reference_threads t, cross_references x, _session410_3b07_lookup sv, _session410_3b07_lookup tv
 WHERE t.slug='3-baruch-7-crowned-sun-glory-too-great-to-behold'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 19:4 — *In them hath he set a tabernacle for the sun.* The sun''s appointed chamber in the heavens is the tabernacle God set for it, which Baruch is shown.'
  FROM cross_reference_threads t, cross_references x, _session410_3b07_lookup sv, _session410_3b07_lookup tv
 WHERE t.slug='3-baruch-7-crowned-sun-glory-too-great-to-behold'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:2 — *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings.* The crowned sun whose glory cannot be gazed upon points beyond itself to the true Sun of righteousness the prophet promised.'
  FROM cross_reference_threads t, cross_references x, _session410_3b07_lookup sv, _session410_3b07_lookup tv
 WHERE t.slug='3-baruch-7-crowned-sun-glory-too-great-to-behold'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_3baruch_08.sql (session410 3-baruch 8) -----
-- Source anchor: pseudepigrapha/3-baruch ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3b08 (view _session410_3b08_lookup). Sort band base 81175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session410_3b08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-baruch-8-the-sun-renewed-each-day
  ('pseudepigrapha', '3-baruch', 8, 4, 'canon', 'lamentations', 3, 23, 'free', E'Lamentations 3:23 — *They are new every morning: great is thy faithfulness.* The crown of the sun renewed each day mirrors the mercies of God that are new every morning.'),
  -- thread: 3-baruch-8-rays-defiled-by-the-lawlessness-of-men
  ('pseudepigrapha', '3-baruch', 8, 5, 'canon', 'genesis', 6, 5, 'free', E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The lawlessness that defiles the sun''s beams is the same wickedness God beheld in the days before the flood.'),
  ('pseudepigrapha', '3-baruch', 8, 5, 'canon', 'malachi', 4, 1, 'extras', E'Malachi 4:1 — *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble.* The sins that defile the light do not escape the day appointed to burn up the proud and the workers of wickedness.'),
  -- thread: 3-baruch-8-wings-screening-the-rays-preserve-the-living
  ('pseudepigrapha', '3-baruch', 8, 7, 'canon', 'psalms', 19, 6, 'extras', E'Psalm 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The burning heat from which the living must be shielded is the sun''s heat the psalmist says nothing is hidden from.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session410_3b08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session410_3b08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-8-the-sun-renewed-each-day',
       E'The crown of the sun renewed each day',
       E'*Four angels take it, and bear it up to heaven, and renew it, because it and its rays have been defiled upon earth; moreover it is so renewed each day.* It ain''t new. The daily renewing of the light is the very rhythm the prophet sings of the LORD''s own mercies: *It is of the LORD''S mercies that we are not consumed, because his compassions fail not. They are new every morning: great is thy faithfulness* (Lamentations 3:22-23). The light is made new each dawn because God''s faithfulness is renewed each dawn.',
       sv.verse_id, ev.verse_id, 'extras', 81175
  FROM _session410_3b08_lookup sv, _session410_3b08_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=8 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=8 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-8-rays-defiled-by-the-lawlessness-of-men',
       E'The sun''s beams defiled by the lawlessness of men',
       E'*Because it beholds the lawlessness and unrighteousness of men, namely fornications, adulteries, thefts, extortions, idolatries, drunkenness, murders, strife, jealousies, evil-speakings, murmurings, whisperings, divinations, and such like, which are not well-pleasing to Elohim.* It ain''t new. The catalog of sins under which the very light is grieved is the indictment of every age. From the flood-world on, *Elohim saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually* (Genesis 6:5); and the day comes for it — *all the proud, yea, and all that do wickedly, shall be stubble* (Malachi 4:1). The sun shines on the lawless, but the day that burns as an oven is appointed.',
       sv.verse_id, ev.verse_id, 'extras', 81178
  FROM _session410_3b08_lookup sv, _session410_3b08_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=8 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-8-wings-screening-the-rays-preserve-the-living',
       E'Unless the rays were screened, no creature would be preserved',
       E'*Unless his wings were screening the rays of the sun, no living creature would be preserved.* It ain''t new. However the apocalypse pictures the means, the truth held is that the survival of every living thing under the burning sun is God''s doing. *His circuit unto the ends of it: and there is nothing hid from the heat thereof* (Psalm 19:6) — and yet life endures, because *in wisdom hast thou made them all* (Psalm 104:24). That any flesh is preserved beneath that heat is the mercy of the Maker.',
       sv.verse_id, ev.verse_id, 'extras', 81181
  FROM _session410_3b08_lookup sv, _session410_3b08_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=8 AND sv.verse_number=7
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=8 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-baruch-8-the-sun-renewed-each-day
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Lamentations 3:23 — *They are new every morning: great is thy faithfulness.* The crown of the sun renewed each day mirrors the mercies of God that are new every morning.'
  FROM cross_reference_threads t, cross_references x, _session410_3b08_lookup sv, _session410_3b08_lookup tv
 WHERE t.slug='3-baruch-8-the-sun-renewed-each-day'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-8-rays-defiled-by-the-lawlessness-of-men
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The lawlessness that defiles the sun''s beams is the same wickedness God beheld in the days before the flood.'
  FROM cross_reference_threads t, cross_references x, _session410_3b08_lookup sv, _session410_3b08_lookup tv
 WHERE t.slug='3-baruch-8-rays-defiled-by-the-lawlessness-of-men'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 4:1 — *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble.* The sins that defile the light do not escape the day appointed to burn up the proud and the workers of wickedness.'
  FROM cross_reference_threads t, cross_references x, _session410_3b08_lookup sv, _session410_3b08_lookup tv
 WHERE t.slug='3-baruch-8-rays-defiled-by-the-lawlessness-of-men'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-8-wings-screening-the-rays-preserve-the-living
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 19:6 — *His going forth is from the end of the heaven, and his circuit unto the ends of it: and there is nothing hid from the heat thereof.* The burning heat from which the living must be shielded is the sun''s heat the psalmist says nothing is hidden from.'
  FROM cross_reference_threads t, cross_references x, _session410_3b08_lookup sv, _session410_3b08_lookup tv
 WHERE t.slug='3-baruch-8-wings-screening-the-rays-preserve-the-living'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_3baruch_09.sql (session410 3-baruch 9) -----
-- Source anchor: pseudepigrapha/3-baruch ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3b09 (view _session410_3b09_lookup). Sort band base 81200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session410_3b09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-baruch-9-the-moon-the-lesser-light
  ('pseudepigrapha', '3-baruch', 9, 1, 'canon', 'genesis', 1, 16, 'free', E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The moon coming with the stars at nightfall is the lesser light God made on the fourth day to rule the night.'),
  ('pseudepigrapha', '3-baruch', 9, 1, 'canon', 'psalms', 104, 19, 'extras', E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The moon''s appointed coming-forth is the seasons-keeping office God gave it.'),
  ('pseudepigrapha', '3-baruch', 9, 1, 'canon', 'jeremiah', 31, 35, 'extras', E'Jeremiah 31:35 — *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night.* The moon and stars travel by the fixed ordinances the LORD gave, not by chariot of their own.'),
  -- thread: 3-baruch-9-moon-afflicted-for-the-transgression
  ('pseudepigrapha', '3-baruch', 9, 7, 'canon', 'genesis', 3, 1, 'free', E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* The transgression the moon is said to have shone upon is the serpent''s deception of Adam and Eve in the garden.'),
  -- thread: 3-baruch-9-shining-on-the-watchers-transgression
  ('pseudepigrapha', '3-baruch', 9, 7, 'enoch', '1-enoch', 6, 2, 'extras', E'1 Enoch 6:2 — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* The transgression that grieves the heavenly lights is the same descent of the Watchers that the older witness records.'),
  ('pseudepigrapha', '3-baruch', 9, 7, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Moses sets the same transgression the apocalypse ties to the afflicting of the moon.'),
  -- thread: 3-baruch-9-stars-screened-by-the-sun
  ('pseudepigrapha', '3-baruch', 9, 8, 'canon', 'genesis', 1, 16, 'extras', E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night.* The moon and stars yielding before the sun keep the very order of greater and lesser light God set at creation.'),
  ('pseudepigrapha', '3-baruch', 9, 8, 'canon', 'psalms', 104, 19, 'extras', E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The lights keep their ranks and times by God''s appointment, the sun and moon each to its office.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session410_3b09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session410_3b09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-9-the-moon-the-lesser-light',
       E'The chariot of the moon, the lesser light for the night',
       E'*And at the same time came the chariot of the moon, along with the stars.* It ain''t new. The moon coming forth with the stars when night falls is the fourth-day appointment: *And Elohim made two great lights... the lesser light to rule the night: he made the stars also* (Genesis 1:16). It keeps its set times — *He appointed the moon for seasons* (Psalm 104:19) — by the ordinance the LORD gave: *the ordinances of the moon and of the stars for a light by night* (Jeremiah 31:35). The chariot is the picture; the ordinance is God''s.',
       sv.verse_id, ev.verse_id, 'extras', 81200
  FROM _session410_3b09_lookup sv, _session410_3b09_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=9 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-9-moon-afflicted-for-the-transgression',
       E'The moon shortened for shining on the transgression',
       E'*At the transgression of the first Adam, it was near to Sammael when he took the serpent as a garment... and Elohim was angry with it, and afflicted it, and shortened its days.* It ain''t new. The apocalypse traces the moon''s waning to the first transgression — when the serpent deceived in Eden. *Now the serpent was more subtil than any beast of the field which Yahuah Elohim had made* (Genesis 3:1). The embellishment of Sammael and the garment is the book''s own; the root is the fall, the moment all creation was put under the curse. We do not endorse the legend, only the fall it points back to.',
       sv.verse_id, ev.verse_id, 'extras', 81203
  FROM _session410_3b09_lookup sv, _session410_3b09_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-9-shining-on-the-watchers-transgression',
       E'The lights and the transgression of the Watchers',
       E'*Why is it that it at one time increases, but at another time decreases?... Elohim was angry with it, and afflicted it.* It ain''t new. The waning moon, marked by transgression, is the same lament the older witness raises over the heavenly transgression in the days before the flood, when the sons of heaven corrupted their way and even the courses of sun and moon were defiled in men''s reckoning. *And the angels, the children of the heaven, saw and lusted after them* (1 Enoch 6:2); and Moses sets the same generation: *the sons of Elohim saw the daughters of men that they were fair; and they took them wives* (Genesis 6:2). The transgression that grieves the lights is no novelty — it is the ancient fall the Watchers'' record already weeps.',
       sv.verse_id, ev.verse_id, 'extras', 81206
  FROM _session410_3b09_lookup sv, _session410_3b09_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-9-stars-screened-by-the-sun',
       E'Moon and stars screened in the presence of the sun',
       E'*As in the presence of a king, the courtiers cannot speak freely, so the moon and the stars cannot shine in the presence of the sun.* It ain''t new. The night-lights yielding to the greater light is the order God set on the fourth day — the greater to rule the day, the lesser the night. *The greater light to rule the day, and the lesser light to rule the night* (Genesis 1:16); *the sun knoweth his going down* (Psalm 104:19), and the stars keep their courses by the ordinances the LORD gives (Jeremiah 31:35). The moon does not contend with the sun; it keeps the rank God assigned.',
       sv.verse_id, ev.verse_id, 'extras', 81209
  FROM _session410_3b09_lookup sv, _session410_3b09_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=9 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-baruch-9-the-moon-the-lesser-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The moon coming with the stars at nightfall is the lesser light God made on the fourth day to rule the night.'
  FROM cross_reference_threads t, cross_references x, _session410_3b09_lookup sv, _session410_3b09_lookup tv
 WHERE t.slug='3-baruch-9-the-moon-the-lesser-light'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The moon''s appointed coming-forth is the seasons-keeping office God gave it.'
  FROM cross_reference_threads t, cross_references x, _session410_3b09_lookup sv, _session410_3b09_lookup tv
 WHERE t.slug='3-baruch-9-the-moon-the-lesser-light'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:35 — *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night.* The moon and stars travel by the fixed ordinances the LORD gave, not by chariot of their own.'
  FROM cross_reference_threads t, cross_references x, _session410_3b09_lookup sv, _session410_3b09_lookup tv
 WHERE t.slug='3-baruch-9-the-moon-the-lesser-light'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-9-moon-afflicted-for-the-transgression
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* The transgression the moon is said to have shone upon is the serpent''s deception of Adam and Eve in the garden.'
  FROM cross_reference_threads t, cross_references x, _session410_3b09_lookup sv, _session410_3b09_lookup tv
 WHERE t.slug='3-baruch-9-moon-afflicted-for-the-transgression'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-9-shining-on-the-watchers-transgression
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 6:2 — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* The transgression that grieves the heavenly lights is the same descent of the Watchers that the older witness records.'
  FROM cross_reference_threads t, cross_references x, _session410_3b09_lookup sv, _session410_3b09_lookup tv
 WHERE t.slug='3-baruch-9-shining-on-the-watchers-transgression'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Moses sets the same transgression the apocalypse ties to the afflicting of the moon.'
  FROM cross_reference_threads t, cross_references x, _session410_3b09_lookup sv, _session410_3b09_lookup tv
 WHERE t.slug='3-baruch-9-shining-on-the-watchers-transgression'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-9-stars-screened-by-the-sun
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night.* The moon and stars yielding before the sun keep the very order of greater and lesser light God set at creation.'
  FROM cross_reference_threads t, cross_references x, _session410_3b09_lookup sv, _session410_3b09_lookup tv
 WHERE t.slug='3-baruch-9-stars-screened-by-the-sun'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The lights keep their ranks and times by God''s appointment, the sun and moon each to its office.'
  FROM cross_reference_threads t, cross_references x, _session410_3b09_lookup sv, _session410_3b09_lookup tv
 WHERE t.slug='3-baruch-9-stars-screened-by-the-sun'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_3baruch_10.sql (session410 3-baruch 10) -----
-- Source anchor: pseudepigrapha/3-baruch ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3b10 (view _session410_3b10_lookup). Sort band base 81225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session410_3b10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-baruch-10-birds-that-praise
  ('pseudepigrapha', '3-baruch', 10, 7, 'canon', 'psalms', 148, 10, 'extras', E'Psalms 148:10 — *Beasts, and all cattle; creeping things, and flying fowl.* The birds whose work is unceasing praise are the very flying fowl the psalm summons to praise the LORD.'),
  ('pseudepigrapha', '3-baruch', 10, 7, 'canon', 'psalms', 148, 13, 'extras', E'Psalms 148:13 — *Let them praise the name of Yahuah: for his name alone is excellent; his glory is above the earth and heaven.* The praise rising from the fourth heaven is the praise the psalm decrees from earth and the heavens alike.'),
  ('pseudepigrapha', '3-baruch', 10, 7, 'canon', 'revelation', 5, 13, 'extras', E'Revelation 5:13 — *And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever.* The ceaselessly praising birds belong to the every-creature chorus John heard before the throne.'),
  ('pseudepigrapha', '3-baruch', 10, 5, 'canon', 'isaiah', 43, 20, 'extras', E'Isaiah 43:20 — *The beast of the field shall honour me, the dragons and the owls: because I give waters in the wilderness, and rivers in the desert, to give drink to my people, my chosen.* The plain with its pool, where God''s creatures honour him and the righteous (his chosen) dwell, echoes the prophet''s watered wilderness where even birds honour their Maker.'),
  -- thread: 3-baruch-10-rain-and-dew
  ('pseudepigrapha', '3-baruch', 10, 6, 'canon', 'psalms', 104, 13, 'extras', E'Psalms 104:13 — *He watereth the hills from his chambers: the earth is satisfied with the fruit of thy works.* The clouds that receive the water and rain it down so the fruits increase are the same chambers from which the psalm says God waters the earth.'),
  ('pseudepigrapha', '3-baruch', 10, 10, 'canon', 'psalms', 104, 14, 'extras', E'Psalms 104:14 — *He causeth the grass to grow for the cattle, and herb for the service of man: that he may bring forth food out of the earth.* The dew of heaven that stimulates the fruits is the same heavenly provision that brings forth food out of the earth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session410_3b10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session410_3b10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-10-birds-that-praise',
       E'The birds that continually sing praise',
       E'*They are those which continually sing praise to Yahuah.* It ain''t new. In the fourth heaven Baruch sees a plain and a pool teeming with birds whose whole office is to praise — and the souls of the righteous dwell there in choirs. The psalms already enroll the whole creation, the flying fowl among them, in that same chorus, and the Revelation hears every creature join it. The apocalypse only shows the choir Moses and the prophets and the apostles already heard.',
       sv.verse_id, ev.verse_id, 'extras', 81225
  FROM _session410_3b10_lookup sv, _session410_3b10_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=10 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=10 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-10-rain-and-dew',
       E'The pool, the rain, and the dew of heaven',
       E'*But the water is that which the clouds receive, and rain upon the earth, and the fruits increase... the dew of heaven.* It ain''t new. The angel teaches Baruch that the heavenly waters are drawn up to clouds and returned as rain and dew to swell the fruits of the earth. That is exactly the providence the psalmist sang: God who waters the hills from his chambers and satisfies the earth with the fruit of his works.',
       sv.verse_id, ev.verse_id, 'extras', 81228
  FROM _session410_3b10_lookup sv, _session410_3b10_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=10 AND sv.verse_number=6
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=10 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-baruch-10-birds-that-praise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 148:10 — *Beasts, and all cattle; creeping things, and flying fowl.* The birds whose work is unceasing praise are the very flying fowl the psalm summons to praise the LORD.'
  FROM cross_reference_threads t, cross_references x, _session410_3b10_lookup sv, _session410_3b10_lookup tv
 WHERE t.slug='3-baruch-10-birds-that-praise'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 148:13 — *Let them praise the name of Yahuah: for his name alone is excellent; his glory is above the earth and heaven.* The praise rising from the fourth heaven is the praise the psalm decrees from earth and the heavens alike.'
  FROM cross_reference_threads t, cross_references x, _session410_3b10_lookup sv, _session410_3b10_lookup tv
 WHERE t.slug='3-baruch-10-birds-that-praise'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=148 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 5:13 — *And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever.* The ceaselessly praising birds belong to the every-creature chorus John heard before the throne.'
  FROM cross_reference_threads t, cross_references x, _session410_3b10_lookup sv, _session410_3b10_lookup tv
 WHERE t.slug='3-baruch-10-birds-that-praise'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 43:20 — *The beast of the field shall honour me, the dragons and the owls: because I give waters in the wilderness, and rivers in the desert, to give drink to my people, my chosen.* The plain with its pool, where God''s creatures honour him and the righteous (his chosen) dwell, echoes the prophet''s watered wilderness where even birds honour their Maker.'
  FROM cross_reference_threads t, cross_references x, _session410_3b10_lookup sv, _session410_3b10_lookup tv
 WHERE t.slug='3-baruch-10-birds-that-praise'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-10-rain-and-dew
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 104:13 — *He watereth the hills from his chambers: the earth is satisfied with the fruit of thy works.* The clouds that receive the water and rain it down so the fruits increase are the same chambers from which the psalm says God waters the earth.'
  FROM cross_reference_threads t, cross_references x, _session410_3b10_lookup sv, _session410_3b10_lookup tv
 WHERE t.slug='3-baruch-10-rain-and-dew'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 104:14 — *He causeth the grass to grow for the cattle, and herb for the service of man: that he may bring forth food out of the earth.* The dew of heaven that stimulates the fruits is the same heavenly provision that brings forth food out of the earth.'
  FROM cross_reference_threads t, cross_references x, _session410_3b10_lookup sv, _session410_3b10_lookup tv
 WHERE t.slug='3-baruch-10-rain-and-dew'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_3baruch_11.sql (session410 3-baruch 11) -----
-- Source anchor: pseudepigrapha/3-baruch ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3b11 (view _session410_3b11_lookup). Sort band base 81250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session410_3b11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-baruch-11-michael-the-commander
  ('pseudepigrapha', '3-baruch', 11, 4, 'canon', 'daniel', 10, 13, 'extras', E'Daniel 10:13 — *but, lo, Michael, one of the chief princes, came to help me.* The commander of the angels who descends in the fifth heaven is the chief prince Daniel saw come to help.'),
  ('pseudepigrapha', '3-baruch', 11, 6, 'canon', 'daniel', 10, 21, 'extras', E'Daniel 10:21 — *there is none that holdeth with me in these things, but Michael your prince.* The one hailed as commander of all their order is the prince Daniel was told stands with the messengers of God.'),
  ('pseudepigrapha', '3-baruch', 11, 4, 'canon', 'daniel', 12, 1, 'extras', E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people.* The archangel who comes down for the prayers of men is the great prince who stands for God''s people.'),
  ('pseudepigrapha', '3-baruch', 11, 6, 'canon', 'jude', 1, 9, 'extras', E'Jude 1:9 — *Yet Michael the archangel, when contending with the devil he disputed about the body of Moses, durst not bring against him a railing accusation, but said, Yahuah rebuke thee.* The commander Michael of this vision is the archangel Jude names by the same office.'),
  -- thread: 3-baruch-11-receive-the-prayers
  ('pseudepigrapha', '3-baruch', 11, 4, 'canon', 'revelation', 8, 3, 'extras', E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* Michael coming down to receive the prayers of men is the angel John saw offering the prayers of all the saints before the throne.'),
  ('pseudepigrapha', '3-baruch', 11, 4, 'canon', 'revelation', 8, 4, 'extras', E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim out of the angel''s hand.* The prayers Michael receives are carried up before God just as John saw them ascend from the angel''s hand.'),
  ('pseudepigrapha', '3-baruch', 11, 4, 'canon', 'revelation', 5, 8, 'extras', E'Revelation 5:8 — *the four beasts and four and twenty elders fell down before the Lamb, having every one of them harps, and golden vials full of odours, which are the prayers of saints.* The prayers gathered by the commander are the odours John was told are the prayers of saints.'),
  ('pseudepigrapha', '3-baruch', 11, 4, 'canon', 'psalms', 141, 2, 'extras', E'Psalms 141:2 — *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice.* The prayers received and carried up are the very prayer David asks be set before God as incense.'),
  ('pseudepigrapha', '3-baruch', 11, 4, 'apocrypha', 'tobit', 12, 15, 'extras', E'Tobit 12:15 — *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* Michael''s office of receiving the prayers of men is the same ministry Raphael declares — presenting the prayers of the saints before God.'),
  ('pseudepigrapha', '3-baruch', 11, 4, 'apocrypha', 'tobit', 12, 12, 'extras', E'Tobit 12:12 — *Now therefore, when you did pray... I did bring the remembrance of your prayers before the Holy One.* The angel carrying the prayers of men before God is doing exactly what Raphael testifies he did with Tobit''s prayers.'),
  -- thread: 3-baruch-11-vessel-of-merits
  ('pseudepigrapha', '3-baruch', 11, 9, 'canon', 'matthew', 16, 27, 'extras', E'Matthew 16:27 — *For the Son of Adam shall come in the glory of his Father with his angels; and then he shall reward every man according to his works.* The vessel into which the merits and good works of the righteous are gathered serves the reckoning the Messiah promised — reward according to works.'),
  ('pseudepigrapha', '3-baruch', 11, 9, 'canon', 'revelation', 22, 12, 'extras', E'Revelation 22:12 — *And, behold, I come quickly; and my reward is with me, to give every man according as his work shall be.* The good works escorted before God in Michael''s vessel are the works the returning Messiah says he will reward.'),
  ('pseudepigrapha', '3-baruch', 11, 9, 'canon', '2-corinthians', 5, 10, 'extras', E'2 Corinthians 5:10 — *For we must all appear before the judgment seat of Messiah; that every one may receive the things done in his body, according to that he hath done, whether it be good or bad.* The merits carried before the heavenly God are the deeds Paul says must appear before the judgment seat of Messiah.'),
  ('pseudepigrapha', '3-baruch', 11, 2, 'canon', 'hebrews', 1, 14, 'extras', E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* The commander who serves the prayers and merits of the righteous is just such a ministering spirit sent forth for the heirs of salvation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session410_3b11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session410_3b11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-11-michael-the-commander',
       E'Michael, the commander of the angels',
       E'*Even now Michael, the commander of the angels, comes down to receive the prayers of men.* It ain''t new. The fifth heaven opens only when Michael comes, who holds the keys; the angel calls him commander of all their order. Daniel already named this same archangel — *one of the chief princes*, *Michael your prince*, the great prince who stands for God''s people — and Jude calls him the archangel who would not rail even against the devil. The apocalypse''s commander is the prince the prophet and the apostle already knew.',
       sv.verse_id, ev.verse_id, 'extras', 81250
  FROM _session410_3b11_lookup sv, _session410_3b11_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=11 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-11-receive-the-prayers',
       E'He comes down to receive the prayers of men',
       E'*Michael, the commander of the angels, comes down to receive the prayers of men.* It ain''t new. The keystone of the fifth heaven is an angel who gathers up the prayers of the righteous and carries them before God. Tobit already met this ministry — Raphael, who presents the prayers of the saints and goes in before the glory of the Holy One — and John saw it twice in the Revelation: golden vials full of odours which are the prayers of saints, and the angel with the golden censer who offers the incense with the prayers of all saints. David sang it long before: let my prayer be set forth before thee as incense.',
       sv.verse_id, ev.verse_id, 'extras', 81253
  FROM _session410_3b11_lookup sv, _session410_3b11_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=11 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=11 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-11-vessel-of-merits',
       E'The great vessel for the merits of the righteous',
       E'*This is where the merits of the righteous enter, and such good works as they do, which are escorted before the heavenly Elohim.* It ain''t new. Michael holds a vessel of immeasurable depth and breadth into which the good works of the righteous are gathered and brought before God. Scripture already keeps this account: the Son of man comes to reward every man according to his works; behold, I come quickly, and my reward is with me. The vessel is the picture of a reckoning the Messiah himself promised.',
       sv.verse_id, ev.verse_id, 'extras', 81256
  FROM _session410_3b11_lookup sv, _session410_3b11_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=11 AND sv.verse_number=8
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=11 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-baruch-11-michael-the-commander
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 10:13 — *but, lo, Michael, one of the chief princes, came to help me.* The commander of the angels who descends in the fifth heaven is the chief prince Daniel saw come to help.'
  FROM cross_reference_threads t, cross_references x, _session410_3b11_lookup sv, _session410_3b11_lookup tv
 WHERE t.slug='3-baruch-11-michael-the-commander'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 10:21 — *there is none that holdeth with me in these things, but Michael your prince.* The one hailed as commander of all their order is the prince Daniel was told stands with the messengers of God.'
  FROM cross_reference_threads t, cross_references x, _session410_3b11_lookup sv, _session410_3b11_lookup tv
 WHERE t.slug='3-baruch-11-michael-the-commander'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people.* The archangel who comes down for the prayers of men is the great prince who stands for God''s people.'
  FROM cross_reference_threads t, cross_references x, _session410_3b11_lookup sv, _session410_3b11_lookup tv
 WHERE t.slug='3-baruch-11-michael-the-commander'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:9 — *Yet Michael the archangel, when contending with the devil he disputed about the body of Moses, durst not bring against him a railing accusation, but said, Yahuah rebuke thee.* The commander Michael of this vision is the archangel Jude names by the same office.'
  FROM cross_reference_threads t, cross_references x, _session410_3b11_lookup sv, _session410_3b11_lookup tv
 WHERE t.slug='3-baruch-11-michael-the-commander'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-11-receive-the-prayers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* Michael coming down to receive the prayers of men is the angel John saw offering the prayers of all the saints before the throne.'
  FROM cross_reference_threads t, cross_references x, _session410_3b11_lookup sv, _session410_3b11_lookup tv
 WHERE t.slug='3-baruch-11-receive-the-prayers'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim out of the angel''s hand.* The prayers Michael receives are carried up before God just as John saw them ascend from the angel''s hand.'
  FROM cross_reference_threads t, cross_references x, _session410_3b11_lookup sv, _session410_3b11_lookup tv
 WHERE t.slug='3-baruch-11-receive-the-prayers'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 5:8 — *the four beasts and four and twenty elders fell down before the Lamb, having every one of them harps, and golden vials full of odours, which are the prayers of saints.* The prayers gathered by the commander are the odours John was told are the prayers of saints.'
  FROM cross_reference_threads t, cross_references x, _session410_3b11_lookup sv, _session410_3b11_lookup tv
 WHERE t.slug='3-baruch-11-receive-the-prayers'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 141:2 — *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice.* The prayers received and carried up are the very prayer David asks be set before God as incense.'
  FROM cross_reference_threads t, cross_references x, _session410_3b11_lookup sv, _session410_3b11_lookup tv
 WHERE t.slug='3-baruch-11-receive-the-prayers'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=141 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Tobit 12:15 — *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* Michael''s office of receiving the prayers of men is the same ministry Raphael declares — presenting the prayers of the saints before God.'
  FROM cross_reference_threads t, cross_references x, _session410_3b11_lookup sv, _session410_3b11_lookup tv
 WHERE t.slug='3-baruch-11-receive-the-prayers'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Tobit 12:12 — *Now therefore, when you did pray... I did bring the remembrance of your prayers before the Holy One.* The angel carrying the prayers of men before God is doing exactly what Raphael testifies he did with Tobit''s prayers.'
  FROM cross_reference_threads t, cross_references x, _session410_3b11_lookup sv, _session410_3b11_lookup tv
 WHERE t.slug='3-baruch-11-receive-the-prayers'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-11-vessel-of-merits
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 16:27 — *For the Son of Adam shall come in the glory of his Father with his angels; and then he shall reward every man according to his works.* The vessel into which the merits and good works of the righteous are gathered serves the reckoning the Messiah promised — reward according to works.'
  FROM cross_reference_threads t, cross_references x, _session410_3b11_lookup sv, _session410_3b11_lookup tv
 WHERE t.slug='3-baruch-11-vessel-of-merits'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=16 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:12 — *And, behold, I come quickly; and my reward is with me, to give every man according as his work shall be.* The good works escorted before God in Michael''s vessel are the works the returning Messiah says he will reward.'
  FROM cross_reference_threads t, cross_references x, _session410_3b11_lookup sv, _session410_3b11_lookup tv
 WHERE t.slug='3-baruch-11-vessel-of-merits'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 5:10 — *For we must all appear before the judgment seat of Messiah; that every one may receive the things done in his body, according to that he hath done, whether it be good or bad.* The merits carried before the heavenly God are the deeds Paul says must appear before the judgment seat of Messiah.'
  FROM cross_reference_threads t, cross_references x, _session410_3b11_lookup sv, _session410_3b11_lookup tv
 WHERE t.slug='3-baruch-11-vessel-of-merits'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* The commander who serves the prayers and merits of the righteous is just such a ministering spirit sent forth for the heirs of salvation.'
  FROM cross_reference_threads t, cross_references x, _session410_3b11_lookup sv, _session410_3b11_lookup tv
 WHERE t.slug='3-baruch-11-vessel-of-merits'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_3baruch_12.sql (session410 3-baruch 12) -----
-- Source anchor: pseudepigrapha/3-baruch ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3b12 (view _session410_3b12_lookup). Sort band base 81275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session410_3b12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-baruch-12-baskets-of-flowers
  ('pseudepigrapha', '3-baruch', 12, 5, 'canon', 'revelation', 14, 13, 'extras', E'Revelation 14:13 — *Blessed are the dead which die in Yahuah from henceforth: Yea, saith the Spirit, that they may rest from their labours; and their works do follow them.* The flowers that are the merits of the righteous, carried up to God, are the works John says follow the saints who die in the Lord.'),
  ('pseudepigrapha', '3-baruch', 12, 5, 'canon', 'matthew', 16, 27, 'extras', E'Matthew 16:27 — *then he shall reward every man according to his works.* The baskets of flowers named as the merits of the righteous are the works the Son of man comes to reward.'),
  ('pseudepigrapha', '3-baruch', 12, 5, 'canon', 'matthew', 25, 21, 'extras', E'Matthew 25:21 — *Well done, thou good and faithful servant: thou hast been faithful over a few things, I will make thee ruler over many things: enter thou into the joy of thy lord.* The flowers gathered from the righteous are the faithful works the Messiah commends in the parable of the talents.'),
  -- thread: 3-baruch-12-empty-baskets
  ('pseudepigrapha', '3-baruch', 12, 6, 'canon', 'galatians', 6, 7, 'extras', E'Galatians 6:7 — *Be not deceived; Elohim is not mocked: for whatsoever a man soweth, that shall he also reap.* The baskets that come neither empty nor full are the measured harvest of what each man has sown.'),
  ('pseudepigrapha', '3-baruch', 12, 6, 'canon', 'galatians', 6, 9, 'extras', E'Galatians 6:9 — *And let us not be weary in well doing: for in due season we shall reap, if we faint not.* The grief over baskets not filled is the loss Paul guards against — the reaping forfeited by those who faint in well doing.'),
  ('pseudepigrapha', '3-baruch', 12, 8, 'canon', '2-corinthians', 5, 10, 'extras', E'2 Corinthians 5:10 — *that every one may receive the things done in his body, according to that he hath done, whether it be good or bad.* That some baskets fill the vessel and some do not echoes Paul''s reckoning where each receives according to what he has done, good or bad.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session410_3b12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session410_3b12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-12-baskets-of-flowers',
       E'Baskets of flowers — the merits of the righteous',
       E'*These flowers are the merits of the righteous.* It ain''t new. The angels set over the righteous bring baskets full of flowers and cast them into Michael''s vessel, and the angel names the flowers plainly: they are the good works of the saints. The Revelation says the same thing of those who die in the Lord — their works do follow them; and the Messiah taught it in the talents: well done, thou good and faithful servant. The baskets are the picture; the reward of works is the doctrine already given.',
       sv.verse_id, ev.verse_id, 'extras', 81275
  FROM _session410_3b12_lookup sv, _session410_3b12_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=12 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-12-empty-baskets',
       E'The baskets neither empty nor full',
       E'*I saw other angels bearing baskets which were neither empty nor full... because they had not the prizes complete.* It ain''t new. Some angels come with half-full baskets and some grieve that they fill nothing of the vessel — a sober reckoning that a man reaps what he sows, and that the slothful bring no harvest. Paul warns it outright: be not deceived, God is not mocked; whatsoever a man soweth, that shall he also reap. The half-empty baskets are the picture of a sowing that fell short.',
       sv.verse_id, ev.verse_id, 'extras', 81278
  FROM _session410_3b12_lookup sv, _session410_3b12_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=12 AND sv.verse_number=6
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=12 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-baruch-12-baskets-of-flowers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 14:13 — *Blessed are the dead which die in Yahuah from henceforth: Yea, saith the Spirit, that they may rest from their labours; and their works do follow them.* The flowers that are the merits of the righteous, carried up to God, are the works John says follow the saints who die in the Lord.'
  FROM cross_reference_threads t, cross_references x, _session410_3b12_lookup sv, _session410_3b12_lookup tv
 WHERE t.slug='3-baruch-12-baskets-of-flowers'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 16:27 — *then he shall reward every man according to his works.* The baskets of flowers named as the merits of the righteous are the works the Son of man comes to reward.'
  FROM cross_reference_threads t, cross_references x, _session410_3b12_lookup sv, _session410_3b12_lookup tv
 WHERE t.slug='3-baruch-12-baskets-of-flowers'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=16 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 25:21 — *Well done, thou good and faithful servant: thou hast been faithful over a few things, I will make thee ruler over many things: enter thou into the joy of thy lord.* The flowers gathered from the righteous are the faithful works the Messiah commends in the parable of the talents.'
  FROM cross_reference_threads t, cross_references x, _session410_3b12_lookup sv, _session410_3b12_lookup tv
 WHERE t.slug='3-baruch-12-baskets-of-flowers'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-12-empty-baskets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 6:7 — *Be not deceived; Elohim is not mocked: for whatsoever a man soweth, that shall he also reap.* The baskets that come neither empty nor full are the measured harvest of what each man has sown.'
  FROM cross_reference_threads t, cross_references x, _session410_3b12_lookup sv, _session410_3b12_lookup tv
 WHERE t.slug='3-baruch-12-empty-baskets'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 6:9 — *And let us not be weary in well doing: for in due season we shall reap, if we faint not.* The grief over baskets not filled is the loss Paul guards against — the reaping forfeited by those who faint in well doing.'
  FROM cross_reference_threads t, cross_references x, _session410_3b12_lookup sv, _session410_3b12_lookup tv
 WHERE t.slug='3-baruch-12-empty-baskets'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 5:10 — *that every one may receive the things done in his body, according to that he hath done, whether it be good or bad.* That some baskets fill the vessel and some do not echoes Paul''s reckoning where each receives according to what he has done, good or bad.'
  FROM cross_reference_threads t, cross_references x, _session410_3b12_lookup sv, _session410_3b12_lookup tv
 WHERE t.slug='3-baruch-12-empty-baskets'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_3baruch_13.sql (session410 3-baruch 13) -----
-- Source anchor: pseudepigrapha/3-baruch ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3b13 (view _session410_3b13_lookup). Sort band base 81300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session410_3b13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-baruch-13-the-works-of-wicked-men
  ('pseudepigrapha', '3-baruch', 13, 4, 'canon', 'galatians', 5, 19, 'extras', E'Galatians 5:19 — *Now the works of the flesh are manifest, which are these; Adultery, fornication, uncleanness, lasciviousness.* The deeds the angels recoil from — fornications, adulteries — head Paul''s catalogue of the works of the flesh.'),
  ('pseudepigrapha', '3-baruch', 13, 4, 'canon', 'galatians', 5, 20, 'extras', E'Galatians 5:20 — *Idolatry, witchcraft, hatred, variance, emulations, wrath, strife, seditions, heresies.* The idolatry, divination, jealousies, and strife named in the apocalypse stand in the very list Paul gives of the flesh''s works.'),
  ('pseudepigrapha', '3-baruch', 13, 4, 'canon', 'galatians', 5, 21, 'extras', E'Galatians 5:21 — *Envyings, murders, drunkenness, revellings, and such like... they which do such things shall not inherit the kingdom of Elohim.* The envy, murder, and drunkenness the angels lament are the very deeds Paul says bar a man from the kingdom.'),
  -- thread: 3-baruch-13-angels-over-evil-men
  ('pseudepigrapha', '3-baruch', 13, 1, 'canon', 'psalms', 34, 7, 'extras', E'Psalms 34:7 — *The angel of Yahuah encampeth round about them that fear him, and delivereth them.* The angels stationed over men, kept at their post even among the wicked, are of the same guarding host the psalm sets round about those who fear God.'),
  ('pseudepigrapha', '3-baruch', 13, 1, 'canon', 'jude', 1, 6, 'extras', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The angels who long to depart from evil men but are forbidden stand in contrast to those Jude names — the ones who abandoned their charge and were chained for it.'),
  ('pseudepigrapha', '3-baruch', 13, 2, 'canon', 'jude', 1, 9, 'extras', E'Jude 1:9 — *Yet Michael the archangel... durst not bring against him a railing accusation, but said, Yahuah rebuke thee.* Michael bidding the angels wait until he learns from the Lord shows the same deference Jude records — Michael acting not on his own authority but the Lord''s.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session410_3b13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session410_3b13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-13-the-works-of-wicked-men',
       E'Where murder and fornication are, there they are in the midst',
       E'*Where there is murder, there also are they in the midst, and where are fornications, adulteries, thefts, slanders, perjuries, jealousies, drunkenness, strife, envy... idolatry, divination.* It ain''t new. The angels who attend wicked men recite the catalogue of their deeds, and it is, almost word for word, the works of the flesh Paul lists — adultery, fornication, idolatry, hatred, wrath, strife, envyings, murders, drunkenness. The apocalypse only confirms the verdict the apostle already gave: they which do such things shall not inherit the kingdom of God.',
       sv.verse_id, ev.verse_id, 'extras', 81300
  FROM _session410_3b13_lookup sv, _session410_3b13_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=13 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=13 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-13-angels-over-evil-men',
       E'The angels grieved to be sent to evil men',
       E'*We were delivered to evil men, and we wish to depart from them.* It ain''t new. The weeping angels beg Michael to release them from the wicked, yet are told they cannot, lest the enemy prevail to the end. Scripture knows this guarding ministry — the angel of the LORD encamps round about them that fear him — and Jude remembers the angels who did leave their first estate and were chained for it. The angels who long to depart yet are kept at their post show the same restraint Jude saw in Michael himself: not their own will, but the Lord''s.',
       sv.verse_id, ev.verse_id, 'extras', 81303
  FROM _session410_3b13_lookup sv, _session410_3b13_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=13 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-baruch-13-the-works-of-wicked-men
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 5:19 — *Now the works of the flesh are manifest, which are these; Adultery, fornication, uncleanness, lasciviousness.* The deeds the angels recoil from — fornications, adulteries — head Paul''s catalogue of the works of the flesh.'
  FROM cross_reference_threads t, cross_references x, _session410_3b13_lookup sv, _session410_3b13_lookup tv
 WHERE t.slug='3-baruch-13-the-works-of-wicked-men'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 5:20 — *Idolatry, witchcraft, hatred, variance, emulations, wrath, strife, seditions, heresies.* The idolatry, divination, jealousies, and strife named in the apocalypse stand in the very list Paul gives of the flesh''s works.'
  FROM cross_reference_threads t, cross_references x, _session410_3b13_lookup sv, _session410_3b13_lookup tv
 WHERE t.slug='3-baruch-13-the-works-of-wicked-men'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 5:21 — *Envyings, murders, drunkenness, revellings, and such like... they which do such things shall not inherit the kingdom of Elohim.* The envy, murder, and drunkenness the angels lament are the very deeds Paul says bar a man from the kingdom.'
  FROM cross_reference_threads t, cross_references x, _session410_3b13_lookup sv, _session410_3b13_lookup tv
 WHERE t.slug='3-baruch-13-the-works-of-wicked-men'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-13-angels-over-evil-men
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 34:7 — *The angel of Yahuah encampeth round about them that fear him, and delivereth them.* The angels stationed over men, kept at their post even among the wicked, are of the same guarding host the psalm sets round about those who fear God.'
  FROM cross_reference_threads t, cross_references x, _session410_3b13_lookup sv, _session410_3b13_lookup tv
 WHERE t.slug='3-baruch-13-angels-over-evil-men'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The angels who long to depart from evil men but are forbidden stand in contrast to those Jude names — the ones who abandoned their charge and were chained for it.'
  FROM cross_reference_threads t, cross_references x, _session410_3b13_lookup sv, _session410_3b13_lookup tv
 WHERE t.slug='3-baruch-13-angels-over-evil-men'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:9 — *Yet Michael the archangel... durst not bring against him a railing accusation, but said, Yahuah rebuke thee.* Michael bidding the angels wait until he learns from the Lord shows the same deference Jude records — Michael acting not on his own authority but the Lord''s.'
  FROM cross_reference_threads t, cross_references x, _session410_3b13_lookup sv, _session410_3b13_lookup tv
 WHERE t.slug='3-baruch-13-angels-over-evil-men'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_3baruch_14.sql (session410 3-baruch 14) -----
-- Source anchor: pseudepigrapha/3-baruch ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3b14 (view _session410_3b14_lookup). Sort band base 81325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session410_3b14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-baruch-14-michael-presents-the-merits
  ('pseudepigrapha', '3-baruch', 14, 2, 'canon', 'revelation', 8, 3, 'free', E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* Michael presenting the merits of men before God is the same heavenly office as the angel offering the prayers of the saints at the golden altar.'),
  ('pseudepigrapha', '3-baruch', 14, 2, 'canon', 'revelation', 5, 8, 'free', E'Revelation 5:8 — *And when he had taken the book, the four beasts and four and twenty elders fell down before the Lamb, having every one of them harps, and golden vials full of odours, which are the prayers of saints.* The merits of men carried up by Michael answer to the golden vials full of odours that are the prayers of saints.'),
  ('pseudepigrapha', '3-baruch', 14, 2, 'canon', 'hebrews', 7, 25, 'free', E'Hebrews 7:25 — *Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them.* The archangel''s presenting of men''s merits foreshadows the abiding intercession that belongs finally to the High Priest who ever liveth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session410_3b14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session410_3b14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-14-michael-presents-the-merits',
       E'Michael presents the merits of men before God',
       E'Baruch asks about the sound like thunder: *Michael is even now presenting the merits of men to Elohim (God).* (3 Baruch 14:2) It ain''t new — Revelation shows the same angelic office at the altar: *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* (Revelation 8:3) The bringing-up of the saints'' merits and prayers before the throne is the ministry of spirits sent to serve the heirs of salvation, and behind every such angel stands the one Mediator who *ever liveth to make intercession for them.* (Hebrews 7:25)',
       sv.verse_id, ev.verse_id, 'extras', 81325
  FROM _session410_3b14_lookup sv, _session410_3b14_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=14 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=14 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-baruch-14-michael-presents-the-merits
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* Michael presenting the merits of men before God is the same heavenly office as the angel offering the prayers of the saints at the golden altar.'
  FROM cross_reference_threads t, cross_references x, _session410_3b14_lookup sv, _session410_3b14_lookup tv
 WHERE t.slug='3-baruch-14-michael-presents-the-merits'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 5:8 — *And when he had taken the book, the four beasts and four and twenty elders fell down before the Lamb, having every one of them harps, and golden vials full of odours, which are the prayers of saints.* The merits of men carried up by Michael answer to the golden vials full of odours that are the prayers of saints.'
  FROM cross_reference_threads t, cross_references x, _session410_3b14_lookup sv, _session410_3b14_lookup tv
 WHERE t.slug='3-baruch-14-michael-presents-the-merits'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 7:25 — *Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them.* The archangel''s presenting of men''s merits foreshadows the abiding intercession that belongs finally to the High Priest who ever liveth.'
  FROM cross_reference_threads t, cross_references x, _session410_3b14_lookup sv, _session410_3b14_lookup tv
 WHERE t.slug='3-baruch-14-michael-presents-the-merits'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_3baruch_15.sql (session410 3-baruch 15) -----
-- Source anchor: pseudepigrapha/3-baruch ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3b15 (view _session410_3b15_lookup). Sort band base 81350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session410_3b15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-baruch-15-reward-for-good-works
  ('pseudepigrapha', '3-baruch', 15, 2, 'canon', 'matthew', 16, 27, 'free', E'Matthew 16:27 — *For the Son of Adam shall come in the glory of his Father with his angels; and then he shall reward every man according to his works.* The hundredfold reward poured out on those who wrought good works is the Messiah rewarding every man according to his works.'),
  ('pseudepigrapha', '3-baruch', 15, 2, 'canon', 'revelation', 22, 12, 'free', E'Revelation 22:12 — *And, behold, I come quickly; and my reward is with me, to give every man according as his work shall be.* The angels carrying up the laborious good works to be rewarded answer to the reward the returning Messiah brings with him.'),
  ('pseudepigrapha', '3-baruch', 15, 2, 'canon', 'revelation', 14, 13, 'free', E'Revelation 14:13 — *Blessed are the dead which die in Yahuah (Lord) from henceforth: Yea, saith the Spirit, that they may rest from their labours; and their works do follow them.* The good works gathered into the full baskets are the works that follow the righteous and are rewarded.'),
  ('pseudepigrapha', '3-baruch', 15, 2, 'canon', '2-corinthians', 5, 10, 'free', E'2 Corinthians 5:10 — *For we must all appear before the judgment seat of Messiah (Christ); that every one may receive the things done in his body, according to that he hath done, whether it be good or bad.* The sorting of full from half-empty baskets is the appearing before the judgment seat where each receives according to what he has done.'),
  -- thread: 3-baruch-15-sowed-virtuously-reap-virtuously
  ('pseudepigrapha', '3-baruch', 15, 3, 'canon', 'galatians', 6, 7, 'free', E'Galatians 6:7 — *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* That those who sowed virtuously reap virtuously is the law of the harvest Paul spells out: a man reaps what he sows.'),
  ('pseudepigrapha', '3-baruch', 15, 3, 'canon', 'galatians', 6, 8, 'free', E'Galatians 6:8 — *For he that soweth to his flesh shall of the flesh reap corruption; but he that soweth to the Spirit shall of the Spirit reap life everlasting.* The full versus the half-empty baskets divide along this same sowing — to the Spirit unto life, or to the flesh unto corruption.'),
  ('pseudepigrapha', '3-baruch', 15, 3, 'canon', 'galatians', 6, 9, 'free', E'Galatians 6:9 — *And let us not be weary in well doing: for in due season we shall reap, if we faint not.* The half-empty baskets, brought by those who flagged, are the warning against being weary in well doing before the due-season reaping.'),
  -- thread: 3-baruch-15-faithful-over-a-few-things
  ('pseudepigrapha', '3-baruch', 15, 4, 'canon', 'matthew', 25, 21, 'free', E'Matthew 25:21 — *Well done, thou good and faithful servant: thou hast been faithful over a few things, I will make thee ruler over many things: enter thou into the joy of thy lord.* Michael''s blessing on the faithful is this verse almost word for word — faithful over a few things, set over many, entering the joy of the Lord.'),
  ('pseudepigrapha', '3-baruch', 15, 4, 'canon', 'matthew', 25, 23, 'free', E'Matthew 25:23 — *Well done, good and faithful servant; thou hast been faithful over a few things, I will make thee ruler over many things: enter thou into the joy of thy lord.* The same commendation is given the second faithful servant; the full baskets are the servants who multiplied their trust.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session410_3b15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session410_3b15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-15-reward-for-good-works',
       E'An hundredfold reward for those who wrought good works',
       E'The full baskets are filled with oil: *Take it away, reward our friends an hundredfold, and those who have laboriously wrought good works.* (3 Baruch 15:2) It ain''t new — the Messiah will render the same wage: *For the Son of Adam shall come in the glory of his Father with his angels; and then he shall reward every man according to his works.* (Matthew 16:27) John heard him say it again: *behold, I come quickly; and my reward is with me, to give every man according as his work shall be.* (Revelation 22:12) The labour is not forgotten — *their works do follow them.* (Revelation 14:13)',
       sv.verse_id, ev.verse_id, 'extras', 81350
  FROM _session410_3b15_lookup sv, _session410_3b15_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=15 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=15 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-15-sowed-virtuously-reap-virtuously',
       E'They that sowed virtuously also reap virtuously',
       E'Of the reward Michael says: *For those who sowed virtuously, also reap virtuously.* (3 Baruch 15:3) It ain''t new — Paul states the law of the harvest exactly: *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* (Galatians 6:7) And the half-empty baskets warn against weariness: *let us not be weary in well doing: for in due season we shall reap, if we faint not.* (Galatians 6:9)',
       sv.verse_id, ev.verse_id, 'extras', 81353
  FROM _session410_3b15_lookup sv, _session410_3b15_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=15 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=15 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-15-faithful-over-a-few-things',
       E'Faithful over a few things — enter into the joy of your Lord',
       E'To the faithful Michael sends the word: *Ye are faithful over a few things, I will set you over many things; enter into the joy of your Lord.* (3 Baruch 15:4) It ain''t new — this is the master''s word to the good servants in the parable of the talents: *Well done, thou good and faithful servant: thou hast been faithful over a few things, I will make thee ruler over many things: enter thou into the joy of thy lord.* (Matthew 25:21) The baskets that came back full are the servants who traded with what they were given.',
       sv.verse_id, ev.verse_id, 'extras', 81356
  FROM _session410_3b15_lookup sv, _session410_3b15_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=15 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=15 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-baruch-15-reward-for-good-works
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 16:27 — *For the Son of Adam shall come in the glory of his Father with his angels; and then he shall reward every man according to his works.* The hundredfold reward poured out on those who wrought good works is the Messiah rewarding every man according to his works.'
  FROM cross_reference_threads t, cross_references x, _session410_3b15_lookup sv, _session410_3b15_lookup tv
 WHERE t.slug='3-baruch-15-reward-for-good-works'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=16 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:12 — *And, behold, I come quickly; and my reward is with me, to give every man according as his work shall be.* The angels carrying up the laborious good works to be rewarded answer to the reward the returning Messiah brings with him.'
  FROM cross_reference_threads t, cross_references x, _session410_3b15_lookup sv, _session410_3b15_lookup tv
 WHERE t.slug='3-baruch-15-reward-for-good-works'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 14:13 — *Blessed are the dead which die in Yahuah (Lord) from henceforth: Yea, saith the Spirit, that they may rest from their labours; and their works do follow them.* The good works gathered into the full baskets are the works that follow the righteous and are rewarded.'
  FROM cross_reference_threads t, cross_references x, _session410_3b15_lookup sv, _session410_3b15_lookup tv
 WHERE t.slug='3-baruch-15-reward-for-good-works'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Corinthians 5:10 — *For we must all appear before the judgment seat of Messiah (Christ); that every one may receive the things done in his body, according to that he hath done, whether it be good or bad.* The sorting of full from half-empty baskets is the appearing before the judgment seat where each receives according to what he has done.'
  FROM cross_reference_threads t, cross_references x, _session410_3b15_lookup sv, _session410_3b15_lookup tv
 WHERE t.slug='3-baruch-15-reward-for-good-works'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-15-sowed-virtuously-reap-virtuously
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 6:7 — *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* That those who sowed virtuously reap virtuously is the law of the harvest Paul spells out: a man reaps what he sows.'
  FROM cross_reference_threads t, cross_references x, _session410_3b15_lookup sv, _session410_3b15_lookup tv
 WHERE t.slug='3-baruch-15-sowed-virtuously-reap-virtuously'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 6:8 — *For he that soweth to his flesh shall of the flesh reap corruption; but he that soweth to the Spirit shall of the Spirit reap life everlasting.* The full versus the half-empty baskets divide along this same sowing — to the Spirit unto life, or to the flesh unto corruption.'
  FROM cross_reference_threads t, cross_references x, _session410_3b15_lookup sv, _session410_3b15_lookup tv
 WHERE t.slug='3-baruch-15-sowed-virtuously-reap-virtuously'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 6:9 — *And let us not be weary in well doing: for in due season we shall reap, if we faint not.* The half-empty baskets, brought by those who flagged, are the warning against being weary in well doing before the due-season reaping.'
  FROM cross_reference_threads t, cross_references x, _session410_3b15_lookup sv, _session410_3b15_lookup tv
 WHERE t.slug='3-baruch-15-sowed-virtuously-reap-virtuously'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-15-faithful-over-a-few-things
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 25:21 — *Well done, thou good and faithful servant: thou hast been faithful over a few things, I will make thee ruler over many things: enter thou into the joy of thy lord.* Michael''s blessing on the faithful is this verse almost word for word — faithful over a few things, set over many, entering the joy of the Lord.'
  FROM cross_reference_threads t, cross_references x, _session410_3b15_lookup sv, _session410_3b15_lookup tv
 WHERE t.slug='3-baruch-15-faithful-over-a-few-things'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 25:23 — *Well done, good and faithful servant; thou hast been faithful over a few things, I will make thee ruler over many things: enter thou into the joy of thy lord.* The same commendation is given the second faithful servant; the full baskets are the servants who multiplied their trust.'
  FROM cross_reference_threads t, cross_references x, _session410_3b15_lookup sv, _session410_3b15_lookup tv
 WHERE t.slug='3-baruch-15-faithful-over-a-few-things'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_3baruch_16.sql (session410 3-baruch 16) -----
-- Source anchor: pseudepigrapha/3-baruch ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3b16 (view _session410_3b16_lookup). Sort band base 81375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session410_3b16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-baruch-16-a-people-that-is-no-people
  ('pseudepigrapha', '3-baruch', 16, 2, 'canon', 'deuteronomy', 32, 21, 'free', E'Deuteronomy 32:21 — *they have provoked me to anger with their vanities: and I will move them to jealousy with those which are not a people; I will provoke them to anger with a foolish nation.* The provoking of the unworthy against a people that is no people is the Song of Moses'' jealousy-judgment word for word.'),
  ('pseudepigrapha', '3-baruch', 16, 2, 'canon', 'romans', 10, 19, 'free', E'Romans 10:19 — *First Moses saith, I will provoke you to jealousy by them that are no people, and by a foolish nation I will anger you.* Paul quotes the very line 3 Baruch echoes, the no-people provocation drawn straight from Moses.'),
  -- thread: 3-baruch-16-disobedience-and-withheld-blessing
  ('pseudepigrapha', '3-baruch', 16, 4, 'canon', 'leviticus', 26, 3, 'free', E'Leviticus 26:3 — *If ye walk in my statutes, and keep my commandments, and do them;* the despisers who would not observe or do God''s commandments (3 Baruch 16:4) are the inverse of the obedience this covenant blessing requires.'),
  ('pseudepigrapha', '3-baruch', 16, 4, 'canon', 'leviticus', 26, 4, 'free', E'Leviticus 26:4 — *Then I will give you rain in due season, and the land shall yield her increase, and the trees of the field shall yield their fruit.* The blessing of rain and increase withheld from the empty-basket people is what is promised here to those who keep and do the commandments.'),
  ('pseudepigrapha', '3-baruch', 16, 4, 'canon', 'deuteronomy', 11, 17, 'free', E'Deuteronomy 11:17 — *And then the LORD''S wrath be kindled against you, and he shut up the heaven, that there be no rain, and that the land yield not her fruit.* The plagues and withheld blessing called down on the despisers in 3 Baruch 16 are the shut-up heaven of this covenant curse.'),
  ('pseudepigrapha', '3-baruch', 16, 3, 'canon', 'deuteronomy', 11, 13, 'free', E'Deuteronomy 11:13 — *if ye shall hearken diligently unto my commandments which I command you this day, to love Yahuah Elohaychem (the LORD your God), and to serve him with all your heart and with all your soul,* the locust, mildew, and hail of 3 Baruch 16:3 fall precisely because they did not hearken as this verse requires.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session410_3b16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session410_3b16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-16-a-people-that-is-no-people',
       E'Provoked to jealousy by a people that is no people',
       E'To those who brought nothing the word goes out: *since they angered me in their works, go and make them envious and angry and provoked against a people that is no people, a people that has no understanding.* (3 Baruch 16:2) It ain''t new — this is the Song of Moses: *I will move them to jealousy with those which are not a people; I will provoke them to anger with a foolish nation.* (Deuteronomy 32:21) And Paul cites that very line: *I will provoke you to jealousy by them that are no people, and by a foolish nation I will anger you.* (Romans 10:19) The empty baskets are answered with the ancient jealousy-judgment of Deuteronomy.',
       sv.verse_id, ev.verse_id, 'extras', 81375
  FROM _session410_3b16_lookup sv, _session410_3b16_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=16 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=16 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-16-disobedience-and-withheld-blessing',
       E'They hearkened not to my voice — judgment for the despisers',
       E'The empty baskets stand for those of whom God says: *they did not hearken to my voice, nor did they observe my commandments, nor do them, but were despisers of my commandments.* (3 Baruch 16:4) It ain''t new — this is the curse-side of the covenant. To the obedient God promised, *if ye walk in my statutes, and keep my commandments, and do them; Then I will give you rain in due season* (Leviticus 26:3-4); but to the disobedient, *the LORD''S wrath be kindled against you, and he shut up the heaven, that there be no rain* (Deuteronomy 11:17). The blessing of rain is sent on the worthy and withheld from the despisers.',
       sv.verse_id, ev.verse_id, 'extras', 81378
  FROM _session410_3b16_lookup sv, _session410_3b16_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=16 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=16 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-baruch-16-a-people-that-is-no-people
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:21 — *they have provoked me to anger with their vanities: and I will move them to jealousy with those which are not a people; I will provoke them to anger with a foolish nation.* The provoking of the unworthy against a people that is no people is the Song of Moses'' jealousy-judgment word for word.'
  FROM cross_reference_threads t, cross_references x, _session410_3b16_lookup sv, _session410_3b16_lookup tv
 WHERE t.slug='3-baruch-16-a-people-that-is-no-people'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 10:19 — *First Moses saith, I will provoke you to jealousy by them that are no people, and by a foolish nation I will anger you.* Paul quotes the very line 3 Baruch echoes, the no-people provocation drawn straight from Moses.'
  FROM cross_reference_threads t, cross_references x, _session410_3b16_lookup sv, _session410_3b16_lookup tv
 WHERE t.slug='3-baruch-16-a-people-that-is-no-people'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 3-baruch-16-disobedience-and-withheld-blessing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 26:3 — *If ye walk in my statutes, and keep my commandments, and do them;* the despisers who would not observe or do God''s commandments (3 Baruch 16:4) are the inverse of the obedience this covenant blessing requires.'
  FROM cross_reference_threads t, cross_references x, _session410_3b16_lookup sv, _session410_3b16_lookup tv
 WHERE t.slug='3-baruch-16-disobedience-and-withheld-blessing'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 26:4 — *Then I will give you rain in due season, and the land shall yield her increase, and the trees of the field shall yield their fruit.* The blessing of rain and increase withheld from the empty-basket people is what is promised here to those who keep and do the commandments.'
  FROM cross_reference_threads t, cross_references x, _session410_3b16_lookup sv, _session410_3b16_lookup tv
 WHERE t.slug='3-baruch-16-disobedience-and-withheld-blessing'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 11:17 — *And then the LORD''S wrath be kindled against you, and he shut up the heaven, that there be no rain, and that the land yield not her fruit.* The plagues and withheld blessing called down on the despisers in 3 Baruch 16 are the shut-up heaven of this covenant curse.'
  FROM cross_reference_threads t, cross_references x, _session410_3b16_lookup sv, _session410_3b16_lookup tv
 WHERE t.slug='3-baruch-16-disobedience-and-withheld-blessing'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 11:13 — *if ye shall hearken diligently unto my commandments which I command you this day, to love Yahuah Elohaychem (the LORD your God), and to serve him with all your heart and with all your soul,* the locust, mildew, and hail of 3 Baruch 16:3 fall precisely because they did not hearken as this verse requires.'
  FROM cross_reference_threads t, cross_references x, _session410_3b16_lookup sv, _session410_3b16_lookup tv
 WHERE t.slug='3-baruch-16-disobedience-and-withheld-blessing'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_3baruch_17.sql (session410 3-baruch 17) -----
-- Source anchor: pseudepigrapha/3-baruch ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 3b17 (view _session410_3b17_lookup). Sort band base 81400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session410_3b17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 3-baruch-17-glorify-god-now-and-ever
  ('pseudepigrapha', '3-baruch', 17, 4, 'canon', 'romans', 16, 27, 'free', E'Romans 16:27 — *To Elohim (God) only wise, be glory through Yahusha HaMashiach (Jesus Christ) for ever. Amen.* Baruch''s closing call to glorify God now and ever and to all eternity is the same epistolary doxology Paul ends with.'),
  ('pseudepigrapha', '3-baruch', 17, 4, 'canon', 'jude', 1, 24, 'free', E'Jude 24 — *Now unto him that is able to keep you from falling, and to present you faultless before the presence of his glory with exceeding joy,* the mutual glory of 3 Baruch 17:4 — glorify God that He may glorify you — answers to God presenting His own faultless before His glory.'),
  ('pseudepigrapha', '3-baruch', 17, 4, 'canon', 'jude', 1, 25, 'free', E'Jude 25 — *To the only wise Elohim (God) our Saviour, be glory and majesty, dominion and power, both now and ever. Amen.* The closing ''now and ever, and to all eternity. Amen.'' of 3 Baruch is this same ascription of glory both now and ever.'),
  ('pseudepigrapha', '3-baruch', 17, 3, 'canon', 'psalms', 150, 6, 'free', E'Psalm 150:6 — *Let every thing that hath breath praise Yahuah (LORD). Praise ye Yahuah (LORD).* Baruch giving glory to God for counting him worthy is the creature''s whole calling, where the Psalter ends — let everything that hath breath praise the LORD.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session410_3b17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session410_3b17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '3-baruch-17-glorify-god-now-and-ever',
       E'Glorify God, who counted me worthy — the closing doxology',
       E'Restored to earth, Baruch closes as every faithful witness closes: *I gave glory to Elohim (God), who counted me worthy of such honour. Wherefore do ye also, brethren ... glorify Elohim (God), so that He also may glorify you, now and ever, and to all eternity. Amen.* (3 Baruch 17:3-4) It ain''t new — Paul ends the same way: *To Elohim (God) only wise, be glory through Yahusha HaMashiach (Jesus Christ) for ever. Amen.* (Romans 16:27) And Jude lifts the same blessing to the One *able to keep you from falling, and to present you faultless before the presence of his glory with exceeding joy* (Jude 24). The whole apocalypse lands where all scripture lands: *Let every thing that hath breath praise Yahuah (LORD).* (Psalm 150:6)',
       sv.verse_id, ev.verse_id, 'extras', 81400
  FROM _session410_3b17_lookup sv, _session410_3b17_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=17 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='3-baruch' AND ev.chapter_number=17 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 3-baruch-17-glorify-god-now-and-ever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 16:27 — *To Elohim (God) only wise, be glory through Yahusha HaMashiach (Jesus Christ) for ever. Amen.* Baruch''s closing call to glorify God now and ever and to all eternity is the same epistolary doxology Paul ends with.'
  FROM cross_reference_threads t, cross_references x, _session410_3b17_lookup sv, _session410_3b17_lookup tv
 WHERE t.slug='3-baruch-17-glorify-god-now-and-ever'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 24 — *Now unto him that is able to keep you from falling, and to present you faultless before the presence of his glory with exceeding joy,* the mutual glory of 3 Baruch 17:4 — glorify God that He may glorify you — answers to God presenting His own faultless before His glory.'
  FROM cross_reference_threads t, cross_references x, _session410_3b17_lookup sv, _session410_3b17_lookup tv
 WHERE t.slug='3-baruch-17-glorify-god-now-and-ever'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 25 — *To the only wise Elohim (God) our Saviour, be glory and majesty, dominion and power, both now and ever. Amen.* The closing ''now and ever, and to all eternity. Amen.'' of 3 Baruch is this same ascription of glory both now and ever.'
  FROM cross_reference_threads t, cross_references x, _session410_3b17_lookup sv, _session410_3b17_lookup tv
 WHERE t.slug='3-baruch-17-glorify-god-now-and-ever'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 150:6 — *Let every thing that hath breath praise Yahuah (LORD). Praise ye Yahuah (LORD).* Baruch giving glory to God for counting him worthy is the creature''s whole calling, where the Psalter ends — let everything that hath breath praise the LORD.'
  FROM cross_reference_threads t, cross_references x, _session410_3b17_lookup sv, _session410_3b17_lookup tv
 WHERE t.slug='3-baruch-17-glorify-god-now-and-ever'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='3-baruch' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=150 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

COMMIT;
