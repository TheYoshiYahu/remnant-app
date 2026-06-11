-- ----- fragment: minion_jubilees_10.sql (session251 jubilees 10) -----
-- Source anchor: jubilees/jubilees ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju10 (view _session251_ju10_lookup). Sort band base 53225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-10-demons-lead-astray-noahs-prayer
  ('jubilees', 'jubilees', 10, 1, 'enoch', '1-enoch', 15, 8, 'extras', E'1 Enoch 15:8 — *And now, the giants, who are produced from the spirits and flesh, shall be called evil spirits upon the earth, and on the earth shall be their dwelling.* The very demons leading Noah''s grandsons astray in Jubilees 10:1 are, in the live 1 Enoch apparatus, the disembodied spirits of the dead giants of the Watchers.'),
  ('jubilees', 'jubilees', 10, 2, 'enoch', '1-enoch', 15, 10, 'extras', E'1 Enoch 15:10 — *And these spirits shall rise up against the children of men and against the women, because they have proceeded from them.* Enoch foretold the very assault Noah''s sons report in Jubilees 10:2 — the spirits rising up to lead astray and slay the sons of men.'),
  ('jubilees', 'jubilees', 10, 3, 'canon', 'deuteronomy', 32, 17, 'free', E'Deuteronomy 32:17 — *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not.* Noah''s prayer in Jubilees 10:3 against the wicked spirits is the same seed-war the Song of Moses names — the nations drawn to sacrifice unto demons, not Elohim.'),
  ('jubilees', 'jubilees', 10, 1, 'canon', 'matthew', 12, 43, 'free', E'Matthew 12:43 — *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* The same restless, embodied-seeking unclean spirit Jubilees 10:1 describes leading men astray is the one Yahusha names — it ain''t new.'),
  -- thread: jubilees-10-binding-spirits-mastema-tenth
  ('jubilees', 'jubilees', 10, 7, 'enoch', '1-enoch', 10, 11, 'extras', E'1 Enoch 10:11 — *And Yahuah (God) said unto Michael: ''Go, bind Semjâzâ and his associates who have united themselves with women so as to have defiled themselves with them in all their uncleanness.* The binding Yahuah commands in Jubilees 10:7 is the same binding-of-the-spirits Enoch already records — it ain''t new.'),
  ('jubilees', 'jubilees', 10, 11, 'enoch', '1-enoch', 10, 12, 'extras', E'1 Enoch 10:12 — *And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* The malignant ones bound in the place of condemnation in Jubilees 10:11 are held, as Enoch says, until the day of judgement.'),
  ('jubilees', 'jubilees', 10, 8, 'enoch', '1-enoch', 10, 4, 'extras', E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* Mastema''s plea in Jubilees 10:8 that a tenth remain stands against this first decree — the chief spirits cast into the darkness and condemnation.'),
  ('jubilees', 'jubilees', 10, 11, 'canon', 'matthew', 12, 29, 'free', E'Matthew 12:29 — *Or else how can one enter into a strong man''s house, and spoil his goods, except he first bind the strong man? and then he will spoil his house.* The binding of the spirits in Jubilees 10:11 is the pattern Yahusha claims for His own work — first bind the strong man, then spoil his house.'),
  -- thread: jubilees-10-medicines-herbs-noah-book-shem
  ('jubilees', 'jubilees', 10, 12, 'enoch', '1-enoch', 10, 7, 'extras', E'1 Enoch 10:7 — *And heal the earth which the angels have corrupted, and proclaim the healing of the earth, that they may heal the plague, and that all the children of men may not perish through all the secret things that the Watchers have disclosed and have taught their sons.* The medicines and herbs given Noah to heal in Jubilees 10:12 answer the very charge to heal the earth the Watchers corrupted — it ain''t new.'),
  -- thread: jubilees-10-babel-tower-city-shinar
  ('jubilees', 'jubilees', 10, 17, 'canon', 'genesis', 11, 1, 'free', E'Genesis 11:1 — *And the whole earth was of one language, and of one speech.* Jubilees 10:17 names the same moment in Peleg''s days — one people, evil in purpose, before the tongues were confounded.'),
  ('jubilees', 'jubilees', 10, 19, 'canon', 'genesis', 11, 2, 'free', E'Genesis 11:2 — *And it came to pass, as they journeyed from the east, that they found a plain in the land of Shinar; and they dwelt there.* Jubilees 10:19 retells the eastward departure from Ararat to Shinar where they built the city and the tower.'),
  ('jubilees', 'jubilees', 10, 20, 'canon', 'genesis', 11, 3, 'free', E'Genesis 11:3 — *And they said one to another, Go to, let us make brick, and burn them throughly. And they had brick for stone, and slime had they for morter.* Jubilees 10:20 carries the same detail — brick made with fire serving for stone — the Genesis source quoted beside its retelling.'),
  ('jubilees', 'jubilees', 10, 19, 'canon', 'genesis', 11, 4, 'free', E'Genesis 11:4 — *And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth.* The very ascent into heaven Jubilees 10:19 quotes is the prideful purpose Genesis records — it ain''t new.'),
  -- thread: jubilees-10-confounded-tongues-scattered-babel
  ('jubilees', 'jubilees', 10, 22, 'canon', 'genesis', 11, 6, 'free', E'Genesis 11:6 — *And Yahuah (LORD) said, Behold, the people is one, and they have all one language; and this they begin to do: and now nothing will be restrained from them, which they have imagined to do.* Jubilees 10:22 quotes the same divine deliberation — one people, one speech, nothing withheld from them — before the descent to confound.'),
  ('jubilees', 'jubilees', 10, 22, 'canon', 'genesis', 11, 7, 'free', E'Genesis 11:7 — *Go to, let us go down, and there confound their language, that they may not understand one another''s speech.* The ''let us go down and confound their language'' of Jubilees 10:22 is the Genesis word verbatim — it ain''t new.'),
  ('jubilees', 'jubilees', 10, 25, 'canon', 'genesis', 11, 8, 'free', E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* Jubilees 10:25 retells the same dispersal — scattered from Shinar, each according to his language and nation.'),
  ('jubilees', 'jubilees', 10, 25, 'canon', 'genesis', 11, 9, 'free', E'Genesis 11:9 — *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth.* Jubilees 10:25 names Babel for the same reason Genesis does — the confounding of the tongues at Shinar.'),
  ('jubilees', 'jubilees', 10, 25, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The dispersal into cities and nations in Jubilees 10:25 is the very dividing of the nations the Song of Moses remembers — and election out of them follows.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-10-demons-lead-astray-noahs-prayer',
       E'The unclean demons lead astray, and Noah prays',
       E'Jubilees opens the chapter with the seed-war breaking out again after the flood: *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them* (Jubilees 10:1), so that Noah *prayed before Yahuah (God) his Elohim (God)* that *wicked spirits* not *rule over* his sons (Jubilees 10:3). The live 1 Enoch apparatus already tells us WHERE these spirits came from — the dead giants of the Watchers: *And now, the giants, who are produced from the spirits and flesh, shall be called evil spirits upon the earth, and on the earth shall be their dwelling* (1 Enoch 15:8), and *these spirits shall rise up against the children of men and against the women, because they have proceeded from them* (1 Enoch 15:10). It ain''t new — and the Torah names the practice exactly: *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not* (Deuteronomy 32:17). Yahusha (Jesus) speaks of the same wandering unclean spirit: *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none* (Matthew 12:43).',
       sv.verse_id, ev.verse_id, 'extras', 53225
  FROM _session251_ju10_lookup sv, _session251_ju10_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=10 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-10-binding-spirits-mastema-tenth',
       E'The spirits bound, and Mastema''s tenth part left',
       E'Yahuah answers Noah''s prayer with a binding: *And Yahuah our Elohim (the LORD our God) bade us to bind all* (Jubilees 10:7) — but *the chief of the spirits, Mastêmâ* asks that *the tenth part of them remain before him* to *execute the power of my will on the sons of men* (Jubilees 10:8), and *a tenth part of them we left that they might be subject before Satan on the earth* (Jubilees 10:11). This is the seed-war handed forward under the accuser. The 1 Enoch apparatus carries the original binding word over the same spirits: *And Yahuah (God) said unto Michael: ''Go, bind Semjâzâ and his associates... bind them fast for seventy generations in the valleys of the earth, till the day of their judgement''* (1 Enoch 10:11-12), and Azazel cast *into the darkness* (1 Enoch 10:4). And Yahusha names the binding as the very pattern of His ministry: *Or else how can one enter into a strong man''s house, and spoil his goods, except he first bind the strong man? and then he will spoil his house* (Matthew 12:29).',
       sv.verse_id, ev.verse_id, 'extras', 53228
  FROM _session251_ju10_lookup sv, _session251_ju10_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=7
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=10 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-10-medicines-herbs-noah-book-shem',
       E'The medicines and herbs given to Noah, the book to Shem',
       E'Against the tenth left under Mastema, mercy is given: *And one of us He commanded that we should teach Noah all their medicines* (Jubilees 10:10), and *we explained to Noah all the medicines of their diseases, together with their seductions, how he might heal them with herbs of the earth* (Jubilees 10:12), so that *Noah wrote down all things in a book... And he gave all that he had written to Shem, his eldest son; for he loved him exceedingly above all his sons* (Jubilees 10:13). The healing of the earth is the same charge given in the live 1 Enoch apparatus: *And heal the earth which the angels have corrupted, and proclaim the healing of the earth, that they may heal the plague* (1 Enoch 10:7). The seed is kept and the knowledge handed down the chosen line to Shem — the line that will carry to Abraham.',
       sv.verse_id, ev.verse_id, 'extras', 53231
  FROM _session251_ju10_lookup sv, _session251_ju10_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=10
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=10 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-10-babel-tower-city-shinar',
       E'Babel — the city and the tower in Shinar',
       E'Jubilees retells Genesis directly: in Peleg''s days *the children of men have become evil through the wicked purpose of building for themselves a city and a tower in the land of Shinar* (Jubilees 10:17), *saying, ''Go to, let us ascend thereby into heaven''* (Jubilees 10:19), and *they made brick with fire, and the bricks served them for stone* (Jubilees 10:20). Set the Genesis source beside it and the retelling is unmistakable: *And the whole earth was of one language, and of one speech* (Genesis 11:1); *they found a plain in the land of Shinar; and they dwelt there* (Genesis 11:2); *Go to, let us make brick, and burn them throughly. And they had brick for stone, and slime had they for morter* (Genesis 11:3); *Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth* (Genesis 11:4).',
       sv.verse_id, ev.verse_id, 'extras', 53234
  FROM _session251_ju10_lookup sv, _session251_ju10_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=17
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=10 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-10-confounded-tongues-scattered-babel',
       E'The tongues confounded, and the nations scattered',
       E'The judgment falls exactly as Genesis tells it: Yahuah says *Go to, let us go down and confound their language, that they may not understand one another''s speech* (Jubilees 10:22), *He confounded their language* (Jubilees 10:24), and *the whole land of Shinar is called Babel, because Yahuah (God) did there confound all the language of the children of men, and from thence they were dispersed into their cities, each according to his language and his nation* (Jubilees 10:25). The Genesis source stands word for word beside it: *And Yahuah (LORD) said, Behold, the people is one, and they have all one language; and this they begin to do: and now nothing will be restrained from them* (Genesis 11:6); *Go to, let us go down, and there confound their language* (Genesis 11:7); *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth* (Genesis 11:8); *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth* (Genesis 11:9). And the scattering sets the nations'' bounds the Torah remembers: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8) — election out of the scattered nations begins here.',
       sv.verse_id, ev.verse_id, 'extras', 53237
  FROM _session251_ju10_lookup sv, _session251_ju10_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=22
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=10 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-10-demons-lead-astray-noahs-prayer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 15:8 — *And now, the giants, who are produced from the spirits and flesh, shall be called evil spirits upon the earth, and on the earth shall be their dwelling.* The very demons leading Noah''s grandsons astray in Jubilees 10:1 are, in the live 1 Enoch apparatus, the disembodied spirits of the dead giants of the Watchers.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-demons-lead-astray-noahs-prayer'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 15:10 — *And these spirits shall rise up against the children of men and against the women, because they have proceeded from them.* Enoch foretold the very assault Noah''s sons report in Jubilees 10:2 — the spirits rising up to lead astray and slay the sons of men.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-demons-lead-astray-noahs-prayer'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:17 — *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not.* Noah''s prayer in Jubilees 10:3 against the wicked spirits is the same seed-war the Song of Moses names — the nations drawn to sacrifice unto demons, not Elohim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-demons-lead-astray-noahs-prayer'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 12:43 — *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* The same restless, embodied-seeking unclean spirit Jubilees 10:1 describes leading men astray is the one Yahusha names — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-demons-lead-astray-noahs-prayer'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-10-binding-spirits-mastema-tenth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:11 — *And Yahuah (God) said unto Michael: ''Go, bind Semjâzâ and his associates who have united themselves with women so as to have defiled themselves with them in all their uncleanness.* The binding Yahuah commands in Jubilees 10:7 is the same binding-of-the-spirits Enoch already records — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-binding-spirits-mastema-tenth'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:12 — *And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* The malignant ones bound in the place of condemnation in Jubilees 10:11 are held, as Enoch says, until the day of judgement.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-binding-spirits-mastema-tenth'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* Mastema''s plea in Jubilees 10:8 that a tenth remain stands against this first decree — the chief spirits cast into the darkness and condemnation.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-binding-spirits-mastema-tenth'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 12:29 — *Or else how can one enter into a strong man''s house, and spoil his goods, except he first bind the strong man? and then he will spoil his house.* The binding of the spirits in Jubilees 10:11 is the pattern Yahusha claims for His own work — first bind the strong man, then spoil his house.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-binding-spirits-mastema-tenth'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-10-medicines-herbs-noah-book-shem
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:7 — *And heal the earth which the angels have corrupted, and proclaim the healing of the earth, that they may heal the plague, and that all the children of men may not perish through all the secret things that the Watchers have disclosed and have taught their sons.* The medicines and herbs given Noah to heal in Jubilees 10:12 answer the very charge to heal the earth the Watchers corrupted — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-medicines-herbs-noah-book-shem'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=12
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-10-babel-tower-city-shinar
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:1 — *And the whole earth was of one language, and of one speech.* Jubilees 10:17 names the same moment in Peleg''s days — one people, evil in purpose, before the tongues were confounded.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-babel-tower-city-shinar'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:2 — *And it came to pass, as they journeyed from the east, that they found a plain in the land of Shinar; and they dwelt there.* Jubilees 10:19 retells the eastward departure from Ararat to Shinar where they built the city and the tower.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-babel-tower-city-shinar'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:3 — *And they said one to another, Go to, let us make brick, and burn them throughly. And they had brick for stone, and slime had they for morter.* Jubilees 10:20 carries the same detail — brick made with fire serving for stone — the Genesis source quoted beside its retelling.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-babel-tower-city-shinar'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 11:4 — *And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth.* The very ascent into heaven Jubilees 10:19 quotes is the prideful purpose Genesis records — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-babel-tower-city-shinar'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-10-confounded-tongues-scattered-babel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:6 — *And Yahuah (LORD) said, Behold, the people is one, and they have all one language; and this they begin to do: and now nothing will be restrained from them, which they have imagined to do.* Jubilees 10:22 quotes the same divine deliberation — one people, one speech, nothing withheld from them — before the descent to confound.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-confounded-tongues-scattered-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:7 — *Go to, let us go down, and there confound their language, that they may not understand one another''s speech.* The ''let us go down and confound their language'' of Jubilees 10:22 is the Genesis word verbatim — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-confounded-tongues-scattered-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* Jubilees 10:25 retells the same dispersal — scattered from Shinar, each according to his language and nation.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-confounded-tongues-scattered-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 11:9 — *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth.* Jubilees 10:25 names Babel for the same reason Genesis does — the confounding of the tongues at Shinar.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-confounded-tongues-scattered-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The dispersal into cities and nations in Jubilees 10:25 is the very dividing of the nations the Song of Moses remembers — and election out of them follows.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-confounded-tongues-scattered-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

