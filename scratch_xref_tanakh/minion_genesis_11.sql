-- ----- fragment: minion_genesis_11.sql (Genesis 11) -----
-- Chapter: Genesis 11 (Babel — the one language, the tower, the scattering; the generations of Shem to Abram; Terah, Abram, Sarai, Ur toward Canaan)
-- Tag: ge11   Temp view: _s301_ge11_lookup
-- Sort band: base 20250, step 3 -> threads at 20250, 20253, 20256, 20259 (4 threads)
-- Source of EVERY row: 'canon','genesis',11,v
--
-- Genesis 11 coverage:
--   ★★ v.1-9 (the whole earth one language; let us build us a city and a tower whose top may reach unto heaven; let us make us a name; Yahuah comes down, confounds the tongue, scatters them; Babel)
--        NT:     Acts 2:4,6 (Pentecost/Shavuot — every man heard them speak in his own language; the REVERSAL of the Babel-scattering, firstfruits of the regathering) — THREAD 1 (load-bearing)
--        Extras: Jubilees 10:19 (they built the city and the tower, "let us ascend thereby into heaven"); Jubilees 10:22 (Behold they are one people... let us go down and confound their language); Jubilees 10:25 (called Babel, because Yahuah did there confound the language) — THREAD 1
--        Tanakh: Zephaniah 3:9 (then will I turn to the people a pure language, that they may all call upon the name of Yahuah) — THREAD 1; Genesis 12:2 (I will... make thy name great — contrast: men make their own name vs Yahuah makes Abram's) — THREAD 1
--   v.8-9 (Yahuah scattered them abroad upon the face of all the earth; the confusion as judgment-yet-mercy restraining the rebellion; the nations divided)
--        NT:     none warranted (the scattering's forward weave is the Pentecost reversal at THREAD 1; the calling of one seed-line begins at THREAD 3)
--        Extras: none warranted distinct as MEMBER (Jubilees scattering carried at THREAD 1; Jasher 9 tower-block is a run-together/mis-numbered parse — AVOIDED)
--        Tanakh: Deuteronomy 32:8 (when El Elyon divided to the nations their inheritance... according to the number of the children of Yashar'el); Genesis 10:32 (by these were the nations divided in the earth after the flood); Genesis 10:25 (in his days was the earth divided — Peleg) — THREAD 2
--   ★ v.10-26 (the generations of Shem: Shem, Arphaxad, Salah, Eber, Peleg, Reu, Serug, Nahor, Terah, and Abram — the seed-line NARROWING toward the call of Gen 12)
--        NT:     Luke 3:34-36 (the genealogy of the Son of Adam through Thara/Saruch/Ragau/Phalec/Heber/Sala/Arphaxad/Sem — the same line, run forward to Messiah) — THREAD 3 (load-bearing)
--        Extras: none warranted as MEMBER (Jubilees 10:18/11 retell the Peleg/Reu line; their distinctive witness is Abram's idol-rejection, carried at THREAD 4)
--        Tanakh: Genesis 10:24-25 (Arphaxad begat Salah; Salah begat Eber; Eber's sons Peleg/Joktan) — folded into THREAD 2/3 framing; Genesis 12:1 the line's destination — THREAD 3
--   v.27-32 (the generations of Terah: Abram, Nahor, Haran; Haran begat Lot, died in Ur of the Chaldees; Abram took Sarai; Sarai barren; Terah took them from Ur toward Canaan, stopped in Haran; Terah died in Haran)
--        NT:     Acts 7:2-4 (Stephen: the Elohim of glory appeared to Abraham in Mesopotamia, before he dwelt in Charran; came out of the land of the Chaldaeans) — THREAD 4
--        Extras: Jubilees 11:14 (the child Abram began to understand the errors of the earth... separated himself that he might not worship idols); Jubilees 12:2 (Abram to Terah: what profit from those idols... worship the Elohim of heaven); Jubilees 12:12 (Abram arose by night and burned the house of the idols); Jasher 9:6 (Abram knew Yahuah from three years old... all the sons of the earth served other gods) — THREAD 4
--        Tanakh: Joshua 24:2 (your fathers dwelt on the other side of the flood... Terah... and they served other gods); Genesis 12:1 (the call: get thee out of thy country, from thy kindred, from thy father's house) — THREAD 4
--        Note: Sarai's barrenness (v.30) recorded as the promise-against-barrenness setup; framed within THREAD 4 prose (the call comes against an empty womb), no separate barrenness-thread warranted for this chapter.
--
-- Threads (slug — target libraries):
--   1. genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal — NT (Acts) + Tanakh (Zephaniah, Genesis) + Extras (Jubilees) [extras] (CENTERPIECE)
--   2. genesis-11-yahuah-scattered-them-and-the-nations-were-divided — Tanakh (Deuteronomy, Genesis) [free]
--   3. genesis-11-the-generations-of-shem-the-seed-line-narrowing-to-abram — NT (Luke) + Tanakh (Genesis) [free]
--   4. genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry — NT (Acts) + Tanakh (Joshua, Genesis) + Extras (Jubilees, Jasher) [extras]
--
-- Framing notes:
--   ★★ BABEL -> PENTECOST REVERSAL (THREAD 1, load-bearing): the men of Shinar make themselves ONE in
--   rebellion and set out to *make us a name* (Genesis 11:4) — unity-in-rebellion, a name seized for self.
--   Yahuah confounds the one tongue and scatters them. The forward weave is Acts 2: at Shavuot the SAME
--   scattered nations *heard them speak in his own language* (Acts 2:6) — the Babel-scattering beginning to be
--   UNDONE, the firstfruits of the regathering of the dispersed (the two-house ingathering in seed form).
--   Zephaniah 3:9 names the consummation — *a pure language, that they may all call upon the name of Yahuah*.
--   And the chapter's own answer to the seized name: the very next chapter, Yahuah MAKES a name for Abram
--   (*make thy name great*, Genesis 12:2) — what man grasps at Babel, Yahuah gives to the one He calls.
--   ★ THE SEED-LINE NARROWING (THREAD 3, load-bearing): the toledot of Shem funnels down through Eber and
--   Peleg to Terah and to ABRAM — the whole seed-of-promise line converging on the man Gen 12 will call;
--   Luke 3:34-36 runs the same names forward to the Son of Adam.
--   ABRAM CALLED OUT OF IDOLATRY (THREAD 4): Joshua 24:2 and Acts 7:2-4 establish that the fathers beyond
--   the river served other gods — Abram is called OUT; the restored witnesses (Jubilees 11-12, Jasher 9)
--   unfold the young Abram rejecting and burning the idols. Sarai's barrenness sets the promise against an
--   empty womb.
--   AVOIDED as MEMBER: Jasher 9 tower-block (verse 7 is a run-together/mis-numbered parse swallowing vv.7-39
--   with embedded verse digits — known-bad-parse rule); used only the clean Jasher 9:6. Jubilees double-written
--   'jubilees','jubilees'; Jasher double-written 'jasher','jasher'.

CREATE TEMP VIEW _s301_ge11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (CENTERPIECE): let us make us a name — Babel and the Pentecost reversal
    ('canon','genesis',11,4,'canon','acts',2,6,'free',
      E'*Now when this was noised abroad, the multitude came together, and were confounded, because that every man heard them speak in his own language* (Acts 2:6). At Babel the men of Shinar said *let us make us a name, lest we be scattered abroad upon the face of the whole earth* (Genesis 11:4) — and were scattered, their one tongue confounded. At Shavuot the scattered nations are gathered to Jerusalem and *every man heard them speak in his own language* — the very confounding of Babel beginning to be undone, the firstfruits of the regathering of the dispersed.'),
    ('canon','genesis',11,7,'canon','acts',2,4,'free',
      E'*And they were all filled with the Ruach HaKodesh (Holy Spirit), and began to speak with other tongues, as the Spirit gave them utterance* (Acts 2:4). At Babel Yahuah said *let us go down, and there confound their language, that they may not understand one another''s speech* (Genesis 11:7); at Pentecost the Spirit gives tongues so that men of every nation DO understand — the scattering of the one tongue answered by a Spirit-given hearing across the nations.'),
    ('canon','genesis',11,9,'canon','acts',2,6,'free',
      E'*the multitude came together, and were confounded, because that every man heard them speak in his own language* (Acts 2:6). *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth* (Genesis 11:9). The word over Babel is *confound* and *scatter*; the word over Shavuot is the same crowd *confounded* — but now by hearing, not by losing, the tongues. Babel''s scattering and Pentecost''s gathering stand face to face.'),
    ('canon','genesis',11,9,'canon','zephaniah',3,9,'free',
      E'*For then will I turn to the people a pure language, that they may all call upon the name of Yahuah (LORD), to serve him with one consent* (Zephaniah 3:9). Babel ends with *the language of all the earth* confounded and the peoples scattered (Genesis 11:9); the prophet names the consummation — not a return to one rebel speech, but a *pure language* given so that *they may all call upon the name of Yahuah* with one consent. The undoing of Babel finishes in worship, not in a tower.'),
    ('canon','genesis',11,4,'canon','genesis',12,2,'free',
      E'*And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing* (Genesis 12:2). At Babel men say *let us make us a name* (Genesis 11:4) — a name seized by their own hands, raised on a tower toward heaven. The very next breath of the story is Yahuah''s answer: He will *make thy name great* for Abram. What the builders grasp at, Yahuah gives to the one He calls — the made name comes by the promise, not by the brick.'),
    ('canon','genesis',11,4,'jubilees','jubilees',10,19,'extras',
      E'*For they departed from the land of Ararat eastward to Shinar; for in his days they built the city and the tower, saying, "Go to, let us ascend thereby into heaven."* (Jubilees 10:19). The restored witness names the heart of *let us build us a city and a tower, whose top may reach unto heaven* (Genesis 11:4): not a building project but an ascent — men purposing to climb to heaven by their own work.'),
    ('canon','genesis',11,6,'jubilees','jubilees',10,22,'extras',
      E'*And Yahuah our Elohim (the LORD our God) said to us: "Behold, they are one people, and (this) they begin to do, and now nothing will be withholden from them. Go to, let us go down and confound their language, that they may not understand one another''s speech..."* (Jubilees 10:22). The same divine deliberation of *Behold, the people is one, and they have all one language... let us go down, and there confound their language* (Genesis 11:6-7) is preserved word for word — the unity-in-rebellion restrained by the confounding of the tongue.'),
    ('canon','genesis',11,9,'jubilees','jubilees',10,25,'extras',
      E'*For this reason the whole land of Shinar is called Babel, because Yahuah (God) did there confound all the language of the children of men, and from thence they were dispersed into their cities, each according to his language and his nation* (Jubilees 10:25). The naming of *Babel* and the *confounding* and *scattering* of Genesis 11:9 are carried in the restored witness with the same cause and the same dispersal — each according to his language and his nation.'),

    -- THREAD 2: Yahuah scattered them, and the nations were divided
    ('canon','genesis',11,8,'canon','deuteronomy',32,8,'free',
      E'*When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8). The scattering of *Yahuah (LORD) scattered them abroad from thence upon the face of all the earth* (Genesis 11:8) was not chaos but a dividing: the El Elyon set the bounds of the nations — and set them *according to the number of the children of Yashar''el*, the scattering already ordered toward the covenant people who would be called out of it.'),
    ('canon','genesis',11,9,'canon','genesis',10,32,'free',
      E'*These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood* (Genesis 10:32). The table of nations had already said the peoples were *divided in the earth after the flood*; Genesis 11:9 tells how — *from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth*. The dividing of the nations and the scattering at Babel are one event seen from two sides.'),
    ('canon','genesis',11,8,'canon','genesis',10,25,'free',
      E'*And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother''s name was Joktan* (Genesis 10:25). The seed-line itself bears the memorial of the scattering: Peleg is named because *in his days was the earth divided* — the dividing of Genesis 11:8, when *Yahuah (LORD) scattered them abroad*, marked into the very genealogy that runs down to Abram.'),

    -- THREAD 3: the generations of Shem — the seed-line narrowing to Abram
    ('canon','genesis',11,10,'canon','luke',3,36,'free',
      E'*Which was the son of Cainan, which was the son of Arphaxad, which was the son of Sem, which was the son of Noe, which was the son of Lamech* (Luke 3:36). *These are the generations of Shem: Shem was an hundred years old, and begat Arphaxad two years after the flood* (Genesis 11:10). The toledot of Shem that opens here — Shem begat Arphaxad — is run forward, in reverse, to the Son of Adam: *the son of Arphaxad, which was the son of Sem*. The line of promise narrowing through Shem is the same line climbing to Messiah.'),
    ('canon','genesis',11,16,'canon','luke',3,35,'free',
      E'*Which was the son of Saruch, which was the son of Ragau, which was the son of Phalec, which was the son of Heber, which was the son of Sala* (Luke 3:35). The middle of the Shem toledot — *Salah... begat Eber... Eber... begat Peleg... Peleg... begat Reu... Reu... begat Serug* (Genesis 11:14-22) — is the very stretch the Spirit recites forward to Messiah: Sala, Heber, Phalec, Ragau, Saruch. Every link of the narrowing seed-line is accounted for in the genealogy of the Son of Adam.'),
    ('canon','genesis',11,26,'canon','luke',3,34,'free',
      E'*Which was the son of Jacob, which was the son of Isaac, which was the son of Abraham, which was the son of Thara, which was the son of Nachor* (Luke 3:34). The Shem toledot reaches its goal: *And Terah lived seventy years, and begat Abram, Nahor, and Haran* (Genesis 11:26). The line that has been funneling down through Eber and Peleg lands on Terah and Abram — and Luke runs it on: *the son of Abraham, which was the son of Thara* — the whole seed-of-promise converging on the man Gen 12 will call.'),

    -- THREAD 4: Terah took Abram from Ur — the call out of idolatry
    ('canon','genesis',11,31,'canon','joshua',24,2,'free',
      E'*Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* (Joshua 24:2). When *Terah took Abram his son... and they went forth with them from Ur of the Chaldees, to go into the land of Canaan* (Genesis 11:31), the house leaving Ur was an idolatrous house — Yahushua (Joshua) names it plainly: Terah *served other gods*. Abram is called out of idolatry, not out of righteousness already kept.'),
    ('canon','genesis',11,28,'canon','acts',7,2,'free',
      E'*The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2). Genesis 11 leaves Abram *in Ur of the Chaldees* (Genesis 11:28) and then in Haran; Stephen fills in what the chapter only frames — that the *Elohim of glory* had already appeared to Abraham *in Mesopotamia, before he dwelt in Charran*. The call did not begin in Haran; it found Abram in the land of his idolatrous fathers.'),
    ('canon','genesis',11,31,'canon','acts',7,4,'free',
      E'*Then came he out of the land of the Chaldaeans, and dwelt in Charran: and from thence, when his father was dead, he removed him into this land, wherein ye now dwell* (Acts 7:4). The journey of Genesis 11:31 — *from Ur of the Chaldees... and they came unto Haran, and dwelt there* — is read forward by Stephen as the obedience of the call: out of the land of the Chaldaeans to Charran, and from thence, after Terah died (Genesis 11:32), on into the land of promise.'),
    ('canon','genesis',11,31,'canon','genesis',12,1,'free',
      E'*Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1). The setting-out of *Terah took Abram his son... to go into the land of Canaan* (Genesis 11:31) is the leading edge of the word that had already come: *Get thee out of thy country, and from thy kindred, and from thy father''s house*. The move from Ur toward Canaan is the first step of the call that gathers force in the next chapter.'),
    ('canon','genesis',11,28,'jubilees','jubilees',11,14,'extras',
      E'*And the child began to understand the errors of the earth that all went astray after graven images and after uncleanness... and he separated himself from his father that he might not worship idols with him* (Jubilees 11:14). While Genesis 11 only names Ur of the Chaldees (Genesis 11:28), the restored witness tells what Abram saw there: a whole earth gone astray after graven images, and the young Abram separating himself from his own father''s idolatry.'),
    ('canon','genesis',11,28,'jubilees','jubilees',12,2,'extras',
      E'*"What help and profit have we from those idols which you do worship... For there is no spirit in them, For they are dumb forms, and a misleading of the heart. Worship them not: Worship the Elohim (God) of heaven, Who causes the rain and the dew to descend on the earth..."* (Jubilees 12:2). The Ur that Abram is called out of (Genesis 11:28,31) was a house of idols, and the restored witness puts Abram''s confession in his mouth: the idols are dumb forms; worship instead the Elohim of heaven who made all things.'),
    ('canon','genesis',11,31,'jubilees','jubilees',12,12,'extras',
      E'*And in the sixtieth year of the life of Abram... Abram arose by night, and burned the house of the idols, and he burned all that was in the house, and no man knew it* (Jubilees 12:12). Before *they went forth... from Ur of the Chaldees* (Genesis 11:31), the restored witness records Abram''s decisive break with his fathers'' gods — he burned the house of the idols by night. The departure from Ur was a flight from idolatry already renounced.'),
    ('canon','genesis',11,31,'jasher','jasher',9,6,'extras',
      E'*And Abram... knew Yahuah (the Lord) from three years old, and he went in the ways of Yahuah (the Lord) until the day of his death... and all the sons of the earth in those days greatly transgressed against Yahuah (the Lord)... and they served other gods, and they forgot Yahuah (the Lord) who had created them* (Jasher 9:6). Against the backdrop of a whole earth serving *gods of wood and stone*, Abram knew Yahuah from his earliest childhood. When Terah''s house leaves Ur (Genesis 11:31), it is Abram — alone in his generation knowing Yahuah — whom the promise will follow.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (CENTERPIECE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal',
       E'Let us make us a name — Babel and the Pentecost reversal',
       E'The whole earth is *of one language, and of one speech* (Genesis 11:1), and the men of Shinar bend that unity to rebellion: *Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth* (Genesis 11:4). They grasp at a name for themselves and at heaven by their own brick. Yahuah comes down — *Behold, the people is one, and they have all one language... Go to, let us go down, and there confound their language* (Genesis 11:6-7) — and *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth* (Genesis 11:9). The restored witness tells the same event: they built the tower *saying, "Go to, let us ascend thereby into heaven"* (Jubilees 10:19); Yahuah said *"let us go down and confound their language"* (Jubilees 10:22); and *the whole land of Shinar is called Babel, because Yahuah (God) did there confound all the language of the children of men* (Jubilees 10:25). Now weave forward. At Shavuot the SAME scattered nations are gathered to Jerusalem, and *they were all filled with the Ruach HaKodesh (Holy Spirit), and began to speak with other tongues* (Acts 2:4), so that *every man heard them speak in his own language* (Acts 2:6) — the confounding of Babel beginning to be undone, the firstfruits of the regathering of the dispersed. The prophet names the consummation: *then will I turn to the people a pure language, that they may all call upon the name of Yahuah (LORD), to serve him with one consent* (Zephaniah 3:9). And the chapter''s own answer to the seized name comes in the next breath of the story: where the builders said *let us make us a name*, Yahuah says to Abram, *I will... make thy name great* (Genesis 12:2). What man grasps at on a tower, Yahuah gives by promise to the one He calls.',
       sv.verse_id, ev.verse_id, 'extras', 20250
  FROM _s301_ge11_lookup sv, _s301_ge11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=11 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-11-yahuah-scattered-them-and-the-nations-were-divided',
       E'Yahuah scattered them — and the nations were divided',
       E'*So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city* (Genesis 11:8). The scattering looks like pure judgment, but it is judgment-yet-mercy: it restrains the unity-in-rebellion and sets the bounds of the nations. The table of nations had already said it: *by these were the nations divided in the earth after the flood* (Genesis 10:32) — and the seed-line itself bears the memorial, for Peleg is named *for in his days was the earth divided* (Genesis 10:25). Mosheh (Moses) gives the dividing its deepest frame: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8). The scattering at Babel is not chaos; the El Elyon orders it — and orders it toward the covenant people who will be called out of the divided nations. The restraining of the tower clears the ground for the calling of one seed-line out of the many.',
       sv.verse_id, ev.verse_id, 'free', 20253
  FROM _s301_ge11_lookup sv, _s301_ge11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=11 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-11-the-generations-of-shem-the-seed-line-narrowing-to-abram',
       E'The generations of Shem — the seed-line narrowing to Abram',
       E'After the nations are scattered, the camera narrows to one line: *These are the generations of Shem: Shem was an hundred years old, and begat Arphaxad two years after the flood* (Genesis 11:10) — and on through Salah, Eber, Peleg, Reu, Serug, Nahor, until *Terah lived seventy years, and begat Abram, Nahor, and Haran* (Genesis 11:26). Out of the divided nations of Babel, Yahuah funnels the promise down a single seed-line to the man He is about to call. The Spirit runs the same names forward to the Son of Adam: *the son of Sem, which was the son of Noe* (Luke 3:36); *the son of Saruch, which was the son of Ragau, which was the son of Phalec, which was the son of Heber, which was the son of Sala* (Luke 3:35); *the son of Abraham, which was the son of Thara, which was the son of Nachor* (Luke 3:34). Every link of the narrowing in Genesis 11 is a link in the genealogy of Messiah. The toledot of Shem is the trunk of the seed of promise, converging on Abram and running on to the Son of Adam.',
       sv.verse_id, ev.verse_id, 'free', 20256
  FROM _s301_ge11_lookup sv, _s301_ge11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=11 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry',
       E'Terah took Abram from Ur — the call out of idolatry',
       E'The chapter ends with a journey begun: *And Terah took Abram his son, and Lot the son of Haran his son''s son, and Sarai his daughter in law, his son Abram''s wife; and they went forth with them from Ur of the Chaldees, to go into the land of Canaan; and they came unto Haran, and dwelt there* (Genesis 11:31) — and *Sarai was barren; she had no child* (Genesis 11:30). The promise sets out against an empty womb, from an idolatrous house. Yahushua (Joshua) names the house plainly: *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham... and they served other gods* (Joshua 24:2). Abram is called OUT of idolatry, not out of righteousness already his. Stephen fills in the timing the chapter only frames: *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2), and *Then came he out of the land of the Chaldaeans, and dwelt in Charran: and from thence, when his father was dead, he removed him into this land* (Acts 7:4) — the obedience of the word that had already come: *Get thee out of thy country, and from thy kindred, and from thy father''s house* (Genesis 12:1). The restored witnesses unfold the young Abram in that idolatrous Ur: *the child began to understand the errors of the earth that all went astray after graven images... and he separated himself from his father that he might not worship idols with him* (Jubilees 11:14); he pressed his father, *"Worship the Elohim (God) of heaven... Worship them not"* (Jubilees 12:2); and at last *Abram arose by night, and burned the house of the idols* (Jubilees 12:12). Jasher remembers it the same: *Abram... knew Yahuah (the Lord) from three years old... and all the sons of the earth in those days greatly transgressed against Yahuah... and they served other gods* (Jasher 9:6). When Terah''s house leaves Ur, the promise follows the one man who already knew Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 20259
  FROM _s301_ge11_lookup sv, _s301_ge11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=11 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (CENTERPIECE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*every man heard them speak in his own language* (Acts 2:6) — the Babel-scattering of *let us make us a name, lest we be scattered* (11:4) beginning to be undone at Shavuot.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*began to speak with other tongues, as the Spirit gave them utterance* (Acts 2:4) — the confounded tongue of *there confound their language* (11:7) answered by a Spirit-given hearing across the nations.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=7
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the multitude... were confounded, because that every man heard them speak in his own language* (Acts 2:6) — Babel''s *confound* and *scatter* (11:9) set face to face with Pentecost''s gathering.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I will turn to the people a pure language, that they may all call upon the name of Yahuah (LORD)* (Zephaniah 3:9) — the undoing of Babel''s confounded tongue (11:9) finished in one-consent worship.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=3 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I will... make thy name great* (Genesis 12:2) — the made name Yahuah gives Abram, against the seized name of *let us make us a name* (11:4).'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*they built the city and the tower, saying, "Go to, let us ascend thereby into heaven"* (Jubilees 10:19) — the heart of *whose top may reach unto heaven* (11:4): an ascent by men''s own work.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*"Behold, they are one people... let us go down and confound their language"* (Jubilees 10:22) — the divine deliberation of *the people is one... let us go down* (11:6-7) preserved word for word.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=6
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*the whole land of Shinar is called Babel, because Yahuah (God) did there confound all the language* (Jubilees 10:25) — the naming and scattering of 11:9 carried with the same cause.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-let-us-make-us-a-name-babel-and-the-pentecost-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*When the El Elyon (most High) divided to the nations their inheritance... according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8) — the scattering of 11:8 ordered toward the covenant people.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=8
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-yahuah-scattered-them-and-the-nations-were-divided'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*by these were the nations divided in the earth after the flood* (Genesis 10:32) — the dividing of the nations and the scattering of 11:9 are one event from two sides.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-yahuah-scattered-them-and-the-nations-were-divided'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the name of one was Peleg; for in his days was the earth divided* (Genesis 10:25) — the dividing of 11:8 marked into the seed-line that runs to Abram.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=8
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-yahuah-scattered-them-and-the-nations-were-divided'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the son of Arphaxad, which was the son of Sem, which was the son of Noe* (Luke 3:36) — the head of the Shem toledot (11:10) run forward to the Son of Adam.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=10
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-the-generations-of-shem-the-seed-line-narrowing-to-abram'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the son of Ragau, which was the son of Phalec, which was the son of Heber, which was the son of Sala* (Luke 3:35) — the middle of the Shem line (11:14-22) accounted for in Messiah''s genealogy.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=16
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-the-generations-of-shem-the-seed-line-narrowing-to-abram'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the son of Abraham, which was the son of Thara, which was the son of Nachor* (Luke 3:34) — the seed-line landing on Terah and Abram (11:26), run on to Messiah.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=26
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-the-generations-of-shem-the-seed-line-narrowing-to-abram'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Your fathers dwelt on the other side of the flood... even Terah... and they served other gods* (Joshua 24:2) — the house leaving Ur (11:31) was idolatrous; Abram called OUT of it.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2) — the call found Abram in Ur (11:28), not first in Haran.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=28
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Then came he out of the land of the Chaldaeans, and dwelt in Charran: and from thence... he removed him into this land* (Acts 7:4) — the journey of 11:31-32 read as the obedience of the call.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Get thee out of thy country, and from thy kindred, and from thy father''s house* (Genesis 12:1) — the word already given, of which the leaving of Ur (11:31) is the first step.'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the child began to understand the errors of the earth... and he separated himself from his father that he might not worship idols with him* (Jubilees 11:14) — the young Abram in idolatrous Ur (11:28).'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=28
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=11 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*"Worship the Elohim (God) of heaven... Worship them not"* (Jubilees 12:2) — Abram''s confession against the dumb idols of the Ur he is called out of (11:28,31).'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=28
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Abram arose by night, and burned the house of the idols* (Jubilees 12:12) — the decisive break with his fathers'' gods before the leaving of Ur (11:31).'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Abram... knew Yahuah (the Lord) from three years old... and all the sons of the earth... served other gods* (Jasher 9:6) — the one man in his generation knowing Yahuah, whom the promise follows out of Ur (11:31).'
  FROM cross_reference_threads t
  JOIN _s301_ge11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s301_ge11_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=9 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-11-terah-took-abram-from-ur-the-call-out-of-idolatry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
