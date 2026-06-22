-- =====================================================================
-- Session 315 — Ezra FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session315_ezra_cross_references.sql
-- =====================================================================

\echo 'session315 — Ezra cross-references starting...'
BEGIN;

-- ----- fragment: minion_ezra_1.sql (Ezra 1) -----
-- Book: Ezra  Chapter: 1  (the decree of Cyrus and the return begins)
-- Tag: ezra01   Session prefix: s315   Sort band: 31800 (+1 per thread)
-- Source: edition canon, book_slug ezra, chapter 1
--
-- Ezra 1 coverage:
--   v.1-4 (the decree of Cyrus, the word of Yahuah by Jeremiah fulfilled, Yahuah stirs a pagan king)
--        NT:     none warranted (decree itself is Tanakh history; Cyrus-as-shepherd type is Tanakh-internal)
--        Extras: none warranted (no clean witness adds; 1 Maccabees/2 Esdras do not bear this)
--        Tanakh: 2 Chronicles 36:22-23 (the identical decree, the hinge), Jeremiah 29:10 (seventy years),
--                Jeremiah 25:12 (seventy years punished), Isaiah 44:28 (Cyrus my shepherd, Jerusalem built),
--                Isaiah 45:1 (Yahuah to his anointed Cyrus), Isaiah 45:4 (surnamed thee though thou hast not known me),
--                Proverbs 21:1 (the king's heart in the hand of Yahuah), Daniel 9:2 (understood by books the seventy years)
--                --> THREAD 1
--   v.5 (the chief of Yahudah and Benjamin, priests, Levites, all whose spirit Elohim had raised, go up)
--        NT:     Philippians 2:13 (it is Elohim which worketh in you both to will and to do)
--        Extras: none warranted
--        Tanakh: Haggai 1:14 (Yahuah stirred up the spirit of Zerubbabel... and all the remnant),
--                Ezra 7:27 (put such a thing in the king's heart), Psalm 110:3 (thy people shall be willing)
--                --> THREAD 2
--   v.6 (strengthened their hands with vessels of silver, gold, willing offering)  -- folded into THREAD 2 prose (willing heart)
--   v.7-11 (Cyrus brings forth the vessels Nebuchadnezzar carried off; restored to Jerusalem)
--        NT:     none warranted
--        Extras: none warranted (1 Esdras parallels but is a re-narration, not an illuminating witness here)
--        Tanakh: 2 Kings 25:15 (the gold/silver vessels taken away), Jeremiah 27:22 (carried to Babylon... I will
--                restore them), Daniel 1:2 (part of the vessels carried to Shinar), Daniel 5:2 (Belshazzar profanes them)
--                --> THREAD 3
--
-- THREADS:
--   1. ezra-1-the-decree-of-cyrus-the-word-by-jeremiah-fulfilled  (free) -- Tanakh only [2Chr,Jer,Isa,Prov,Dan]
--   2. ezra-1-the-spirit-elohim-raised-the-willing-remnant-to-go-up (free) -- Tanakh + NT [Hag,Ezra,Ps + Phil]
--   3. ezra-1-the-vessels-of-the-house-restored-from-babylon (free) -- Tanakh only [2Kings,Jer,Dan]
--
-- Framework framing: the DECREE OF CYRUS = the word of Yahuah by Jeremiah FULFILLED -- the seventy years
-- (Jer 29:10 / 25:12 / Dan 9:2) accomplished -- Yahuah sovereignly STIRRING a pagan king (Prov 21:1) to send
-- his people HOME, Cyrus named and surnamed before he was born and called Yahuah's shepherd/anointed (Isa
-- 44:28 / 45:1,4) yet not co-equal -- the regathering the prophets promised BEGINS (continues 2 Chron 36).
-- v.5 the willing remnant = Yahuah RAISING THE SPIRIT, the heart Elohim works (Hag 1:14, Phil 2:13). The
-- holy vessels restored = Jer 27:22 fulfilled.

-- A. Temp view
CREATE TEMP VIEW _s315_ezra01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- B. cross_references
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the decree of Cyrus, the word by Jeremiah fulfilled
    ('canon','ezra',1,1,'canon','2-chronicles',36,22,'free',
      E'*Now in the first year of Cyrus king of Persia, that the word of Yahuah (LORD) spoken by the mouth of Jeremiah might be accomplished, Yahuah (LORD) stirred up the spirit of Cyrus king of Persia, that he made a proclamation throughout all his kingdom, and put it also in writing, saying,* (2 Chronicles 36:22). The Chronicler closes the Tanakh''s history with the identical decree that opens Ezra word for word: *Yahuah (LORD) stirred up the spirit of Cyrus* (Ezra 1:1). This is the hinge of the whole return -- the exile ended exactly *that the word of Yahuah... by the mouth of Jeremiah might be fulfilled*.'),
    ('canon','ezra',1,1,'canon','2-chronicles',36,21,'free',
      E'*To fulfil the word of Yahuah (LORD) by the mouth of Jeremiah, until the land had enjoyed her sabbaths: for as long as she lay desolate she kept sabbath, to fulfil threescore and ten years.* (2 Chronicles 36:21). The desolation served Yahuah''s sabbaths until the *threescore and ten years* were complete; only then was *the spirit of Cyrus* stirred (Ezra 1:1) -- the Torah''s land-sabbath (Leviticus 25-26) running underneath the seventy-year word.'),
    ('canon','ezra',1,1,'canon','jeremiah',29,10,'free',
      E'*For thus saith Yahuah (LORD), That after seventy years be accomplished at Babylon I will visit you, and perform my good word toward you, in causing you to return to this place.* (Jeremiah 29:10). This is *the word of Yahuah (LORD) by the mouth of Jeremiah* that Ezra 1:1 says is now *fulfilled* -- the seventy years accomplished, Yahuah visiting his people to bring them home.'),
    ('canon','ezra',1,1,'canon','jeremiah',25,12,'free',
      E'*And it shall come to pass, when seventy years are accomplished, that I will punish the king of Babylon, and that nation, saith Yahuah (LORD), for their iniquity, and the land of the Chaldeans, and will make it perpetual desolations.* (Jeremiah 25:12). Jeremiah set the term: *seventy years* -- after which Babylon falls and the captivity ends. Ezra 1:1 is that clock striking, *the word of Yahuah... might be fulfilled*.'),
    ('canon','ezra',1,1,'canon','daniel',9,2,'free',
      E'*In the first year of his reign I Daniel understood by books the number of the years, whereof the word of Yahuah (LORD) came to Jeremiah the prophet, that he would accomplish seventy years in the desolations of Jerusalem.* (Daniel 9:2). Daniel, reading *by books* in that same first year, recognized Jeremiah''s seventy years were spent -- the very *word of Yahuah... by the mouth of Jeremiah* Ezra 1:1 declares *fulfilled*.'),
    ('canon','ezra',1,2,'canon','isaiah',44,28,'free',
      E'*That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid.* (Isaiah 44:28). Generations before, Yahuah named Cyrus and called him *my shepherd*, charged to say *Thou shalt be built* over Jerusalem -- now in Ezra 1:2 Cyrus says *he hath charged me to build him an house at Jerusalem*, the prophecy speaking through his own mouth.'),
    ('canon','ezra',1,2,'canon','isaiah',45,1,'free',
      E'*Thus saith Yahuah (LORD) to his anointed, to Cyrus, whose right hand I have holden, to subdue nations before him; and I will loose the loins of kings, to open before him the two leaved gates; and the gates shall not be shut;* (Isaiah 45:1). Yahuah holds the heathen king''s right hand and calls him *his anointed*; the *all the kingdoms of the earth* Cyrus boasts of in Ezra 1:2 were given by the hand that *subdue[d] nations before him*.'),
    ('canon','ezra',1,2,'canon','isaiah',45,4,'free',
      E'*For Jacob my servant''s sake, and Yashar''el (Israel) mine elect, I have even called thee by thy name: I have surnamed thee, though thou hast not known me.* (Isaiah 45:4). Cyrus is wielded *for Jacob my servant''s sake, and Yashar''el (Israel) mine elect* -- a pagan king surnamed before his birth, who *hath not known me*, yet who in Ezra 1:2 confesses *Yahuah Elohim (the LORD God) of heaven hath given me all the kingdoms*. The Formed Word names the unknowing instrument for the elect''s sake.'),
    ('canon','ezra',1,1,'canon','proverbs',21,1,'free',
      E'*The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* (Proverbs 21:1). The plainest commentary on Ezra 1:1: Yahuah *stirred up the spirit of Cyrus* because the king''s heart is water in his hand, turned *whithersoever he will* -- the most powerful throne on earth moved to send the captives home.'),
    -- THREAD 2: the spirit Elohim raised in the willing remnant
    ('canon','ezra',1,5,'canon','haggai',1,14,'free',
      E'*And Yahuah (LORD) stirred up the spirit of Zerubbabel the son of Shealtiel, governor of Yahudah (Judah), and the spirit of Joshua the son of Josedech, the high priest, and the spirit of all the remnant of the people; and they came and did work in the house of Yahuah Tseva''ot (LORD of hosts), their Elohim (God),* (Haggai 1:14). The same hand that stirred Cyrus stirs the returned remnant to build: in Ezra 1:5 *all them whose spirit Elohim (God) had raised* go up, and Haggai names it again -- *Yahuah (LORD) stirred up the spirit... of all the remnant*.'),
    ('canon','ezra',1,5,'canon','ezra',7,27,'free',
      E'*Blessed be Yahuah Elohim (the LORD God) of our fathers, which hath put such a thing as this in the king''s heart, to beautify the house of Yahuah (LORD) which is in Jerusalem:* (Ezra 7:27). Ezra himself blesses Yahuah for the same work -- the heart moved from above. As *spirit Elohim (God) had raised* the remnant in 1:5, so Yahuah *hath put such a thing as this in the king''s heart*: the willing to build is Yahuah''s own doing.'),
    ('canon','ezra',1,5,'canon','psalms',110,3,'free',
      E'*Thy people shall be willing in the day of thy power, in the beauties of holiness from the womb of the morning: thou hast the dew of thy youth.* (Psalm 110:3). The willing people of the Davidic-priestly King -- *thy people shall be willing in the day of thy power* -- is exactly *them whose spirit Elohim (God) had raised* in Ezra 1:5, a freely-offered remnant whose willingness is itself given from above.'),
    ('canon','ezra',1,5,'canon','philippians',2,13,'free',
      E'*For it is Elohim (God) which worketh in you both to will and to do of his good pleasure.* (Philippians 2:13). The New Testament names the engine of Ezra 1:5 directly: the remnant''s very willing -- *all them whose spirit Elohim (God) had raised* -- is Elohim *which worketh in you both to will and to do*. The willing heart that goes up to build is itself the gift, not the merit.'),
    -- THREAD 3: the holy vessels restored from Babylon
    ('canon','ezra',1,7,'canon','jeremiah',27,22,'free',
      E'*They shall be carried to Babylon, and there shall they be until the day that I visit them, saith Yahuah (LORD); then will I bring them up, and restore them to this place.* (Jeremiah 27:22). Jeremiah promised the vessels would lie in Babylon only *until the day that I visit them* and then be restored. Ezra 1:7 is that day: *Cyrus the king brought forth the vessels of the house of Yahuah (LORD), which Nebuchadnezzar had brought forth out of Jerusalem*.'),
    ('canon','ezra',1,7,'canon','2-kings',25,15,'free',
      E'*And the firepans, and the bowls, and such things as were of gold, in gold, and of silver, in silver, the captain of the guard took away.* (2 Kings 25:15). The record of the plunder: the gold and silver vessels carried off when Jerusalem fell. The very vessels Ezra 1:7 says Cyrus *brought forth... which Nebuchadnezzar had brought forth out of Jerusalem, and had put them in the house of his gods* -- the spoil now returned.'),
    ('canon','ezra',1,7,'canon','daniel',1,2,'free',
      E'*And Yahuah (Lord) gave Jehoiakim king of Yahudah (Judah) into his hand, with part of the vessels of the house of Elohim (God): which he carried into the land of Shinar to the house of his god; and he brought the vessels into the treasure house of his god.* (Daniel 1:2). Daniel records the vessels going down into the house of a foreign god in Shinar -- exactly where Ezra 1:7 finds them, in *the house of his gods*, before Cyrus brings them home.'),
    ('canon','ezra',1,7,'canon','daniel',5,2,'free',
      E'*Belshazzar, whiles he tasted the wine, commanded to bring the golden and silver vessels which his father Nebuchadnezzar had taken out of the temple which was in Jerusalem; that the king, and his princes, his wives, and his concubines, might drink therein.* (Daniel 5:2). The night Babylon fell, Belshazzar profaned these holy vessels in his feast -- and the kingdom was reft from him. The same vessels then pass to Cyrus, who in Ezra 1:7 restores them, *the vessels of the house of Yahuah (LORD)*, to their place.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s315_ezra01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s315_ezra01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- C. threads
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-1-the-decree-of-cyrus-the-word-by-jeremiah-fulfilled',
  E'The decree of Cyrus -- the word of Yahuah by Jeremiah fulfilled',
  E'Ezra opens on the exact word Yahuah swore through Jeremiah, now come due: *Now in the first year of Cyrus king of Persia, that the word of Yahuah (LORD) by the mouth of Jeremiah might be fulfilled, Yahuah (LORD) stirred up the spirit of Cyrus king of Persia* (Ezra 1:1). The Chronicler ends the Tanakh''s story on the same sentence word for word -- *Yahuah (LORD) stirred up the spirit of Cyrus king of Persia... that the word of Yahuah (LORD) spoken by the mouth of Jeremiah might be accomplished* (2 Chronicles 36:22) -- after the land had lain desolate *to fulfil threescore and ten years* (2 Chronicles 36:21). That seventy-year term was Jeremiah''s own: *after seventy years be accomplished at Babylon I will visit you... in causing you to return to this place* (Jeremiah 29:10), and *when seventy years are accomplished, that I will punish the king of Babylon* (Jeremiah 25:12). Daniel, in that very first year, *understood by books the number of the years, whereof the word of Yahuah (LORD) came to Jeremiah the prophet, that he would accomplish seventy years in the desolations of Jerusalem* (Daniel 9:2). The clock had struck.\n\nAnd the king through whom it strikes was named before he was born. Isaiah called him out by name: *That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid* (Isaiah 44:28); *Thus saith Yahuah (LORD) to his anointed, to Cyrus, whose right hand I have holden, to subdue nations before him* (Isaiah 45:1). Cyrus is wielded *For Jacob my servant''s sake, and Yashar''el (Israel) mine elect... I have surnamed thee, though thou hast not known me* (Isaiah 45:4) -- a pagan king, unknowing, surnamed and anointed by the Formed Word of Yahuah purely for the elect''s sake. So when Cyrus proclaims *Yahuah Elohim (The LORD God) of heaven hath given me all the kingdoms of the earth; and he hath charged me to build him an house at Jerusalem* (Ezra 1:2), and calls his people to *go up to Jerusalem... and build the house of Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (Ezra 1:3), the prophecy is speaking through his own mouth. The plainest gloss is Proverbs: *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1). The most powerful throne on earth is water in Yahuah''s hand, turned to send the captives home -- the regathering the prophets promised, now begun.',
  sv.verse_id, ev.verse_id, 'free', 31800
  FROM _s315_ezra01_lookup sv, _s315_ezra01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-1-the-spirit-elohim-raised-the-willing-remnant-to-go-up',
  E'The spirit Elohim raised -- the willing remnant goes up to build',
  E'The same hand that turned Cyrus turns the remnant. *Then rose up the chief of the fathers of Yahudah (Judah) and Benjamin, and the priests, and the Levites, with all them whose spirit Elohim (God) had raised, to go up to build the house of Yahuah (LORD) which is in Jerusalem* (Ezra 1:5). Their willingness is not their own achievement -- it is *spirit Elohim (God) had raised*. And those who stayed *strengthened their hands with vessels of silver, with gold, with goods... beside all that was willingly offered* (Ezra 1:6): a freewill people.\n\nHaggai names the same stirring over the building work: *And Yahuah (LORD) stirred up the spirit of Zerubbabel... and the spirit of Joshua the son of Josedech, the high priest, and the spirit of all the remnant of the people; and they came and did work in the house of Yahuah Tseva''ot (LORD of hosts)* (Haggai 1:14). Ezra himself blesses Yahuah for putting the desire even in a king''s heart: *Blessed be Yahuah Elohim (the LORD God) of our fathers, which hath put such a thing as this in the king''s heart, to beautify the house of Yahuah (LORD)* (Ezra 7:27). The Psalm of the Davidic-priestly King had sung it: *Thy people shall be willing in the day of thy power, in the beauties of holiness* (Psalm 110:3). And the New Testament names the engine plainly: *For it is Elohim (God) which worketh in you both to will and to do of his good pleasure* (Philippians 2:13). The willing heart that goes up to build is itself the gift -- Yahuah working both the will and the deed in his remnant, never merit standing alone.',
  sv.verse_id, ev.verse_id, 'free', 31801
  FROM _s315_ezra01_lookup sv, _s315_ezra01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-1-the-vessels-of-the-house-restored-from-babylon',
  E'The vessels of the house of Yahuah restored from Babylon',
  E'The holy vessels carried off in the fall now come home. *Also Cyrus the king brought forth the vessels of the house of Yahuah (LORD), which Nebuchadnezzar had brought forth out of Jerusalem, and had put them in the house of his gods* (Ezra 1:7), and they are numbered and delivered *unto Sheshbazzar, the prince of Yahudah (Judah))* -- *five thousand and four hundred* in all, *brought up from Babylon unto Jerusalem* (Ezra 1:8-11).\n\nThis is the precise fulfillment of Jeremiah''s word: *They shall be carried to Babylon, and there shall they be until the day that I visit them, saith Yahuah (LORD); then will I bring them up, and restore them to this place* (Jeremiah 27:22). The plunder was recorded when Jerusalem fell -- *the firepans, and the bowls, and such things as were of gold, in gold, and of silver, in silver, the captain of the guard took away* (2 Kings 25:15) -- and Daniel saw them go down into a foreign shrine: *with part of the vessels of the house of Elohim (God): which he carried into the land of Shinar to the house of his god* (Daniel 1:2). On the night Babylon fell, Belshazzar profaned them -- *the golden and silver vessels which his father Nebuchadnezzar had taken out of the temple which was in Jerusalem; that the king... might drink therein* (Daniel 5:2) -- and the kingdom was torn from his hand that same hour. So the very vessels that judged Babylon pass to Cyrus, who restores them to *the house of Yahuah (LORD)*: the word that sent them away is the word that brings them back.',
  sv.verse_id, ev.verse_id, 'free', 31802
  FROM _s315_ezra01_lookup sv, _s315_ezra01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- D. thread_members
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Chronicles 36:22 -- the identical decree word for word, the Tanakh''s closing hinge into the return.'
  FROM cross_reference_threads t
  JOIN _s315_ezra01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s315_ezra01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=36 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-1-the-decree-of-cyrus-the-word-by-jeremiah-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Chronicles 36:21 -- the land kept its sabbaths until the seventy years were full (Lev 25-26 underneath).'
  FROM cross_reference_threads t
  JOIN _s315_ezra01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s315_ezra01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=36 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-1-the-decree-of-cyrus-the-word-by-jeremiah-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Jeremiah 29:10 -- the seventy years that Ezra 1:1 says are now fulfilled, Yahuah visiting to bring them home.'
  FROM cross_reference_threads t
  JOIN _s315_ezra01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s315_ezra01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-1-the-decree-of-cyrus-the-word-by-jeremiah-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Jeremiah 25:12 -- the term set: when seventy years are accomplished Babylon falls and the captivity ends.'
  FROM cross_reference_threads t
  JOIN _s315_ezra01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s315_ezra01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-1-the-decree-of-cyrus-the-word-by-jeremiah-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Daniel 9:2 -- Daniel reads the seventy years in that same first year and knows the word is fulfilled.'
  FROM cross_reference_threads t
  JOIN _s315_ezra01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s315_ezra01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-1-the-decree-of-cyrus-the-word-by-jeremiah-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Isaiah 44:28 -- Cyrus named *my shepherd* generations early, charged to say Jerusalem *shall be built*.'
  FROM cross_reference_threads t
  JOIN _s315_ezra01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s315_ezra01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-1-the-decree-of-cyrus-the-word-by-jeremiah-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Isaiah 45:1 -- Yahuah holds the king''s right hand and calls Cyrus *his anointed*, subduing nations before him.'
  FROM cross_reference_threads t
  JOIN _s315_ezra01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s315_ezra01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-1-the-decree-of-cyrus-the-word-by-jeremiah-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Isaiah 45:4 -- surnamed before birth *for Jacob my servant''s sake, and Yashar''el (Israel) mine elect*, though he knew not Yahuah.'
  FROM cross_reference_threads t
  JOIN _s315_ezra01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s315_ezra01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-1-the-decree-of-cyrus-the-word-by-jeremiah-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'Proverbs 21:1 -- the king''s heart is water in Yahuah''s hand, turned whithersoever he will; the plainest gloss on 1:1.'
  FROM cross_reference_threads t
  JOIN _s315_ezra01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s315_ezra01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-1-the-decree-of-cyrus-the-word-by-jeremiah-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Haggai 1:14 -- Yahuah stirred up the spirit of Zerubbabel, Joshua, and all the remnant to do the work on the house.'
  FROM cross_reference_threads t
  JOIN _s315_ezra01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s315_ezra01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-1-the-spirit-elohim-raised-the-willing-remnant-to-go-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Ezra 7:27 -- Ezra blesses Yahuah for putting the desire to beautify the house even in a king''s heart.'
  FROM cross_reference_threads t
  JOIN _s315_ezra01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s315_ezra01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-1-the-spirit-elohim-raised-the-willing-remnant-to-go-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 110:3 -- *thy people shall be willing in the day of thy power*: the willing remnant given from above.'
  FROM cross_reference_threads t
  JOIN _s315_ezra01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s315_ezra01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-1-the-spirit-elohim-raised-the-willing-remnant-to-go-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Philippians 2:13 -- *it is Elohim (God) which worketh in you both to will and to do*: the engine of the willing heart in 1:5.'
  FROM cross_reference_threads t
  JOIN _s315_ezra01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s315_ezra01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-1-the-spirit-elohim-raised-the-willing-remnant-to-go-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Jeremiah 27:22 -- the vessels lie in Babylon *until the day that I visit them*, then restored: Ezra 1:7 is that day.'
  FROM cross_reference_threads t
  JOIN _s315_ezra01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s315_ezra01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=27 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-1-the-vessels-of-the-house-restored-from-babylon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Kings 25:15 -- the gold and silver vessels carried off when Jerusalem fell; the spoil now returned.'
  FROM cross_reference_threads t
  JOIN _s315_ezra01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s315_ezra01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=25 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-1-the-vessels-of-the-house-restored-from-babylon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Daniel 1:2 -- the vessels carried into Shinar to the house of a foreign god, exactly where Ezra 1:7 finds them.'
  FROM cross_reference_threads t
  JOIN _s315_ezra01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s315_ezra01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-1-the-vessels-of-the-house-restored-from-babylon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Daniel 5:2 -- Belshazzar profanes these very vessels the night Babylon falls; they then pass to Cyrus who restores them.'
  FROM cross_reference_threads t
  JOIN _s315_ezra01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s315_ezra01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-1-the-vessels-of-the-house-restored-from-babylon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezra_2.sql (Ezra 2) -----
-- Book: Ezra (canon), chapter 2 — the register of the returning remnant.
-- Tag: ezra02 ; session prefix s315 ; sort_order band start 31825 (+1 per thread).
-- Source book_slug=ezra, chapter 2. All targets quoted EXACTLY from dump_canon.py.
--
-- Ezra 2 coverage:
--   v.1-58 (the register of families, priests, Levites, singers, porters, Nethinims):
--        NT:     none warranted (covered through the v.59-63 register/book-of-life thread)
--        Extras: none warranted
--        Tanakh: none warranted (the genealogy itself; the framework weight is in 59-63)
--   v.59-63 (could not shew their father''s house / sought their register / put from
--            the priesthood till a priest with Urim and Thummim):
--        NT:     Revelation 20:12 + 21:27 (the book of life), Luke 10:20 (names written in
--                heaven), Philippians 4:3 (names in the book of life)
--        Extras: none warranted (no Assumption/register witness clean in lib)
--        Tanakh: Numbers 1:18 (reckoned by pedigrees), Nehemiah 7:64-65 (the twin register),
--                Exodus 28:30 + Leviticus 8:8 (the Urim and Thummim)
--   v.64-67 (the totals, servants, beasts):
--        NT:/Extras:/Tanakh: none warranted (the numbered census; weight sits in 59-63)
--   v.68-69 (the chief of the fathers offered freely for the house of Elohim):
--        NT:     2 Corinthians 9:7 (Elohim loveth a cheerful giver)
--        Extras: none warranted
--        Tanakh: Exodus 35:29 (a willing offering), 1 Chronicles 29:9 (offered willingly,
--                with perfect heart)
--   v.70 (so they dwelt in their cities, all Yashar''el): none warranted (summary close)
--
-- Threads:
--   ezra-2-the-register-sought-but-not-found-till-a-priest-with-urim-and-thummim
--        (tier extras? NO — all members canon → 'free'); targets: Tanakh (Num 1:18,
--        Neh 7:64, Neh 7:65, Exod 28:30, Lev 8:8) + NT (Rev 20:12, Rev 21:27, Luke 10:20,
--        Phil 4:3). The lineage that must be PROVEN — paternal bloodline AND verified
--        register together; framed lightly toward the names enrolled in the book of life.
--   ezra-2-the-chief-of-the-fathers-offered-freely-for-the-house
--        (tier 'free'); targets: Tanakh (Exod 35:29, 1 Chron 29:9) + NT (2 Cor 9:7).
--        The willing-hearted giving for the house.

CREATE TEMP VIEW _s315_ezra02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================================
-- B. cross_references
-- ============================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the register sought but not found / Urim and Thummim
    ('canon','ezra',2,62,'canon','numbers',1,18,'free',
      E'*And they assembled all the congregation together on the first day of the second month, and they declared their pedigrees after their families, by the house of their fathers, according to the number of the names, from twenty years old and upward, by their polls.* (Numbers 1:18). From the wilderness onward Yashar''el (Israel) was reckoned by the house of the fathers — the paternal bloodline declared and recorded. When the returning priests *sought their register among those that were reckoned by genealogy, but they were not found* (Ezra 2:62), it is this same standard they could not meet: the seed-line must be PROVEN, not merely claimed.'),
    ('canon','ezra',2,62,'canon','nehemiah',7,64,'free',
      E'*These sought their register among those that were reckoned by genealogy, but it was not found: therefore were they, as polluted, put from the priesthood.* (Nehemiah 7:64). Nehemiah''s roll of the returned remnant carries the identical verdict word for word with Ezra''s — *therefore were they, as polluted, put from the priesthood* (Ezra 2:62). Twice the canon records that an unverified lineage barred a man from the altar: the register matters.'),
    ('canon','ezra',2,63,'canon','nehemiah',7,65,'free',
      E'*And the Tirshatha said unto them, that they should not eat of the most holy things, till there stood up a priest with Urim and Thummim.* (Nehemiah 7:65). The twin to Ezra''s *the Tirshatha said unto them, that they should not eat of the most holy things, till there stood up a priest with Urim and with Thummim* (Ezra 2:63) — the unproven priests are held back, the verdict deferred to a future priest who can inquire by the Urim and Thummim.'),
    ('canon','ezra',2,63,'canon','exodus',28,30,'free',
      E'*And thou shalt put in the breastplate of judgment the Urim and the Thummim; and they shall be upon Aaron''s heart, when he goeth in before Yahuah (LORD): and Aaron shall bear the judgment of the children of Yashar''el (Israel) upon his heart before Yahuah (LORD) continually.* (Exodus 28:30). The Tirshatha defers the priests'' case *till there stood up a priest with Urim and with Thummim* (Ezra 2:63) — the very instrument of divine judgment Yahuah set in the breastplate, by which the answer of Elohim (God) is sought. The disputed lineage waits for the verdict of heaven.'),
    ('canon','ezra',2,63,'canon','leviticus',8,8,'free',
      E'*And he put the breastplate upon him: also he put in the breastplate the Urim and the Thummim.* (Leviticus 8:8). When Aaron was first set apart, the Urim and Thummim went into the breastplate of judgment. So Ezra''s *till there stood up a priest with Urim and with Thummim* (Ezra 2:63) looks back to the consecration itself — only a rightly-ordained priest, bearing that oracle, could resolve who truly belonged to the priestly seed.'),
    ('canon','ezra',2,59,'canon','revelation',20,12,'free',
      E'*And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* (Revelation 20:12). The remnant who *could not shew their father''s house, and their seed, whether they were of Yashar''el (Israel)* (Ezra 2:59) point forward to the last reckoning, where the question is again whether a name is found written — *another book was opened, which is the book of life*. The register on earth foreshadows the register in heaven.'),
    ('canon','ezra',2,62,'canon','revelation',21,27,'free',
      E'*And there shall in no wise enter into it any thing that defileth, neither whatsoever worketh abomination, or maketh a lie: but they which are written in the Lamb''s book of life.* (Revelation 21:27). Those whose names were not in the genealogy were *as polluted, put from the priesthood* (Ezra 2:62) — barred from the most holy things; so into the New Jerusalem none enters but *they which are written in the Lamb''s book of life*. The enrolled people, the proven name, is the gate in both.'),
    ('canon','ezra',2,62,'canon','luke',10,20,'free',
      E'*Notwithstanding in this rejoice not, that the spirits are subject unto you; but rather rejoice, because your names are written in heaven.* (Luke 10:20). The priests who *sought their register... but they were not found* (Ezra 2:62) sought it in the rolls of men; Yahusha (Jesus) lifts the eye to the surer register — *your names are written in heaven*. To be found in that book is the inheritance the earthly genealogy only pictures.'),
    ('canon','ezra',2,62,'canon','philippians',4,3,'free',
      E'*And I intreat thee also, true yokefellow, help those women which laboured with me in the gospel, with Clement also, and with other my fellowlabourers, whose names are in the book of life.* (Philippians 4:3). Where Ezra''s priests could not find their names in the register *reckoned by genealogy* (Ezra 2:62), Paul names fellowlabourers *whose names are in the book of life* — the enrolment that cannot be lost, the proven people of the promise.'),
    -- Thread 2: the willing offering for the house
    ('canon','ezra',2,68,'canon','exodus',35,29,'free',
      E'*The children of Yashar''el (Israel) brought a willing offering unto Yahuah (LORD), every man and woman, whose heart made them willing to bring for all manner of work, which Yahuah (LORD) had commanded to be made by the hand of Moses.* (Exodus 35:29). When the chief of the fathers *offered freely for the house of Elohim (God) to set it up in his place* (Ezra 2:68), they walked the same path as their fathers at the tabernacle — the free-hearted gift for the house, *whose heart made them willing*. The pattern of the willing offering carries from Sinai to the second house.'),
    ('canon','ezra',2,68,'canon','1-chronicles',29,9,'free',
      E'*Then the people rejoiced, for that they offered willingly, because with perfect heart they offered willingly to Yahuah (LORD): and David the king also rejoiced with great joy.* (1 Chronicles 29:9). David''s assembly *offered willingly... with perfect heart* for the first house; the returned remnant who *offered freely for the house of Elohim (God)* (Ezra 2:68) take up that same willing spirit for its rebuilding. The house of Yahuah (LORD) rises on hearts made willing, not on compulsion.'),
    ('canon','ezra',2,69,'canon','2-corinthians',9,7,'free',
      E'*Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver.* (2 Corinthians 9:7). The fathers who *gave after their ability unto the treasure of the work* (Ezra 2:69) embody the rule Paul draws out — giving *as he purposeth in his heart*, for *Elohim (God) loveth a cheerful giver*. The willing offering for the house is the same heart the apostle commends.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s315_ezra02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s315_ezra02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================================
-- C. threads
-- ============================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-2-the-register-sought-but-not-found-till-a-priest-with-urim-and-thummim',
       E'The register sought but not found — till a priest with Urim and Thummim',
       E'When the captivity came up to Jerusalem, *every one unto his city* (Ezra 2:1), they came back as a people reckoned by name and by house. The whole chapter is a register — the families counted, the priests, the Levites, the singers, the porters, the Nethinims. Then the seam shows: some *could not shew their father''s house, and their seed, whether they were of Yashar''el (Israel)* (Ezra 2:59), and of the priests, *These sought their register among those that were reckoned by genealogy, but they were not found: therefore were they, as polluted, put from the priesthood* (Ezra 2:62). This is the framework''s standard, not lineage-alone and not claim-alone: the seed of promise is carried by the paternal bloodline AND the verified word together, and where the register cannot be shown, the man is held back. From Sinai the people were numbered exactly this way — *they declared their pedigrees after their families, by the house of their fathers* (Numbers 1:18). Nehemiah''s parallel roll repeats the verdict to the letter — *therefore were they, as polluted, put from the priesthood* (Nehemiah 7:64) — and the case is not closed but deferred: *the Tirshatha said unto them, that they should not eat of the most holy things, till there stood up a priest with Urim and with Thummim* (Ezra 2:63; Nehemiah 7:65). The Urim and Thummim are the oracle of judgment Yahuah set in the breastplate — *thou shalt put in the breastplate of judgment the Urim and the Thummim... and Aaron shall bear the judgment of the children of Yashar''el (Israel) upon his heart before Yahuah (LORD) continually* (Exodus 28:30), placed there at the first consecration, *also he put in the breastplate the Urim and the Thummim* (Leviticus 8:8). Only a rightly-ordained priest bearing that oracle could settle who truly belonged. The earthly register foreshadows the final one. At the last reckoning *the books were opened: and another book was opened, which is the book of life... according to their works* (Revelation 20:12), and into the city *there shall in no wise enter into it any thing that defileth... but they which are written in the Lamb''s book of life* (Revelation 21:27). Yahusha (Jesus) turns the eye from the rolls of men to the surer enrolment — *rather rejoice, because your names are written in heaven* (Luke 10:20) — and Paul names his fellowlabourers *whose names are in the book of life* (Philippians 4:3). The lineage that must be proven on earth points to the name that must be found written in heaven.',
       sv.verse_id, ev.verse_id, 'free', 31825
  FROM _s315_ezra02_lookup sv, _s315_ezra02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=2 AND sv.verse_number=59
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=2 AND ev.verse_number=63
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-2-the-chief-of-the-fathers-offered-freely-for-the-house',
       E'The chief of the fathers offered freely for the house',
       E'The register closes not with a tally of obligation but with a movement of the heart: *some of the chief of the fathers, when they came to the house of Yahuah (LORD) which is at Jerusalem, offered freely for the house of Elohim (God) to set it up in his place* (Ezra 2:68), and *they gave after their ability unto the treasure of the work* (Ezra 2:69). This is the willing offering, and it is an old pattern. At the tabernacle, *the children of Yashar''el (Israel) brought a willing offering unto Yahuah (LORD), every man and woman, whose heart made them willing to bring for all manner of work, which Yahuah (LORD) had commanded to be made by the hand of Moses* (Exodus 35:29). When David prepared the first house, *the people rejoiced, for that they offered willingly, because with perfect heart they offered willingly to Yahuah (LORD)* (1 Chronicles 29:9). The same free heart raises the second house. And the apostle draws the rule out plainly: *Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7). From the wilderness to the return to the assembly of the Messiah, the house of Yahuah rises on hearts made willing.',
       sv.verse_id, ev.verse_id, 'free', 31826
  FROM _s315_ezra02_lookup sv, _s315_ezra02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=2 AND sv.verse_number=68
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=2 AND ev.verse_number=69
ON CONFLICT (slug) DO NOTHING;

-- ============================================================================
-- D. thread_members
-- ============================================================================
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*they declared their pedigrees after their families, by the house of their fathers* (Numbers 1:18) — Yashar''el (Israel) reckoned by the house of the fathers; the standard Ezra''s priests could not meet.'
  FROM cross_reference_threads t
  JOIN _s315_ezra02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=2 AND sv.verse_number=62
  JOIN _s315_ezra02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=1 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-2-the-register-sought-but-not-found-till-a-priest-with-urim-and-thummim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*therefore were they, as polluted, put from the priesthood* (Nehemiah 7:64) — Nehemiah''s twin roll repeats Ezra''s verdict word for word.'
  FROM cross_reference_threads t
  JOIN _s315_ezra02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=2 AND sv.verse_number=62
  JOIN _s315_ezra02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=7 AND tv.verse_number=64
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-2-the-register-sought-but-not-found-till-a-priest-with-urim-and-thummim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*till there stood up a priest with Urim and Thummim* (Nehemiah 7:65) — the twin to Ezra 2:63; the verdict deferred to a priest who can inquire of Elohim (God).'
  FROM cross_reference_threads t
  JOIN _s315_ezra02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=2 AND sv.verse_number=63
  JOIN _s315_ezra02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=7 AND tv.verse_number=65
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-2-the-register-sought-but-not-found-till-a-priest-with-urim-and-thummim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*thou shalt put in the breastplate of judgment the Urim and the Thummim* (Exodus 28:30) — the oracle of divine judgment the disputed lineage must wait upon.'
  FROM cross_reference_threads t
  JOIN _s315_ezra02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=2 AND sv.verse_number=63
  JOIN _s315_ezra02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-2-the-register-sought-but-not-found-till-a-priest-with-urim-and-thummim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*also he put in the breastplate the Urim and the Thummim* (Leviticus 8:8) — the oracle set in place at the first consecration; only a rightly-ordained priest can resolve the seed-line.'
  FROM cross_reference_threads t
  JOIN _s315_ezra02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=2 AND sv.verse_number=63
  JOIN _s315_ezra02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=8 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-2-the-register-sought-but-not-found-till-a-priest-with-urim-and-thummim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*another book was opened, which is the book of life... according to their works* (Revelation 20:12) — the earthly register foreshadows the final reckoning where the name must be found written.'
  FROM cross_reference_threads t
  JOIN _s315_ezra02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=2 AND sv.verse_number=59
  JOIN _s315_ezra02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-2-the-register-sought-but-not-found-till-a-priest-with-urim-and-thummim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*they which are written in the Lamb''s book of life* (Revelation 21:27) — as the unproven were barred from the most holy things, so none enters the city but the enrolled.'
  FROM cross_reference_threads t
  JOIN _s315_ezra02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=2 AND sv.verse_number=62
  JOIN _s315_ezra02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-2-the-register-sought-but-not-found-till-a-priest-with-urim-and-thummim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*rejoice, because your names are written in heaven* (Luke 10:20) — Yahusha (Jesus) lifts the eye from the rolls of men to the surer register.'
  FROM cross_reference_threads t
  JOIN _s315_ezra02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=2 AND sv.verse_number=62
  JOIN _s315_ezra02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-2-the-register-sought-but-not-found-till-a-priest-with-urim-and-thummim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*whose names are in the book of life* (Philippians 4:3) — the enrolment that cannot be lost, the proven people of the promise.'
  FROM cross_reference_threads t
  JOIN _s315_ezra02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=2 AND sv.verse_number=62
  JOIN _s315_ezra02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-2-the-register-sought-but-not-found-till-a-priest-with-urim-and-thummim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the children of Yashar''el (Israel) brought a willing offering unto Yahuah (LORD)... whose heart made them willing* (Exodus 35:29) — the tabernacle pattern of the free-hearted gift for the house.'
  FROM cross_reference_threads t
  JOIN _s315_ezra02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=2 AND sv.verse_number=68
  JOIN _s315_ezra02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=35 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-2-the-chief-of-the-fathers-offered-freely-for-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they offered willingly, because with perfect heart they offered willingly to Yahuah (LORD)* (1 Chronicles 29:9) — David''s assembly gave for the first house with the same willing spirit.'
  FROM cross_reference_threads t
  JOIN _s315_ezra02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=2 AND sv.verse_number=68
  JOIN _s315_ezra02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=29 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-2-the-chief-of-the-fathers-offered-freely-for-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7) — the apostle draws out the rule the willing offering embodies.'
  FROM cross_reference_threads t
  JOIN _s315_ezra02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=2 AND sv.verse_number=69
  JOIN _s315_ezra02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-2-the-chief-of-the-fathers-offered-freely-for-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezra_3.sql (Ezra 3) -----
-- Book: Ezra  Chapter: 3  (the altar rebuilt and the temple foundation laid)
-- Tag: ezra03   Session prefix: s315   Temp view: _s315_ezra03_lookup
-- Slug prefix: ezra-3-...   Sort band start: 31850 (+1 per thread)
-- Source: edition 'canon', book_slug 'ezra', chapter 3
--
-- Ezra 3 coverage:
--   v.1   (gathered as one man, seventh month)
--         NT:     none warranted (gathering folded into v.2 altar thread context)
--         Extras: 1 Esdras 5:47 (parallel — held within thread 1 via 5:51)
--         Tanakh: none warranted standalone
--   v.2   ★ built the ALTAR of Elohim of Yashar'el, "as it is written in the law of Moses"
--         NT:     none warranted (Torah-altar type; weave is back to Torah)
--         Extras: 1 Esdras 5:48-49 (parallel — held via 5:51 member)
--         Tanakh: Exodus 20:24 (altar of earth), Deuteronomy 12:5-6 (the chosen place / offerings) — THREAD 1
--   v.3   altar set on bases, burnt offerings morning and evening
--         NT:     none warranted
--         Extras: 1 Esdras 5:50
--         Tanakh: held in THREAD 1 (continual offering)
--   v.4   ★ kept the FEAST OF TABERNACLES "as it is written" + daily burnt offerings
--         NT:     none warranted
--         Extras: 1 Esdras 5:51 ("as it is commanded in the law") — THREAD 1 (extras member)
--         Tanakh: Leviticus 23:34, Leviticus 23:42-43, Numbers 29:12, Deuteronomy 31:10-11, Nehemiah 8:14 — THREAD 1
--   v.5   new moons + set feasts + freewill offerings of Yahuah
--         NT:     none warranted
--         Extras: 1 Esdras 5:52
--         Tanakh: Leviticus 23 set-feasts (held via thread 1)
--   v.6   foundation not yet laid
--         NT/Extras/Tanakh: none warranted standalone (transition verse)
--   v.7-9 masons/carpenters/Cyrus grant; Levites set forward the work
--         NT/Extras/Tanakh: none warranted (administrative — 1 Esdras 5:54-58 parallel, not threaded)
--   v.10  ★★ FOUNDATION laid; priests/Levites praise "after the ordinance of David"
--         NT:     none warranted
--         Extras: 1 Esdras 5:59-60 (parallel — not separately threaded)
--         Tanakh: 1 Chronicles 16:34 (he is good, his mercy endureth for ever) — THREAD 2
--   v.11  ★★ "because he is good, for his mercy endureth for ever toward Yashar'el"; great shout
--         NT:     none warranted
--         Extras: 1 Esdras 5:61
--         Tanakh: 1 Chronicles 16:34 — THREAD 2 (anchor end)
--   v.12  ★★ the ancient men who saw the FIRST house wept with a loud voice; many shouted for joy
--         NT:     none warranted
--         Extras: 1 Esdras 5:63 (the ancients came with weeping and great crying) — THREAD 3 (extras member)
--         Tanakh: Haggai 2:3, Haggai 2:9, Zechariah 4:10, Psalm 126:5, Psalm 126:6 — THREAD 3
--   v.13  ★★ joy not discernible from weeping; noise heard afar off
--         NT:     none warranted
--         Extras: 1 Esdras 5:63 — THREAD 3
--         Tanakh: held in THREAD 3 (anchor end)
--
-- THREADS (3):
--   T1 ezra-3-the-altar-and-the-feast-of-tabernacles-restored-as-it-is-written  (free? NO -> extras: 1 Esdras member)  band 31850
--       Tanakh: Exodus 20:24, Deuteronomy 12:5, Deuteronomy 12:6, Leviticus 23:34, Leviticus 23:42, Leviticus 23:43, Numbers 29:12, Deuteronomy 31:10, Deuteronomy 31:11, Nehemiah 8:14
--       Extras: 1 Esdras 5:51 (apocrypha)
--   T2 ezra-3-the-foundation-laid-after-the-ordinance-of-david-his-mercy-endureth-for-ever  (free)  band 31851
--       Tanakh: 1 Chronicles 16:34
--   T3 ezra-3-the-joy-and-the-weeping-the-day-of-small-things-not-despised  (extras: 1 Esdras member)  band 31852
--       Tanakh: Haggai 2:3, Haggai 2:9, Zechariah 4:10, Psalm 126:5, Psalm 126:6
--       Extras: 1 Esdras 5:63 (apocrypha)

CREATE TEMP VIEW _s315_ezra03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- =========================================================================
-- CROSS_REFERENCES
-- =========================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 — the altar and the feast of tabernacles restored "as it is written"
    ('canon','ezra',3,2,'canon','exodus',20,24,'free',
      E'*An altar of earth thou shalt make unto me, and shalt sacrifice thereon thy burnt offerings, and thy peace offerings, thy sheep, and thine oxen: in all places where I record my name I will come unto thee, and I will bless thee.* (Exodus 20:24). When the returned remnant *builded the altar of the Elohim (God) of Yashar''el (Israel), to offer burnt offerings thereon, as it is written in the law of Moses* (Ezra 3:2), they were resuming the very first command of worship given at Sinai — the altar where Yahuah records his name and comes to bless. The restoration begins not with novelty but with the Torah''s own pattern.'),
    ('canon','ezra',3,2,'canon','deuteronomy',12,5,'free',
      E'*But unto the place which Yahuah Elohaychem (the LORD your God) shall choose out of all your tribes to put his name there, even unto his habitation shall ye seek, and thither thou shalt come* (Deuteronomy 12:5). The remnant gathered *as one man to Jerusalem* (Ezra 3:1) and built the altar there because Torah had appointed Jerusalem as the chosen place where Yahuah puts his name. They did not improvise a site — they sought the habitation already named in the law of Moses.'),
    ('canon','ezra',3,2,'canon','deuteronomy',12,6,'free',
      E'*And thither ye shall bring your burnt offerings, and your sacrifices, and your tithes, and heave offerings of your hand, and your vows, and your freewill offerings, and the firstlings of your herds and of your flocks* (Deuteronomy 12:6). This is the very menu of worship the remnant resumed — *burnt offerings... the new moons... all the set feasts of Yahuah... and of every one that willingly offered a freewill offering* (Ezra 3:5). The freewill offering of the restoration is the freewill offering Torah commanded; nothing of the appointed worship was set aside.'),
    ('canon','ezra',3,4,'canon','leviticus',23,34,'free',
      E'*Speak unto the children of Yashar''el (Israel), saying, The fifteenth day of this seventh month shall be the feast of tabernacles for seven days unto Yahuah (LORD)* (Leviticus 23:34). When the remnant *kept also the feast of tabernacles, as it is written* (Ezra 3:4), in *the seventh month* (Ezra 3:1,6), they were keeping the very feast of the very month Leviticus had fixed. The appointed time was not a relic abolished — it was the first festival the restored people observed.'),
    ('canon','ezra',3,4,'canon','leviticus',23,42,'free',
      E'*Ye shall dwell in booths seven days; all that are Israelites born shall dwell in booths* (Leviticus 23:42). The booths the remnant raised in *the feast of tabernacles, as it is written* (Ezra 3:4) are the booths of Leviticus 23 — *a statute for ever in your generations* (Leviticus 23:41). The exile did not annul the statute; the return restored its keeping.'),
    ('canon','ezra',3,4,'canon','leviticus',23,43,'free',
      E'*That your generations may know that I made the children of Yashar''el (Israel) to dwell in booths, when I brought them out of the land of Egypt: I am Yahuah Elohaychem (the LORD your God)* (Leviticus 23:43). The feast the remnant kept *as it is written* (Ezra 3:4) is a memorial of the first exodus — and now a people brought up out of a second captivity in Babylon keep it again. Tabernacles binds the two deliverances into one testimony of the gathering God.'),
    ('canon','ezra',3,4,'canon','numbers',29,12,'free',
      E'*And on the fifteenth day of the seventh month ye shall have an holy convocation; ye shall do no servile work, and ye shall keep a feast unto Yahuah (LORD) seven days* (Numbers 29:12). The remnant *offered the daily burnt offerings by number, according to the custom, as the duty of every day required* (Ezra 3:4) — that is the numbered offering schedule of Numbers 29, the bullocks and rams and lambs of Tabernacles offered exactly as commanded. They kept the feast by the book.'),
    ('canon','ezra',3,4,'canon','deuteronomy',31,10,'free',
      E'*And Moses commanded them, saying, At the end of every seven years, in the solemnity of the year of release, in the feast of tabernacles* (Deuteronomy 31:10). Moses had fixed Tabernacles as the feast for reading the law before all Yashar''el; so when the remnant *kept also the feast of tabernacles, as it is written* (Ezra 3:4), they were resuming the very festival appointed for the public hearing of the Torah — the restoration of the feast and the restoration of the word go together.'),
    ('canon','ezra',3,4,'canon','deuteronomy',31,11,'free',
      E'*When all Yashar''el (Israel) is come to appear before Yahuah Elohayka (the LORD thy God) in the place which he shall choose, thou shalt read this law before all Yashar''el (Israel) in their hearing* (Deuteronomy 31:11). The remnant gathered *as one man to Jerusalem* (Ezra 3:1) — *all Yashar''el* come to the chosen place — to keep Tabernacles *as it is written* (Ezra 3:4). The Torah''s own appointment for the assembly of the whole people is fulfilled in the very pattern of the return.'),
    ('canon','ezra',3,4,'canon','nehemiah',8,14,'free',
      E'*And they found written in the law which Yahuah (LORD) had commanded by Moses, that the children of Yashar''el (Israel) should dwell in booths in the feast of the seventh month* (Nehemiah 8:14). The same restoration generation keeps the same feast by the same standard: *as it is written* (Ezra 3:4). What Ezra 3 begins at the altar, Nehemiah 8 carries on at the reading of the law — the appointed times of Yahuah re-established in the land, found written and therefore kept.'),
    ('canon','ezra',3,4,'apocrypha','1-esdras',5,51,'extras',
      E'*Also they held the feast of tabernacles, as it is commanded in the law, and offered sacrifices daily, as was meet* (1 Esdras 5:51). The restored Greek account of the same return witnesses the same fact in the same words — the feast of tabernacles kept *as it is commanded in the law*, exactly as Ezra 3:4 says *as it is written*. Two witnesses, one testimony: the appointed worship of Torah resumed first thing in the restoration.'),

    -- THREAD 2 — the foundation laid, "after the ordinance of David... his mercy endureth for ever"
    ('canon','ezra',3,11,'canon','1-chronicles',16,34,'free',
      E'*O give thanks unto Yahuah (LORD); for he is good; for his mercy endureth for ever* (1 Chronicles 16:34). This is the very song David appointed when the ark came up to Jerusalem; and when the foundation of the second temple is laid *after the ordinance of David king of Yashar''el (Israel)* (Ezra 3:10), the Levites sing *because he is good, for his mercy endureth for ever toward Yashar''el (Israel)* (Ezra 3:11). The restoration takes up David''s own refrain — the praise of the first temple sung over the foundation of the second.'),

    -- THREAD 3 — the joy and the weeping; the day of small things not despised
    ('canon','ezra',3,12,'canon','haggai',2,3,'free',
      E'*Who is left among you that saw this house in her first glory? and how do ye see it now? is it not in your eyes in comparison of it as nothing?* (Haggai 2:3). This is the prophet''s word to the very men who wept: *the ancient men, that had seen the first house, when the foundation of this house was laid before their eyes, wept with a loud voice* (Ezra 3:12). The latter house seemed *as nothing* beside Solomon''s glory — yet Yahuah names the grief in order to answer it.'),
    ('canon','ezra',3,12,'canon','haggai',2,9,'free',
      E'*The glory of this latter house shall be greater than of the former, saith Yahuah Tseva''ot (LORD of hosts): and in this place will I give peace, saith Yahuah Tseva''ot (LORD of hosts)* (Haggai 2:9). To the old men who *wept with a loud voice* (Ezra 3:12) at how small this foundation looked, Yahuah promises the opposite of their fear — the latter house shall outshine the first. The weeping over the small beginning is overturned by the word of the greater glory to come.'),
    ('canon','ezra',3,12,'canon','zechariah',4,10,'free',
      E'*For who hath despised the day of small things? for they shall rejoice, and shall see the plummet in the hand of Zerubbabel with those seven; they are the eyes of Yahuah (LORD), which run to and fro through the whole earth* (Zechariah 4:10). The very Zerubbabel who laid this foundation (Ezra 3:8) is named: the *day of small things* is the day the old men wept over, and Yahuah forbids despising it. *They shall rejoice* — the weeping of Ezra 3:12 is not the last word.'),
    ('canon','ezra',3,12,'canon','psalms',126,5,'free',
      E'*They that sow in tears shall reap in joy* (Psalm 126:5). The Psalm of the return holds the exact mingling of Ezra 3:12 — the *weeping* and the *joy* sounded together so *that the people could not discern the noise of the shout of joy from the noise of the weeping* (Ezra 3:13). The tears sown at the foundation are the seed of a harvest of joy; the grief is real, but it is sowing, not loss.'),
    ('canon','ezra',3,12,'canon','psalms',126,6,'free',
      E'*He that goeth forth and weepeth, bearing precious seed, shall doubtless come again with rejoicing, bringing his sheaves with him* (Psalm 126:6). The weeping of the ancient men over the lesser house (Ezra 3:12) is the going-forth in tears; the *precious seed* is the restored worship and the laid foundation. Psalm 126 promises the weeper *shall doubtless come again with rejoicing* — the small, tear-stained beginning ripens into sheaves.'),
    ('canon','ezra',3,12,'apocrypha','1-esdras',5,63,'extras',
      E'*Also of the priests and Levites, and of the chief of their families, the ancients who had seen the former house came to the building of this with weeping and great crying* (1 Esdras 5:63). The restored Greek witness records the same mingled scene — *the ancients who had seen the former house... with weeping and great crying* against *many with trumpets and joy* (1 Esdras 5:64), so that *the trumpets might not be heard for the weeping* (1 Esdras 5:65). It confirms Ezra 3:12-13 detail for detail: the joy and the grief of the day of small things sounded as one.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s315_ezra03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s315_ezra03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =========================================================================
-- THREADS
-- =========================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-3-the-altar-and-the-feast-of-tabernacles-restored-as-it-is-written',
       E'The altar and the feast of tabernacles restored, "as it is written in the law of Moses"',
       E'When the seventh month was come the remnant *gathered themselves together as one man to Jerusalem* (Ezra 3:1), and the first thing they built was not the temple but the altar: *Then stood up Jeshua... and Zerubbabel... and builded the altar of the Elohim (God) of Yashar''el (Israel), to offer burnt offerings thereon, as it is written in the law of Moses the man of Elohim (God)* (Ezra 3:2). Before a single foundation stone of the house was set — *the foundation of the temple of Yahuah (LORD) was not yet laid* (Ezra 3:6) — the appointed worship of Torah was resumed in full.\n\nThe altar itself is the Torah''s own first command of worship: *An altar of earth thou shalt make unto me, and shalt sacrifice thereon thy burnt offerings... in all places where I record my name I will come unto thee, and I will bless thee* (Exodus 20:24), in the place Yahuah chose *to put his name there* (Deuteronomy 12:5), bringing *burnt offerings... vows... freewill offerings* (Deuteronomy 12:6). And the feast they kept was the feast Torah fixed: *They kept also the feast of tabernacles, as it is written* (Ezra 3:4) — *the fifteenth day of this seventh month shall be the feast of tabernacles for seven days unto Yahuah (LORD)* (Leviticus 23:34), the booths *a statute for ever in your generations* (Leviticus 23:41-42), a memorial *that I made the children of Yashar''el (Israel) to dwell in booths, when I brought them out of the land of Egypt* (Leviticus 23:43). They offered *the daily burnt offerings by number, according to the custom* (Ezra 3:4) — the numbered Tabernacles offerings of *the fifteenth day of the seventh month* (Numbers 29:12) — *and afterward... the continual burnt offering, both of the new moons, and of all the set feasts of Yahuah (LORD)* (Ezra 3:5).\n\nTabernacles was, by Moses'' own appointment, the feast for the public reading of the law: *At the end of every seven years... in the feast of tabernacles, when all Yashar''el (Israel) is come... thou shalt read this law before all Yashar''el (Israel) in their hearing* (Deuteronomy 31:10-11). The same restoration generation, finding it *written in the law which Yahuah (LORD) had commanded by Moses, that the children of Yashar''el (Israel) should dwell in booths in the feast of the seventh month* (Nehemiah 8:14), keeps it by the same standard. And the restored Greek witness tells it identically: *Also they held the feast of tabernacles, as it is commanded in the law, and offered sacrifices daily, as was meet* (1 Esdras 5:51). The appointed times of Yahuah were not a discarded "old covenant" — they were the very first thing the returning remnant restored, kept exactly *as it is written*.',
       sv.verse_id, ev.verse_id, 'extras', 31850
  FROM _s315_ezra03_lookup sv, _s315_ezra03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-3-the-foundation-laid-after-the-ordinance-of-david-his-mercy-endureth-for-ever',
       E'The foundation laid, "after the ordinance of David... his mercy endureth for ever"',
       E'When the builders *laid the foundation of the temple of Yahuah (LORD)*, the worship was ordered by the king who had planned the first house: *they set the priests in their apparel with trumpets, and the Levites the sons of Asaph with cymbals, to praise Yahuah (LORD), after the ordinance of David king of Yashar''el (Israel)* (Ezra 3:10). And the song they sang was David''s own: *they sang together by course in praising and giving thanks unto Yahuah (LORD); because he is good, for his mercy endureth for ever toward Yashar''el (Israel)* (Ezra 3:11).\n\nThat refrain reaches straight back to the day David brought up the ark to Jerusalem: *O give thanks unto Yahuah (LORD); for he is good; for his mercy endureth for ever* (1 Chronicles 16:34). The second temple''s foundation is praised with the first temple''s liturgy — the same ordinance, the same Levitical courses, the same words. The restoration is not a break from David''s worship but its resumption: the covenant mercy that *endureth for ever toward Yashar''el (Israel)* is the very ground of the people''s great shout when *the foundation of the house of Yahuah (LORD) was laid* (Ezra 3:11).',
       sv.verse_id, ev.verse_id, 'free', 31851
  FROM _s315_ezra03_lookup sv, _s315_ezra03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-3-the-joy-and-the-weeping-the-day-of-small-things-not-despised',
       E'The joy and the weeping at the foundation — the day of small things not despised',
       E'At the laying of the foundation the sound of the people split in two: *all the people shouted with a great shout, when they praised Yahuah (LORD), because the foundation of the house of Yahuah (LORD) was laid* (Ezra 3:11), *but many of the priests and Levites and chief of the fathers, who were ancient men, that had seen the first house, when the foundation of this house was laid before their eyes, wept with a loud voice* (Ezra 3:12) — *so that the people could not discern the noise of the shout of joy from the noise of the weeping of the people: for the people shouted with a loud shout, and the noise was heard afar off* (Ezra 3:13). The old men remembered Solomon''s glory and grieved that this house looked so small; the young rejoiced that it stood at all. Joy and grief sounded as one.\n\nThe prophets of the same hour speak directly into that grief. Haggai names it: *Who is left among you that saw this house in her first glory? and how do ye see it now? is it not in your eyes in comparison of it as nothing?* (Haggai 2:3) — and then overturns it: *The glory of this latter house shall be greater than of the former, saith Yahuah Tseva''ot (LORD of hosts): and in this place will I give peace* (Haggai 2:9). Zechariah forbids the very contempt the weeping risked: *For who hath despised the day of small things? for they shall rejoice, and shall see the plummet in the hand of Zerubbabel* (Zechariah 4:10) — and Zerubbabel is the man who laid this foundation.\n\nThe Psalm of the return holds the same mingling and turns it to promise: *They that sow in tears shall reap in joy. He that goeth forth and weepeth, bearing precious seed, shall doubtless come again with rejoicing, bringing his sheaves with him* (Psalm 126:5-6). The tears at the foundation are sowing, not loss. The restored Greek witness confirms the scene detail for detail — *the ancients who had seen the former house came to the building of this with weeping and great crying* while others shouted with joy, *insomuch that the trumpets might not be heard for the weeping of the people* (1 Esdras 5:63,65). The restoration looked humble and real at once; the small beginning was never to be despised, for *his mercy endureth for ever toward Yashar''el (Israel)* (Ezra 3:11) and the greater glory was promised.',
       sv.verse_id, ev.verse_id, 'extras', 31852
  FROM _s315_ezra03_lookup sv, _s315_ezra03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- =========================================================================
-- THREAD MEMBERS
-- =========================================================================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*An altar of earth thou shalt make unto me... in all places where I record my name I will come unto thee, and I will bless thee* (Exodus 20:24) — the Torah''s first command of worship, the altar the remnant builds first (Ezra 3:2).'
  FROM cross_reference_threads t
  JOIN _s315_ezra03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s315_ezra03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-3-the-altar-and-the-feast-of-tabernacles-restored-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Unto the place which Yahuah Elohaychem (the LORD your God) shall choose... to put his name there... thither thou shalt come* (Deuteronomy 12:5) — the chosen place is Jerusalem, where the remnant gathers as one man (Ezra 3:1).'
  FROM cross_reference_threads t
  JOIN _s315_ezra03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s315_ezra03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-3-the-altar-and-the-feast-of-tabernacles-restored-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thither ye shall bring your burnt offerings... your vows... your freewill offerings* (Deuteronomy 12:6) — the very menu of offerings the remnant resumes, freewill offering and all (Ezra 3:5).'
  FROM cross_reference_threads t
  JOIN _s315_ezra03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s315_ezra03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-3-the-altar-and-the-feast-of-tabernacles-restored-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*The fifteenth day of this seventh month shall be the feast of tabernacles for seven days unto Yahuah (LORD)* (Leviticus 23:34) — the very feast, in the very month, the remnant keeps *as it is written* (Ezra 3:4).'
  FROM cross_reference_threads t
  JOIN _s315_ezra03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s315_ezra03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-3-the-altar-and-the-feast-of-tabernacles-restored-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Ye shall dwell in booths seven days; all that are Israelites born shall dwell in booths* (Leviticus 23:42) — a statute for ever, kept again at the return (Ezra 3:4).'
  FROM cross_reference_threads t
  JOIN _s315_ezra03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s315_ezra03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-3-the-altar-and-the-feast-of-tabernacles-restored-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*That your generations may know that I made the children of Yashar''el (Israel) to dwell in booths, when I brought them out of the land of Egypt* (Leviticus 23:43) — Tabernacles a memorial of deliverance, now kept by a people brought out of Babylon (Ezra 3:4).'
  FROM cross_reference_threads t
  JOIN _s315_ezra03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s315_ezra03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-3-the-altar-and-the-feast-of-tabernacles-restored-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*On the fifteenth day of the seventh month ye shall have an holy convocation... and ye shall keep a feast unto Yahuah (LORD) seven days* (Numbers 29:12) — the numbered Tabernacles offerings the remnant offers *by number, according to the custom* (Ezra 3:4).'
  FROM cross_reference_threads t
  JOIN _s315_ezra03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s315_ezra03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=29 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-3-the-altar-and-the-feast-of-tabernacles-restored-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*At the end of every seven years... in the feast of tabernacles* (Deuteronomy 31:10) — the feast Moses appointed for reading the law, resumed in the return (Ezra 3:4).'
  FROM cross_reference_threads t
  JOIN _s315_ezra03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s315_ezra03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-3-the-altar-and-the-feast-of-tabernacles-restored-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*When all Yashar''el (Israel) is come to appear before Yahuah Elohayka... in the place which he shall choose, thou shalt read this law before all Yashar''el (Israel) in their hearing* (Deuteronomy 31:11) — the whole people at the chosen place, the pattern of the return (Ezra 3:1,4).'
  FROM cross_reference_threads t
  JOIN _s315_ezra03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s315_ezra03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-3-the-altar-and-the-feast-of-tabernacles-restored-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*They found written in the law which Yahuah (LORD) had commanded by Moses, that the children of Yashar''el (Israel) should dwell in booths in the feast of the seventh month* (Nehemiah 8:14) — the same restoration generation keeps the same feast by the same written standard (Ezra 3:4).'
  FROM cross_reference_threads t
  JOIN _s315_ezra03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s315_ezra03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-3-the-altar-and-the-feast-of-tabernacles-restored-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'*Also they held the feast of tabernacles, as it is commanded in the law, and offered sacrifices daily, as was meet* (1 Esdras 5:51) — the restored Greek witness, *as it is commanded in the law* matching Ezra''s *as it is written* (Ezra 3:4).'
  FROM cross_reference_threads t
  JOIN _s315_ezra03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s315_ezra03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='1-esdras' AND tv.chapter_number=5 AND tv.verse_number=51
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-3-the-altar-and-the-feast-of-tabernacles-restored-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*O give thanks unto Yahuah (LORD); for he is good; for his mercy endureth for ever* (1 Chronicles 16:34) — David''s own refrain from the bringing-up of the ark, sung again over the second temple''s foundation (Ezra 3:10-11).'
  FROM cross_reference_threads t
  JOIN _s315_ezra03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s315_ezra03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=16 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-3-the-foundation-laid-after-the-ordinance-of-david-his-mercy-endureth-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Who is left among you that saw this house in her first glory?... is it not in your eyes in comparison of it as nothing?* (Haggai 2:3) — the prophet names the grief of the old men who wept (Ezra 3:12).'
  FROM cross_reference_threads t
  JOIN _s315_ezra03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s315_ezra03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-3-the-joy-and-the-weeping-the-day-of-small-things-not-despised'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The glory of this latter house shall be greater than of the former, saith Yahuah Tseva''ot (LORD of hosts): and in this place will I give peace* (Haggai 2:9) — the answer to the weeping: the latter house shall outshine the first (Ezra 3:12).'
  FROM cross_reference_threads t
  JOIN _s315_ezra03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s315_ezra03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-3-the-joy-and-the-weeping-the-day-of-small-things-not-despised'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*For who hath despised the day of small things?... they shall see the plummet in the hand of Zerubbabel* (Zechariah 4:10) — Zerubbabel, who laid this foundation (Ezra 3:8), and the small beginning forbidden to be despised.'
  FROM cross_reference_threads t
  JOIN _s315_ezra03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s315_ezra03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-3-the-joy-and-the-weeping-the-day-of-small-things-not-despised'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*They that sow in tears shall reap in joy* (Psalm 126:5) — the return-Psalm holds the same mingled tears and joy of the foundation day (Ezra 3:13).'
  FROM cross_reference_threads t
  JOIN _s315_ezra03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s315_ezra03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=126 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-3-the-joy-and-the-weeping-the-day-of-small-things-not-despised'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*He that goeth forth and weepeth, bearing precious seed, shall doubtless come again with rejoicing, bringing his sheaves with him* (Psalm 126:6) — the tears at the foundation are sowing, not loss; the harvest of joy is promised (Ezra 3:12).'
  FROM cross_reference_threads t
  JOIN _s315_ezra03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s315_ezra03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=126 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-3-the-joy-and-the-weeping-the-day-of-small-things-not-despised'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*The ancients who had seen the former house came to the building of this with weeping and great crying* (1 Esdras 5:63) — the restored Greek witness confirms the mingled joy and grief detail for detail (Ezra 3:12-13).'
  FROM cross_reference_threads t
  JOIN _s315_ezra03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s315_ezra03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='1-esdras' AND tv.chapter_number=5 AND tv.verse_number=63
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-3-the-joy-and-the-weeping-the-day-of-small-things-not-despised'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezra_4.sql (Ezra 4) -----
-- Book: Ezra  Chapter: 4  (the adversaries hinder the building of the house)
-- Tag: ezra04   Session prefix: s315   Sort band: 31875+ (one per thread)
-- Source book_slug=ezra, chapter 4 (edition canon)
-- Member INSERT form: STANDARD with EXPLICIT LITERAL source verse (no compact AS m(...) form). tier BEFORE note.
--
-- Ezra 4 coverage:
--   v.1-3 (the adversaries offer to "help" build; Zerubbabel & Jeshua refuse the mixed alliance)
--        NT:     2 Corinthians 6:14, 6:17 (be not unequally yoked; come out and be separate) [thread]
--        Extras: 1 Esdras 2 (apocrypha-charles-vol1) parallels but OCR/apparatus-corrupt ("Judza","¢hereof") -> NOT quoted (known-bad-parse rule)
--        Tanakh: 2 Kings 17:33 (feared Yahuah and served their own gods); Exodus 34:12 (make no covenant with the land); Nehemiah 2:20 (ye have no portion in Jerusalem) [thread]
--   v.4-5 (the people of the land weaken the hands of Judah, hire counsellors to frustrate the work)
--        NT:     none warranted (the discouraging-opposition motif is carried by the Nehemiah parallels + Psalm 129)
--        Extras: none warranted (1 Esdras parallel corrupt)
--        Tanakh: Nehemiah 4:8 (conspired to fight and hinder); Nehemiah 6:9 (their hands shall be weakened); Psalm 129:1-2 (afflicted from my youth, yet not prevailed) [thread]
--   v.6-24 (letters of accusation to Persian kings; the work ceases unto the second year of Darius)
--        NT:     Matthew 5:11 (when men revile and accuse you falsely) [thread]
--        Extras: none warranted (1 Esdras 2:16-30 parallel corrupt)
--        Tanakh: Daniel 6:4-5 (sought occasion against the faithful, found none save the law of his Elohim) [thread]
--
-- THREADS (3):
--   ezra-4-ye-have-nothing-to-do-with-us-the-refusal-of-the-mixed-alliance   (free; Tanakh + NT) band 31875
--        Guard: 4:2-3 refusal = discernment of the boundary of covenant worship (the people of the land
--        "feared Yahuah and served their own gods", 2Ki17:33 -> NOT true covenant), NOT ethnic hatred.
--   ezra-4-they-weakened-the-hands-of-the-people-of-yahudah                  (free; Tanakh)      band 31876
--   ezra-4-building-the-rebellious-city-the-false-accusation-halts-the-work  (free; Tanakh + NT) band 31877

CREATE TEMP VIEW _s315_ezra04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================
-- CROSS_REFERENCES
-- ============================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: ye have nothing to do with us (4:1-3)
    ('canon','ezra',4,2, 'canon','2-kings',17,33, 'free',
      E'*They feared Yahuah (LORD), and served their own gods, after the manner of the nations whom they carried away from thence.* (2 Kings 17:33). These are the very peoples the king of Assyria resettled in Samaria; their religion is a blend — Yahuah added to their own gods. When the adversaries say *we seek your Elohim (God), as ye do; and we do sacrifice unto him* (Ezra 4:2), this verse exposes the offer: their worship is the mixed, divided heart, not the covenant. The refusal is the discernment of the boundary of true worship, not hatred of a people.'),
    ('canon','ezra',4,3, 'canon','exodus',34,12, 'free',
      E'*Take heed to thyself, lest thou make a covenant with the inhabitants of the land whither thou goest, lest it be for a snare in the midst of thee* (Exodus 34:12). The Torah-command against the binding alliance with the land''s mixed worship is the root of Zerubbabel''s *Ye have nothing to do with us to build an house unto our Elohim (God)* (Ezra 4:3) — refusing the entangling partnership in the work of Yahuah, that it not become a snare.'),
    ('canon','ezra',4,3, 'canon','nehemiah',2,20, 'free',
      E'*Then answered I them, and said unto them, The Elohim (God) of heaven, he will prosper us; therefore we his servants will arise and build: but ye have no portion, nor right, nor memorial, in Jerusalem* (Nehemiah 2:20). Nehemiah''s answer to the same adversaries echoes Zerubbabel''s a generation later — *but ye have no portion* matching *Ye have nothing to do with us* (Ezra 4:3): the work of the covenant house is not a joint venture with those outside the covenant.'),
    ('canon','ezra',4,3, 'canon','2-corinthians',6,14, 'free',
      E'*Be ye not unequally yoked together with unbelievers: for what fellowship hath righteousness with unrighteousness? and what communion hath light with darkness?* (2 Corinthians 6:14). The same boundary reaches FORWARD: the refusal of the mixed alliance in covenant worship is not enmity but the unequal-yoke discernment — *Ye have nothing to do with us to build an house unto our Elohim (God)* (Ezra 4:3) is the temple-builders'' form of the apostolic charge.'),
    ('canon','ezra',4,3, 'canon','2-corinthians',6,17, 'free',
      E'*Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17). The call to come out and be separate is the same covenant fidelity that moved Zerubbabel and Jeshua to build *unto Yahuah Elohim (the LORD God) of Yashar''el (Israel)* alone (Ezra 4:3); separation here is for the sake of undivided worship, the boundary of the house, not the rejection of any people.'),
    -- Thread 2: they weakened the hands (4:4-5)
    ('canon','ezra',4,4, 'canon','nehemiah',4,8, 'free',
      E'*And conspired all of them together to come and to fight against Jerusalem, and to hinder it* (Nehemiah 4:8). The pattern of Ezra 4 repeats at the wall: *the people of the land weakened the hands of the people of Yahudah (Judah), and troubled them in building* (Ezra 4:4) is the same conspiracy to hinder the work of Yahuah by discouragement and trouble.'),
    ('canon','ezra',4,4, 'canon','nehemiah',6,9, 'free',
      E'*For they all made us afraid, saying, Their hands shall be weakened from the work, that it be not done. Now therefore, O Elohim (God), strengthen my hands* (Nehemiah 6:9). The adversaries'' exact strategy is named — to weaken the builders'' hands — the very thing done in *the people of the land weakened the hands of the people of Yahudah (Judah)* (Ezra 4:4); the answer is the prayer for strengthened hands, not retaliation.'),
    ('canon','ezra',4,5, 'canon','psalms',129,1, 'free',
      E'*Many a time have they afflicted me from my youth, may Yashar''el (Israel) now say* (Psalm 129:1). The hiring of counsellors *to frustrate their purpose, all the days of Cyrus king of Persia* (Ezra 4:5) is one more chapter in the long affliction of Yashar''el (Israel) the Psalm sings — the people of promise opposed from the beginning.'),
    ('canon','ezra',4,5, 'canon','psalms',129,2, 'free',
      E'*Many a time have they afflicted me from my youth: yet they have not prevailed against me* (Psalm 129:2). Though the counsellors frustrated the purpose *even until the reign of Darius king of Persia* (Ezra 4:5), the Psalm declares the end of the matter — *yet they have not prevailed* — for the house was finished in the second year of Darius. The opposition delays; it does not defeat.'),
    -- Thread 3: the rebellious city / false accusation (4:6-24)
    ('canon','ezra',4,12, 'canon','daniel',6,4, 'free',
      E'*Then the presidents and princes sought to find occasion against Daniel concerning the kingdom; but they could find none occasion nor fault; forasmuch as he was faithful, neither was there any error or fault found in him* (Daniel 6:4). The letter charging *the rebellious and the bad city* (Ezra 4:12) is the same weapon used against Daniel in the same Persian court — the manufactured accusation against the faithful, who give no true occasion.'),
    ('canon','ezra',4,15, 'canon','daniel',6,5, 'free',
      E'*Then said these men, We shall not find any occasion against this Daniel, except we find it against him concerning the law of his Elohim (God)* (Daniel 6:5). The accusers of Jerusalem turned to *the book of the records* to brand the city rebellious (Ezra 4:15), just as Daniel''s accusers turned to the law of the Medes and Persians to trap him over the law of his Elohim (God): the faithful are charged precisely where they obey Yahuah.'),
    ('canon','ezra',4,12, 'canon','matthew',5,11, 'free',
      E'*Blessed are ye, when men shall revile you, and persecute you, and shall say all manner of evil against you falsely, for my sake* (Matthew 5:11). The false report — *building the rebellious and the bad city* (Ezra 4:12) — is the slander that the work of Yahuah draws; the blessing of the falsely-accused reaches back to cover the builders whose work was halted by a lie.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s315_ezra04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s315_ezra04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- THREADS
-- ============================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-4-ye-have-nothing-to-do-with-us-the-refusal-of-the-mixed-alliance',
       E'Ye have nothing to do with us — the refusal of the mixed alliance',
       E'When the house of Yahuah (LORD) is being rebuilt, *the adversaries of Yahudah (Judah) and Benjamin* come with a friendly offer: *Let us build with you: for we seek your Elohim (God), as ye do; and we do sacrifice unto him since the days of Esar-haddon king of Assur, which brought us up hither* (Ezra 4:2). The offer sounds like worship, but the seam is in the history — these are the foreign peoples the Assyrian resettled in Samaria, of whom it is written *They feared Yahuah (LORD), and served their own gods, after the manner of the nations whom they carried away from thence* (2 Kings 17:33). Theirs is the divided, mixed heart, not the covenant. So Zerubbabel and Jeshua refuse: *Ye have nothing to do with us to build an house unto our Elohim (God); but we ourselves together will build unto Yahuah Elohim (the LORD God) of Yashar''el (Israel), as king Cyrus the king of Persia hath commanded us* (Ezra 4:3). This is not ethnic hatred — it is the discernment of the boundary of true worship. The Torah had already commanded it: *Take heed to thyself, lest thou make a covenant with the inhabitants of the land whither thou goest, lest it be for a snare in the midst of thee* (Exodus 34:12). A generation later Nehemiah answers the same adversaries the same way: *but ye have no portion, nor right, nor memorial, in Jerusalem* (Nehemiah 2:20). And the boundary reaches FORWARD into the apostolic charge: *Be ye not unequally yoked together with unbelievers: for what fellowship hath righteousness with unrighteousness? and what communion hath light with darkness?* (2 Corinthians 6:14) — *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17). The refusal of the false-inclusion partnership is for the sake of undivided worship: the house of Yahuah is built by the covenant people, to Yahuah alone.',
       sv.verse_id, ev.verse_id, 'free', 31875
  FROM _s315_ezra04_lookup sv, _s315_ezra04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-4-they-weakened-the-hands-of-the-people-of-yahudah',
       E'They weakened the hands of the people of Yahudah',
       E'Refused as partners, the adversaries become opposers: *Then the people of the land weakened the hands of the people of Yahudah (Judah), and troubled them in building, And hired counsellors against them, to frustrate their purpose, all the days of Cyrus king of Persia, even until the reign of Darius king of Persia* (Ezra 4:4-5). The weapon is discouragement — to weaken the hands so the work falls. The same pattern stalks the wall in Nehemiah''s day: *And conspired all of them together to come and to fight against Jerusalem, and to hinder it* (Nehemiah 4:8), and the strategy is named outright — *For they all made us afraid, saying, Their hands shall be weakened from the work, that it be not done. Now therefore, O Elohim (God), strengthen my hands* (Nehemiah 6:9). The answer to weakened hands is not retaliation but the prayer for strengthened hands. And the Psalm of Yashar''el (Israel) sets it in the long view: *Many a time have they afflicted me from my youth, may Yashar''el (Israel) now say* (Psalm 129:1) — *Many a time have they afflicted me from my youth: yet they have not prevailed against me* (Psalm 129:2). The counsellors frustrated the purpose for years, but the house was finished in the second year of Darius. The affliction is real; the prevailing belongs to Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 31876
  FROM _s315_ezra04_lookup sv, _s315_ezra04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-4-building-the-rebellious-city-the-false-accusation-halts-the-work',
       E'Building the rebellious city — the false accusation halts the work',
       E'When trouble cannot stop the work, the accusation is filed. The adversaries write to the Persian kings, charging Jerusalem as *the rebellious and the bad city* (Ezra 4:12), warning that *if this city be builded, and the walls set up again, then will they not pay toll, tribute, and custom* (Ezra 4:13), and calling for a search *in the book of the records of thy fathers* to prove *that this city is a rebellious city* (Ezra 4:15). The letters prevail; *Then ceased the work of the house of Elohim (God) which is at Jerusalem. So it ceased unto the second year of the reign of Darius king of Persia* (Ezra 4:24). It is the manufactured accusation against the faithful — the same weapon turned against Daniel in the same Persian court: *Then the presidents and princes sought to find occasion against Daniel concerning the kingdom; but they could find none occasion nor fault; forasmuch as he was faithful, neither was there any error or fault found in him* (Daniel 6:4), so *We shall not find any occasion against this Daniel, except we find it against him concerning the law of his Elohim (God)* (Daniel 6:5). The faithful are accused precisely where they obey Yahuah. And the blessing of Messiah reaches back to cover them: *Blessed are ye, when men shall revile you, and persecute you, and shall say all manner of evil against you falsely, for my sake* (Matthew 5:11). The lie halts the work for a season; it does not unmake the word of Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 31877
  FROM _s315_ezra04_lookup sv, _s315_ezra04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=4 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- THREAD MEMBERS
-- ============================================================
-- Thread 1: ye have nothing to do with us
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*They feared Yahuah (LORD), and served their own gods* (2 Kings 17:33) — the resettled peoples'' mixed worship exposes the offer of Ezra 4:2.'
  FROM cross_reference_threads t
  JOIN _s315_ezra04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s315_ezra04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-4-ye-have-nothing-to-do-with-us-the-refusal-of-the-mixed-alliance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*lest thou make a covenant with the inhabitants of the land... lest it be for a snare* (Exodus 34:12) — the Torah-root of Zerubbabel''s refusal.'
  FROM cross_reference_threads t
  JOIN _s315_ezra04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s315_ezra04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-4-ye-have-nothing-to-do-with-us-the-refusal-of-the-mixed-alliance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*but ye have no portion, nor right, nor memorial, in Jerusalem* (Nehemiah 2:20) — Nehemiah echoes the same refusal a generation later.'
  FROM cross_reference_threads t
  JOIN _s315_ezra04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s315_ezra04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=2 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-4-ye-have-nothing-to-do-with-us-the-refusal-of-the-mixed-alliance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Be ye not unequally yoked together with unbelievers* (2 Corinthians 6:14) — the boundary reaches forward as the unequal-yoke discernment.'
  FROM cross_reference_threads t
  JOIN _s315_ezra04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s315_ezra04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-4-ye-have-nothing-to-do-with-us-the-refusal-of-the-mixed-alliance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*come out from among them, and be ye separate, saith Yahuah (Lord)* (2 Corinthians 6:17) — separation for the sake of undivided worship, the boundary of the house.'
  FROM cross_reference_threads t
  JOIN _s315_ezra04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s315_ezra04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-4-ye-have-nothing-to-do-with-us-the-refusal-of-the-mixed-alliance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: they weakened the hands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And conspired all of them together to come and to fight against Jerusalem, and to hinder it* (Nehemiah 4:8) — the same conspiracy to hinder the work, at the wall.'
  FROM cross_reference_threads t
  JOIN _s315_ezra04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s315_ezra04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-4-they-weakened-the-hands-of-the-people-of-yahudah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Their hands shall be weakened from the work... O Elohim (God), strengthen my hands* (Nehemiah 6:9) — the strategy named, the answer the prayer for strength.'
  FROM cross_reference_threads t
  JOIN _s315_ezra04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s315_ezra04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=6 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-4-they-weakened-the-hands-of-the-people-of-yahudah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Many a time have they afflicted me from my youth* (Psalm 129:1) — the frustrated purpose set in the long affliction of Yashar''el (Israel).'
  FROM cross_reference_threads t
  JOIN _s315_ezra04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=4 AND sv.verse_number=5
  JOIN _s315_ezra04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=129 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-4-they-weakened-the-hands-of-the-people-of-yahudah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*yet they have not prevailed against me* (Psalm 129:2) — the delay does not defeat; the house was finished in the second year of Darius.'
  FROM cross_reference_threads t
  JOIN _s315_ezra04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=4 AND sv.verse_number=5
  JOIN _s315_ezra04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=129 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-4-they-weakened-the-hands-of-the-people-of-yahudah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: the rebellious city / false accusation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*they could find none occasion nor fault; forasmuch as he was faithful* (Daniel 6:4) — the manufactured accusation against the faithful, same Persian court.'
  FROM cross_reference_threads t
  JOIN _s315_ezra04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s315_ezra04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-4-building-the-rebellious-city-the-false-accusation-halts-the-work'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*except we find it against him concerning the law of his Elohim (God)* (Daniel 6:5) — the faithful charged precisely where they obey Yahuah.'
  FROM cross_reference_threads t
  JOIN _s315_ezra04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=4 AND sv.verse_number=15
  JOIN _s315_ezra04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-4-building-the-rebellious-city-the-false-accusation-halts-the-work'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*when men... shall say all manner of evil against you falsely, for my sake* (Matthew 5:11) — the blessing of the falsely-accused reaches back to the halted builders.'
  FROM cross_reference_threads t
  JOIN _s315_ezra04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s315_ezra04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-4-building-the-rebellious-city-the-false-accusation-halts-the-work'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezra_5.sql (Ezra 5) -----
-- Book: Ezra  Chapter: 5  (the prophets stir the work to resume)
-- Tag: ezra05   Session prefix: s315   sort_order band: 31900+
-- Source: canon / ezra / ch 5
--
-- Ezra 5 coverage:
--   v.1-2  the PROPHETIC WORD (Haggai + Zechariah) stirs Zerubbabel and Jeshua to resume the building
--        NT:     none warranted (the Spirit-empowered work weaves laterally within the Tanakh)
--        Extras: none warranted (no clean witness adds beyond Haggai/Zechariah themselves)
--        Tanakh: Haggai 1:8 (build the house, I will be glorified), Haggai 1:14 (Yahuah stirred up
--                the spirit), Zechariah 4:6 (not by might, but by my spirit), Zechariah 4:9
--                (Zerubbabel's hands laid the foundation, his hands shall finish it), Zechariah 8:9
--   v.3-4  Tatnai questions, asks names of the builders
--        NT/Extras/Tanakh: none warranted (narrative; carried under the v.5 thread)
--   v.5  the EYE OF THEIR ELOHIM upon the elders — Yahuah's watchful protection over his people's work
--        NT:     1 Peter 3:12 (the eyes of Yahuah are over the righteous)
--        Extras: none warranted
--        Tanakh: Psalm 33:18 (the eye of Yahuah upon them that fear him), Psalm 32:8 (I will guide
--                thee with mine eye), Proverbs 21:1 (the king's heart in the hand of Yahuah),
--                Ezra 7:9 (the good hand of his Elohim upon him)
--   v.6-17  Tatnai's letter to Darius; the elders' answer recounting captivity-for-sin and Cyrus's decree
--        NT/Extras/Tanakh: none warranted (historical recapitulation; no fresh framework weave)
--
-- Threads:
--   ezra-5-the-prophetic-word-stirred-the-work-to-resume   (anchor 5:1-5:2)  tier free  -- Tanakh only
--   ezra-5-the-eye-of-their-elohim-was-upon-the-elders      (anchor 5:5-5:5)  tier free  -- Tanakh + NT (1 Peter)

CREATE TEMP VIEW _s315_ezra05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the prophetic word stirred the work to resume (5:1-2)
    ('canon','ezra',5,1,'canon','haggai',1,8,'free',
      E'*Go up to the mountain, and bring wood, and build the house; and I will take pleasure in it, and I will be glorified, saith Yahuah (LORD)* (Haggai 1:8). This is the very word the prophet carried when *the prophets, Haggai the prophet, and Zechariah the son of Iddo, prophesied unto the Yahudim (Jews)* (Ezra 5:1). The discouraged work resumes not by a new strategy but because the word of Yahuah commands the house be built.'),
    ('canon','ezra',5,1,'canon','haggai',1,14,'free',
      E'*And Yahuah (LORD) stirred up the spirit of Zerubbabel the son of Shealtiel, governor of Yahudah (Judah), and the spirit of Joshua the son of Josedech, the high priest, and the spirit of all the remnant of the people; and they came and did work in the house of Yahuah Tseva''ot (LORD of hosts), their Elohim (God)* (Haggai 1:14). Ezra names the same moment from the outside — *the prophets... prophesied unto the Yahudim (Jews)* (Ezra 5:1); Haggai names it from within: it was Yahuah who stirred the spirit that made the hands move.'),
    ('canon','ezra',5,2,'canon','zechariah',4,6,'free',
      E'*This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). When *Zerubbabel... and Jeshua... began to build the house of Elohim (God)* (Ezra 5:2), it was no work of human force; the Spirit of Yahuah through the prophets is what revived and empowered the labour.'),
    ('canon','ezra',5,2,'canon','zechariah',4,9,'free',
      E'*The hands of Zerubbabel have laid the foundation of this house; his hands shall also finish it; and thou shalt know that Yahuah Tseva''ot (LORD of hosts) hath sent me unto you* (Zechariah 4:9). The same Zerubbabel who in Ezra 5:2 *began to build the house of Elohim (God)* is promised by the prophet that the hands that began will also finish — the word that stirs the work also guarantees its completion.'),
    ('canon','ezra',5,2,'canon','zechariah',8,9,'free',
      E'*Let your hands be strong, ye that hear in these days these words by the mouth of the prophets, which were in the day that the foundation of the house of Yahuah Tseva''ot (LORD of hosts) was laid, that the temple might be built* (Zechariah 8:9). Zechariah preaches strength into the very builders of Ezra 5:2 — *with them were the prophets of Elohim (God) helping them*; the prophetic word is the helping hand on the work.'),
    -- Thread 2: the eye of their Elohim upon the elders (5:5)
    ('canon','ezra',5,5,'canon','psalms',33,18,'free',
      E'*Behold, the eye of Yahuah (LORD) is upon them that fear him, upon them that hope in his mercy* (Psalm 33:18). Ezra says *the eye of their Elohim (God) was upon the elders of the Yahudim (Jews), that they could not cause them to cease* (Ezra 5:5) — the Psalm names what the narrative shows: the watchful eye of Yahuah is protection upon those who fear him.'),
    ('canon','ezra',5,5,'canon','psalms',32,8,'free',
      E'*I will instruct thee and teach thee in the way which thou shalt go: I will guide thee with mine eye* (Psalm 32:8). The eye of Yahuah is not bare surveillance but guidance and keeping; so *the eye of their Elohim (God) was upon the elders of the Yahudim (Jews)* (Ezra 5:5), steering the matter to Darius rather than to a halt.'),
    ('canon','ezra',5,5,'canon','proverbs',21,1,'free',
      E'*The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1). Because *the eye of their Elohim (God) was upon the elders* (Ezra 5:5), Tatnai *could not cause them to cease, till the matter came to Darius* — and the heart of Darius too is a river Yahuah turns toward his people''s house.'),
    ('canon','ezra',5,5,'canon','ezra',7,9,'free',
      E'*For upon the first day of the first month began he to go up from Babylon, and on the first day of the fifth month came he to Jerusalem, according to the good hand of his Elohim (God) upon him* (Ezra 7:9). The same favour that as *the eye of their Elohim (God)* guarded the elders in Ezra 5:5 is later named the *good hand of his Elohim (God)* upon Ezra — one watchful, helping care over the whole restoration.'),
    ('canon','ezra',5,5,'canon','1-peter',3,12,'free',
      E'*For the eyes of Yahuah (Lord) are over the righteous, and his ears are open unto their prayers: but the face of Yahuah (Lord) is against them that do evil* (1 Peter 3:12). The apostle quotes the same Psalm-promise that protects the elders in Ezra 5:5 — *the eye of their Elohim (God) was upon the elders of the Yahudim (Jews)*; the eyes of Yahuah over the righteous are the standing care his people lean on.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s315_ezra05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s315_ezra05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-5-the-prophetic-word-stirred-the-work-to-resume',
       E'The Prophetic Word Stirred the Work to Resume',
       E'The temple-building had stalled under discouragement and opposition; what restarts it is not a clever plan but the word of Yahuah (LORD) through his prophets. *Then the prophets, Haggai the prophet, and Zechariah the son of Iddo, prophesied unto the Yahudim (Jews) that were in Yahudah (Judah) and Jerusalem in the name of the Elohim (God) of Yashar''el (Israel)... Then rose up Zerubbabel the son of Shealtiel, and Jeshua the son of Jozadak, and began to build the house of Elohim (God) which is at Jerusalem: and with them were the prophets of Elohim (God) helping them* (Ezra 5:1-2). Haggai had carried the command itself — *Go up to the mountain, and bring wood, and build the house; and I will take pleasure in it, and I will be glorified, saith Yahuah (LORD)* (Haggai 1:8) — and Haggai names the unseen cause of the obedience: *And Yahuah (LORD) stirred up the spirit of Zerubbabel... and the spirit of Joshua... and the spirit of all the remnant of the people; and they came and did work in the house of Yahuah Tseva''ot (LORD of hosts)* (Haggai 1:14). Zechariah grounds the whole labour in the Spirit, not in force: *This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6); and he promises completion — *The hands of Zerubbabel have laid the foundation of this house; his hands shall also finish it* (Zechariah 4:9). The prophets the framework honors are the helping hands of Ezra 5:2; Zechariah even preaches strength into those very builders — *Let your hands be strong, ye that hear in these days these words by the mouth of the prophets... that the temple might be built* (Zechariah 8:9). The discouraged work revives where the prophetic word and the Spirit of Yahuah meet the hands that obey.',
       sv.verse_id, ev.verse_id, 'free', 31900
  FROM _s315_ezra05_lookup sv, _s315_ezra05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=5 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-5-the-eye-of-their-elohim-was-upon-the-elders',
       E'The Eye of Their Elohim Was Upon the Elders',
       E'When Tatnai the governor came to halt the building, the work was not protected by walls or armies but by the watchful care of Yahuah (LORD) over his people. *But the eye of their Elohim (God) was upon the elders of the Yahudim (Jews), that they could not cause them to cease, till the matter came to Darius* (Ezra 5:5). The Psalms name this same eye as covenant protection and guidance: *Behold, the eye of Yahuah (LORD) is upon them that fear him, upon them that hope in his mercy* (Psalm 33:18); *I will instruct thee and teach thee in the way which thou shalt go: I will guide thee with mine eye* (Psalm 32:8). And the eye that guards also turns the rulers of the nations — *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1) — so the matter ran to Darius and not to a halt. The book of Ezra itself names this favour again over its scribe: *according to the good hand of his Elohim (God) upon him* (Ezra 7:9), one continuous care over the whole restoration. The apostle Peter, quoting the same promise, hands it forward to all who fear Yahuah: *For the eyes of Yahuah (Lord) are over the righteous, and his ears are open unto their prayers* (1 Peter 3:12). The eye of their Elohim is the standing protection his people lean on when the work is opposed.',
       sv.verse_id, ev.verse_id, 'free', 31901
  FROM _s315_ezra05_lookup sv, _s315_ezra05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1: the prophetic word stirred the work to resume
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Haggai 1:8 — *build the house; and I will take pleasure in it, and I will be glorified, saith Yahuah (LORD)* — the very command the prophet carried to the builders.'
  FROM cross_reference_threads t
  JOIN _s315_ezra05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=5 AND sv.verse_number=1
  JOIN _s315_ezra05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=1 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-5-the-prophetic-word-stirred-the-work-to-resume'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Haggai 1:14 — *Yahuah (LORD) stirred up the spirit of Zerubbabel... and they came and did work* — the unseen cause of the obedience Ezra reports.'
  FROM cross_reference_threads t
  JOIN _s315_ezra05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=5 AND sv.verse_number=1
  JOIN _s315_ezra05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-5-the-prophetic-word-stirred-the-work-to-resume'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Zechariah 4:6 — *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* — the work revived by the Spirit, not by force.'
  FROM cross_reference_threads t
  JOIN _s315_ezra05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s315_ezra05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-5-the-prophetic-word-stirred-the-work-to-resume'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Zechariah 4:9 — *The hands of Zerubbabel have laid the foundation of this house; his hands shall also finish it* — the word that stirs the work guarantees its completion.'
  FROM cross_reference_threads t
  JOIN _s315_ezra05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s315_ezra05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-5-the-prophetic-word-stirred-the-work-to-resume'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Zechariah 8:9 — *Let your hands be strong, ye that hear in these days these words by the mouth of the prophets... that the temple might be built* — strength preached into the very builders.'
  FROM cross_reference_threads t
  JOIN _s315_ezra05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s315_ezra05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=8 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-5-the-prophetic-word-stirred-the-work-to-resume'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: the eye of their Elohim was upon the elders
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 33:18 — *the eye of Yahuah (LORD) is upon them that fear him* — the Psalm names what the narrative shows.'
  FROM cross_reference_threads t
  JOIN _s315_ezra05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s315_ezra05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-5-the-eye-of-their-elohim-was-upon-the-elders'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 32:8 — *I will guide thee with mine eye* — the eye of Yahuah is guidance and keeping, not bare surveillance.'
  FROM cross_reference_threads t
  JOIN _s315_ezra05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s315_ezra05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=32 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-5-the-eye-of-their-elohim-was-upon-the-elders'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Proverbs 21:1 — *The king''s heart is in the hand of Yahuah (LORD)* — the same care turns Darius toward his people''s house.'
  FROM cross_reference_threads t
  JOIN _s315_ezra05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s315_ezra05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-5-the-eye-of-their-elohim-was-upon-the-elders'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Ezra 7:9 — *according to the good hand of his Elohim (God) upon him* — the same favour named again over the scribe, one care over the whole restoration.'
  FROM cross_reference_threads t
  JOIN _s315_ezra05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s315_ezra05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-5-the-eye-of-their-elohim-was-upon-the-elders'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'1 Peter 3:12 — *the eyes of Yahuah (Lord) are over the righteous* — the apostle hands the same promise forward to all who fear Yahuah.'
  FROM cross_reference_threads t
  JOIN _s315_ezra05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s315_ezra05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-5-the-eye-of-their-elohim-was-upon-the-elders'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezra_6.sql (Ezra 6) -----
-- Book: Ezra | Chapter: 6 | book_slug=ezra
-- Tag: ezra06 | session prefix: s315 | temp view: _s315_ezra06_lookup
-- sort_order band start: 31925 (+1 per thread)
-- MEMBER INSERT FORM: STANDARD, explicit literal source verse (sv.chapter_number=6 AND sv.verse_number=<v>). NO compact AS m(...) form.
--
-- Ezra 6 coverage:
--   v.1-13 (Darius finds Cyrus's decree, decrees the work, funds it from the tribute, curses any who hinder):
--        NT:     none warranted (the sovereignty weave handled by the Tanakh chain below)
--        Extras: none warranted (1 Esdras parallel begins at the finished-house, 7:5)
--        Tanakh: Proverbs 21:1 (king's heart in Yahuah's hand), Ezra 1:1 (Yahuah stirred Cyrus's spirit), Isaiah 49:23 (kings shall be thy nursing fathers), Psalm 68:29 (kings bring presents to the temple)  -> THREAD 1
--   v.14-15 (they builded and finished it, prospering through Haggai and Zechariah; the house finished):
--        NT:     Philippians 1:6 (he which hath begun a good work will perform it)
--        Extras: 1 Esdras 7:5 (the holy house finished... in the sixth year of Darius)
--        Tanakh: Zechariah 4:9 (Zerubbabel's hands shall finish it), Haggai 1:14 (Yahuah stirred Zerubbabel's spirit to do the work)  -> THREAD 2
--   v.16-18 (the dedication kept with joy; the priests and Levites set as written in the book of Moses):
--        NT:     none warranted (the Torah-ordered service handled by Tanakh + extras parallel)
--        Extras: 1 Esdras 7:7 (the dedication offering, the same numbers, per the book of Moses)
--        Tanakh: 1 Kings 8:63 (Solomon dedicated the house), 2 Chronicles 7:5 (the dedication offering), Numbers 8:14 (the Levites separated for the service)  -> THREAD 3
--   v.19-22 (the Passover kept the fourteenth day; priests/Levites purified; the feast of unleavened bread seven days with joy; the separated remnant ate):
--        NT:     1 Corinthians 5:7-8 (Messiah our passover; keep the feast)
--        Extras: 1 Esdras 7:14 (kept the feast of unleavened bread seven days, making merry)
--        Tanakh: Exodus 12:14 (keep it a feast for ever), Leviticus 23:5 (the passover the fourteenth day), Deuteronomy 16:1 (keep the passover), 2 Chronicles 30:21 (Hezekiah's feast of unleavened bread seven days with great gladness)  -> THREAD 4
--
-- Threads (slug | target libraries):
--   1. ezra-6-the-kings-heart-is-in-the-hand-of-Yahuah                  | Tanakh (free)
--   2. ezra-6-they-builded-and-finished-it-through-the-prophets-word    | Tanakh + NT + Extras (extras)
--   3. ezra-6-the-dedication-as-it-is-written-in-the-book-of-Moses      | Tanakh + Extras (extras)
--   4. ezra-6-the-passover-kept-with-joy-by-the-separated-remnant       | Tanakh + NT + Extras (extras)
--
-- Framework-load-bearing framing:
--   * 6:8-12 the pagan king Darius made the protector/provider of Yahuah's house = Yahuah's sovereignty over the nations (Prov 21:1; the same hand that stirred Cyrus, Ezra 1:1) -> the nursing-father kings of Isaiah 49:23.
--   * 6:14 the house FINISHED through the prophesying of Haggai and Zechariah = the word that prospers the work; Zech 4:9 (Zerubbabel's hands finish it) -> Phil 1:6 (the faithful Finisher who performs the begun work).
--   * 6:18 "as it is written in the book of Moses" = the Torah-ordered service AFFIRMED at the dedication (never set aside).
--   * 6:19-22 the Passover / Unleavened Bread kept WITH JOY by the returned, separated remnant = the appointed feast (Exod 12 / Lev 23 / Deut 16) RESTORED, never abolished -> 1 Cor 5:7-8 (Messiah our passover; keep the feast). The "as it is written" / "did eat" remnant who separated from the heathen = the two-house people seeking Yahuah.

CREATE TEMP VIEW _s315_ezra06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the king's heart is in the hand of Yahuah (6:8-12)
    ('canon','ezra',6,8,'canon','proverbs',21,1,'free',
      E'*The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* (Proverbs 21:1) Darius decrees *that of the king''s goods, even of the tribute beyond the river, forthwith expenses be given unto these men, that they be not hindered* (Ezra 6:8) — the pagan king made the funder of Yahuah''s house. The heart of the empire is a river turned wherever the Most High wills; the building of Jerusalem''s temple flows out of a Persian treasury because Yahuah holds the king''s heart.'),
    ('canon','ezra',6,8,'canon','ezra',1,1,'free',
      E'*Now in the first year of Cyrus king of Persia, that the word of Yahuah (LORD) by the mouth of Jeremiah might be fulfilled, Yahuah (LORD) stirred up the spirit of Cyrus king of Persia... and put it also in writing* (Ezra 1:1). The same Hand that stirred Cyrus to decree the house now moves Darius to fund it: *of the king''s goods... expenses be given unto these men* (Ezra 6:8). One sovereignty over both kings — the decree and its funding are Yahuah''s word working itself out through the empire.'),
    ('canon','ezra',6,10,'canon','isaiah',49,23,'free',
      E'*And kings shall be thy nursing fathers, and their queens thy nursing mothers: they shall bow down to thee with their face toward the earth... and thou shalt know that I am Yahuah (LORD): for they shall not be ashamed that wait for me.* (Isaiah 49:23) Darius commands daily provision *that they may offer sacrifices of sweet savours unto the Elohim (God) of heaven, and pray for the life of the king* (Ezra 6:10). The Gentile crown becomes a nursing father to the restored remnant — the prophesied posture of the nations toward Yahuah''s people, fulfilled in a Persian decree.'),
    ('canon','ezra',6,9,'canon','psalms',68,29,'free',
      E'*Because of thy temple at Jerusalem shall kings bring presents unto thee.* (Psalm 68:29) Darius orders the supply of *young bullocks, and rams, and lambs, for the burnt offerings of the Elohim (God) of heaven, wheat, salt, wine, and oil... let it be given them day by day without fail* (Ezra 6:9). The Psalm''s word is enacted: because of the temple at Jerusalem a king brings his presents — the tribute of an empire laid at the altar of Yahuah.'),

    -- THREAD 2: they builded and finished it through the prophets' word (6:14-15)
    ('canon','ezra',6,14,'canon','zechariah',4,9,'free',
      E'*The hands of Zerubbabel have laid the foundation of this house; his hands shall also finish it; and thou shalt know that Yahuah Tseva''ot (LORD of hosts) hath sent me unto you.* (Zechariah 4:9) Ezra records the prophecy fulfilled: *the elders of the Yahudim (Jews) builded, and they prospered through the prophesying of Haggai the prophet and Zechariah the son of Iddo... and finished it* (Ezra 6:14). The word that promised Zerubbabel''s hands would finish the house is the word that prospered the work to its finishing.'),
    ('canon','ezra',6,14,'canon','haggai',1,14,'free',
      E'*And Yahuah (LORD) stirred up the spirit of Zerubbabel the son of Shealtiel, governor of Yahudah (Judah)... and the spirit of all the remnant of the people; and they came and did work in the house of Yahuah Tseva''ot (LORD of hosts), their Elohim (God).* (Haggai 1:14) The prophet who stirred the builders is named in the finishing: *they prospered through the prophesying of Haggai the prophet* (Ezra 6:14). The Spirit-stirred work of Haggai 1 carries straight through to the house finished in Ezra 6.'),
    ('canon','ezra',6,15,'apocrypha','1-esdras',7,5,'extras',
      E'*And thus was the holy house finished in the three and twentieth day of the month Adar, in the sixth year of Darius king of the Persians* (1 Esdras 7:5). The restored library''s own record of the same hour: *this house was finished on the third day of the month Adar, which was in the sixth year of the reign of Darius the king* (Ezra 6:15). Two witnesses to the one finishing — the second-temple memory preserved that the house was completed in Darius''s sixth year.'),
    ('canon','ezra',6,14,'canon','philippians',1,6,'free',
      E'*Being confident of this very thing, that he which hath begun a good work in you will perform it until the day of Yahusha HaMashiach (Jesus Christ)* (Philippians 1:6). The pattern of Ezra 6:14 — *they builded, and finished it, according to the commandment of the Elohim (God) of Yashar''el (Israel)* — is the pattern Paul leans on: the work Yahuah begins, Yahuah finishes. The house begun under Cyrus and finished under Darius foreshadows the faithful Finisher who performs the good work he starts.'),

    -- THREAD 3: the dedication, as it is written in the book of Moses (6:16-18)
    ('canon','ezra',6,16,'canon','1-kings',8,63,'free',
      E'*And Solomon offered a sacrifice of peace offerings, which he offered unto Yahuah (LORD), two and twenty thousand oxen, and an hundred and twenty thousand sheep. So the king and all the children of Yashar''el (Israel) dedicated the house of Yahuah (LORD).* (1 Kings 8:63) The returned remnant keep *the dedication of this house of Elohim (God) with joy* (Ezra 6:16) — the second house dedicated as the first was. Smaller in scale but the same act: Yashar''el dedicating the house of Yahuah with offering.'),
    ('canon','ezra',6,17,'canon','2-chronicles',7,5,'free',
      E'*And king Solomon offered a sacrifice of twenty and two thousand oxen, and an hundred and twenty thousand sheep: so the king and all the people dedicated the house of Elohim (God).* (2 Chronicles 7:5) At the second dedication they *offered... an hundred bullocks, two hundred rams, four hundred lambs; and for a sin offering for all Yashar''el (Israel), twelve he goats, according to the number of the tribes of Yashar''el (Israel)* (Ezra 6:17). The twelve-goat sin offering binds the dedication to all twelve tribes — the whole two-house people held in view at the restored altar.'),
    ('canon','ezra',6,18,'canon','numbers',8,14,'free',
      E'*Thus shalt thou separate the Levites from among the children of Yashar''el (Israel): and the Levites shall be mine.* (Numbers 8:14) At the dedication they *set the priests in their divisions, and the Levites in their courses, for the service of Elohim (God)... as it is written in the book of Moses* (Ezra 6:18). The orders set here are the orders Moses received — the Torah-given Levitical service restored exactly as written, never set aside.'),
    ('canon','ezra',6,17,'apocrypha','1-esdras',7,7,'extras',
      E'*And to the dedication of the temple of Yahuah (God) they offered an hundred bullocks two hundred rams, four hundred lambs* (1 Esdras 7:7). The restored library preserves the same dedication, the same numbers: *an hundred bullocks, two hundred rams, four hundred lambs; and for a sin offering for all Yashar''el (Israel), twelve he goats* (Ezra 6:17). The second-temple witness confirms the offering verse for verse.'),

    -- THREAD 4: the passover kept with joy by the separated remnant (6:19-22)
    ('canon','ezra',6,19,'canon','exodus',12,14,'free',
      E'*And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* (Exodus 12:14) Centuries after Egypt, *the children of the captivity kept the passover upon the fourteenth day of the first month* (Ezra 6:19). The ordinance "for ever" is exactly that — kept by the returned remnant on the appointed day, the feast Yahuah commanded never abolished but restored.'),
    ('canon','ezra',6,19,'canon','leviticus',23,5,'free',
      E'*In the fourteenth day of the first month at even is the LORD''S passover.* (Leviticus 23:5) The remnant keep it to the day: *the children of the captivity kept the passover upon the fourteenth day of the first month* (Ezra 6:19). Leviticus 23''s appointed-time calendar is the calendar the returned exiles obey — the fixed fourteenth, the feast of Yahuah on its set day.'),
    ('canon','ezra',6,22,'canon','deuteronomy',16,1,'free',
      E'*Observe the month of Abib, and keep the passover unto Yahuah Elohayka (the LORD thy God): for in the month of Abib Yahuah Elohayka (the LORD thy God) brought thee forth out of Egypt by night.* (Deuteronomy 16:1) The returned remnant *kept the feast of unleavened bread seven days with joy* (Ezra 6:22) — the very command of Deuteronomy 16 enacted by a people brought out of a second captivity, the Abib feast kept again with gladness.'),
    ('canon','ezra',6,22,'canon','2-chronicles',30,21,'free',
      E'*And the children of Yashar''el (Israel) that were present at Jerusalem kept the feast of unleavened bread seven days with great gladness: and the Levites and the priests praised Yahuah (LORD) day by day* (2 Chronicles 30:21). Hezekiah''s restored Passover is the pattern Ezra 6 repeats: *kept the feast of unleavened bread seven days with joy: for Yahuah (LORD) had made them joyful* (Ezra 6:22). Each great covenant-renewal recovers the same feast with the same joy.'),
    ('canon','ezra',6,19,'canon','1-corinthians',5,7,'free',
      E'*Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us... Therefore let us keep the feast.* (1 Corinthians 5:7-8) The captivity-remnant who *kept the passover* (Ezra 6:19) and *the feast of unleavened bread seven days* (Ezra 6:22) hold the appointed time that Paul still tells the assembly to keep — *let us keep the feast.* The Passover is not abolished in Messiah; he is its Lamb, and the feast goes on being kept.'),
    ('canon','ezra',6,22,'apocrypha','1-esdras',7,14,'extras',
      E'*And they kept the feast of unleavened bread seven days, making merry before Yahuah (God), for that he had turned the counsel of the king of Assyria toward them, to strengthen their hands in the works of Yahuah (God) of Yashar''el (Israel)* (1 Esdras 7:14-15). The restored library''s own account matches Ezra word for word: *kept the feast of unleavened bread seven days with joy: for Yahuah (LORD) had made them joyful, and turned the heart of the king of Assyria unto them* (Ezra 6:22). Two witnesses to the joy of the restored feast.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s315_ezra06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s315_ezra06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-6-the-kings-heart-is-in-the-hand-of-Yahuah',
       E'The King''s Heart Is in the Hand of Yahuah',
       E'Darius reads the lost decree of Cyrus and orders the work to go forward — and more, he funds it: *of the king''s goods, even of the tribute beyond the river, forthwith expenses be given unto these men, that they be not hindered* (Ezra 6:8), with daily provision of bullocks, rams, lambs, wheat, salt, wine, and oil for the offerings (Ezra 6:9). The pagan emperor is made the protector and provider of Yahuah''s house. This is the law of the whole book of Ezra: *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1). The same Hand that *stirred up the spirit of Cyrus king of Persia* (Ezra 1:1) now turns the heart of Darius. The prophets had already seen it: *kings shall be thy nursing fathers, and their queens thy nursing mothers* (Isaiah 49:23), and *because of thy temple at Jerusalem shall kings bring presents unto thee* (Psalm 68:29). The empire''s treasury becomes the nursing-father of the restored remnant — Yahuah''s sovereignty over the nations, working the rebuilding of his house out of a Gentile crown.',
       sv.verse_id, ev.verse_id, 'free', 31925
  FROM _s315_ezra06_lookup sv, _s315_ezra06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=6 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-6-they-builded-and-finished-it-through-the-prophets-word',
       E'They Builded, and Finished It, Through the Prophets'' Word',
       E'*And the elders of the Yahudim (Jews) builded, and they prospered through the prophesying of Haggai the prophet and Zechariah the son of Iddo. And they builded, and finished it, according to the commandment of the Elohim (God) of Yashar''el (Israel)... And this house was finished* (Ezra 6:14-15). The finishing is the answer to a prophecy: *The hands of Zerubbabel have laid the foundation of this house; his hands shall also finish it* (Zechariah 4:9). It is the harvest of a stirring: *Yahuah (LORD) stirred up the spirit of Zerubbabel... and the spirit of all the remnant of the people; and they came and did work in the house of Yahuah Tseva''ot (LORD of hosts)* (Haggai 1:14). The restored library remembers the same hour — *thus was the holy house finished in the three and twentieth day of the month Adar, in the sixth year of Darius* (1 Esdras 7:5). And the pattern reaches forward: *he which hath begun a good work in you will perform it until the day of Yahusha HaMashiach (Jesus Christ)* (Philippians 1:6). The work Yahuah begins, Yahuah finishes — through the word of his prophets, by the hands he stirs.',
       sv.verse_id, ev.verse_id, 'extras', 31926
  FROM _s315_ezra06_lookup sv, _s315_ezra06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-6-the-dedication-as-it-is-written-in-the-book-of-Moses',
       E'The Dedication, As It Is Written in the Book of Moses',
       E'*And the children of Yashar''el (Israel), the priests, and the Levites, and the rest of the children of the captivity, kept the dedication of this house of Elohim (God) with joy* (Ezra 6:16), offering bullocks, rams, lambs, *and for a sin offering for all Yashar''el (Israel), twelve he goats, according to the number of the tribes of Yashar''el (Israel)* (Ezra 6:17) — the whole twelve-tribe, two-house people held in view at the restored altar. So the first house had been dedicated: *the king and all the children of Yashar''el (Israel) dedicated the house of Yahuah (LORD)* (1 Kings 8:63; cf. 2 Chronicles 7:5). And the service is set exactly as commanded: *they set the priests in their divisions, and the Levites in their courses, for the service of Elohim (God)... as it is written in the book of Moses* (Ezra 6:18) — the very separation Moses received, *thus shalt thou separate the Levites from among the children of Yashar''el (Israel): and the Levites shall be mine* (Numbers 8:14). The restored library confirms it verse for verse: the dedication offering of *an hundred bullocks two hundred rams, four hundred lambs* (1 Esdras 7:7). The Torah-ordered service is not set aside at the second temple; it is restored to the letter.',
       sv.verse_id, ev.verse_id, 'extras', 31927
  FROM _s315_ezra06_lookup sv, _s315_ezra06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=6 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-6-the-passover-kept-with-joy-by-the-separated-remnant',
       E'The Passover Kept with Joy by the Separated Remnant',
       E'*And the children of the captivity kept the passover upon the fourteenth day of the first month* (Ezra 6:19), the priests and Levites purified, and *kept the feast of unleavened bread seven days with joy: for Yahuah (LORD) had made them joyful* (Ezra 6:22). This is the ordinance Yahuah gave at the exodus: *ye shall keep it a feast by an ordinance for ever* (Exodus 12:14); *in the fourteenth day of the first month at even is the LORD''S passover* (Leviticus 23:5); *observe the month of Abib, and keep the passover unto Yahuah Elohayka (the LORD thy God)* (Deuteronomy 16:1). The appointed time is not abolished — it is recovered, as Hezekiah had recovered it: *kept the feast of unleavened bread seven days with great gladness* (2 Chronicles 30:21). And the ones who eat are the gathered remnant — *the children of Yashar''el (Israel), which were come again out of captivity, and all such as had separated themselves unto them from the filthiness of the heathen of the land, to seek Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (Ezra 6:21). The restored library remembers the same merry feast (1 Esdras 7:14). And the apostle still commands it: *Messiah (Christ) our passover is sacrificed for us... therefore let us keep the feast* (1 Corinthians 5:7-8). The Lamb does not end the feast; he is its center, and the separated people keep it with joy.',
       sv.verse_id, ev.verse_id, 'extras', 31928
  FROM _s315_ezra06_lookup sv, _s315_ezra06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=6 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The king''s heart is in the hand of Yahuah (LORD)... he turneth it whithersoever he will* (Proverbs 21:1) — the law beneath Darius funding the house (Ezra 6:8).'
  FROM cross_reference_threads t
  JOIN _s315_ezra06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s315_ezra06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-6-the-kings-heart-is-in-the-hand-of-Yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah (LORD) stirred up the spirit of Cyrus king of Persia* (Ezra 1:1) — the same Hand that decreed the house now funds it through Darius.'
  FROM cross_reference_threads t
  JOIN _s315_ezra06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s315_ezra06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-6-the-kings-heart-is-in-the-hand-of-Yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Kings shall be thy nursing fathers* (Isaiah 49:23) — the prophesied posture of the nations, enacted in Darius''s daily provision (Ezra 6:10).'
  FROM cross_reference_threads t
  JOIN _s315_ezra06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=10
  JOIN _s315_ezra06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-6-the-kings-heart-is-in-the-hand-of-Yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Because of thy temple at Jerusalem shall kings bring presents unto thee* (Psalm 68:29) — the empire''s tribute laid at the altar (Ezra 6:9).'
  FROM cross_reference_threads t
  JOIN _s315_ezra06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=9
  JOIN _s315_ezra06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=68 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-6-the-kings-heart-is-in-the-hand-of-Yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*His hands shall also finish it* (Zechariah 4:9) — the prophecy of Zerubbabel''s finishing hands, fulfilled in Ezra 6:14.'
  FROM cross_reference_threads t
  JOIN _s315_ezra06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=14
  JOIN _s315_ezra06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-6-they-builded-and-finished-it-through-the-prophets-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah (LORD) stirred up the spirit of Zerubbabel... and they came and did work in the house of Yahuah Tseva''ot* (Haggai 1:14) — the stirring that became the finishing.'
  FROM cross_reference_threads t
  JOIN _s315_ezra06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=14
  JOIN _s315_ezra06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-6-they-builded-and-finished-it-through-the-prophets-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thus was the holy house finished... in the sixth year of Darius* (1 Esdras 7:5) — the restored library''s witness to the same finishing (Ezra 6:15).'
  FROM cross_reference_threads t
  JOIN _s315_ezra06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=15
  JOIN _s315_ezra06_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='1-esdras' AND tv.chapter_number=7 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-6-they-builded-and-finished-it-through-the-prophets-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He which hath begun a good work in you will perform it* (Philippians 1:6) — the faithful Finisher, foreshadowed by the house begun and finished (Ezra 6:14).'
  FROM cross_reference_threads t
  JOIN _s315_ezra06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=14
  JOIN _s315_ezra06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-6-they-builded-and-finished-it-through-the-prophets-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The king and all the children of Yashar''el (Israel) dedicated the house of Yahuah (LORD)* (1 Kings 8:63) — the first dedication the second now repeats (Ezra 6:16).'
  FROM cross_reference_threads t
  JOIN _s315_ezra06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s315_ezra06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=63
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-6-the-dedication-as-it-is-written-in-the-book-of-Moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*So the king and all the people dedicated the house of Elohim (God)* (2 Chronicles 7:5) — the dedication offering pattern behind Ezra 6:17.'
  FROM cross_reference_threads t
  JOIN _s315_ezra06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=17
  JOIN _s315_ezra06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=7 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-6-the-dedication-as-it-is-written-in-the-book-of-Moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thus shalt thou separate the Levites... and the Levites shall be mine* (Numbers 8:14) — the Torah-given orders set up exactly *as it is written in the book of Moses* (Ezra 6:18).'
  FROM cross_reference_threads t
  JOIN _s315_ezra06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=18
  JOIN _s315_ezra06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=8 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-6-the-dedication-as-it-is-written-in-the-book-of-Moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*An hundred bullocks two hundred rams, four hundred lambs* (1 Esdras 7:7) — the restored library confirms the dedication offering verse for verse (Ezra 6:17).'
  FROM cross_reference_threads t
  JOIN _s315_ezra06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=17
  JOIN _s315_ezra06_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='1-esdras' AND tv.chapter_number=7 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-6-the-dedication-as-it-is-written-in-the-book-of-Moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Ye shall keep it a feast by an ordinance for ever* (Exodus 12:14) — the exodus ordinance kept by the captivity-remnant (Ezra 6:19).'
  FROM cross_reference_threads t
  JOIN _s315_ezra06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=19
  JOIN _s315_ezra06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-6-the-passover-kept-with-joy-by-the-separated-remnant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*In the fourteenth day of the first month at even is the LORD''S passover* (Leviticus 23:5) — the appointed day the remnant keep to the letter (Ezra 6:19).'
  FROM cross_reference_threads t
  JOIN _s315_ezra06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=19
  JOIN _s315_ezra06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-6-the-passover-kept-with-joy-by-the-separated-remnant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Observe the month of Abib, and keep the passover unto Yahuah Elohayka* (Deuteronomy 16:1) — the command kept again by a people brought out of a second captivity (Ezra 6:22).'
  FROM cross_reference_threads t
  JOIN _s315_ezra06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=22
  JOIN _s315_ezra06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-6-the-passover-kept-with-joy-by-the-separated-remnant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Kept the feast of unleavened bread seven days with great gladness* (2 Chronicles 30:21) — Hezekiah''s recovered Passover, the pattern Ezra 6:22 repeats.'
  FROM cross_reference_threads t
  JOIN _s315_ezra06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=22
  JOIN _s315_ezra06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=30 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-6-the-passover-kept-with-joy-by-the-separated-remnant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Messiah (Christ) our passover is sacrificed for us... therefore let us keep the feast* (1 Corinthians 5:7-8) — the feast not abolished but centered in the Lamb (Ezra 6:19).'
  FROM cross_reference_threads t
  JOIN _s315_ezra06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=19
  JOIN _s315_ezra06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-6-the-passover-kept-with-joy-by-the-separated-remnant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*They kept the feast of unleavened bread seven days, making merry before Yahuah* (1 Esdras 7:14) — the restored library''s witness to the joy of Ezra 6:22.'
  FROM cross_reference_threads t
  JOIN _s315_ezra06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=6 AND sv.verse_number=22
  JOIN _s315_ezra06_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='1-esdras' AND tv.chapter_number=7 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-6-the-passover-kept-with-joy-by-the-separated-remnant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezra_7.sql (Ezra 7) -----
-- Book: Ezra  Chapter: 7  (KEYSTONE — Ezra the ready scribe comes up to Jerusalem)
-- Tag: ezra07   Session prefix: s315   Temp view: _s315_ezra07_lookup
-- Slug prefix: ezra-7-...   Sort band start: 31950 (+1 per thread)
-- Source: edition 'canon', book_slug 'ezra', chapter 7.
--
-- FRAMING NOTE — 7:10 the prepared heart / do-and-teach (THE keystone):
--   "For Ezra had prepared his heart to seek the law of Yahuah, and to do it, and to teach
--   in Yashar'el statutes and judgments." This is the pattern of the faithful teacher of
--   Torah: the prepared heart FIRST, then seeking the Torah, then DOING it, then TEACHING
--   it — the doing BEFORE the teaching (Matt 5:19 do-and-teach the least commandment; James
--   1:22 doers not hearers only; Acts 1:1 Yahusha began to DO and teach; Rom 2:21 teach not
--   thyself?). The Torah is loved, kept, and taught — the anti-antinomian model of the
--   scribe — set in deliberate contrast to Rehoboam who "prepared not his heart to seek
--   Yahuah" (2 Chron 12:14). Ezra is the "ready scribe in the law of Moses" with the hand of
--   Yahuah upon him (7:6, 7:9); the king's heart that authorizes the work is turned by Yahuah
--   (Prov 21:1; 7:27). NOT Torah-as-abolished anywhere here — the whole chapter is the Torah
--   sought, done, taught, and administered.
--
-- Ezra 7 coverage:
--   v.1-5  (Ezra's Aaronic genealogy traced up to Aaron the chief priest)
--          NT:     none warranted (priestly lineage list; the priesthood weave belongs to
--                  the priestly-course chapters, not the genealogy header)
--          Extras: none warranted
--          Tanakh: none warranted (verified Aaronic descent — supports v.6/v.11 framing)
--   v.6    (this Ezra a READY SCRIBE in the law of Moses; hand of Yahuah upon him)  -> THREAD 1
--          NT:     Matthew 13:52 (every scribe instructed unto the kingdom)
--          Extras: Ecclesiasticus 39:1 (gives his mind to the law of the Most High); 2 Esdras
--                  14:40 (Ezra's heart uttered understanding — Ezra-tradition self-link)
--          Tanakh: Nehemiah 8:1 (Ezra brings the book of the law); Ezra 7:9 (good hand of his
--                  Elohim upon him — internal weave)
--   v.7-9  (the company goes up; the good hand of his Elohim upon him)
--          NT/Extras: none warranted
--          Tanakh: Ezra 7:9 woven into THREAD 1 (the hand of Yahuah)
--   v.10   (Ezra PREPARED HIS HEART to seek, to DO, and to TEACH)  -> THREAD 2 (keystone)
--          NT:     Matthew 5:19 (do and teach); Matthew 7:24 (the doer = wise builder);
--                  James 1:22 (doers not hearers); Acts 1:1 (Yahusha began to do and teach);
--                  Romans 2:21 (teach not thyself?)
--          Extras: Ecclesiasticus 39:8 (shall shew forth what he learned, glory in the law)
--          Tanakh: Deuteronomy 6:1-7 (learn and teach diligently); Deuteronomy 4:5-6 (taught
--                  statutes that ye should DO); Psalm 119:33-34 (teach me... I shall keep it);
--                  2 Chronicles 17:9 (taught with the book of the law); 2 Chronicles 12:14
--                  (Rehoboam prepared NOT his heart — the contrast)
--   v.11-24 (Artaxerxes' letter; the freewill offerings and provision for the house)
--          NT/Extras/Tanakh: none warranted as members (administrative provision; the
--                  Torah-administration weight lands in v.25-26, THREAD 3)
--   v.25-26 (set magistrates that KNOW THE LAWS; teach them that know them not; do the law)
--          -> THREAD 3
--          NT:     Matthew 5:19 (whoso shall DO and teach them, great in the kingdom)
--          Extras: none warranted
--          Tanakh: Deuteronomy 6:1 (commandments to teach you that ye might do them);
--                  Deuteronomy 16:18 (judges and officers to judge righteous judgment)
--   v.27-28 (doxology — Yahuah put it in the king's heart; the hand of Yahuah strengthened me)
--          -> THREAD 4
--          NT/Extras: none warranted
--          Tanakh: Proverbs 21:1 (the king's heart in the hand of Yahuah); Nehemiah 2:8 (king
--                  granted, good hand of my Elohim); Ezra 6:22 (Yahuah turned the heart of the
--                  king)
--
-- Threads (4):
--   1 ezra-7-this-ezra-a-ready-scribe-in-the-law-of-moses          [free+extras] band 31950
--   2 ezra-7-ezra-prepared-his-heart-to-seek-do-and-teach-the-law  [free+extras] band 31951  (KEYSTONE)
--   3 ezra-7-set-magistrates-that-know-the-laws-and-teach-them     [free]        band 31952
--   4 ezra-7-blessed-be-yahuah-who-put-this-in-the-kings-heart     [free]        band 31953

CREATE TEMP VIEW _s315_ezra07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Ezra the ready scribe in the law of Moses (7:6, with 7:9 the hand of Yahuah)
    ('canon','ezra',7,6,'canon','nehemiah',8,1,'free',
     E'*And all the people gathered themselves together as one man into the street that was before the water gate; and they spake unto Ezra the scribe to bring the book of the law of Moses, which Yahuah (LORD) had commanded to Yashar''el (Israel)* (Nehemiah 8:1). The man introduced here as *a ready scribe in the law of Moses* (Ezra 7:6) is the same Ezra the people summon to bring the Torah and read it before the congregation — the scribe''s skill is not antiquarian but ministerial: the Torah carried out to be heard and done by the gathered people.'),
    ('canon','ezra',7,6,'canon','ezra',7,9,'free',
     E'*For upon the first day of the first month began he to go up from Babylon, and on the first day of the fifth month came he to Jerusalem, according to the good hand of his Elohim (God) upon him* (Ezra 7:9). The clause *the hand of Yahuah Elohav (the LORD his God) upon him* in verse 6 is echoed three verses on as *the good hand of his Elohim upon him* — the success of the ready scribe is twice credited to Yahuah''s hand, never to Ezra''s own learning.'),
    ('canon','ezra',7,6,'canon','matthew',13,52,'free',
     E'*Then said he unto them, Therefore every scribe which is instructed unto the kingdom of heaven is like unto a man that is an householder, which bringeth forth out of his treasure things new and old* (Matthew 13:52). Ezra is the pattern of the true scribe — *a ready scribe in the law of Moses* (Ezra 7:6) — and Yahusha holds up that very office, the scribe instructed unto the kingdom who brings out of the Torah''s treasury things new and old: the Torah is the treasure, not the discard.'),
    ('canon','ezra',7,6,'apocrypha','ecclesiasticus',39,1,'extras',
     E'*But he that gives his mind to the law of the Most High, and is occupied in the meditation thereof, will seek out the wisdom of all the ancient, and be occupied in prophecies* (Ecclesiasticus 39:1). Ben Sira''s portrait of the scribe — the man who gives his mind to *the law of the Most High* — is drawn from this very Ezra, *a ready scribe in the law of Moses* (Ezra 7:6): the office of the Torah-scribe held in honour in the second-Temple library.'),
    ('canon','ezra',7,6,'apocrypha','2-esdras',14,40,'extras',
     E'*And I took it, and drank: and when I had drunk of it, my heart uttered understanding, and wisdom grew in my breast, for my spirit strengthened my memory* (2 Esdras 14:40). The Ezra-tradition itself remembers him as the one whose heart was filled to recover and write the law — the same ready scribe whom Yahuah''s hand made fruitful in *the law of Moses* (Ezra 7:6).'),

    -- THREAD 2: Ezra prepared his heart to seek, to do, and to teach (7:10) — KEYSTONE
    ('canon','ezra',7,10,'canon','deuteronomy',6,1,'free',
     E'*Now these are the commandments, the statutes, and the judgments, which Yahuah Elohaychem (the LORD your God) commanded to teach you, that ye might do them in the land whither ye go to possess it* (Deuteronomy 6:1). Ezra''s threefold purpose — *to seek the law of Yahuah, and to do it, and to teach* (Ezra 7:10) — is the Shema''s own order: the commandments are taught in order that they be done. Ezra embodies the Torah''s own design.'),
    ('canon','ezra',7,10,'canon','deuteronomy',6,7,'free',
     E'*And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up* (Deuteronomy 6:7). The charge to *teach* in *Yashar''el (Israel) statutes and judgments* (Ezra 7:10) is the Shema''s command to teach the words diligently — words first laid up *in thine heart* (Deuteronomy 6:6), exactly as Ezra first *prepared his heart*.'),
    ('canon','ezra',7,10,'canon','deuteronomy',4,5,'free',
     E'*Behold, I have taught you statutes and judgments, even as Yahuah Elohai (the LORD my God) commanded me, that ye should do so in the land whither ye go to possess it* (Deuteronomy 4:5). Moses sets the same word-pair Ezra takes up — *statutes and judgments* taught *that ye should do* — and the next verse calls obedience *your wisdom and your understanding in the sight of the nations* (Deuteronomy 4:6): the doing of the Torah is the wisdom, never its abolition.'),
    ('canon','ezra',7,10,'canon','psalms',119,33,'free',
     E'*Teach me, O Yahuah (LORD), the way of thy statutes; and I shall keep it unto the end* (Psalm 119:33). The psalmist asks for the very thing Ezra prepared in himself — to be taught the statutes in order to keep them — and the next verse binds it to the prepared heart: *Give me understanding, and I shall keep thy law; yea, I shall observe it with my whole heart* (Psalm 119:34).'),
    ('canon','ezra',7,10,'canon','2-chronicles',17,9,'free',
     E'*And they taught in Yahudah (Judah), and had the book of the law of Yahuah (LORD) with them, and went about throughout all the cities of Yahudah (Judah), and taught the people* (2 Chronicles 17:9). Jehoshaphat''s teachers went out with the book of the law to teach the people — the same office Ezra is sent to fulfil, *to teach in Yashar''el (Israel) statutes and judgments* (Ezra 7:10): the Torah carried into the cities and taught, not shelved.'),
    ('canon','ezra',7,10,'canon','2-chronicles',12,14,'free',
     E'*And he did evil, because he prepared not his heart to seek Yahuah (LORD)* (2 Chronicles 12:14). Rehoboam is the dark mirror of Ezra: where Ezra *prepared his heart to seek the law of Yahuah* (Ezra 7:10), Rehoboam *prepared not his heart to seek Yahuah* — and the verdict was *he did evil*. The prepared heart is the dividing line between the faithful and the faithless.'),
    ('canon','ezra',7,10,'canon','matthew',5,19,'free',
     E'*Whosoever therefore shall break one of these least commandments, and shall teach men so, he shall be called the least in the kingdom of heaven: but whosoever shall do and teach them, the same shall be called great in the kingdom of heaven* (Matthew 5:19). Yahusha sets Ezra''s very order — *do and teach* — as the measure of greatness in the kingdom, and the doing comes first, just as Ezra resolved *to do it, and to teach* (Ezra 7:10). The commandments are kept and taught, not broken and explained away.'),
    ('canon','ezra',7,10,'canon','matthew',7,24,'free',
     E'*Therefore whosoever heareth these sayings of mine, and doeth them, I will liken him unto a wise man, which built his house upon a rock* (Matthew 7:24). The doer, not the mere hearer, is the wise builder — the same DOING that Ezra placed before the teaching when he *prepared his heart to seek the law of Yahuah, and to do it* (Ezra 7:10).'),
    ('canon','ezra',7,10,'canon','james',1,22,'free',
     E'*But be ye doers of the word, and not hearers only, deceiving your own selves* (James 1:22). James presses the same priority Ezra modelled — the word done, not merely heard — for Ezra resolved first *to do it*, and only then *to teach* (Ezra 7:10). The teacher who has not done the word deceives himself first.'),
    ('canon','ezra',7,10,'canon','acts',1,1,'free',
     E'*The former treatise have I made, O Theophilus, of all that Yahusha (Jesus) began both to do and teach* (Acts 1:1). The Formed Son walks the same path the ready scribe walked — *both to do and teach* — the doing first, the teaching flowing from it, exactly Ezra''s order *to do it, and to teach in Yashar''el (Israel)* (Ezra 7:10).'),
    ('canon','ezra',7,10,'canon','romans',2,21,'free',
     E'*Thou therefore which teachest another, teachest thou not thyself? thou that preachest a man should not steal, dost thou steal?* (Romans 2:21). Paul indicts the teacher who teaches what he does not do — the very failure Ezra guarded against by preparing his heart to *do it* before he would *teach* (Ezra 7:10). The Torah taught by an unkept life condemns the teacher.'),
    ('canon','ezra',7,10,'apocrypha','ecclesiasticus',39,8,'extras',
     E'*He shall shew forth that which he has learned, and shall glory in the law of the covenant of Yahuah (God)* (Ecclesiasticus 39:8). Ben Sira''s ideal scribe teaches only what he has first learned and lived, and his glory is *the law of the covenant* — the same fusion of doing and teaching grounded in the Torah that Ezra embodied when he *prepared his heart to seek the law of Yahuah, and to do it, and to teach* (Ezra 7:10).'),

    -- THREAD 3: set magistrates that know the laws, and teach them that know them not (7:25-26)
    ('canon','ezra',7,25,'canon','deuteronomy',6,1,'free',
     E'*Now these are the commandments, the statutes, and the judgments, which Yahuah Elohaychem (the LORD your God) commanded to teach you, that ye might do them in the land whither ye go to possess it* (Deuteronomy 6:1). Ezra is authorized to set judges *all such as know the laws of thy Elohim; and teach ye them that know them not* (Ezra 7:25) — the same Torah, the same purpose of teaching unto doing, now administered in the restored land.'),
    ('canon','ezra',7,26,'canon','matthew',5,19,'free',
     E'*but whosoever shall do and teach them, the same shall be called great in the kingdom of heaven* (Matthew 5:19). The decree that *whosoever will not do the law of thy Elohim (God)... let judgment be executed* (Ezra 7:26) treats the Torah as binding and DOABLE — the same standing Yahusha gives it, the commandments to be done and taught, not abolished.'),

    -- THREAD 4: blessed be Yahuah who put this in the king's heart (7:27-28)
    ('canon','ezra',7,27,'canon','proverbs',21,1,'free',
     E'*The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1). Ezra blesses Yahuah *which hath put such a thing as this in the king''s heart* (Ezra 7:27) — the proverb made plain: the heart of a pagan emperor is a river in Yahuah''s hand, turned to beautify the house of Yahuah.'),
    ('canon','ezra',7,28,'canon','nehemiah',2,8,'free',
     E'*And the king granted me, according to the good hand of my Elohim (God) upon me* (Nehemiah 2:8). Nehemiah''s testimony is the twin of Ezra''s — *I was strengthened as the hand of Yahuah Elohai (the LORD my God) was upon me* (Ezra 7:28): the same favour of the king, the same hand of Yahuah, the same restoration of the house and the city.'),
    ('canon','ezra',7,27,'canon','ezra',6,22,'free',
     E'*for Yahuah (LORD) had made them joyful, and turned the heart of the king of Assyria unto them, to strengthen their hands in the work of the house of Elohim (God)* (Ezra 6:22). One chapter earlier the book has already declared the principle Ezra now blesses — Yahuah *turned the heart of the king* to strengthen the work of his house, exactly the thing *put... in the king''s heart* (Ezra 7:27).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-7-this-ezra-a-ready-scribe-in-the-law-of-moses',
       E'This Ezra — a ready scribe in the law of Moses, the hand of Yahuah upon him',
       E'*This Ezra went up from Babylon; and he was a ready scribe in the law of Moses, which Yahuah Elohim (the LORD God) of Yashar''el (Israel) had given: and the king granted him all his request, according to the hand of Yahuah Elohav (the LORD his God) upon him* (Ezra 7:6). The man''s honour is his skill in the Torah — and the success of that skill is twice laid at Yahuah''s feet, for *upon the first day of the first month began he to go up from Babylon... according to the good hand of his Elohim (God) upon him* (Ezra 7:9). This is the scribe Yahusha holds up: *every scribe which is instructed unto the kingdom of heaven is like unto a man that is an householder, which bringeth forth out of his treasure things new and old* (Matthew 13:52) — the Torah is the treasure. The people know him for exactly this: *they spake unto Ezra the scribe to bring the book of the law of Moses, which Yahuah (LORD) had commanded to Yashar''el (Israel)* (Nehemiah 8:1). The second-Temple library kept his office in honour — *he that gives his mind to the law of the Most High, and is occupied in the meditation thereof, will seek out the wisdom of all the ancient* (Ecclesiasticus 39:1) — and the Ezra-tradition remembers his filled heart: *when I had drunk of it, my heart uttered understanding, and wisdom grew in my breast* (2 Esdras 14:40). The ready scribe is not the Torah''s curator; he is its servant, made fruitful by the hand of Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 31950
  FROM _s315_ezra07_lookup sv, _s315_ezra07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=7 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-7-ezra-prepared-his-heart-to-seek-do-and-teach-the-law',
       E'Ezra prepared his heart to seek the law, and to do it, and to teach it',
       E'*For Ezra had prepared his heart to seek the law of Yahuah (LORD), and to do it, and to teach in Yashar''el (Israel) statutes and judgments* (Ezra 7:10). Here is the whole pattern of the faithful teacher of Torah, in its exact order: the **prepared heart** first, then the **seeking**, then the **doing**, and only then the **teaching**. The doing comes before the teaching. This is the Torah''s own design — *these are the commandments, the statutes, and the judgments, which Yahuah Elohaychem (the LORD your God) commanded to teach you, that ye might do them* (Deuteronomy 6:1) — words first laid *in thine heart* and then taught *diligently unto thy children* (Deuteronomy 6:6-7). Moses had walked it himself: *I have taught you statutes and judgments... that ye should do so* (Deuteronomy 4:5), and the doing of them is *your wisdom and your understanding in the sight of the nations* (Deuteronomy 4:6). The psalmist prays for the same gift Ezra prepared: *Teach me, O Yahuah (LORD), the way of thy statutes; and I shall keep it unto the end* (Psalm 119:33). Jehoshaphat''s Levites carried it into the cities: *they taught in Yahudah (Judah), and had the book of the law of Yahuah (LORD) with them* (2 Chronicles 17:9). And the dark mirror stands one book over: *he did evil, because he prepared not his heart to seek Yahuah (LORD)* (2 Chronicles 12:14) — the prepared heart is the dividing line. The Formed Son seals the order: *whosoever shall do and teach them, the same shall be called great in the kingdom of heaven* (Matthew 5:19); the doer is *a wise man, which built his house upon a rock* (Matthew 7:24); *be ye doers of the word, and not hearers only* (James 1:22); the One who taught *began both to do and teach* (Acts 1:1); and the teacher who will not do is exposed — *thou therefore which teachest another, teachest thou not thyself?* (Romans 2:21). The second-Temple scribe was held to the same fusion: *he shall shew forth that which he has learned, and shall glory in the law of the covenant of Yahuah (God)* (Ecclesiasticus 39:8). The Torah is loved, kept, and taught — never explained away. This is the anti-antinomian model of the scribe: the prepared heart, the Torah sought, the Torah done, and then the Torah taught.',
       sv.verse_id, ev.verse_id, 'extras', 31951
  FROM _s315_ezra07_lookup sv, _s315_ezra07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=7 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-7-set-magistrates-that-know-the-laws-and-teach-them',
       E'Set magistrates that know the laws, and teach them that know them not',
       E'*And thou, Ezra, after the wisdom of thy Elohim (God), that is in thine hand, set magistrates and judges, which may judge all the people that are beyond the river, all such as know the laws of thy Elohim (God); and teach ye them that know them not* (Ezra 7:25). The Persian decree authorizes the administration of the Torah itself: judges chosen because they *know the laws*, and a mandate to *teach* the rest — the same purpose the Torah declares, *which Yahuah Elohaychem (the LORD your God) commanded to teach you, that ye might do them* (Deuteronomy 6:1). And the Torah is treated as binding and doable: *whosoever will not do the law of thy Elohim (God), and the law of the king, let judgment be executed speedily upon him* (Ezra 7:26) — the very standing Yahusha gives the commandments, *whosoever shall do and teach them, the same shall be called great in the kingdom of heaven* (Matthew 5:19). The empire''s decree bends to enthrone the law of Yahuah in the restored land.',
       sv.verse_id, ev.verse_id, 'free', 31952
  FROM _s315_ezra07_lookup sv, _s315_ezra07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=7 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-7-blessed-be-yahuah-who-put-this-in-the-kings-heart',
       E'Blessed be Yahuah, who put this in the king''s heart — the hand of Yahuah strengthened me',
       E'*Blessed be Yahuah Elohim (the LORD God) of our fathers, which hath put such a thing as this in the king''s heart, to beautify the house of Yahuah (LORD) which is in Jerusalem... And I was strengthened as the hand of Yahuah Elohai (the LORD my God) was upon me* (Ezra 7:27-28). Ezra credits nothing to Persian goodwill and everything to Yahuah, who turned an emperor''s heart to his purpose — the proverb made history: *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1). Nehemiah would testify in the same words: *the king granted me, according to the good hand of my Elohim (God) upon me* (Nehemiah 2:8). And the book itself had already declared the pattern one chapter back — *Yahuah (LORD) had made them joyful, and turned the heart of the king of Assyria unto them, to strengthen their hands in the work of the house of Elohim (God)* (Ezra 6:22). The restoration of the house is Yahuah''s doing, worked through the heart of a king he holds like water in his hand.',
       sv.verse_id, ev.verse_id, 'free', 31953
  FROM _s315_ezra07_lookup sv, _s315_ezra07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=7 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Nehemiah 8:1 — the people summon Ezra the scribe to bring the book of the law of Moses; the ready scribe''s skill is ministerial, the Torah carried out to be heard.'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-this-ezra-a-ready-scribe-in-the-law-of-moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Ezra 7:9 — the good hand of his Elohim upon him; the same clause as v.6, the scribe''s success twice credited to Yahuah''s hand (internal weave).'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-this-ezra-a-ready-scribe-in-the-law-of-moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Matthew 13:52 — the scribe instructed unto the kingdom brings out of his treasure things new and old; Yahusha honours Ezra''s very office, the Torah the treasure.'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-this-ezra-a-ready-scribe-in-the-law-of-moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Ecclesiasticus 39:1 — he that gives his mind to the law of the Most High; Ben Sira''s portrait of the scribe drawn from this Ezra (extras).'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=39 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-this-ezra-a-ready-scribe-in-the-law-of-moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'2 Esdras 14:40 — Ezra''s heart uttered understanding and wisdom grew in his breast; the Ezra-tradition''s own memory of the filled scribe (extras).'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=14 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-this-ezra-a-ready-scribe-in-the-law-of-moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 (keystone)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 6:1 — the commandments commanded to teach you, that ye might do them; the Shema''s order is the order Ezra prepared, teaching unto doing.'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-ezra-prepared-his-heart-to-seek-do-and-teach-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 6:7 — teach them diligently; the words first in the heart (v.6) then taught, exactly Ezra''s prepared heart then teaching.'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-ezra-prepared-his-heart-to-seek-do-and-teach-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 4:5 — Moses taught statutes and judgments that ye should do; the doing of the Torah is the wisdom in the sight of the nations (v.6).'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-ezra-prepared-his-heart-to-seek-do-and-teach-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 119:33 — teach me thy statutes and I shall keep it; the prayer for the very gift Ezra prepared, kept with the whole heart (v.34).'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-ezra-prepared-his-heart-to-seek-do-and-teach-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'2 Chronicles 17:9 — Jehoshaphat''s Levites taught with the book of the law throughout the cities; the same office Ezra is sent to fulfil.'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=17 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-ezra-prepared-his-heart-to-seek-do-and-teach-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'2 Chronicles 12:14 — Rehoboam did evil because he prepared NOT his heart to seek Yahuah; the dark mirror of Ezra''s prepared heart.'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=12 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-ezra-prepared-his-heart-to-seek-do-and-teach-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Matthew 5:19 — whoso shall DO and teach them, great in the kingdom; Yahusha sets Ezra''s order, the doing before the teaching, as the measure of greatness.'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-ezra-prepared-his-heart-to-seek-do-and-teach-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Matthew 7:24 — the doer is the wise man who built on the rock; the DOING Ezra placed before the teaching.'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-ezra-prepared-his-heart-to-seek-do-and-teach-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'James 1:22 — be ye doers of the word, not hearers only; the teacher who has not done the word deceives himself first.'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-ezra-prepared-his-heart-to-seek-do-and-teach-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'Acts 1:1 — Yahusha began both to DO and teach; the Formed Son walks the ready scribe''s path, the doing first.'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-ezra-prepared-his-heart-to-seek-do-and-teach-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'Romans 2:21 — thou which teachest another, teachest thou not thyself?; the failure Ezra guarded against by doing before teaching.'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-ezra-prepared-his-heart-to-seek-do-and-teach-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 12, E'Ecclesiasticus 39:8 — he shall shew forth what he learned and glory in the law of the covenant; the second-Temple scribe held to the same do-and-teach fusion (extras).'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=39 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-ezra-prepared-his-heart-to-seek-do-and-teach-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 6:1 — commanded to teach you that ye might do them; the same Torah-purpose Ezra is authorized to administer through judges who know the laws.'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=25
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-set-magistrates-that-know-the-laws-and-teach-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Matthew 5:19 — whoso shall do and teach them, great in the kingdom; the decree''s "whosoever will not DO the law" treats the Torah as binding and doable, the standing Yahusha gives it.'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=26
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-set-magistrates-that-know-the-laws-and-teach-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Proverbs 21:1 — the king''s heart in the hand of Yahuah, turned whithersoever he will; the proverb made history in Artaxerxes'' heart.'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=27
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-blessed-be-yahuah-who-put-this-in-the-kings-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Nehemiah 2:8 — the king granted me according to the good hand of my Elohim; Nehemiah''s testimony the twin of Ezra''s strengthening.'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=28
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=2 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-blessed-be-yahuah-who-put-this-in-the-kings-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Ezra 6:22 — Yahuah turned the heart of the king to strengthen their hands in the work of the house; the principle already declared one chapter back (internal weave).'
  FROM cross_reference_threads t
  JOIN _s315_ezra07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=7 AND sv.verse_number=27
  JOIN _s315_ezra07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-7-blessed-be-yahuah-who-put-this-in-the-kings-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezra_8.sql (Ezra 8) -----
-- Book: Ezra  Chapter: 8  (book_slug 'ezra', edition 'canon')
-- Session prefix: s315   Tag: ezra08   Temp view: _s315_ezra08_lookup
-- Slug prefix: ezra-8-...   Sort band start: 31975 (+1 per thread)
-- Threads: 3  (target: 2-4)
--
-- Ezra 8 coverage:
--   v.1-20  the heads/genealogy of those who went up + the search for Levites/ministers
--           NT:     none warranted (registry + the need for the consecrated servants of the house)
--           Extras: none warranted
--           Tanakh: none warranted (covered indirectly by the journey-thread's hand-of-Elohim, v.18)
--   v.21-23 ★★ the FAST at the river Ahava — afflict ourselves, seek a right way, ashamed to require
--           the king's soldiers; the hand of our Elohim upon all them for good that SEEK him, his
--           wrath against them that FORSAKE him; so we fasted and he was intreated of us
--           NT:     Romans 8:28 (all things for good to them that love Elohim); Matthew 6:33 (seek first)
--           Extras: none warranted (clean canon witnesses carry the whole weight)
--           Tanakh: 2 Chron 15:2 (seek/forsake principle); Ps 33:18-19 (eye of Yahuah, not the horse);
--                   Ps 34:15,17 (eyes of Yahuah on the righteous, he heareth and delivereth);
--                   Isa 31:1 (woe to them that trust in chariots/horsemen, look not to the Holy One);
--                   Prov 3:5-6 (trust in Yahuah, lean not to thine own understanding)
--           --> thread ezra-8-the-fast-at-ahava-seek-him-trust-not-in-the-kings-soldiers  (tier free)
--   v.24-30 ★ the HOLY things weighed out and entrusted — Ye are holy unto Yahuah, the vessels are
--           holy also; Watch ye, and keep them
--           NT:     1 Cor 4:2 (required in stewards that a man be found faithful); 2 Tim 1:14 (that good
--                   thing committed unto thee keep)
--           Extras: none warranted
--           Tanakh: Lev 22:2-3 (separate from / not profane the holy things); Num 4:15 (the holy vessels
--                   borne, but they shall not touch lest they die)
--           --> thread ezra-8-ye-are-holy-the-vessels-are-holy-watch-ye-and-keep-them  (tier free)
--   v.31-32 ★ the answered fast / the safe journey — the hand of our Elohim was upon us, and he
--           delivered us from the hand of the enemy and of such as lay in wait by the way
--           NT:     none warranted
--           Extras: none warranted
--           Tanakh: Ezra 7:9 (the good hand of his Elohim upon him on the going up); Ps 121:7-8 (Yahuah
--                   shall preserve thy going out and thy coming in)
--           --> thread ezra-8-the-hand-of-our-elohim-was-upon-us-he-delivered-us-by-the-way  (tier free)
--   v.33-36 the weighing in at Jerusalem + the burnt offerings of the captivity for all Yashar'el
--           NT/Extras/Tanakh: none warranted (the books-balanced epilogue; covered by the journey thread)

CREATE TEMP VIEW _s315_ezra08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================
-- B. cross_references
-- ============================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the fast at Ahava — seek him, trust not the king's soldiers (anchor 8:21-23)
    ('canon','ezra',8,22,'canon','2-chronicles',15,2,'free',
     E'*And he went out to meet Asa, and said unto him, Hear ye me, Asa, and all Yahudah (Judah) and Benjamin; Yahuah (LORD) is with you, while ye be with him; and if ye seek him, he will be found of you; but if ye forsake him, he will forsake you.* (2 Chronicles 15:2). Ezra confesses the very principle to the king: *the hand of our Elohim (God) is upon all them for good that seek him; but his power and his wrath is against all them that forsake him* (Ezra 8:22). The seek/forsake covenant law is the ground of the fast — Yahuah found of them that seek, lost by them that forsake.'),
    ('canon','ezra',8,21,'canon','psalms',33,18,'free',
     E'*Behold, the eye of Yahuah (LORD) is upon them that fear him, upon them that hope in his mercy; To deliver their soul from death, and to keep them alive in famine.* (Psalm 33:18-19). Ezra proclaims a fast *to seek of him a right way for us, and for our little ones* (Ezra 8:21); the psalm sings the same dependence — not the horse, but the eye of Yahuah, delivers them on the way.'),
    ('canon','ezra',8,23,'canon','psalms',34,17,'free',
     E'*The eyes of Yahuah (LORD) are upon the righteous, and his ears are open unto their cry. The righteous cry, and Yahuah (LORD) heareth, and delivereth them out of all their troubles.* (Psalm 34:15,17). Ezra records the answer: *So we fasted and besought our Elohim (God) for this: and he was intreated of us* (Ezra 8:23) — the cry of the seeking heard and delivered.'),
    ('canon','ezra',8,22,'canon','isaiah',31,1,'free',
     E'*Woe to them that go down to Egypt for help; and stay on horses, and trust in chariots, because they are many; and in horsemen, because they are very strong; but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* (Isaiah 31:1). Ezra refuses the very thing Isaiah pronounces woe upon — *I was ashamed to require of the king a band of soldiers and horsemen* (Ezra 8:22); he looks to the Holy One instead of the chariots.'),
    ('canon','ezra',8,21,'canon','proverbs',3,5,'free',
     E'*Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding. In all thy ways acknowledge him, and he shall direct thy paths.* (Proverbs 3:5-6). The fast that seeks *a right way for us* (Ezra 8:21) is the lived form of the proverb — not leaning to the arm of the king, but acknowledging Yahuah that he direct the path.'),
    ('canon','ezra',8,22,'canon','romans',8,28,'free',
     E'*And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* (Romans 8:28). Ezra''s confession that *the hand of our Elohim (God) is upon all them for good that seek him* (Ezra 8:22) is the seed of the apostle''s promise — the good worked for them that love and seek him, the called of his purpose.'),
    ('canon','ezra',8,21,'canon','matthew',6,33,'free',
     E'*But seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you.* (Matthew 6:33). Ezra seeks first — fasting before he goes up, committing *our little ones, and... all our substance* (Ezra 8:21) to Yahuah — and the way is given; the same priority the Master commands.'),
    -- THREAD 2: ye are holy, the vessels are holy — watch ye and keep them (anchor 8:24-30)
    ('canon','ezra',8,28,'canon','leviticus',22,2,'free',
     E'*Speak unto Aaron and to his sons, that they separate themselves from the holy things of the children of Yashar''el (Israel), and that they profane not my holy name in those things which they hallow unto me: I am Yahuah (LORD).* (Leviticus 22:2). Ezra applies the Torah of the consecrated to the company: *Ye are holy unto Yahuah (LORD); the vessels are holy also* (Ezra 8:28) — the holy things and the men who bear them set apart, not profaned.'),
    ('canon','ezra',8,29,'canon','numbers',4,15,'free',
     E'*And when Aaron and his sons have made an end of covering the sanctuary, and all the vessels of the sanctuary... the sons of Kohath shall come to bear it: but they shall not touch any holy thing, lest they die. These things are the burden of the sons of Kohath in the tabernacle of the congregation.* (Numbers 4:15). The charge to bear the holy vessels under guard is the Torah behind Ezra''s *Watch ye, and keep them* (Ezra 8:29) — the consecrated things carried, weighed, and accounted for.'),
    ('canon','ezra',8,29,'canon','1-corinthians',4,2,'free',
     E'*Moreover it is required in stewards, that a man be found faithful.* (1 Corinthians 4:2). Ezra weighs out the silver and gold to the priests and charges them to *Watch ye, and keep them, until ye weigh them* (Ezra 8:29) — the stewardship of the consecrated, the faithful keeping required of those entrusted.'),
    ('canon','ezra',8,28,'canon','2-timothy',1,14,'free',
     E'*That good thing which was committed unto thee keep by the Ruach HaKodesh (Holy Spirit) which dwelleth in us.* (2 Timothy 1:14). The holy vessels *committed* to the priests to *keep* (Ezra 8:28-29) prefigure the deposit kept by the apostolic charge — the consecrated thing guarded by them to whom it is entrusted.'),
    -- THREAD 3: the hand of our Elohim was upon us — he delivered us by the way (anchor 8:31-32)
    ('canon','ezra',8,31,'canon','ezra',7,9,'free',
     E'*For upon the first day of the first month began he to go up from Babylon, and on the first day of the fifth month came he to Jerusalem, according to the good hand of his Elohim (God) upon him.* (Ezra 7:9). The journey announced in chapter seven is now answered in deed: *the hand of our Elohim (God) was upon us, and he delivered us from the hand of the enemy* (Ezra 8:31) — the good hand that began the going up brought them safely through.'),
    ('canon','ezra',8,31,'canon','psalms',121,7,'free',
     E'*Yahuah (LORD) shall preserve thee from all evil: he shall preserve thy soul. Yahuah (LORD) shall preserve thy going out and thy coming in from this time forth, and even for evermore.* (Psalm 121:7-8). The answered fast is the song of ascents made history — *he delivered us from the hand of the enemy, and of such as lay in wait by the way* (Ezra 8:31); Yahuah preserved their going out and their coming in.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s315_ezra08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s315_ezra08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- C. cross_reference_threads
-- ============================================================
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-8-the-fast-at-ahava-seek-him-trust-not-in-the-kings-soldiers',
       E'Ezra 8: The Fast at Ahava — Seek Him, Trust Not in the King''s Soldiers',
       E'At the river Ahava, before the company goes up, Ezra proclaims a fast: *Then I proclaimed a fast there, at the river of Ahava, that we might afflict ourselves before our Elohim (God), to seek of him a right way for us, and for our little ones, and for all our substance* (Ezra 8:21). The fast is one of dependence, and Ezra names exactly why: *For I was ashamed to require of the king a band of soldiers and horsemen to help us against the enemy in the way: because we had spoken unto the king, saying, The hand of our Elohim (God) is upon all them for good that seek him; but his power and his wrath is against all them that forsake him* (Ezra 8:22). The seek/forsake law he confesses before the king is the covenant principle spoken to Asa: *if ye seek him, he will be found of you; but if ye forsake him, he will forsake you* (2 Chronicles 15:2). To trust the king''s horsemen would be the very thing Isaiah pronounces woe upon — *Woe to them that... trust in chariots... but they look not unto the Holy One of Yashar''el (Israel), neither seek Yahuah (LORD)!* (Isaiah 31:1). Instead Ezra leans on the One whose eye guards the seeking: *Behold, the eye of Yahuah (LORD) is upon them that fear him, upon them that hope in his mercy; To deliver their soul from death* (Psalm 33:18-19); *The righteous cry, and Yahuah (LORD) heareth, and delivereth them out of all their troubles* (Psalm 34:17). This is Proverbs lived out — *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding. In all thy ways acknowledge him, and he shall direct thy paths* (Proverbs 3:5-6) — and it is the Master''s order of priority: *seek ye first the kingdom of Elohim (God)... and all these things shall be added unto you* (Matthew 6:33). The answer comes: *So we fasted and besought our Elohim (God) for this: and he was intreated of us* (Ezra 8:23). And the apostle names the inheritance of all who seek so: *all things work together for good to them that love Elohim (God), to them who are the called according to his purpose* (Romans 8:28).',
       sv.verse_id, ev.verse_id, 'free', 31975
  FROM _s315_ezra08_lookup sv, _s315_ezra08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=8 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=8 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-8-ye-are-holy-the-vessels-are-holy-watch-ye-and-keep-them',
       E'Ezra 8: Ye Are Holy, the Vessels Are Holy — Watch Ye, and Keep Them',
       E'Ezra weighs out the silver, the gold, and the vessels — *the offering of the house of our Elohim (God)* — to twelve of the chief priests, and lays on them a charge of consecrated stewardship: *Ye are holy unto Yahuah (LORD); the vessels are holy also; and the silver and the gold are a freewill offering unto Yahuah Elohim (the LORD God) of your fathers. Watch ye, and keep them, until ye weigh them before the chief of the priests and the Levites... at Jerusalem* (Ezra 8:28-29). The men and the things are set apart by the Torah of the consecrated: *that they separate themselves from the holy things of the children of Yashar''el (Israel), and that they profane not my holy name in those things which they hallow unto me: I am Yahuah (LORD)* (Leviticus 22:2). And the holy vessels are borne under solemn guard — *they shall not touch any holy thing, lest they die. These things are the burden of the sons of Kohath* (Numbers 4:15). Ezra''s *Watch ye, and keep them* is the same trust that the apostolic word names: *it is required in stewards, that a man be found faithful* (1 Corinthians 4:2), and *That good thing which was committed unto thee keep by the Ruach HaKodesh (Holy Spirit) which dwelleth in us* (2 Timothy 1:14). The holy thing entrusted must be weighed out and weighed in, faithfully kept by those to whom it is committed.',
       sv.verse_id, ev.verse_id, 'free', 31976
  FROM _s315_ezra08_lookup sv, _s315_ezra08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=8 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=8 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-8-the-hand-of-our-elohim-was-upon-us-he-delivered-us-by-the-way',
       E'Ezra 8: The Hand of Our Elohim Was Upon Us — He Delivered Us by the Way',
       E'The fast is answered in the journey itself: *Then we departed from the river of Ahava on the twelfth day of the first month, to go unto Jerusalem: and the hand of our Elohim (God) was upon us, and he delivered us from the hand of the enemy, and of such as lay in wait by the way* (Ezra 8:31). The good hand that Ezra had confessed before the king now keeps the company on the road — the very hand announced over the going up: *according to the good hand of his Elohim (God) upon him* (Ezra 7:9). The safe passage is the song of ascents made history: *Yahuah (LORD) shall preserve thee from all evil: he shall preserve thy soul. Yahuah (LORD) shall preserve thy going out and thy coming in from this time forth, and even for evermore* (Psalm 121:7-8). They sought him, were ashamed to lean on horsemen, and the hand of Yahuah preserved their going out and their coming in.',
       sv.verse_id, ev.verse_id, 'free', 31977
  FROM _s315_ezra08_lookup sv, _s315_ezra08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=8 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=8 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- D. cross_reference_thread_members
-- ============================================================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Chronicles 15:2 — *if ye seek him, he will be found of you; but if ye forsake him, he will forsake you* — the seek/forsake principle Ezra confesses to the king (8:22).'
  FROM cross_reference_threads t
  JOIN _s315_ezra08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s315_ezra08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=15 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-8-the-fast-at-ahava-seek-him-trust-not-in-the-kings-soldiers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 33:18-19 — *the eye of Yahuah (LORD) is upon them that fear him... To deliver their soul from death* — not the horse but the eye of Yahuah keeps the seeking (8:21).'
  FROM cross_reference_threads t
  JOIN _s315_ezra08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=8 AND sv.verse_number=21
  JOIN _s315_ezra08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-8-the-fast-at-ahava-seek-him-trust-not-in-the-kings-soldiers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 34:15,17 — *The righteous cry, and Yahuah (LORD) heareth, and delivereth them* — the answered cry of the fast (8:23, *he was intreated of us*).'
  FROM cross_reference_threads t
  JOIN _s315_ezra08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=8 AND sv.verse_number=23
  JOIN _s315_ezra08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-8-the-fast-at-ahava-seek-him-trust-not-in-the-kings-soldiers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Isaiah 31:1 — *Woe to them that... trust in chariots... but they look not unto the Holy One of Yashar''el (Israel)* — the woe Ezra refuses by being ashamed to require the king''s horsemen (8:22).'
  FROM cross_reference_threads t
  JOIN _s315_ezra08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s315_ezra08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=31 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-8-the-fast-at-ahava-seek-him-trust-not-in-the-kings-soldiers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Proverbs 3:5-6 — *Trust in Yahuah (LORD)... lean not unto thine own understanding... he shall direct thy paths* — the fast that seeks *a right way for us* lived out (8:21).'
  FROM cross_reference_threads t
  JOIN _s315_ezra08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=8 AND sv.verse_number=21
  JOIN _s315_ezra08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-8-the-fast-at-ahava-seek-him-trust-not-in-the-kings-soldiers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Romans 8:28 — *all things work together for good to them that love Elohim (God)... the called according to his purpose* — the apostle''s flowering of Ezra''s *for good that seek him* (8:22).'
  FROM cross_reference_threads t
  JOIN _s315_ezra08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s315_ezra08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-8-the-fast-at-ahava-seek-him-trust-not-in-the-kings-soldiers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Matthew 6:33 — *seek ye first the kingdom of Elohim (God)... and all these things shall be added* — the order Ezra keeps, fasting before he goes up (8:21).'
  FROM cross_reference_threads t
  JOIN _s315_ezra08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=8 AND sv.verse_number=21
  JOIN _s315_ezra08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-8-the-fast-at-ahava-seek-him-trust-not-in-the-kings-soldiers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 22:2 — *separate themselves from the holy things... that they profane not my holy name* — the Torah of the consecrated behind *Ye are holy... the vessels are holy also* (8:28).'
  FROM cross_reference_threads t
  JOIN _s315_ezra08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=8 AND sv.verse_number=28
  JOIN _s315_ezra08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=22 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-8-ye-are-holy-the-vessels-are-holy-watch-ye-and-keep-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Numbers 4:15 — *they shall not touch any holy thing, lest they die... the burden of the sons of Kohath* — the holy vessels borne under guard, the charge behind *Watch ye, and keep them* (8:29).'
  FROM cross_reference_threads t
  JOIN _s315_ezra08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=8 AND sv.verse_number=29
  JOIN _s315_ezra08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=4 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-8-ye-are-holy-the-vessels-are-holy-watch-ye-and-keep-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Corinthians 4:2 — *it is required in stewards, that a man be found faithful* — the faithful keeping required of those entrusted, Ezra''s *Watch ye, and keep them* (8:29).'
  FROM cross_reference_threads t
  JOIN _s315_ezra08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=8 AND sv.verse_number=29
  JOIN _s315_ezra08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-8-ye-are-holy-the-vessels-are-holy-watch-ye-and-keep-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Timothy 1:14 — *That good thing which was committed unto thee keep* — the deposit guarded, the holy vessels committed to the priests to keep (8:28).'
  FROM cross_reference_threads t
  JOIN _s315_ezra08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=8 AND sv.verse_number=28
  JOIN _s315_ezra08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-8-ye-are-holy-the-vessels-are-holy-watch-ye-and-keep-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Ezra 7:9 — *according to the good hand of his Elohim (God) upon him* — the good hand announced over the going up, now answered in deed (8:31).'
  FROM cross_reference_threads t
  JOIN _s315_ezra08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=8 AND sv.verse_number=31
  JOIN _s315_ezra08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-8-the-hand-of-our-elohim-was-upon-us-he-delivered-us-by-the-way'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 121:7-8 — *Yahuah (LORD) shall preserve thy going out and thy coming in* — the song of ascents made history in the safe journey (8:31).'
  FROM cross_reference_threads t
  JOIN _s315_ezra08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=8 AND sv.verse_number=31
  JOIN _s315_ezra08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=121 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-8-the-hand-of-our-elohim-was-upon-us-he-delivered-us-by-the-way'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezra_9.sql (Ezra 9) -----
-- Book: Ezra  Chapter: 9  Tag: ezra09  Session prefix: s315
-- Sort band: 32000 (+1 per thread)  Source book_slug: ezra (edition canon)
-- View: _s315_ezra09_lookup
--
-- CHAPTER: the mixed-marriage crisis (vv.1-4), Ezra's prayer of confession
-- (vv.5-15), the grace-preserved remnant.
--
-- ⚠ MIXED-MARRIAGE FRAMING (per Yoshi's covenant-fidelity guard):
--   The danger threaded is NOT ethnic/racial purity — it is COVENANT FIDELITY.
--   The text itself names the problem: the peoples' "abominations" (v.1, idolatry)
--   and the "holy seed" mingling so the heart is turned to OTHER GODS. The Torah it
--   rests on (Deut 7:3-4, Exod 34:15-16) explicitly grounds the marriage prohibition
--   in being turned to serve other gods / go a whoring after their gods — NOT in
--   bloodline as such. So thread v.1-2 as the anti-idolatry / heart-turned-away guard.
--   I noted the deliberate CONTRAST in the prose: foreign-origin women ARE absorbed
--   into the seed of promise THROUGH covenant marriage when they cleave to Yahuah
--   (Rahab the Canaanite, Ruth the Moabite, both in the Messianic line, Matthew 1:5);
--   Ezra's crisis is the UNCONVERTED idolatrous alliance that brings the abominations
--   in. No reading endorses ethnic hatred (victims, not enemies).
--
-- Ezra 9 coverage:
--   v.1-2  (holy seed not separated / abominations)
--          NT:     Matthew 1:5 (Rahab/Ruth absorbed by covenant — the deliberate contrast)
--          Extras: none warranted (clean canon witnesses carry it)
--          Tanakh: Deuteronomy 7:3-4 (marriages forbidden lest heart turn to other gods);
--                  Exodus 34:15-16 (daughters → whoring after their gods)
--   v.3-4  (rent garment, trembled at the words) — folded into the confession thread anchors; no separate add
--   v.5-7  (Ezra's confession — iniquities grown up unto the heavens)
--          NT:     1 John 1:9 (if we confess our sins, he is faithful and just)
--          Extras: none warranted
--          Tanakh: Daniel 9:5-6 (we have sinned... neither hearkened to thy prophets);
--                  Leviticus 26:40 (if they shall confess their iniquity, and the iniquity of their fathers);
--                  Nehemiah 9:33 (thou art just... we have done wickedly)
--   v.8-9  (grace hath left us a remnant to escape)
--          NT:     Romans 11:5 (a remnant according to the election of grace)
--          Extras: none warranted
--          Tanakh: Leviticus 26:44-45 (I will not cast them away... remember the covenant)
--   v.10-12 (we have forsaken thy commandments / the Torah ground) — woven into confession + crisis threads
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Deuteronomy 7:3 (the very command quoted back); Leviticus 26:40 (confession)
--   v.13-15 (thou art righteous; we cannot stand before thee)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Daniel 9:7 / 9:14 (righteousness belongeth unto thee; Yahuah is righteous);
--                  Nehemiah 9:33 (thou art just in all that is brought upon us);
--                  Lamentations 3:22 (it is of mercies that we are not consumed — the remnant of mercy)
--
-- THREADS (4):
--   ezra-9-the-holy-seed-mingled-the-covenant-fidelity-guard   [free]  Tanakh + NT
--       members: Deut 7:3, Deut 7:4, Exod 34:15, Exod 34:16, Matthew 1:5
--   ezra-9-grace-hath-left-us-a-remnant-to-escape              [free]  Tanakh + NT
--       members: Lev 26:44, Lev 26:45, Romans 11:5
--   ezra-9-our-iniquities-grown-up-unto-the-heavens-confession [free]  Tanakh + NT
--       members: Dan 9:5, Dan 9:6, Lev 26:40, Neh 9:33, 1 John 1:9
--   ezra-9-thou-art-righteous-we-cannot-stand-before-thee      [free]  Tanakh + NT
--       members: Dan 9:7, Dan 9:14, Neh 9:33, Lam 3:22
--
-- All members canon → every thread tier_required 'free'. tier BEFORE note in VALUES.
-- Member INSERTs use STANDARD form with explicit literal source verse. NO compact AS m(...) form.

CREATE TEMP VIEW _s315_ezra09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the holy seed mingled — covenant-fidelity / anti-idolatry guard (vv.1-2)
    ('canon','ezra',9,2,'canon','deuteronomy',7,3,'free',
     E'*Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* (Deuteronomy 7:3). The princes report that *the holy seed have mingled themselves with the people of those lands* (Ezra 9:2) — and the very Torah that Ezra is grieving over is this word. The prohibition is the covenant-fidelity guard, quoted back almost verbatim in Ezra 9:12.'),
    ('canon','ezra',9,1,'canon','deuteronomy',7,4,'free',
     E'*For they will turn away thy son from following me, that they may serve other gods: so will the anger of Yahuah (LORD) be kindled against you, and destroy thee suddenly.* (Deuteronomy 7:4). Here is WHY the marriage is forbidden — not blood, but the heart turned to OTHER GODS. Ezra names the same danger: the peoples have not been separated, *doing according to their abominations* (Ezra 9:1) — the idolatry that would absorb the holy seed into the worship of the lands.'),
    ('canon','ezra',9,1,'canon','exodus',34,15,'free',
     E'*Lest thou make a covenant with the inhabitants of the land, and they go a whoring after their gods, and do sacrifice unto their gods, and one call thee, and thou eat of his sacrifice* (Exodus 34:15). The covenant at Sinai already framed the danger as spiritual whoredom, not ethnicity. Ezra finds the people *doing according to their abominations* (Ezra 9:1) — the alliance that drags the seed into the sacrifices of other gods.'),
    ('canon','ezra',9,2,'canon','exodus',34,16,'free',
     E'*And thou take of their daughters unto thy sons, and their daughters go a whoring after their gods, and make thy sons go a whoring after their gods.* (Exodus 34:16). The peril is precisely that named in Ezra 9:2 — *they have taken of their daughters for themselves, and for their sons* — the unconverted idolatrous wife who turns the son away. The contrast stands by it: where a foreign-born woman CLEAVES to Yahuah''s covenant she is absorbed into the seed of promise, not banned by blood.'),
    ('canon','ezra',9,2,'canon','matthew',1,5,'free',
     E'*And Salmon begat Booz of Rachab; and Booz begat Obed of Ruth; and Obed begat Jesse* (Matthew 1:5). The deliberate contrast to Ezra 9:2: Rahab the Canaanite and Ruth the Moabite — two foreign-born women — stand IN the line of Messiah, absorbed into the *holy seed* because each cleaved to Yahuah and his covenant. Ezra''s crisis is the opposite: the UNCONVERTED idolatrous marriage that brings the abominations of the lands in. The guard is fidelity to the covenant, never race.'),

    -- THREAD 2: grace hath left us a remnant to escape (vv.8-9)
    ('canon','ezra',9,8,'canon','leviticus',26,44,'free',
     E'*And yet for all that, when they be in the land of their enemies, I will not cast them away, neither will I abhor them, to destroy them utterly, and to break my covenant with them: for I am Yahuah (LORD) their Elohim (God).* (Leviticus 26:44). The promise behind Ezra''s words: *now for a little space grace hath been shewed from Yahuah Eloheinu (the LORD our God), to leave us a remnant to escape* (Ezra 9:8). The covenant kept the people alive in exile exactly as Sinai foretold — the remnant is the proof Yahuah did not utterly cast them away.'),
    ('canon','ezra',9,9,'canon','leviticus',26,45,'free',
     E'*But I will for their sakes remember the covenant of their ancestors, whom I brought forth out of the land of Egypt in the sight of the heathen, that I might be their Elohim (God): I am Yahuah (LORD).* (Leviticus 26:45). Ezra confesses the same remembered covenant: *we were bondmen; yet our Elohim (God) hath not forsaken us in our bondage, but hath extended mercy unto us* (Ezra 9:9). The reviving and the restored house are the covenant of the ancestors remembered, not merit earned.'),
    ('canon','ezra',9,8,'canon','romans',11,5,'free',
     E'*Even so then at this present time also there is a remnant according to the election of grace.* (Romans 11:5). The same remnant-theology Ezra voices is the one Paul reaches back to: *grace hath been shewed from Yahuah Eloheinu... to leave us a remnant to escape* (Ezra 9:8). Both name a remnant left not by works but by election of grace — the preserved seed of Yashar''el (Israel), never a replaced people.'),

    -- THREAD 3: our iniquities grown up unto the heavens — the confession (vv.5-7,10)
    ('canon','ezra',9,6,'canon','daniel',9,5,'free',
     E'*We have sinned, and have committed iniquity, and have done wickedly, and have rebelled, even by departing from thy precepts and from thy judgments* (Daniel 9:5). Daniel''s confession is the twin of Ezra''s — both men confess the people''s sin as their own. Ezra: *I am ashamed and blush to lift up my face to thee, my Elohim (God): for our iniquities are increased over our head* (Ezra 9:6). Identificational repentance, the priest weeping among the guilty.'),
    ('canon','ezra',9,7,'canon','daniel',9,6,'free',
     E'*Neither have we hearkened unto thy servants the prophets, which spake in thy name to our kings, our princes, and our fathers, and to all the people of the land.* (Daniel 9:6). Ezra reaches back the same span of generations: *Since the days of our fathers have we been in a great trespass unto this day; and for our iniquities have we, our kings, and our priests, been delivered into the hand of the kings of the lands* (Ezra 9:7). Both confessions own the whole inheritance of covenant-breaking.'),
    ('canon','ezra',9,6,'canon','leviticus',26,40,'free',
     E'*If they shall confess their iniquity, and the iniquity of their fathers, with their trespass which they trespassed against me, and that also they have walked contrary unto me* (Leviticus 26:40). This is the Torah ground of the confession itself — Sinai prescribed it as the door of return. Ezra does exactly this: *for our iniquities are increased over our head, and our trespass is grown up unto the heavens* (Ezra 9:6), confessing his own sin and the iniquity of the fathers.'),
    ('canon','ezra',9,7,'canon','nehemiah',9,33,'free',
     E'*Howbeit thou art just in all that is brought upon us; for thou hast done right, but we have done wickedly* (Nehemiah 9:33). The Levites'' confession in the same era frames Ezra''s words: the delivering into the hand of the kings of the lands *for our iniquities* (Ezra 9:7) is owned as righteous judgment — Yahuah just, the people wicked.'),
    ('canon','ezra',9,6,'canon','1-john',1,9,'free',
     E'*If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.* (1 John 1:9). The confession Ezra pours out — *I am ashamed and blush... for our iniquities are increased over our head* (Ezra 9:6) — is the very contrite turning the apostle later names as the way of cleansing. The faithful-and-just God who forgives the confessing heart is one across the library.'),

    -- THREAD 4: thou art righteous, we cannot stand before thee (vv.13-15)
    ('canon','ezra',9,15,'canon','daniel',9,7,'free',
     E'*O Yahuah (Lord), righteousness belongeth unto thee, but unto us confusion of faces, as at this day* (Daniel 9:7). Ezra ends his prayer on the identical confession of Yahuah''s righteousness: *O Yahuah Elohim (LORD God) of Yashar''el (Israel), thou art righteous: for we remain yet escaped... behold, we are before thee in our trespasses* (Ezra 9:15). The justified God, the guilty people who can only stand on mercy.'),
    ('canon','ezra',9,13,'canon','daniel',9,14,'free',
     E'*Therefore hath Yahuah (LORD) watched upon the evil, and brought it upon us: for Yahuah Eloheinu (the LORD our God) is righteous in all his works which he doeth: for we obeyed not his voice.* (Daniel 9:14). Ezra owns the same — *seeing that thou our Elohim (God) hast punished us less than our iniquities deserve* (Ezra 9:13). The judgment is confessed as less than deserved; Yahuah is righteous in all his works.'),
    ('canon','ezra',9,15,'canon','nehemiah',9,33,'free',
     E'*Howbeit thou art just in all that is brought upon us; for thou hast done right, but we have done wickedly* (Nehemiah 9:33). The Levites'' word and Ezra''s word are one confession: *thou art righteous... we are before thee in our trespasses: for we cannot stand before thee because of this* (Ezra 9:15). Yahuah just, the people unable to stand except by grace already shewn.'),
    ('canon','ezra',9,15,'canon','lamentations',3,22,'free',
     E'*It is of the LORD’S mercies that we are not consumed, because his compassions fail not.* (Lamentations 3:22). The very thing Ezra marvels at — *we remain yet escaped, as it is this day* (Ezra 9:15) — is the remnant of mercy Jeremiah sang from the ashes. That the guilty are not consumed is itself the mercy; the remnant survives only because his compassions fail not.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s315_ezra09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s315_ezra09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-9-the-holy-seed-mingled-the-covenant-fidelity-guard',
  E'The Holy Seed Mingled — the Covenant-Fidelity Guard',
  E'The princes report the crisis: *The people of Yashar''el (Israel), and the priests, and the Levites, have not separated themselves from the people of the lands, doing according to their abominations* (Ezra 9:1), *so that the holy seed have mingled themselves with the people of those lands* (Ezra 9:2). The danger is not blood but the heart turned away — the Torah Ezra grieves over says so plainly. *Neither shalt thou make marriages with them... For they will turn away thy son from following me, that they may serve other gods* (Deuteronomy 7:3-4). At Sinai the covenant framed it as spiritual whoredom: *lest... they go a whoring after their gods... And thou take of their daughters unto thy sons, and their daughters go a whoring after their gods* (Exodus 34:15-16). The peril is the UNCONVERTED idolatrous alliance that drags the seed into the worship of the lands. The contrast stands beside it and proves the point: *And Salmon begat Booz of Rachab; and Booz begat Obed of Ruth* (Matthew 1:5) — Rahab the Canaanite and Ruth the Moabite stand in the line of Messiah, absorbed into the holy seed because each cleaved to Yahuah and his covenant. The guard is fidelity, never race.',
  sv.verse_id, ev.verse_id, 'free', 32000
  FROM _s315_ezra09_lookup sv, _s315_ezra09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=9 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-9-grace-hath-left-us-a-remnant-to-escape',
  E'Grace Hath Left Us a Remnant to Escape',
  E'In the midst of the confession a window of mercy opens: *And now for a little space grace hath been shewed from Yahuah Eloheinu (the LORD our God), to leave us a remnant to escape, and to give us a nail in his holy place* (Ezra 9:8). *For we were bondmen; yet our Elohim (God) hath not forsaken us in our bondage, but hath extended mercy unto us* (Ezra 9:9). This is the covenant of Sinai keeping its word in exile: *I will not cast them away, neither will I abhor them, to destroy them utterly, and to break my covenant with them: for I am Yahuah (LORD) their Elohim (God)... I will for their sakes remember the covenant of their ancestors* (Leviticus 26:44-45). The remnant is not a wage earned but the seed preserved by grace — the very theology Paul reaches back to: *Even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5). One preserved remnant of Yashar''el (Israel) across the whole library, never a replaced people.',
  sv.verse_id, ev.verse_id, 'free', 32001
  FROM _s315_ezra09_lookup sv, _s315_ezra09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-9-our-iniquities-grown-up-unto-the-heavens-confession',
  E'Our Iniquities Grown Up Unto the Heavens — Ezra''s Confession',
  E'Ezra falls on his knees at the evening sacrifice and prays the great identificational confession, owning the people''s sin as his own: *O my Elohim (God), I am ashamed and blush to lift up my face to thee, my Elohim (God): for our iniquities are increased over our head, and our trespass is grown up unto the heavens* (Ezra 9:6). *Since the days of our fathers have we been in a great trespass unto this day* (Ezra 9:7). This is the very prayer Sinai prescribed as the door of return: *If they shall confess their iniquity, and the iniquity of their fathers, with their trespass which they trespassed against me* (Leviticus 26:40). It is the twin of Daniel''s confession in the same exile: *We have sinned, and have committed iniquity... neither have we hearkened unto thy servants the prophets* (Daniel 9:5-6), and of the Levites'': *thou art just in all that is brought upon us; for thou hast done right, but we have done wickedly* (Nehemiah 9:33). The contrite turning that finds mercy is one across the library: *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness* (1 John 1:9).',
  sv.verse_id, ev.verse_id, 'free', 32002
  FROM _s315_ezra09_lookup sv, _s315_ezra09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-9-thou-art-righteous-we-cannot-stand-before-thee',
  E'Thou Art Righteous — We Cannot Stand Before Thee',
  E'Ezra ends where every true confession ends: justifying Yahuah, condemning self. *And after all that is come upon us for our evil deeds, and for our great trespass, seeing that thou our Elohim (God) hast punished us less than our iniquities deserve* (Ezra 9:13) — the judgment owned as less than deserved. *O Yahuah Elohim (LORD God) of Yashar''el (Israel), thou art righteous: for we remain yet escaped, as it is this day: behold, we are before thee in our trespasses: for we cannot stand before thee because of this* (Ezra 9:15). It is the identical resolution of Daniel''s prayer — *O Yahuah (Lord), righteousness belongeth unto thee, but unto us confusion of faces* (Daniel 9:7); *Yahuah Eloheinu (the LORD our God) is righteous in all his works which he doeth* (Daniel 9:14) — and of the Levites'': *thou art just in all that is brought upon us* (Nehemiah 9:33). And the marvel that the guilty are not consumed is the remnant of mercy Jeremiah sang from the ashes: *It is of the LORD’S mercies that we are not consumed, because his compassions fail not* (Lamentations 3:22).',
  sv.verse_id, ev.verse_id, 'free', 32003
  FROM _s315_ezra09_lookup sv, _s315_ezra09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=9 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Neither shalt thou make marriages with them* (Deuteronomy 7:3) — the Torah command Ezra grieves over, quoted back in Ezra 9:12.'
  FROM cross_reference_threads t
  JOIN _s315_ezra09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=2
  JOIN _s315_ezra09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-9-the-holy-seed-mingled-the-covenant-fidelity-guard'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*For they will turn away thy son from following me, that they may serve other gods* (Deuteronomy 7:4) — the WHY: the heart turned to idolatry, not blood.'
  FROM cross_reference_threads t
  JOIN _s315_ezra09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s315_ezra09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-9-the-holy-seed-mingled-the-covenant-fidelity-guard'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Lest... they go a whoring after their gods* (Exodus 34:15) — Sinai framed it as spiritual whoredom; *doing according to their abominations* (Ezra 9:1).'
  FROM cross_reference_threads t
  JOIN _s315_ezra09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s315_ezra09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-9-the-holy-seed-mingled-the-covenant-fidelity-guard'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*And thou take of their daughters unto thy sons, and their daughters go a whoring after their gods* (Exodus 34:16) — the exact peril of Ezra 9:2.'
  FROM cross_reference_threads t
  JOIN _s315_ezra09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=2
  JOIN _s315_ezra09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-9-the-holy-seed-mingled-the-covenant-fidelity-guard'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*And Salmon begat Booz of Rachab; and Booz begat Obed of Ruth* (Matthew 1:5) — the contrast: foreign-born women cleaving to Yahuah are absorbed into the holy seed.'
  FROM cross_reference_threads t
  JOIN _s315_ezra09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=2
  JOIN _s315_ezra09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-9-the-holy-seed-mingled-the-covenant-fidelity-guard'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will not cast them away... neither will I... break my covenant with them* (Leviticus 26:44) — the covenant that left the remnant alive in exile.'
  FROM cross_reference_threads t
  JOIN _s315_ezra09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=8
  JOIN _s315_ezra09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-9-grace-hath-left-us-a-remnant-to-escape'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will for their sakes remember the covenant of their ancestors* (Leviticus 26:45) — the remembered covenant Ezra confesses in 9:9.'
  FROM cross_reference_threads t
  JOIN _s315_ezra09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s315_ezra09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-9-grace-hath-left-us-a-remnant-to-escape'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*a remnant according to the election of grace* (Romans 11:5) — Paul''s reach back to the same remnant-theology Ezra voices.'
  FROM cross_reference_threads t
  JOIN _s315_ezra09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=8
  JOIN _s315_ezra09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-9-grace-hath-left-us-a-remnant-to-escape'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*We have sinned, and have committed iniquity, and have done wickedly, and have rebelled* (Daniel 9:5) — the twin confession in the same exile.'
  FROM cross_reference_threads t
  JOIN _s315_ezra09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s315_ezra09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-9-our-iniquities-grown-up-unto-the-heavens-confession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Neither have we hearkened unto thy servants the prophets* (Daniel 9:6) — owning the fathers'' sin, as Ezra in 9:7.'
  FROM cross_reference_threads t
  JOIN _s315_ezra09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s315_ezra09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-9-our-iniquities-grown-up-unto-the-heavens-confession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*If they shall confess their iniquity, and the iniquity of their fathers* (Leviticus 26:40) — the Torah ground of the confession itself.'
  FROM cross_reference_threads t
  JOIN _s315_ezra09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s315_ezra09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-9-our-iniquities-grown-up-unto-the-heavens-confession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*thou art just in all that is brought upon us... but we have done wickedly* (Nehemiah 9:33) — the Levites'' confession of the same era.'
  FROM cross_reference_threads t
  JOIN _s315_ezra09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s315_ezra09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-9-our-iniquities-grown-up-unto-the-heavens-confession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*If we confess our sins, he is faithful and just to forgive us our sins* (1 John 1:9) — the contrite turning that finds mercy, one across the library.'
  FROM cross_reference_threads t
  JOIN _s315_ezra09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s315_ezra09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-9-our-iniquities-grown-up-unto-the-heavens-confession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*righteousness belongeth unto thee, but unto us confusion of faces* (Daniel 9:7) — Daniel''s prayer resolves exactly where Ezra''s does.'
  FROM cross_reference_threads t
  JOIN _s315_ezra09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=15
  JOIN _s315_ezra09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-9-thou-art-righteous-we-cannot-stand-before-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah Eloheinu (the LORD our God) is righteous in all his works which he doeth* (Daniel 9:14) — judgment owned as deserved, as Ezra in 9:13.'
  FROM cross_reference_threads t
  JOIN _s315_ezra09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=13
  JOIN _s315_ezra09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-9-thou-art-righteous-we-cannot-stand-before-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*thou art just in all that is brought upon us* (Nehemiah 9:33) — the Levites'' word, one confession with Ezra 9:15.'
  FROM cross_reference_threads t
  JOIN _s315_ezra09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=15
  JOIN _s315_ezra09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-9-thou-art-righteous-we-cannot-stand-before-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*It is of the LORD’S mercies that we are not consumed* (Lamentations 3:22) — the remnant of mercy: the guilty not consumed is itself the mercy of Ezra 9:15.'
  FROM cross_reference_threads t
  JOIN _s315_ezra09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=9 AND sv.verse_number=15
  JOIN _s315_ezra09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-9-thou-art-righteous-we-cannot-stand-before-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezra_10.sql (Ezra 10) -----
-- Book: Ezra, chapter 10 (the covenant of repentance, the putting-away of the strange wives)
-- Tag: ezra10 | session prefix: s315 | temp view: _s315_ezra10_lookup
-- Slug prefix: ezra-10-... | sort_order band start: 32025 (+1 per thread)
-- Source: canon ezra ch10. Member form: STANDARD with explicit literal source verse (sv.chapter_number=10 AND sv.verse_number=<v>). NO compact AS m(...) form.
--
-- FRAMING NOTE (the GUARD): the "strange wives" crisis is read as COVENANT-FIDELITY, NOT ethnic/racial purity.
--   The danger named by Torah is idolatry — foreign IDOLATROUS alliances that "turn away thy son from following me,
--   that they may serve other gods" (Deuteronomy 7:4); the concern is the GODS, not the blood. Yoshi's framework:
--   foreign-origin women who CLEAVE to Yahuah's covenant ARE absorbed into the seed (Rahab, Ruth — Messianic line),
--   so the "putting away" is the radical repentance/separation from the unconverted idolatry-bringing alliances,
--   the same heart as the covenant-renewal reforms (2 Chronicles 34:31). The redemptive spine is the HOPE in
--   Yashar'el even after great trespass, and the COVENANT to turn — "godly sorrow worketh repentance to salvation"
--   (2 Corinthians 7:10). Victims, not enemies: no warrant for racism, no breaking of covenant-marriages where the
--   wife has joined herself to Yahuah.
--
-- Ezra 10 coverage:
--   v.1-4  (Ezra weeps, the congregation gathers, Shechaniah: "yet now there is hope in Yashar'el... let us make a
--           covenant... be of good courage, and do it")
--          NT:     2 Corinthians 7:10 (godly sorrow worketh repentance to salvation); James 4:8-10 (draw nigh / cleanse / be afflicted, mourn / humble yourselves)
--          Extras: none warranted
--          Tanakh: 2 Chronicles 34:31 (the covenant before Yahuah); Joel 2:12-13 (turn with all your heart / rend your heart); Hosea 14:1-2 (O Yashar'el, return... take with you words)
--   v.11   (Ezra: "make confession unto Yahuah Elohim... and separate yourselves from the people of the land, and from the strange wives")
--          NT:     none warranted (confession/separation woven into the repentance thread)
--          Extras: none warranted
--          Tanakh: Deuteronomy 7:3-4 (make no marriages with them... they will turn away thy son... to serve other gods); Exodus 34:16 (their daughters go a whoring after their gods, and make thy sons go a whoring)
--   v.5-10,12-17 (oath, proclamation, gathering in the great rain, examination) — Tanakh/NT/Extras: none warranted (procedural; carried by the two threads above)
--   v.18-44 (the list of those who had taken strange wives and put them away) — none warranted (genealogical roll; the repentance is the substance, threaded at v.1-4/v.11)
--
-- THREADS:
--   ezra-10-yet-now-there-is-hope-the-covenant-to-turn  (free) — 10:2-4 → 2 Chr 34:31, Joel 2:12, Joel 2:13, Hosea 14:1, Hosea 14:2, 2 Cor 7:10, James 4:8, James 4:9, James 4:10
--   ezra-10-make-confession-and-separate-from-the-idolatry  (free) — 10:11 → Deut 7:3, Deut 7:4, Exod 34:16

CREATE TEMP VIEW _s315_ezra10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the hope, the covenant to turn (10:2-4)
    ('canon','ezra',10,2,'canon','2-chronicles',34,31,'free',
     E'*And the king stood in his place, and made a covenant before Yahuah (LORD), to walk after Yahuah (LORD), and to keep his commandments, and his testimonies, and his statutes, with all his heart, and with all his soul, to perform the words of the covenant which are written in this book.* (2 Chronicles 34:31) Shechaniah''s counsel — *let us make a covenant with our Elohim (God)... and let it be done according to the law* (Ezra 10:3) — is the same covenant-renewal heart as Josiah''s: not a new law, but turning back to the Torah already given, *according to the law*.'),
    ('canon','ezra',10,2,'canon','joel',2,12,'free',
     E'*Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* (Joel 2:12) The great congregation that *wept very sore* (Ezra 10:1) is doing exactly what Yahuah calls for through Joel — the whole-hearted turning, with weeping, that is the door of *hope in Yashar''el (Israel)* (Ezra 10:2).'),
    ('canon','ezra',10,2,'canon','joel',2,13,'free',
     E'*And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil.* (Joel 2:13) The *hope in Yashar''el (Israel) concerning this thing* (Ezra 10:2) rests on this: the One they turn to is *gracious and merciful* — repentance meets a Father who relents, which is why there is hope even after great trespass.'),
    ('canon','ezra',10,2,'canon','hosea',14,1,'free',
     E'*O Yashar''el (Israel), return unto Yahuah Elohayka (the LORD thy God); for thou hast fallen by thine iniquity.* (Hosea 14:1) Hosea''s call to the scattered house — *return* — is answered in miniature here: having *fallen by thine iniquity*, the congregation rises to turn back, the very pattern of the two-house regathering through repentance.'),
    ('canon','ezra',10,2,'canon','hosea',14,2,'free',
     E'*Take with you words, and turn to Yahuah (LORD): say unto him, Take away all iniquity, and receive us graciously: so will we render the calves of our lips.* (Hosea 14:2) Shechaniah brings the very words Hosea commands — *we have trespassed against our Elohim (God)... yet now there is hope* (Ezra 10:2) — confession-words carried back to Yahuah, who *receive[s] us graciously*.'),
    ('canon','ezra',10,2,'canon','2-corinthians',7,10,'free',
     E'*For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death.* (2 Corinthians 7:10) The weeping of Ezra 10 is not the sorrow of the world but the godly sorrow that *worketh repentance to salvation* — the tears that produce the covenant *to put away all the wives... according to the law* (Ezra 10:3), genuine turning, not mere grief.'),
    ('canon','ezra',10,4,'canon','james',4,8,'free',
     E'*Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded.* (James 4:8) *Be of good courage, and do it* (Ezra 10:4) is James''s *cleanse your hands... purify your hearts* enacted — the doubleness of *strange wives* turning the heart to other gods is purged by drawing nigh and doing.'),
    ('canon','ezra',10,4,'canon','james',4,9,'free',
     E'*Be afflicted, and mourn, and weep: let your laughter be turned to mourning, and your joy to heaviness.* (James 4:9) The congregation that *wept very sore* (Ezra 10:1) is the living shape of James''s call — the mourning that precedes restoration, the heaviness that is the seedbed of the covenant *to do it* (Ezra 10:4).'),
    ('canon','ezra',10,4,'canon','james',4,10,'free',
     E'*Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up.* (James 4:10) Ezra casting himself down before the house of Elohim and the people humbled in the great rain is the humbling James names — and the *hope in Yashar''el (Israel)* (Ezra 10:2) is the promised lifting-up that follows the turning.'),
    -- Thread 2: confession + separation from the idolatry-bringing alliance (10:11)
    ('canon','ezra',10,11,'canon','deuteronomy',7,3,'free',
     E'*Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* (Deuteronomy 7:3) Ezra''s charge to *separate yourselves... from the strange wives* (Ezra 10:11) reaches back to this Torah word — the prohibition is not about blood but about the alliance Deuteronomy names in the next breath: the marriages that bring in the worship of other gods.'),
    ('canon','ezra',10,11,'canon','deuteronomy',7,4,'free',
     E'*For they will turn away thy son from following me, that they may serve other gods: so will the anger of Yahuah (LORD) be kindled against you, and destroy thee suddenly.* (Deuteronomy 7:4) Here is the heart of the matter — the danger is *they may serve other gods*, the idolatry that turns the covenant-heart away. The *strange wives* are *strange* in their gods; Rahab the Canaanite and Ruth the Moabite, who cleaved to Yahuah (*thy people shall be my people, and thy Elohim my Elohim*), were absorbed into the seed and the Messianic line. The *separation* of Ezra 10:11 is from the unconverted idolatrous alliance, not from a people by race.'),
    ('canon','ezra',10,11,'canon','exodus',34,16,'free',
     E'*And thou take of their daughters unto thy sons, and their daughters go a whoring after their gods, and make thy sons go a whoring after their gods.* (Exodus 34:16) The covenant-warning of Sinai is precise: the peril is *go a whoring after their gods* — spiritual adultery, idolatry. Ezra''s *make confession unto Yahuah Elohim (the LORD God)... and separate yourselves* (Ezra 10:11) is the turning back from that whoring, the heart restored to one Elohim.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s315_ezra10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s315_ezra10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-10-yet-now-there-is-hope-the-covenant-to-turn',
       E'Yet Now There Is Hope: The Covenant to Turn',
       E'When Ezra wept and cast himself down before the house of Elohim, *there assembled unto him out of Yashar''el (Israel) a very great congregation of men and women and children: for the people wept very sore* (Ezra 10:1). Out of that weeping Shechaniah speaks the redemptive word of the chapter: *We have trespassed against our Elohim (God), and have taken strange wives of the people of the land: yet now there is hope in Yashar''el (Israel) concerning this thing* (Ezra 10:2) — hope, even after great trespass. The remedy is a turning: *let us make a covenant with our Elohim (God) to put away all the wives... and let it be done according to the law* (Ezra 10:3), and the charge that seals it, *Arise; for this matter belongeth unto thee... be of good courage, and do it* (Ezra 10:4).\n\nThis is the same covenant-renewal heart as Josiah, who *made a covenant before Yahuah (LORD), to walk after Yahuah (LORD), and to keep his commandments... to perform the words of the covenant which are written in this book* (2 Chronicles 34:31) — not a new law, but a return to the Torah already given. It is the turning Yahuah calls for through Joel: *turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12), and *rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful* (Joel 2:13) — the hope rests on the One they turn to. Hosea hands the scattered house its very words: *O Yashar''el (Israel), return unto Yahuah Elohayka (the LORD thy God); for thou hast fallen by thine iniquity* (Hosea 14:1); *Take with you words, and turn to Yahuah (LORD)... Take away all iniquity, and receive us graciously* (Hosea 14:2).\n\nThe New Testament names the inward shape of this weeping: *For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death* (2 Corinthians 7:10) — the tears that produce the covenant *to do it*, not mere grief. And James calls the whole posture: *Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded* (James 4:8); *Be afflicted, and mourn, and weep* (James 4:9); *Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* (James 4:10). The humbling in the great rain is the seedbed of the lifting-up; the *hope in Yashar''el* is the grace that meets every genuine turning.',
       sv.verse_id, ev.verse_id, 'free', 32025
  FROM _s315_ezra10_lookup sv, _s315_ezra10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=10 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=10 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezra-10-make-confession-and-separate-from-the-idolatry',
       E'Make Confession and Separate: From the Idolatry, Not the People',
       E'Ezra stands before the assembled and gives the double charge that names the cure: *Now therefore make confession unto Yahuah Elohim (the LORD God) of your fathers, and do his pleasure: and separate yourselves from the people of the land, and from the strange wives* (Ezra 10:11) — confession with the mouth, separation with the life. To read this rightly the question must be asked: separation from *what*? The Torah it reaches back to answers plainly. *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son* (Deuteronomy 7:3) — and the very next verse gives the reason, which is not blood but gods: *For they will turn away thy son from following me, that they may serve other gods: so will the anger of Yahuah (LORD) be kindled against you* (Deuteronomy 7:4). Sinai had said the same: *thou take of their daughters unto thy sons, and their daughters go a whoring after their gods, and make thy sons go a whoring after their gods* (Exodus 34:16). The peril is spiritual adultery — *go a whoring after their gods* — the idolatry that turns the covenant-heart away.\n\nSo the *strange wives* are strange in their gods, and the *separation* is from the unconverted idolatrous alliance that brings the abominations in, the same heart as every covenant-renewal reform. It is not a warrant for ethnic hatred, and not a rule against a people by race. The proof stands in the seed-line itself: Rahab the Canaanite and Ruth the Moabite — *thy people shall be my people, and thy Elohim my Elohim* (Ruth 1:16) — cleaved to Yahuah''s covenant and were absorbed into Yashar''el and into the Messianic line. The line that turns the heart to other gods is broken; the heart that cleaves to Yahuah is gathered in. The confession and the separating are the one heart of genuine turning — *do his pleasure*, the restored worship of one Elohim.',
       sv.verse_id, ev.verse_id, 'free', 32026
  FROM _s315_ezra10_lookup sv, _s315_ezra10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=10 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='ezra' AND ev.chapter_number=10 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And the king stood in his place, and made a covenant before Yahuah (LORD)... to perform the words of the covenant which are written in this book.* (2 Chronicles 34:31) — Josiah''s covenant-renewal: the same *let us make a covenant... according to the law* (Ezra 10:3) heart, a return to Torah already given.'
  FROM cross_reference_threads t
  JOIN _s315_ezra10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=10 AND sv.verse_number=2
  JOIN _s315_ezra10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=34 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-10-yet-now-there-is-hope-the-covenant-to-turn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12) — the whole-hearted turning the weeping congregation enacts.'
  FROM cross_reference_threads t
  JOIN _s315_ezra10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=10 AND sv.verse_number=2
  JOIN _s315_ezra10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-10-yet-now-there-is-hope-the-covenant-to-turn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful* (Joel 2:13) — the ground of the *hope in Yashar''el (Israel)*: the One turned to relents.'
  FROM cross_reference_threads t
  JOIN _s315_ezra10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=10 AND sv.verse_number=2
  JOIN _s315_ezra10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-10-yet-now-there-is-hope-the-covenant-to-turn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*O Yashar''el (Israel), return unto Yahuah Elohayka (the LORD thy God); for thou hast fallen by thine iniquity.* (Hosea 14:1) — having *fallen by thine iniquity*, the call to *return*, the two-house pattern of regathering through repentance.'
  FROM cross_reference_threads t
  JOIN _s315_ezra10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=10 AND sv.verse_number=2
  JOIN _s315_ezra10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=14 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-10-yet-now-there-is-hope-the-covenant-to-turn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Take with you words, and turn to Yahuah (LORD)... Take away all iniquity, and receive us graciously* (Hosea 14:2) — the confession-words Shechaniah brings; Yahuah *receive[s] us graciously*.'
  FROM cross_reference_threads t
  JOIN _s315_ezra10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=10 AND sv.verse_number=2
  JOIN _s315_ezra10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=14 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-10-yet-now-there-is-hope-the-covenant-to-turn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death.* (2 Corinthians 7:10) — the weeping is godly sorrow that produces the covenant *to do it*, not mere grief.'
  FROM cross_reference_threads t
  JOIN _s315_ezra10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=10 AND sv.verse_number=2
  JOIN _s315_ezra10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=7 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-10-yet-now-there-is-hope-the-covenant-to-turn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded.* (James 4:8) — *be of good courage, and do it* enacted; the doubleness of the heart turned to other gods is purged.'
  FROM cross_reference_threads t
  JOIN _s315_ezra10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=10 AND sv.verse_number=4
  JOIN _s315_ezra10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-10-yet-now-there-is-hope-the-covenant-to-turn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Be afflicted, and mourn, and weep: let your laughter be turned to mourning, and your joy to heaviness.* (James 4:9) — the mourning that precedes restoration; the congregation *wept very sore* (Ezra 10:1).'
  FROM cross_reference_threads t
  JOIN _s315_ezra10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=10 AND sv.verse_number=4
  JOIN _s315_ezra10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-10-yet-now-there-is-hope-the-covenant-to-turn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up.* (James 4:10) — the humbling in the great rain is the seedbed of the lifting-up, the promised *hope in Yashar''el (Israel)*.'
  FROM cross_reference_threads t
  JOIN _s315_ezra10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=10 AND sv.verse_number=4
  JOIN _s315_ezra10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-10-yet-now-there-is-hope-the-covenant-to-turn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* (Deuteronomy 7:3) — the Torah word Ezra''s *separate yourselves* reaches back to.'
  FROM cross_reference_threads t
  JOIN _s315_ezra10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=10 AND sv.verse_number=11
  JOIN _s315_ezra10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-10-make-confession-and-separate-from-the-idolatry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*For they will turn away thy son from following me, that they may serve other gods...* (Deuteronomy 7:4) — the heart of the matter: the danger is *serve other gods*, idolatry not race; Rahab and Ruth, who cleaved to Yahuah, were absorbed into the seed and the Messianic line.'
  FROM cross_reference_threads t
  JOIN _s315_ezra10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=10 AND sv.verse_number=11
  JOIN _s315_ezra10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-10-make-confession-and-separate-from-the-idolatry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...their daughters go a whoring after their gods, and make thy sons go a whoring after their gods.* (Exodus 34:16) — the Sinai warning names it spiritual adultery; the separation of Ezra 10:11 is the turning back from that whoring to one Elohim.'
  FROM cross_reference_threads t
  JOIN _s315_ezra10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezra' AND sv.chapter_number=10 AND sv.verse_number=11
  JOIN _s315_ezra10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezra-10-make-confession-and-separate-from-the-idolatry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session315 — Ezra cross-references complete.'
