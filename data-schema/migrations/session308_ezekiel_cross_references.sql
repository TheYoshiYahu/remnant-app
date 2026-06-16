-- =====================================================================
-- Session 308 — Ezekiel FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session308_ezekiel_cross_references.sql
-- =====================================================================

\echo 'session308 — Ezekiel cross-references starting...'
BEGIN;

-- ----- fragment: minion_ezekiel_1.sql (Ezekiel 1) -----
-- Chapter: Ezekiel 1 — the throne-chariot vision by the river Chebar (the merkabah): the heavens
-- opened and visions of Elohim (God); the whirlwind, the great cloud and the infolding fire; the four
-- living creatures, each with four faces (the man, the lion, the ox, the eagle) and four wings, full
-- of fire and lightning; the wheels within wheels, the rings dreadful and full of eyes; the firmament
-- as terrible crystal and the voice like great waters, the voice of the Almighty; and ABOVE the
-- firmament the likeness of a throne of sapphire, and upon it THE LIKENESS AS THE APPEARANCE OF A MAN —
-- the rainbow round about — THIS WAS THE APPEARANCE OF THE LIKENESS OF THE GLORY OF YAHUAH (LORD).
-- ★★ keystone (the merkabah / throne vision; the man-form enthroned = the visible Glory = the FORMED Son).
-- Tag: ezek01   Session: s308   Temp view: _s308_ezek01_lookup
-- Sort band: base 32000, step 3 -> threads at 32000, 32003, 32006, 32009, 32012, 32015 (6 threads)
-- Source of EVERY row: 'canon','ezekiel',1,v
--
-- Ezekiel 1 coverage:
--   v.1-3 (the thirtieth year... among the captives by the river of Chebar... the heavens were opened,
--          and I saw visions of Elohim (God)... the word of Yahuah (LORD) came expressly unto Ezekiel...
--          and the hand of Yahuah (LORD) was there upon him)
--        NT:     ★ Revelation 1:10 (in the Spirit on Yahuah's day, a great voice as of a trumpet),
--                ★ Revelation 4:1-2 (a door opened in heaven... immediately I was in the spirit),
--                ★ Matthew 3:16 (the heavens were opened... the Spirit of Elohim descending) — THREAD 1
--        Extras: none warranted (clean canon weave)
--        Tanakh: held in prose — the prophet caught up by the hand of Yahuah (LORD) in vision
--   ★★ v.4-14 (a whirlwind out of the north, a great cloud, a fire infolding itself... four living
--          creatures... the face of a man, and the face of a lion... the face of an ox... the face of an
--          eagle... like burning coals of fire... out of the fire went forth lightning)
--        NT:     ★★ Revelation 4:6 (four beasts full of eyes), ★★ Revelation 4:7 (the first beast like
--                a lion, the second like a calf, the third had a face as a man, the fourth like a flying
--                eagle) — John sees the same throne-creatures — THREAD 2
--        Extras: none warranted (clean canon-NT-Tanakh weave; Enoch's throne-vision held to ch14, not here)
--        Tanakh: ★ Isaiah 6:2 (the seraphims, each with six wings — the lateral throne-attendants),
--                ★ Ezekiel 10:14 (the same four faces named again — the cherubim of Chebar) — THREAD 2
--   v.22-25 (the firmament upon their heads as the terrible crystal... the noise of their wings, like
--          the noise of great waters, as the voice of the Almighty... a voice from the firmament)
--        NT:     ★ Revelation 1:15 (his voice as the sound of many waters), ★ Revelation 4:5
--                (out of the throne proceeded lightnings and thunderings and voices) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★ Ezekiel 43:2 (his voice was like a noise of many waters — the same Glory returning)
--                — THREAD 3
--   ★★ v.15-21 (one wheel upon the earth... a wheel in the middle of a wheel... their rings were so high
--          that they were dreadful; and their rings were full of eyes round about... the spirit of the
--          living creature was in the wheels)
--        NT:     ★ Revelation 4:8 (full of eyes within) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★★ Daniel 7:9 (his throne was like the fiery flame, and his wheels as burning fire —
--                the same fiery throne-chariot), ★ Ezekiel 10:13 (the wheels... O wheel) — THREAD 4
--   ★★★ v.26-27 (above the firmament... the likeness of a throne, as the appearance of a sapphire stone:
--          and upon the likeness of the throne was the likeness as the appearance of a man above upon it...
--          the appearance of fire round about within it)
--        NT:     ★★★ Revelation 4:2 (a throne was set in heaven, and one sat on the throne), ★★ Revelation
--                4:3 (like a jasper and a sardine stone), ★★ Revelation 1:13 (one like unto the Son of
--                Adam), ★★ Revelation 1:14-15 (his eyes as a flame of fire... his feet like fine brass) —
--                THREAD 5 (the man-form enthroned = the visible GLORY = the FORMED Son)
--        Extras: none warranted (the throne-man; clean canon weave; Formed/Formless in prose)
--        Tanakh: ★★ Exodus 24:10 (they saw the Elohim of Yashar'el: under his feet a paved work of a
--                sapphire stone), ★ Ezekiel 10:1 (the sapphire-stone throne over the cherubim — the same
--                Glory) — THREAD 5
--   ★★★ v.28 (as the appearance of the bow that is in the cloud... so was the appearance of the brightness
--          round about. THIS WAS THE APPEARANCE OF THE LIKENESS OF THE GLORY OF YAHUAH (LORD). And when I
--          saw it, I fell upon my face)
--        NT:     ★★★ Revelation 4:3 (a rainbow round about the throne, in sight like unto an emerald),
--                ★★ Revelation 1:17 (and when I saw him, I fell at his feet as dead) — THREAD 6
--        Extras: none warranted
--        Tanakh: ★ Ezekiel 43:2-3 (the glory of the Elohim of Yashar'el came from the east... and I fell
--                upon my face — the same Chebar vision returning, the same prostration) — THREAD 6
--
-- Threads (slug — target libraries):
--   1. ezekiel-1-the-heavens-were-opened-and-i-saw-visions-of-elohim — NT (Revelation 1, Revelation 4, Matthew 3) [free]
--      (★ the prophet caught up in the Spirit; the heavens opened; the hand of Yahuah upon him)
--   2. ezekiel-1-the-four-living-creatures-the-man-the-lion-the-ox-the-eagle — NT (Revelation 4) + Tanakh (Isaiah 6, Ezekiel 10) [free]
--      (★★ the four faces full of fire; John sees the same throne-creatures in Revelation 4; the seraphim lateral)
--   3. ezekiel-1-the-noise-of-their-wings-as-the-voice-of-the-almighty — NT (Revelation 1, Revelation 4) + Tanakh (Ezekiel 43) [free]
--      (★ the firmament-crystal and the voice like great waters; the throne-thunder of Revelation)
--   4. ezekiel-1-the-wheel-in-the-middle-of-a-wheel-full-of-eyes — NT (Revelation 4) + Tanakh (Daniel 7, Ezekiel 10) [free]
--      (★★ the throne-chariot mobility; wheels as burning fire (Daniel 7:9); rings full of eyes (Revelation 4:8))
--   5. ezekiel-1-the-likeness-as-the-appearance-of-a-man-upon-the-throne — NT (Revelation 4, Revelation 1) + Tanakh (Exodus 24, Ezekiel 10) [free]
--      (★★★ THE central thread: the man-form enthroned = the visible Glory = the FORMED Son, Yahuah who has a Father)
--   6. ezekiel-1-this-was-the-appearance-of-the-likeness-of-the-glory-of-yahuah — NT (Revelation 4, Revelation 1) + Tanakh (Ezekiel 43) [free]
--      (★★★ the rainbow round about the throne; the Glory named; Ezekiel falls on his face / John fell as dead)
--
-- Framing notes:
--   ★ THE HEAVENS OPENED (THREAD 1): *that the heavens were opened, and I saw visions of Elohim (God)*
--      (Ezekiel 1:1); *the word of Yahuah (LORD) came expressly unto Ezekiel... and the hand of Yahuah
--      (LORD) was there upon him* (1:3). The prophet is seized in vision — the same caught-up-in-the-Spirit
--      that opens the Revelation: *I was in the Spirit on Yahuah's (Lord's) day* (Revelation 1:10); *a door
--      was opened in heaven... immediately I was in the spirit* (Revelation 4:1-2). And the heavens open
--      again at the Jordan: *lo, the heavens were opened unto him, and he saw the Spirit of Elohim (God)
--      descending* (Matthew 3:16). The same Spirit that bore Ezekiel bears John, and the same opened heaven
--      shows the same throne.
--   ★★ THE FOUR LIVING CREATURES (THREAD 2): *the face of a man, and the face of a lion, on the right side:
--      and they four had the face of an ox on the left side; they four also had the face of an eagle*
--      (Ezekiel 1:10), *full of fire... out of the fire went forth lightning* (1:13). John sees the IDENTICAL
--      throne-creatures: *four beasts full of eyes before and behind* (Revelation 4:6); *the first beast was
--      like a lion, and the second beast like a calf, and the third beast had a face as a man, and the fourth
--      beast was like a flying eagle* (Revelation 4:7). Lateral to the seraphim Isaiah saw above the same
--      throne (Isaiah 6:2), and Ezekiel himself names the four faces again in ch10 — the cherubim of Chebar
--      (Ezekiel 10:14). One throne, one company of living creatures, seen across the whole canon.
--   ★ THE VOICE LIKE GREAT WATERS (THREAD 3): *the noise of their wings, like the noise of great waters, as
--      the voice of the Almighty* (Ezekiel 1:24), and *a voice from the firmament that was over their heads*
--      (1:25). The enthroned Glory's voice is the sound of many waters — exactly as John hears it: *his voice
--      as the sound of many waters* (Revelation 1:15); and from the throne *proceeded lightnings and
--      thunderings and voices* (Revelation 4:5). When the Glory returns to the house, the same voice: *his
--      voice was like a noise of many waters* (Ezekiel 43:2). The throne is never silent; the Word speaks
--      from it.
--   ★★ THE WHEEL IN THE MIDDLE OF A WHEEL (THREAD 4): *their appearance and their work was as it were a wheel
--      in the middle of a wheel... their rings were so high that they were dreadful; and their rings were full
--      of eyes round about them four* (Ezekiel 1:16,18); *the spirit of the living creature was in the wheels*
--      (1:21). The throne is a mobile chariot of fire — Daniel sees the same: *his throne was like the fiery
--      flame, and his wheels as burning fire* (Daniel 7:9). And the rings full of eyes are the eyes-within of
--      the four beasts: *they were full of eyes within* (Revelation 4:8). Ezekiel names the wheels again at
--      Chebar's return: *O wheel* (Ezekiel 10:13).
--   ★★★ THE LIKENESS AS THE APPEARANCE OF A MAN UPON THE THRONE (THREAD 5 — the central thread): *above the
--      firmament... was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness
--      of the throne was the likeness as the appearance of a man above upon it* (Ezekiel 1:26). The One the
--      formless Father cannot be seen as has a VISIBLE form — a MAN enthroned in fire. This is the FORMED Son,
--      the expressed image drawn from the Formless Source, Yahuah who has a Father: NOT a co-equal second
--      person of a trinity, NOT a created being. John sees the same: *a throne was set in heaven, and one sat
--      on the throne* (Revelation 4:2), *like a jasper and a sardine stone* (4:3); and the man-form is *one
--      like unto the Son of Adam... his eyes were as a flame of fire... his feet like unto fine brass*
--      (Revelation 1:13-15) — the same fire from the loins upward and downward (Ezekiel 1:27). Moses and the
--      elders saw the same enthroned One on the same sapphire: *they saw the Elohim (God) of Yashar'el
--      (Israel): and there was under his feet as it were a paved work of a sapphire stone* (Exodus 24:10); and
--      Ezekiel sees the sapphire throne again over the cherubim (Ezekiel 10:1). The visible Glory who met
--      Moses, who appeared to Ezekiel, is the One who took flesh.
--   ★★★ THE APPEARANCE OF THE LIKENESS OF THE GLORY OF YAHUAH (THREAD 6): *As the appearance of the bow that
--      is in the cloud in the day of rain, so was the appearance of the brightness round about. This was the
--      appearance of the likeness of the glory of Yahuah (LORD). And when I saw it, I fell upon my face*
--      (Ezekiel 1:28). The man-form on the throne is NAMED: the GLORY of Yahuah (LORD) — and a rainbow
--      surrounds him, exactly the rainbow John sees: *there was a rainbow round about the throne, in sight
--      like unto an emerald* (Revelation 4:3). Before this Glory the prophet falls on his face; before the
--      same glorious Son John falls too: *and when I saw him, I fell at his feet as dead* (Revelation 1:17).
--      And the same Chebar Glory returns to the house, and Ezekiel falls again: *the glory of the Elohim
--      (God) of Yashar'el (Israel) came from the way of the east... and I fell upon my face* (Ezekiel 43:2-3).
--   VERSES WITH NO SEPARATE ADD: v.2 (the dating — Jehoiachin's captivity; historical anchor, woven in prose
--      of THREAD 1), v.5-9/11-12 (the creatures' form/wings/straight-forward going — woven in THREAD 2),
--      v.19-20 (the wheels lifted with the creatures — woven in THREAD 4), v.23 (the wings under the firmament
--      — woven in THREAD 3). All recorded; the full vision is carried across the six threads.

CREATE TEMP VIEW _s308_ezek01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): the heavens were opened, and I saw visions of Elohim
    ('canon','ezekiel',1,1,'canon','revelation',1,10,'free',
      E'*I was in the Spirit on Yahuah''s (Lord''s) day, and heard behind me a great voice, as of a trumpet* (Revelation 1:10). As *the heavens were opened, and I saw visions of Elohim (God)* (Ezekiel 1:1), so John is caught up in the Spirit and hears the trumpet-voice. The same Ruach that seized Ezekiel by the river Chebar seizes John on Patmos — one Spirit opening one heaven to show one throne.'),
    ('canon','ezekiel',1,1,'canon','revelation',4,1,'free',
      E'*After this I looked, and, behold, a door was opened in heaven: and the first voice which I heard was as it were of a trumpet talking with me; which said, Come up hither* (Revelation 4:1). Ezekiel''s *the heavens were opened* (Ezekiel 1:1) is John''s *door was opened in heaven* — the same threshold flung wide, the prophet summoned up to behold the throne and the One who sits upon it.'),
    ('canon','ezekiel',1,1,'canon','revelation',4,2,'free',
      E'*And immediately I was in the spirit: and, behold, a throne was set in heaven, and one sat on the throne* (Revelation 4:2). The *visions of Elohim (God)* (Ezekiel 1:1) and the vision of John are the same throne-vision in the same Spirit — *and one sat on the throne* answers the man-form Ezekiel saw enthroned above the firmament (Ezekiel 1:26).'),
    ('canon','ezekiel',1,3,'canon','matthew',3,16,'free',
      E'*And Yahusha (Jesus), when he was baptized, went up straightway out of the water: and, lo, the heavens were opened unto him, and he saw the Spirit of Elohim (God) descending like a dove, and lighting upon him* (Matthew 3:16). The same heaven that opened to Ezekiel — *the heavens were opened, and I saw visions of Elohim (God)* (Ezekiel 1:1) with *the hand of Yahuah (LORD)... upon him* (1:3) — opens at the Jordan, the Spirit descending upon the One the throne-vision foreshowed.'),

    -- THREAD 2 (★★): the four living creatures — the man, the lion, the ox, the eagle
    ('canon','ezekiel',1,10,'canon','revelation',4,7,'free',
      E'*And the first beast was like a lion, and the second beast like a calf, and the third beast had a face as a man, and the fourth beast was like a flying eagle* (Revelation 4:7). John names the very four faces Ezekiel saw — *they four had the face of a man, and the face of a lion... the face of an ox... the face of an eagle* (Ezekiel 1:10). The throne-creatures of Chebar are the throne-creatures of the Revelation; one company stands about one throne.'),
    ('canon','ezekiel',1,5,'canon','revelation',4,6,'free',
      E'*And before the throne there was a sea of glass like unto crystal: and in the midst of the throne, and round about the throne, were four beasts full of eyes before and behind* (Revelation 4:6). Ezekiel''s *four living creatures... they had the likeness of a man* (Ezekiel 1:5) are John''s *four beasts* about the throne — the same living creatures, here named full of eyes, that bear and surround the Glory.'),
    ('canon','ezekiel',1,13,'canon','isaiah',6,2,'free',
      E'*Above it stood the seraphims: each one had six wings; with twain he covered his face, and with twain he covered his feet, and with twain he did fly* (Isaiah 6:2). The fiery living creatures of Ezekiel — *their appearance was like burning coals of fire... out of the fire went forth lightning* (Ezekiel 1:13) — are the throne-attendants Isaiah saw, the burning seraphim above the same throne, crying Holy to the One enthroned.'),
    ('canon','ezekiel',1,10,'canon','ezekiel',10,14,'free',
      E'*And every one had four faces: the first face was the face of a cherub, and the second face was the face of a man, and the third the face of a lion, and the fourth the face of an eagle* (Ezekiel 10:14). Ezekiel names the same four faces again — *they four had the face of a man, and the face of a lion... the face of an ox... the face of an eagle* (Ezekiel 1:10) — and tells us plainly they are the cherubim: *This is the living creature that I saw by the river of Chebar* (10:15). The Chebar creatures are the cherubim of the Glory.'),

    -- THREAD 3 (★): the noise of their wings as the voice of the Almighty; the voice like many waters
    ('canon','ezekiel',1,24,'canon','revelation',1,15,'free',
      E'*And his feet like unto fine brass, as if they burned in a furnace; and his voice as the sound of many waters* (Revelation 1:15). The enthroned Glory''s voice in Ezekiel — *the noise of their wings, like the noise of great waters, as the voice of the Almighty* (Ezekiel 1:24) — is the voice John hears from the glorious Son of Adam: *as the sound of many waters*. The same voice thunders from the same throne.'),
    ('canon','ezekiel',1,24,'canon','revelation',4,5,'free',
      E'*And out of the throne proceeded lightnings and thunderings and voices: and there were seven lamps of fire burning before the throne* (Revelation 4:5). Ezekiel''s throne-chariot roars with *the noise of great waters, as the voice of the Almighty* (Ezekiel 1:24) and *a voice from the firmament* (1:25); John''s throne likewise pours out lightnings, thunderings, and voices. The throne of the Glory is never silent.'),
    ('canon','ezekiel',1,24,'canon','ezekiel',43,2,'free',
      E'*And, behold, the glory of the Elohim (God) of Yashar''el (Israel) came from the way of the east: and his voice was like a noise of many waters: and the earth shined with his glory* (Ezekiel 43:2). When the Chebar Glory returns to the house, its voice is the same — *the noise of great waters, as the voice of the Almighty* (Ezekiel 1:24). One Glory, one voice like many waters, departing and returning to his people.'),

    -- THREAD 4 (★★): a wheel in the middle of a wheel, rings full of eyes; the throne-chariot of fire
    ('canon','ezekiel',1,16,'canon','daniel',7,9,'free',
      E'*I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire* (Daniel 7:9). Daniel sees the same throne-chariot Ezekiel saw — *a wheel in the middle of a wheel* (Ezekiel 1:16) — its wheels now *as burning fire*. The merkabah of Chebar is the fiery throne of the Ancient of days.'),
    ('canon','ezekiel',1,18,'canon','revelation',4,8,'free',
      E'*And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty* (Revelation 4:8). The dreadful rings of Ezekiel''s wheels — *their rings were full of eyes round about them four* (Ezekiel 1:18) — are the eyes-within of John''s living creatures. The all-seeing throne-chariot of Chebar surrounds the throne of the Revelation.'),
    ('canon','ezekiel',1,21,'canon','ezekiel',10,13,'free',
      E'*As for the wheels, it was cried unto them in my hearing, O wheel* (Ezekiel 10:13). Ezekiel names the wheels again when the Glory departs the house — the same wheels in which *the spirit of the living creature was* (Ezekiel 1:21). The mobile throne of Chebar is the mobile throne that lifts the Glory from the threshold; one chariot bears the Glory wherever the Spirit goes.'),

    -- THREAD 5 (★★★): the likeness as the appearance of a man upon the throne — the FORMED Son, the visible Glory
    ('canon','ezekiel',1,26,'canon','revelation',4,2,'free',
      E'*And immediately I was in the spirit: and, behold, a throne was set in heaven, and one sat on the throne* (Revelation 4:2). Ezekiel sees *the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it* (Ezekiel 1:26); John sees the same — *one sat on the throne*. The formless Father cannot be looked upon, yet a MAN sits enthroned: the FORMED Son, the visible image drawn from the Formless Source, who is Yahuah and has a Father.'),
    ('canon','ezekiel',1,26,'canon','revelation',4,3,'free',
      E'*And he that sat was to look upon like a jasper and a sardine stone* (Revelation 4:3). The enthroned man-form Ezekiel saw on the sapphire throne (Ezekiel 1:26) is the One John sees gleaming like precious stone upon the throne. The same visible Glory — not a created angel, not a second co-equal person, but the expressed Son in whom the unseen Father is made manifest.'),
    ('canon','ezekiel',1,26,'canon','revelation',1,13,'free',
      E'*And in the midst of the seven candlesticks one like unto the Son of Adam, clothed with a garment down to the foot, and girt about the paps with a golden girdle* (Revelation 1:13). The *likeness as the appearance of a man above upon* the throne (Ezekiel 1:26) is *one like unto the Son of Adam* — the man-form of the throne-vision is the glorified Son of Adam John beholds, the Formed One who took flesh in the seed of Adam.'),
    ('canon','ezekiel',1,27,'canon','revelation',1,14,'free',
      E'*His head and his hairs were white like wool, as white as snow; and his eyes were as a flame of fire* (Revelation 1:14). The fire that wraps the enthroned man — *the appearance of fire round about within it, from the appearance of his loins even upward, and from the appearance of his loins even downward* (Ezekiel 1:27) — is the fire of the glorified Son, whose *eyes were as a flame of fire*. The same burning Glory, one Person across the visions.'),
    ('canon','ezekiel',1,26,'canon','exodus',24,10,'free',
      E'*And they saw the Elohim (God) of Yashar''el (Israel): and there was under his feet as it were a paved work of a sapphire stone, and as it were the body of heaven in his clearness* (Exodus 24:10). Moses and the seventy elders saw the enthroned One on the same SAPPHIRE Ezekiel names — *the likeness of a throne, as the appearance of a sapphire stone... the likeness as the appearance of a man* (Ezekiel 1:26). The visible Elohim (God) of Yashar''el (Israel) the elders beheld is the man-form on the sapphire throne: the FORMED Son, Yahuah who appeared to his people.'),
    ('canon','ezekiel',1,26,'canon','ezekiel',10,1,'free',
      E'*Then I looked, and, behold, in the firmament that was above the head of the cherubims there appeared over them as it were a sapphire stone, as the appearance of the likeness of a throne* (Ezekiel 10:1). Ezekiel sees the sapphire throne again over the cherubim — the same *appearance of a sapphire stone* upon which sat *the likeness as the appearance of a man* (Ezekiel 1:26). One throne, one enthroned Glory, departing the defiled house yet still the visible Yahuah (LORD) of his people.'),

    -- THREAD 6 (★★★): a rainbow round about — THIS WAS THE GLORY OF YAHUAH — and I fell upon my face
    ('canon','ezekiel',1,28,'canon','revelation',4,3,'free',
      E'*And there was a rainbow round about the throne, in sight like unto an emerald* (Revelation 4:3). Ezekiel names the bow about the enthroned Glory — *As the appearance of the bow that is in the cloud in the day of rain, so was the appearance of the brightness round about. This was the appearance of the likeness of the glory of Yahuah (LORD)* (Ezekiel 1:28). John sees the identical rainbow encircling the identical throne — the covenant-bow of mercy around the seat of the Glory.'),
    ('canon','ezekiel',1,28,'canon','revelation',1,17,'free',
      E'*And when I saw him, I fell at his feet as dead. And he laid his right hand upon me, saying unto me, Fear not; I am the first and the last* (Revelation 1:17). Before the *likeness of the glory of Yahuah (LORD)*, Ezekiel *fell upon my face* (Ezekiel 1:28); before the same glorious Son, John falls as dead. The Glory is so weighty that the prophet cannot stand — yet the One enthroned reaches out: *Fear not*.'),
    ('canon','ezekiel',1,28,'canon','ezekiel',43,3,'free',
      E'*And it was according to the appearance of the vision which I saw... even according to the vision that I saw when I came to destroy the city: and the visions were like the vision that I saw by the river Chebar; and I fell upon my face* (Ezekiel 43:3). Ezekiel himself binds the returning Glory to the Chebar vision and repeats the prostration — *This was the appearance of the likeness of the glory of Yahuah (LORD). And when I saw it, I fell upon my face* (Ezekiel 1:28). The same Glory, the same falling down, departing and returning to his house.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-1-the-heavens-were-opened-and-i-saw-visions-of-elohim',
       E'The heavens were opened, and I saw visions of Elohim (God)',
       E'By the river of Chebar, among the captives, the prophet is seized in vision: *Now it came to pass in the thirtieth year... as I was among the captives by the river of Chebar, that the heavens were opened, and I saw visions of Elohim (God)* (Ezekiel 1:1); *The word of Yahuah (LORD) came expressly unto Ezekiel the priest, the son of Buzi, in the land of the Chaldeans by the river Chebar; and the hand of Yahuah (LORD) was there upon him* (Ezekiel 1:3). This caught-up-in-the-Spirit, this opened heaven, is exactly how the Revelation begins: *I was in the Spirit on Yahuah''s (Lord''s) day, and heard behind me a great voice, as of a trumpet* (Revelation 1:10), and then *behold, a door was opened in heaven: and the first voice which I heard was as it were of a trumpet talking with me; which said, Come up hither* (Revelation 4:1), *And immediately I was in the spirit: and, behold, a throne was set in heaven, and one sat on the throne* (Revelation 4:2). The same heaven opens at the Jordan: *lo, the heavens were opened unto him, and he saw the Spirit of Elohim (God) descending like a dove, and lighting upon him* (Matthew 3:16). One Ruach HaKodesh (Holy Spirit) opens one heaven — to Ezekiel by the Chebar, to John on Patmos, over the Son at the water — and shows the same throne and the same enthroned Glory.',
       sv.verse_id, ev.verse_id, 'free', 32000
  FROM _s308_ezek01_lookup sv, _s308_ezek01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-1-the-four-living-creatures-the-man-the-lion-the-ox-the-eagle',
       E'The four living creatures — the man, the lion, the ox, the eagle',
       E'Out of the infolding fire come the throne-bearers: *out of the midst thereof came the likeness of four living creatures... they had the likeness of a man. And every one had four faces, and every one had four wings* (Ezekiel 1:5-6); *they four had the face of a man, and the face of a lion, on the right side: and they four had the face of an ox on the left side; they four also had the face of an eagle* (Ezekiel 1:10); *their appearance was like burning coals of fire, and like the appearance of lamps... and out of the fire went forth lightning* (Ezekiel 1:13). John sees the IDENTICAL company about the throne: *in the midst of the throne, and round about the throne, were four beasts full of eyes before and behind. And the first beast was like a lion, and the second beast like a calf, and the third beast had a face as a man, and the fourth beast was like a flying eagle* (Revelation 4:6-7). The same four faces, the same fire. Isaiah saw the burning attendants above the same throne: *Above it stood the seraphims: each one had six wings* (Isaiah 6:2). And Ezekiel himself names the creatures again and tells us what they are — *the first face was the face of a cherub, and the second face was the face of a man, and the third the face of a lion, and the fourth the face of an eagle* (Ezekiel 10:14), *This is the living creature that I saw by the river of Chebar* (10:15): they are the cherubim of the Glory. One throne, one company of living creatures, beheld by Moses'' heirs, by Isaiah, by Ezekiel, by John.',
       sv.verse_id, ev.verse_id, 'free', 32003
  FROM _s308_ezek01_lookup sv, _s308_ezek01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=1 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-1-the-noise-of-their-wings-as-the-voice-of-the-almighty',
       E'The noise of their wings as the voice of the Almighty — the voice like many waters',
       E'Beneath the crystal firmament the throne-chariot roars: *And when they went, I heard the noise of their wings, like the noise of great waters, as the voice of the Almighty, the voice of speech, as the noise of an host... And there was a voice from the firmament that was over their heads* (Ezekiel 1:24-25). The voice of the enthroned Glory is the sound of many waters — and that is exactly the voice John hears from the glorified Son of Adam: *his voice as the sound of many waters* (Revelation 1:15); and from the throne itself *proceeded lightnings and thunderings and voices: and there were seven lamps of fire burning before the throne* (Revelation 4:5). When the same Chebar Glory returns to the house, its voice has not changed: *the glory of the Elohim (God) of Yashar''el (Israel) came from the way of the east: and his voice was like a noise of many waters: and the earth shined with his glory* (Ezekiel 43:2). One throne, one voice like the great waters, never silent — the Word speaking from the seat of the Glory.',
       sv.verse_id, ev.verse_id, 'free', 32006
  FROM _s308_ezek01_lookup sv, _s308_ezek01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=1 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-1-the-wheel-in-the-middle-of-a-wheel-full-of-eyes',
       E'A wheel in the middle of a wheel — the rings full of eyes, the throne-chariot of fire',
       E'The throne does not stand still; it is a chariot of living wheels: *Now as I beheld the living creatures, behold one wheel upon the earth by the living creatures, with his four faces... their appearance and their work was as it were a wheel in the middle of a wheel* (Ezekiel 1:15-16); *As for their rings, they were so high that they were dreadful; and their rings were full of eyes round about them four* (Ezekiel 1:18); *Whithersoever the spirit was to go, they went... for the spirit of the living creature was in the wheels* (Ezekiel 1:20-21). Daniel sees the same fiery throne-chariot: *I beheld till the thrones were cast down, and the Ancient of days did sit... his throne was like the fiery flame, and his wheels as burning fire* (Daniel 7:9). And the dreadful rings full of eyes are the eyes-within of the throne-creatures John saw: *the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy* (Revelation 4:8). Ezekiel names the wheels again when the Glory departs the defiled house: *As for the wheels, it was cried unto them in my hearing, O wheel* (Ezekiel 10:13). The merkabah is the all-seeing, fire-wheeled throne that bears the Glory wherever the Spirit goes — even out from the temple, and back again.',
       sv.verse_id, ev.verse_id, 'free', 32009
  FROM _s308_ezek01_lookup sv, _s308_ezek01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=1 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-1-the-likeness-as-the-appearance-of-a-man-upon-the-throne',
       E'The likeness as the appearance of a man upon the throne — the visible Glory, the Formed Son',
       E'Above all the fire and the wheels and the crystal firmament is the throne, and upon it a MAN: *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it. And I saw as the colour of amber, as the appearance of fire round about within it, from the appearance of his loins even upward, and from the appearance of his loins even downward, I saw as it were the appearance of fire* (Ezekiel 1:26-27). This is the heart of the vision. The Father — Yahuah (LORD) the Most High — is the formless Source whom no man hath seen; yet here a visible MAN sits enthroned in fire. This is the FORMED Son: the expressed image drawn from the Formless, Yahuah who has a Father — not a created angel, not a co-equal second person of a trinity. John sees the same: *behold, a throne was set in heaven, and one sat on the throne* (Revelation 4:2), *like a jasper and a sardine stone* (4:3); and the man-form is *one like unto the Son of Adam* whose *eyes were as a flame of fire* and *his feet like unto fine brass* (Revelation 1:13-15) — the same fire from the loins upward and downward. Moses and the seventy elders saw this very enthroned One on this very sapphire: *And they saw the Elohim (God) of Yashar''el (Israel): and there was under his feet as it were a paved work of a sapphire stone, and as it were the body of heaven in his clearness* (Exodus 24:10). And Ezekiel beholds the sapphire throne over the cherubim again: *there appeared over them as it were a sapphire stone, as the appearance of the likeness of a throne* (Ezekiel 10:1). The visible Glory who walked with Adam, who wrestled with Jacob, who met Moses on the mount, who appeared to Ezekiel by the Chebar — the man-form enthroned in fire — is the One who later took flesh in the seed of Adam.',
       sv.verse_id, ev.verse_id, 'free', 32012
  FROM _s308_ezek01_lookup sv, _s308_ezek01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=1 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-1-this-was-the-appearance-of-the-likeness-of-the-glory-of-yahuah',
       E'A rainbow round about — this was the appearance of the likeness of the glory of Yahuah (LORD)',
       E'The vision is sealed with a name and a falling-down: *As the appearance of the bow that is in the cloud in the day of rain, so was the appearance of the brightness round about. This was the appearance of the likeness of the glory of Yahuah (LORD). And when I saw it, I fell upon my face, and I heard a voice of one that spake* (Ezekiel 1:28). The man-form enthroned in fire is NAMED — the GLORY of Yahuah (LORD) — and a rainbow encircles him, the covenant-bow of Noah set round the seat of mercy. John sees the identical bow round the identical throne: *there was a rainbow round about the throne, in sight like unto an emerald* (Revelation 4:3). And the weight of the Glory throws the prophet down — *I fell upon my face* — exactly as it throws John down before the same glorious Son: *And when I saw him, I fell at his feet as dead. And he laid his right hand upon me, saying unto me, Fear not; I am the first and the last* (Revelation 1:17). Ezekiel himself ties the returning Glory back to this Chebar vision and repeats the prostration: *the glory of the Elohim (God) of Yashar''el (Israel) came from the way of the east... and the visions were like the vision that I saw by the river Chebar; and I fell upon my face* (Ezekiel 43:2-3). One Glory, named and rainbowed; one prophet on his face; one throne that departs his people in judgment and returns to them in mercy.',
       sv.verse_id, ev.verse_id, 'free', 32015
  FROM _s308_ezek01_lookup sv, _s308_ezek01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=1 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *I was in the Spirit on Yahuah''s (Lord''s) day, and heard... a great voice, as of a trumpet* (Revelation 1:10) — the same caught-up-in-the-Spirit as *the heavens were opened* (Ezekiel 1:1).'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-heavens-were-opened-and-i-saw-visions-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *a door was opened in heaven... Come up hither* (Revelation 4:1) — Ezekiel''s opened heaven is John''s opened door; the prophet summoned up to the throne.'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-heavens-were-opened-and-i-saw-visions-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*a throne was set in heaven, and one sat on the throne* (Revelation 4:2) — the *visions of Elohim (God)* (Ezekiel 1:1) and John''s vision are the one throne-vision in the one Spirit.'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-heavens-were-opened-and-i-saw-visions-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *the heavens were opened unto him, and he saw the Spirit of Elohim (God) descending* (Matthew 3:16) — the same opened heaven over the Son the throne-vision foreshowed.'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-heavens-were-opened-and-i-saw-visions-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the first beast like a lion... the second like a calf... the third had a face as a man... the fourth like a flying eagle* (Revelation 4:7) — John names the very four faces of Ezekiel 1:10.'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-four-living-creatures-the-man-the-lion-the-ox-the-eagle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *four beasts full of eyes before and behind* (Revelation 4:6) — Ezekiel''s *four living creatures... the likeness of a man* (Ezekiel 1:5) are John''s four beasts about the throne.'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-four-living-creatures-the-man-the-lion-the-ox-the-eagle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the seraphims: each one had six wings* (Isaiah 6:2) — the burning attendants Isaiah saw above the same throne; lateral to Ezekiel''s fiery living creatures (Ezekiel 1:13).'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-four-living-creatures-the-man-the-lion-the-ox-the-eagle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *the face of a cherub... a man... a lion... an eagle... the living creature that I saw by the river of Chebar* (Ezekiel 10:14-15) — Ezekiel names the same faces and tells us they are the cherubim.'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-four-living-creatures-the-man-the-lion-the-ox-the-eagle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *his voice as the sound of many waters* (Revelation 1:15) — the voice John hears from the glorious Son is the *voice of the Almighty... the noise of great waters* (Ezekiel 1:24).'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=24
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-noise-of-their-wings-as-the-voice-of-the-almighty'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *out of the throne proceeded lightnings and thunderings and voices* (Revelation 4:5) — John''s throne pours out the same thunder as Ezekiel''s *voice from the firmament* (Ezekiel 1:25).'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=24
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-noise-of-their-wings-as-the-voice-of-the-almighty'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *his voice was like a noise of many waters* (Ezekiel 43:2) — when the Chebar Glory returns to the house, the same voice as *the noise of great waters* (Ezekiel 1:24).'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=24
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=43 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-noise-of-their-wings-as-the-voice-of-the-almighty'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *his throne was like the fiery flame, and his wheels as burning fire* (Daniel 7:9) — Daniel sees the same throne-chariot, *a wheel in the middle of a wheel* (Ezekiel 1:16), now wheels of fire.'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=16
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-wheel-in-the-middle-of-a-wheel-full-of-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *they were full of eyes within... Holy, holy, holy* (Revelation 4:8) — the dreadful rings *full of eyes* (Ezekiel 1:18) are the eyes-within of John''s throne-creatures.'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=18
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-wheel-in-the-middle-of-a-wheel-full-of-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *it was cried unto them in my hearing, O wheel* (Ezekiel 10:13) — the same wheels in which *the spirit of the living creature was* (Ezekiel 1:21), now bearing the Glory out of the house.'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=21
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-wheel-in-the-middle-of-a-wheel-full-of-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *a throne was set in heaven, and one sat on the throne* (Revelation 4:2) — John sees the enthroned man-form of Ezekiel 1:26: the visible FORMED Son, Yahuah who has a Father.'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=26
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-likeness-as-the-appearance-of-a-man-upon-the-throne'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *he that sat was to look upon like a jasper and a sardine stone* (Revelation 4:3) — the gleaming enthroned One is the man-form on the sapphire throne (Ezekiel 1:26), the visible Glory.'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=26
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-likeness-as-the-appearance-of-a-man-upon-the-throne'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *one like unto the Son of Adam, clothed with a garment down to the foot* (Revelation 1:13) — the *likeness as the appearance of a man* (Ezekiel 1:26) is the glorified Son of Adam, the Formed One who took flesh.'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=26
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-likeness-as-the-appearance-of-a-man-upon-the-throne'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *his eyes were as a flame of fire* (Revelation 1:14) — the fire from the loins upward and downward (Ezekiel 1:27) is the fire of the glorified Son; one burning Glory.'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=27
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-likeness-as-the-appearance-of-a-man-upon-the-throne'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *they saw the Elohim (God) of Yashar''el (Israel): and there was under his feet as it were a paved work of a sapphire stone* (Exodus 24:10) — Moses and the elders saw the enthroned One on the same sapphire (Ezekiel 1:26): the FORMED Son.'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=26
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-likeness-as-the-appearance-of-a-man-upon-the-throne'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *there appeared over them as it were a sapphire stone, as the appearance of the likeness of a throne* (Ezekiel 10:1) — the same sapphire throne over the cherubim; one enthroned Glory departing the defiled house.'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=26
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-the-likeness-as-the-appearance-of-a-man-upon-the-throne'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *there was a rainbow round about the throne, in sight like unto an emerald* (Revelation 4:3) — the same covenant-bow Ezekiel saw round the *glory of Yahuah (LORD)* (Ezekiel 1:28).'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=28
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-this-was-the-appearance-of-the-likeness-of-the-glory-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *when I saw him, I fell at his feet as dead... Fear not; I am the first and the last* (Revelation 1:17) — as the *glory of Yahuah (LORD)* threw Ezekiel down (*I fell upon my face*, Ezekiel 1:28), so the same glorious Son throws John down.'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=28
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-this-was-the-appearance-of-the-likeness-of-the-glory-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the visions were like the vision that I saw by the river Chebar; and I fell upon my face* (Ezekiel 43:3) — Ezekiel binds the returning Glory to this vision and repeats the prostration of Ezekiel 1:28.'
  FROM cross_reference_threads t
  JOIN _s308_ezek01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=1 AND sv.verse_number=28
  JOIN _s308_ezek01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=43 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-1-this-was-the-appearance-of-the-likeness-of-the-glory-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezekiel_10.sql (Ezekiel 10) -----
-- Chapter: Ezekiel 10 — the cherubim and the wheels again; the man clothed with linen told to fill
-- his hands with coals of fire from between the cherubims and scatter them over the city; the glory
-- of Yahuah (LORD) departs from off the threshold of the house and stands over the cherubims, then
-- mounts to the door of the east gate. THE DEPARTING GLORY: the visible Glory — the Formed Son, the
-- enthroned man-form of ch.1 — withdrawing from the defiled temple in judgment.
-- Tag: ezek10   Temp view: _s308_ezek10_lookup   Session: s308
-- Sort band: base 32225, step 3 -> threads at 32225, 32228, 32231 (3 threads)
-- Source of EVERY row: 'canon','ezekiel',10,v
--
-- Ezekiel 10 coverage:
--   ★ v.1-2 (a sapphire-stone throne above the cherubims; the man clothed with linen told to GO IN
--          between the wheels, fill his hand with COALS OF FIRE from between the cherubims, and
--          SCATTER them over the city)
--        NT:     ★ Revelation 8:5 (the angel took the censer, and filled it with fire of the altar,
--                and cast it into the earth) — THREAD 1 (the same throne-fire-of-judgment poured on the city)
--        Extras: none warranted (no clean extras witness for the censer-of-coals; censer-judgment is NT)
--        Tanakh: ★ Ezekiel 9:4 (lateral — the same man clothed with linen who marked the foreheads;
--                THREAD 1) — the marking precedes the burning
--   v.3-7 (the cloud filled the inner court; the glory went up from the cherub and stood over the
--          threshold; one cherub put fire into the hands of him clothed with linen)
--        NT:     none warranted distinct (the glory-on-the-threshold belongs to the departing-glory
--                arc, THREAD 3; the fire-handoff completes the censer act of THREAD 1)
--        Extras: none warranted
--        Tanakh: held — the threshold-station is the first stage of the departure (woven THREAD 3)
--   ★★ v.8-17 (the hands of a man under their wings; the four wheels like beryl, a wheel in the midst
--          of a wheel, full of eyes; four faces — cherub, man, lion, eagle; the spirit of the living
--          creature in them)
--        NT:     ★★ Revelation 4:7 (lion, calf, man, eagle), ★★ Revelation 4:6 (four beasts full of
--                eyes before and behind), ★ Revelation 4:8 (six wings, full of eyes, Holy holy holy) — THREAD 2
--        Extras: none warranted (clean canon-NT throne-creature weave; no extras forced)
--        Tanakh: ★★ Ezekiel 1:10 (the face of a man, lion, ox, eagle), ★ Ezekiel 1:6 (four faces, four
--                wings), ★ Ezekiel 1:5 (the likeness of four living creatures) — THREAD 2 (the SAME vision of ch.1)
--   ★★ v.15,20-22 (the cherubims lifted up: THIS IS THE LIVING CREATURE that I saw by the river of
--          Chebar... and I KNEW that they were the cherubims) — the throne-creatures of ch.1 now NAMED
--        NT:     folded into THREAD 2 (Revelation 4 the four living creatures)
--        Extras: none warranted
--        Tanakh: folded into THREAD 2 (Ezekiel 1 the river-of-Chebar vision named here as the cherubim)
--   ★★★ v.18-19 (THEN THE GLORY OF YAHUAH DEPARTED FROM OFF THE THRESHOLD OF THE HOUSE, and stood over
--          the cherubims; the cherubims mounted up, every one stood at the door of the EAST GATE, and
--          the glory of the Elohim of Yashar'el was over them above)
--        NT:     ★★★ Matthew 23:38 (Behold, your house is left unto you desolate), ★ Matthew 24:1
--                (Yahusha went out, and departed from the temple) — THREAD 3
--        Extras: none warranted (the departing/returning Glory is a canon arc; no extras forced)
--        Tanakh: ★★★ Ezekiel 11:23 (the glory of Yahuah went up from the midst of the city, and stood
--                upon the mountain on the east side), ★★ Ezekiel 43:2 + ★★ Ezekiel 43:4 (the glory of
--                the Elohim of Yashar'el came from the way of the EAST... came into the house) — THREAD 3
--                (the answering RETURN of the same Glory by the same east gate)
--
-- Threads (slug — target libraries):
--   1. ezekiel-10-coals-of-fire-scattered-over-the-city — NT (Revelation 8) + Tanakh (Ezekiel 9) [free]
--      (★ the censer of coals from the throne-chariot scattered over Jerusalem = the throne-fire-of-judgment)
--   2. ezekiel-10-this-is-the-living-creature-the-cherubim-and-the-wheels — NT (Revelation 4) + Tanakh (Ezekiel 1) [free]
--      (★★ the four-faced throne-creatures of ch.1 now NAMED cherubim; forward to the four living creatures of Rev 4)
--   3. ezekiel-10-the-glory-of-yahuah-departed-from-the-threshold — NT (Matthew 23, Matthew 24) + Tanakh (Ezekiel 11, Ezekiel 43) [free]
--      (★★★ THE departing Glory — the Formed Son withdrawing from the defiled temple; answered by the RETURN by the east gate)
--
-- Framing notes:
--   ★ THE COALS OF FIRE SCATTERED OVER THE CITY (THREAD 1): the same man clothed with linen who in ch.9
--      marked the foreheads of the mourners is now told: *Go in between the wheels, even under the cherub,
--      and fill thine hand with coals of fire from between the cherubims, and scatter them over the city*
--      (Ezekiel 10:2). The fire of judgment is taken from the throne-chariot itself. John sees the same
--      censer act poured on the earth: *And the angel took the censer, and filled it with fire of the altar,
--      and cast it into the earth* (Revelation 8:5). The marking of the faithful (ch.9) precedes the burning
--      of the city — the same pattern: the remnant sealed, then the throne-fire falls.
--   ★★ THE LIVING CREATURE NAMED THE CHERUBIM (THREAD 2): *And every one had four faces: the first face was
--      the face of a cherub, and the second face was the face of a man, and the third the face of a lion, and
--      the fourth the face of an eagle* (Ezekiel 10:14), and Ezekiel names them: *This is the living creature
--      that I saw under the Elohim (God) of Yashar''el (Israel) by the river of Chebar; and I knew that they
--      were the cherubims* (Ezekiel 10:20). The river-of-Chebar vision of ch.1 (*the face of a man... the face
--      of a lion... the face of an ox... the face of an eagle*, Ezekiel 1:10) is now identified as the
--      cherubim. John sees the same four faces and the eyes round about: *the first beast was like a lion, and
--      the second beast like a calf, and the third beast had a face as a man, and the fourth beast was like a
--      flying eagle* (Revelation 4:7); *four beasts full of eyes before and behind* (Revelation 4:6). One
--      throne-chariot, one company of living creatures, from Chebar to the throne of Revelation.
--   ★★★ THE GLORY DEPARTED FROM THE THRESHOLD (THREAD 3): *Then the glory of Yahuah (LORD) departed from off
--      the threshold of the house, and stood over the cherubims* (Ezekiel 10:18), and mounted to *the door of
--      the east gate of the LORD''S house* (10:19). The visible Glory — the Formed Son, the enthroned
--      man-form of ch.1 (*the appearance of a man above upon it... the glory of Yahuah*, Ezekiel 1:26,28) —
--      withdraws by stages from the defiled temple. The departure continues in ch.11: *And the glory of
--      Yahuah (LORD) went up from the midst of the city, and stood upon the mountain which is on the east side
--      of the city* (Ezekiel 11:23). Yahusha (Jesus) pronounces the same desolation and walks it out: *Behold,
--      your house is left unto you desolate* (Matthew 23:38); *And Yahusha (Jesus) went out, and departed from
--      the temple* (Matthew 24:1) — the Glory leaving by the east, over the very Mount of Olives. But the
--      Glory that comes and goes RETURNS by the same east gate: *the glory of the Elohim (God) of Yashar''el
--      (Israel) came from the way of the east... And the glory of Yahuah (LORD) came into the house* (Ezekiel
--      43:2,4). The Glory that departs and returns is the Formed Son — Yahuah who has a Father, who comes and
--      goes, never the formless Most High who fills heaven and earth.
--   VERSES WITH NO SEPARATE ADD: v.3-7 (the cloud and the glory on the threshold; the fire-handoff — folded
--      into THREAD 1 and THREAD 3), v.16-17 (the wheels move with the cherubims, the spirit in them — folded
--      into THREAD 2), v.21-22 (the four faces/wings restated from the Chebar vision — folded into THREAD 2).
--      All recorded.

CREATE TEMP VIEW _s308_ezek10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): coals of fire from between the cherubims scattered over the city
    ('canon','ezekiel',10,2,'canon','revelation',8,5,'free',
      E'*And the angel took the censer, and filled it with fire of the altar, and cast it into the earth: and there were voices, and thunderings, and lightnings, and an earthquake* (Revelation 8:5). This is the same act Ezekiel sees: the man clothed with linen is told to *fill thine hand with coals of fire from between the cherubims, and scatter them over the city* (Ezekiel 10:2). The fire of judgment is taken from the throne itself — the altar-fire of heaven cast down upon the city; the censer of coals scattered over Jerusalem is the throne-fire-of-judgment poured out.'),
    ('canon','ezekiel',10,2,'canon','ezekiel',9,4,'free',
      E'*And Yahuah (LORD) said unto him, Go through the midst of the city, through the midst of Jerusalem, and set a mark upon the foreheads of the men that sigh and that cry for all the abominations that be done in the midst thereof* (Ezekiel 9:4). The very man clothed with linen who marked the foreheads of the mourning remnant in ch.9 is now told to *fill thine hand with coals of fire from between the cherubims, and scatter them over the city* (Ezekiel 10:2). The sealing of the faithful goes first; then the throne-fire falls — the remnant marked before the city is burned.'),

    -- THREAD 2 (★★): the living creature named the cherubim — four faces, full of eyes
    ('canon','ezekiel',10,14,'canon','revelation',4,7,'free',
      E'*And the first beast was like a lion, and the second beast like a calf, and the third beast had a face as a man, and the fourth beast was like a flying eagle* (Revelation 4:7). John sees the same four-faced throne-creatures Ezekiel names: *the first face was the face of a cherub, and the second face was the face of a man, and the third the face of a lion, and the fourth the face of an eagle* (Ezekiel 10:14). One company of living creatures bears the throne from the river of Chebar to the throne of Revelation.'),
    ('canon','ezekiel',10,12,'canon','revelation',4,6,'free',
      E'*And before the throne there was a sea of glass like unto crystal: and in the midst of the throne, and round about the throne, were four beasts full of eyes before and behind* (Revelation 4:6). Ezekiel''s cherubim are *full of eyes round about, even the wheels that they four had* (Ezekiel 10:12) — the same four living creatures, full of eyes, before the same throne. The vision John sees in heaven is the vision Ezekiel saw by Chebar.'),
    ('canon','ezekiel',10,21,'canon','revelation',4,8,'free',
      E'*And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come* (Revelation 4:8). Ezekiel''s cherubim — *Every one had four faces apiece, and every one four wings; and the likeness of the hands of a man was under their wings* (Ezekiel 10:21) — are the same throne-attendants John hears crying the threefold holy. The hands of a man under the wings, the eyes, the wings: one heavenly company.'),
    ('canon','ezekiel',10,20,'canon','ezekiel',1,10,'free',
      E'*As for the likeness of their faces, they four had the face of a man, and the face of a lion, on the right side: and they four had the face of an ox on the left side; they four also had the face of an eagle* (Ezekiel 1:10). Ezekiel names this very vision: *This is the living creature that I saw under the Elohim (God) of Yashar''el (Israel) by the river of Chebar; and I knew that they were the cherubims* (Ezekiel 10:20). The four living creatures of ch.1 are now identified — they are the cherubim, the same four-faced bearers of the throne-chariot.'),
    ('canon','ezekiel',10,20,'canon','ezekiel',1,6,'free',
      E'*And every one had four faces, and every one had four wings* (Ezekiel 1:6). The four-faced, four-winged creatures of the opening vision are named in ch.10: *This is the living creature that I saw under the Elohim (God) of Yashar''el (Israel) by the river of Chebar; and I knew that they were the cherubims* (Ezekiel 10:20). What ch.1 described, ch.10 names — the cherubim of the glory.'),
    ('canon','ezekiel',10,15,'canon','ezekiel',1,5,'free',
      E'*Also out of the midst thereof came the likeness of four living creatures. And this was their appearance; they had the likeness of a man* (Ezekiel 1:5). Ezekiel ties the two visions together: *And the cherubims were lifted up. This is the living creature that I saw by the river of Chebar* (Ezekiel 10:15). The *four living creatures* first seen in the whirlwind out of the north are the same cherubim now lifting the glory from the temple.'),

    -- THREAD 3 (★★★): the glory of Yahuah departed from off the threshold of the house
    ('canon','ezekiel',10,18,'canon','ezekiel',11,23,'free',
      E'*And the glory of Yahuah (LORD) went up from the midst of the city, and stood upon the mountain which is on the east side of the city* (Ezekiel 11:23). The departure begun in ch.10 — *Then the glory of Yahuah (LORD) departed from off the threshold of the house, and stood over the cherubims* (Ezekiel 10:18) — is completed: the Glory leaves the city entirely and stands on the mountain to the east, the Mount of Olives. The visible Glory, the Formed Son, withdraws from the defiled temple by stages.'),
    ('canon','ezekiel',10,18,'canon','matthew',23,38,'free',
      E'*Behold, your house is left unto you desolate* (Matthew 23:38). Yahusha (Jesus) pronounces over the temple the very verdict Ezekiel saw enacted: *Then the glory of Yahuah (LORD) departed from off the threshold of the house, and stood over the cherubims* (Ezekiel 10:18). When the Glory leaves, the house is left desolate — an empty shell. The Formed Son who is the Glory speaks the desolation he himself once departed in vision.'),
    ('canon','ezekiel',10,19,'canon','matthew',24,1,'free',
      E'*And Yahusha (Jesus) went out, and departed from the temple: and his disciples came to him for to shew him the buildings of the temple* (Matthew 24:1). As Ezekiel''s cherubim *mounted up from the earth in my sight: when they went out... every one stood at the door of the east gate of the LORD''S house* (Ezekiel 10:19), so Yahusha goes out and departs from the temple — leaving by the east toward the Mount of Olives, the Glory withdrawing again from a house become desolate.'),
    ('canon','ezekiel',10,19,'canon','ezekiel',43,2,'free',
      E'*And, behold, the glory of the Elohim (God) of Yashar''el (Israel) came from the way of the east: and his voice was like a noise of many waters: and the earth shined with his glory* (Ezekiel 43:2). The Glory that departed by the *east gate of the LORD''S house* (Ezekiel 10:19) RETURNS by the same way of the east. The same Glory that comes and goes — the Formed Son, Yahuah who has a Father — leaves the defiled house and comes back to the restored one.'),
    ('canon','ezekiel',10,19,'canon','ezekiel',43,4,'free',
      E'*And the glory of Yahuah (LORD) came into the house by the way of the gate whose prospect is toward the east* (Ezekiel 43:4). The departing Glory of ch.10 — standing *at the door of the east gate of the LORD''S house* (Ezekiel 10:19) — returns through that very east gate into the house. The withdrawal in judgment is answered by the return in restoration; the same visible Glory, the Formed Son, fills the house again.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-10-coals-of-fire-scattered-over-the-city',
       E'Coals of fire from between the cherubims, scattered over the city',
       E'The throne-chariot stands over Jerusalem, and the man clothed with linen — the same one who in the previous chapter went through the city to *set a mark upon the foreheads of the men that sigh and that cry for all the abominations* (Ezekiel 9:4) — is given a second commission: *And he spake unto the man clothed with linen, and said, Go in between the wheels, even under the cherub, and fill thine hand with coals of fire from between the cherubims, and scatter them over the city* (Ezekiel 10:2). The fire of judgment is drawn from the throne itself — from between the cherubim that bear the glory. One cherub hands it over: *And one cherub stretched forth his hand from between the cherubims unto the fire that was between the cherubims, and took thereof, and put it into the hands of him that was clothed with linen: who took it, and went out* (Ezekiel 10:7). John sees the same censer act consummated at the end: *And the angel took the censer, and filled it with fire of the altar, and cast it into the earth: and there were voices, and thunderings, and lightnings, and an earthquake* (Revelation 8:5). The pattern is fixed: the remnant is marked FIRST — the sealing of the faithful — and only then does the throne-fire fall on the city. Judgment proceeds from the very presence of Yahuah (LORD), measured and just, sparing those who mourn the abominations and burning what would not repent.',
       sv.verse_id, ev.verse_id, 'free', 32225
  FROM _s308_ezek10_lookup sv, _s308_ezek10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=10 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-10-this-is-the-living-creature-the-cherubim-and-the-wheels',
       E'This is the living creature that I saw by the river of Chebar — the cherubim and the wheels',
       E'Ezekiel looks again at the throne-chariot and now NAMES what he saw in the opening vision: *And every one had four faces: the first face was the face of a cherub, and the second face was the face of a man, and the third the face of a lion, and the fourth the face of an eagle* (Ezekiel 10:14); *This is the living creature that I saw under the Elohim (God) of Yashar''el (Israel) by the river of Chebar; and I knew that they were the cherubims* (Ezekiel 10:20). The four-faced, four-winged living creatures of ch.1 — *the likeness of four living creatures... they had the likeness of a man* (Ezekiel 1:5), *the face of a man, and the face of a lion... the face of an ox... the face of an eagle* (Ezekiel 1:10) — are the cherubim, the bearers of the glory. The wheels move with them, *a wheel had been in the midst of a wheel* (Ezekiel 10:10), and their whole body and the wheels are *full of eyes round about* (Ezekiel 10:12). John sees the identical company before the heavenly throne: *in the midst of the throne, and round about the throne, were four beasts full of eyes before and behind* (Revelation 4:6); *the first beast was like a lion, and the second beast like a calf, and the third beast had a face as a man, and the fourth beast was like a flying eagle* (Revelation 4:7); *the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty* (Revelation 4:8). One throne-chariot, one company of living creatures — from the river of Chebar to the throne of Revelation, the same cherubim guard and bear the glory of Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'free', 32228
  FROM _s308_ezek10_lookup sv, _s308_ezek10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=10 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=10 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-10-the-glory-of-yahuah-departed-from-the-threshold',
       E'Then the glory of Yahuah departed from off the threshold of the house',
       E'This is the heart of the vision: the visible Glory leaves the temple. *Then the glory of Yahuah (LORD) departed from off the threshold of the house, and stood over the cherubims* (Ezekiel 10:18); *And the cherubims lifted up their wings, and mounted up from the earth in my sight: when they went out, the wheels also were beside them, and every one stood at the door of the east gate of the LORD''S house; and the glory of the Elohim (God) of Yashar''el (Israel) was over them above* (Ezekiel 10:19). The Glory that fills the temple is no formless abstraction — it is the enthroned man-form of the opening vision: *upon the likeness of the throne was the likeness as the appearance of a man above upon it... This was the appearance of the likeness of the glory of Yahuah (LORD)* (Ezekiel 1:26,28). This is the FORMED Son — the visible One drawn from the formless Father, who appeared and spoke and led Yashar''el (Israel), Yahuah who has a Father — withdrawing by stages from the defiled house: from the cherub, to the threshold, to the cherubim, to the east gate. The departure is completed in the next chapter: *And the glory of Yahuah (LORD) went up from the midst of the city, and stood upon the mountain which is on the east side of the city* (Ezekiel 11:23) — the Mount of Olives. Centuries later Yahusha (Jesus) pronounces the verdict and walks it out: *Behold, your house is left unto you desolate* (Matthew 23:38); *And Yahusha (Jesus) went out, and departed from the temple* (Matthew 24:1) — the Glory leaving again by the east, over the same mountain. But the Glory that comes and goes RETURNS by the same gate it left: *the glory of the Elohim (God) of Yashar''el (Israel) came from the way of the east: and his voice was like a noise of many waters: and the earth shined with his glory* (Ezekiel 43:2); *And the glory of Yahuah (LORD) came into the house by the way of the gate whose prospect is toward the east* (Ezekiel 43:4). The withdrawal in judgment is answered by the return in restoration. The Glory that departs and returns, that comes and goes by a gate, is the Formed Son — never the formless Most High who fills heaven and earth and does not move, but the One who took flesh, departed, and will come again.',
       sv.verse_id, ev.verse_id, 'free', 32231
  FROM _s308_ezek10_lookup sv, _s308_ezek10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=10 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=10 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the angel took the censer, and filled it with fire of the altar, and cast it into the earth* (Revelation 8:5) — the same throne-fire-of-judgment: the censer of coals scattered over the city.'
  FROM cross_reference_threads t
  JOIN _s308_ezek10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=10 AND sv.verse_number=2
  JOIN _s308_ezek10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-10-coals-of-fire-scattered-over-the-city'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*set a mark upon the foreheads of the men that sigh and that cry* (Ezekiel 9:4) — the same man clothed with linen; the remnant is marked FIRST, then the fire falls.'
  FROM cross_reference_threads t
  JOIN _s308_ezek10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=10 AND sv.verse_number=2
  JOIN _s308_ezek10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=9 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-10-coals-of-fire-scattered-over-the-city'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *a lion... a calf... a face as a man... a flying eagle* (Revelation 4:7) — John sees the four-faced throne-creatures Ezekiel 10:14 names: cherub, man, lion, eagle.'
  FROM cross_reference_threads t
  JOIN _s308_ezek10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=10 AND sv.verse_number=14
  JOIN _s308_ezek10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-10-this-is-the-living-creature-the-cherubim-and-the-wheels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *four beasts full of eyes before and behind* (Revelation 4:6) — the cherubim *full of eyes round about* (Ezekiel 10:12), before the same throne.'
  FROM cross_reference_threads t
  JOIN _s308_ezek10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s308_ezek10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-10-this-is-the-living-creature-the-cherubim-and-the-wheels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *six wings... full of eyes within... Holy, holy, holy, Yahuah Elohim (Lord God) Almighty* (Revelation 4:8) — the same throne-attendants; the hands of a man under their wings (Ezekiel 10:21).'
  FROM cross_reference_threads t
  JOIN _s308_ezek10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=10 AND sv.verse_number=21
  JOIN _s308_ezek10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-10-this-is-the-living-creature-the-cherubim-and-the-wheels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the face of a man, and the face of a lion... the face of an ox... the face of an eagle* (Ezekiel 1:10) — the Chebar vision now named the cherubim (Ezekiel 10:20).'
  FROM cross_reference_threads t
  JOIN _s308_ezek10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=10 AND sv.verse_number=20
  JOIN _s308_ezek10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-10-this-is-the-living-creature-the-cherubim-and-the-wheels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*every one had four faces, and every one had four wings* (Ezekiel 1:6) — what ch.1 described, Ezekiel 10:20 names as the cherubim of the glory.'
  FROM cross_reference_threads t
  JOIN _s308_ezek10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=10 AND sv.verse_number=20
  JOIN _s308_ezek10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-10-this-is-the-living-creature-the-cherubim-and-the-wheels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the likeness of four living creatures... they had the likeness of a man* (Ezekiel 1:5) — the same creatures lifting the glory: *This is the living creature that I saw by the river of Chebar* (Ezekiel 10:15).'
  FROM cross_reference_threads t
  JOIN _s308_ezek10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=10 AND sv.verse_number=15
  JOIN _s308_ezek10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-10-this-is-the-living-creature-the-cherubim-and-the-wheels'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *the glory of Yahuah (LORD) went up from the midst of the city, and stood upon the mountain which is on the east side* (Ezekiel 11:23) — the departure completed: the Glory leaves to the Mount of Olives.'
  FROM cross_reference_threads t
  JOIN _s308_ezek10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=10 AND sv.verse_number=18
  JOIN _s308_ezek10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=11 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-10-the-glory-of-yahuah-departed-from-the-threshold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *Behold, your house is left unto you desolate* (Matthew 23:38) — when the Glory departs the threshold (Ezekiel 10:18), the house is left an empty shell.'
  FROM cross_reference_threads t
  JOIN _s308_ezek10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=10 AND sv.verse_number=18
  JOIN _s308_ezek10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-10-the-glory-of-yahuah-departed-from-the-threshold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Yahusha (Jesus) went out, and departed from the temple* (Matthew 24:1) — the Glory leaving again by the east, as the cherubim stood at the east gate (Ezekiel 10:19).'
  FROM cross_reference_threads t
  JOIN _s308_ezek10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=10 AND sv.verse_number=19
  JOIN _s308_ezek10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-10-the-glory-of-yahuah-departed-from-the-threshold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the glory of the Elohim (God) of Yashar''el (Israel) came from the way of the east* (Ezekiel 43:2) — the same Glory RETURNS by the gate it left (Ezekiel 10:19).'
  FROM cross_reference_threads t
  JOIN _s308_ezek10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=10 AND sv.verse_number=19
  JOIN _s308_ezek10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=43 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-10-the-glory-of-yahuah-departed-from-the-threshold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *the glory of Yahuah (LORD) came into the house by the way of the gate whose prospect is toward the east* (Ezekiel 43:4) — the withdrawal in judgment answered by the return in restoration.'
  FROM cross_reference_threads t
  JOIN _s308_ezek10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=10 AND sv.verse_number=19
  JOIN _s308_ezek10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=43 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-10-the-glory-of-yahuah-departed-from-the-threshold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezekiel_36.sql (Ezekiel 36) -----
-- Chapter: Ezekiel 36 — ★★★ KEYSTONE: the regathering of the scattered house to the mountains of
-- Yashar'el (Israel); cleansing for the Name's sake (NOT for their merit); the sprinkled clean water;
-- THE NEW HEART and the NEW SPIRIT that CAUSE Torah-keeping from within — the Torah written on the
-- heart, never abolished; the covenant formula "ye shall be my people, and I will be your Elohim (God)";
-- the desolate land made like the garden of Eden. The anti-antinomian heart-of-the-new-covenant chapter.
-- Tag: ezek36   Session: s308   Temp view: _s308_ezek36_lookup
-- Sort band: base 32875, step 3 -> threads at 32875, 32878, 32881, 32884, 32887 (5 threads)
-- Source of EVERY row: 'canon','ezekiel',36,v
--
-- Ezekiel 36 coverage:
--   v.1-15 (prophesy unto the mountains of Yashar'el; ye shall shoot forth your branches and yield your
--           fruit to my people; I will multiply men upon you, all the house of Yashar'el; the land an
--           inheritance, no more bereaving)
--        NT:     none warranted distinct (the land-restoration enacted; the two-house ingathering it serves
--                is carried in THREAD 3 from vv.24,28)
--        Extras: none warranted
--        Tanakh: held in prose — the multiplying of "all the house of Yashar'el" (v.10) feeds the
--                regathering thread (Ezekiel 37); not forced as a separate add
--   v.16-21 (they defiled the land... I scattered them among the heathen... they profaned my holy name...
--            But I had pity for mine holy name)
--        NT:     ★ Romans 2:24 (the name of God is blasphemed among the Gentiles through you) quotes the
--                profaned-Name charge of v.20-23 — placed in THREAD 4
--        Extras: none warranted
--        Tanakh: the scattering (v.19) = the two-house dispersion judgment (Deut 28/Deut 4); woven in
--                THREAD 3/4 prose, not a separate add
--   ★ v.22-23 (I do not this for your sakes, O house of Yashar'el, but for mine holy name's sake... And I
--           will sanctify my great name... when I shall be sanctified in you before their eyes)
--        NT:     ★ Romans 9:11 (not of works, but of him that calleth), ★ Romans 2:24 (the name of God is
--                blasphemed among the Gentiles through you), ★ Matthew 6:9 (Hallowed be thy name) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★ Isaiah 48:11 (For mine own sake... will I do it: for how should my name be polluted?
--                and I will not give my glory unto another) — THREAD 4 (the same Name-vindication)
--   ★★ v.24,28 (I will take you from among the heathen, and gather you out of all countries... And ye shall
--           dwell in the land that I gave to your fathers; and ye shall be my people, and I will be your
--           Elohim (God))
--        NT:     ★★ 2 Corinthians 6:16 (I will be their God, and they shall be my people) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★★ Ezekiel 37:21-22 (the two sticks made one nation), ★ Jeremiah 32:37-38 (gather them
--                out of all countries... they shall be my people), ★ Deuteronomy 30:3-5 (gather thee from
--                all the nations) — THREAD 3 (the two-house regathering + covenant formula)
--   ★★ v.25 (Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness,
--           and from all your idols, will I cleanse you)
--        NT:     ★★ Hebrews 10:22 (having our hearts sprinkled... and our bodies washed with pure water),
--                ★ John 3:5 (born of water and of the Spirit), ★ Titus 3:5 (the washing of regeneration) —
--                THREAD 2
--        Extras: none warranted
--        Tanakh: ★ Numbers 19:18 (a clean person shall take hyssop, and dip it in the water, and sprinkle
--                it... the water of separation) — THREAD 2 (the Torah's water of purification, lateral)
--   ★★★ v.26-27 (A new heart also will I give you, and a new spirit will I put within you... and I will put
--           my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and
--           do them)
--        NT:     ★★★ Hebrews 8:10 + Hebrews 10:16 (I will put my laws into their hearts), ★★ 2 Corinthians
--                3:3 (written... in fleshy tables of the heart), ★★ Romans 8:4 (the righteousness of the law
--                fulfilled in us), ★ 1 John 2:3 (we do know that we know him, if we keep his commandments) —
--                THREAD 1
--        Extras: none warranted
--        Tanakh: ★★★ Jeremiah 31:33 (I will put my law in their inward parts, and write it in their hearts),
--                ★★ Ezekiel 11:19-20 (a new spirit... that they may walk in my statutes) — THREAD 1
--   v.29-32 (I will save you from all your uncleannesses... Then shall ye remember your own evil ways, and
--            shall lothe yourselves... Not for your sakes do I this)
--        NT:     none warranted (the repentance that follows cleansing; the "not for your sakes" repeated
--                from v.22 — carried by THREAD 4)
--        Extras: none warranted
--        Tanakh: none separate (the loathing-of-self repentance answered by the new heart of vv.26-27)
--   ★ v.33-35 (In the day that I shall have cleansed you from all your iniquities I will also cause you to
--           dwell in the cities... And they shall say, This land that was desolate is become like the garden
--           of Eden)
--        NT:     ★ Revelation 22:1-2 (the pure river of water of life... the tree of life... for the healing
--                of the nations) — THREAD 5 (the Eden restored at the consummation)
--        Extras: none warranted
--        Tanakh: ★ Isaiah 51:3 (he will make her wilderness like Eden, and her desert like the garden of
--                Yahuah), ★ Amos 9:14-15 (I will bring again the captivity of my people... and plant them
--                upon their land) — THREAD 5 (the desolate land made Eden)
--   v.36-38 (the heathen shall know that I Yahuah build the ruined places... I will increase them with men
--            like a flock... as the flock of Jerusalem in her solemn feasts)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: held in prose — the "flock of Jerusalem in her solemn feasts" (v.38, the appointed-times
--                gathering) folds into the regathering thread; not forced as a separate add
--
-- Threads (slug — target libraries):
--   1. ezekiel-36-a-new-heart-and-a-new-spirit-the-torah-written-within — NT (Jeremiah 31, Hebrews 8, Hebrews 10, 2 Corinthians 3, Romans 8, 1 John 2) + Tanakh (Jeremiah 31, Ezekiel 11) [free]
--      (★★★ THE central thread: the Spirit CAUSES Torah-keeping from within; the Torah on the heart, NEVER abolished; the opposite of antinomianism)
--   2. ezekiel-36-then-will-i-sprinkle-clean-water-upon-you-and-ye-shall-be-clean — NT (Hebrews 10, John 3, Titus 3) + Tanakh (Numbers 19) [free]
--      (★★ the cleansing that precedes the new heart; sprinkled water + washing; the Torah's water of purification fulfilled)
--   3. ezekiel-36-i-will-gather-you-and-ye-shall-be-my-people-the-two-house-regathering — NT (2 Corinthians 6) + Tanakh (Ezekiel 37, Jeremiah 32, Deuteronomy 30) [free]
--      (★★ the scattered house regathered to the land + covenant formula; the two sticks made one; NOT replacement)
--   4. ezekiel-36-not-for-your-sakes-but-for-mine-holy-names-sake — NT (Romans 9, Romans 2, Matthew 6) + Tanakh (Isaiah 48) [free]
--      (★ the Name vindicated; grace not by their merit, flesh-merit excluded NOT Torah abolished; the profaned Name made holy)
--   5. ezekiel-36-this-land-that-was-desolate-is-become-like-the-garden-of-eden — NT (Revelation 22) + Tanakh (Isaiah 51, Amos 9) [free]
--      (★ the restored land made like Eden; the consummation river and tree of life)
--
-- Framing notes:
--   ★★★ THE NEW HEART — THE TORAH WRITTEN WITHIN (THREAD 1): *A new heart also will I give you, and a new
--      spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give
--      you an heart of flesh. And I will put my spirit within you, and cause you to walk in my statutes, and
--      ye shall keep my judgments, and do them* (Ezekiel 36:26-27). This is the heart of the new covenant,
--      and the lens reads it exactly as written: the Spirit is given so that the people WALK IN THE STATUTES
--      and KEEP THE JUDGMENTS — the Torah is not replaced, it is written within. Jeremiah says the same:
--      *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33); Hebrews
--      quotes that very covenant TWICE (8:10; 10:16); Paul names the believers an epistle *written... in
--      fleshy tables of the heart* (2 Corinthians 3:3) and the end of the Spirit-walk *that the righteousness
--      of the law might be fulfilled in us* (Romans 8:4); and John gives the filter — *hereby we do know that
--      we know him, if we keep his commandments* (1 John 2:3). The Spirit and the Torah are INSEPARABLE; the
--      new heart is the heart that keeps the commandments. This is the OPPOSITE of antinomianism. Ezekiel
--      himself gave the same promise earlier — *that they may walk in my statutes, and keep mine ordinances*
--      (Ezekiel 11:20).
--   ★★ THE SPRINKLED CLEAN WATER (THREAD 2): *Then will I sprinkle clean water upon you, and ye shall be
--      clean: from all your filthiness, and from all your idols, will I cleanse you* (Ezekiel 36:25) — the
--      cleansing that PRECEDES the new heart. Hebrews names it: *having our hearts sprinkled from an evil
--      conscience, and our bodies washed with pure water* (Hebrews 10:22); the Master tells Nicodemus a man
--      must be *born of water and of the Spirit* (John 3:5); Paul names *the washing of regeneration*
--      (Titus 3:5). The Torah's own water of purification is the type — *a clean person shall take hyssop,
--      and dip it in the water, and sprinkle it... the water of separation* (Numbers 19:18). The sprinkling
--      cleanses; then the new heart is given.
--   ★★ I WILL GATHER YOU — YE SHALL BE MY PEOPLE (THREAD 3): *For I will take you from among the heathen,
--      and gather you out of all countries, and will bring you into your own land* (Ezekiel 36:24), *And ye
--      shall dwell in the land that I gave to your fathers; and ye shall be my people, and I will be your
--      Elohim (God)* (Ezekiel 36:28). This is the two-house regathering and the covenant formula. Three
--      chapters later the SAME prophet shows the two sticks made one — *I will take the children of Yashar''el
--      (Israel) from among the heathen... and I will make them one nation* (Ezekiel 37:21-22). Jeremiah
--      promises the gathering and the formula — *I will gather them out of all countries... And they shall be
--      my people, and I will be their Elohim (God)* (Jeremiah 32:37-38). Moses spoke it first — *gather thee
--      from all the nations* (Deuteronomy 30:3). Paul applies the covenant formula to the regathered people —
--      *I will be their God, and they shall be my people* (2 Corinthians 6:16). NOT a new people grafted by
--      confession; the scattered house brought home.
--   ★ NOT FOR YOUR SAKES, BUT FOR MINE HOLY NAME'S SAKE (THREAD 4): *I do not this for your sakes, O house
--      of Yashar''el (Israel), but for mine holy name''s sake, which ye have profaned among the heathen*
--      (Ezekiel 36:22), *And I will sanctify my great name* (Ezekiel 36:23). The deliverance is not earned —
--      flesh-merit is excluded, exactly as Paul says the purpose stands *not of works, but of him that
--      calleth* (Romans 9:11). The profaned Name is the same charge Paul quotes — *the name of God is
--      blasphemed among the Gentiles through you, as it is written* (Romans 2:24). Isaiah says it in the same
--      breath — *for how should my name be polluted? and I will not give my glory unto another* (Isaiah
--      48:11) — and the Master teaches the prayer that answers it — *Hallowed be thy name* (Matthew 6:9).
--      Grace not by their merit is NOT Torah abolished; it is the Name vindicated and then the new heart given
--      that keeps the Torah (vv.26-27).
--   ★ LIKE THE GARDEN OF EDEN (THREAD 5): *And they shall say, This land that was desolate is become like the
--      garden of Eden* (Ezekiel 36:35). The restored land is Eden brought back. Isaiah sings it — *he will
--      make her wilderness like Eden, and her desert like the garden of Yahuah (LORD)* (Isaiah 51:3); Amos
--      seals it — *I will bring again the captivity of my people of Yashar''el (Israel)... And I will plant
--      them upon their land* (Amos 9:14-15); and Revelation shows the consummation — *a pure river of water
--      of life... the tree of life... for the healing of the nations* (Revelation 22:1-2). The Eden lost in
--      Genesis is the Eden restored to the regathered people.
--   VERSES WITH NO SEPARATE ADD: v.1-15 (the mountains of Yashar'el restored, the land an inheritance — feeds
--      the regathering thread, not forced), v.16-21 (the scattering + profaned Name — carried by THREADS 3/4),
--      v.29-32 (cleansing + self-loathing repentance — answered by the new heart of vv.26-27), v.36-38 (the
--      flock of Jerusalem in her solemn feasts — folds into the regathering). All recorded above.

CREATE TEMP VIEW _s308_ezek36_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): a new heart and a new spirit — the Torah written within
    ('canon','ezekiel',36,27,'canon','jeremiah',31,33,'free',
      E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). Jeremiah names the new covenant the SAME thing Ezekiel does: the Torah put within. Where Ezekiel says *I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27), Jeremiah says *I will put my law in their inward parts, and write it in their hearts* — one promise, the Torah on the heart, never abolished but interiorized.'),
    ('canon','ezekiel',36,27,'canon','hebrews',8,10,'free',
      E'*For this is the covenant that I will make with the house of Yashar''el (Israel) after those days, saith Yahuah (Lord); I will put my laws into their mind, and write them in their hearts: and I will be to them a Elohim (God), and they shall be to me a people* (Hebrews 8:10). Hebrews quotes the new-covenant promise word for word — *I will put my laws into their mind, and write them in their hearts*. The new covenant is the LAW written within, exactly as Ezekiel promised the Spirit would *cause you to walk in my statutes* (Ezekiel 36:27). The Torah is not retired; it is engraved on the heart.'),
    ('canon','ezekiel',36,27,'canon','hebrews',10,16,'free',
      E'*This is the covenant that I will make with them after those days, saith Yahuah (Lord), I will put my laws into their hearts, and in their minds will I write them* (Hebrews 10:16). Hebrews quotes the covenant a SECOND time — the laws put into the heart. This is the very thing Ezekiel said the new spirit would do: *cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The new covenant CAUSES Torah-keeping; it does not abolish it.'),
    ('canon','ezekiel',36,26,'canon','2-corinthians',3,3,'free',
      E'*Forasmuch as ye are manifestly declared to be the epistle of Messiah (Christ) ministered by us, written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3). Paul names the believers a letter *written... in fleshy tables of the heart* — the very *heart of flesh* Ezekiel promised in place of *the stony heart out of your flesh* (Ezekiel 36:26). The Spirit writes on the heart of flesh what the stone tablets could only stand before; the same instruction, now within.'),
    ('canon','ezekiel',36,27,'canon','romans',8,4,'free',
      E'*That the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit* (Romans 8:4). Paul names the END of the Spirit-walk exactly as Ezekiel does: the Spirit is given so *that the righteousness of the law might be fulfilled in us*. Ezekiel says the same — *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments* (Ezekiel 36:27). The Spirit and the law are inseparable; walking after the Spirit IS the law fulfilled in us.'),
    ('canon','ezekiel',36,27,'canon','1-john',2,3,'free',
      E'*And hereby we do know that we know him, if we keep his commandments* (1 John 2:3). John gives the filter that Ezekiel''s new heart makes possible: knowing him is bound to keeping his commandments. The new spirit that causes the people to *walk in my statutes, and... keep my judgments, and do them* (Ezekiel 36:27) is the same spirit that makes commandment-keeping the mark of the redeemed — *He that saith, I know him, and keepeth not his commandments, is a liar* (1 John 2:4). The heart of flesh is the heart that keeps the Torah.'),
    ('canon','ezekiel',36,26,'canon','ezekiel',11,19,'free',
      E'*And I will give them one heart, and I will put a new spirit within you; and I will take the stony heart out of their flesh, and will give them an heart of flesh* (Ezekiel 11:19). Ezekiel gave this promise once already, almost word for word — *I will take the stony heart out of their flesh, and will give them an heart of flesh*. The same prophet binds the gift to its purpose: *That they may walk in my statutes, and keep mine ordinances, and do them* (Ezekiel 11:20). The new heart exists to keep the Torah.'),
    ('canon','ezekiel',36,27,'canon','ezekiel',11,20,'free',
      E'*That they may walk in my statutes, and keep mine ordinances, and do them: and they shall be my people, and I will be their Elohim (God)* (Ezekiel 11:20). The earlier giving of the new heart names its purpose exactly as 36:27 does — *that they may walk in my statutes, and keep mine ordinances, and do them*. Two chapters, one promise: the heart of flesh is given so the people DO the commandments. The Torah is the inheritance the new spirit equips them to keep, never the thing it removes.'),

    -- THREAD 2 (★★): then will I sprinkle clean water upon you, and ye shall be clean
    ('canon','ezekiel',36,25,'canon','hebrews',10,22,'free',
      E'*Let us draw near with a true heart in full assurance of faith, having our hearts sprinkled from an evil conscience, and our bodies washed with pure water* (Hebrews 10:22). Hebrews names the very cleansing Ezekiel promised — *having our hearts sprinkled... and our bodies washed with pure water* answers *Then will I sprinkle clean water upon you, and ye shall be clean* (Ezekiel 36:25). The sprinkled water that cleanses from filthiness is fulfilled in the heart sprinkled clean and the body washed pure.'),
    ('canon','ezekiel',36,25,'canon','john',3,5,'free',
      E'*Yahusha (Jesus) answered, Verily, verily, I say unto thee, Except a man be born of water and of the Spirit, he cannot enter into the kingdom of Elohim (God)* (John 3:5). The Master joins the two halves of Ezekiel''s promise — *water and... the Spirit* — exactly as Ezekiel set them: first *I will sprinkle clean water upon you, and ye shall be clean* (Ezekiel 36:25), then *I will put my spirit within you* (36:27). To be born again is to be cleansed by the water and given the new spirit.'),
    ('canon','ezekiel',36,25,'canon','titus',3,5,'free',
      E'*Not by works of righteousness which we have done, but according to his mercy he saved us, by the washing of regeneration, and renewing of the Ruach HaKodesh (Holy Spirit)* (Titus 3:5). Paul names the cleansing *the washing of regeneration, and renewing of the Ruach HaKodesh (Holy Spirit)* — the washing and the renewing Spirit set side by side, as Ezekiel set the *clean water* (36:25) before *my spirit within you* (36:27). The cleansing is *not by works of righteousness which we have done* but by his mercy — the same grace-not-merit that opens Ezekiel 36.'),
    ('canon','ezekiel',36,25,'canon','numbers',19,18,'free',
      E'*And a clean person shall take hyssop, and dip it in the water, and sprinkle it upon the tent, and upon all the vessels, and upon the persons that were there, and upon him that touched a bone, or one slain, or one dead, or a grave* (Numbers 19:18). The Torah''s own water of purification is the type behind Ezekiel''s promise — the *water of separation* sprinkled with hyssop to cleanse the defiled (Numbers 19:9,18) is the figure of *Then will I sprinkle clean water upon you, and ye shall be clean* (Ezekiel 36:25). The Torah taught the sprinkling that cleanses; Ezekiel promises the cleansing fulfilled.'),

    -- THREAD 3 (★★): I will gather you out of all countries — ye shall be my people
    ('canon','ezekiel',36,28,'canon','2-corinthians',6,16,'free',
      E'*And what agreement hath the temple of Elohim (God) with idols? for ye are the temple of the living Elohim (God); as Elohim (God) hath said, I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16). Paul applies the covenant formula word for word — *I will be their God, and they shall be my people* — to the gathered people, exactly as Ezekiel sealed the regathering: *ye shall be my people, and I will be your Elohim (God)* (Ezekiel 36:28). The same formula, the same restored people; not a new nation, the scattered house owned again.'),
    ('canon','ezekiel',36,24,'canon','ezekiel',37,21,'free',
      E'*And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21). One chapter later Ezekiel says the gathering again, almost word for word — *I will take the children of Yashar''el (Israel) from among the heathen... and bring them into their own land* — answering *I will take you from among the heathen, and gather you out of all countries* (Ezekiel 36:24). The two sticks of 37:16-22 are made one nation; the regathering is the two-house people brought home.'),
    ('canon','ezekiel',36,24,'canon','ezekiel',37,22,'free',
      E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The regathering of 36:24 is the two divided houses — Yahudah (Judah) and Yosef/Ephraim — made *one nation*, *no more two nations*. The scattered northern house is not replaced; it is gathered with the south and made one stick in the hand of Yahuah (LORD).'),
    ('canon','ezekiel',36,28,'canon','jeremiah',32,38,'free',
      E'*And they shall be my people, and I will be their Elohim (God)* (Jeremiah 32:38). Jeremiah seals the gathering of the scattered people with the SAME covenant formula Ezekiel uses — *they shall be my people, and I will be their Elohim (God)* answers *ye shall be my people, and I will be your Elohim (God)* (Ezekiel 36:28). Both follow the promise to *gather them out of all countries* (Jeremiah 32:37); the formula belongs to the regathered house.'),
    ('canon','ezekiel',36,24,'canon','jeremiah',32,37,'free',
      E'*Behold, I will gather them out of all countries, whither I have driven them in mine anger, and in my fury, and in great wrath; and I will bring them again unto this place, and I will cause them to dwell safely* (Jeremiah 32:37). Jeremiah promises exactly what Ezekiel promises — *I will gather them out of all countries... and I will bring them again unto this place* answers *gather you out of all countries, and will bring you into your own land* (Ezekiel 36:24). The same scattered house, the same gathering home to dwell safely.'),
    ('canon','ezekiel',36,24,'canon','deuteronomy',30,3,'free',
      E'*That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3). Moses promised the regathering first — *gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* — the root behind *gather you out of all countries* (Ezekiel 36:24). And Moses bound it to the same new heart: *Yahuah Elohayka (the LORD thy God) will circumcise thine heart... to love Yahuah* (Deuteronomy 30:6). The Torah itself foretold the gathering and the heart Ezekiel now promises.'),

    -- THREAD 4 (★): not for your sakes, but for mine holy name's sake
    ('canon','ezekiel',36,22,'canon','romans',9,11,'free',
      E'*(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* (Romans 9:11). Paul names the principle Ezekiel opens with — the purpose stands *not of works, but of him that calleth*, exactly as *I do not this for your sakes, O house of Yashar''el (Israel), but for mine holy name''s sake* (Ezekiel 36:22). Flesh-merit is excluded; the deliverance is for the Name''s sake, not their earning. This is grace not by merit — and it is NOT the Torah set aside, for the same chapter then writes the Torah on the heart (36:27).'),
    ('canon','ezekiel',36,23,'canon','romans',2,24,'free',
      E'*For the name of Elohim (God) is blasphemed among the Gentiles through you, as it is written* (Romans 2:24). Paul quotes the very charge Ezekiel makes — Yashar''el *profaned my holy name* among the heathen (Ezekiel 36:20-23); *the name of God is blasphemed among the Gentiles through you*. Where the scattered people profaned the Name by their sin, Yahuah (LORD) answers *I will sanctify my great name... when I shall be sanctified in you before their eyes* (Ezekiel 36:23) — the profaned Name made holy by the cleansed people.'),
    ('canon','ezekiel',36,23,'canon','matthew',6,9,'free',
      E'*After this manner therefore pray ye: Our Father which art in heaven, Hallowed be thy name* (Matthew 6:9). The prayer the Master teaches asks for the very thing Ezekiel promises — *Hallowed be thy name* answers *And I will sanctify my great name, which was profaned among the heathen* (Ezekiel 36:23). The Name profaned among the nations is the Name the redeemed pray to see hallowed; Yahuah (LORD) sanctifies it in his people before the eyes of the heathen.'),
    ('canon','ezekiel',36,22,'canon','isaiah',48,11,'free',
      E'*For mine own sake, even for mine own sake, will I do it: for how should my name be polluted? and I will not give my glory unto another* (Isaiah 48:11). Isaiah says the same as Ezekiel in the same breath — the deliverance is *for mine own sake*, lest *my name be polluted*, exactly as *I do not this for your sakes... but for mine holy name''s sake* (Ezekiel 36:22). The redemption guards the Name and the glory; it is not earned by the people but accomplished for the Name''s sake.'),

    -- THREAD 5 (★): this land that was desolate is become like the garden of Eden
    ('canon','ezekiel',36,35,'canon','isaiah',51,3,'free',
      E'*For Yahuah (LORD) shall comfort Zion: he will comfort all her waste places; and he will make her wilderness like Eden, and her desert like the garden of Yahuah (LORD); joy and gladness shall be found therein, thanksgiving, and the voice of melody* (Isaiah 51:3). Isaiah sings the same restoration Ezekiel foretells — *he will make her wilderness like Eden, and her desert like the garden of Yahuah (LORD)* answers *This land that was desolate is become like the garden of Eden* (Ezekiel 36:35). The desolate land made Eden again, with joy and gladness and the voice of melody.'),
    ('canon','ezekiel',36,35,'canon','amos',9,14,'free',
      E'*And I will bring again the captivity of my people of Yashar''el (Israel), and they shall build the waste cities, and inhabit them; and they shall plant vineyards, and drink the wine thereof; they shall also make gardens, and eat the fruit of them* (Amos 9:14). Amos seals the restored land — *build the waste cities, and inhabit them... make gardens, and eat the fruit* answers Ezekiel''s *the waste and desolate and ruined cities are become fenced, and are inhabited* (Ezekiel 36:35). The regathered people plant and eat in the land made Eden again — *And I will plant them upon their land, and they shall no more be pulled up* (Amos 9:15).'),
    ('canon','ezekiel',36,35,'canon','revelation',22,1,'free',
      E'*And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1). The Eden Ezekiel sees restored to the land — *This land that was desolate is become like the garden of Eden* (Ezekiel 36:35) — reaches its consummation in the river of life of the New Jerusalem, *the tree of life... for the healing of the nations* (Revelation 22:2). The garden lost in Genesis is the garden restored to the regathered people and consummated in the city of Elohim (God).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-36-a-new-heart-and-a-new-spirit-the-torah-written-within',
       E'A new heart and a new spirit — the Torah written within, that ye may walk in my statutes',
       E'This is the heart of the new covenant, and it must be read exactly as it is written: *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh. And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:26-27). The new spirit is given for a purpose, and the purpose is stated plainly — *cause you to walk in my statutes, and ye shall keep my judgments, and do them*. The Torah is not replaced; it is written within. Jeremiah names the new covenant the very same thing: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). Hebrews quotes that covenant TWICE — *I will put my laws into their mind, and write them in their hearts* (Hebrews 8:10), *I will put my laws into their hearts, and in their minds will I write them* (Hebrews 10:16). Paul names the believers an epistle *written... not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3) — the *heart of flesh* given in place of the stony heart — and he names the end of the Spirit-walk *that the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit* (Romans 8:4). Ezekiel himself had already given the promise once, binding the new heart to its purpose: *that they may walk in my statutes, and keep mine ordinances, and do them* (Ezekiel 11:19-20). And John gives the filter the whole thing produces — *hereby we do know that we know him, if we keep his commandments* (1 John 2:3). The Spirit and the Torah are INSEPARABLE: the heart of flesh is the heart that keeps the commandments. This is the very OPPOSITE of antinomianism — the new covenant does not abolish the law, it engraves it on the heart and gives the Spirit to do it.',
       sv.verse_id, ev.verse_id, 'free', 32875
  FROM _s308_ezek36_lookup sv, _s308_ezek36_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=36 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-36-then-will-i-sprinkle-clean-water-upon-you-and-ye-shall-be-clean',
       E'Then will I sprinkle clean water upon you — the cleansing that precedes the new heart',
       E'Before the new heart is given, the people are cleansed: *Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you* (Ezekiel 36:25). The sprinkled water comes first, then the new heart and the new spirit (36:26-27). The Torah taught the figure — the *water of separation* prepared from the ashes of the red heifer, applied with hyssop: *a clean person shall take hyssop, and dip it in the water, and sprinkle it... upon the persons that were there* (Numbers 19:18). Hebrews names the cleansing fulfilled — *having our hearts sprinkled from an evil conscience, and our bodies washed with pure water* (Hebrews 10:22). The Master joins the same two halves Ezekiel set together when he tells Nicodemus a man must be *born of water and of the Spirit* (John 3:5) — the sprinkled water and the indwelling Spirit. And Paul names it *the washing of regeneration, and renewing of the Ruach HaKodesh (Holy Spirit)* (Titus 3:5), *not by works of righteousness which we have done, but according to his mercy* — the same grace-not-merit that opens this whole chapter. The sprinkling cleanses; then the heart of flesh is given.',
       sv.verse_id, ev.verse_id, 'free', 32878
  FROM _s308_ezek36_lookup sv, _s308_ezek36_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=36 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-36-i-will-gather-you-and-ye-shall-be-my-people-the-two-house-regathering',
       E'I will gather you out of all countries — ye shall be my people, and I will be your Elohim',
       E'The promise that frames the new heart is the regathering of the scattered house: *For I will take you from among the heathen, and gather you out of all countries, and will bring you into your own land* (Ezekiel 36:24), and the covenant formula that seals it — *And ye shall dwell in the land that I gave to your fathers; and ye shall be my people, and I will be your Elohim (God)* (Ezekiel 36:28). This is the two-house people, divided after Solomon and scattered, brought home. One chapter later the same prophet shows it as two sticks made one: *Behold, I will take the children of Yashar''el (Israel) from among the heathen... and will gather them on every side, and bring them into their own land* (Ezekiel 37:21), *And I will make them one nation in the land upon the mountains of Yashar''el (Israel)... and they shall be no more two nations* (Ezekiel 37:22) — Yahudah (Judah) and Yosef/Ephraim made one in the hand of Yahuah (LORD). Jeremiah promises the same gathering and the same formula: *I will gather them out of all countries... and I will bring them again unto this place* (Jeremiah 32:37), *And they shall be my people, and I will be their Elohim (God)* (Jeremiah 32:38). And Moses foretold it first, binding the gathering to the very heart this chapter gives: *Yahuah Elohayka (the LORD thy God) will... return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3), *and circumcise thine heart* (30:6). Paul lays the covenant formula on the regathered people — *I will be their God, and they shall be my people* (2 Corinthians 6:16). This is NOT a new people grafted in by confession replacing Yashar''el (Israel); it is the scattered house — both branches — gathered, cleansed, and owned again as his people.',
       sv.verse_id, ev.verse_id, 'free', 32881
  FROM _s308_ezek36_lookup sv, _s308_ezek36_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=36 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-36-not-for-your-sakes-but-for-mine-holy-names-sake',
       E'Not for your sakes, but for mine holy name''s sake — the Name vindicated',
       E'The deliverance is not earned: *Therefore say unto the house of Yashar''el (Israel), Thus saith Adonai Yahuah (the Lord GOD); I do not this for your sakes, O house of Yashar''el (Israel), but for mine holy name''s sake, which ye have profaned among the heathen* (Ezekiel 36:22), *And I will sanctify my great name, which was profaned among the heathen... when I shall be sanctified in you before their eyes* (Ezekiel 36:23). Flesh-merit is excluded — the redemption is for the Name''s sake, not their earning — exactly the principle Paul names: the purpose stands *not of works, but of him that calleth* (Romans 9:11). The charge of the profaned Name is the one Paul quotes: *For the name of Elohim (God) is blasphemed among the Gentiles through you, as it is written* (Romans 2:24). Isaiah says it in the same breath — *For mine own sake, even for mine own sake, will I do it: for how should my name be polluted? and I will not give my glory unto another* (Isaiah 48:11). And the prayer the Master teaches asks for the very thing Ezekiel promises: *Hallowed be thy name* (Matthew 6:9) answers *I will sanctify my great name*. Mark the framework carefully: grace not by their merit is NOT the Torah set aside. The very same chapter that says *not for your sakes* then sprinkles them clean (36:25) and writes the Torah on their heart (36:27). The Name is vindicated, the people cleansed, and the law given within — never abolished, but interiorized.',
       sv.verse_id, ev.verse_id, 'free', 32884
  FROM _s308_ezek36_lookup sv, _s308_ezek36_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=36 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-36-this-land-that-was-desolate-is-become-like-the-garden-of-eden',
       E'This land that was desolate is become like the garden of Eden',
       E'The cleansing and the new heart bear fruit in the land itself: *In the day that I shall have cleansed you from all your iniquities I will also cause you to dwell in the cities, and the wastes shall be builded. And the desolate land shall be tilled, whereas it lay desolate in the sight of all that passed by. And they shall say, This land that was desolate is become like the garden of Eden; and the waste and desolate and ruined cities are become fenced, and are inhabited* (Ezekiel 36:33-35). The desolate land is made Eden again. Isaiah sings the same: *he will make her wilderness like Eden, and her desert like the garden of Yahuah (LORD); joy and gladness shall be found therein* (Isaiah 51:3). Amos seals it for the regathered people: *I will bring again the captivity of my people of Yashar''el (Israel), and they shall build the waste cities, and inhabit them; and they shall plant vineyards... and make gardens, and eat the fruit of them* (Amos 9:14), *And I will plant them upon their land, and they shall no more be pulled up* (Amos 9:15). And the whole arc reaches its consummation in Revelation, where Eden is fully restored — *a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1), *the tree of life... and the leaves of the tree were for the healing of the nations* (Revelation 22:2). The garden lost in Genesis is the garden restored to the cleansed, regathered, new-hearted people.',
       sv.verse_id, ev.verse_id, 'free', 32887
  FROM _s308_ezek36_lookup sv, _s308_ezek36_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=33
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=36 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33) — the new covenant named identically: the Torah put within, never abolished.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=27
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-a-new-heart-and-a-new-spirit-the-torah-written-within'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *I will put my laws into their mind, and write them in their hearts* (Hebrews 8:10) — the new covenant quoted; the law written within, exactly Ezekiel 36:27.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=27
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-a-new-heart-and-a-new-spirit-the-torah-written-within'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★★ *I will put my laws into their hearts, and in their minds will I write them* (Hebrews 10:16) — the covenant quoted a second time; the new covenant CAUSES Torah-keeping, does not abolish it.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=27
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-a-new-heart-and-a-new-spirit-the-torah-written-within'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3) — the *heart of flesh* of Ezekiel 36:26; the Spirit writes the instruction within.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=26
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=3 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-a-new-heart-and-a-new-spirit-the-torah-written-within'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *That the righteousness of the law might be fulfilled in us, who walk... after the Spirit* (Romans 8:4) — the Spirit-walk IS the law fulfilled; inseparable, as Ezekiel 36:27.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=27
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-a-new-heart-and-a-new-spirit-the-torah-written-within'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *hereby we do know that we know him, if we keep his commandments* (1 John 2:3) — the filter the new heart produces; commandment-keeping is the mark of the redeemed.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=27
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-a-new-heart-and-a-new-spirit-the-torah-written-within'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *I will take the stony heart out of their flesh, and will give them an heart of flesh* (Ezekiel 11:19) — the same prophet''s earlier giving of the new heart, almost word for word.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=26
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=11 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-a-new-heart-and-a-new-spirit-the-torah-written-within'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *That they may walk in my statutes, and keep mine ordinances, and do them* (Ezekiel 11:20) — the new heart''s stated purpose: to DO the commandments; the Torah is the inheritance it equips them to keep.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=27
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=11 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-a-new-heart-and-a-new-spirit-the-torah-written-within'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *having our hearts sprinkled... and our bodies washed with pure water* (Hebrews 10:22) — the sprinkled clean water of Ezekiel 36:25 fulfilled.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=25
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-then-will-i-sprinkle-clean-water-upon-you-and-ye-shall-be-clean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Except a man be born of water and of the Spirit* (John 3:5) — the Master joins the two halves Ezekiel set: clean water (36:25), then the Spirit (36:27).'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=25
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-then-will-i-sprinkle-clean-water-upon-you-and-ye-shall-be-clean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the washing of regeneration, and renewing of the Ruach HaKodesh (Holy Spirit)* (Titus 3:5) — washing + renewing Spirit, as Ezekiel set water before spirit; *not by works... but according to his mercy*.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=25
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='titus' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-then-will-i-sprinkle-clean-water-upon-you-and-ye-shall-be-clean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *a clean person shall take hyssop, and dip it in the water, and sprinkle it* (Numbers 19:18) — the Torah''s water of separation, the type behind the sprinkled clean water of Ezekiel 36:25.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=25
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=19 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-then-will-i-sprinkle-clean-water-upon-you-and-ye-shall-be-clean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I will be their God, and they shall be my people* (2 Corinthians 6:16) — the covenant formula of Ezekiel 36:28 applied to the regathered people.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=28
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-i-will-gather-you-and-ye-shall-be-my-people-the-two-house-regathering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I will take the children of Yashar''el (Israel) from among the heathen... and bring them into their own land* (Ezekiel 37:21) — the same gathering, one chapter later; the two sticks made one.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=24
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-i-will-gather-you-and-ye-shall-be-my-people-the-two-house-regathering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *I will make them one nation... and they shall be no more two nations* (Ezekiel 37:22) — the regathering is Yahudah and Ephraim made one; the scattered house not replaced but joined.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=24
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-i-will-gather-you-and-ye-shall-be-my-people-the-two-house-regathering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *I will gather them out of all countries... and I will bring them again unto this place* (Jeremiah 32:37) — the same gathering home to dwell safely.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=24
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=32 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-i-will-gather-you-and-ye-shall-be-my-people-the-two-house-regathering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *And they shall be my people, and I will be their Elohim (God)* (Jeremiah 32:38) — the covenant formula sealing Jeremiah''s gathering, identical to Ezekiel 36:28.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=28
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=32 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-i-will-gather-you-and-ye-shall-be-my-people-the-two-house-regathering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3) — Moses foretold the regathering and the heart Ezekiel now gives.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=24
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-i-will-gather-you-and-ye-shall-be-my-people-the-two-house-regathering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *not of works, but of him that calleth* (Romans 9:11) — Ezekiel''s *not for your sakes* (36:22); flesh-merit excluded, the redemption for the Name''s sake.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=22
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-not-for-your-sakes-but-for-mine-holy-names-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the name of God is blasphemed among the Gentiles through you, as it is written* (Romans 2:24) — the profaned-Name charge of Ezekiel 36:20-23, quoted.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=23
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-not-for-your-sakes-but-for-mine-holy-names-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Hallowed be thy name* (Matthew 6:9) — the prayer that answers *I will sanctify my great name* (Ezekiel 36:23).'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=23
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-not-for-your-sakes-but-for-mine-holy-names-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *for how should my name be polluted? and I will not give my glory unto another* (Isaiah 48:11) — Isaiah''s *for mine own sake* matches *not for your sakes... but for mine holy name''s sake* (Ezekiel 36:22).'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=22
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=48 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-not-for-your-sakes-but-for-mine-holy-names-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *he will make her wilderness like Eden, and her desert like the garden of Yahuah (LORD)* (Isaiah 51:3) — the desolate land made Eden again, as Ezekiel 36:35.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=35
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-this-land-that-was-desolate-is-become-like-the-garden-of-eden'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *they shall build the waste cities, and inhabit them... and make gardens, and eat the fruit* (Amos 9:14) — the regathered people plant and eat in the land made Eden; *no more be pulled up* (9:15).'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=35
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=9 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-this-land-that-was-desolate-is-become-like-the-garden-of-eden'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *a pure river of water of life... the tree of life... for the healing of the nations* (Revelation 22:1-2) — the Eden of Ezekiel 36:35 consummated in the New Jerusalem.'
  FROM cross_reference_threads t
  JOIN _s308_ezek36_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=36 AND sv.verse_number=35
  JOIN _s308_ezek36_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-36-this-land-that-was-desolate-is-become-like-the-garden-of-eden'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezekiel_37.sql (Ezekiel 37) -----
-- Chapter: Ezekiel 37 — ★★★ THE TWO-HOUSE KEYSTONE of the whole framework. The valley of dry bones
-- raised by the Ruach (Spirit), the WHOLE house of Yashar''el (Israel) brought up out of the graves and
-- back to the land; THE TWO STICKS — Yahudah (Judah) and Joseph/Ephraim — written, joined, made ONE in
-- the prophet's hand; one nation, one king, no more two kingdoms; David my servant the one Shepherd-King;
-- the everlasting covenant of peace and Yahuah's sanctuary/tabernacle set in their midst for evermore.
-- This chapter IS the two-house doctrine: BOTH houses are Yashar''el, divorced and scattered, gathered
-- and made one — never replacement, never a new people grafted in by confession.
-- Tag: ezek37   Temp view: _s308_ezek37_lookup
-- Sort band: base 32900, step 3 -> 32900, 32903, 32906, 32909, 32912, 32915, 32918 (7 threads)
-- Source of EVERY row: 'canon','ezekiel',37,v
--
-- Ezekiel 37 coverage:
--   ★★★ v.1-10 (the valley of dry bones; can these bones live?; come from the four winds, O breath, and
--          breathe upon these slain; the breath came into them, and they lived, and stood up upon their
--          feet, an exceeding great army)
--        NT:     ★★★ Revelation 11:11 (the Spirit of life from Elohim entered into them, and they stood
--                upon their feet), ★★ John 5:28-29 (all that are in the graves shall hear his voice, and
--                shall come forth), ★ Romans 8:11 (the Spirit... shall also quicken your mortal bodies) — THREAD 1
--        Extras: none warranted (clean canon-NT-Tanakh resurrection weave)
--        Tanakh: ★ Isaiah 26:19 (thy dead men shall live... awake and sing, ye that dwell in dust) — THREAD 1
--   ★★★ v.11-14 (these bones are the whole house of Yashar''el; our hope is lost; I will open your graves,
--          and bring you into the land of Yashar''el; I shall put my spirit in you)
--        NT:     none warranted distinct (the national resurrection of the WHOLE house; NT resurrection
--                weave held in THREAD 1; the Spirit-put-within belongs to the Ezek 36 lateral)
--        Extras: none warranted
--        Tanakh: ★★ Hosea 6:2 (after two days will he revive us: in the third day he will raise us up),
--                ★ Hosea 13:14 (I will ransom them from the power of the grave), ★★ Ezekiel 36:27 (I will
--                put my spirit within you, and cause you to walk in my statutes) — THREAD 2
--   ★★★ v.15-19 (THE TWO STICKS: one stick For Yahudah; another For Joseph, the stick of Ephraim, and for
--          all the house of Yashar''el; join them into one stick; they shall become one in thine hand)
--        NT:     ★★★ John 10:16 (other sheep I have, which are not of this fold... one fold, and one
--                shepherd), ★★ Revelation 11:3-4 (my two witnesses... the two olive trees — per Yoshi's
--                frame the two houses, NOT two individuals) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★★ Hosea 1:11 (the children of Yahudah and the children of Yashar''el be gathered
--                together, and appoint themselves one head), ★ Jeremiah 3:18 (the house of Yahudah shall
--                walk with the house of Yashar''el), ★★ Isaiah 11:12-13 (assemble the outcasts of
--                Yashar''el and gather the dispersed of Yahudah... Ephraim shall not envy Yahudah) — THREAD 3
--   ★★★ v.21-23 (I will make them ONE NATION in the land upon the mountains of Yashar''el; one king to
--          them all; no more two nations, neither divided into two kingdoms any more at all; they shall
--          be my people, and I will be their Elohim)
--        NT:     ★★ John 11:51-52 (gather together in one the children of Elohim that were scattered
--                abroad), ★★ Ephesians 2:14-16 (made both one... broken down the middle wall... one new
--                man — the two houses reconciled, NOT Jew/Gentile replacement) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★ Zechariah 10:6 (I will strengthen the house of Yahudah, and I will save the house of
--                Joseph... bring them again to place them) — THREAD 4
--   ★★ v.24-25 (David my servant shall be king over them; they all shall have one shepherd; my servant
--          David shall be their prince for ever; walk in my judgments and observe my statutes)
--        NT:     ★★ Luke 1:32-33 (the throne of his father David... reign over the house of Jacob for
--                ever), ★ John 10:11 (I am the good shepherd), ★ Revelation 22:16 (I am the root and the
--                offspring of David) — THREAD 5
--        Extras: none warranted
--        Tanakh: ★★ Ezekiel 34:23-24 (I will set up one shepherd over them... my servant David) — THREAD 5
--   ★★ v.26-28 (a covenant of peace; an everlasting covenant; I will set my sanctuary in the midst of
--          them for evermore; my tabernacle also shall be with them; I will be their Elohim, and they
--          shall be my people)
--        NT:     ★★★ Revelation 21:3 (the tabernacle of Elohim is with men, and he will dwell with them),
--                ★★ 2 Corinthians 6:16 (I will dwell in them... and they shall be my people), ★ John 1:14
--                (the Word was made flesh, and dwelt among us), ★ Hebrews 13:20 (the blood of the
--                everlasting covenant) — THREAD 6
--        Extras: none warranted
--        Tanakh: held in prose — the sanctuary-in-the-midst answered forward; v.27 covenant-formula echoed
--                back to Ezek 36:28 (woven in THREAD 4/6 prose, not a separate row)
--   v.20 (the sticks whereon thou writest shall be in thine hand before their eyes) — the sign-act framing;
--        woven into THREAD 3 prose; no separate add (NT none / Extras none / Tanakh none warranted).
--
-- Threads (slug — target libraries):
--   1. ezekiel-37-the-valley-of-dry-bones-can-these-bones-live — NT (Revelation 11, John 5, Romans 8) + Tanakh (Isaiah 26) [free]
--      (★★★ resurrection-by-the-Ruach; come from the four winds, O breath; an exceeding great army)
--   2. ezekiel-37-the-whole-house-of-yasharel-out-of-the-graves — Tanakh (Hosea 6, Hosea 13, Ezekiel 36) [free]
--      (★★★ the national resurrection/restoration of the WHOLE house — both houses — and the Spirit put within)
--   3. ezekiel-37-the-two-sticks-yahudah-and-joseph-made-one — NT (John 10, Revelation 11) + Tanakh (Hosea 1, Jeremiah 3, Isaiah 11) [free]
--      (★★★ THE central two-house thread; the two sticks joined; one fold, one shepherd; the two olive trees)
--   4. ezekiel-37-one-nation-no-more-two-kingdoms — NT (John 11, Ephesians 2) + Tanakh (Zechariah 10) [free]
--      (★★★ the consummated reunion; the middle wall broken = the two houses reconciled, NOT Jew/Gentile replacement)
--   5. ezekiel-37-david-my-servant-the-one-shepherd-king — NT (Luke 1, John 10, Revelation 22) + Tanakh (Ezekiel 34) [free]
--      (★★ the one Davidic Shepherd-King over the reunited house; the throne of his father David for ever)
--   6. ezekiel-37-the-everlasting-covenant-my-tabernacle-with-them — NT (Revelation 21, 2 Corinthians 6, John 1, Hebrews 13) [free]
--      (★★ the everlasting covenant of peace; the sanctuary/tabernacle of Yahuah set in their midst for evermore)
--   7. ezekiel-37-so-shall-they-be-my-people-and-i-their-elohim — Tanakh (Ezekiel 36) + NT (2 Corinthians 6) [free]
--      (★★ the covenant-formula refrain — my people / their Elohim — cleansed of idols, walking in his statutes)
--
-- Framing notes:
--   ★★★ THE VALLEY OF DRY BONES (THREAD 1): *can these bones live?* — answered by the word and the Ruach:
--      *Come from the four winds, O breath, and breathe upon these slain, that they may live* (37:9), and
--      *the breath came into them, and they lived, and stood up upon their feet, an exceeding great army*
--      (37:10). Revelation fills it word for word — *the Spirit of life from Elohim (God) entered into
--      them, and they stood upon their feet* (Rev 11:11); the Formed Son's own voice raises the dead —
--      *all that are in the graves shall hear his voice, And shall come forth* (John 5:28-29); the same
--      Spirit *shall also quicken your mortal bodies* (Rom 8:11); and Isaiah sang it first — *thy dead men
--      shall live... awake and sing, ye that dwell in dust* (Isa 26:19).
--   ★★★ THE WHOLE HOUSE (THREAD 2): *these bones are the whole house of Yashar''el (Israel)* (37:11) — the
--      bones are the NATION, the WHOLE house (both houses), saying *our hope is lost*. Yahuah answers: *I
--      will open your graves... and bring you into the land of Yashar''el (Israel)* (37:12), *And shall put
--      my spirit in you, and ye shall live* (37:14). Hosea: *After two days will he revive us: in the third
--      day he will raise us up* (Hos 6:2); *I will ransom them from the power of the grave* (Hos 13:14);
--      and the Spirit-put-within is the new heart of Ezek 36:27 — *I will put my spirit within you, and
--      cause you to walk in my statutes*. The Torah written on the heart, not abolished.
--   ★★★ THE TWO STICKS (THREAD 3, the keystone of the keystone): *take thee one stick, and write upon it,
--      For Yahudah (Judah)... then take another stick, and write upon it, For Joseph, the stick of
--      Ephraim, and for all the house of Yashar''el (Israel)... And join them one to another into one stick;
--      and they shall become one in thine hand* (37:16-17), *and make them one stick, and they shall be one
--      in mine hand* (37:19). THE two-house frame: Yahudah (Judah) in the south + Yosef/Ephraim
--      (Joseph/Israel) in the north, the divorced and scattered northern house, gathered and made ONE. The
--      Formed Son says it himself — *other sheep I have, which are not of this fold: them also I must
--      bring... and there shall be one fold, and one shepherd* (John 10:16). Per Yoshi's frame the two
--      witnesses = the two HOUSES, the two olive trees (Rev 11:3-4 / Zech 4), NOT two individuals. Hosea:
--      *the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and
--      appoint themselves one head* (Hos 1:11); Jeremiah: *the house of Yahudah (Judah) shall walk with the
--      house of Yashar''el (Israel)* (Jer 3:18); Isaiah: *gather together the dispersed of Yahudah*, and
--      *Ephraim shall not envy Yahudah (Judah)* (Isa 11:12-13).
--   ★★★ ONE NATION (THREAD 4): *I will make them one nation in the land upon the mountains of Yashar''el
--      (Israel); and one king shall be king to them all: and they shall be no more two nations, neither
--      shall they be divided into two kingdoms any more at all* (37:22). The reunion consummated. Caiaphas
--      prophesied it — *gather together in one the children of Elohim (God) that were scattered abroad*
--      (John 11:52); Paul names the two-house reconciliation — *who hath made both one, and hath broken
--      down the middle wall of partition between us... for to make in himself of twain one new man* (Eph
--      2:14-15), the TWO HOUSES reconciled (the far-off northern house *aliens from the commonwealth of
--      Yashar''el*, made nigh), NOT a Jew/Gentile replacement. Zechariah: *I will strengthen the house of
--      Yahudah (Judah), and I will save the house of Joseph... and they shall be as though I had not cast
--      them off* (Zech 10:6).
--   ★★ THE ONE SHEPHERD-KING (THREAD 5): *And David my servant shall be king over them; and they all shall
--      have one shepherd... and my servant David shall be their prince for ever* (37:24-25). The one Davidic
--      Shepherd-King over the reunited house — *the throne of his father David... he shall reign over the
--      house of Jacob for ever* (Luke 1:32-33); *I am the good shepherd* (John 10:11); *I am the root and
--      the offspring of David* (Rev 22:16); already named in Ezek 34:23-24 — *one shepherd over them...
--      my servant David*. And the flock *shall walk in my judgments, and observe my statutes, and do them*
--      (37:24) — the Torah kept under the Shepherd-King, not abolished.
--   ★★ THE EVERLASTING COVENANT / THE TABERNACLE (THREAD 6): *I will make a covenant of peace with them;
--      it shall be an everlasting covenant with them... I will set my sanctuary in the midst of them for
--      evermore. My tabernacle also shall be with them: and I will be their Elohim (God), and they shall be
--      my people* (37:26-27). The consummation — *Behold, the tabernacle of Elohim (God) is with men, and
--      he will dwell with them, and they shall be his people* (Rev 21:3); *I will dwell in them, and walk in
--      them; and I will be their Elohim (God), and they shall be my people* (2 Cor 6:16); *the Word was made
--      flesh, and dwelt among us* (John 1:14, the Word tabernacled — the FORMED Son); *the blood of the
--      everlasting covenant* (Heb 13:20).
--   ★★ THE COVENANT-FORMULA (THREAD 7): *so shall they be my people, and I will be their Elohim (God)*
--      (37:23) — the refrain of the whole covenant, cleansed of idols (37:23), echoed in Ezek 36:28 and
--      claimed forward in 2 Cor 6:16. (2 Cor 6:16 carried in BOTH thread 6 and thread 7 by its two clauses
--      — the same cross_reference row joined to both threads.)
--   VERSES WITH NO SEPARATE ADD: v.20 (the sign-act framing — the sticks before their eyes; woven into
--      THREAD 3 prose). All verses recorded in the coverage checklist above; every block carries at least
--      one thread.

CREATE TEMP VIEW _s308_ezek37_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): the valley of dry bones — resurrection by the Ruach
    ('canon','ezekiel',37,10,'canon','revelation',11,11,'free',
      E'*And after three days and an half the Spirit of life from Elohim (God) entered into them, and they stood upon their feet; and great fear fell upon them which saw them* (Revelation 11:11). John fills Ezekiel''s vision word for word: as *the breath came into them, and they lived, and stood up upon their feet, an exceeding great army* (Ezekiel 37:10), so the Spirit of life from Elohim raises the slain witnesses to stand on their feet. The same Ruach (Spirit) that breathed on the dry bones is the Spirit of life that raises the dead.'),
    ('canon','ezekiel',37,9,'canon','revelation',11,11,'free',
      E'*And after three days and an half the Spirit of life from Elohim (God) entered into them, and they stood upon their feet* (Revelation 11:11). The command *Come from the four winds, O breath, and breathe upon these slain, that they may live* (Ezekiel 37:9) is answered in the resurrection of the two witnesses: the Spirit of life from Elohim enters the slain and they stand. The breath from the four winds and the Spirit of life from Elohim are one and the same.'),
    ('canon','ezekiel',37,10,'canon','john',5,28,'free',
      E'*Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice* (John 5:28). The Formed Son''s own voice does what the prophet''s word did over the bones — *and the breath came into them, and they lived, and stood up upon their feet* (Ezekiel 37:10): the dead in the graves hear his voice and rise. The word that raised the bones is the voice of the Son.'),
    ('canon','ezekiel',37,10,'canon','john',5,29,'free',
      E'*And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation* (John 5:29). The exceeding great army that *stood up upon their feet* (Ezekiel 37:10) is the resurrection the Son announces — all in the graves come forth at his voice. Ezekiel''s national raising opens into the resurrection of the dead.'),
    ('canon','ezekiel',37,14,'canon','romans',8,11,'free',
      E'*But if the Spirit of him that raised up Yahusha (Jesus) from the dead dwell in you, he that raised up Messiah (Christ) from the dead shall also quicken your mortal bodies by his Spirit that dwelleth in you* (Romans 8:11). Yahuah''s promise *And shall put my spirit in you, and ye shall live* (Ezekiel 37:14) is the same Spirit that raised Messiah and shall quicken the mortal body. The indwelling Ruach (Spirit) is the agent of resurrection then and now.'),
    ('canon','ezekiel',37,10,'canon','isaiah',26,19,'free',
      E'*Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead* (Isaiah 26:19). Isaiah sang the resurrection Ezekiel saw enacted — the slain *lived, and stood up upon their feet, an exceeding great army* (Ezekiel 37:10) is *thy dead men shall live... awake and sing, ye that dwell in dust*. The dust-dwellers of Yashar''el (Israel) rise at Yahuah''s word.'),

    -- THREAD 2 (★★★): these bones are the whole house — out of the graves, the Spirit put within
    ('canon','ezekiel',37,12,'canon','hosea',6,2,'free',
      E'*After two days will he revive us: in the third day he will raise us up, and we shall live in his sight* (Hosea 6:2). Hosea voices the very hope Ezekiel''s graves answer — *I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel)* (Ezekiel 37:12). The whole house, given up as dead, is revived and raised to live in his sight.'),
    ('canon','ezekiel',37,12,'canon','hosea',13,14,'free',
      E'*I will ransom them from the power of the grave; I will redeem them from death: O death, I will be thy plagues; O grave, I will be thy destruction* (Hosea 13:14). The promise to *open your graves, and cause you to come up out of your graves* (Ezekiel 37:12) is Yahuah''s ransom from the grave itself — death and the grave undone for the house of Yashar''el (Israel). The national resurrection is a redemption from death.'),
    ('canon','ezekiel',37,14,'canon','ezekiel',36,27,'free',
      E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The Spirit promised in *And shall put my spirit in you, and ye shall live* (Ezekiel 37:14) is the same Spirit-within of the new heart — and it is given to make the people walk in the statutes and keep the judgments. The Torah is written on the heart, not abolished; the raised house is the Torah-keeping house.'),

    -- THREAD 3 (★★★): the two sticks — Yahudah and Joseph/Ephraim made ONE
    ('canon','ezekiel',37,19,'canon','john',10,16,'free',
      E'*And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd* (John 10:16). The Formed Son speaks the two-stick promise — *I will take the stick of Joseph... and the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19): the scattered northern house, the *other sheep... not of this fold*, are gathered with Yahudah into *one fold, and one shepherd*. Both folds are his sheep; both sticks are his hand.'),
    ('canon','ezekiel',37,16,'canon','john',10,16,'free',
      E'*And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd* (John 10:16). The two sticks — *For Yahudah (Judah)... For Joseph, the stick of Ephraim, and for all the house of Yashar''el (Israel)* (Ezekiel 37:16) — are the one fold the Shepherd gathers: the *other sheep... not of this fold* are the scattered house of Yosef/Ephraim brought home with Yahudah. One Shepherd, one flock.'),
    ('canon','ezekiel',37,16,'canon','revelation',11,4,'free',
      E'*These are the two olive trees, and the two candlesticks standing before the Elohim (God) of the earth* (Revelation 11:4). Read through the two-house frame, the two witnesses are the two HOUSES — *one stick, and write upon it, For Yahudah (Judah)... another stick... For Joseph, the stick of Ephraim* (Ezekiel 37:16) — the House of Yahudah and the House of Yashar''el (Israel) standing as the two olive trees (Zechariah 4), not two individual men. The two sticks and the two olive trees are the same divided-then-reunited people.'),
    ('canon','ezekiel',37,16,'canon','revelation',11,3,'free',
      E'*And I will give power unto my two witnesses, and they shall prophesy a thousand two hundred and threescore days, clothed in sackcloth* (Revelation 11:3). The two witnesses, per the two-house frame, are the two houses written on the two sticks — *For Yahudah (Judah)... For Joseph, the stick of Ephraim, and for all the house of Yashar''el (Israel)* (Ezekiel 37:16). The witness of Yahuah in the earth is the testimony of his two-house people, House of Yahudah and House of Yashar''el (Israel).'),
    ('canon','ezekiel',37,17,'canon','hosea',1,11,'free',
      E'*Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel* (Hosea 1:11). Hosea names the joining of the two sticks — *join them one to another into one stick; and they shall become one in thine hand* (Ezekiel 37:17): the children of Yahudah and the children of Yashar''el gathered under one head. The divorced northern house (Lo-ammi, "not my people," Hosea 1:9) is regathered with Yahudah as one.'),
    ('canon','ezekiel',37,19,'canon','jeremiah',3,18,'free',
      E'*In those days the house of Yahudah (Judah) shall walk with the house of Yashar''el (Israel), and they shall come together out of the land of the north to the land that I have given for an inheritance unto your fathers* (Jeremiah 3:18). Jeremiah sees the same reunion the two sticks enact — *make them one stick, and they shall be one in mine hand* (Ezekiel 37:19): the two houses walking together, coming together out of the north to the inheritance. The northern exile is reversed; both houses come home as one.'),
    ('canon','ezekiel',37,19,'canon','isaiah',11,13,'free',
      E'*The envy also of Ephraim shall depart, and the adversaries of Yahudah (Judah) shall be cut off: Ephraim shall not envy Yahudah (Judah), and Yahudah (Judah) shall not vex Ephraim* (Isaiah 11:13). When the stick of Joseph (Ephraim) and the stick of Yahudah are *one in mine hand* (Ezekiel 37:19), the old rivalry of the divided kingdom is healed — Ephraim no longer envies Yahudah, nor Yahudah Ephraim. The two-house reunion ends the strife between the houses.'),
    ('canon','ezekiel',37,19,'canon','isaiah',11,12,'free',
      E'*And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah 11:12). The making of *one stick* (Ezekiel 37:19) is the assembling of both — the outcasts of Yashar''el (the northern house) AND the dispersed of Yahudah — gathered from the four corners. The two sticks are the two scattered houses regathered into one.'),

    -- THREAD 4 (★★★): one nation, no more two kingdoms
    ('canon','ezekiel',37,22,'canon','john',11,52,'free',
      E'*And not for that nation only, but that also he should gather together in one the children of Elohim (God) that were scattered abroad* (John 11:52). Caiaphas prophesied the very reunion of Ezekiel — *I will make them one nation in the land... and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22): the scattered children gathered together in one. The Messiah dies to gather the scattered house into one nation under one King.'),
    ('canon','ezekiel',37,22,'canon','ephesians',2,14,'free',
      E'*For he is our peace, who hath made both one, and hath broken down the middle wall of partition between us* (Ephesians 2:14). The promise *I will make them one nation... they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22) is the both-made-one Paul proclaims — the two houses (the far-off northern house, *aliens from the commonwealth of Yashar''el (Israel)*, 2:12) reconciled, the dividing barrier broken. Not a new people replacing Yashar''el, but the two houses of Yashar''el made one.'),
    ('canon','ezekiel',37,22,'canon','ephesians',2,15,'free',
      E'*Having abolished in his flesh the enmity, even the law of commandments contained in ordinances; for to make in himself of twain one new man, so making peace* (Ephesians 2:15). The making of *one nation* out of two kingdoms (Ezekiel 37:22) is the making *of twain one new man* — the two estranged houses joined into one body, peace made between them. The enmity (the dividing barrier) is abolished, not the Torah of Yahuah; the two become one.'),
    ('canon','ezekiel',37,22,'canon','ephesians',2,16,'free',
      E'*And that he might reconcile both unto Elohim (God) in one body by the cross, having slain the enmity thereby* (Ephesians 2:16). Both houses *one nation... no more two nations* (Ezekiel 37:22) is the both reconciled *in one body by the cross*. The two kingdoms divided since Solomon are made one body, the enmity between the houses slain.'),
    ('canon','ezekiel',37,22,'canon','zechariah',10,6,'free',
      E'*And I will strengthen the house of Yahudah (Judah), and I will save the house of Joseph, and I will bring them again to place them; for I have mercy upon them: and they shall be as though I had not cast them off* (Zechariah 10:6). Zechariah names the two houses Ezekiel makes one nation — *one king shall be king to them all* (Ezekiel 37:22): the House of Yahudah strengthened and the House of Joseph saved, brought again as though never cast off. Both houses restored, the casting-off of the north reversed.'),

    -- THREAD 5 (★★): David my servant — the one Shepherd-King
    ('canon','ezekiel',37,24,'canon','luke',1,32,'free',
      E'*He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32). The promise *David my servant shall be king over them; and they all shall have one shepherd* (Ezekiel 37:24) is fulfilled in the One given *the throne of his father David* — the Davidic King over the reunited house. The one Shepherd-King is the Son of David enthroned.'),
    ('canon','ezekiel',37,25,'canon','luke',1,33,'free',
      E'*And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33). The word *my servant David shall be their prince for ever* (Ezekiel 37:25) is the everlasting reign Gabriel announces — *he shall reign over the house of Jacob for ever*. The prince-for-ever over the whole house of Jacob (both houses) is the Messiah, the Son of David.'),
    ('canon','ezekiel',37,24,'canon','john',10,11,'free',
      E'*I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). The *one shepherd* over the reunited house (Ezekiel 37:24) speaks: *I am the good shepherd*. David''s greater Son is the one Shepherd-King who lays down his life for the one flock of both houses.'),
    ('canon','ezekiel',37,24,'canon','ezekiel',34,23,'free',
      E'*And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd* (Ezekiel 34:23). Ezekiel already named the one Shepherd-King — *David my servant... and they all shall have one shepherd* (Ezekiel 37:24) repeats *one shepherd over them... even my servant David*. The reunited house is fed by one Shepherd, the Davidic King.'),
    ('canon','ezekiel',37,25,'canon','revelation',22,16,'free',
      E'*I Yahusha (Jesus) have sent mine angel to testify unto you these things in the churches. I am the root and the offspring of David, and the bright and morning star* (Revelation 22:16). The everlasting prince *my servant David... their prince for ever* (Ezekiel 37:25) is named at the canon''s close — *I am the root and the offspring of David*. The Davidic prince-for-ever is the Formed Son, root and offspring of David at once.'),

    -- THREAD 6 (★★): the everlasting covenant of peace — my sanctuary/tabernacle in their midst
    ('canon','ezekiel',37,27,'canon','revelation',21,3,'free',
      E'*And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). The promise *My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people* (Ezekiel 37:27) is the consummation John sees — *the tabernacle of Elohim is with men*. Yahuah''s sanctuary set in their midst for evermore reaches its end in the New Jerusalem.'),
    ('canon','ezekiel',37,27,'canon','2-corinthians',6,16,'free',
      E'*And what agreement hath the temple of Elohim (God) with idols? for ye are the temple of the living Elohim (God); as Elohim (God) hath said, I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16). Paul quotes the covenant-formula of Ezekiel — *I will be their Elohim (God), and they shall be my people* (Ezekiel 37:27) — and names Yahuah''s dwelling in the midst: *I will dwell in them, and walk in them*. The sanctuary in their midst becomes Yahuah dwelling in his people.'),
    ('canon','ezekiel',37,26,'canon','john',1,14,'free',
      E'*And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14). The promise *I will set my sanctuary in the midst of them for evermore* (Ezekiel 37:26) takes flesh when the Word *dwelt* — tabernacled — *among us*: the FORMED Son, the visible Glory drawn from the Formless Father, sets up the sanctuary in the midst of his people. Yahuah in their midst is the Word made flesh.'),
    ('canon','ezekiel',37,26,'canon','hebrews',13,20,'free',
      E'*Now the Elohim (God) of peace, that brought again from the dead our Lord Yahusha (Lord Jesus), that great shepherd of the sheep, through the blood of the everlasting covenant* (Hebrews 13:20). The *covenant of peace... an everlasting covenant* (Ezekiel 37:26) is the everlasting covenant in the blood of the great Shepherd — joining the covenant of peace to the one Shepherd-King of v.24. The Elohim of peace and the everlasting covenant are one promise fulfilled.'),

    -- THREAD 7 (★★): the covenant-formula — my people, their Elohim — cleansed
    ('canon','ezekiel',37,23,'canon','ezekiel',36,28,'free',
      E'*And ye shall dwell in the land that I gave to your fathers; and ye shall be my people, and I will be your Elohim (God)* (Ezekiel 36:28). The refrain *so shall they be my people, and I will be their Elohim (God)* (Ezekiel 37:23) is the same covenant-formula sealed in the cleansing chapter — the people saved out of their dwellingplaces and *cleansed* of their idols (37:23) become *my people*, and Yahuah their Elohim. The formula of the whole covenant: a cleansed people, a faithful Elohim.'),
    ('canon','ezekiel',37,23,'canon','2-corinthians',6,16,'free',
      E'*As Elohim (God) hath said, I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16). The covenant-formula *so shall they be my people, and I will be their Elohim (God)* (Ezekiel 37:23) — spoken of a people *cleansed* of idols — is claimed forward by Paul, who calls the same people to *come out from among them, and be ye separate* (2 Cor 6:17). The cleansed, separated people are the people of the covenant: my people, their Elohim.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-37-the-valley-of-dry-bones-can-these-bones-live',
       E'The valley of dry bones — can these bones live? — and the breath came into them',
       E'Yahuah (LORD) sets the prophet down *in the midst of the valley which was full of bones* (37:1), *and, lo, they were very dry* (37:2), and asks the question the whole framework hangs on: *Son of Adam, can these bones live? And I answered, O Yahuah (Lord) GOD, thou knowest* (37:3). The answer is the word and the Ruach (Spirit): *Prophesy upon these bones... Behold, I will cause breath to enter into you, and ye shall live* (37:4-5). As the prophet speaks there is *a noise, and behold a shaking, and the bones came together, bone to his bone* (37:7), sinew and flesh and skin come up — *but there was no breath in them* (37:8). Then the second word: *Prophesy unto the wind... Thus saith Adonai Yahuah (the Lord GOD); Come from the four winds, O breath, and breathe upon these slain, that they may live* (37:9), *and the breath came into them, and they lived, and stood up upon their feet, an exceeding great army* (37:10). The New Testament fills it word for word: *the Spirit of life from Elohim (God) entered into them, and they stood upon their feet* (Revelation 11:11). The Formed Son''s own voice raises the dead: *the hour is coming, in the which all that are in the graves shall hear his voice, And shall come forth* (John 5:28-29). The same Ruach is the agent of every resurrection: *he that raised up Messiah (Christ) from the dead shall also quicken your mortal bodies by his Spirit that dwelleth in you* (Romans 8:11). And Isaiah sang it before Ezekiel saw it: *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust* (Isaiah 26:19). Can these bones live? The breath from the four winds — the Spirit of life from Elohim — says yes.',
       sv.verse_id, ev.verse_id, 'free', 32900
  FROM _s308_ezek37_lookup sv, _s308_ezek37_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=37 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-37-the-whole-house-of-yasharel-out-of-the-graves',
       E'These bones are the whole house of Yashar''el — I will open your graves',
       E'Yahuah names the bones: *Son of Adam, these bones are the whole house of Yashar''el (Israel): behold, they say, Our bones are dried, and our hope is lost: we are cut off for our parts* (37:11). The vision is the NATION — the WHOLE house (both houses), given up for dead in exile, saying *our hope is lost*. The answer is national resurrection and restoration: *Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel)* (37:12), *And shall put my spirit in you, and ye shall live, and I shall place you in your own land* (37:14). Hosea voices the same hope of revival: *After two days will he revive us: in the third day he will raise us up, and we shall live in his sight* (Hosea 6:2), and the same ransom from death: *I will ransom them from the power of the grave; I will redeem them from death* (Hosea 13:14). And the Spirit Yahuah puts within is the new heart of the chapter before: *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). This is the heart of the framework: the resurrection of the whole house is also the Torah written on the heart — the raised people are the people who *walk in my statutes*, not a people freed from them. The dead, hopeless, scattered house is opened out of its graves, filled with the Spirit, and brought home.',
       sv.verse_id, ev.verse_id, 'free', 32903
  FROM _s308_ezek37_lookup sv, _s308_ezek37_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=37 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-37-the-two-sticks-yahudah-and-joseph-made-one',
       E'The two sticks — Yahudah and Joseph/Ephraim joined into one in thine hand',
       E'Here is THE two-house keystone, the sign-act that names the whole people. Yahuah commands: *take thee one stick, and write upon it, For Yahudah (Judah), and for the children of Yashar''el (Israel) his companions: then take another stick, and write upon it, For Joseph, the stick of Ephraim, and for all the house of Yashar''el (Israel) his companions* (37:16); *And join them one to another into one stick; and they shall become one in thine hand* (37:17). When the people ask what it means, the word is plain: *Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (37:19). Two houses — Yahudah (Judah) in the south, Yosef/Ephraim (Joseph/Israel) in the north, the divorced and scattered northern house — written, joined, made ONE. The Formed Son says it of himself: *other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd* (John 10:16) — the scattered house gathered with Yahudah into one flock. Read through this frame the two witnesses are the two HOUSES, *the two olive trees* (Revelation 11:4; Zechariah 4), the House of Yahudah and the House of Yashar''el, not two individual men. The prophets sing the same reunion: *Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head* (Hosea 1:11); *the house of Yahudah (Judah) shall walk with the house of Yashar''el (Israel)... out of the land of the north* (Jeremiah 3:18); *assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah)... Ephraim shall not envy Yahudah (Judah), and Yahudah (Judah) shall not vex Ephraim* (Isaiah 11:12-13). Both branches are Yashar''el — never replacement, never a new people grafted in by confession — the two sticks made one in his hand.',
       sv.verse_id, ev.verse_id, 'free', 32906
  FROM _s308_ezek37_lookup sv, _s308_ezek37_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=37 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-37-one-nation-no-more-two-kingdoms',
       E'One nation, one king — no more two nations, neither divided into two kingdoms any more at all',
       E'The two sticks made one open into the consummated reunion: *Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land: And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (37:21-22). The division of the kingdom since Solomon is undone forever: one nation, one King, the heathen-scattered children gathered home. Caiaphas, prophesying without knowing it, names the gathering: the Messiah should *gather together in one the children of Elohim (God) that were scattered abroad* (John 11:52). Paul names the two-house reconciliation outright: *he is our peace, who hath made both one, and hath broken down the middle wall of partition between us* (Ephesians 2:14), *for to make in himself of twain one new man, so making peace* (2:15), *that he might reconcile both unto Elohim (God) in one body by the cross* (2:16) — the far-off northern house, *aliens from the commonwealth of Yashar''el (Israel)* (2:12), made nigh and joined to Yahudah. This is the two houses reconciled, NOT a new people replacing Yashar''el. Zechariah seals it: *I will strengthen the house of Yahudah (Judah), and I will save the house of Joseph... and they shall be as though I had not cast them off* (Zechariah 10:6). And the reunited nation is a cleansed nation: *Neither shall they defile themselves any more with their idols... so shall they be my people, and I will be their Elohim (God)* (37:23).',
       sv.verse_id, ev.verse_id, 'free', 32909
  FROM _s308_ezek37_lookup sv, _s308_ezek37_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=37 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-37-david-my-servant-the-one-shepherd-king',
       E'David my servant shall be king over them — one shepherd, prince for ever',
       E'Over the reunited house stands one King: *And David my servant shall be king over them; and they all shall have one shepherd: they shall also walk in my judgments, and observe my statutes, and do them* (37:24), *and my servant David shall be their prince for ever* (37:25). The Davidic Shepherd-King is given the everlasting throne: *Yahuah Elohim (the Lord God) shall give unto him the throne of his father David: And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:32-33). The one Shepherd speaks: *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). Ezekiel had already named him a chapter before: *I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd* (Ezekiel 34:23). And at the canon''s very close he names himself: *I am the root and the offspring of David, and the bright and morning star* (Revelation 22:16) — the prince-for-ever, root and offspring of David at once, the Formed Son enthroned over both houses. Mark too that the flock under the Shepherd-King *shall walk in my judgments, and observe my statutes, and do them* (37:24): the kingdom of the one Shepherd is a Torah-keeping kingdom, the instruction honored, not abolished.',
       sv.verse_id, ev.verse_id, 'free', 32912
  FROM _s308_ezek37_lookup sv, _s308_ezek37_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=37 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-37-the-everlasting-covenant-my-tabernacle-with-them',
       E'A covenant of peace, an everlasting covenant — my tabernacle also shall be with them',
       E'The chapter closes on the dwelling of Yahuah in the midst of the reunited house: *Moreover I will make a covenant of peace with them; it shall be an everlasting covenant with them: and I will place them, and multiply them, and will set my sanctuary in the midst of them for evermore. My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people* (37:26-27). The everlasting covenant of peace, the sanctuary set in their midst for evermore — and the whole canon reaches its end here: *Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). Paul claims the same dwelling and the same formula: *I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16). The sanctuary in the midst takes flesh in the Formed Son: *the Word was made flesh, and dwelt among us* (John 1:14) — the Word tabernacled, the visible Glory drawn from the Formless Father. And the everlasting covenant is sealed in his blood: *the Elohim (God) of peace, that brought again from the dead our Lord Yahusha (Lord Jesus), that great shepherd of the sheep, through the blood of the everlasting covenant* (Hebrews 13:20). The valley of bones ends in Yahuah dwelling among his people for ever.',
       sv.verse_id, ev.verse_id, 'free', 32915
  FROM _s308_ezek37_lookup sv, _s308_ezek37_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=37 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- THREAD 7 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-37-so-shall-they-be-my-people-and-i-their-elohim',
       E'So shall they be my people, and I will be their Elohim — the covenant-formula',
       E'Running through the whole reunion is the refrain that names the covenant itself. The reunited nation is cleansed and claimed: *Neither shall they defile themselves any more with their idols, nor with their detestable things, nor with any of their transgressions: but I will save them out of all their dwellingplaces, wherein they have sinned, and will cleanse them: so shall they be my people, and I will be their Elohim (God)* (37:23). This is the covenant-formula — *my people... their Elohim* — sealed of a cleansed people. Ezekiel had sworn it the chapter before: *and ye shall be my people, and I will be your Elohim (God)* (Ezekiel 36:28), the people sprinkled clean and given a new heart. And Paul claims it forward for the same separated people: *I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16) — calling them, as Ezekiel''s cleansing implies, to *come out from among them, and be ye separate... and touch not the unclean thing* (2 Cor 6:17). The formula of the whole covenant, from the bones to the New Jerusalem: a cleansed, separated people, and Yahuah their faithful Elohim.',
       sv.verse_id, ev.verse_id, 'free', 32918
  FROM _s308_ezek37_lookup sv, _s308_ezek37_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=37 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *the Spirit of life from Elohim (God) entered into them, and they stood upon their feet* (Revelation 11:11) — John fills Ezekiel 37:10 word for word; the breath becomes the Spirit of life.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=10
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-valley-of-dry-bones-can-these-bones-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *the Spirit of life from Elohim (God) entered into them, and they stood upon their feet* (Revelation 11:11) — answers *Come from the four winds, O breath* (Ezekiel 37:9); the four-wind breath IS the Spirit of life.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=9
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-valley-of-dry-bones-can-these-bones-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *all that are in the graves shall hear his voice* (John 5:28) — the Son''s voice does what the prophet''s word did over the bones; the dead hear and come forth.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=10
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-valley-of-dry-bones-can-these-bones-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*they that have done good, unto the resurrection of life* (John 5:29) — the exceeding great army that stood up (Ezekiel 37:10) is the resurrection the Son announces; all come forth at his voice.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=10
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-valley-of-dry-bones-can-these-bones-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *he that raised up Messiah (Christ) from the dead shall also quicken your mortal bodies by his Spirit* (Romans 8:11) — the same Spirit Yahuah puts in (Ezekiel 37:14) is the agent of resurrection.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=14
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-valley-of-dry-bones-can-these-bones-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Thy dead men shall live... awake and sing, ye that dwell in dust* (Isaiah 26:19) — Isaiah sang the resurrection Ezekiel 37:10 saw enacted; the dust-dwellers rise.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=10
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-valley-of-dry-bones-can-these-bones-live'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *After two days will he revive us: in the third day he will raise us up* (Hosea 6:2) — the hope Ezekiel''s graves answer (37:12); the dead-for-lost house revived.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=12
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-whole-house-of-yasharel-out-of-the-graves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I will ransom them from the power of the grave; I will redeem them from death* (Hosea 13:14) — the opening of the graves (Ezekiel 37:12) is Yahuah''s ransom from the grave itself.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=12
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=13 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-whole-house-of-yasharel-out-of-the-graves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27) — the Spirit of 37:14 is the new heart; the raised house walks in the Torah, not freed from it.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=14
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-whole-house-of-yasharel-out-of-the-graves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *other sheep I have, which are not of this fold... one fold, and one shepherd* (John 10:16) — the Formed Son gathers the scattered northern house with Yahudah; the two sticks made one (37:19).'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=19
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-two-sticks-yahudah-and-joseph-made-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *one fold, and one shepherd* (John 10:16) — the two sticks written For Yahudah and For Joseph/Ephraim (37:16) are the one fold; the other-fold sheep are the northern house.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=16
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-two-sticks-yahudah-and-joseph-made-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *These are the two olive trees* (Revelation 11:4) — per the two-house frame the two witnesses are the two HOUSES (Zechariah 4), House of Yahudah + House of Yashar''el, the two sticks of 37:16; NOT two individuals.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=16
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-two-sticks-yahudah-and-joseph-made-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I will give power unto my two witnesses* (Revelation 11:3) — the witness of Yahuah is the two-house testimony written on the two sticks (37:16): House of Yahudah and House of Yashar''el.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=16
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-two-sticks-yahudah-and-joseph-made-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *the children of Yahudah and the children of Yashar''el be gathered together, and appoint themselves one head* (Hosea 1:11) — the joining of the sticks (37:17); the divorced north (Lo-ammi) regathered with Yahudah.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=17
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-two-sticks-yahudah-and-joseph-made-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *the house of Yahudah shall walk with the house of Yashar''el... out of the land of the north* (Jeremiah 3:18) — the reunion of 37:19; both houses come home together out of exile.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=19
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-two-sticks-yahudah-and-joseph-made-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *Ephraim shall not envy Yahudah, and Yahudah shall not vex Ephraim* (Isaiah 11:13) — the two sticks one in his hand (37:19) heals the old rivalry of the divided kingdom.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=19
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-two-sticks-yahudah-and-joseph-made-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *assemble the outcasts of Yashar''el, and gather together the dispersed of Yahudah* (Isaiah 11:12) — the one stick (37:19) is both scattered houses regathered from the four corners.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=19
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-two-sticks-yahudah-and-joseph-made-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *gather together in one the children of Elohim (God) that were scattered abroad* (John 11:52) — Caiaphas prophesies the one nation of 37:22; the scattered children gathered into one.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=22
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=11 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-one-nation-no-more-two-kingdoms'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *he is our peace, who hath made both one, and hath broken down the middle wall of partition* (Ephesians 2:14) — the two houses reconciled (37:22); the far-off northern house made nigh, NOT a new people replacing Yashar''el.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=22
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-one-nation-no-more-two-kingdoms'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*for to make in himself of twain one new man, so making peace* (Ephesians 2:15) — the one nation out of two kingdoms (37:22); the two estranged houses joined into one body, the enmity (the barrier) abolished, not the Torah.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=22
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-one-nation-no-more-two-kingdoms'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*reconcile both unto Elohim (God) in one body by the cross* (Ephesians 2:16) — both houses one nation (37:22) is both reconciled in one body; the two kingdoms made one, the enmity slain.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=22
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-one-nation-no-more-two-kingdoms'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *I will strengthen the house of Yahudah, and I will save the house of Joseph... as though I had not cast them off* (Zechariah 10:6) — the two houses Ezekiel makes one nation (37:22); the casting-off of the north reversed.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=22
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=10 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-one-nation-no-more-two-kingdoms'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32) — *David my servant shall be king over them* (37:24) given the Davidic throne; the one Shepherd-King enthroned.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=24
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-david-my-servant-the-one-shepherd-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33) — *my servant David shall be their prince for ever* (37:25); the everlasting reign over the whole house of Jacob.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=25
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-david-my-servant-the-one-shepherd-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11) — the *one shepherd* of 37:24 speaks; David''s greater Son lays down his life for the one flock of both houses.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=24
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-david-my-servant-the-one-shepherd-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *I will set up one shepherd over them... even my servant David* (Ezekiel 34:23) — Ezekiel already named the one Shepherd-King; 37:24 repeats *one shepherd... my servant David*.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=24
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-david-my-servant-the-one-shepherd-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *I am the root and the offspring of David, and the bright and morning star* (Revelation 22:16) — the prince-for-ever (37:25) named at the canon''s close; the Formed Son, root and offspring of David.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=25
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-david-my-servant-the-one-shepherd-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people* (Revelation 21:3) — the sanctuary/tabernacle in their midst for evermore (37:27) reaches its end in the New Jerusalem.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=27
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-everlasting-covenant-my-tabernacle-with-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16) — Paul quotes the covenant-formula of 37:27; the sanctuary in the midst becomes Yahuah dwelling in his people.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=27
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-everlasting-covenant-my-tabernacle-with-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the Word was made flesh, and dwelt among us* (John 1:14) — the sanctuary set in their midst (37:26) takes flesh; the Word tabernacled, the FORMED Son, the visible Glory of the Father.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=26
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-everlasting-covenant-my-tabernacle-with-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *the blood of the everlasting covenant* (Hebrews 13:20) — the *everlasting covenant* of peace (37:26) sealed in the blood of the great Shepherd; covenant of peace + one Shepherd-King joined.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=26
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-the-everlasting-covenant-my-tabernacle-with-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 7 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *ye shall be my people, and I will be your Elohim (God)* (Ezekiel 36:28) — the refrain of 37:23 sealed in the cleansing chapter; a people sprinkled clean and given a new heart.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=23
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-so-shall-they-be-my-people-and-i-their-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16) — the covenant-formula of 37:23 claimed forward; the cleansed, separated people (*come out... be ye separate*) are the people of the covenant.'
  FROM cross_reference_threads t
  JOIN _s308_ezek37_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=37 AND sv.verse_number=23
  JOIN _s308_ezek37_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-37-so-shall-they-be-my-people-and-i-their-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezekiel_2.sql (Ezekiel 2) -----
-- Chapter: Ezekiel 2 — THE CALL OF EZEKIEL. *Son of Adam, stand upon thy feet, and I will speak unto
-- thee* — the seed-of-Adam prophet raised to STAND by the Ruach (Spirit), NOT the Daniel 7 kaph
-- cloud-rider but the representative-man weight of the prophet. He is SENT to the children of
-- Yashar''el (Israel), a rebellious house — to speak whether they hear or forbear, *be not afraid of
-- their words*. And there is given a ROLL OF A BOOK, written within and without, *lamentations, and
-- mourning, and woe* — the scroll of judgment the prophet must receive (and, in ch3, eat). The
-- prophetic-call pattern (Jeremiah, Isaiah, Daniel) and the eaten-scroll (Revelation 10) are the
-- weave.
-- Tag: ezek02   Temp view: _s308_ezek02_lookup
-- Sort band: base 32025, step 3 -> threads at 32025, 32028, 32031 (3 threads)
-- Source of EVERY row: 'canon','ezekiel',2,v
--
-- Ezekiel 2 coverage:
--   ★ v.1-2 (Son of Adam, stand upon thy feet... and the spirit entered into me... and set me upon
--          my feet)
--        NT:     ★ Revelation 11:11 (the Spirit of life from Elohim entered into them, and they stood
--                upon their feet) — the Spirit-entering/standing lateral — THREAD 1
--        Extras: none warranted (clean canon prophetic-call weave)
--        Tanakh: ★★ Jeremiah 1:7-9 (thou shalt go to all that I shall send thee... I have put my words
--                in thy mouth), ★ Isaiah 6:8 (Whom shall I send... Here am I; send me), ★ Daniel 10:11
--                (O man greatly beloved... stand upright: for unto thee am I now sent) — THREAD 1
--   ★ v.3-7 (I send thee to the children of Yashar''el, a rebellious nation... whether they will hear,
--          or whether they will forbear... yet shall know that there hath been a prophet among them...
--          be not afraid of their words)
--        NT:     ★ Matthew 10:14-16 (shake off the dust... I send you forth as sheep in the midst of
--                wolves), ★ Acts 20:26-27 (I am pure from the blood of all men... I have not shunned to
--                declare all the counsel of Elohim) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Jeremiah 1:8 (Be not afraid of their faces: for I am with thee), ★★ Jeremiah
--                1:17-19 (be not dismayed at their faces... they shall fight against thee; but they
--                shall not prevail), ★★ Ezekiel 3:7-9 (the house of Yashar''el will not hearken... I
--                have made thy forehead strong) — THREAD 2
--   v.8 (Be not thou rebellious like that rebellious house: open thy mouth, and eat that I give thee)
--        NT:     none warranted distinct (the eat-the-scroll forward-weave belongs to v.9-10 + Ezek 3;
--                held in THREAD 3)
--        Extras: none warranted
--        Tanakh: none separate (the command to eat the roll; the roll itself is THREAD 3; woven in
--                prose, the obedient-prophet hinge into the scroll)
--   ★★ v.9-10 (a roll of a book was therein... written within and without... lamentations, and
--          mourning, and woe)
--        NT:     ★★★ Revelation 10:9-10 (Take it, and eat it up... sweet as honey... thy belly
--                bitter), ★★ Revelation 10:8 (Go and take the little book which is open in the hand of
--                the angel), ★★ Revelation 5:1 (a book written within and on the backside, sealed with
--                seven seals) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★ Zechariah 5:1-2 (a flying roll... the length thereof twenty cubits) — THREAD 3
--
-- Threads (slug — target libraries):
--   1. ezekiel-2-son-of-adam-stand-upon-thy-feet-and-the-spirit-entered — NT (Revelation 11) + Tanakh (Jeremiah 1, Isaiah 6, Daniel 10) [free]
--      (★ the seed-of-Adam prophet raised to STAND by the Ruach; the prophetic-call pattern)
--   2. ezekiel-2-i-send-thee-to-a-rebellious-house-be-not-afraid — NT (Matthew 10, Acts 20) + Tanakh (Jeremiah 1, Ezekiel 3) [free]
--      (★ sent to a rebellious house, fear not their words; the watchman pure from blood, sheep among wolves)
--   3. ezekiel-2-a-roll-of-a-book-lamentations-and-mourning-and-woe — NT (Revelation 10, Revelation 5) + Tanakh (Zechariah 5) [free]
--      (★★ the scroll of judgment received — written within and without; eaten in Ezek 3 / Revelation 10, sweet then bitter)
--
-- Framing notes:
--   ★ SON OF ADAM, STAND (THREAD 1): *And he said unto me, Son of Adam, stand upon thy feet, and I
--      will speak unto thee. And the spirit entered into me when he spake unto me, and set me upon my
--      feet, that I heard him that spake unto me* (2:1-2). "Son of Adam" here is NOT the Daniel 7 kaph
--      cloud-rider but the representative-man weight of the prophet — the seed of Adam, dust, who can
--      only STAND when the Ruach (Spirit) enters and sets him on his feet. This is the prophetic-call
--      pattern: Jeremiah, *thou shalt go to all that I shall send thee... I have put my words in thy
--      mouth* (Jer 1:7-9); Isaiah, *Here am I; send me* (Isa 6:8); Daniel, *O man greatly beloved...
--      stand upright: for unto thee am I now sent* (Dan 10:11). And the Spirit entering to set the
--      prophet on his feet is laterally the Spirit of life that raises the slain to stand (Rev 11:11).
--   ★ THE REBELLIOUS HOUSE / FEAR NOT (THREAD 2): *I send thee to the children of Yashar''el (Israel),
--      to a rebellious nation that hath rebelled against me... whether they will hear, or whether they
--      will forbear... yet shall know that there hath been a prophet among them. And thou, son of Adam,
--      be not afraid of them, neither be afraid of their words* (2:3-6). The prophet is sent to his OWN
--      covenant people in their rebellion — a covenant-lawsuit within the house, never ethnic enmity —
--      and charged to fear not. Jeremiah''s identical commission: *Be not afraid of their faces: for I
--      am with thee to deliver thee* (Jer 1:8), *be not dismayed at their faces... they shall fight
--      against thee; but they shall not prevail against thee* (Jer 1:17-19); and Ezek 3:7-9 doubles it,
--      *I have made thy forehead strong*. The Formed Son sends his own the same way — *I send you forth
--      as sheep in the midst of wolves... shake off the dust* (Matt 10:16,14) — and Paul stands in the
--      same office, the watchman *pure from the blood of all men* because he *shunned not to declare...
--      all the counsel of Elohim (God)* (Acts 20:26-27), anticipating the watchman charge of Ezek 3.
--   ★★ THE ROLL OF A BOOK (THREAD 3): *an hand was sent unto me; and, lo, a roll of a book was
--      therein; And he spread it before me; and it was written within and without: and there was
--      written therein lamentations, and mourning, and woe* (2:9-10). The scroll of judgment the
--      prophet must receive — and in 2:8 is told to *open thy mouth, and eat that I give thee* (eaten
--      in Ezek 3:1-3, sweet as honey). John receives the SAME kind of scroll: *Take it, and eat it up;
--      and it shall make thy belly bitter, but it shall be in thy mouth sweet as honey* (Rev 10:9-10) —
--      sweet to receive the word, bitter for the woe it carries. The book written within and on the
--      backside, sealed (Rev 5:1), and Zechariah''s flying roll of the curse (Zech 5:1-2) are the same
--      written judgment. The eaten word becomes the prophet''s own — woe and all.
--   VERSES WITH NO SEPARATE ADD: v.8 (the command to eat the roll — the obedient-prophet hinge; the
--      eaten scroll is carried forward in THREAD 3 with Revelation 10; woven in prose, no separate
--      row). All verses recorded in the coverage checklist above; every block carries a thread.

CREATE TEMP VIEW _s308_ezek02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): Son of Adam, stand upon thy feet — the prophetic call, the Spirit that sets him standing
    ('canon','ezekiel',2,1,'canon','jeremiah',1,7,'free',
      E'*But Yahuah (LORD) said unto me, Say not, I am a child: for thou shalt go to all that I shall send thee, and whatsoever I command thee thou shalt speak* (Jeremiah 1:7). As Ezekiel is bid *Son of Adam, stand upon thy feet, and I will speak unto thee* (Ezekiel 2:1), so Jeremiah is overruled in his weakness and sent: the prophet does not appoint himself, but goes wherever and speaks whatever Yahuah commands. The seed-of-Adam man is made a prophet only by the One who sends him.'),
    ('canon','ezekiel',2,1,'canon','jeremiah',1,9,'free',
      E'*Then Yahuah (LORD) put forth his hand, and touched my mouth. And Yahuah (LORD) said unto me, Behold, I have put my words in thy mouth* (Jeremiah 1:9). Yahuah''s word placed in the prophet''s mouth answers the charge *I will speak unto thee* (Ezekiel 2:1): the prophet is the bearer of words not his own. Jeremiah''s touched mouth and Ezekiel''s opened mouth (Ezekiel 2:8) carry the same given word.'),
    ('canon','ezekiel',2,1,'canon','isaiah',6,8,'free',
      E'*Also I heard the voice of Yahuah (Lord), saying, Whom shall I send, and who will go for us? Then said I, Here am I; send me* (Isaiah 6:8). Isaiah''s sending is the same call Ezekiel receives standing — *Son of Adam, stand upon thy feet, and I will speak unto thee* (Ezekiel 2:1). The prophet is the one who answers the divine commission *Here am I; send me*, raised to stand and to be sent.'),
    ('canon','ezekiel',2,2,'canon','daniel',10,11,'free',
      E'*And he said unto me, O Daniel, a man greatly beloved, understand the words that I speak unto thee, and stand upright: for unto thee am I now sent* (Daniel 10:11). As the Ruach (Spirit) *set me upon my feet* to hear the word (Ezekiel 2:2), so Daniel is set upon his knees and bidden *stand upright* to receive his message. The trembling seed-of-Adam man is raised to STAND before the voice that speaks to him.'),
    ('canon','ezekiel',2,2,'canon','revelation',11,11,'free',
      E'*And after three days and an half the Spirit of life from Elohim (God) entered into them, and they stood upon their feet; and great fear fell upon them which saw them* (Revelation 11:11). The Spirit that *entered into me... and set me upon my feet* (Ezekiel 2:2) is the same Ruach (Spirit) of life that enters the slain witnesses and sets them on their feet. It is by the Spirit entering, never by his own strength, that the dust-formed man stands.'),

    -- THREAD 2 (★): I send thee to a rebellious house — be not afraid of their words
    ('canon','ezekiel',2,6,'canon','jeremiah',1,8,'free',
      E'*Be not afraid of their faces: for I am with thee to deliver thee, saith Yahuah (LORD)* (Jeremiah 1:8). Jeremiah''s charge is Ezekiel''s word for word — *be not afraid of them, neither be afraid of their words... nor be dismayed at their looks* (Ezekiel 2:6). The prophet sent to a hostile people is not to fear their faces, for the One who sends is with him to deliver him.'),
    ('canon','ezekiel',2,6,'canon','jeremiah',1,17,'free',
      E'*Thou therefore gird up thy loins, and arise, and speak unto them all that I command thee: be not dismayed at their faces, lest I confound thee before them* (Jeremiah 1:17). The same *be not dismayed at their looks* given Ezekiel (Ezekiel 2:6) is laid on Jeremiah: rise, speak everything commanded, and do not flinch. The fear of men is the one thing that would unmake the prophet, so it is forbidden first.'),
    ('canon','ezekiel',2,5,'canon','jeremiah',1,19,'free',
      E'*And they shall fight against thee; but they shall not prevail against thee; for I am with thee, saith Yahuah (LORD), to deliver thee* (Jeremiah 1:19). Ezekiel is told the people are rebellious yet *shall know that there hath been a prophet among them* (Ezekiel 2:5); Jeremiah is told they shall fight but not prevail. The hostile house cannot overthrow the prophet, for Yahuah is with him to deliver and to vindicate his word.'),
    ('canon','ezekiel',2,4,'canon','ezekiel',3,7,'free',
      E'*But the house of Yashar''el (Israel) will not hearken unto thee; for they will not hearken unto me: for all the house of Yashar''el (Israel) are impudent and hardhearted* (Ezekiel 3:7). The very next chapter names again the *impudent children and stiffhearted* of Ezekiel 2:4: their refusal of the prophet is a refusal of Yahuah himself. The rebellion is against the One who sends, not merely the one sent.'),
    ('canon','ezekiel',2,6,'canon','ezekiel',3,9,'free',
      E'*As an adamant harder than flint have I made thy forehead: fear them not, neither be dismayed at their looks, though they be a rebellious house* (Ezekiel 3:9). The charge *be not afraid of their words, nor be dismayed at their looks, though they be a rebellious house* (Ezekiel 2:6) is sealed in Ezekiel 3:9 by the hardened forehead: Yahuah makes the prophet harder than those who oppose him. The fear-not is matched by a strength given for it.'),
    ('canon','ezekiel',2,6,'canon','matthew',10,16,'free',
      E'*Behold, I send you forth as sheep in the midst of wolves: be ye therefore wise as serpents, and harmless as doves* (Matthew 10:16). The Formed Son sends his own exactly as Ezekiel was sent to *briers and thorns... among scorpions* (Ezekiel 2:6) — into the midst of hostility, charged to speak and not to fear. The sent one goes defenceless among wolves, kept by the One who sends.'),
    ('canon','ezekiel',2,5,'canon','matthew',10,14,'free',
      E'*And whosoever shall not receive you, nor hear your words, when ye depart out of that house or city, shake off the dust of your feet* (Matthew 10:14). The *whether they will hear, or whether they will forbear* of Ezekiel 2:5 — the people left without excuse, that they *shall know that there hath been a prophet among them* — becomes the shaken-off dust: the word is delivered, and the refusal is now on their own heads. The prophet''s duty is the speaking, not the receiving.'),
    ('canon','ezekiel',2,5,'canon','acts',20,26,'free',
      E'*Wherefore I take you to record this day, that I am pure from the blood of all men* (Acts 20:26). Paul stands in the watchman''s office Ezekiel is being given (sealed in Ezekiel 3:17-19): because he has spoken, the people *shall know that there hath been a prophet among them* (Ezekiel 2:5), and the watchman is clean. The blood is on the hearer who would not hear, not on the herald who spoke.'),
    ('canon','ezekiel',2,7,'canon','acts',20,27,'free',
      E'*For I have not shunned to declare unto you all the counsel of Elohim (God)* (Acts 20:27). The command *thou shalt speak my words unto them, whether they will hear, or whether they will forbear* (Ezekiel 2:7) is Paul''s own boast: he withheld nothing of the whole counsel of Elohim. The faithful herald speaks all the word regardless of reception, and so is pure from blood.'),

    -- THREAD 3 (★★): a roll of a book — written within and without — lamentations, and mourning, and woe
    ('canon','ezekiel',2,9,'canon','revelation',10,9,'free',
      E'*And I went unto the angel, and said unto him, Give me the little book. And he said unto me, Take it, and eat it up; and it shall make thy belly bitter, but it shall be in thy mouth sweet as honey* (Revelation 10:9). John receives the same kind of scroll Ezekiel does — *an hand was sent unto me; and, lo, a roll of a book was therein* (Ezekiel 2:9), which Ezekiel is told to *eat* (Ezekiel 2:8; 3:1-3). The word is sweet to receive and bitter for the woe it carries: the prophet takes Yahuah''s judgment into himself.'),
    ('canon','ezekiel',2,10,'canon','revelation',10,10,'free',
      E'*And I took the little book out of the angel''s hand, and ate it up; and it was in my mouth sweet as honey: and as soon as I had eaten it, my belly was bitter* (Revelation 10:10). The roll *written within and without... lamentations, and mourning, and woe* (Ezekiel 2:10) is exactly this scroll — honey-sweet to the prophet who loves the word, then bitter for the lamentations and woe it carries. The bitterness in the belly is the weight of the judgment written within.'),
    ('canon','ezekiel',2,9,'canon','revelation',10,8,'free',
      E'*And the voice which I heard from heaven spake unto me again, and said, Go and take the little book which is open in the hand of the angel which standeth upon the sea and upon the earth* (Revelation 10:8). As the hand spread the roll before Ezekiel (Ezekiel 2:9), the angel''s open little book is given John to take. The scroll passed from the divine hand to the prophet''s is the same act of commissioning by the written word.'),
    ('canon','ezekiel',2,10,'canon','revelation',5,1,'free',
      E'*And I saw in the right hand of him that sat on the throne a book written within and on the backside, sealed with seven seals* (Revelation 5:1). John''s throne-scroll is written exactly as Ezekiel''s roll — *it was written within and without* (Ezekiel 2:10). The book inscribed on both sides is the full decree of Yahuah, the judgment and purpose written front and back, nothing left blank.'),
    ('canon','ezekiel',2,10,'canon','zechariah',5,1,'free',
      E'*Then I turned, and lifted up mine eyes, and looked, and behold a flying roll* (Zechariah 5:1). Zechariah''s flying roll is the same kind of written sentence as Ezekiel''s — the roll of *lamentations, and mourning, and woe* (Ezekiel 2:10) — the curse of Yahuah set down in writing and sent out over the land. The scroll is the judgment made visible and binding.'),
    ('canon','ezekiel',2,10,'canon','zechariah',5,2,'free',
      E'*And he said unto me, What seest thou? And I answered, I see a flying roll; the length thereof is twenty cubits, and the breadth thereof ten cubits* (Zechariah 5:2). The measured flying roll, like Ezekiel''s roll *written within and without* with *lamentations, and mourning, and woe* (Ezekiel 2:10), is the written word of judgment going forth. The prophets see the same scroll of the curse Yahuah spreads before them.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-2-son-of-adam-stand-upon-thy-feet-and-the-spirit-entered',
       E'Son of Adam, stand upon thy feet — and the spirit entered into me and set me upon my feet',
       E'The call of Ezekiel opens with a word and a raising: *And he said unto me, Son of Adam, stand upon thy feet, and I will speak unto thee. And the spirit entered into me when he spake unto me, and set me upon my feet, that I heard him that spake unto me* (2:1-2). The prophet is addressed as *Son of Adam* — not the cloud-rider of Daniel 7, but the representative-man weight of the prophet, the seed of Adam, dust, who can only STAND when the Ruach (Spirit) enters and sets him on his feet. This is the prophetic-call pattern of the whole canon. Jeremiah is overruled in his weakness and sent: *Say not, I am a child: for thou shalt go to all that I shall send thee, and whatsoever I command thee thou shalt speak* (Jeremiah 1:7), and the word is placed in him — *Behold, I have put my words in thy mouth* (Jeremiah 1:9). Isaiah answers the same commission: *Whom shall I send, and who will go for us? Then said I, Here am I; send me* (Isaiah 6:8). Daniel, fallen on his face, is raised the same way: *O Daniel, a man greatly beloved... stand upright: for unto thee am I now sent* (Daniel 10:11). And the Spirit that sets the prophet on his feet is the same Ruach (Spirit) of life that raises the slain to stand: *the Spirit of life from Elohim (God) entered into them, and they stood upon their feet* (Revelation 11:11). The man of dust does not stand by his own strength; he stands, and hears, and is sent, only by the Spirit who enters him.',
       sv.verse_id, ev.verse_id, 'free', 32025
  FROM _s308_ezek02_lookup sv, _s308_ezek02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-2-i-send-thee-to-a-rebellious-house-be-not-afraid',
       E'I send thee to a rebellious house — be not afraid of their words',
       E'The standing prophet is sent — to his own covenant people in their rebellion: *Son of Adam, I send thee to the children of Yashar''el (Israel), to a rebellious nation that hath rebelled against me... For they are impudent children and stiffhearted... And they, whether they will hear, or whether they will forbear, (for they are a rebellious house,) yet shall know that there hath been a prophet among them* (2:3-5). This is a covenant-lawsuit within the house, never ethnic enmity — the prophet sent to lost sheep who have hardened, that they may be left without excuse. And he is charged not to fear them: *And thou, son of Adam, be not afraid of them, neither be afraid of their words, though briers and thorns be with thee, and thou dost dwell among scorpions: be not afraid of their words, nor be dismayed at their looks, though they be a rebellious house* (2:6). Jeremiah''s commission is the same word for word — *Be not afraid of their faces: for I am with thee to deliver thee* (Jeremiah 1:8), *be not dismayed at their faces, lest I confound thee before them* (Jeremiah 1:17), *they shall fight against thee; but they shall not prevail against thee* (Jeremiah 1:19). The next chapter doubles it for Ezekiel: the house *will not hearken unto thee; for they will not hearken unto me* (Ezekiel 3:7), yet *As an adamant harder than flint have I made thy forehead: fear them not* (Ezekiel 3:9). The Formed Son sends his own the same way — *I send you forth as sheep in the midst of wolves* (Matthew 10:16), and where they will not hear, *shake off the dust of your feet* (Matthew 10:14). And Paul stands in the very watchman''s office Ezekiel is being given: *I am pure from the blood of all men* (Acts 20:26), *For I have not shunned to declare unto you all the counsel of Elohim (God)* (Acts 20:27). The herald''s duty is the speaking; the refusal — and its blood — is on the rebellious house that would not hear.',
       sv.verse_id, ev.verse_id, 'free', 32028
  FROM _s308_ezek02_lookup sv, _s308_ezek02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-2-a-roll-of-a-book-lamentations-and-mourning-and-woe',
       E'A roll of a book — written within and without — lamentations, and mourning, and woe',
       E'Before the prophet speaks, he must receive the word — and he is first told to take it into himself: *But thou, son of Adam, hear what I say unto thee; Be not thou rebellious like that rebellious house: open thy mouth, and eat that I give thee* (2:8). Then the scroll appears: *And when I looked, behold, an hand was sent unto me; and, lo, a roll of a book was therein; And he spread it before me; and it was written within and without: and there was written therein lamentations, and mourning, and woe* (2:9-10). The roll is the scroll of judgment, inscribed front and back, full of *lamentations, and mourning, and woe* — and the prophet must eat it (he does, in Ezekiel 3:1-3, and it is *as honey for sweetness*). John receives the very same kind of scroll: *Go and take the little book which is open in the hand of the angel* (Revelation 10:8), *Take it, and eat it up; and it shall make thy belly bitter, but it shall be in thy mouth sweet as honey* (Revelation 10:9), *and it was in my mouth sweet as honey: and as soon as I had eaten it, my belly was bitter* (Revelation 10:10). The word is sweet to the prophet who loves it, and bitter for the woe it carries — the judgment taken into the body. The book *written within and on the backside, sealed with seven seals* (Revelation 5:1) is written exactly as Ezekiel''s roll, *within and without* — the full decree of Yahuah, nothing left blank. And Zechariah sees the same written sentence go forth: *behold a flying roll* (Zechariah 5:1), *the length thereof is twenty cubits, and the breadth thereof ten cubits* (Zechariah 5:2), the curse of Yahuah set down in writing. The prophet does not invent the word; he receives the written scroll of lamentation, eats it, and carries it — woe and all.',
       sv.verse_id, ev.verse_id, 'free', 32031
  FROM _s308_ezek02_lookup sv, _s308_ezek02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=2 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *thou shalt go to all that I shall send thee, and whatsoever I command thee thou shalt speak* (Jeremiah 1:7) — the prophet does not appoint himself; he goes and speaks as Ezekiel 2:1 sends him.'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-son-of-adam-stand-upon-thy-feet-and-the-spirit-entered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Behold, I have put my words in thy mouth* (Jeremiah 1:9) — Yahuah''s word placed in the prophet answers *I will speak unto thee* (Ezekiel 2:1); the bearer of words not his own.'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-son-of-adam-stand-upon-thy-feet-and-the-spirit-entered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Whom shall I send... Here am I; send me* (Isaiah 6:8) — Isaiah''s sending is the call Ezekiel receives standing (Ezekiel 2:1); the prophet answers the commission.'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-son-of-adam-stand-upon-thy-feet-and-the-spirit-entered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *O Daniel, a man greatly beloved... stand upright: for unto thee am I now sent* (Daniel 10:11) — Daniel is raised to STAND to receive the word, as the Spirit set Ezekiel on his feet (Ezekiel 2:2).'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-son-of-adam-stand-upon-thy-feet-and-the-spirit-entered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *the Spirit of life from Elohim (God) entered into them, and they stood upon their feet* (Revelation 11:11) — the same Ruach (Spirit) that *set me upon my feet* (Ezekiel 2:2); the dust-man stands only by the Spirit.'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-son-of-adam-stand-upon-thy-feet-and-the-spirit-entered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Be not afraid of their faces: for I am with thee to deliver thee* (Jeremiah 1:8) — Jeremiah''s charge word for word with Ezekiel 2:6; fear not the hostile people, for the Sender is with him.'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-i-send-thee-to-a-rebellious-house-be-not-afraid'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *be not dismayed at their faces, lest I confound thee before them* (Jeremiah 1:17) — the same *be not dismayed at their looks* (Ezekiel 2:6); rise and speak all that is commanded.'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-i-send-thee-to-a-rebellious-house-be-not-afraid'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *they shall fight against thee; but they shall not prevail against thee; for I am with thee* (Jeremiah 1:19) — the rebellious house cannot overthrow the prophet who *shall know there hath been a prophet among them* (Ezekiel 2:5).'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-i-send-thee-to-a-rebellious-house-be-not-afraid'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the house of Yashar''el (Israel) will not hearken unto thee; for they will not hearken unto me* (Ezekiel 3:7) — the *impudent children* of Ezekiel 2:4; their refusal of the prophet is refusal of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=3 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-i-send-thee-to-a-rebellious-house-be-not-afraid'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *As an adamant harder than flint have I made thy forehead: fear them not* (Ezekiel 3:9) — the fear-not of Ezekiel 2:6 sealed with a hardened forehead; strength given for the charge.'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=3 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-i-send-thee-to-a-rebellious-house-be-not-afraid'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *I send you forth as sheep in the midst of wolves* (Matthew 10:16) — the Formed Son sends his own as Ezekiel was sent among *briers and thorns... scorpions* (Ezekiel 2:6).'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-i-send-thee-to-a-rebellious-house-be-not-afraid'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*shake off the dust of your feet* (Matthew 10:14) — where they *will forbear* (Ezekiel 2:5), the word is delivered and the refusal is on their own heads; the prophet''s duty is the speaking.'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-i-send-thee-to-a-rebellious-house-be-not-afraid'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *I am pure from the blood of all men* (Acts 20:26) — Paul in the watchman''s office Ezekiel is given; because he spoke, they *shall know there hath been a prophet* (Ezekiel 2:5) and the watchman is clean.'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=20 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-i-send-thee-to-a-rebellious-house-be-not-afraid'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*I have not shunned to declare unto you all the counsel of Elohim (God)* (Acts 20:27) — the command to *speak my words... whether they will hear, or whether they will forbear* (Ezekiel 2:7) is the faithful herald withholding nothing.'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=20 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-i-send-thee-to-a-rebellious-house-be-not-afraid'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Take it, and eat it up; and it shall make thy belly bitter, but it shall be in thy mouth sweet as honey* (Revelation 10:9) — John receives the same scroll Ezekiel is told to eat (Ezekiel 2:8-9); sweet to receive, bitter for the woe.'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=10 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-a-roll-of-a-book-lamentations-and-mourning-and-woe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *sweet as honey: and as soon as I had eaten it, my belly was bitter* (Revelation 10:10) — the roll of *lamentations, and mourning, and woe* (Ezekiel 2:10) eaten; the bitterness is the weight of the judgment written within.'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=10 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-a-roll-of-a-book-lamentations-and-mourning-and-woe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Go and take the little book which is open in the hand of the angel* (Revelation 10:8) — as the hand spread the roll before Ezekiel (Ezekiel 2:9), the open book is given John; commissioning by the written word.'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=10 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-a-roll-of-a-book-lamentations-and-mourning-and-woe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *a book written within and on the backside, sealed with seven seals* (Revelation 5:1) — written exactly as Ezekiel''s roll, *within and without* (Ezekiel 2:10); the full decree of Yahuah, nothing left blank.'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-a-roll-of-a-book-lamentations-and-mourning-and-woe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *behold a flying roll* (Zechariah 5:1) — the same written sentence of the curse going forth as Ezekiel''s roll of *lamentations, and mourning, and woe* (Ezekiel 2:10).'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=5 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-a-roll-of-a-book-lamentations-and-mourning-and-woe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*I see a flying roll; the length thereof is twenty cubits* (Zechariah 5:2) — the measured roll of the curse, the written word of judgment going forth, like Ezekiel''s roll *written within and without* (Ezekiel 2:10).'
  FROM cross_reference_threads t
  JOIN _s308_ezek02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s308_ezek02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-2-a-roll-of-a-book-lamentations-and-mourning-and-woe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezekiel_3.sql (Ezekiel 3) -----
-- Chapter: Ezekiel 3 — EAT THE ROLL (sweet as honey for sweetness — the word internalized before it is
-- spoken); SENT TO THE HOUSE OF YASHAR''EL (not to a strange-speech people, but to his own hard-hearted
-- house — forehead made strong as adamant, fear them not); and the prophet made a WATCHMAN over the house,
-- accountable for their blood — if he warn not, the blood is required at his hand; if he warn, he hath
-- delivered his soul. The word eaten, the word sent, the word watched-over: the prophet''s commission.
-- Tag: ezek03   Temp view: _s308_ezek03_lookup
-- Sort band: base 32050, step 3 -> 32050, 32053, 32056 (3 threads)
-- Source of EVERY row: 'canon','ezekiel',3,v
--
-- Ezekiel 3 coverage:
--   ★★ v.1-3 (eat this roll, and go speak unto the house of Yashar''el; cause thy belly to eat... Then did
--          I eat it; and it was in my mouth as honey for sweetness)
--        NT:     ★★ Revelation 10:9 (Take it, and eat it up; and it shall make thy belly bitter, but it
--                shall be in thy mouth sweet as honey), ★★ Revelation 10:10 (it was in my mouth sweet as
--                honey: and as soon as I had eaten it, my belly was bitter) — THREAD 1
--        Extras: none warranted (clean canon-NT-Tanakh weave; the scroll-eating type)
--        Tanakh: ★★ Jeremiah 15:16 (Thy words were found, and I did eat them; and thy word was unto me the
--                joy and rejoicing of mine heart), ★ Psalm 119:103 (How sweet are thy words unto my taste!
--                yea, sweeter than honey to my mouth) — THREAD 1
--   ★ v.4-11 (sent not to a people of a strange speech... but to the house of Yashar''el... they will not
--          hearken unto thee; for they will not hearken unto me... fear them not; thy forehead as adamant)
--        NT:     ★ John 1:11 (He came unto his own, and his own received him not), ★ Matthew 13:57 (A
--                prophet is not without honour, save in his own country, and in his own house) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★ Jeremiah 1:18 (I have made thee this day a defenced city, and an iron pillar, and
--                brasen walls), ★ Isaiah 50:7 (I have set my face like a flint... I shall not be ashamed) —
--                THREAD 2
--   v.12-16 (the spirit took me up; the glory of Yahuah; Tel-abib by the river of Chebar; astonished seven
--          days; the word of Yahuah came unto me) — the transport and the seven-day silence; the glory-of-
--          Yahuah theophany held to Ezekiel 1 (the Chebar vision); woven in prose, no separate add.
--        NT:     none warranted    Extras: none warranted    Tanakh: none separate (Ezek 1 holds the
--                Chebar/glory theophany; this is its echo)
--   ★★ v.17-21 (I have made thee a WATCHMAN unto the house of Yashar''el... if thou warn not... his blood
--          will I require at thine hand; but if thou warn... thou hast delivered thy soul)
--        NT:     ★★ Acts 20:26 (I am pure from the blood of all men), ★★ Acts 20:27 (I have not shunned to
--                declare unto you all the counsel of Elohim), ★ Hebrews 13:17 (they watch for your souls,
--                as they that must give account), ★ James 3:1 (we shall receive the greater condemnation)
--                — THREAD 3
--        Extras: none warranted
--        Tanakh: ★★ Ezekiel 33:7 (I have set thee a watchman unto the house of Yashar''el), ★★ Ezekiel 33:8
--                (if thou dost not speak to warn... his blood will I require at thine hand), ★ Ezekiel 33:9
--                (if thou warn... thou hast delivered thy soul), ★ Isaiah 62:6 (I have set watchmen upon
--                thy walls, O Jerusalem) — THREAD 3
--   v.22-27 (the glory in the plain; bands put upon thee; thy tongue cleave to the roof of thy mouth, dumb;
--          but when I speak with thee, I will open thy mouth) — the binding and the dumbness, opened only
--          when Yahuah speaks; the sign-act of the prophet wholly under the word; woven in prose, no
--          separate add (NT none / Extras none / Tanakh none warranted distinct).
--
-- Threads (slug — target libraries):
--   1. ezekiel-3-eat-this-roll-sweet-as-honey-in-my-mouth — NT (Revelation 10) + Tanakh (Jeremiah 15, Psalm 119) [free]
--      (★★ the prophet consuming the word; the same scroll John eats — sweet in the mouth; the word
--       internalized before it is spoken)
--   2. ezekiel-3-sent-to-the-house-of-yasharel-his-own-hardhearted-house — NT (John 1, Matthew 13) + Tanakh (Jeremiah 1, Isaiah 50) [free]
--      (★ sent to his own house that will not hearken; forehead made strong as adamant; fear them not — the
--       rejected-by-his-own prophet, the flint-faced messenger)
--   3. ezekiel-3-i-have-made-thee-a-watchman-his-blood-at-thine-hand — NT (Acts 20, Hebrews 13, James 3) + Tanakh (Ezekiel 33, Isaiah 62) [free]
--      (★★ the watchman''s accountability for the people''s blood; warn and deliver thy soul; the faithful
--       overseer pure from the blood of all)
--
-- Framing notes:
--   ★★ EAT THIS ROLL (THREAD 1): *eat this roll, and go speak unto the house of Yashar''el (Israel)* (3:1),
--      *Then did I eat it; and it was in my mouth as honey for sweetness* (3:3). The word must be consumed,
--      taken into the belly and the bowels, BEFORE it is spoken — internalized, not merely recited. John
--      eats the very same scroll: *Take it, and eat it up; and it shall make thy belly bitter, but it shall
--      be in thy mouth sweet as honey* (Revelation 10:9), *and it was in my mouth sweet as honey: and as
--      soon as I had eaten it, my belly was bitter* (Revelation 10:10) — the sweetness of receiving the word
--      and the bitterness of the judgment it carries. Jeremiah ate it too: *Thy words were found, and I did
--      eat them; and thy word was unto me the joy and rejoicing of mine heart* (Jeremiah 15:16); and the
--      psalmist tastes it: *How sweet are thy words unto my taste! yea, sweeter than honey to my mouth* (Psalm
--      119:103). The word of Yahuah eaten and sweet — the prophet filled with it before he is sent with it.
--   ★ SENT TO HIS OWN HOUSE (THREAD 2): *thou art not sent to a people of a strange speech... but to the
--      house of Yashar''el (Israel)* (3:5), yet *the house of Yashar''el (Israel) will not hearken unto thee;
--      for they will not hearken unto me* (3:7). Sent to his OWN people — who would have heard a stranger but
--      will not hear him. The Formed Son walks the same road: *He came unto his own, and his own received him
--      not* (John 1:11); *A prophet is not without honour, save in his own country, and in his own house*
--      (Matthew 13:57). Against the hard house Yahuah hardens the prophet: *As an adamant harder than flint
--      have I made thy forehead: fear them not* (3:9) — Jeremiah is made *a defenced city, and an iron
--      pillar, and brasen walls* (Jeremiah 1:18); the Servant sets *my face like a flint* (Isaiah 50:7). The
--      messenger to his own hard-hearted house is made harder still, that he not fear their faces.
--   ★★ THE WATCHMAN (THREAD 3): *Son of Adam, I have made thee a watchman unto the house of Yashar''el
--      (Israel): therefore hear the word at my mouth, and give them warning from me* (3:17). The watchman is
--      accountable: if he does not warn, *the same wicked man shall die in his iniquity; but his blood will I
--      require at thine hand* (3:18); but if he warns, *thou hast delivered thy soul* (3:19,21). The blood is
--      on the unwarned''s own head ONLY if the watchman has warned. Paul claims the watchman''s clearance: *I
--      am pure from the blood of all men. For I have not shunned to declare unto you all the counsel of
--      Elohim (God)* (Acts 20:26-27) — the full warning given, the soul delivered. The overseers *watch for
--      your souls, as they that must give account* (Hebrews 13:17); the teachers *shall receive the greater
--      condemnation* (James 3:1) — the weight of the watch. Ezekiel hears the same charge again at 33: *I
--      have set thee a watchman unto the house of Yashar''el (Israel)* (33:7), *if thou dost not speak to warn
--      the wicked... his blood will I require at thine hand* (33:8), *if thou warn... thou hast delivered thy
--      soul* (33:9); and Isaiah sets *watchmen upon thy walls, O Jerusalem, which shall never hold their
--      peace* (Isaiah 62:6). The faithful watchman warns and is clean; the silent watchman bears the blood.
--   VERSES WITH NO SEPARATE ADD: v.12-16 (the spirit took him up, the glory of Yahuah, Tel-abib, seven days
--      astonished — the Chebar-glory theophany held to Ezekiel 1; woven in prose), v.22-27 (the binding, the
--      tongue cleaving, dumb until Yahuah opens his mouth — the prophet wholly under the word; woven in
--      prose). All verses recorded in the coverage checklist above; every block carries at least one thread.

CREATE TEMP VIEW _s308_ezek03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): eat this roll — sweet as honey in my mouth
    ('canon','ezekiel',3,3,'canon','revelation',10,9,'free',
      E'*And I went unto the angel, and said unto him, Give me the little book. And he said unto me, Take it, and eat it up; and it shall make thy belly bitter, but it shall be in thy mouth sweet as honey* (Revelation 10:9). John is told to eat the very scroll Ezekiel ate — *cause thy belly to eat, and fill thy bowels with this roll... Then did I eat it; and it was in my mouth as honey for sweetness* (Ezekiel 3:3). The word is sweet in the receiving; the belly carries the bitterness of the judgment it announces. The word must be consumed before it is spoken.'),
    ('canon','ezekiel',3,3,'canon','revelation',10,10,'free',
      E'*And I took the little book out of the angel''s hand, and ate it up; and it was in my mouth sweet as honey: and as soon as I had eaten it, my belly was bitter* (Revelation 10:10). John''s scroll-eating is Ezekiel''s word for word — *it was in my mouth as honey for sweetness* (Ezekiel 3:3) becomes *it was in my mouth sweet as honey*. The sweetness of receiving the word of Yahuah, the bitterness of the judgment it carries within: the prophet eats the same roll across the canon.'),
    ('canon','ezekiel',3,1,'canon','revelation',10,9,'free',
      E'*Take it, and eat it up; and it shall make thy belly bitter, but it shall be in thy mouth sweet as honey* (Revelation 10:9). The command *eat this roll, and go speak unto the house of Yashar''el (Israel)* (Ezekiel 3:1) is the same charge given John: eat the scroll, then prophesy. The word is taken in before it is sent out; the messenger is filled with the message he must carry.'),
    ('canon','ezekiel',3,3,'canon','jeremiah',15,16,'free',
      E'*Thy words were found, and I did eat them; and thy word was unto me the joy and rejoicing of mine heart: for I am called by thy name, O Yahuah Elohim (LORD God) of hosts* (Jeremiah 15:16). Jeremiah eats the word as Ezekiel eats the roll — *Then did I eat it; and it was in my mouth as honey for sweetness* (Ezekiel 3:3): the word found, eaten, the joy and rejoicing of the heart. The prophet consumes the word of Yahuah before he is sent with it.'),
    ('canon','ezekiel',3,3,'canon','psalms',119,103,'free',
      E'*How sweet are thy words unto my taste! yea, sweeter than honey to my mouth!* (Psalm 119:103). The psalmist tastes what the prophet ate — *it was in my mouth as honey for sweetness* (Ezekiel 3:3). The words of Yahuah are honey to the mouth, sweeter than honey: the word received with delight, taken into the inmost being.'),

    -- THREAD 2 (★): sent to the house of Yashar'el — his own hard-hearted house
    ('canon','ezekiel',3,5,'canon','john',1,11,'free',
      E'*He came unto his own, and his own received him not* (John 1:11). Ezekiel is sent *not to a people of a strange speech and of an hard language, but to the house of Yashar''el (Israel)* (Ezekiel 3:5) — to his OWN people, who *will not hearken* (3:7). The Formed Son walks the same road: he came unto his own, and his own received him not. The messenger sent to his own house meets the hardest hearing of all.'),
    ('canon','ezekiel',3,7,'canon','matthew',13,57,'free',
      E'*And they were offended in him. But Yahusha (Jesus) said unto them, A prophet is not without honour, save in his own country, and in his own house* (Matthew 13:57). Yahuah tells Ezekiel his own house *will not hearken unto thee; for they will not hearken unto me* (Ezekiel 3:7) — strangers would have heard, but his own will not. The Messiah names the same law: a prophet is dishonoured precisely in his own country and house. The nearer the kin, the harder the hearing.'),
    ('canon','ezekiel',3,9,'canon','jeremiah',1,18,'free',
      E'*For, behold, I have made thee this day a defenced city, and an iron pillar, and brasen walls against the whole land... they shall fight against thee; but they shall not prevail against thee* (Jeremiah 1:18). Against the rebellious house Yahuah fortifies the prophet — *As an adamant harder than flint have I made thy forehead: fear them not* (Ezekiel 3:9) is Jeremiah made *a defenced city, and an iron pillar, and brasen walls*. The messenger to the hard house is made harder still, that he not fear their faces.'),
    ('canon','ezekiel',3,9,'canon','isaiah',50,7,'free',
      E'*For Adonai Yahuah (the Lord GOD) will help me; therefore shall I not be confounded: therefore have I set my face like a flint, and I know that I shall not be ashamed* (Isaiah 50:7). The forehead *as an adamant harder than flint* (Ezekiel 3:9) is the Servant''s face *set like a flint* — unmoved before the smiters, not confounded, not ashamed. The prophet sent to his own hard house sets a flint face against their looks: *fear them not, neither be dismayed at their looks* (Ezekiel 3:9).'),

    -- THREAD 3 (★★): I have made thee a watchman — his blood at thine hand
    ('canon','ezekiel',3,18,'canon','acts',20,26,'free',
      E'*Wherefore I take you to record this day, that I am pure from the blood of all men* (Acts 20:26). Paul claims the watchman''s clearance of Ezekiel — *if thou... givest him not warning... his blood will I require at thine hand* (Ezekiel 3:18): having warned fully, Paul is *pure from the blood of all men*, his soul delivered. The faithful watchman who sounds the warning is clean of the blood of those who will not hear.'),
    ('canon','ezekiel',3,17,'canon','acts',20,27,'free',
      E'*For I have not shunned to declare unto you all the counsel of Elohim (God)* (Acts 20:27). The watchman''s charge — *hear the word at my mouth, and give them warning from me* (Ezekiel 3:17) — is exactly what Paul claims to have discharged: he *shunned not to declare... all the counsel of Elohim (God)*. The whole warning given, nothing withheld: that is how the watchman delivers his own soul and is pure from their blood.'),
    ('canon','ezekiel',3,17,'canon','hebrews',13,17,'free',
      E'*Obey them that have the rule over you, and submit yourselves: for they watch for your souls, as they that must give account, that they may do it with joy, and not with grief* (Hebrews 13:17). The watchman *unto the house of Yashar''el (Israel)* (Ezekiel 3:17) is the overseer who *watch[es] for your souls, as they that must give account* — the same accountability for the souls watched over. The watch is a charge to be answered for before Yahuah.'),
    ('canon','ezekiel',3,18,'canon','james',3,1,'free',
      E'*My brethren, be not many masters, knowing that we shall receive the greater condemnation* (James 3:1). The weight Ezekiel bears — *his blood will I require at thine hand* (Ezekiel 3:18) — is the *greater condemnation* of those who teach and warn: the one set over souls answers for the watch. The office of warning carries a heavier reckoning, not a lighter one.'),
    ('canon','ezekiel',3,17,'canon','ezekiel',33,7,'free',
      E'*So thou, O son of Adam, I have set thee a watchman unto the house of Yashar''el (Israel); therefore thou shalt hear the word at my mouth, and warn them from me* (Ezekiel 33:7). The watchman-charge of *I have made thee a watchman unto the house of Yashar''el (Israel)* (Ezekiel 3:17) is repeated word for word at chapter 33 — the same commission renewed: hear the word at my mouth, and warn them from me. The watch is the prophet''s standing office over the house.'),
    ('canon','ezekiel',3,18,'canon','ezekiel',33,8,'free',
      E'*When I say unto the wicked, O wicked man, thou shalt surely die; if thou dost not speak to warn the wicked from his way, that wicked man shall die in his iniquity; but his blood will I require at thine hand* (Ezekiel 33:8). The blood-accountability of *his blood will I require at thine hand* (Ezekiel 3:18) is restated exactly at 33:8 — the unwarned dies in his iniquity, but his blood is required of the silent watchman. The charge is doubled in the book: the watchman who will not warn answers for the blood.'),
    ('canon','ezekiel',3,19,'canon','ezekiel',33,9,'free',
      E'*Nevertheless, if thou warn the wicked of his way to turn from it; if he do not turn from his way, he shall die in his iniquity; but thou hast delivered thy soul* (Ezekiel 33:9). The deliverance of *thou hast delivered thy soul* (Ezekiel 3:19) is repeated at 33:9 — the watchman who warns is clear, though the wicked refuse. The blood is on the unwarned''s own head only when the watchman has sounded the warning.'),
    ('canon','ezekiel',3,17,'canon','isaiah',62,6,'free',
      E'*I have set watchmen upon thy walls, O Jerusalem, which shall never hold their peace day nor night: ye that make mention of Yahuah (LORD), keep not silence* (Isaiah 62:6). The watchman *unto the house of Yashar''el (Israel)* (Ezekiel 3:17) stands with the watchmen Isaiah sets *upon thy walls, O Jerusalem* — those who *never hold their peace*, who *keep not silence*. The watchman''s whole office is to speak and not be silent; silence is the one thing forbidden him.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-3-eat-this-roll-sweet-as-honey-in-my-mouth',
       E'Eat this roll — and it was in my mouth as honey for sweetness',
       E'Before the prophet can speak the word, he must eat it. Yahuah commands: *Son of Adam, eat that thou findest; eat this roll, and go speak unto the house of Yashar''el (Israel)* (3:1), *So I opened my mouth, and he caused me to eat that roll* (3:2), *And he said unto me, Son of Adam, cause thy belly to eat, and fill thy bowels with this roll that I give thee. Then did I eat it; and it was in my mouth as honey for sweetness* (3:3). The word is not merely recited — it is consumed, taken into the belly and the bowels, internalized before it is uttered, and it is sweet. John, at the canon''s other end, eats the very same scroll: *Take it, and eat it up; and it shall make thy belly bitter, but it shall be in thy mouth sweet as honey* (Revelation 10:9), *and it was in my mouth sweet as honey: and as soon as I had eaten it, my belly was bitter* (Revelation 10:10) — sweet in the receiving, bitter in the judgment it carries. Jeremiah ate it before them both: *Thy words were found, and I did eat them; and thy word was unto me the joy and rejoicing of mine heart* (Jeremiah 15:16). And the psalmist tastes its sweetness: *How sweet are thy words unto my taste! yea, sweeter than honey to my mouth!* (Psalm 119:103). The word of Yahuah eaten, sweet as honey — the messenger filled with the message before he is sent with it.',
       sv.verse_id, ev.verse_id, 'free', 32050
  FROM _s308_ezek03_lookup sv, _s308_ezek03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=3 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-3-sent-to-the-house-of-yasharel-his-own-hardhearted-house',
       E'Sent to the house of Yashar''el — his own hard-hearted house that will not hearken',
       E'The prophet is sent not to foreigners but to his own people — and they are the hardest hearing of all. *For thou art not sent to a people of a strange speech and of an hard language, but to the house of Yashar''el (Israel)* (3:5); indeed *had I sent thee to them, they would have hearkened unto thee* (3:6) — *But the house of Yashar''el (Israel) will not hearken unto thee; for they will not hearken unto me: for all the house of Yashar''el (Israel) are impudent and hardhearted* (3:7). The Formed Son walks this very road: *He came unto his own, and his own received him not* (John 1:11); *A prophet is not without honour, save in his own country, and in his own house* (Matthew 13:57). Against the rebellious house Yahuah hardens the messenger to match: *Behold, I have made thy face strong against their faces, and thy forehead strong against their foreheads. As an adamant harder than flint have I made thy forehead: fear them not, neither be dismayed at their looks, though they be a rebellious house* (3:8-9). So Jeremiah is made *a defenced city, and an iron pillar, and brasen walls* (Jeremiah 1:18); so the Servant sets *my face like a flint... I know that I shall not be ashamed* (Isaiah 50:7). The prophet sent to his own hard house is made harder still — flint-faced, unafraid of their looks — that the word may go forth though they will not hear.',
       sv.verse_id, ev.verse_id, 'free', 32053
  FROM _s308_ezek03_lookup sv, _s308_ezek03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-3-i-have-made-thee-a-watchman-his-blood-at-thine-hand',
       E'I have made thee a watchman — his blood will I require at thine hand',
       E'After the seven days'' silence the word comes with the prophet''s gravest charge: *Son of Adam, I have made thee a watchman unto the house of Yashar''el (Israel): therefore hear the word at my mouth, and give them warning from me* (3:17). The watchman is accountable for the blood of the people: *When I say unto the wicked, Thou shalt surely die; and thou givest him not warning... the same wicked man shall die in his iniquity; but his blood will I require at thine hand* (3:18); *Yet if thou warn the wicked, and he turn not... he shall die in his iniquity; but thou hast delivered thy soul* (3:19). The blood is on the unwarned''s own head ONLY when the watchman has sounded the warning; the silence of the watchman puts the blood on him. Paul claims exactly this clearance: *Wherefore I take you to record this day, that I am pure from the blood of all men. For I have not shunned to declare unto you all the counsel of Elohim (God)* (Acts 20:26-27) — the whole warning given, the soul delivered. The overseers *watch for your souls, as they that must give account* (Hebrews 13:17); the teachers *shall receive the greater condemnation* (James 3:1) — the weight of the watch is a heavier reckoning, not a lighter one. Ezekiel hears the same charge renewed at chapter 33: *I have set thee a watchman unto the house of Yashar''el (Israel)* (33:7), *if thou dost not speak to warn the wicked from his way... his blood will I require at thine hand* (33:8), *if thou warn the wicked of his way to turn from it... thou hast delivered thy soul* (33:9). And Isaiah sets *watchmen upon thy walls, O Jerusalem, which shall never hold their peace day nor night... keep not silence* (Isaiah 62:6). The faithful watchman warns and is clean of their blood; the silent watchman bears it. His one duty is to speak.',
       sv.verse_id, ev.verse_id, 'free', 32056
  FROM _s308_ezek03_lookup sv, _s308_ezek03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=3 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Take it, and eat it up; and it shall make thy belly bitter, but it shall be in thy mouth sweet as honey* (Revelation 10:9) — John is told to eat the very scroll Ezekiel 3:3 ate; sweet in the mouth, bitter in the belly.'
  FROM cross_reference_threads t
  JOIN _s308_ezek03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=3
  JOIN _s308_ezek03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=10 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-3-eat-this-roll-sweet-as-honey-in-my-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *it was in my mouth sweet as honey: and as soon as I had eaten it, my belly was bitter* (Revelation 10:10) — John''s scroll-eating is Ezekiel 3:3 word for word; the same roll eaten across the canon.'
  FROM cross_reference_threads t
  JOIN _s308_ezek03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=3
  JOIN _s308_ezek03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=10 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-3-eat-this-roll-sweet-as-honey-in-my-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Take it, and eat it up... sweet as honey* (Revelation 10:9) — the command *eat this roll, and go speak* (Ezekiel 3:1) is John''s charge too: eat the word, then prophesy.'
  FROM cross_reference_threads t
  JOIN _s308_ezek03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s308_ezek03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=10 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-3-eat-this-roll-sweet-as-honey-in-my-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *Thy words were found, and I did eat them; and thy word was unto me the joy and rejoicing of mine heart* (Jeremiah 15:16) — Jeremiah eats the word as Ezekiel 3:3 eats the roll; the word consumed before it is sent.'
  FROM cross_reference_threads t
  JOIN _s308_ezek03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=3
  JOIN _s308_ezek03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=15 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-3-eat-this-roll-sweet-as-honey-in-my-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *How sweet are thy words unto my taste! yea, sweeter than honey to my mouth!* (Psalm 119:103) — the psalmist tastes what the prophet ate (Ezekiel 3:3); the word honey to the mouth.'
  FROM cross_reference_threads t
  JOIN _s308_ezek03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=3
  JOIN _s308_ezek03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=103
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-3-eat-this-roll-sweet-as-honey-in-my-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *He came unto his own, and his own received him not* (John 1:11) — the Formed Son walks Ezekiel''s road (3:5,7); sent to his own house that will not hearken.'
  FROM cross_reference_threads t
  JOIN _s308_ezek03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s308_ezek03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-3-sent-to-the-house-of-yasharel-his-own-hardhearted-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *A prophet is not without honour, save in his own country, and in his own house* (Matthew 13:57) — the Messiah names the law Ezekiel 3:7 lives: the nearer the kin, the harder the hearing.'
  FROM cross_reference_threads t
  JOIN _s308_ezek03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s308_ezek03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=57
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-3-sent-to-the-house-of-yasharel-his-own-hardhearted-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *I have made thee this day a defenced city, and an iron pillar, and brasen walls* (Jeremiah 1:18) — against the hard house Yahuah fortifies the prophet; the forehead made adamant (Ezekiel 3:9).'
  FROM cross_reference_threads t
  JOIN _s308_ezek03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s308_ezek03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-3-sent-to-the-house-of-yasharel-his-own-hardhearted-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *I have set my face like a flint, and I know that I shall not be ashamed* (Isaiah 50:7) — the Servant''s flint face is the forehead *harder than flint* (Ezekiel 3:9); unmoved before their looks.'
  FROM cross_reference_threads t
  JOIN _s308_ezek03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s308_ezek03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=50 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-3-sent-to-the-house-of-yasharel-his-own-hardhearted-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I am pure from the blood of all men* (Acts 20:26) — Paul claims the watchman''s clearance; having warned fully (Ezekiel 3:18), his soul is delivered, clean of their blood.'
  FROM cross_reference_threads t
  JOIN _s308_ezek03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s308_ezek03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=20 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-3-i-have-made-thee-a-watchman-his-blood-at-thine-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I have not shunned to declare unto you all the counsel of Elohim (God)* (Acts 20:27) — the watchman''s charge to *give them warning from me* (Ezekiel 3:17) discharged: nothing withheld.'
  FROM cross_reference_threads t
  JOIN _s308_ezek03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s308_ezek03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=20 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-3-i-have-made-thee-a-watchman-his-blood-at-thine-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *they watch for your souls, as they that must give account* (Hebrews 13:17) — the overseers are watchmen unto the house (Ezekiel 3:17); the watch is a charge answered for.'
  FROM cross_reference_threads t
  JOIN _s308_ezek03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s308_ezek03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-3-i-have-made-thee-a-watchman-his-blood-at-thine-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *we shall receive the greater condemnation* (James 3:1) — the weight of *his blood will I require at thine hand* (Ezekiel 3:18): the one set over souls answers for the watch.'
  FROM cross_reference_threads t
  JOIN _s308_ezek03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s308_ezek03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-3-i-have-made-thee-a-watchman-his-blood-at-thine-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *I have set thee a watchman unto the house of Yashar''el (Israel)... warn them from me* (Ezekiel 33:7) — the watchman-charge of 3:17 repeated word for word; the standing office over the house.'
  FROM cross_reference_threads t
  JOIN _s308_ezek03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s308_ezek03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-3-i-have-made-thee-a-watchman-his-blood-at-thine-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *if thou dost not speak to warn the wicked from his way... his blood will I require at thine hand* (Ezekiel 33:8) — the blood-accountability of 3:18 restated exactly; the silent watchman bears the blood.'
  FROM cross_reference_threads t
  JOIN _s308_ezek03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s308_ezek03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-3-i-have-made-thee-a-watchman-his-blood-at-thine-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *if thou warn the wicked of his way to turn from it... thou hast delivered thy soul* (Ezekiel 33:9) — the deliverance of 3:19 repeated; the watchman who warns is clear, though the wicked refuse.'
  FROM cross_reference_threads t
  JOIN _s308_ezek03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s308_ezek03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-3-i-have-made-thee-a-watchman-his-blood-at-thine-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *I have set watchmen upon thy walls, O Jerusalem, which shall never hold their peace... keep not silence* (Isaiah 62:6) — the watchman''s one duty is to speak (Ezekiel 3:17); silence is the thing forbidden him.'
  FROM cross_reference_threads t
  JOIN _s308_ezek03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s308_ezek03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-3-i-have-made-thee-a-watchman-his-blood-at-thine-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezekiel_38.sql (Ezekiel 38) -----
-- Chapter: Ezekiel 38 — ★★ GOG OF THE LAND OF MAGOG. Set thy face against Gog, the chief prince of
-- Meshech and Tubal; in the latter years he comes up against the land brought back from the sword and
-- gathered out of many people, against the mountains of Yashar''el (Israel), as a cloud to cover the
-- land — the latter-day gathering of the nations against the REGATHERED (two-house) people who dwell
-- safely. Then Yahuah''s fury comes up in his face: a great shaking in the land, pestilence, blood, an
-- overflowing rain, great hailstones, fire and brimstone — and *Thus will I magnify myself, and sanctify
-- myself; and I will be known in the eyes of many nations* (38:23). The chapter is the eschatological
-- assault on the gathered house and Yahuah''s self-vindication through judgment. It weaves FORWARD to
-- Revelation 20:7-9 (Gog and Magog gathered against the camp of the saints, fire from heaven) and
-- Revelation 16 (the kings gathered to the battle of the great day; a great earthquake), LATERALLY to
-- Joel 3 (the valley of Jehoshaphat), Zechariah 14 (all nations against Jerusalem), Haggai 2 / Hebrews 12
-- (I will shake the heavens and the earth — yet once more), and Ezekiel 39:7 (I will sanctify my holy name).
-- Tag: ezek38   Temp view: _s308_ezek38_lookup
-- Sort band: base 32925, step 3 -> 32925, 32928, 32931 (3 threads)
-- Source of EVERY row: 'canon','ezekiel',38,v
--
-- Ezekiel 38 coverage:
--   v.1 (the word of Yahuah came) — framing; no separate add (NT none / Extras none / Tanakh none warranted)
--   ★★ v.2-9 (set thy face against Gog, the land of Magog, the chief prince of Meshech and Tubal... in the
--          latter years thou shalt come into the land that is brought back from the sword, and is gathered
--          out of many people, against the mountains of Yashar''el... they shall dwell safely all of them;
--          thou shalt be like a cloud to cover the land)
--        NT:     ★★ Revelation 20:8 (deceive the nations... Gog and Magog, to gather them together to
--                battle), ★★ Revelation 20:9 (compassed the camp of the saints about... and fire came down
--                from Elohim out of heaven), ★ Revelation 16:14 (gather them to the battle of that great
--                day) — THREAD 1
--        Extras: none warranted (clean canon-NT-Tanakh latter-day-assault weave)
--        Tanakh: ★ Joel 3:2 (gather all nations... into the valley of Jehoshaphat... for my people... whom
--                they have scattered), ★ Joel 3:12 (let the heathen... come up to the valley of
--                Jehoshaphat: for there will I sit to judge), ★ Zechariah 14:2 (I will gather all nations
--                against Jerusalem to battle), ★ Zechariah 14:3 (then shall Yahuah go forth, and fight
--                against those nations) — THREAD 1
--   ★★ v.15-16 (thou shalt come from thy place out of the north parts... thou shalt come up against my
--          people of Yashar''el, as a cloud to cover the land; it shall be in the latter days... that the
--          heathen may know me, when I shall be sanctified in thee)
--        NT:     held in THREAD 1 (the latter-days assault; Revelation 20 weave)
--        Extras: none warranted
--        Tanakh: held in THREAD 1 (Joel 3 / Zechariah 14 — all nations gathered against the land)
--   v.17 (Art thou he of whom I have spoken in old time by my servants the prophets) — the prophets
--          foretold Gog; woven in THREAD 1 prose; no separate add (NT none / Extras none / Tanakh none)
--   ★ v.10-13 (it shall come to pass that... thou shalt think an evil thought... I will go up to the land
--          of unwalled villages... to take a spoil... upon the people that are gathered out of the nations,
--          which have gotten cattle and goods, that dwell in the midst of the land)
--        NT:     ★ 1 Thessalonians 5:3 (when they shall say, Peace and safety; then sudden destruction
--                cometh upon them... and they shall not escape) — THREAD 3
--        Extras: none warranted
--        Tanakh: held in prose — the unwalled, secure people = the safely-dwelling gathered house of
--                38:8,11 (the dwell-safely refrain bound back to THREAD 1)
--   ★ v.18-23 (my fury shall come up in my face... there shall be a great shaking in the land of
--          Yashar''el... I will plead against him with pestilence and with blood... an overflowing rain,
--          and great hailstones, fire, and brimstone... Thus will I magnify myself, and sanctify myself;
--          and I will be known in the eyes of many nations)
--        NT:     ★★ Hebrews 12:26 (Yet once more I shake not the earth only, but also heaven), ★ Hebrews
--                12:27 (the removing of those things that are shaken), ★ Revelation 16:18 (a great
--                earthquake, such as was not since men were upon the earth) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Haggai 2:6 (Yet once... I will shake the heavens, and the earth), ★ Haggai 2:7 (I
--                will shake all nations), ★ Ezekiel 39:7 (so will I make my holy name known in the midst
--                of my people... the heathen shall know that I am Yahuah) — THREAD 2
--
-- Threads (slug — target libraries):
--   1. ezekiel-38-gog-of-magog-against-the-mountains-of-yasharel-in-the-latter-days — NT (Revelation 20, Revelation 16) + Tanakh (Joel 3, Zechariah 14) [free]
--      (★★ the latter-day gathering of the nations against the REGATHERED two-house people; Gog and Magog forward to Rev 20)
--   2. ezekiel-38-a-great-shaking-thus-will-i-magnify-and-sanctify-myself — NT (Hebrews 12, Revelation 16) + Tanakh (Haggai 2, Ezekiel 39) [free]
--      (★ Yahuah''s self-vindication through judgment; the great shaking of heaven and earth; sanctify my holy name)
--   3. ezekiel-38-the-evil-thought-against-the-people-that-dwell-safely — NT (1 Thessalonians 5) [free]
--      (★ the greedy design against the unwalled, secure people; peace-and-safety then sudden destruction)
--
-- Framing notes:
--   ★★ GOG AGAINST THE REGATHERED HOUSE (THREAD 1): *Son of Adam, set thy face against Gog, the land of
--      Magog, the chief prince of Meshech and Tubal* (38:2); *In the latter years thou shalt come into the
--      land that is brought back from the sword, and is gathered out of many people, against the mountains
--      of Yashar''el (Israel)... and they shall dwell safely all of them* (38:8); *thou shalt come up
--      against my people of Yashar''el (Israel), as a cloud to cover the land; it shall be in the latter
--      days* (38:16). This is the latter-day assault of the nations on the REGATHERED people — the two-house
--      house gathered back from the sword and out of many peoples (Ezekiel 37 just enacted the gathering).
--      John fills it by name: *Gog and Magog, to gather them together to battle* (Revelation 20:8), and the
--      end is the same fire of heaven — *fire came down from Elohim (God) out of heaven, and devoured them*
--      (Revelation 20:9). The kings of the earth are gathered *to the battle of that great day of El Shaddai
--      (God Almighty)* (Revelation 16:14). Joel sees the same gathering — *I will also gather all nations,
--      and will bring them down into the valley of Jehoshaphat, and will plead with them there for my
--      people* (Joel 3:2), *for there will I sit to judge all the heathen round about* (Joel 3:12); and
--      Zechariah — *I will gather all nations against Jerusalem to battle* (Zechariah 14:2), *Then shall
--      Yahuah (LORD) go forth, and fight against those nations* (Zechariah 14:3). Yahuah himself draws Gog
--      with hooks (38:4) that *the heathen may know me, when I shall be sanctified in thee* (38:16) — the
--      assault is the stage of his self-revelation.
--   ★ THE GREAT SHAKING (THREAD 2): *my fury shall come up in my face. For in my jealousy and in the fire
--      of my wrath have I spoken, Surely in that day there shall be a great shaking in the land of
--      Yashar''el (Israel)* (38:18-19); *the mountains shall be thrown down... and every wall shall fall to
--      the ground* (38:20); *I will plead against him with pestilence and with blood; and I will rain upon
--      him... an overflowing rain, and great hailstones, fire, and brimstone* (38:22); *Thus will I magnify
--      myself, and sanctify myself; and I will be known in the eyes of many nations* (38:23). The great
--      shaking is the cosmic upheaval Haggai foretold — *Yet once, it is a little while, and I will shake
--      the heavens, and the earth, and the sea, and the dry land* (Haggai 2:6), *And I will shake all
--      nations* (Haggai 2:7) — and Hebrews reads as the final shaking: *Yet once more I shake not the earth
--      only, but also heaven* (Hebrews 12:26), *the removing of those things that are shaken... that those
--      things which cannot be shaken may remain* (Hebrews 12:27). John sees the same earthquake — *a great
--      earthquake, such as was not since men were upon the earth* (Revelation 16:18) — with the same great
--      hail (Rev 16:21). And the self-sanctification is the very word of the next chapter: *So will I make
--      my holy name known in the midst of my people Yashar''el (Israel)... and the heathen shall know that I
--      am Yahuah (LORD), the Holy One in Yashar''el* (Ezekiel 39:7). Yahuah vindicates his own Name through
--      the judgment — not ethnic vengeance, but the Most High made known.
--   ★ THE EVIL THOUGHT AGAINST THE SECURE PEOPLE (THREAD 3): *at the same time shall things come into thy
--      mind, and thou shalt think an evil thought: And thou shalt say, I will go up to the land of unwalled
--      villages; I will go to them that are at rest, that dwell safely, all of them dwelling without walls,
--      and having neither bars nor gates, To take a spoil, and to take a prey... upon the people that are
--      gathered out of the nations, which have gotten cattle and goods, that dwell in the midst of the land*
--      (38:10-12). The greedy design falls on a people *at rest, that dwell safely* — exactly the
--      Peace-and-safety of the day of Yahuah: *when they shall say, Peace and safety; then sudden
--      destruction cometh upon them, as travail upon a woman with child; and they shall not escape* (1
--      Thessalonians 5:3). The unwalled, secure, gathered people are the safely-dwelling house of 38:8,11;
--      the spoiler''s evil thought is the prelude to the sudden destruction that overtakes the spoiler, not
--      the spoiled.
--   VERSES WITH NO SEPARATE ADD: v.1 (the word of Yahuah came — framing), v.17 (Art thou he of whom I have
--      spoken... by my servants the prophets — the prophets foretold Gog; woven into THREAD 1 prose). All
--      verses recorded in the coverage checklist above; every meaningful block carries a thread.

CREATE TEMP VIEW _s308_ezek38_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Gog of Magog against the mountains of Yashar'el in the latter days
    ('canon','ezekiel',38,8,'canon','revelation',20,8,'free',
      E'*And shall go out to deceive the nations which are in the four quarters of the earth, Gog and Magog, to gather them together to battle: the number of whom is as the sand of the sea* (Revelation 20:8). John names Ezekiel''s adversary by name: the latter-day comer *into the land that is brought back from the sword, and is gathered out of many people, against the mountains of Yashar''el (Israel)* (Ezekiel 38:8) is the Gog and Magog gathered against the gathered people. The nations massed against the regathered house are the same end-time assault sealed in the Revelation.'),
    ('canon','ezekiel',38,16,'canon','revelation',20,8,'free',
      E'*Gog and Magog, to gather them together to battle: the number of whom is as the sand of the sea* (Revelation 20:8). The promise *thou shalt come up against my people of Yashar''el (Israel), as a cloud to cover the land; it shall be in the latter days* (Ezekiel 38:16) is fulfilled in the last gathering of the nations — Gog and Magog, numberless as the sand — against the people of Yahuah. The cloud covering the land and the sand-numbered host are one latter-day siege.'),
    ('canon','ezekiel',38,16,'canon','revelation',20,9,'free',
      E'*And they went up on the breadth of the earth, and compassed the camp of the saints about, and the beloved city: and fire came down from Elohim (God) out of heaven, and devoured them* (Revelation 20:9). The host that comes *up against my people of Yashar''el (Israel), as a cloud to cover the land* (Ezekiel 38:16) is broken by fire from heaven — the very *fire, and brimstone* Yahuah rains in Ezekiel 38:22. The nations compass the gathered house only to be devoured by the fire of heaven; the assault ends in Yahuah''s vindication.'),
    ('canon','ezekiel',38,8,'canon','revelation',16,14,'free',
      E'*For they are the spirits of devils, working miracles, which go forth unto the kings of the earth and of the whole world, to gather them to the battle of that great day of El Shaddai (God Almighty)* (Revelation 16:14). The gathering of Gog and his many peoples *against the mountains of Yashar''el (Israel)* (Ezekiel 38:8) is the same mustering of the kings of the earth to *the battle of that great day*. The latter-day siege of the gathered house is the final battle of the great day of Yahuah.'),
    ('canon','ezekiel',38,8,'canon','joel',3,2,'free',
      E'*I will also gather all nations, and will bring them down into the valley of Jehoshaphat, and will plead with them there for my people and for my heritage Yashar''el (Israel), whom they have scattered among the nations, and parted my land* (Joel 3:2). Joel sees the same gathering of the nations against the same regathered people — *the land that is brought back from the sword, and is gathered out of many people* (Ezekiel 38:8). Yahuah gathers the nations only to plead with them for his heritage Yashar''el; the assault on the gathered house is the occasion of his judgment on the gatherers.'),
    ('canon','ezekiel',38,16,'canon','joel',3,12,'free',
      E'*Let the heathen be wakened, and come up to the valley of Jehoshaphat: for there will I sit to judge all the heathen round about* (Joel 3:12). The coming up of Gog *against my people of Yashar''el (Israel)... in the latter days* (Ezekiel 38:16) is the coming up of the heathen to the valley of decision where Yahuah sits to judge. The nations rise against the gathered people and find themselves arraigned before the throne.'),
    ('canon','ezekiel',38,16,'canon','zechariah',14,2,'free',
      E'*For I will gather all nations against Jerusalem to battle; and the city shall be taken, and the houses rifled... and half of the city shall go forth into captivity* (Zechariah 14:2). Zechariah names the same latter-day gathering Ezekiel foretells — Gog coming *up against my people of Yashar''el (Israel), as a cloud to cover the land* (Ezekiel 38:16): all nations gathered against the city and the gathered people. The two prophets see one siege of the regathered house in the day of Yahuah.'),
    ('canon','ezekiel',38,16,'canon','zechariah',14,3,'free',
      E'*Then shall Yahuah (LORD) go forth, and fight against those nations, as when he fought in the day of battle* (Zechariah 14:3). As the heathen come *up against my people of Yashar''el (Israel)... in the latter days* (Ezekiel 38:16), so Yahuah himself goes forth to fight against them — the same divine warrior who turns Gog back with hooks (Ezekiel 38:4). The assault on the gathered house is met by Yahuah''s own war upon the nations.'),

    -- THREAD 2 (★): a great shaking — Thus will I magnify myself, and sanctify myself
    ('canon','ezekiel',38,19,'canon','haggai',2,6,'free',
      E'*For thus saith Yahuah Tseva''ot (LORD of hosts); Yet once, it is a little while, and I will shake the heavens, and the earth, and the sea, and the dry land* (Haggai 2:6). The promise *there shall be a great shaking in the land of Yashar''el (Israel)* (Ezekiel 38:19) is the cosmic shaking Haggai foretells — heaven and earth and sea and dry land moved at Yahuah''s coming. The great shaking that throws down the mountains (38:20) is the shaking of all things in the day of judgment.'),
    ('canon','ezekiel',38,20,'canon','haggai',2,7,'free',
      E'*And I will shake all nations, and the desire of all nations shall come: and I will fill this house with glory, saith Yahuah Tseva''ot (LORD of hosts)* (Haggai 2:7). When *the mountains shall be thrown down, and the steep places shall fall, and every wall shall fall to the ground* (Ezekiel 38:20), it is the shaking of all nations Haggai names. The great shaking topples the works of the nations and clears the way for the glory of Yahuah.'),
    ('canon','ezekiel',38,19,'canon','hebrews',12,26,'free',
      E'*Whose voice then shook the earth: but now he hath promised, saying, Yet once more I shake not the earth only, but also heaven* (Hebrews 12:26). Hebrews reads Haggai''s shaking as the final, once-more shaking — and Ezekiel''s *great shaking in the land of Yashar''el (Israel)* (Ezekiel 38:19) belongs to that same last upheaval of heaven and earth. The shaking at Gog''s overthrow is the shaking that ends the age.'),
    ('canon','ezekiel',38,20,'canon','hebrews',12,27,'free',
      E'*And this word, Yet once more, signifieth the removing of those things that are shaken, as of things that are made, that those things which cannot be shaken may remain* (Hebrews 12:27). When *every wall shall fall to the ground* (Ezekiel 38:20), it is the removing of the things that are shaken — the works of man overthrown — that the unshakable kingdom may stand. The great shaking is not destruction only but the clearing away of all that cannot remain.'),
    ('canon','ezekiel',38,22,'canon','revelation',16,18,'free',
      E'*And there were voices, and thunders, and lightnings; and there was a great earthquake, such as was not since men were upon the earth, so mighty an earthquake, and so great* (Revelation 16:18). The *overflowing rain, and great hailstones, fire, and brimstone* Yahuah rains on Gog (Ezekiel 38:22) is matched by the seventh vial''s great earthquake and great hail (Rev 16:18,21). The pestilence, hail, fire, and brimstone of Ezekiel 38 are the plagues of the great day poured out on the gathered nations.'),
    ('canon','ezekiel',38,23,'canon','ezekiel',39,7,'free',
      E'*So will I make my holy name known in the midst of my people Yashar''el (Israel); and I will not let them pollute my holy name any more: and the heathen shall know that I am Yahuah (LORD), the Holy One in Yashar''el (Israel)* (Ezekiel 39:7). The self-vindication *Thus will I magnify myself, and sanctify myself; and I will be known in the eyes of many nations* (Ezekiel 38:23) is the very making-known of the holy Name that follows. The judgment of Gog is the stage on which Yahuah sanctifies his own Name before the nations — his self-revelation, not ethnic vengeance.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek38_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek38_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 3 (★): the evil thought against the people that dwell safely
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    ('canon','ezekiel',38,11,'canon','1-thessalonians',5,3,'free',
      E'*For when they shall say, Peace and safety; then sudden destruction cometh upon them, as travail upon a woman with child; and they shall not escape* (1 Thessalonians 5:3). Gog''s evil thought falls on a people *at rest, that dwell safely, all of them dwelling without walls, and having neither bars nor gates* (Ezekiel 38:11) — the very Peace-and-safety of the day of Yahuah. But the sudden destruction overtakes the spoiler, not the spoiled: the unwalled, secure, gathered house is the bait by which Gog is drawn to his own overthrow.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek38_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek38_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-38-gog-of-magog-against-the-mountains-of-yasharel-in-the-latter-days',
       E'Gog of the land of Magog — against the mountains of Yashar''el in the latter days',
       E'Yahuah turns the prophet toward the last enemy: *Son of Adam, set thy face against Gog, the land of Magog, the chief prince of Meshech and Tubal, and prophesy against him* (38:2). The hour is the latter years, and the target is the REGATHERED people: *After many days thou shalt be visited: in the latter years thou shalt come into the land that is brought back from the sword, and is gathered out of many people, against the mountains of Yashar''el (Israel), which have been always waste: but it is brought forth out of the nations, and they shall dwell safely all of them* (38:8). The house that Ezekiel 37 raised from the graves and joined into one stick is now the house Gog comes against: *thou shalt come up against my people of Yashar''el (Israel), as a cloud to cover the land; it shall be in the latter days, and I will bring thee against my land, that the heathen may know me, when I shall be sanctified in thee, O Gog, before their eyes* (38:16). Yahuah himself draws the host with hooks in its jaws (38:4) — the assault is the stage of his self-revelation. John names the adversary outright: *Gog and Magog, to gather them together to battle: the number of whom is as the sand of the sea* (Revelation 20:8), and the siege ends in fire from heaven — *they went up on the breadth of the earth, and compassed the camp of the saints about, and the beloved city: and fire came down from Elohim (God) out of heaven, and devoured them* (Revelation 20:9), the very fire and brimstone of Ezekiel 38:22. The kings of the earth are mustered *to the battle of that great day of El Shaddai (God Almighty)* (Revelation 16:14). And the prophets sang the same gathering: *I will also gather all nations, and will bring them down into the valley of Jehoshaphat, and will plead with them there for my people... whom they have scattered* (Joel 3:2), *for there will I sit to judge all the heathen round about* (Joel 3:12); *I will gather all nations against Jerusalem to battle* (Zechariah 14:2), and then *Yahuah (LORD) go forth, and fight against those nations, as when he fought in the day of battle* (Zechariah 14:3). The nations mass against the gathered two-house people only to meet Yahuah himself — and to know him.',
       sv.verse_id, ev.verse_id, 'free', 32925
  FROM _s308_ezek38_lookup sv, _s308_ezek38_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=38 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=38 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-38-a-great-shaking-thus-will-i-magnify-and-sanctify-myself',
       E'A great shaking in the land — thus will I magnify myself, and sanctify myself',
       E'When Gog comes against the land, Yahuah''s wrath answers: *And it shall come to pass at the same time when Gog shall come against the land of Yashar''el (Israel), saith Adonai Yahuah (the Lord GOD), that my fury shall come up in my face. For in my jealousy and in the fire of my wrath have I spoken, Surely in that day there shall be a great shaking in the land of Yashar''el (Israel)* (38:18-19). The shaking is cosmic: *the fishes of the sea, and the fowls of the heaven, and the beasts of the field... shall shake at my presence, and the mountains shall be thrown down, and the steep places shall fall, and every wall shall fall to the ground* (38:20). Then come the plagues — *I will plead against him with pestilence and with blood; and I will rain upon him... an overflowing rain, and great hailstones, fire, and brimstone* (38:22) — and the purpose of it all: *Thus will I magnify myself, and sanctify myself; and I will be known in the eyes of many nations, and they shall know that I am Yahuah (LORD)* (38:23). The great shaking is the upheaval Haggai foretold: *Yet once, it is a little while, and I will shake the heavens, and the earth, and the sea, and the dry land* (Haggai 2:6), *And I will shake all nations* (Haggai 2:7). Hebrews reads it as the last, once-more shaking: *Yet once more I shake not the earth only, but also heaven* (Hebrews 12:26), *the removing of those things that are shaken... that those things which cannot be shaken may remain* (Hebrews 12:27) — when *every wall shall fall to the ground*, it is the works of man removed that the unshakable kingdom may stand. John sees the same earthquake and hail: *there was a great earthquake, such as was not since men were upon the earth, so mighty an earthquake, and so great* (Revelation 16:18). And the self-sanctification is the word of the next chapter: *So will I make my holy name known in the midst of my people Yashar''el (Israel)... and the heathen shall know that I am Yahuah (LORD), the Holy One in Yashar''el* (Ezekiel 39:7). Yahuah vindicates his own Name through the judgment — not ethnic vengeance on a people, but the Most High made known in the eyes of all nations.',
       sv.verse_id, ev.verse_id, 'free', 32928
  FROM _s308_ezek38_lookup sv, _s308_ezek38_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=38 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=38 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-38-the-evil-thought-against-the-people-that-dwell-safely',
       E'An evil thought — against the people that dwell safely, without walls',
       E'The assault begins as a thought of greed: *Thus saith Adonai Yahuah (the Lord GOD); It shall also come to pass, that at the same time shall things come into thy mind, and thou shalt think an evil thought: And thou shalt say, I will go up to the land of unwalled villages; I will go to them that are at rest, that dwell safely, all of them dwelling without walls, and having neither bars nor gates, To take a spoil, and to take a prey... upon the people that are gathered out of the nations, which have gotten cattle and goods, that dwell in the midst of the land* (38:10-12). The prey is a people *at rest, that dwell safely* — the regathered, unwalled, secure house of v.8 and v.11. This is the very Peace-and-safety of the day of Yahuah: *For when they shall say, Peace and safety; then sudden destruction cometh upon them, as travail upon a woman with child; and they shall not escape* (1 Thessalonians 5:3). But the sudden destruction falls on the spoiler, not the spoiled. The merchants ask, *Art thou come to take a spoil? hast thou gathered thy company to take a prey?* (38:13) — and the answer is that the unwalled, secure people are the bait by which Gog is drawn out of the north to his own overthrow. The evil thought against the safely-dwelling house is the prelude to the great shaking and the fire of heaven.',
       sv.verse_id, ev.verse_id, 'free', 32931
  FROM _s308_ezek38_lookup sv, _s308_ezek38_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=38 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=38 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Gog and Magog, to gather them together to battle: the number of whom is as the sand of the sea* (Revelation 20:8) — John names Ezekiel''s adversary; the nations massed against the regathered house (Ezekiel 38:8).'
  FROM cross_reference_threads t
  JOIN _s308_ezek38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=38 AND sv.verse_number=8
  JOIN _s308_ezek38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-38-gog-of-magog-against-the-mountains-of-yasharel-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Gog and Magog, to gather them together to battle... as the sand of the sea* (Revelation 20:8) — the latter-days coming up against my people (Ezekiel 38:16) = the last sand-numbered gathering.'
  FROM cross_reference_threads t
  JOIN _s308_ezek38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=38 AND sv.verse_number=16
  JOIN _s308_ezek38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-38-gog-of-magog-against-the-mountains-of-yasharel-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *compassed the camp of the saints about... and fire came down from Elohim (God) out of heaven, and devoured them* (Revelation 20:9) — the cloud over the land (Ezekiel 38:16) broken by the fire and brimstone of 38:22.'
  FROM cross_reference_threads t
  JOIN _s308_ezek38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=38 AND sv.verse_number=16
  JOIN _s308_ezek38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-38-gog-of-magog-against-the-mountains-of-yasharel-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *to gather them to the battle of that great day of El Shaddai (God Almighty)* (Revelation 16:14) — the gathering against the mountains of Yashar''el (Ezekiel 38:8) = the final battle of the great day.'
  FROM cross_reference_threads t
  JOIN _s308_ezek38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=38 AND sv.verse_number=8
  JOIN _s308_ezek38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=16 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-38-gog-of-magog-against-the-mountains-of-yasharel-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *gather all nations... into the valley of Jehoshaphat... for my people... whom they have scattered* (Joel 3:2) — the same nations gathered against the same regathered people (Ezekiel 38:8); Yahuah pleads for his heritage.'
  FROM cross_reference_threads t
  JOIN _s308_ezek38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=38 AND sv.verse_number=8
  JOIN _s308_ezek38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-38-gog-of-magog-against-the-mountains-of-yasharel-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *come up to the valley of Jehoshaphat: for there will I sit to judge all the heathen* (Joel 3:12) — the latter-days coming up (Ezekiel 38:16) = the heathen arraigned in the valley of decision.'
  FROM cross_reference_threads t
  JOIN _s308_ezek38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=38 AND sv.verse_number=16
  JOIN _s308_ezek38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-38-gog-of-magog-against-the-mountains-of-yasharel-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *I will gather all nations against Jerusalem to battle* (Zechariah 14:2) — the cloud coming up against my people (Ezekiel 38:16) = all nations gathered against the city and the gathered house.'
  FROM cross_reference_threads t
  JOIN _s308_ezek38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=38 AND sv.verse_number=16
  JOIN _s308_ezek38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-38-gog-of-magog-against-the-mountains-of-yasharel-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *Then shall Yahuah (LORD) go forth, and fight against those nations* (Zechariah 14:3) — as the heathen come up (Ezekiel 38:16), Yahuah himself, who turns Gog back with hooks (38:4), goes forth to war.'
  FROM cross_reference_threads t
  JOIN _s308_ezek38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=38 AND sv.verse_number=16
  JOIN _s308_ezek38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-38-gog-of-magog-against-the-mountains-of-yasharel-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Yet once, it is a little while, and I will shake the heavens, and the earth, and the sea, and the dry land* (Haggai 2:6) — the great shaking in the land (Ezekiel 38:19) = the shaking of all things.'
  FROM cross_reference_threads t
  JOIN _s308_ezek38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=38 AND sv.verse_number=19
  JOIN _s308_ezek38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-38-a-great-shaking-thus-will-i-magnify-and-sanctify-myself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *And I will shake all nations... and I will fill this house with glory* (Haggai 2:7) — when the mountains are thrown down and every wall falls (Ezekiel 38:20), it is the shaking of all nations.'
  FROM cross_reference_threads t
  JOIN _s308_ezek38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=38 AND sv.verse_number=20
  JOIN _s308_ezek38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=2 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-38-a-great-shaking-thus-will-i-magnify-and-sanctify-myself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Yet once more I shake not the earth only, but also heaven* (Hebrews 12:26) — Hebrews reads the shaking as the final once-more upheaval; Ezekiel 38:19''s great shaking belongs to it.'
  FROM cross_reference_threads t
  JOIN _s308_ezek38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=38 AND sv.verse_number=19
  JOIN _s308_ezek38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-38-a-great-shaking-thus-will-i-magnify-and-sanctify-myself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *the removing of those things that are shaken... that those things which cannot be shaken may remain* (Hebrews 12:27) — every wall falling (Ezekiel 38:20) clears the way for the unshakable kingdom.'
  FROM cross_reference_threads t
  JOIN _s308_ezek38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=38 AND sv.verse_number=20
  JOIN _s308_ezek38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-38-a-great-shaking-thus-will-i-magnify-and-sanctify-myself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *there was a great earthquake, such as was not since men were upon the earth* (Revelation 16:18) — the overflowing rain, hailstones, fire and brimstone of Ezekiel 38:22 = the seventh vial''s quake and great hail.'
  FROM cross_reference_threads t
  JOIN _s308_ezek38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=38 AND sv.verse_number=22
  JOIN _s308_ezek38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=16 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-38-a-great-shaking-thus-will-i-magnify-and-sanctify-myself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *So will I make my holy name known in the midst of my people Yashar''el (Israel)... the heathen shall know that I am Yahuah (LORD)* (Ezekiel 39:7) — *Thus will I magnify myself, and sanctify myself* (Ezekiel 38:23): the judgment of Gog sanctifies Yahuah''s Name.'
  FROM cross_reference_threads t
  JOIN _s308_ezek38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=38 AND sv.verse_number=23
  JOIN _s308_ezek38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=39 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-38-a-great-shaking-thus-will-i-magnify-and-sanctify-myself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *when they shall say, Peace and safety; then sudden destruction cometh upon them... and they shall not escape* (1 Thessalonians 5:3) — the people at rest, dwelling safely without walls (Ezekiel 38:11); but the destruction overtakes the spoiler, not the spoiled.'
  FROM cross_reference_threads t
  JOIN _s308_ezek38_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=38 AND sv.verse_number=11
  JOIN _s308_ezek38_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-38-the-evil-thought-against-the-people-that-dwell-safely'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezekiel_39.sql (Ezekiel 39) -----
-- Chapter: Ezekiel 39 — the overthrow of Gog on the mountains of Yashar''el (Israel); the burning of the
-- weapons and the burial in the valley of Hamon-gog; ★★ THE GREAT SACRIFICIAL FEAST OF THE BIRDS on the
-- slain host (Speak unto every feathered fowl... to my sacrifice... ye shall eat the flesh of the mighty,
-- and drink the blood of the princes of the earth); the Name sanctified in the midst of his people; and
-- ★★★ THE CONSUMMATE REGATHERING — Now will I bring again the captivity of Jacob, and have mercy upon the
-- WHOLE house of Yashar''el (Israel)... neither will I hide my face any more from them: for I have poured
-- out my spirit upon the house of Yashar''el (Israel). The Gog overthrow and the bird-feast are drawn
-- directly into Revelation 19-20; the poured-out Spirit on the whole house seals the two-house restoration.
-- Tag: ezek39   Temp view: _s308_ezek39_lookup
-- Sort band: base 32950, step 3 -> 32950, 32953, 32956, 32959 (4 threads)
-- Source of EVERY row: 'canon','ezekiel',39,v
--
-- Ezekiel 39 coverage:
--   ★ v.1-8 (Behold, I am against thee, O Gog... I will turn thee back... cause thine arrows to fall...
--          Thou shalt fall upon the mountains of Yashar''el... I will send a fire on Magog... So will I make
--          my holy name known in the midst of my people Yashar''el)
--        NT:     ★★ Revelation 20:9 (fire came down from Elohim out of heaven, and devoured them — the Gog
--                overthrow consummated) — THREAD 1
--        Extras: none warranted
--        Tanakh: ★ Ezekiel 38:23 (I will magnify myself, and sanctify myself, and I will be known in the
--                eyes of many nations), ★★ Psalm 46:8-10 (Come, behold the works of Yahuah... he maketh
--                wars to cease... he breaketh the bow... Be still, and know that I am Elohim) — THREAD 1
--   v.9-16 (they shall burn the weapons with fire seven years... I will give unto Gog a place there of
--          graves... seven months shall the house of Yashar''el be burying of them, that they may cleanse
--          the land... the valley of Hamon-gog)
--        NT:     none warranted (the burning/burial detail; the slaughter itself answered forward in the
--                bird-feast of THREAD 2 and the fire of THREAD 1)
--        Extras: none warranted
--        Tanakh: none separate (the cleansing of the land after the overthrow; woven in prose)
--   ★★ v.17-20 (Speak unto every feathered fowl, and to every beast of the field, Assemble yourselves...
--          to my sacrifice... that ye may eat flesh, and drink blood... Ye shall eat the flesh of the
--          mighty, and drink the blood of the princes of the earth... Thus ye shall be filled at my table
--          with horses and chariots, with mighty men)
--        NT:     ★★ Revelation 19:17-18 (the supper of the great Elohim... That ye may eat the flesh of
--                kings... and the flesh of mighty men, and the flesh of horses — John draws Ezekiel
--                directly), ★★ Revelation 19:21 (and all the fowls were filled with their flesh) — THREAD 2
--        Extras: none warranted (clean canon-NT weave; no extras forced)
--        Tanakh: held in prose — the great-sacrifice/feast-of-birds answered FORWARD to Revelation 19
--   ★ v.21-24 (I will set my glory among the heathen... the heathen shall know that the house of Yashar''el
--          went into captivity for their iniquity... therefore hid I my face from them, and gave them into
--          the hand of their enemies... According to their uncleanness... hid my face from them)
--        NT:     none warranted (the covenant-lawsuit recognition; the hidden face answered/reversed in
--                THREAD 4 — neither will I hide my face any more, v.29)
--        Extras: none warranted
--        Tanakh: ★ Deuteronomy 31:17-18 (I will hide my face from them... because they are turned unto
--                other gods) — THREAD 3 (the hidden-face covenant clause now vindicated and about to be
--                reversed)
--   ★★★ v.25-29 (Now will I bring again the captivity of Jacob, and have mercy upon the WHOLE house of
--          Yashar''el... when I have gathered them out of their enemies'' lands... neither will I hide my
--          face any more from them: for I have poured out my spirit upon the house of Yashar''el)
--        NT:     ★★★ Acts 2:17 (I will pour out of my Spirit upon all flesh — Joel/Ezekiel together at
--                Shavuot), ★★ Romans 11:26 (so all Yashar''el shall be saved... the Deliverer out of Sion),
--                ★ Romans 11:27 (this is my covenant unto them, when I shall take away their sins) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★★ Joel 2:28 (I will pour out my spirit upon all flesh), ★★ Ezekiel 36:27 (I will put my
--                spirit within you, and cause you to walk in my statutes), ★★ Ezekiel 37:14 (And shall put
--                my spirit in you, and ye shall live) — THREAD 4
--
-- Threads (slug — target libraries):
--   1. ezekiel-39-gog-shall-fall-upon-the-mountains-of-yasharel — NT (Revelation 20) + Tanakh (Ezekiel 38, Psalm 46) [free]
--      (★ Gog overthrown on the mountains; fire on Magog; the Name made known; the works of Yahuah, wars made to cease)
--   2. ezekiel-39-the-feast-of-the-birds-upon-my-sacrifice — NT (Revelation 19) [free]
--      (★★ the great sacrifice of the slain host; the fowls and beasts called to eat flesh and drink blood; John draws Ezekiel directly)
--   3. ezekiel-39-i-hid-my-face-from-them-for-their-iniquity — Tanakh (Deuteronomy 31) [free]
--      (★ the covenant-lawsuit recognition; the exile was for iniquity, the hidden face the Torah foretold — vindicated, about to reverse)
--   4. ezekiel-39-i-have-poured-out-my-spirit-upon-the-whole-house — NT (Acts 2, Romans 11) + Tanakh (Joel 2, Ezekiel 36, Ezekiel 37) [free]
--      (★★★ the consummate regathering of the WHOLE house; the Spirit poured out; the face hidden no more — the two-house restoration sealed)
--
-- Framing notes:
--   ★ THE OVERTHROW OF GOG (THREAD 1): *Behold, I am against thee, O Gog... And I will turn thee back...
--      and will bring thee upon the mountains of Yashar''el (Israel)... Thou shalt fall upon the mountains
--      of Yashar''el (Israel), thou, and all thy bands* (39:1-4); *And I will send a fire on Magog... So
--      will I make my holy name known in the midst of my people Yashar''el (Israel)* (39:6-7). Revelation
--      draws the Gog overthrow forward by name — *Gog and Magog... and fire came down from Elohim (God) out
--      of heaven, and devoured them* (Revelation 20:8-9): the fire on Magog is the fire from heaven that
--      devours the final assembled host. The end of the matter is the Name vindicated, as Yahuah swore the
--      chapter before — *Thus will I magnify myself, and sanctify myself; and I will be known in the eyes of
--      many nations* (Ezekiel 38:23). And the Psalm sings the same desolation of the war-host — *Come,
--      behold the works of Yahuah (LORD), what desolations he hath made in the earth. He maketh wars to
--      cease unto the end of the earth; he breaketh the bow, and cutteth the spear in sunder; he burneth the
--      chariot in the fire... Be still, and know that I am Elohim (God): I will be exalted among the heathen*
--      (Psalm 46:8-10) — the bow smitten, the chariot burned, the heathen made to KNOW the Name.
--   ★★ THE FEAST OF THE BIRDS (THREAD 2): *Speak unto every feathered fowl, and to every beast of the
--      field, Assemble yourselves, and come; gather yourselves on every side to my sacrifice that I do
--      sacrifice for you, even a great sacrifice upon the mountains of Yashar''el (Israel), that ye may eat
--      flesh, and drink blood. Ye shall eat the flesh of the mighty, and drink the blood of the princes of
--      the earth... Thus ye shall be filled at my table with horses and chariots, with mighty men* (39:17-20).
--      John draws Ezekiel directly into the final battle: *I saw an angel standing in the sun; and he cried
--      with a loud voice, saying to all the fowls that fly in the midst of heaven, Come and gather
--      yourselves together unto the supper of the great Elohim (God); That ye may eat the flesh of kings,
--      and the flesh of captains, and the flesh of mighty men, and the flesh of horses* (Revelation
--      19:17-18) — the same summons to the fowls, the same eating of the flesh of the mighty and of horses.
--      And it is fulfilled: *all the fowls were filled with their flesh* (Revelation 19:21), even as Ezekiel
--      said *ye shall eat fat till ye be full* (39:19). The supper of the great Elohim is Ezekiel''s great
--      sacrifice upon the mountains of Yashar''el.
--   ★ THE HIDDEN FACE FOR INIQUITY (THREAD 3): *And the heathen shall know that the house of Yashar''el
--      (Israel) went into captivity for their iniquity: because they trespassed against me, therefore hid I
--      my face from them, and gave them into the hand of their enemies* (39:23); *According to their
--      uncleanness... have I done unto them, and hid my face from them* (39:24). The exile is named plainly
--      as the covenant-lawsuit verdict — the curse of Deuteronomy 28 for covenant-breaking, the hidden face
--      the Torah itself foretold: *Then my anger shall be kindled against them in that day, and I will
--      forsake them, and I will hide my face from them... And I will surely hide my face in that day for all
--      the evils which they shall have wrought, in that they are turned unto other gods* (Deuteronomy
--      31:17-18). The captivity was never Yahuah casting off his people, but the just judgment of the
--      covenant — the very judgment about to be reversed in the next breath (39:29). The curse is the
--      Deuteronomy clause for breaking covenant, never the Torah itself.
--   ★★★ THE SPIRIT POURED ON THE WHOLE HOUSE (THREAD 4, the consummation): *Now will I bring again the
--      captivity of Jacob, and have mercy upon the whole house of Yashar''el (Israel), and will be jealous
--      for my holy name... When I have brought them again from the people, and gathered them out of their
--      enemies'' lands* (39:25,27); *Neither will I hide my face any more from them: for I have poured out my
--      spirit upon the house of Yashar''el (Israel)* (39:29). The hidden face of v.23-24 is reversed for
--      ever; the WHOLE house — both houses, Yahudah (Judah) and Yosef/Ephraim — is gathered home and the
--      Spirit is poured upon them. Joel had sung the very words — *I will pour out my spirit upon all flesh*
--      (Joel 2:28) — and Peter at Shavuot names them fulfilled — *I will pour out of my Spirit upon all
--      flesh; and your sons and your daughters shall prophesy* (Acts 2:17). The poured-out Spirit is the
--      same Spirit-within of the new heart — *I will put my spirit within you, and cause you to walk in my
--      statutes* (Ezekiel 36:27); *And shall put my spirit in you, and ye shall live* (Ezekiel 37:14): the
--      Torah written on the heart, the raised and gathered house a Torah-keeping house. Paul seals the
--      mystery — *And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of
--      Sion the Deliverer* (Romans 11:26), *For this is my covenant unto them, when I shall take away their
--      sins* (Romans 11:27). Never replacement; the whole house of Yashar''el regathered, the face hidden no
--      more, the Spirit poured out — the two-house restoration sealed.
--   VERSES WITH NO SEPARATE ADD: v.9-16 (the burning of the weapons seven years; the seven-month burial in
--      the valley of Hamon-gog; the cleansing of the land — the aftermath of the overthrow, woven into
--      THREAD 1/2 prose; NT none / Extras none / Tanakh none warranted). All verses recorded in the
--      coverage checklist above; every block carries at least one thread.

CREATE TEMP VIEW _s308_ezek39_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): Gog shall fall upon the mountains of Yashar'el — fire on Magog, the Name made known
    ('canon','ezekiel',39,6,'canon','revelation',20,9,'free',
      E'*And they went up on the breadth of the earth, and compassed the camp of the saints about, and the beloved city: and fire came down from Elohim (God) out of heaven, and devoured them* (Revelation 20:9). The fire Ezekiel sends on Gog''s land — *And I will send a fire on Magog, and among them that dwell carelessly in the isles: and they shall know that I am Yahuah (LORD)* (Ezekiel 39:6) — is the fire from heaven that devours the final host of Gog and Magog. John draws Ezekiel''s overthrow forward to the last battle, named by the same names.'),
    ('canon','ezekiel',39,4,'canon','revelation',20,9,'free',
      E'*And fire came down from Elohim (God) out of heaven, and devoured them* (Revelation 20:9). The host that *shall fall upon the mountains of Yashar''el (Israel), thou, and all thy bands, and the people that is with thee* (Ezekiel 39:4) is the host gathered against the camp of the saints and the beloved city, consumed by fire from heaven. Gog''s fall on the mountains is the fall of the deceived nations in Revelation 20.'),
    ('canon','ezekiel',39,7,'canon','ezekiel',38,23,'free',
      E'*Thus will I magnify myself, and sanctify myself; and I will be known in the eyes of many nations, and they shall know that I am Yahuah (LORD)* (Ezekiel 38:23). The whole purpose of the Gog overthrow is the Name vindicated — *So will I make my holy name known in the midst of my people Yashar''el (Israel)... and the heathen shall know that I am Yahuah (LORD), the Holy One in Yashar''el (Israel)* (Ezekiel 39:7). Yahuah magnifies and sanctifies his own Name before the nations by the destruction of the assembled host.'),
    ('canon','ezekiel',39,6,'canon','psalms',46,9,'free',
      E'*He maketh wars to cease unto the end of the earth; he breaketh the bow, and cutteth the spear in sunder; he burneth the chariot in the fire* (Psalm 46:9). The Psalm sings the desolation Ezekiel enacts upon Gog — Yahuah *will send a fire on Magog* (Ezekiel 39:6), and *I will smite thy bow out of thy left hand, and will cause thine arrows to fall* (39:3): the bow broken, the chariot burned, the war-host of the nations brought to nought.'),
    ('canon','ezekiel',39,7,'canon','psalms',46,10,'free',
      E'*Be still, and know that I am Elohim (God): I will be exalted among the heathen, I will be exalted in the earth* (Psalm 46:10). The end of the overthrow is the heathen made to KNOW the Name — *the heathen shall know that I am Yahuah (LORD), the Holy One in Yashar''el (Israel)* (Ezekiel 39:7) answers *know that I am Elohim (God): I will be exalted among the heathen*. The fall of Gog is Yahuah exalting himself among the nations.'),
    ('canon','ezekiel',39,6,'canon','psalms',46,8,'free',
      E'*Come, behold the works of Yahuah (LORD), what desolations he hath made in the earth* (Psalm 46:8). The fire upon Magog and them that dwell carelessly in the isles (Ezekiel 39:6) is the desolation the Psalm summons to behold — the works of Yahuah in the earth, the overthrow of the host that came against his people. Come and see what Yahuah has done to the enemy.'),

    -- THREAD 2 (★★): the feast of the birds upon my sacrifice — John draws Ezekiel directly
    ('canon','ezekiel',39,17,'canon','revelation',19,17,'free',
      E'*And I saw an angel standing in the sun; and he cried with a loud voice, saying to all the fowls that fly in the midst of heaven, Come and gather yourselves together unto the supper of the great Elohim (God)* (Revelation 19:17). John draws Ezekiel''s summons word for word — *Speak unto every feathered fowl, and to every beast of the field, Assemble yourselves, and come; gather yourselves on every side to my sacrifice... even a great sacrifice upon the mountains of Yashar''el (Israel)* (Ezekiel 39:17). The supper of the great Elohim IS Ezekiel''s great sacrifice on the slain host of the final battle.'),
    ('canon','ezekiel',39,18,'canon','revelation',19,18,'free',
      E'*That ye may eat the flesh of kings, and the flesh of captains, and the flesh of mighty men, and the flesh of horses, and of them that sit on them, and the flesh of all men, both free and bond, both small and great* (Revelation 19:18). John echoes Ezekiel''s feast on the war-host directly — *Ye shall eat the flesh of the mighty, and drink the blood of the princes of the earth* (Ezekiel 39:18), *Thus ye shall be filled at my table with horses and chariots, with mighty men, and with all men of war* (39:20). The flesh of the mighty, the princes, the horses: the same banquet of the slain.'),
    ('canon','ezekiel',39,19,'canon','revelation',19,21,'free',
      E'*And the remnant were slain with the sword of him that sat upon the horse, which sword proceeded out of his mouth: and all the fowls were filled with their flesh* (Revelation 19:21). Ezekiel''s word *And ye shall eat fat till ye be full, and drink blood till ye be drunken, of my sacrifice which I have sacrificed for you* (Ezekiel 39:19) is fulfilled — *all the fowls were filled with their flesh*. The fowls eat their fill of the slain host, as Yahuah said they should be full of his sacrifice.'),
    ('canon','ezekiel',39,17,'canon','revelation',19,21,'free',
      E'*And all the fowls were filled with their flesh* (Revelation 19:21). The fowls called *to my sacrifice that I do sacrifice for you, even a great sacrifice upon the mountains of Yashar''el (Israel)* (Ezekiel 39:17) are the same fowls filled with the flesh of the slain in John''s vision. The great sacrifice of Ezekiel is consummated when the birds are filled in Revelation.'),

    -- THREAD 3 (★): I hid my face from them for their iniquity — the covenant-lawsuit recognition
    ('canon','ezekiel',39,23,'canon','deuteronomy',31,17,'free',
      E'*Then my anger shall be kindled against them in that day, and I will forsake them, and I will hide my face from them, and they shall be devoured, and many evils and troubles shall befall them* (Deuteronomy 31:17). Ezekiel names the captivity as the very covenant-clause the Torah foretold — *the house of Yashar''el (Israel) went into captivity for their iniquity... therefore hid I my face from them, and gave them into the hand of their enemies* (Ezekiel 39:23). The exile is the just judgment of the broken covenant, the hidden face Moses warned of, not Yahuah casting off his people.'),
    ('canon','ezekiel',39,24,'canon','deuteronomy',31,18,'free',
      E'*And I will surely hide my face in that day for all the evils which they shall have wrought, in that they are turned unto other gods* (Deuteronomy 31:18). The verdict *According to their uncleanness and according to their transgressions have I done unto them, and hid my face from them* (Ezekiel 39:24) is the Deuteronomy clause come to pass — the hidden face for turning to other gods. The curse is the covenant-judgment for breaking faith, never the Torah itself; and it is about to be reversed for ever (Ezekiel 39:29).'),

    -- THREAD 4 (★★★): I have poured out my spirit upon the WHOLE house — the consummate regathering
    ('canon','ezekiel',39,29,'canon','acts',2,17,'free',
      E'*And it shall come to pass in the last days, saith Elohim (God), I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy, and your young men shall see visions, and your old men shall dream dreams* (Acts 2:17). Ezekiel''s sealing word — *I have poured out my spirit upon the house of Yashar''el (Israel)* (Ezekiel 39:29) — is the very outpouring Peter proclaims fulfilled at Shavuot. The Spirit poured on the whole house is the Spirit poured out in the last days; Joel and Ezekiel together are answered.'),
    ('canon','ezekiel',39,29,'canon','joel',2,28,'free',
      E'*And it shall come to pass afterward, that I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy, your old men shall dream dreams, your young men shall see visions* (Joel 2:28). Joel speaks Ezekiel''s promise in the same words — *I have poured out my spirit upon the house of Yashar''el (Israel)* (Ezekiel 39:29). The two prophets are one promise: the Spirit poured out upon the regathered people, the intimacy restored and the face hidden no more.'),
    ('canon','ezekiel',39,29,'canon','ezekiel',36,27,'free',
      E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The poured-out Spirit of *I have poured out my spirit upon the house of Yashar''el (Israel)* (Ezekiel 39:29) is the same Spirit-within of the new heart — and it is given to make the people walk in the statutes and keep the judgments. The restored house is the Torah-keeping house; the Spirit and the Torah are inseparable, never abolished.'),
    ('canon','ezekiel',39,29,'canon','ezekiel',37,14,'free',
      E'*And shall put my spirit in you, and ye shall live, and I shall place you in your own land: then shall ye know that I Yahuah (LORD) have spoken it, and performed it* (Ezekiel 37:14). The Spirit poured on the whole house (Ezekiel 39:29) is the Spirit put within the raised house of the dry bones — *and ye shall live, and I shall place you in your own land*. The valley-of-bones promise and the Gog-aftermath promise are one: the gathered house, alive in the land, filled with the Spirit.'),
    ('canon','ezekiel',39,25,'canon','romans',11,26,'free',
      E'*And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob* (Romans 11:26). Yahuah''s promise *Now will I bring again the captivity of Jacob, and have mercy upon the whole house of Yashar''el (Israel)* (Ezekiel 39:25) is the mystery Paul names — *all Yashar''el (Israel) shall be saved*, the Deliverer out of Sion. The whole house regathered and shown mercy is the salvation of all Yashar''el, never replacement.'),
    ('canon','ezekiel',39,25,'canon','romans',11,27,'free',
      E'*For this is my covenant unto them, when I shall take away their sins* (Romans 11:27). Ezekiel''s mercy on *the whole house of Yashar''el (Israel)* after *they have borne their shame, and all their trespasses* (Ezekiel 39:25-26) is the covenant Paul cites — *when I shall take away their sins*. The captivity reversed and the trespasses borne and forgiven is the covenant of forgiveness to the whole house.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek39_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek39_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-39-gog-shall-fall-upon-the-mountains-of-yasharel',
       E'Gog shall fall upon the mountains of Yashar''el — fire on Magog, the Name made known',
       E'The overthrow of Gog is the vindication of the Name. *Behold, I am against thee, O Gog, the chief prince of Meshech and Tubal: And I will turn thee back... and will bring thee upon the mountains of Yashar''el (Israel): And I will smite thy bow out of thy left hand, and will cause thine arrows to fall out of thy right hand. Thou shalt fall upon the mountains of Yashar''el (Israel), thou, and all thy bands* (39:1-4). The fire follows: *And I will send a fire on Magog, and among them that dwell carelessly in the isles: and they shall know that I am Yahuah (LORD). So will I make my holy name known in the midst of my people Yashar''el (Israel)... and the heathen shall know that I am Yahuah (LORD), the Holy One in Yashar''el (Israel)* (39:6-7). Revelation draws the Gog overthrow forward by name — the deceived nations, *Gog and Magog* (Revelation 20:8), compass the camp of the saints, *and fire came down from Elohim (God) out of heaven, and devoured them* (Revelation 20:9): the fire on Magog is the fire from heaven on the final host. Yahuah had sworn the end of it the chapter before: *Thus will I magnify myself, and sanctify myself; and I will be known in the eyes of many nations* (Ezekiel 38:23). And the Psalm sings the same desolation upon the war-host: *Come, behold the works of Yahuah (LORD), what desolations he hath made in the earth. He maketh wars to cease unto the end of the earth; he breaketh the bow, and cutteth the spear in sunder; he burneth the chariot in the fire... Be still, and know that I am Elohim (God): I will be exalted among the heathen* (Psalm 46:8-10) — the bow broken, the chariot burned, the heathen made to know the Name.',
       sv.verse_id, ev.verse_id, 'free', 32950
  FROM _s308_ezek39_lookup sv, _s308_ezek39_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=39 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-39-the-feast-of-the-birds-upon-my-sacrifice',
       E'Assemble yourselves to my sacrifice — the feast of the birds on the slain host',
       E'After Gog falls, Yahuah spreads a grim banquet of the slain, and calls the birds and beasts to it: *And, thou son of Adam, thus saith Adonai Yahuah (the Lord GOD); Speak unto every feathered fowl, and to every beast of the field, Assemble yourselves, and come; gather yourselves on every side to my sacrifice that I do sacrifice for you, even a great sacrifice upon the mountains of Yashar''el (Israel), that ye may eat flesh, and drink blood. Ye shall eat the flesh of the mighty, and drink the blood of the princes of the earth, of rams, of lambs, and of goats, of bullocks, all of them fatlings of Bashan. And ye shall eat fat till ye be full, and drink blood till ye be drunken, of my sacrifice which I have sacrificed for you. Thus ye shall be filled at my table with horses and chariots, with mighty men, and with all men of war* (39:17-20). John draws Ezekiel directly into the last battle, almost word for word: *And I saw an angel standing in the sun; and he cried with a loud voice, saying to all the fowls that fly in the midst of heaven, Come and gather yourselves together unto the supper of the great Elohim (God); That ye may eat the flesh of kings, and the flesh of captains, and the flesh of mighty men, and the flesh of horses, and of them that sit on them, and the flesh of all men* (Revelation 19:17-18). And it is fulfilled when the rider on the white horse slays the host: *and all the fowls were filled with their flesh* (Revelation 19:21) — even as Ezekiel said the fowls should *eat fat till ye be full* (39:19). The supper of the great Elohim is Ezekiel''s great sacrifice upon the mountains of Yashar''el; the flesh of the mighty, the princes, the horses, the men of war — the war-host of the nations laid as a feast for the birds.',
       sv.verse_id, ev.verse_id, 'free', 32953
  FROM _s308_ezek39_lookup sv, _s308_ezek39_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=39 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-39-i-hid-my-face-from-them-for-their-iniquity',
       E'I hid my face from them — the captivity was for their iniquity',
       E'Before the mercy comes the verdict: the exile is named plainly as the covenant-lawsuit judgment, the heathen taught why it came. *And I will set my glory among the heathen, and all the heathen shall see my judgment that I have executed... And the heathen shall know that the house of Yashar''el (Israel) went into captivity for their iniquity: because they trespassed against me, therefore hid I my face from them, and gave them into the hand of their enemies: so fell they all by the sword. According to their uncleanness and according to their transgressions have I done unto them, and hid my face from them* (39:21-24). This is the curse of the broken covenant — the very clause the Torah foretold through Moses: *Then my anger shall be kindled against them in that day, and I will forsake them, and I will hide my face from them, and they shall be devoured... And I will surely hide my face in that day for all the evils which they shall have wrought, in that they are turned unto other gods* (Deuteronomy 31:17-18). The captivity was never Yahuah casting off his people, but the just judgment of the covenant — the hidden face Moses warned of, the Deuteronomy 28 exile for covenant-breaking, never the Torah itself. And the hidden face is set down here only to be lifted for ever in the next breath: *Neither will I hide my face any more from them* (39:29).',
       sv.verse_id, ev.verse_id, 'free', 32956
  FROM _s308_ezek39_lookup sv, _s308_ezek39_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=39 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-39-i-have-poured-out-my-spirit-upon-the-whole-house',
       E'Mercy upon the whole house of Yashar''el — I have poured out my spirit, the face hidden no more',
       E'The chapter — and the whole Gog oracle — closes on the consummate regathering and the outpoured Spirit. *Therefore thus saith Adonai Yahuah (the Lord GOD); Now will I bring again the captivity of Jacob, and have mercy upon the whole house of Yashar''el (Israel), and will be jealous for my holy name; After that they have borne their shame... When I have brought them again from the people, and gathered them out of their enemies'' lands, and am sanctified in them in the sight of many nations... Neither will I hide my face any more from them: for I have poured out my spirit upon the house of Yashar''el (Israel), saith Adonai Yahuah (the Lord GOD)* (39:25-29). The hidden face of v.23-24 is reversed for ever; the WHOLE house — both houses, Yahudah (Judah) and Yosef/Ephraim (Israel) — is gathered home, and the Spirit is poured upon them. Joel had sung the very words: *I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy* (Joel 2:28); and Peter names them fulfilled at Shavuot: *I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy, and your young men shall see visions* (Acts 2:17) — Joel and Ezekiel together. The poured-out Spirit is the same Spirit-within of the new heart: *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27); *And shall put my spirit in you, and ye shall live, and I shall place you in your own land* (Ezekiel 37:14) — the Torah written on the heart, the gathered house a Torah-keeping house. And Paul seals the mystery: *And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob* (Romans 11:26), *For this is my covenant unto them, when I shall take away their sins* (Romans 11:27). Never replacement; the whole house regathered, the face hidden no more, the Spirit poured out — the restored covenant intimacy, the two-house restoration sealed.',
       sv.verse_id, ev.verse_id, 'free', 32959
  FROM _s308_ezek39_lookup sv, _s308_ezek39_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=39 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *fire came down from Elohim (God) out of heaven, and devoured them* (Revelation 20:9) — the fire on Magog (Ezekiel 39:6) is the fire from heaven on the final host of Gog and Magog.'
  FROM cross_reference_threads t
  JOIN _s308_ezek39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=6
  JOIN _s308_ezek39_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-39-gog-shall-fall-upon-the-mountains-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *fire came down from Elohim (God) out of heaven, and devoured them* (Revelation 20:9) — Gog''s fall on the mountains of Yashar''el (Ezekiel 39:4) is the fall of the deceived nations gathered against the beloved city.'
  FROM cross_reference_threads t
  JOIN _s308_ezek39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=4
  JOIN _s308_ezek39_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-39-gog-shall-fall-upon-the-mountains-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *I will magnify myself, and sanctify myself; and I will be known in the eyes of many nations* (Ezekiel 38:23) — the overthrow vindicates the Name, as 39:7 makes his holy name known among the heathen.'
  FROM cross_reference_threads t
  JOIN _s308_ezek39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=7
  JOIN _s308_ezek39_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=38 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-39-gog-shall-fall-upon-the-mountains-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *He maketh wars to cease... he breaketh the bow, and cutteth the spear in sunder; he burneth the chariot in the fire* (Psalm 46:9) — the bow smitten, the chariot burned (Ezekiel 39:3,6); the war-host of the nations brought to nought.'
  FROM cross_reference_threads t
  JOIN _s308_ezek39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=6
  JOIN _s308_ezek39_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=46 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-39-gog-shall-fall-upon-the-mountains-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Be still, and know that I am Elohim (God): I will be exalted among the heathen* (Psalm 46:10) — the heathen made to know the Name (Ezekiel 39:7); the fall of Gog is Yahuah exalted among the nations.'
  FROM cross_reference_threads t
  JOIN _s308_ezek39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=7
  JOIN _s308_ezek39_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=46 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-39-gog-shall-fall-upon-the-mountains-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Come, behold the works of Yahuah (LORD), what desolations he hath made in the earth* (Psalm 46:8) — the fire upon Magog (Ezekiel 39:6) is the desolation the Psalm summons to behold.'
  FROM cross_reference_threads t
  JOIN _s308_ezek39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=6
  JOIN _s308_ezek39_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=46 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-39-gog-shall-fall-upon-the-mountains-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *saying to all the fowls that fly in the midst of heaven, Come and gather yourselves together unto the supper of the great Elohim (God)* (Revelation 19:17) — John draws Ezekiel 39:17 word for word; the supper of the great Elohim is Ezekiel''s great sacrifice.'
  FROM cross_reference_threads t
  JOIN _s308_ezek39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=17
  JOIN _s308_ezek39_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-39-the-feast-of-the-birds-upon-my-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *That ye may eat the flesh of kings... and the flesh of mighty men, and the flesh of horses* (Revelation 19:18) — John echoes Ezekiel 39:18,20 directly; the flesh of the mighty, the princes, the horses.'
  FROM cross_reference_threads t
  JOIN _s308_ezek39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=18
  JOIN _s308_ezek39_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-39-the-feast-of-the-birds-upon-my-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *and all the fowls were filled with their flesh* (Revelation 19:21) — Ezekiel''s *eat fat till ye be full* (39:19) fulfilled; the fowls eat their fill of the slain host.'
  FROM cross_reference_threads t
  JOIN _s308_ezek39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=19
  JOIN _s308_ezek39_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-39-the-feast-of-the-birds-upon-my-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*all the fowls were filled with their flesh* (Revelation 19:21) — the fowls called to the great sacrifice on the mountains (Ezekiel 39:17) are the fowls filled with the slain in John''s vision.'
  FROM cross_reference_threads t
  JOIN _s308_ezek39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=17
  JOIN _s308_ezek39_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-39-the-feast-of-the-birds-upon-my-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *I will forsake them, and I will hide my face from them, and they shall be devoured* (Deuteronomy 31:17) — Ezekiel 39:23 names the captivity as the very hidden-face clause the Torah foretold.'
  FROM cross_reference_threads t
  JOIN _s308_ezek39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=23
  JOIN _s308_ezek39_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-39-i-hid-my-face-from-them-for-their-iniquity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I will surely hide my face in that day for all the evils which they shall have wrought, in that they are turned unto other gods* (Deuteronomy 31:18) — the verdict of Ezekiel 39:24; the curse is the covenant-judgment, never the Torah itself.'
  FROM cross_reference_threads t
  JOIN _s308_ezek39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=24
  JOIN _s308_ezek39_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-39-i-hid-my-face-from-them-for-their-iniquity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy* (Acts 2:17) — Ezekiel 39:29 fulfilled at Shavuot; Joel and Ezekiel together, the Spirit poured on the whole house.'
  FROM cross_reference_threads t
  JOIN _s308_ezek39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=29
  JOIN _s308_ezek39_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-39-i-have-poured-out-my-spirit-upon-the-whole-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy* (Joel 2:28) — Joel speaks Ezekiel 39:29 in the same words; one promise, the Spirit poured on the regathered people.'
  FROM cross_reference_threads t
  JOIN _s308_ezek39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=29
  JOIN _s308_ezek39_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-39-i-have-poured-out-my-spirit-upon-the-whole-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27) — the poured-out Spirit (39:29) is the Spirit-within of the new heart; the restored house keeps the Torah, not abolished.'
  FROM cross_reference_threads t
  JOIN _s308_ezek39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=29
  JOIN _s308_ezek39_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-39-i-have-poured-out-my-spirit-upon-the-whole-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *And shall put my spirit in you, and ye shall live, and I shall place you in your own land* (Ezekiel 37:14) — the Spirit on the whole house (39:29) is the Spirit put within the raised house of the dry bones.'
  FROM cross_reference_threads t
  JOIN _s308_ezek39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=29
  JOIN _s308_ezek39_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-39-i-have-poured-out-my-spirit-upon-the-whole-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *And so all Yashar''el (Israel) shall be saved... There shall come out of Sion the Deliverer* (Romans 11:26) — the mercy on the whole house (Ezekiel 39:25) is the salvation of all Yashar''el, never replacement.'
  FROM cross_reference_threads t
  JOIN _s308_ezek39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=25
  JOIN _s308_ezek39_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-39-i-have-poured-out-my-spirit-upon-the-whole-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *For this is my covenant unto them, when I shall take away their sins* (Romans 11:27) — the trespasses borne and forgiven (Ezekiel 39:25-26) is the covenant of forgiveness to the whole house.'
  FROM cross_reference_threads t
  JOIN _s308_ezek39_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=39 AND sv.verse_number=25
  JOIN _s308_ezek39_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-39-i-have-poured-out-my-spirit-upon-the-whole-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session308 — Ezekiel cross-references complete.'
