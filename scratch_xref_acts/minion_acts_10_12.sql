-- ----- fragment: minion_acts_10_12.sql (S217 Acts 10-12) -----
-- =====================================================================
-- S217 minion — ACTS 10-12 FULL-LIBRARY cross-references
-- =====================================================================
-- Range:  ACTS 10-12.  Tag: a1012 (temp view _s217_a1012_lookup).  Sort band: 5400-5470.
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- HIGH-VOICE-RISK WATCHPOINT (Red Lines #7 / #11 — the heart of this range):
-- The "Gentiles" of Acts 10-11 (Cornelius, his household, the Spirit falling, "to the Gentiles
-- also granted repentance unto life") are NOT the false-inclusion of the nations into Yashar'el
-- (Israel) by faith-confession. They are the scattered seed / the lost sheep of the dispersion
-- being gathered — the Lo-Ammi of Hosea 1 made nigh, the "afar off" made near. Cornelius is a
-- God-fearer already devout, alms-giving, praying — sought BECAUSE he was already of the sheep,
-- not made a son by responding. Election precedes hearing; the hearing reveals what was true
-- before the foundation of the world; no name is added after the foundation. "Elohim is no
-- respecter of persons" (10:34) = he does not pick by the visible Yahudah (Judah)/dispersion
-- divide, because the seed is scattered through all nations and not known by sight — NOT that
-- the nations-as-such are grafted in by belief. The sheet vision's immediate point is "call not
-- thou common ... any man" (10:28) — the dispersed seed among the nations are not unclean to
-- approach; it is NOT the abolition of the dietary Torah (the Spirit does not lead away from
-- Torah, Red Line #6). Framed accordingly in every Acts-10/11 thread below.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 10:
--   v.1-8   Cornelius the devout God-fearer   Tanakh: Psalms 34:15  Extras: (Tobit 13 weighed; carries the gathering, placed at Acts 11)  NT: John 10:27
--   v.9-16  the sheet / call not common       Tanakh: Hosea 2:23  Extras: none warranted (sheet is the seed-among-nations not unclean; no clean extras witness)  NT: (1 Peter 2:10 weighed; placed at Acts 11 Lo-Ammi thread)
--   v.17-33 Peter goes / kinsmen gathered      Tanakh: none added (narrative; framework carried in sheet + no-respecter threads)  Extras: none warranted  NT: none warranted
--   v.34-35 no respecter of persons            Tanakh: Deuteronomy 10:17, 2 Chronicles 19:7  Extras: Ecclesiasticus 35:12  NT: none added (Romans 2:11 weighed; OT witnesses carry it)
--   v.36    preaching peace, Lord of all       Tanakh: Isaiah 57:19  Extras: none warranted  NT: Ephesians 2:17
--   v.37-42 the witness / Judge of quick&dead  Tanakh: none added (carried in Acts 2/3/10 enthronement; not re-added)  Extras: none warranted  NT: none added
--   v.43-44 prophets witness / Spirit fell     Tanakh: (carried in peace-afar-off thread)  Extras: none warranted  NT: (Spirit-fell tied to gathering at Acts 11)
--   v.45-48 Spirit poured on the Gentiles      Tanakh: (Hosea, carried at Acts 11:18)  Extras: none warranted  NT: (carried at Acts 11:18 gathering thread)
--  ACTS 11:
--   v.1-14  Peter rehearses the vision         Tanakh: none added (re-tells Acts 10; framework carried there)  Extras: none warranted  NT: none added
--   v.15-18 to the Gentiles also granted rep.  Tanakh: Hosea 1:10, Hosea 2:23  Extras: Tobit 13:5  NT: 1 Peter 2:10
--   v.19-21 scattered preach / Antioch         Tanakh: Hosea 2:23 (the sow clause)  Extras: (Baruch 2:34 weighed; gathering-to-land, placed nowhere — sow clause cleaner)  NT: none warranted
--   v.22-26 Barnabas / grace / disciples named Tanakh: none warranted  Extras: none warranted  NT: none added (grace here is the favor seen on the work, narrative; no sola-fide target)
--   v.27-30 Agabus / the dearth / relief        Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--  ACTS 12:
--   v.1-2   James killed with the sword        Tanakh: none added (martyr-cup carried in gospels, not re-threaded here)  Extras: none warranted  NT: none warranted
--   v.3-6   Peter imprisoned / unleavened bread Tanakh: none added  Extras: none warranted  NT: none warranted (narrative)
--   v.7-11  the angel delivers Peter            Tanakh: Psalms 34:7, Daniel 6:22  Extras: none warranted  NT: none added
--   v.12-19 Rhoda / Peter at the door           Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.20-23 Herod takes the glory / smitten     Tanakh: Daniel 4:30, Daniel 4:32, Daniel 4:37  Extras: none warranted  NT: none added
--   v.24-25 the word grew / return from Jerus.  Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--
-- THREADS (slug -> target libraries):
--   5400 acts-10-cornelius-the-devout-god-fearer-the-sheep-that-hear            (Tanakh + NT)
--   5410 acts-10-elohim-is-no-respecter-of-persons                             (Tanakh + Extras)
--   5420 acts-10-call-not-any-man-common-the-scattered-not-unclean-to-approach (Tanakh)
--   5430 acts-10-preaching-peace-to-them-afar-off-and-them-that-are-nigh       (Tanakh + NT)
--   5440 acts-11-to-the-gentiles-also-granted-repentance-the-lo-ammi-made-nigh (Tanakh + Extras + NT)
--   5450 acts-11-the-scattered-sown-among-the-nations-the-word-to-antioch      (Tanakh)
--   5460 acts-12-the-angel-of-yahuah-delivereth-them-that-fear-him             (Tanakh)
--   5470 acts-12-he-gave-not-elohim-the-glory-the-pride-that-is-abased         (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s217_a1012_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-10-cornelius-the-devout-god-fearer-the-sheep-that-hear
  ('canon', 'acts', 10, 4, 'canon', 'psalms', 34, 15, 'free', E'*The eyes of Yahuah (LORD) are upon the righteous, and his ears are open unto their cry.* (Psalm 34:15). Cornelius is *a devout man, and one that feared Elohim (God) with all his house, which gave much alms to the people, and prayed to Elohim (God) alway* (Acts 10:2) — and the angel tells him *thy prayers and thine alms are come up for a memorial before Elohim (God)* (Acts 10:4). The ears of Yahuah were already open to this man''s cry before ever Peter was sent; the hearing that is coming reveals what was already true of him, it does not make it true.'),
  ('canon', 'acts', 10, 35, 'canon', 'john', 10, 27, 'free', E'*My sheep hear my voice, and I know them, and they follow me:* (John 10:27). *In every nation he that feareth him, and worketh righteousness, is accepted with him* (Acts 10:35). Cornelius hears because he is a sheep; he is not made a sheep by hearing. The word goes out to the nations because the sheep are scattered through them and not known by sight — and those who are his hear his voice when it comes.'),
  -- thread: acts-10-elohim-is-no-respecter-of-persons
  ('canon', 'acts', 10, 34, 'canon', 'deuteronomy', 10, 17, 'free', E'*For Yahuah Elohaychem (the LORD your God) is Elohim (God) of gods, and Lord of lords, a great Elohim (God), a mighty, and a terrible, which regardeth not persons, nor taketh reward:* (Deuteronomy 10:17). *Of a truth I perceive that Elohim (God) is no respecter of persons* (Acts 10:34) is Moses'' own word: he *regardeth not persons.* Peter sees that Yahuah does not pick by the visible divide of Yahudah (Judah) and dispersion — the seed is scattered through all nations, and he knows his own where men cannot.'),
  ('canon', 'acts', 10, 34, 'canon', '2-chronicles', 19, 7, 'free', E'*Wherefore now let the fear of Yahuah (LORD) be upon you; take heed and do it: for there is no iniquity with Yahuah Eloheinu (the LORD our God), nor respect of persons, nor taking of gifts.* (2 Chronicles 19:7). Jehoshaphat charged the judges that *there is no respect of persons* with Yahuah — and Peter perceives the same of the gathering: *Elohim (God) is no respecter of persons* (Acts 10:34). The One who judges without partiality gathers his scattered seed without partiality, out of every nation they were sown into.'),
  ('canon', 'acts', 10, 34, 'apocrypha', 'ecclesiasticus', 35, 12, 'extras', E'*Do not think to corrupt with gifts; for such he will not receive: and trust not to unrighteous sacrifices; for Yahuah (God) is judge, and with him is no respect of persons.* (Ecclesiasticus 35:12). The Hebrew library says it as Moses and the Chronicler said it — *with him is no respect of persons.* Peter''s *Elohim (God) is no respecter of persons* (Acts 10:34) stands on the whole witness of the library: the Judge of all does not regard the face, and gathers his own from every nation.'),
  -- thread: acts-10-call-not-any-man-common-the-scattered-not-unclean-to-approach
  ('canon', 'acts', 10, 28, 'canon', 'hosea', 2, 23, 'free', E'*And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God).* (Hosea 2:23). The sheet shows Peter that *Elohim (God) hath shewed me that I should not call any man common or unclean* (Acts 10:28). The lesson is of men, not of meats — the scattered seed living among the nations, the *not my people* whom Yahuah sowed into the earth to call *my people,* are not common to approach. What Elohim hath cleansed by his own promise to gather them, Peter is not to call common.'),
  -- thread: acts-10-preaching-peace-to-them-afar-off-and-them-that-are-nigh
  ('canon', 'acts', 10, 36, 'canon', 'isaiah', 57, 19, 'free', E'*I create the fruit of the lips; Peace, peace to him that is far off, and to him that is near, saith Yahuah (LORD); and I will heal him.* (Isaiah 57:19). *The word which Elohim (God) sent unto the children of Yashar''el (Israel), preaching peace by Yahusha HaMashiach (Jesus Christ)* (Acts 10:36) is the peace Isaiah promised *to him that is far off, and to him that is near.* The far-off are the dispersed of the house scattered among the nations; the peace preached in Cornelius'' house is the healing-word reaching the afar-off seed.'),
  ('canon', 'acts', 10, 36, 'canon', 'ephesians', 2, 17, 'free', E'*And came and preached peace to you which were afar off, and to them that were nigh.* (Ephesians 2:17). Peter, *preaching peace by Yahusha HaMashiach (Jesus Christ)* in the centurion''s house (Acts 10:36), does the very thing — the peace *preached ... to you which were afar off, and to them that were nigh.* The afar-off made nigh are the scattered seed brought home, not a stranger-people made into the seed; the same gathering Isaiah named, now reaching the dispersion.'),
  -- thread: acts-11-to-the-gentiles-also-granted-repentance-the-lo-ammi-made-nigh
  ('canon', 'acts', 11, 18, 'canon', 'hosea', 1, 10, 'free', E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10). *Then hath Elohim (God) also to the Gentiles granted repentance unto life* (Acts 11:18). This is Hosea''s promise breaking open: in the very place where the scattered house was told *ye are not my people,* there they are called *the sons of the living Elohim (God).* The repentance granted is the Lo-Ammi made nigh — the dispersed seed of Yashar''el among the nations gathered, not a new people grafted in.'),
  ('canon', 'acts', 11, 18, 'canon', 'hosea', 2, 23, 'free', E'*And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God).* (Hosea 2:23). When the brethren glorify Elohim saying *also to the Gentiles granted repentance unto life* (Acts 11:18), it is the mercy on *her that had not obtained mercy* — the scattered house Yahuah *sowed ... in the earth.* The ones told *not my people* are now *my people*; the gathering of the sown seed, not the inclusion of a stranger-people by confession.'),
  ('canon', 'acts', 11, 18, 'apocrypha', 'tobit', 13, 5, 'extras', E'*And he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us.* (Tobit 13:5). Tobit, in the captivity, names the hope the brethren see fulfilled: Yahuah *will gather us out of all nations, among whom he has scattered us.* *To the Gentiles also granted repentance unto life* (Acts 11:18) is that gathering begun — the scattered of the house found among the nations, not the nations made the seed.'),
  ('canon', 'acts', 11, 18, 'canon', '1-peter', 2, 10, 'free', E'*Which in time past were not a people, but are now the people of Elohim (God): which had not obtained mercy, but now have obtained mercy.* (1 Peter 2:10). Peter himself — the very apostle of the house of Cornelius — writes Hosea''s word to those gathered: *in time past were not a people, but are now the people of Elohim (God).* What he glorified Elohim for in Acts 11:18, *to the Gentiles also granted repentance unto life,* he names by Hosea: the *not my people* made the people, the scattered house brought home.'),
  -- thread: acts-11-the-scattered-sown-among-the-nations-the-word-to-antioch
  ('canon', 'acts', 11, 19, 'canon', 'hosea', 2, 23, 'free', E'*And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God).* (Hosea 2:23). *They which were scattered abroad upon the persecution ... travelled as far as Phenice, and Cyprus, and Antioch, preaching the word* (Acts 11:19). The scattering is the sowing: Yahuah said *I will sow her unto me in the earth,* and the persecution that scatters the witnesses is the very hand that sows the seed and the word together among the nations where the lost sheep are.'),
  -- thread: acts-12-the-angel-of-yahuah-delivereth-them-that-fear-him
  ('canon', 'acts', 12, 7, 'canon', 'psalms', 34, 7, 'free', E'*The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* (Psalm 34:7). *Behold, the angel of Yahuah (Lord) came upon him, and a light shined in the prison ... and his chains fell off from his hands* (Acts 12:7). The deliverance is the psalm made sight: *the angel of Yahuah encampeth round about them that fear him, and delivereth them.* The church prays without ceasing, and the angel comes.'),
  ('canon', 'acts', 12, 11, 'canon', 'daniel', 6, 22, 'free', E'*My Elohim (God) hath sent his angel, and hath shut the lions’ mouths, that they have not hurt me: forasmuch as before him innocency was found in me; and also before thee, O king, have I done no hurt.* (Daniel 6:22). Peter, come to himself, says *Now I know of a surety, that Yahuah (Lord) hath sent his angel, and hath delivered me out of the hand of Herod* (Acts 12:11) — Daniel''s own confession: *My Elohim (God) hath sent his angel.* The God who shut the lions'' mouths for the servant in the den opens the prison for the servant in chains; the deliverance of the faithful is one work across the ages.'),
  -- thread: acts-12-he-gave-not-elohim-the-glory-the-pride-that-is-abased
  ('canon', 'acts', 12, 22, 'canon', 'daniel', 4, 30, 'free', E'*The king spake, and said, Is not this great Babylon, that I have built for the house of the kingdom by the might of my power, and for the honour of my majesty?* (Daniel 4:30). When the people shout *It is the voice of a god, and not of a man* (Acts 12:22) and Herod takes it, he stands where Nebuchadnezzar stood — *the honour of my majesty.* The man who receives the glory due to Elohim alone is the man on the very edge of the sentence.'),
  ('canon', 'acts', 12, 23, 'canon', 'daniel', 4, 32, 'free', E'*And they shall drive thee from men, and thy dwelling shall be with the beasts of the field: they shall make thee to eat grass as oxen, and seven times shall pass over thee, until thou know that the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will.* (Daniel 4:32). *Immediately the angel of Yahuah (Lord) smote him, because he gave not Elohim (God) the glory: and he was eaten of worms* (Acts 12:23). The lesson Nebuchadnezzar was driven among the beasts to learn — *that the El Elyon (most High) ruleth in the kingdom of men* — Herod is struck down for refusing. The same angel that delivered Peter smites the king who steals the glory of Elohim.'),
  ('canon', 'acts', 12, 23, 'canon', 'daniel', 4, 37, 'free', E'*Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* (Daniel 4:37). Nebuchadnezzar, restored, confesses the rule Herod would not — *those that walk in pride he is able to abase.* Herod *gave not Elohim (God) the glory* (Acts 12:23) and was abased to the worms; the proud king who learned and the proud king who would not learn stand as the two ends of one truth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a1012_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a1012_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-10-cornelius-the-devout-god-fearer-the-sheep-that-hear',
       E'Cornelius the devout God-fearer — the sheep that hear his voice',
       E'Before Peter is ever sent, Cornelius is already *a devout man, and one that feared Elohim (God) with all his house, which gave much alms to the people, and prayed to Elohim (God) alway* (Acts 10:2), and the angel tells him *Thy prayers and thine alms are come up for a memorial before Elohim (God)* (Acts 10:4). The ears of Yahuah were open to him already: *The eyes of Yahuah (LORD) are upon the righteous, and his ears are open unto their cry* (Psalm 34:15). And Peter perceives the rule of it — *in every nation he that feareth him, and worketh righteousness, is accepted with him* (Acts 10:35). This is not a man made a son by responding to a message. He is sought because he is already of the sheep: *My sheep hear my voice, and I know them, and they follow me* (John 10:27). The hearing that comes through Peter reveals what election made true of him before the foundation of the world; it does not create it. The word goes out to the nations because the scattered seed are sown through them and cannot be picked out by sight — and those who are his hear his voice when it comes.',
       sv.verse_id, ev.verse_id, 'free', 5400
  FROM _s217_a1012_lookup sv, _s217_a1012_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=10 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-10-elohim-is-no-respecter-of-persons',
       E'Elohim (God) is no respecter of persons',
       E'Peter opens his mouth in the centurion''s house and says *Of a truth I perceive that Elohim (God) is no respecter of persons: but in every nation he that feareth him, and worketh righteousness, is accepted with him* (Acts 10:34-35). It is no new doctrine — it is the standing word of the Torah, the histories, and the library. Moses said it of Yahuah: *which regardeth not persons, nor taketh reward* (Deuteronomy 10:17). Jehoshaphat charged the judges by it: *there is no iniquity with Yahuah Eloheinu (the LORD our God), nor respect of persons, nor taking of gifts* (2 Chronicles 19:7). The Hebrew library repeats it: *Yahuah (God) is judge, and with him is no respect of persons* (Ecclesiasticus 35:12). What Peter sees is that Yahuah does not gather his own by the visible divide of Yahudah (Judah) and dispersion — he does not regard the face. The seed of the house is scattered through all nations, and the Shepherd knows his own where men cannot tell them apart. The Judge who never regarded the face gathers his scattered seed the same way: not by sight, but by the voice they hear.',
       sv.verse_id, ev.verse_id, 'extras', 5410
  FROM _s217_a1012_lookup sv, _s217_a1012_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=34
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=10 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-10-call-not-any-man-common-the-scattered-not-unclean-to-approach',
       E'Call not any man common — the scattered seed not unclean to approach',
       E'Peter on the housetop sees the sheet let down with all manner of beasts, and the voice says *Rise, Peter; kill, and eat ... What Elohim (God) hath cleansed, that call not thou common* (Acts 10:13,15). He does not eat — and the vision is not finally about meat. Peter himself gives the interpretation when he reaches the house: *Elohim (God) hath shewed me that I should not call any man common or unclean* (Acts 10:28). The lesson is of men. The scattered seed of the house living among the nations — the *not my people* of whom Yahuah said *I will sow her unto me in the earth ... and I will say to them which were not my people, Thou art my people* (Hosea 2:23) — are not common to approach. The Spirit does not lead Peter away from the Torah of clean and unclean; he leads him to the dispersed of his own people, whom Elohim has cleansed by his own promise to gather. What Elohim hath cleansed by that promise, Peter is not to call common — and so he goes, *without gainsaying* (Acts 10:29), into the house of the afar-off seed.',
       sv.verse_id, ev.verse_id, 'free', 5420
  FROM _s217_a1012_lookup sv, _s217_a1012_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=10 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-10-preaching-peace-to-them-afar-off-and-them-that-are-nigh',
       E'Preaching peace — to them afar off and to them that are nigh',
       E'In the house of Cornelius, Peter names what the word is: *The word which Elohim (God) sent unto the children of Yashar''el (Israel), preaching peace by Yahusha HaMashiach (Jesus Christ): (he is Yahuah (Lord) of all:)* (Acts 10:36). This is the peace Isaiah promised: *I create the fruit of the lips; Peace, peace to him that is far off, and to him that is near, saith Yahuah (LORD); and I will heal him* (Isaiah 57:19). The far-off are the dispersed of the house, scattered among the nations; the peace reaching the centurion''s house is the healing-word reaching the afar-off seed. It is the same gathering the apostles preach elsewhere: *And came and preached peace to you which were afar off, and to them that were nigh* (Ephesians 2:17). The afar-off made nigh are the scattered brought home, not a stranger-people made into the seed. And as Peter speaks, the proof of it falls: *While Peter yet spake these words, the Ruach HaKodesh (Holy Spirit) fell on all them which heard the word* (Acts 10:44) — the peace received, the gathering owned by the Spirit himself.',
       sv.verse_id, ev.verse_id, 'free', 5430
  FROM _s217_a1012_lookup sv, _s217_a1012_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=36
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=10 AND ev.verse_number=44
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-11-to-the-gentiles-also-granted-repentance-the-lo-ammi-made-nigh',
       E'To the Gentiles also granted repentance — the Lo-Ammi made nigh',
       E'When Peter has rehearsed the whole matter, the brethren in Jerusalem hold their peace and glorify Elohim, saying *Then hath Elohim (God) also to the Gentiles granted repentance unto life* (Acts 11:18). This is Hosea''s promise breaking open. Yahuah had named the scattered northern house *Lo-ammi* — *for ye are not my people* (Hosea 1:9) — and in the same breath swore the turning: *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10), *and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people* (Hosea 2:23). The hope was kept in the captivity too: *he ... will gather us out of all nations, among whom he has scattered us* (Tobit 13:5). And Peter himself, the apostle of this very house, later writes it to the gathered: *Which in time past were not a people, but are now the people of Elohim (God): which had not obtained mercy, but now have obtained mercy* (1 Peter 2:10). The repentance granted is the Lo-Ammi made nigh — the dispersed seed of the house, scattered through the nations and unknown by sight, called home and revealed as sons. It is not a stranger-people grafted in by confession; it is the gathering Hosea sang.',
       sv.verse_id, ev.verse_id, 'extras', 5440
  FROM _s217_a1012_lookup sv, _s217_a1012_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=11 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-11-the-scattered-sown-among-the-nations-the-word-to-antioch',
       E'The scattered sown among the nations — the word to Antioch',
       E'*Now they which were scattered abroad upon the persecution that arose about Stephen travelled as far as Phenice, and Cyprus, and Antioch, preaching the word* (Acts 11:19), and *a great number believed, and turned unto Yahuah (Lord)* (Acts 11:21). The scattering is the sowing. Yahuah said of the divorced house, *I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people* (Hosea 2:23). The hand that scatters the witnesses under persecution is the hand that sows the seed and the word together into the very nations where the lost sheep already are. The dispersion was never an accident of the enemy''s rage; it is the means of the gathering. The word reaches Antioch because the scattered carry it, and the great number that turns is the sown seed of the house hearing the voice of its Shepherd in the place where it was sown.',
       sv.verse_id, ev.verse_id, 'free', 5450
  FROM _s217_a1012_lookup sv, _s217_a1012_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=11 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-12-the-angel-of-yahuah-delivereth-them-that-fear-him',
       E'The angel of Yahuah delivereth them that fear him',
       E'Herod has killed James with the sword and taken Peter, bound with two chains between two soldiers, the keepers before the door — but *prayer was made without ceasing of the church unto Elohim (God) for him* (Acts 12:5). And in the night *the angel of Yahuah (Lord) came upon him, and a light shined in the prison ... and his chains fell off from his hands* (Acts 12:7). It is the psalm made sight: *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* (Psalm 34:7). When Peter comes to himself he confesses it in the very words of Daniel: *Now I know of a surety, that Yahuah (Lord) hath sent his angel, and hath delivered me out of the hand of Herod* (Acts 12:11) — for Daniel, brought up unhurt from the lions, had said *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me* (Daniel 6:22). The God who shut the lions'' mouths for the servant in the den opens the iron gate for the servant in chains. The deliverance of the faithful is one work across the ages, and it answers the prayer of the gathered.',
       sv.verse_id, ev.verse_id, 'free', 5460
  FROM _s217_a1012_lookup sv, _s217_a1012_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=12 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-12-he-gave-not-elohim-the-glory-the-pride-that-is-abased',
       E'He gave not Elohim the glory — the pride that is abased',
       E'Herod, arrayed in royal apparel upon his throne, makes his oration, and the people shout *It is the voice of a god, and not of a man* (Acts 12:22) — and he takes it. *And immediately the angel of Yahuah (Lord) smote him, because he gave not Elohim (God) the glory: and he was eaten of worms, and gave up the ghost* (Acts 12:23). He stands where Nebuchadnezzar stood: *Is not this great Babylon, that I have built ... for the honour of my majesty?* (Daniel 4:30). And the sentence Nebuchadnezzar was driven among the beasts to learn is the very lesson Herod refuses: *they shall make thee to eat grass as oxen ... until thou know that the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will* (Daniel 4:32). Restored, Nebuchadnezzar confessed it — *those that walk in pride he is able to abase* (Daniel 4:37). Herod walked in pride and was abased to the worms. The same angel that delivered Peter from the prison smote the king who stole the glory of Elohim; the One who rules in the kingdom of men gives it to whomsoever he will, and takes it from the proud.',
       sv.verse_id, ev.verse_id, 'free', 5470
  FROM _s217_a1012_lookup sv, _s217_a1012_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=12 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-10-cornelius-the-devout-god-fearer-the-sheep-that-hear
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 34:15 — *The eyes of Yahuah (LORD) are upon the righteous, and his ears are open unto their cry* the ears of Yahuah were open to Cornelius before Peter was sent (Acts 10:4).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-10-cornelius-the-devout-god-fearer-the-sheep-that-hear'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 10:27 — *My sheep hear my voice, and I know them, and they follow me* Cornelius hears because he is a sheep; he is not made one by hearing (Acts 10:35).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-10-cornelius-the-devout-god-fearer-the-sheep-that-hear'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-10-elohim-is-no-respecter-of-persons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 10:17 — *which regardeth not persons, nor taketh reward* Moses'' own word for Yahuah; Peter perceives it of the gathering (Acts 10:34).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-10-elohim-is-no-respecter-of-persons'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 19:7 — *there is no iniquity with Yahuah Eloheinu (the LORD our God), nor respect of persons* Jehoshaphat''s charge to the judges; the Judge gathers without partiality (Acts 10:34).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-10-elohim-is-no-respecter-of-persons'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 35:12 — *Yahuah (God) is judge, and with him is no respect of persons* the Hebrew library repeats the Torah''s witness Peter stands on (Acts 10:34).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-10-elohim-is-no-respecter-of-persons'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=34
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-10-call-not-any-man-common-the-scattered-not-unclean-to-approach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 2:23 — *I will sow her unto me in the earth ... and I will say to them which were not my people, Thou art my people* the sheet is of men: the scattered seed among the nations are not common to approach (Acts 10:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-10-call-not-any-man-common-the-scattered-not-unclean-to-approach'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-10-preaching-peace-to-them-afar-off-and-them-that-are-nigh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 57:19 — *Peace, peace to him that is far off, and to him that is near, saith Yahuah (LORD); and I will heal him* the peace preached in Cornelius'' house reaching the afar-off seed (Acts 10:36).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-10-preaching-peace-to-them-afar-off-and-them-that-are-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 2:17 — *preached peace to you which were afar off, and to them that were nigh* the afar-off made nigh are the scattered brought home, not a stranger-people made the seed (Acts 10:36).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-10-preaching-peace-to-them-afar-off-and-them-that-are-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=10 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-11-to-the-gentiles-also-granted-repentance-the-lo-ammi-made-nigh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 1:10 — *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* the Lo-Ammi made nigh — the dispersed house called sons (Acts 11:18).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-11-to-the-gentiles-also-granted-repentance-the-lo-ammi-made-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hosea 2:23 — *I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people* the mercy on the scattered house Yahuah sowed in the earth (Acts 11:18).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-11-to-the-gentiles-also-granted-repentance-the-lo-ammi-made-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 13:5 — *will gather us out of all nations, among whom he has scattered us* the captivity''s hope: the scattered of the house gathered, begun in the repentance granted (Acts 11:18).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-11-to-the-gentiles-also-granted-repentance-the-lo-ammi-made-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 2:10 — *which in time past were not a people, but are now the people of Elohim (God): which had not obtained mercy, but now have obtained mercy* Peter himself names Acts 11:18 by Hosea — the not-my-people made the people (Acts 11:18).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-11-to-the-gentiles-also-granted-repentance-the-lo-ammi-made-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-11-the-scattered-sown-among-the-nations-the-word-to-antioch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 2:23 — *I will sow her unto me in the earth* the persecution-scattering is the sowing of the seed and the word among the nations (Acts 11:19).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-11-the-scattered-sown-among-the-nations-the-word-to-antioch'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-12-the-angel-of-yahuah-delivereth-them-that-fear-him
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* the prison-deliverance is the psalm made sight (Acts 12:7).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-12-the-angel-of-yahuah-delivereth-them-that-fear-him'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 6:22 — *My Elohim (God) hath sent his angel, and hath shut the lions’ mouths* Peter''s confession is Daniel''s; the God of the den opens the prison (Acts 12:11).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-12-the-angel-of-yahuah-delivereth-them-that-fear-him'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-12-he-gave-not-elohim-the-glory-the-pride-that-is-abased
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 4:30 — *Is not this great Babylon, that I have built ... for the honour of my majesty?* Herod takes the shout of the people where Nebuchadnezzar took the honour (Acts 12:22).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-12-he-gave-not-elohim-the-glory-the-pride-that-is-abased'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 4:32 — *until thou know that the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will* the lesson Herod refused and was smitten for (Acts 12:23).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-12-he-gave-not-elohim-the-glory-the-pride-that-is-abased'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 4:37 — *those that walk in pride he is able to abase* Nebuchadnezzar restored confessed it; Herod walked in pride and was abased to the worms (Acts 12:23).'
  FROM cross_reference_threads t, cross_references x, _s217_a1012_lookup sv, _s217_a1012_lookup tv
 WHERE t.slug='acts-12-he-gave-not-elohim-the-glory-the-pride-that-is-abased'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
