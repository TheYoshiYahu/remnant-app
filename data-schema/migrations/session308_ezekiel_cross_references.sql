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

-- ----- fragment: minion_ezekiel_4.sql (Ezekiel 4) -----
-- Chapter: Ezekiel 4 — THE SIGN OF THE SIEGE OF JERUSALEM. The prophet's first sign-act: a tile
-- pourtraying the besieged city, the iron pan set as a wall of iron between him and it — *this shall be
-- a sign to the house of Yashar''el (Israel)*. He lies on his left side to bear the iniquity of the house
-- of Yashar''el 390 days, on his right side for Yahudah (Judah) 40 days — *I have appointed thee each day
-- for a year*. He eats bread by weight and drinks water by measure (the famine of the siege), and is told
-- to eat *defiled bread among the Gentiles* — but protests *my soul hath not been polluted... neither came
-- there abominable flesh into my mouth* (he has kept the Torah dietary law, Leviticus 11/Deuteronomy 14),
-- and Yahuah relents on the fuel. A judgment sign-act chapter: the besieged city, the borne iniquity, the
-- famine-and-defiled-bread — the prophet ACTS OUT the sign; the true sin-bearing is the Servant''s.
-- Tag: ezek04   Temp view: _s308_ezek04_lookup
-- Sort band: base 32075, step 3 -> threads at 32075, 32078, 32081 (3 threads)
-- Source of EVERY row: 'canon','ezekiel',4,v
--
-- Ezekiel 4 coverage:
--   ★ v.1-3 (the tile pourtraying besieged Jerusalem; the iron pan a wall of iron between thee and the
--          city; THIS SHALL BE A SIGN to the house of Yashar''el)
--        NT:     ★ Luke 19:43-44 (thine enemies shall cast a trench about thee... not leave one stone upon
--                another — the later siege the Messiah weeps over) — THREAD 1
--        Extras: none warranted (a clean canon-NT sign-act/siege weave)
--        Tanakh: ★★ 2 Kings 25:1-4 (the siege fulfilled — forts round about, famine, the city broken up),
--                ★ Jeremiah 6:6 (cast a mount against Jerusalem — the prophesied siege-mound), ★ Isaiah 20:3
--                (my servant Isaiah... for a sign and wonder — the prophet AS a sign-act) — THREAD 1
--   ★ v.4-8 (lie upon thy left side, lay the iniquity of the house of Yashar''el upon it; 390 days +
--          40 days for Yahudah; I have appointed thee EACH DAY FOR A YEAR; thou shalt bear their iniquity)
--        NT:     none separate distinct (the bearing-of-iniquity TYPE answered by Isaiah 53, woven in
--                THREAD 2; the prophet ACTS a sign, the Servant truly bears — frame carefully)
--        Extras: none warranted
--        Tanakh: ★★ Numbers 14:34 (each day for a year... ye shall bear your iniquities — the SAME
--                day-for-a-year principle), ★★ Isaiah 53:11 (he shall bear their iniquities — the prophet''s
--                sign-bearing points FORWARD to the Servant who truly bears it) — THREAD 2
--   ★ v.9-17 (eat bread by weight and water by measure; bake with dung; EAT DEFILED BREAD AMONG THE
--          GENTILES; my soul hath not been polluted... neither came there abominable flesh into my mouth;
--          break the staff of bread in Jerusalem)
--        NT:     none warranted (siege-famine + Torah dietary faithfulness; the Gentile-defilement is the
--                exile-curse, no NT fulfillment forced)
--        Extras: none warranted
--        Tanakh: ★★ Deuteronomy 28:53 (eat the fruit of thine own body... in the siege — the covenant-curse
--                famine), ★ Deuteronomy 28:68 (Yahuah shall bring thee into Egypt again — the exile/Gentile
--                driving), ★★ Leviticus 26:26 (broken the staff of your bread... bread again by weight), ★★
--                Deuteronomy 14:21 (ye shall not eat of any thing that dieth of itself — the very law
--                Ezekiel keeps, *that which dieth of itself*, 4:14), ★ Hosea 9:4 (their bread... as the bread
--                of mourners; all that eat thereof shall be polluted — unclean bread in exile) — THREAD 3
--
-- Threads (slug — target libraries):
--   1. ezekiel-4-the-tile-and-the-iron-pan-a-sign-of-the-siege — NT (Luke 19) + Tanakh (2 Kings 25, Jeremiah 6, Isaiah 20) [free]
--      (★ the prophet's sign-act of the coming siege; the iron-wall tile; the siege fulfilled; the later siege Messiah weeps over; the prophet AS a sign)
--   2. ezekiel-4-bearing-the-iniquity-each-day-for-a-year — Tanakh (Numbers 14, Isaiah 53) [free]
--      (★ the prophet symbolically BEARING the people's iniquity for the appointed days; day-for-a-year; the sign-bearing points to the Servant who TRULY bears it)
--   3. ezekiel-4-bread-by-weight-and-the-defiled-bread-of-exile — Tanakh (Deuteronomy 28, Leviticus 26, Deuteronomy 14, Hosea 9) [free]
--      (★ the famine of the siege and defiled bread in exile; the Torah dietary law STANDS — the prophet will not eat the unclean, and Yahuah relents on the fuel)
--
-- Framing notes:
--   ★ THE SIGN OF THE SIEGE (THREAD 1): *take thee a tile... and pourtray upon it the city, even
--      Jerusalem: And lay siege against it... take thou unto thee an iron pan, and set it for a wall of iron
--      between thee and the city... This shall be a sign to the house of Yashar''el (Israel)* (4:1-3). The
--      prophet ACTS OUT the coming siege. It is fulfilled to the letter in 587 BC: *Nebuchadnezzar king of
--      Babylon came... and pitched against it; and they built forts against it round about... the famine
--      prevailed in the city, and there was no bread* (2 Kings 25:1-3); Jeremiah names the same siege-mound:
--      *cast a mount against Jerusalem* (Jer 6:6). The prophet himself is the sign — as *my servant Isaiah
--      hath walked naked and barefoot three years for a sign and wonder* (Isa 20:3). And the LATER siege,
--      the one the Messiah weeps over, repeats it: *thine enemies shall cast a trench about thee, and compass
--      thee round... and shall not leave in thee one stone upon another* (Luke 19:43-44).
--   ★ BEARING THE INIQUITY (THREAD 2): *Lie thou also upon thy left side, and lay the iniquity of the house
--      of Yashar''el (Israel) upon it... thou shalt bear their iniquity... three hundred and ninety days...
--      the iniquity of the house of Yahudah (Judah) forty days: I have appointed thee each day for a year*
--      (4:4-6). The day-for-a-year is the SAME principle of the wilderness sentence: *After the number of the
--      days in which ye searched the land, even forty days, each day for a year, shall ye bear your
--      iniquities* (Num 14:34). FRAME CAREFULLY: the prophet ACTS OUT a sign, lying bound to bear the
--      symbol of the people''s guilt for the appointed days — but the TRUE sin-bearing is the Servant''s: *by
--      his knowledge shall my righteous servant justify many; for he shall bear their iniquities* (Isa
--      53:11). Ezekiel''s sign-bearing is a finite, enacted figure; it points forward to the One who truly
--      bears iniquity.
--   ★ BREAD BY WEIGHT / THE TORAH STANDS (THREAD 3): *thy meat which thou shalt eat shall be by weight...
--      Thou shalt drink also water by measure* (4:10-11) — the famine-ration of the siege, the covenant-curse
--      of *the siege* (Deut 28:53) and the broken *staff of bread* (Lev 26:26; echoed in Ezek 4:16). Told to
--      *eat their defiled bread among the Gentiles, whither I will drive them* (4:13), the prophet protests:
--      *my soul hath not been polluted: for from my youth up even till now have I not eaten of that which
--      dieth of itself, or is torn in pieces; neither came there abominable flesh into my mouth* (4:14). He
--      has KEPT the Torah dietary law — *ye shall not eat of any thing that dieth of itself* (Deut 14:21);
--      Leviticus 11 and Deuteronomy 14 STAND — and so Yahuah relents on the fuel: *Lo, I have given thee
--      cow''s dung for man''s dung* (4:15). The unclean bread is the exile-curse (*they shall eat unclean
--      things in Assyria*; *all that eat thereof shall be polluted*, Hosea 9:3-4), never a repeal of the
--      dietary law. The prophet''s faithfulness IS Torah-affirming.
--   VERSES WITH NO SEPARATE ADD: none — all three blocks (vv.1-3, 4-8, 9-17) carry a thread; every verse is
--      recorded in the coverage checklist above and woven into one of the three threads' prose.

CREATE TEMP VIEW _s308_ezek04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): the tile, the iron pan — the sign of the siege
    ('canon','ezekiel',4,3,'canon','2-kings',25,1,'free',
      E'*And it came to pass in the ninth year of his reign, in the tenth month, in the tenth day of the month, that Nebuchadnezzar king of Babylon came, he, and all his host, against Jerusalem, and pitched against it; and they built forts against it round about* (2 Kings 25:1). The sign-act of the tile and the iron pan — *And lay siege against it, and build a fort against it... This shall be a sign to the house of Yashar''el (Israel)* (Ezekiel 4:2-3) — is fulfilled to the letter: Babylon pitches against Jerusalem and builds the forts round about. What the prophet pourtrayed on the tile, Nebuchadnezzar enacts in the field.'),
    ('canon','ezekiel',4,2,'canon','2-kings',25,3,'free',
      E'*And on the ninth day of the fourth month the famine prevailed in the city, and there was no bread for the people of the land* (2 Kings 25:3). The siege the prophet lays against the tile — *And lay siege against it, and build a fort against it, and cast a mount against it... and set battering rams against it round about* (Ezekiel 4:2) — ends in the very famine the chapter foretells (Ezekiel 4:16-17): the bread fails, there is none for the people. The pourtrayed siege becomes the real hunger within the walls.'),
    ('canon','ezekiel',4,2,'canon','jeremiah',6,6,'free',
      E'*For thus hath Yahuah Tseva''ot (LORD of hosts) said, Hew ye down trees, and cast a mount against Jerusalem: this is the city to be visited; she is wholly oppression in the midst of her* (Jeremiah 6:6). Jeremiah, prophesying in the same generation, speaks the same siege-mound Ezekiel casts against the tile — *cast a mount against it* (Ezekiel 4:2). Two prophets, one sentence: the mount cast against Jerusalem, the city visited for her oppression.'),
    ('canon','ezekiel',4,3,'canon','isaiah',20,3,'free',
      E'*And Yahuah (LORD) said, Like as my servant Isaiah hath walked naked and barefoot three years for a sign and wonder upon Egypt and upon Ethiopia* (Isaiah 20:3). Ezekiel''s tile-and-iron-pan is the same kind of prophetic sign-act Isaiah performed — *This shall be a sign to the house of Yashar''el (Israel)* (Ezekiel 4:3) answers *for a sign and wonder*. The prophet himself, with his body and his props, becomes the message: the coming judgment made visible.'),
    ('canon','ezekiel',4,3,'canon','luke',19,43,'free',
      E'*For the days shall come upon thee, that thine enemies shall cast a trench about thee, and compass thee round, and keep thee in on every side* (Luke 19:43). The siege Ezekiel signs against the tile — *set it for a wall of iron between thee and the city... and it shall be besieged* (Ezekiel 4:3) — is the same kind of trench-and-compassing the Messiah weeps over for a later Jerusalem. The wall of iron the prophet sets up foreshadows the enemy''s trench cast about the city that knew not the time of her visitation.'),
    ('canon','ezekiel',4,3,'canon','luke',19,44,'free',
      E'*And shall lay thee even with the ground, and thy children within thee; and they shall not leave in thee one stone upon another; because thou knewest not the time of thy visitation* (Luke 19:44). The besieged city of the tile — *it shall be besieged, and thou shalt lay siege against it* (Ezekiel 4:3) — is the same Jerusalem whose later siege the Messiah foretells with tears: not one stone left upon another. The sign-act of Ezekiel and the lament of Luke bracket the city''s two desolations, both for the same cause.'),

    -- THREAD 2 (★): bearing the iniquity — each day for a year
    ('canon','ezekiel',4,5,'canon','numbers',14,34,'free',
      E'*After the number of the days in which ye searched the land, even forty days, each day for a year, shall ye bear your iniquities, even forty years, and ye shall know my breach of promise* (Numbers 14:34). The measure Yahuah lays on the prophet — *I have laid upon thee the years of their iniquity, according to the number of the days... so shalt thou bear the iniquity of the house of Yashar''el (Israel)* (Ezekiel 4:5), *I have appointed thee each day for a year* (4:6) — is the very day-for-a-year principle of the wilderness sentence. As Yashar''el bore forty years for forty days, so the prophet bears the years of their iniquity day by appointed day.'),
    ('canon','ezekiel',4,4,'canon','isaiah',53,11,'free',
      E'*He shall see of the travail of his soul, and shall be satisfied: by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* (Isaiah 53:11). The prophet is told to *lay the iniquity of the house of Yashar''el (Israel) upon it... thou shalt bear their iniquity* (Ezekiel 4:4) — but his bearing is an enacted SIGN, a finite figure bound to his side for the appointed days. It points forward to the One whose bearing is real and saving: *my righteous servant... shall bear their iniquities*. Ezekiel acts out the burden; the Servant truly carries it, and justifies many.'),

    -- THREAD 3 (★): bread by weight, the defiled bread of exile — and the Torah stands
    ('canon','ezekiel',4,10,'canon','deuteronomy',28,53,'free',
      E'*And thou shalt eat the fruit of thine own body, the flesh of thy sons and of thy daughters, which Yahuah Elohayka (the LORD thy God) hath given thee, in the siege, and in the straitness, wherewith thine enemies shall distress thee* (Deuteronomy 28:53). The famine-ration of the sign — *thy meat which thou shalt eat shall be by weight, twenty shekels a day... Thou shalt drink also water by measure* (Ezekiel 4:10-11) — is the covenant-curse of the siege spelled out in the Torah: the besieged distress that strips a people to the last and most dreadful morsel. The siege Ezekiel signs is the curse Moses wrote.'),
    ('canon','ezekiel',4,13,'canon','deuteronomy',28,68,'free',
      E'*And Yahuah (LORD) shall bring thee into Egypt again with ships, by the way whereof I spake unto thee, Thou shalt see it no more again: and there ye shall be sold unto your enemies for bondmen and bondwomen, and no man shall buy you* (Deuteronomy 28:68). The defiled bread *among the Gentiles, whither I will drive them* (Ezekiel 4:13) is the exile the Torah forewarned — the driving-out among the nations, back among the heathen. The unclean food of dispersion is the bitter end of the covenant-curse: scattered, sold, eating defiled bread in a strange land.'),
    ('canon','ezekiel',4,16,'canon','leviticus',26,26,'free',
      E'*And when I have broken the staff of your bread, ten women shall bake your bread in one oven, and they shall deliver you your bread again by weight: and ye shall eat, and not be satisfied* (Leviticus 26:26). Ezekiel''s sentence repeats the words of the Torah curse almost exactly — *I will break the staff of bread in Jerusalem: and they shall eat bread by weight, and with care* (Ezekiel 4:16). The broken staff of bread, the rationed loaf weighed out and never enough — Leviticus wrote the curse, Ezekiel signs its coming upon Jerusalem.'),
    ('canon','ezekiel',4,14,'canon','deuteronomy',14,21,'free',
      E'*Ye shall not eat of any thing that dieth of itself: thou shalt give it unto the stranger that is in thy gates, that he may eat it; or thou mayest sell it unto an alien: for thou art an holy people unto Yahuah Elohayka (the LORD thy God)* (Deuteronomy 14:21). When told to eat defiled bread, the prophet protests by the very law he has kept — *I have not eaten of that which dieth of itself, or is torn in pieces; neither came there abominable flesh into my mouth* (Ezekiel 4:14): *that which dieth of itself* is the exact thing Deuteronomy forbids the holy people. The dietary Torah STANDS; Ezekiel''s faithfulness moves Yahuah to relent on the fuel (4:15). His scruple is obedience, not legalism.'),
    ('canon','ezekiel',4,13,'canon','hosea',9,4,'free',
      E'*They shall not offer wine offerings to Yahuah (LORD), neither shall they be pleasing unto him: their sacrifices shall be unto them as the bread of mourners; all that eat thereof shall be polluted: for their bread for their soul shall not come into the house of Yahuah (LORD)* (Hosea 9:4). The defiled bread of exile — *eat their defiled bread among the Gentiles, whither I will drive them* (Ezekiel 4:13) — is the polluted bread Hosea names for the scattered northern house: bread of mourners, defiling all who eat it, far from the house of Yahuah. To be driven among the nations is to be cut off from clean bread and acceptable offering alike.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-4-the-tile-and-the-iron-pan-a-sign-of-the-siege',
       E'The tile and the iron pan — this shall be a sign to the house of Yashar''el',
       E'Ezekiel''s first sign-act is the coming siege made visible: *Thou also, son of Adam, take thee a tile, and lay it before thee, and pourtray upon it the city, even Jerusalem: And lay siege against it, and build a fort against it, and cast a mount against it; set the camp also against it, and set battering rams against it round about* (4:1-2); then *take thou unto thee an iron pan, and set it for a wall of iron between thee and the city: and set thy face against it, and it shall be besieged, and thou shalt lay siege against it. This shall be a sign to the house of Yashar''el (Israel)* (4:3). The prophet ACTS OUT what Babylon will do. It is fulfilled to the letter in the days of Zedekiah: *Nebuchadnezzar king of Babylon came, he, and all his host, against Jerusalem, and pitched against it; and they built forts against it round about* (2 Kings 25:1), until *the famine prevailed in the city, and there was no bread for the people of the land* (2 Kings 25:3), and *the city was broken up* (25:4). Jeremiah, in the same generation, speaks the same siege-mound: *cast a mount against Jerusalem: this is the city to be visited* (Jeremiah 6:6). And the prophet himself is the message — as *my servant Isaiah hath walked naked and barefoot three years for a sign and wonder* (Isaiah 20:3), so Ezekiel''s tile and iron-wall are a sign and wonder to the house of Yashar''el (Israel). Centuries later a greater Prophet weeps over the same city facing the same kind of siege: *thine enemies shall cast a trench about thee, and compass thee round, and keep thee in on every side, And shall lay thee even with the ground... they shall not leave in thee one stone upon another; because thou knewest not the time of thy visitation* (Luke 19:43-44). The tile pourtrayed the first desolation; the Messiah''s tears name the second — one city, one cause.',
       sv.verse_id, ev.verse_id, 'free', 32075
  FROM _s308_ezek04_lookup sv, _s308_ezek04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-4-bearing-the-iniquity-each-day-for-a-year',
       E'Lie upon thy side and bear their iniquity — I have appointed thee each day for a year',
       E'The prophet is bound to bear the people''s guilt in sign: *Lie thou also upon thy left side, and lay the iniquity of the house of Yashar''el (Israel) upon it: according to the number of the days that thou shalt lie upon it thou shalt bear their iniquity. For I have laid upon thee the years of their iniquity, according to the number of the days, three hundred and ninety days: so shalt thou bear the iniquity of the house of Yashar''el (Israel)* (4:4-5); then *lie again on thy right side, and thou shalt bear the iniquity of the house of Yahudah (Judah) forty days: I have appointed thee each day for a year* (4:6), bound so that *thou shalt not turn thee from one side to another, till thou hast ended the days of thy siege* (4:8). The measure is the day-for-a-year of the wilderness sentence: *After the number of the days in which ye searched the land, even forty days, each day for a year, shall ye bear your iniquities, even forty years* (Numbers 14:34) — the same reckoning, the same bearing of iniquity day by appointed day. But mark the kind of bearing: Ezekiel ACTS OUT a sign. He lies bound to his side, a living figure of the people''s guilt, for the appointed span — a finite, enacted picture. The TRUE sin-bearing, the bearing that saves and justifies, belongs to another: *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* (Isaiah 53:11). The prophet carries the symbol; the Servant carries the sin. Ezekiel''s burden on his side points forward to the One who bore the iniquity of us all and was satisfied.',
       sv.verse_id, ev.verse_id, 'free', 32078
  FROM _s308_ezek04_lookup sv, _s308_ezek04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-4-bread-by-weight-and-the-defiled-bread-of-exile',
       E'Bread by weight and the defiled bread of exile — neither came there abominable flesh into my mouth',
       E'The sign-act turns to the famine of the siege and the unclean bread of exile. The prophet must eat a coarse mixed loaf *according to the number of the days* (4:9), and *thy meat which thou shalt eat shall be by weight, twenty shekels a day... Thou shalt drink also water by measure, the sixth part of an hin* (4:10-11) — the rationed hunger of a besieged city. This is the covenant-curse the Torah wrote long before: *thou shalt eat the fruit of thine own body... in the siege, and in the straitness, wherewith thine enemies shall distress thee* (Deuteronomy 28:53); and Ezekiel''s own words at the close echo Leviticus almost exactly — *I will break the staff of bread in Jerusalem: and they shall eat bread by weight, and with care* (4:16) answers *when I have broken the staff of your bread... they shall deliver you your bread again by weight: and ye shall eat, and not be satisfied* (Leviticus 26:26). Then the sharper word: *Even thus shall the children of Yashar''el (Israel) eat their defiled bread among the Gentiles, whither I will drive them* (4:13) — the driving-out among the nations the Torah forewarned (*Yahuah (LORD) shall bring thee into Egypt again*, Deuteronomy 28:68), the polluted bread Hosea names for the scattered house (*all that eat thereof shall be polluted; for their bread for their soul shall not come into the house of Yahuah (LORD)*, Hosea 9:4). And here the prophet protests by the very Torah he has kept: *Ah Yahuah (Lord) GOD! behold, my soul hath not been polluted: for from my youth up even till now have I not eaten of that which dieth of itself, or is torn in pieces; neither came there abominable flesh into my mouth* (4:14). *That which dieth of itself* is the exact thing Deuteronomy forbids the holy people — *Ye shall not eat of any thing that dieth of itself... for thou art an holy people unto Yahuah Elohayka (the LORD thy God)* (Deuteronomy 14:21); the dietary law of Leviticus 11 and Deuteronomy 14 STANDS, and the prophet has kept it from his youth. So Yahuah relents on the fuel: *Lo, I have given thee cow''s dung for man''s dung, and thou shalt prepare thy bread therewith* (4:15). The defiled bread is the exile-curse, never a repeal of clean and unclean; the prophet''s scruple is obedience, and his faithfulness is Torah-affirming to the end.',
       sv.verse_id, ev.verse_id, 'free', 32081
  FROM _s308_ezek04_lookup sv, _s308_ezek04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=4 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *they built forts against it round about* (2 Kings 25:1) — the tile-siege of Ezekiel 4:2-3 fulfilled to the letter: Babylon pitches against Jerusalem and casts up the forts.'
  FROM cross_reference_threads t
  JOIN _s308_ezek04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s308_ezek04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=25 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-4-the-tile-and-the-iron-pan-a-sign-of-the-siege'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *the famine prevailed in the city, and there was no bread* (2 Kings 25:3) — the siege laid against the tile (Ezekiel 4:2) ends in the very famine the chapter foretells (4:16-17).'
  FROM cross_reference_threads t
  JOIN _s308_ezek04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s308_ezek04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=25 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-4-the-tile-and-the-iron-pan-a-sign-of-the-siege'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *cast a mount against Jerusalem: this is the city to be visited* (Jeremiah 6:6) — the same siege-mound Ezekiel casts against the tile (4:2); two prophets, one sentence.'
  FROM cross_reference_threads t
  JOIN _s308_ezek04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s308_ezek04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-4-the-tile-and-the-iron-pan-a-sign-of-the-siege'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *my servant Isaiah hath walked naked and barefoot three years for a sign and wonder* (Isaiah 20:3) — Ezekiel''s tile-and-iron-pan is the same kind of prophetic sign-act; the prophet AS the message.'
  FROM cross_reference_threads t
  JOIN _s308_ezek04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s308_ezek04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=20 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-4-the-tile-and-the-iron-pan-a-sign-of-the-siege'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *thine enemies shall cast a trench about thee, and compass thee round* (Luke 19:43) — the wall of iron the prophet sets up (4:3) foreshadows the later siege the Messiah weeps over.'
  FROM cross_reference_threads t
  JOIN _s308_ezek04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s308_ezek04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=19 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-4-the-tile-and-the-iron-pan-a-sign-of-the-siege'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *they shall not leave in thee one stone upon another; because thou knewest not the time of thy visitation* (Luke 19:44) — the besieged city of the tile (4:3) is the same Jerusalem of the second desolation.'
  FROM cross_reference_threads t
  JOIN _s308_ezek04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s308_ezek04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=19 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-4-the-tile-and-the-iron-pan-a-sign-of-the-siege'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *forty days, each day for a year, shall ye bear your iniquities* (Numbers 14:34) — the SAME day-for-a-year principle Yahuah lays on the prophet (Ezekiel 4:5-6); the years of iniquity borne day by day.'
  FROM cross_reference_threads t
  JOIN _s308_ezek04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=4 AND sv.verse_number=5
  JOIN _s308_ezek04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-4-bearing-the-iniquity-each-day-for-a-year'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* (Isaiah 53:11) — the prophet ACTS OUT a sign-bearing (4:4); the TRUE sin-bearing that justifies is the Servant''s.'
  FROM cross_reference_threads t
  JOIN _s308_ezek04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s308_ezek04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-4-bearing-the-iniquity-each-day-for-a-year'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *thou shalt eat the fruit of thine own body... in the siege, and in the straitness* (Deuteronomy 28:53) — the famine-ration by weight (Ezekiel 4:10-11) is the covenant-curse of the siege the Torah wrote.'
  FROM cross_reference_threads t
  JOIN _s308_ezek04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s308_ezek04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=53
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-4-bread-by-weight-and-the-defiled-bread-of-exile'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Yahuah (LORD) shall bring thee into Egypt again... ye shall be sold unto your enemies* (Deuteronomy 28:68) — the defiled bread *among the Gentiles, whither I will drive them* (4:13) is the exile the Torah forewarned.'
  FROM cross_reference_threads t
  JOIN _s308_ezek04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=4 AND sv.verse_number=13
  JOIN _s308_ezek04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=68
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-4-bread-by-weight-and-the-defiled-bread-of-exile'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *when I have broken the staff of your bread... bread again by weight: and ye shall eat, and not be satisfied* (Leviticus 26:26) — Ezekiel 4:16 echoes the Torah curse almost word for word.'
  FROM cross_reference_threads t
  JOIN _s308_ezek04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=4 AND sv.verse_number=16
  JOIN _s308_ezek04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-4-bread-by-weight-and-the-defiled-bread-of-exile'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *Ye shall not eat of any thing that dieth of itself... for thou art an holy people* (Deuteronomy 14:21) — the very law Ezekiel keeps (*that which dieth of itself*, 4:14); the dietary Torah STANDS and Yahuah relents on the fuel.'
  FROM cross_reference_threads t
  JOIN _s308_ezek04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s308_ezek04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-4-bread-by-weight-and-the-defiled-bread-of-exile'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *all that eat thereof shall be polluted; for their bread... shall not come into the house of Yahuah (LORD)* (Hosea 9:4) — the polluted bread of exile, the same defiled bread among the Gentiles (4:13).'
  FROM cross_reference_threads t
  JOIN _s308_ezek04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=4 AND sv.verse_number=13
  JOIN _s308_ezek04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=9 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-4-bread-by-weight-and-the-defiled-bread-of-exile'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezekiel_5.sql (Ezekiel 5) -----
-- Chapter: Ezekiel 5 — the razor and the hair divided into THREE parts: a third burned with fire in the
-- midst of the city, a third smitten with the sword/knife, a third scattered to the wind (with a sword drawn
-- out after them); a few bound in the prophet's skirts = the reserved remnant. *This is Jerusalem: I have set
-- it in the midst of the nations* — the center, judged MORE severely than the nations because she changed
-- Yahuah's judgments into wickedness and did NOT walk in his statutes. The siege-curses: the fathers eat the
-- sons, the evil arrows of famine, the staff of bread broken — the explicit Deuteronomy 28 / Leviticus 26
-- covenant-curse for forsaking the Torah. A judgment chapter; the Torah affirmed as the standard, the curse
-- never the Torah itself but the Deut-28 penalty for breaking it.
-- Tag: ezek05   Temp view: _s308_ezek05_lookup
-- Sort band: base 32100, step 3 -> threads at 32100, 32103, 32106 (3 threads)
-- Source of EVERY row: 'canon','ezekiel',5,v
--
-- Ezekiel 5 coverage:
--   ★ v.1-4,12 (the razor; divide the hair; a third burned with fire, a third smitten with the knife/sword,
--          a third scattered to the wind, I will draw out a sword after them; a few bound in the skirts;
--          v.12 names the three plainly — pestilence/famine, sword, scattering)
--        NT:     ★ Revelation 6:8 (a pale horse... Death... power... to kill with sword, and with hunger,
--                and with death, and with the beasts of the earth) — THREAD 1
--        Extras: none warranted (clean canon-NT-Tanakh judgment-portions weave; no extras forced)
--        Tanakh: ★★ Jeremiah 15:2-3 (such as are for death, to death; for the sword, to the sword; for the
--                famine, to the famine; for the captivity, to the captivity — and four kinds: sword, dogs,
--                fowls, beasts), ★★ Zechariah 13:8-9 (two parts cut off and die; but the third shall be left
--                therein, brought through the fire and refined — the reserved/refined remnant) — THREAD 1
--   ★★ v.5-9 (This is Jerusalem: I have set it in the midst of the nations... and she hath changed my
--          judgments into wickedness MORE than the nations... because ye multiplied more than the nations,
--          and have NOT walked in my statutes, neither kept my judgments; therefore Behold, I am against
--          thee... because of all thine abominations)
--        NT:     ★ Luke 12:48 (unto whomsoever much is given, of him shall be much required), ★ Romans 2:9
--                (tribulation and anguish... of the Yahudi (Jew) first) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Amos 3:2 (You only have I known of all the families of the earth: therefore I will
--                punish you for all your iniquities), ★★ Daniel 9:11 (all Yashar'el have transgressed thy
--                law... therefore the curse is poured upon us... written in the law of Moses), ★ Daniel
--                9:12 (under the whole heaven hath not been done as hath been done upon Jerusalem) — THREAD 2
--   ★ v.10,16-17 (the fathers shall eat the sons, and the sons their fathers; I will send the evil arrows
--          of famine... and I will increase the famine upon you, and will break your staff of bread; famine
--          and evil beasts and pestilence and blood and the sword)
--        NT:     none warranted (the OT covenant-curse enacted; the NT echo of sword/hunger/death held in
--                THREAD 1 via Revelation 6:8; not duplicated here)
--        Extras: none warranted
--        Tanakh: ★★ Deuteronomy 28:53 (thou shalt eat the fruit of thine own body, the flesh of thy sons
--                and of thy daughters... in the siege), ★ Leviticus 26:29 (ye shall eat the flesh of your
--                sons, and the flesh of your daughters), ★ Lamentations 4:10 (the pitiful women have sodden
--                their own children — the curse enacted in 586 BC) — THREAD 3
--   v.11 (thou hast defiled my sanctuary with all thy detestable things... mine eye shall not spare) —
--        the ground of the judgment; woven into THREAD 2 prose (the abominations / defiled sanctuary);
--        no separate add (NT none / Extras none / Tanakh held in THREAD 2).
--   v.13-15 (mine anger accomplished... they shall know that I Yahuah have spoken it in my zeal; a reproach
--        and a taunt, an instruction and an astonishment to the nations) — the verdict-formula; woven into
--        THREAD 2 prose (judged in the sight of the nations); no separate add.
--
-- Threads (slug — target libraries):
--   1. ezekiel-5-the-hair-divided-in-three-a-third-burned-smitten-scattered — NT (Revelation 6) + Tanakh (Jeremiah 15, Zechariah 13) [free]
--      (★ the razor and the three portions of judgment — fire/famine, sword, scattering; the reserved/refined third = the remnant)
--   2. ezekiel-5-this-is-jerusalem-set-in-the-midst-of-the-nations — NT (Luke 12, Romans 2) + Tanakh (Amos 3, Daniel 9) [free]
--      (★★ the center judged MORE severely for breaking the Torah she was given; privilege = greater accountability; the statutes affirmed as the standard)
--   3. ezekiel-5-the-fathers-shall-eat-the-sons-the-deuteronomy-28-curse — Tanakh (Deuteronomy 28, Leviticus 26, Lamentations 4) [free]
--      (★ the siege-cannibalism and the broken staff of bread = the explicit covenant-curse; the curse for breaking the Torah, never the Torah itself)
--
-- Framing notes:
--   ★ THE HAIR DIVIDED IN THREE (THREAD 1): *cause it to pass upon thine head and upon thy beard: then take
--      thee balances to weigh, and divide the hair* (5:1) — and the three portions: *a third part... burn
--      with fire... a third part... smite about it with a knife: and a third part thou shalt scatter in the
--      wind; and I will draw out a sword after them* (5:2), spelled out plainly in *A third part of thee
--      shall die with the pestilence, and with famine... a third part shall fall by the sword... and I will
--      scatter a third part into all the winds* (5:12). The Revelation rider gathers the same instruments:
--      *power was given unto them over the fourth part of the earth, to kill with sword, and with hunger,
--      and with death, and with the beasts of the earth* (Rev 6:8). Jeremiah sorts the people into the same
--      lots: *Such as are for death, to death; and such as are for the sword, to the sword; and such as are
--      for the famine, to the famine; and such as are for the captivity, to the captivity* (Jer 15:2). And
--      Zechariah gives the remnant-key: *two parts therein shall be cut off and die; but the third shall be
--      left therein. And I will bring the third part through the fire, and will refine them as silver is
--      refined* (Zech 13:8-9) — the scattered third, *a few in number... bound in thy skirts* (5:3), is the
--      reserved and refined remnant that survives the razor.
--   ★★ THIS IS JERUSALEM (THREAD 2): *This is Jerusalem: I have set it in the midst of the nations and
--      countries that are round about her* (5:5) — the chosen center, and therefore judged MORE, not less:
--      *she hath changed my judgments into wickedness more than the nations, and my statutes more than the
--      countries... for they have refused my judgments and my statutes, they have not walked in them* (5:6),
--      *Because ye multiplied more than the nations... and have not walked in my statutes* (5:7). The
--      judgment is FOR forsaking the statutes — the Torah affirmed as the standard. Amos names the principle:
--      *You only have I known of all the families of the earth: therefore I will punish you for all your
--      iniquities* (Amos 3:2). The Messiah seals it: *unto whomsoever much is given, of him shall be much
--      required* (Luke 12:48). Paul keeps the order: tribulation *of the Yahudi (Jew) first* (Rom 2:9).
--      Daniel confesses the very curse: *all Yashar''el (Israel) have transgressed thy law... therefore the
--      curse is poured upon us... written in the law of Moses* (Dan 9:11), *under the whole heaven hath not
--      been done as hath been done upon Jerusalem* (Dan 9:12) — the unparalleled judgment of Ezekiel 5:9.
--   ★ THE FATHERS SHALL EAT THE SONS (THREAD 3): *the fathers shall eat the sons in the midst of thee, and
--      the sons shall eat their fathers* (5:10); *I will send... the evil arrows of famine... and I will
--      increase the famine upon you, and will break your staff of bread* (5:16). This is the explicit
--      Deuteronomy 28 / Leviticus 26 covenant-curse: *thou shalt eat the fruit of thine own body, the flesh
--      of thy sons and of thy daughters... in the siege* (Deut 28:53); *ye shall eat the flesh of your sons,
--      and the flesh of your daughters shall ye eat* (Lev 26:29). And Jeremiah's lament records it enacted in
--      586 BC: *The hands of the pitiful women have sodden their own children: they were their meat in the
--      destruction of the daughter of my people* (Lam 4:10). The horror is the covenant-penalty for breaking
--      the Torah — never the Torah itself, which Jerusalem forsook (5:6-7).
--   VERSES WITH NO SEPARATE ADD: v.3-4 (the few bound in the skirts / cast again into the fire — the reserved
--      remnant, woven into THREAD 1 prose), v.8-9 (Behold I am against thee / the unparalleled judgment —
--      woven into THREAD 2, with Dan 9:12 carrying the "unparalleled" weight), v.11 (the defiled sanctuary /
--      detestable abominations — the ground of judgment, woven into THREAD 2 prose), v.13-15 (mine anger
--      accomplished / they shall know I Yahuah have spoken it / a reproach to the nations — the verdict-
--      formula, woven into THREAD 2). All verses recorded; every block carries at least one thread.

CREATE TEMP VIEW _s308_ezek05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): the hair divided in three — a third burned, smitten, scattered; the reserved/refined remnant
    ('canon','ezekiel',5,12,'canon','revelation',6,8,'free',
      E'*And I looked, and behold a pale horse: and his name that sat on him was Death, and Hell followed with him. And power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death, and with the beasts of the earth* (Revelation 6:8). The four-fold sentence of the pale rider gathers the same instruments Ezekiel weighs out over the divided hair — *A third part of thee shall die with the pestilence, and with famine shall they be consumed... and a third part shall fall by the sword... and I will scatter a third part into all the winds* (Ezekiel 5:12). Sword, hunger (famine), and death (pestilence) are Yahuah''s appointed portions of judgment, then and at the end.'),
    ('canon','ezekiel',5,2,'canon','jeremiah',15,2,'free',
      E'*And it shall come to pass, if they say unto thee, Whither shall we go forth? then thou shalt tell them, Thus saith Yahuah (LORD); Such as are for death, to death; and such as are for the sword, to the sword; and such as are for the famine, to the famine; and such as are for the captivity, to the captivity* (Jeremiah 15:2). Jeremiah sorts the people into the very lots Ezekiel divides with the razor — *a third part... burn with fire... a third part... smite about it with a knife: and a third part thou shalt scatter in the wind* (Ezekiel 5:2). Each portion has its appointed end: the burned, the smitten, the scattered, each to its judgment.'),
    ('canon','ezekiel',5,12,'canon','jeremiah',15,2,'free',
      E'*Such as are for death, to death; and such as are for the sword, to the sword; and such as are for the famine, to the famine; and such as are for the captivity, to the captivity* (Jeremiah 15:2). When Ezekiel names the three plainly — *A third part of thee shall die with the pestilence, and with famine... a third part shall fall by the sword... and I will scatter a third part into all the winds* (Ezekiel 5:12) — he is dividing the people into Jeremiah''s same lots: death, sword, famine, and the captivity of the scattered. The judgment is measured and apportioned, none escaping their appointed share.'),
    ('canon','ezekiel',5,12,'canon','jeremiah',15,3,'free',
      E'*And I will appoint over them four kinds, saith Yahuah (LORD): the sword to slay, and the dogs to tear, and the fowls of the heaven, and the beasts of the earth, to devour and destroy* (Jeremiah 15:3). The sword Ezekiel draws out after the scattered third — *I will scatter a third part into all the winds, and I will draw out a sword after them* (Ezekiel 5:12) — is one of Yahuah''s four appointed kinds of destruction. The sword pursues even those flung to the winds; the scattering is no escape from the appointed judgment.'),
    ('canon','ezekiel',5,3,'canon','zechariah',13,8,'free',
      E'*And it shall come to pass, that in all the land, saith Yahuah (LORD), two parts therein shall be cut off and die; but the third shall be left therein* (Zechariah 13:8). Ezekiel''s thirds end the same way: two portions perish — burned and smitten — but of the scattered third *thou shalt also take thereof a few in number, and bind them in thy skirts* (Ezekiel 5:3). A remnant is reserved out of the judgment; the third left therein is the preserved seed.'),
    ('canon','ezekiel',5,3,'canon','zechariah',13,9,'free',
      E'*And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people: and they shall say, Yahuah (LORD) is my Elohim (God)* (Zechariah 13:9). The few bound in the prophet''s skirts — *a few in number, and bind them in thy skirts* (Ezekiel 5:3) — are the refined third: a remnant carried through the fire and claimed as Yahuah''s people. The scattering is not only judgment but the sifting out of a purified seed.'),

    -- THREAD 2 (★★): This is Jerusalem, set in the midst of the nations — judged MORE for forsaking the statutes
    ('canon','ezekiel',5,6,'canon','amos',3,2,'free',
      E'*You only have I known of all the families of the earth: therefore I will punish you for all your iniquities* (Amos 3:2). Amos names the principle Ezekiel enacts: the chosen people are judged MORE, not less, for their sin — *she hath changed my judgments into wickedness more than the nations, and my statutes more than the countries... they have not walked in them* (Ezekiel 5:6). Election is no shield from judgment; the people Yahuah knew are punished for forsaking the very statutes they alone were given.'),
    ('canon','ezekiel',5,5,'canon','luke',12,48,'free',
      E'*But he that knew not, and did commit things worthy of stripes, shall be beaten with few stripes. For unto whomsoever much is given, of him shall be much required: and to whom men have committed much, of him they will ask the more* (Luke 12:48). The Messiah states the law of Ezekiel''s judgment: Jerusalem, *set... in the midst of the nations* (Ezekiel 5:5) and given the statutes, is the one to whom much was committed — and therefore of her much is required. The center is held to the higher account precisely because she received the most.'),
    ('canon','ezekiel',5,8,'canon','romans',2,9,'free',
      E'*Tribulation and anguish, upon every soul of man that doeth evil, of the Yahudi (Jew) first, and also of the Gentile* (Romans 2:9). Paul keeps the order of Ezekiel''s sentence — *Behold, I, even I, am against thee, and will execute judgments in the midst of thee in the sight of the nations* (Ezekiel 5:8): judgment falls on the privileged people first. The one set in the midst of the nations, given the judgments, answers for them first of all.'),
    ('canon','ezekiel',5,6,'canon','daniel',9,11,'free',
      E'*Yea, all Yashar''el (Israel) have transgressed thy law, even by departing, that they might not obey thy voice; therefore the curse is poured upon us, and the oath that is written in the law of Moses the servant of Elohim (God), because we have sinned against him* (Daniel 9:11). Daniel confesses the very charge Ezekiel brings — *they have refused my judgments and my statutes, they have not walked in them* (Ezekiel 5:6): the people transgressed the Torah, and the written curse of the law of Moses is poured out. The judgment is for breaking the statutes, and the Torah stands as the standard they were measured by.'),
    ('canon','ezekiel',5,9,'canon','daniel',9,12,'free',
      E'*And he hath confirmed his words, which he spake against us, and against our judges that judged us, by bringing upon us a great evil: for under the whole heaven hath not been done as hath been done upon Jerusalem* (Daniel 9:12). Ezekiel''s unparalleled sentence — *I will do in thee that which I have not done, and whereunto I will not do any more the like, because of all thine abominations* (Ezekiel 5:9) — is the great evil Daniel says was done as nowhere else under heaven. The center''s judgment is without equal because her privilege was without equal.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 3 (★): the fathers shall eat the sons — the Deuteronomy 28 / Leviticus 26 covenant-curse
    ('canon','ezekiel',5,10,'canon','deuteronomy',28,53,'free',
      E'*And thou shalt eat the fruit of thine own body, the flesh of thy sons and of thy daughters, which Yahuah Elohayka (the LORD thy God) hath given thee, in the siege, and in the straitness, wherewith thine enemies shall distress thee* (Deuteronomy 28:53). Ezekiel''s horror — *the fathers shall eat the sons in the midst of thee, and the sons shall eat their fathers* (Ezekiel 5:10) — is the explicit siege-curse written in the Torah long before. The cannibalism is the covenant-penalty for breaking the covenant, foretold in the very law Jerusalem forsook.'),
    ('canon','ezekiel',5,10,'canon','leviticus',26,29,'free',
      E'*And ye shall eat the flesh of your sons, and the flesh of your daughters shall ye eat* (Leviticus 26:29). The curse Ezekiel pronounces — *the fathers shall eat the sons in the midst of thee, and the sons shall eat their fathers* (Ezekiel 5:10) — is named in the covenant-sanctions of Leviticus, among the judgments for refusing to walk in Yahuah''s statutes. The siege-cannibalism is no arbitrary cruelty but the written penalty for covenant-breaking.'),
    ('canon','ezekiel',5,16,'canon','leviticus',26,29,'free',
      E'*And ye shall eat the flesh of your sons, and the flesh of your daughters shall ye eat* (Leviticus 26:29). The broken staff of bread — *I will increase the famine upon you, and will break your staff of bread* (Ezekiel 5:16) — drives the people to the very cannibalism Leviticus foretold as a covenant-curse. The famine and its horror are the appointed penalty of the law for forsaking the law.'),
    ('canon','ezekiel',5,10,'canon','lamentations',4,10,'free',
      E'*The hands of the pitiful women have sodden their own children: they were their meat in the destruction of the daughter of my people* (Lamentations 4:10). Jeremiah''s lament records Ezekiel''s sentence enacted in the fall of Jerusalem — *the fathers shall eat the sons in the midst of thee, and the sons shall eat their fathers* (Ezekiel 5:10). The covenant-curse foretold in the Torah and threatened by the prophet came to pass in the siege of 586 BC; the word was confirmed in horror.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-5-the-hair-divided-in-three-a-third-burned-smitten-scattered',
       E'The razor and the hair divided in three — a third burned, a third smitten, a third scattered',
       E'Yahuah turns the prophet himself into the sign of the siege: *take thee a sharp knife, take thee a barber''s razor, and cause it to pass upon thine head and upon thy beard: then take thee balances to weigh, and divide the hair* (5:1). The hair is the people, weighed and divided into three portions of judgment: *Thou shalt burn with fire a third part in the midst of the city, when the days of the siege are fulfilled: and thou shalt take a third part, and smite about it with a knife: and a third part thou shalt scatter in the wind; and I will draw out a sword after them* (5:2). The meaning is spelled out plainly at the chapter''s close: *A third part of thee shall die with the pestilence, and with famine shall they be consumed in the midst of thee: and a third part shall fall by the sword round about thee; and I will scatter a third part into all the winds, and I will draw out a sword after them* (5:12). The Revelation rider gathers the same instruments of judgment: *And power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death, and with the beasts of the earth* (Revelation 6:8). Jeremiah sorts the people into the same lots: *Such as are for death, to death; and such as are for the sword, to the sword; and such as are for the famine, to the famine; and such as are for the captivity, to the captivity* (Jeremiah 15:2), and appoints *four kinds... the sword to slay, and the dogs to tear, and the fowls of the heaven, and the beasts of the earth* (Jeremiah 15:3). Yet out of the scattered third a remnant is reserved: *Thou shalt also take thereof a few in number, and bind them in thy skirts* (5:3). Zechariah names that surviving third the refined seed: *two parts therein shall be cut off and die; but the third shall be left therein. And I will bring the third part through the fire, and will refine them as silver is refined... I will say, It is my people* (Zechariah 13:8-9). The razor that destroys two portions sifts out a third, carried through the fire and kept.',
       sv.verse_id, ev.verse_id, 'free', 32100
  FROM _s308_ezek05_lookup sv, _s308_ezek05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-5-this-is-jerusalem-set-in-the-midst-of-the-nations',
       E'This is Jerusalem, set in the midst of the nations — judged more for forsaking the statutes',
       E'Yahuah names the meaning of the sign: *Thus saith Adonai Yahuah (the Lord GOD); This is Jerusalem: I have set it in the midst of the nations and countries that are round about her* (5:5). The chosen center is judged MORE severely than the nations precisely because she was given the statutes and broke them: *And she hath changed my judgments into wickedness more than the nations, and my statutes more than the countries that are round about her: for they have refused my judgments and my statutes, they have not walked in them* (5:6), *Because ye multiplied more than the nations that are round about you, and have not walked in my statutes, neither have kept my judgments* (5:7). So the verdict: *Behold, I, even I, am against thee, and will execute judgments in the midst of thee in the sight of the nations* (5:8), *I will do in thee that which I have not done, and whereunto I will not do any more the like, because of all thine abominations* (5:9). The judgment is FOR forsaking the statutes — the Torah is upheld as the very standard by which she is condemned. Amos states the principle: *You only have I known of all the families of the earth: therefore I will punish you for all your iniquities* (Amos 3:2). The Messiah seals it: *unto whomsoever much is given, of him shall be much required: and to whom men have committed much, of him they will ask the more* (Luke 12:48). Paul keeps the order — tribulation *of the Yahudi (Jew) first, and also of the Gentile* (Romans 2:9). And Daniel, praying over this very ruin, confesses the charge and names the standard: *all Yashar''el (Israel) have transgressed thy law, even by departing, that they might not obey thy voice; therefore the curse is poured upon us, and the oath that is written in the law of Moses* (Daniel 9:11), *for under the whole heaven hath not been done as hath been done upon Jerusalem* (Daniel 9:12) — the unparalleled judgment of 5:9, because the privilege was unparalleled. Election is no shield; it is the higher accountability, and the Torah she defiled (5:11) is affirmed, not abolished.',
       sv.verse_id, ev.verse_id, 'free', 32103
  FROM _s308_ezek05_lookup sv, _s308_ezek05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=5 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-5-the-fathers-shall-eat-the-sons-the-deuteronomy-28-curse',
       E'The fathers shall eat the sons — the broken staff of bread, the Deuteronomy 28 covenant-curse',
       E'The siege brings the most terrible of the covenant-curses: *Therefore the fathers shall eat the sons in the midst of thee, and the sons shall eat their fathers; and I will execute judgments in thee, and the whole remnant of thee will I scatter into all the winds* (5:10), and the famine that drives it: *When I shall send upon them the evil arrows of famine, which shall be for their destruction... and I will increase the famine upon you, and will break your staff of bread* (5:16). This horror is not arbitrary — it is the explicit covenant-curse written in the Torah long before, the appointed penalty for breaking the covenant. Moses foretold it word for word: *And thou shalt eat the fruit of thine own body, the flesh of thy sons and of thy daughters, which Yahuah Elohayka (the LORD thy God) hath given thee, in the siege, and in the straitness, wherewith thine enemies shall distress thee* (Deuteronomy 28:53); and Leviticus named it among the sanctions for refusing the statutes: *And ye shall eat the flesh of your sons, and the flesh of your daughters shall ye eat* (Leviticus 26:29). Jeremiah''s lament records the curse enacted in the fall of the city: *The hands of the pitiful women have sodden their own children: they were their meat in the destruction of the daughter of my people* (Lamentations 4:10). The judgment is the covenant-penalty for forsaking the Torah (5:6-7), never the Torah itself — the law Jerusalem broke is the same law that warned, in mercy, of exactly this end.',
       sv.verse_id, ev.verse_id, 'free', 32106
  FROM _s308_ezek05_lookup sv, _s308_ezek05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=5 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *to kill with sword, and with hunger, and with death, and with the beasts of the earth* (Revelation 6:8) — the pale rider gathers the same portions Ezekiel 5:12 weighs out: sword, famine, pestilence.'
  FROM cross_reference_threads t
  JOIN _s308_ezek05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s308_ezek05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-5-the-hair-divided-in-three-a-third-burned-smitten-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Such as are for death, to death; and such as are for the sword, to the sword; and such as are for the famine, to the famine* (Jeremiah 15:2) — Jeremiah sorts the people into the same lots the razor divides (Ezekiel 5:2).'
  FROM cross_reference_threads t
  JOIN _s308_ezek05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s308_ezek05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=15 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-5-the-hair-divided-in-three-a-third-burned-smitten-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Such as are for death, to death... for the famine, to the famine; and such as are for the captivity, to the captivity* (Jeremiah 15:2) — the three named plainly (Ezekiel 5:12) are Jeremiah''s same apportioned lots.'
  FROM cross_reference_threads t
  JOIN _s308_ezek05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s308_ezek05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=15 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-5-the-hair-divided-in-three-a-third-burned-smitten-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the sword to slay, and the dogs to tear, and the fowls of the heaven, and the beasts of the earth* (Jeremiah 15:3) — the drawn-out sword after the scattered third (Ezekiel 5:12) is one of Yahuah''s four appointed kinds.'
  FROM cross_reference_threads t
  JOIN _s308_ezek05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s308_ezek05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=15 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-5-the-hair-divided-in-three-a-third-burned-smitten-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *two parts therein shall be cut off and die; but the third shall be left therein* (Zechariah 13:8) — the few bound in the skirts (Ezekiel 5:3) are the third reserved out of the judgment.'
  FROM cross_reference_threads t
  JOIN _s308_ezek05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s308_ezek05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=13 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-5-the-hair-divided-in-three-a-third-burned-smitten-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *I will bring the third part through the fire, and will refine them as silver is refined... I will say, It is my people* (Zechariah 13:9) — the bound few (Ezekiel 5:3) are the refined remnant carried through the fire.'
  FROM cross_reference_threads t
  JOIN _s308_ezek05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s308_ezek05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=13 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-5-the-hair-divided-in-three-a-third-burned-smitten-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *You only have I known of all the families of the earth: therefore I will punish you for all your iniquities* (Amos 3:2) — the principle Ezekiel 5:6 enacts; the chosen are judged more, not less.'
  FROM cross_reference_threads t
  JOIN _s308_ezek05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=5 AND sv.verse_number=6
  JOIN _s308_ezek05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=3 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-5-this-is-jerusalem-set-in-the-midst-of-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *unto whomsoever much is given, of him shall be much required* (Luke 12:48) — Jerusalem set in the midst of the nations (Ezekiel 5:5), given the statutes, answers to the higher account.'
  FROM cross_reference_threads t
  JOIN _s308_ezek05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s308_ezek05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=48
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-5-this-is-jerusalem-set-in-the-midst-of-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Tribulation and anguish, upon every soul of man that doeth evil, of the Yahudi (Jew) first* (Romans 2:9) — Paul keeps the order of Ezekiel 5:8; judgment on the privileged people first.'
  FROM cross_reference_threads t
  JOIN _s308_ezek05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=5 AND sv.verse_number=8
  JOIN _s308_ezek05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-5-this-is-jerusalem-set-in-the-midst-of-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *all Yashar''el (Israel) have transgressed thy law... therefore the curse is poured upon us... written in the law of Moses* (Daniel 9:11) — Daniel confesses the charge of Ezekiel 5:6; the Torah is the standard, the curse for breaking it.'
  FROM cross_reference_threads t
  JOIN _s308_ezek05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=5 AND sv.verse_number=6
  JOIN _s308_ezek05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-5-this-is-jerusalem-set-in-the-midst-of-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *under the whole heaven hath not been done as hath been done upon Jerusalem* (Daniel 9:12) — the unparalleled judgment of Ezekiel 5:9, because the privilege was unparalleled.'
  FROM cross_reference_threads t
  JOIN _s308_ezek05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=5 AND sv.verse_number=9
  JOIN _s308_ezek05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-5-this-is-jerusalem-set-in-the-midst-of-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *thou shalt eat the fruit of thine own body, the flesh of thy sons and of thy daughters... in the siege* (Deuteronomy 28:53) — Ezekiel 5:10 is the explicit Torah siege-curse, foretold word for word.'
  FROM cross_reference_threads t
  JOIN _s308_ezek05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=5 AND sv.verse_number=10
  JOIN _s308_ezek05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=53
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-5-the-fathers-shall-eat-the-sons-the-deuteronomy-28-curse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *ye shall eat the flesh of your sons, and the flesh of your daughters shall ye eat* (Leviticus 26:29) — the cannibalism of Ezekiel 5:10 named in the Leviticus covenant-sanctions for refusing the statutes.'
  FROM cross_reference_threads t
  JOIN _s308_ezek05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=5 AND sv.verse_number=10
  JOIN _s308_ezek05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-5-the-fathers-shall-eat-the-sons-the-deuteronomy-28-curse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *ye shall eat the flesh of your sons, and the flesh of your daughters shall ye eat* (Leviticus 26:29) — the broken staff of bread (Ezekiel 5:16) drives the people to the curse Leviticus foretold.'
  FROM cross_reference_threads t
  JOIN _s308_ezek05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s308_ezek05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-5-the-fathers-shall-eat-the-sons-the-deuteronomy-28-curse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *The hands of the pitiful women have sodden their own children: they were their meat in the destruction of the daughter of my people* (Lamentations 4:10) — Ezekiel 5:10 enacted in the fall of Jerusalem, 586 BC.'
  FROM cross_reference_threads t
  JOIN _s308_ezek05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=5 AND sv.verse_number=10
  JOIN _s308_ezek05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=4 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-5-the-fathers-shall-eat-the-sons-the-deuteronomy-28-curse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezekiel_6.sql (Ezekiel 6) -----
-- Chapter: Ezekiel 6 — prophecy against the MOUNTAINS of Yashar''el (Israel); the high places and idols
-- destroyed, the altars made desolate, the slain cast down before the idols; the recognition-formula
-- refrain *ye shall know that I am Yahuah (LORD)* (vv.7,10,13,14); YET a remnant preserved who, scattered
-- among the nations, REMEMBER and lothe themselves and repent; and the threefold covenant-judgment —
-- the sword, the famine, and the pestilence — stretched over the land to make it desolate. Ezekiel quotes
-- the Leviticus 26 covenant-curse nearly verbatim (*I will destroy your high places, and cut down your
-- images*); the judgment is covenant-lawsuit against idolatry, never ethnic hatred — and the remnant kept
-- is the two-house people brought to repentance in exile.
-- Tag: ezek06   Temp view: _s308_ezek06_lookup
-- Sort band: base 32125, step 3 -> threads at 32125, 32128, 32131 (3 threads)
-- Source of EVERY row: 'canon','ezekiel',6,v
--
-- Ezekiel 6 coverage:
--   v.1-2 (set thy face toward the mountains of Yashar''el, and prophesy against them) — the sign-act
--          framing/address; woven into THREAD 1 prose; no separate add.
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: held in prose — the mountains-of-Yashar''el address mirrors Ezekiel 36:1 (the same mountains
--                later RESTORED); noted in THREAD 2 prose.
--   ★ v.3-7 (Behold, I... will bring a sword upon you, and I will destroy your high places... your altars
--          shall be desolate, your images broken... I will cast down your slain men before your idols...
--          and ye shall know that I am Yahuah)
--        NT:     ★ 1 Corinthians 10:14 (flee from idolatry), ★ 1 Corinthians 10:7 (Neither be ye
--                idolaters, as were some of them) — THREAD 1
--        Extras: none warranted
--        Tanakh: ★★ Leviticus 26:30 (I will destroy your high places, and cut down your images — Ezekiel
--                quotes the covenant-curse nearly verbatim), ★ Leviticus 26:31 (bring your sanctuaries unto
--                desolation), ★ 2 Kings 23:14 (he brake in pieces the images, and cut down the groves, and
--                filled their places with the bones of men — Josiah's destruction of the high places),
--                ★ 2 Kings 23:20 (he slew all the priests of the high places... and burned men's bones upon
--                them) — THREAD 1
--   ★ v.13 (Then shall ye know that I am Yahuah, when their slain men shall be among their idols round
--          about their altars, upon every high hill... and under every green tree) — the recognition-formula
--          repeated; the high-place idolatry catalogued.
--        NT:     held in THREAD 1 (the idolatry-judged weave)
--        Extras: none warranted
--        Tanakh: bound to Leviticus 26:30 and the recognition-formula in THREAD 1 prose; *under every green
--                tree* echoed back to the high-place catalogue (woven, not a separate row).
--   ★ v.8-10 (Yet will I leave a remnant... they that escape of you shall remember me among the nations...
--          and they shall lothe themselves for the evils which they have committed)
--        NT:     ★★ Romans 11:5 (even so then at this present time also there is a remnant according to the
--                election of grace), ★ Romans 11:1-2 (Hath Elohim cast away his people? Elohim forbid... God
--                hath not cast away his people which he foreknew) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Deuteronomy 30:1-2 (thou shalt call them to mind among all the nations... and shalt
--                return unto Yahuah Elohayka), ★★ Ezekiel 36:31 (then shall ye remember your own evil ways...
--                and shall lothe yourselves in your own sight), ★ Zechariah 13:9 (I will bring the third part
--                through the fire, and will refine them... they shall call on my name) — THREAD 2
--   ★ v.11-14 (Smite with thine hand, and stamp with thy foot... they shall fall by the sword, by the
--          famine, and by the pestilence... So will I stretch out my hand upon them, and make the land
--          desolate... and they shall know that I am Yahuah)
--        NT:     ★★ Revelation 6:8 (his name that sat on him was Death... power was given unto them over the
--                fourth part of the earth, to kill with sword, and with hunger, and with death, and with the
--                beasts of the earth) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★★ Jeremiah 14:12 (I will consume them by the sword, and by the famine, and by the
--                pestilence), ★★ Ezekiel 5:12 (a third part of thee shall die with the pestilence... a third
--                part shall fall by the sword... I will scatter a third part into all the winds — the lateral
--                sister-oracle) — THREAD 3
--
-- Threads (slug — target libraries):
--   1. ezekiel-6-i-will-destroy-your-high-places-and-ye-shall-know-that-i-am-yahuah — Tanakh (Leviticus 26, 2 Kings 23) + NT (1 Corinthians 10) [free]
--      (★ the high-place idolatry judged; Ezekiel quotes the Leviticus 26 covenant-curse nearly verbatim;
--       Josiah's destruction of the high places enacts it; flee idolatry; the recognition-formula — the Name vindicated)
--   2. ezekiel-6-yet-will-i-leave-a-remnant-that-shall-remember-me-among-the-nations — Tanakh (Deuteronomy 30, Ezekiel 36, Zechariah 13) + NT (Romans 11) [free]
--      (★ the preserved remnant who remember and repent in exile; call them to mind among the nations and return;
--       a remnant according to the election of grace; the third part refined; the two-house remnant kept and brought to repentance)
--   3. ezekiel-6-the-sword-the-famine-and-the-pestilence-upon-the-land — Tanakh (Jeremiah 14, Ezekiel 5) + NT (Revelation 6) [free]
--      (★ the threefold covenant-judgment — sword/famine/pestilence — stretched over the land; the pale horse of Revelation 6)
--
-- Framing notes:
--   ★ THE HIGH PLACES DESTROYED / YE SHALL KNOW THAT I AM YAHUAH (THREAD 1): *Behold, I, even I, will bring a
--      sword upon you, and I will destroy your high places. And your altars shall be desolate, and your images
--      shall be broken: and I will cast down your slain men before your idols* (6:3-4), *and ye shall know that
--      I am Yahuah (LORD)* (6:7). Ezekiel quotes the covenant-curse of Leviticus nearly word for word — *And I
--      will destroy your high places, and cut down your images, and cast your carcases upon the carcases of
--      your idols* (Leviticus 26:30). The judgment is the covenant-lawsuit FOR idolatry, the Torah''s own
--      sanction enacted, never ethnic hatred. Josiah had already done it in the flesh — *he brake in pieces
--      the images, and cut down the groves, and filled their places with the bones of men* (2 Kings 23:14),
--      *and he slew all the priests of the high places that were there upon the altars, and burned men''s bones
--      upon them* (2 Kings 23:20) — the very slain-cast-before-idols Ezekiel foretells. Paul gives the standing
--      command to the called-out people: *Wherefore, my dearly beloved, flee from idolatry* (1 Corinthians
--      10:14), *Neither be ye idolaters, as were some of them* (1 Corinthians 10:7). And the refrain — *ye
--      shall know that I am Yahuah (LORD)* (6:7,13,14) — is the whole aim: the Name vindicated, the idols cut
--      down, Yahuah known as Yahuah.
--   ★ THE REMNANT WHO REMEMBER (THREAD 2): *Yet will I leave a remnant... And they that escape of you shall
--      remember me among the nations whither they shall be carried captives... and they shall lothe themselves
--      for the evils which they have committed* (6:8-9). In the midst of the judgment a remnant is kept,
--      scattered but not destroyed, and brought to remembrance and repentance. This is the Torah''s own promise
--      of exile-and-return — *thou shalt call them to mind among all the nations, whither Yahuah Elohayka (the
--      LORD thy God) hath driven thee, And shalt return unto Yahuah Elohayka (the LORD thy God)* (Deuteronomy
--      30:1-2). Ezekiel''s own restoration-chapter answers it word for word — *Then shall ye remember your own
--      evil ways... and shall lothe yourselves in your own sight for your iniquities* (Ezekiel 36:31). Zechariah
--      sees the remnant refined — *I will bring the third part through the fire... they shall call on my name,
--      and I will hear them: I will say, It is my people* (Zechariah 13:9). And Paul names the remnant kept in
--      his own day — *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1); *Even so then
--      at this present time also there is a remnant according to the election of grace* (Romans 11:5). The
--      two-house people are never cast off; a remnant is always kept and brought home, remembering.
--   ★ THE SWORD, THE FAMINE, AND THE PESTILENCE (THREAD 3): *Alas for all the evil abominations of the house of
--      Yashar''el (Israel)! for they shall fall by the sword, by the famine, and by the pestilence* (6:11), *So
--      will I stretch out my hand upon them, and make the land desolate* (6:14). The threefold covenant-judgment
--      — sword, famine, pestilence — is Jeremiah''s same triad — *I will consume them by the sword, and by the
--      famine, and by the pestilence* (Jeremiah 14:12) — and Ezekiel''s own sister-oracle a chapter before — *A
--      third part of thee shall die with the pestilence... and a third part shall fall by the sword... and I
--      will scatter a third part into all the winds* (Ezekiel 5:12). The same triad rides into Revelation under
--      the pale horse — *his name that sat on him was Death... power was given unto them over the fourth part
--      of the earth, to kill with sword, and with hunger, and with death, and with the beasts of the earth*
--      (Revelation 6:8). The judgment is real and it is total, *and they shall know that I am Yahuah (LORD)* (6:14).
--   VERSES WITH NO SEPARATE ADD: v.1-2 (the sign-act address — set thy face toward the mountains; woven into
--      THREAD 1/2 prose, the mountains later RESTORED in Ezekiel 36:1); v.5-6 (the dead carcases scattered,
--      cities laid waste — the same high-place judgment of THREAD 1, woven); v.10 (the recognition-formula
--      repeated — carried in THREAD 1/2 prose); v.12 (he that is far off... near... besieged — the distribution
--      of the threefold judgment, woven into THREAD 3 prose). All verses recorded in the coverage checklist;
--      every block carries at least one thread.

CREATE TEMP VIEW _s308_ezek06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): I will destroy your high places — and ye shall know that I am Yahuah
    ('canon','ezekiel',6,3,'canon','leviticus',26,30,'free',
      E'*And I will destroy your high places, and cut down your images, and cast your carcases upon the carcases of your idols, and my soul shall abhor you* (Leviticus 26:30). Ezekiel quotes the covenant-curse nearly word for word — *Behold, I, even I, will bring a sword upon you, and I will destroy your high places. And your altars shall be desolate, and your images shall be broken* (Ezekiel 6:3-4). The judgment is the Torah''s own sanction for idolatry, the Leviticus 26 curse enacted upon the high places — covenant-lawsuit against the sin, never ethnic hatred.'),
    ('canon','ezekiel',6,4,'canon','leviticus',26,30,'free',
      E'*And I will destroy your high places, and cut down your images, and cast your carcases upon the carcases of your idols, and my soul shall abhor you* (Leviticus 26:30). The casting of the slain before the idols — *I will cast down your slain men before your idols* (Ezekiel 6:4) — is the very *cast your carcases upon the carcases of your idols* of the covenant-curse. The dead are heaped on the dead gods they served; the idolatry judged by the idols'' own ruin.'),
    ('canon','ezekiel',6,6,'canon','leviticus',26,31,'free',
      E'*And I will make your cities waste, and bring your sanctuaries unto desolation, and I will not smell the savour of your sweet odours* (Leviticus 26:31). Ezekiel''s *In all your dwellingplaces the cities shall be laid waste, and the high places shall be desolate... and your works may be abolished* (Ezekiel 6:6) is the same Leviticus 26 desolation poured out — the cities laid waste, the false sanctuaries brought to nought. The covenant-curse of Sinai falls on the high-place worship.'),
    ('canon','ezekiel',6,4,'canon','2-kings',23,14,'free',
      E'*And he brake in pieces the images, and cut down the groves, and filled their places with the bones of men* (2 Kings 23:14). Josiah had already enacted in the flesh what Ezekiel foretells — *And your altars shall be desolate, and your images shall be broken: and I will cast down your slain men before your idols* (Ezekiel 6:4). The images broken and the places filled with men''s bones are the high-place idolatry desecrated and undone, exactly as the prophet declares.'),
    ('canon','ezekiel',6,5,'canon','2-kings',23,20,'free',
      E'*And he slew all the priests of the high places that were there upon the altars, and burned men''s bones upon them, and returned to Jerusalem* (2 Kings 23:20). Josiah''s slaughter of the high-place priests upon their own altars is the very thing Ezekiel prophesies — *And I will lay the dead carcases of the children of Yashar''el (Israel) before their idols; and I will scatter your bones round about your altars* (Ezekiel 6:5). The altars of the high places are defiled with the bones of those who served them.'),
    ('canon','ezekiel',6,3,'canon','1-corinthians',10,14,'free',
      E'*Wherefore, my dearly beloved, flee from idolatry* (1 Corinthians 10:14). The high places Yahuah destroys — *I will destroy your high places* (Ezekiel 6:3) — are the idolatry the called-out people are charged to flee. What Ezekiel sees judged in the flesh, Paul makes the standing command: turn from the idols before the sword comes.'),
    ('canon','ezekiel',6,4,'canon','1-corinthians',10,7,'free',
      E'*Neither be ye idolaters, as were some of them; as it is written, The people sat down to eat and drink, and rose up to play* (1 Corinthians 10:7). The idols before which the slain are cast down — *I will cast down your slain men before your idols* (Ezekiel 6:4) — are the same snare Paul warns against, the idolatry that overthrew the fathers in the wilderness. The lesson of the broken images is written for our admonition.'),

    -- THREAD 2 (★): Yet will I leave a remnant — they shall remember me among the nations and repent
    ('canon','ezekiel',6,9,'canon','deuteronomy',30,1,'free',
      E'*And it shall come to pass, when all these things are come upon thee, the blessing and the curse, which I have set before thee, and thou shalt call them to mind among all the nations, whither Yahuah Elohayka (the LORD thy God) hath driven thee* (Deuteronomy 30:1). The remembering of the scattered remnant — *they that escape of you shall remember me among the nations whither they shall be carried captives* (Ezekiel 6:9) — is the Torah''s own promise of exile-and-recall: when the curse has fallen, the driven people *call them to mind among all the nations*. The remembrance is the first turn of repentance.'),
    ('canon','ezekiel',6,9,'canon','deuteronomy',30,2,'free',
      E'*And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice according to all that I command thee this day, thou and thy children, with all thine heart, and with all thy soul* (Deuteronomy 30:2). The self-lothing of the remnant — *they shall lothe themselves for the evils which they have committed* (Ezekiel 6:9) — is the turning Moses foretold: those who remember among the nations *return unto Yahuah Elohayka* with all the heart. The remnant kept is the remnant brought back to obedience, the Torah not abolished but returned to.'),
    ('canon','ezekiel',6,9,'canon','ezekiel',36,31,'free',
      E'*Then shall ye remember your own evil ways, and your doings that were not good, and shall lothe yourselves in your own sight for your iniquities and for your abominations* (Ezekiel 36:31). Ezekiel''s own restoration-chapter answers chapter 6 word for word — *they shall lothe themselves for the evils which they have committed* (Ezekiel 6:9) becomes *shall lothe yourselves in your own sight*. The same self-lothing repentance that the judgment begins is what the cleansing of the new heart completes.'),
    ('canon','ezekiel',6,8,'canon','zechariah',13,9,'free',
      E'*And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people, and they shall say, Yahuah (LORD) is my Elohim (God)* (Zechariah 13:9). The remnant left through the judgment — *Yet will I leave a remnant, that ye may have some that shall escape the sword among the nations* (Ezekiel 6:8) — is the third part refined in the fire, brought through to call on the Name. The kept remnant is the purified people, *It is my people... Yahuah is my Elohim*.'),
    ('canon','ezekiel',6,8,'canon','romans',11,5,'free',
      E'*Even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5). The promise *Yet will I leave a remnant* (Ezekiel 6:8) runs straight to Paul''s own day — there is always *a remnant according to the election of grace*. Yahuah never destroys his people utterly; in every generation of judgment a remnant is preserved and called.'),
    ('canon','ezekiel',6,8,'canon','romans',11,1,'free',
      E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). The leaving of a remnant — *Yet will I leave a remnant* (Ezekiel 6:8) — is the proof Paul presses: Yahuah has *not cast away his people*. The two-house people scattered through the countries are not abandoned; a remnant of the seed of Abraham is always kept.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 3 (★): the sword, the famine, and the pestilence upon the land
    ('canon','ezekiel',6,11,'canon','jeremiah',14,12,'free',
      E'*When they fast, I will not hear their cry; and when they offer burnt offering and an oblation, I will not accept them: but I will consume them by the sword, and by the famine, and by the pestilence* (Jeremiah 14:12). Jeremiah names the same threefold judgment Ezekiel pronounces — *they shall fall by the sword, by the famine, and by the pestilence* (Ezekiel 6:11). The covenant-triad — sword, famine, pestilence — is the standing sentence of the prophets upon a people who will not turn.'),
    ('canon','ezekiel',6,12,'canon','ezekiel',5,12,'free',
      E'*A third part of thee shall die with the pestilence, and with famine shall they be consumed in the midst of thee: and a third part shall fall by the sword round about thee; and I will scatter a third part into all the winds, and I will draw out a sword after them* (Ezekiel 5:12). Ezekiel''s own sister-oracle a chapter before distributes the same threefold judgment — *He that is far off shall die of the pestilence; and he that is near shall fall by the sword; and he that remaineth and is besieged shall die by the famine* (Ezekiel 6:12). Sword, famine, and pestilence are apportioned to far, near, and besieged alike; the fury accomplished.'),
    ('canon','ezekiel',6,12,'canon','revelation',6,8,'free',
      E'*And I looked, and behold a pale horse: and his name that sat on him was Death, and Hell followed with him. And power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death, and with the beasts of the earth* (Revelation 6:8). The threefold judgment of *the pestilence... the sword... the famine* (Ezekiel 6:12) rides forward under the pale horse — *to kill with sword, and with hunger, and with death*. The same covenant-sentence the prophet pronounced on the land is loosed upon the earth at the opening of the fourth seal.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-6-i-will-destroy-your-high-places-and-ye-shall-know-that-i-am-yahuah',
       E'I will destroy your high places — and ye shall know that I am Yahuah',
       E'The word comes against the mountains of Yashar''el (Israel) themselves — the very heights where the idols were set: *Behold, I, even I, will bring a sword upon you, and I will destroy your high places. And your altars shall be desolate, and your images shall be broken: and I will cast down your slain men before your idols* (Ezekiel 6:3-4), *And the slain shall fall in the midst of you, and ye shall know that I am Yahuah (LORD)* (6:7). Ezekiel is quoting the covenant-curse of Sinai nearly word for word: *And I will destroy your high places, and cut down your images, and cast your carcases upon the carcases of your idols, and my soul shall abhor you* (Leviticus 26:30), *And I will make your cities waste, and bring your sanctuaries unto desolation* (Leviticus 26:31). This is no arbitrary wrath but the Torah''s own sanction for idolatry, enacted — covenant-lawsuit against the SIN, never hatred of the people. Josiah had already done the deed in the flesh, the high places torn down a generation before the exile: *And he brake in pieces the images, and cut down the groves, and filled their places with the bones of men* (2 Kings 23:14), *And he slew all the priests of the high places that were there upon the altars, and burned men''s bones upon them* (2 Kings 23:20) — the very slain-cast-before-idols, the very bones-round-about-the-altars Ezekiel foretells. And to the called-out people the standing command stands: *Wherefore, my dearly beloved, flee from idolatry* (1 Corinthians 10:14), *Neither be ye idolaters, as were some of them* (1 Corinthians 10:7). But the whole aim of the judgment is named in the refrain that tolls three times through the chapter — *and ye shall know that I am Yahuah (LORD)* (6:7,13,14): the idols cut down, the high places desolate, the Name vindicated and Yahuah known as Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 32125
  FROM _s308_ezek06_lookup sv, _s308_ezek06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=6 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-6-yet-will-i-leave-a-remnant-that-shall-remember-me-among-the-nations',
       E'Yet will I leave a remnant — they shall remember me among the nations',
       E'In the very midst of the judgment, mercy is kept: *Yet will I leave a remnant, that ye may have some that shall escape the sword among the nations, when ye shall be scattered through the countries. And they that escape of you shall remember me among the nations whither they shall be carried captives... and they shall lothe themselves for the evils which they have committed in all their abominations* (Ezekiel 6:8-9). The people are scattered but not destroyed; a remnant is preserved, and in exile it remembers and repents. This is the Torah''s own promise of exile-and-return: *thou shalt call them to mind among all the nations, whither Yahuah Elohayka (the LORD thy God) hath driven thee, And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice... with all thine heart, and with all thy soul* (Deuteronomy 30:1-2). The remembering is the first turn of repentance, and the returning is to obedience — the Torah not cast off but returned to. Ezekiel''s own restoration-chapter answers it word for word: *Then shall ye remember your own evil ways... and shall lothe yourselves in your own sight for your iniquities and for your abominations* (Ezekiel 36:31). Zechariah sees the remnant refined: *I will bring the third part through the fire, and will refine them as silver is refined... they shall call on my name, and I will hear them: I will say, It is my people, and they shall say, Yahuah (LORD) is my Elohim (God)* (Zechariah 13:9). And Paul names the kept remnant of his own day: *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1); *Even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5). The two-house people scattered through the countries are never abandoned; a remnant is always kept and brought home, remembering and returning.',
       sv.verse_id, ev.verse_id, 'free', 32128
  FROM _s308_ezek06_lookup sv, _s308_ezek06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=6 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-6-the-sword-the-famine-and-the-pestilence-upon-the-land',
       E'The sword, the famine, and the pestilence — I will make the land desolate',
       E'The prophet is told to act out the grief of the verdict: *Smite with thine hand, and stamp with thy foot, and say, Alas for all the evil abominations of the house of Yashar''el (Israel)! for they shall fall by the sword, by the famine, and by the pestilence* (Ezekiel 6:11), and the threefold judgment is apportioned to all alike: *He that is far off shall die of the pestilence; and he that is near shall fall by the sword; and he that remaineth and is besieged shall die by the famine: thus will I accomplish my fury upon them* (6:12), *So will I stretch out my hand upon them, and make the land desolate... and they shall know that I am Yahuah (LORD)* (6:14). Sword, famine, and pestilence are the standing covenant-triad of the prophets. Jeremiah pronounces the same: *I will consume them by the sword, and by the famine, and by the pestilence* (Jeremiah 14:12). And Ezekiel''s own sister-oracle a chapter before distributes it by thirds: *A third part of thee shall die with the pestilence, and with famine shall they be consumed in the midst of thee: and a third part shall fall by the sword round about thee; and I will scatter a third part into all the winds* (Ezekiel 5:12). The same triad rides forward into the Revelation under the fourth seal: *and behold a pale horse: and his name that sat on him was Death, and Hell followed with him. And power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death, and with the beasts of the earth* (Revelation 6:8). The judgment is real and it is total — and through it, again, the same end: *they shall know that I am Yahuah (LORD)* (6:14).',
       sv.verse_id, ev.verse_id, 'free', 32131
  FROM _s308_ezek06_lookup sv, _s308_ezek06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=6 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=6 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I will destroy your high places, and cut down your images, and cast your carcases upon the carcases of your idols* (Leviticus 26:30) — Ezekiel 6:3 quotes the covenant-curse of Sinai nearly verbatim; the Torah''s own sanction for idolatry enacted.'
  FROM cross_reference_threads t
  JOIN _s308_ezek06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s308_ezek06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-6-i-will-destroy-your-high-places-and-ye-shall-know-that-i-am-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *cast your carcases upon the carcases of your idols* (Leviticus 26:30) — the slain cast before the idols (Ezekiel 6:4) is the dead heaped on the dead gods they served; the same Sinai curse.'
  FROM cross_reference_threads t
  JOIN _s308_ezek06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s308_ezek06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-6-i-will-destroy-your-high-places-and-ye-shall-know-that-i-am-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *I will make your cities waste, and bring your sanctuaries unto desolation* (Leviticus 26:31) — the cities laid waste and high places made desolate (Ezekiel 6:6) is the same Leviticus 26 desolation poured out.'
  FROM cross_reference_threads t
  JOIN _s308_ezek06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s308_ezek06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-6-i-will-destroy-your-high-places-and-ye-shall-know-that-i-am-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *he brake in pieces the images, and cut down the groves, and filled their places with the bones of men* (2 Kings 23:14) — Josiah enacts in the flesh what Ezekiel 6:4 foretells: images broken, places filled with bones.'
  FROM cross_reference_threads t
  JOIN _s308_ezek06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s308_ezek06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=23 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-6-i-will-destroy-your-high-places-and-ye-shall-know-that-i-am-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *he slew all the priests of the high places... and burned men''s bones upon them* (2 Kings 23:20) — the bones scattered round about the altars (Ezekiel 6:5) defile the high-place altars, as Josiah did.'
  FROM cross_reference_threads t
  JOIN _s308_ezek06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s308_ezek06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=23 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-6-i-will-destroy-your-high-places-and-ye-shall-know-that-i-am-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *flee from idolatry* (1 Corinthians 10:14) — the high places Yahuah destroys (Ezekiel 6:3) are the idolatry the called-out people are charged to flee; the standing command.'
  FROM cross_reference_threads t
  JOIN _s308_ezek06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s308_ezek06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-6-i-will-destroy-your-high-places-and-ye-shall-know-that-i-am-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Neither be ye idolaters, as were some of them* (1 Corinthians 10:7) — the idols before which the slain are cast (Ezekiel 6:4) are the snare written for our admonition; the lesson of the broken images.'
  FROM cross_reference_threads t
  JOIN _s308_ezek06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s308_ezek06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-6-i-will-destroy-your-high-places-and-ye-shall-know-that-i-am-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *thou shalt call them to mind among all the nations, whither Yahuah Elohayka (the LORD thy God) hath driven thee* (Deuteronomy 30:1) — the remnant remembering among the nations (Ezekiel 6:9) is the Torah''s own promise of exile-and-recall.'
  FROM cross_reference_threads t
  JOIN _s308_ezek06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=6 AND sv.verse_number=9
  JOIN _s308_ezek06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-6-yet-will-i-leave-a-remnant-that-shall-remember-me-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *And shalt return unto Yahuah Elohayka (the LORD thy God)... with all thine heart, and with all thy soul* (Deuteronomy 30:2) — the self-lothing of the remnant (Ezekiel 6:9) is the turning back to obedience; the Torah returned to, not abolished.'
  FROM cross_reference_threads t
  JOIN _s308_ezek06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=6 AND sv.verse_number=9
  JOIN _s308_ezek06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-6-yet-will-i-leave-a-remnant-that-shall-remember-me-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Then shall ye remember your own evil ways... and shall lothe yourselves in your own sight* (Ezekiel 36:31) — the restoration-chapter answers Ezekiel 6:9 word for word; the same self-lothing repentance the cleansing completes.'
  FROM cross_reference_threads t
  JOIN _s308_ezek06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=6 AND sv.verse_number=9
  JOIN _s308_ezek06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-6-yet-will-i-leave-a-remnant-that-shall-remember-me-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *I will bring the third part through the fire, and will refine them... It is my people... Yahuah (LORD) is my Elohim (God)* (Zechariah 13:9) — the remnant left (Ezekiel 6:8) is the third part refined and brought through to call on the Name.'
  FROM cross_reference_threads t
  JOIN _s308_ezek06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s308_ezek06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=13 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-6-yet-will-i-leave-a-remnant-that-shall-remember-me-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *there is a remnant according to the election of grace* (Romans 11:5) — the promise *Yet will I leave a remnant* (Ezekiel 6:8) runs straight to Paul''s day; in every judgment a remnant is preserved.'
  FROM cross_reference_threads t
  JOIN _s308_ezek06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s308_ezek06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-6-yet-will-i-leave-a-remnant-that-shall-remember-me-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — the leaving of a remnant (Ezekiel 6:8) is Paul''s proof Yahuah has not cast away the two-house people; the seed of Abraham is kept.'
  FROM cross_reference_threads t
  JOIN _s308_ezek06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s308_ezek06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-6-yet-will-i-leave-a-remnant-that-shall-remember-me-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I will consume them by the sword, and by the famine, and by the pestilence* (Jeremiah 14:12) — Jeremiah names the same threefold judgment Ezekiel 6:11 pronounces; the standing covenant-triad of the prophets.'
  FROM cross_reference_threads t
  JOIN _s308_ezek06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=6 AND sv.verse_number=11
  JOIN _s308_ezek06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=14 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-6-the-sword-the-famine-and-the-pestilence-upon-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *A third part of thee shall die with the pestilence... a third part shall fall by the sword... I will scatter a third part into all the winds* (Ezekiel 5:12) — the sister-oracle a chapter before distributes the same triad Ezekiel 6:12 apportions to far, near, and besieged.'
  FROM cross_reference_threads t
  JOIN _s308_ezek06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s308_ezek06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=5 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-6-the-sword-the-famine-and-the-pestilence-upon-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *to kill with sword, and with hunger, and with death, and with the beasts of the earth* (Revelation 6:8) — the threefold judgment of Ezekiel 6:12 rides forward under the pale horse at the fourth seal; the same covenant-sentence loosed on the earth.'
  FROM cross_reference_threads t
  JOIN _s308_ezek06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s308_ezek06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-6-the-sword-the-famine-and-the-pestilence-upon-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezekiel_7.sql (Ezekiel 7) -----
-- Chapter: Ezekiel 7 — AN END, THE END IS COME upon the four corners of the land. The day of trouble,
-- the day of the wrath of Yahuah (LORD): the end pronounced on the land of Yashar''el (Israel), anger
-- poured out, recompense according to their ways. The sword without and the pestilence and famine within;
-- silver cast in the streets and gold removed — WEALTH CANNOT RANSOM in the day of wrath. And in the
-- judgment a famine of the word: they shall seek a vision of the prophet, but the law shall perish from
-- the priest, and counsel from the ancients. A Deuteronomy-28 covenant-lawsuit chapter: the curse is the
-- exile-judgment for covenant-breaking, never the Torah itself.
-- Tag: ezek07   Temp view: _s308_ezek07_lookup
-- Sort band: base 32150, step 3 -> 32150, 32153, 32156 (3 threads)
-- Source of EVERY row: 'canon','ezekiel',7,v
--
-- Ezekiel 7 coverage:
--   v.1 (the word of Yahuah came) — superscription; no add (NT none / Extras none / Tanakh none warranted).
--   ★★ v.2-6 (An end, the end is come upon the four corners of the land... Now is the end come upon thee...
--          An end is come, the end is come: it watcheth for thee... the day of trouble is near)
--        NT:     ★★ Matthew 24:6 (the end is not yet) + ★★ Matthew 24:14 (then shall the end come),
--                ★★ Revelation 7:1 (four angels on the four corners of the earth, holding the four winds) — THREAD 1
--        Extras: none warranted (clean canon-NT-Tanakh day-of-Yahuah / the-end weave)
--        Tanakh: ★★★ Amos 8:2 (The end is come upon my people of Yashar''el), ★ Lamentations 4:18 (our end
--                is near, our days are fulfilled; for our end is come) — THREAD 1
--   v.7-14 (the morning come, the rod blossomed, pride budded; wrath upon all the multitude; the trumpet
--          blown but none goeth to battle) — the unfolding of the day of trouble; woven into THREAD 1 prose;
--          no separate add (NT none distinct / Extras none / Tanakh none warranted — held in THREAD 1).
--   ★ v.15-19 (The sword without, the pestilence and famine within... They shall cast their silver in the
--          streets, and their gold shall be removed: their silver and their gold shall not be able to
--          deliver them in the day of the wrath of Yahuah)
--        NT:     ★★ James 5:1-3 (your gold and silver is cankered... ye have heaped treasure together for
--                the last days), ★ 1 Peter 1:18 (not redeemed with corruptible things, as silver and gold) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Zephaniah 1:18 (neither their silver nor their gold shall be able to deliver them in
--                the day of the LORD''S wrath — Zephaniah echoes Ezekiel verbatim), ★ Proverbs 11:4 (Riches
--                profit not in the day of wrath) — THREAD 2
--   v.20-25 (the beauty of his ornament made into images of abominations; given to strangers for a prey;
--          the worst of the heathen possess their houses; destruction cometh, they seek peace, none) —
--          the desecrated sanctuary / the invading heathen; woven into THREAD 2/3 prose; no separate add
--          (NT none / Extras none / Tanakh none warranted as distinct rows).
--   ★ v.26-27 (Then shall they seek a vision of the prophet; but the law shall perish from the priest, and
--          counsel from the ancients... the king shall mourn, the prince clothed with desolation)
--        NT:     none warranted (the famine-of-the-word is answered laterally in the Tanakh prophets; no NT
--                quotation forced — held in prose)
--        Extras: none warranted
--        Tanakh: ★★ Amos 8:11-12 (a famine... of hearing the words of Yahuah; they shall run to and fro to
--                seek the word of Yahuah, and shall not find it), ★ Psalm 74:9 (there is no more any prophet),
--                ★ Micah 3:6-7 (night... that ye shall not have a vision; the seers ashamed) — THREAD 3
--
-- Threads (slug — target libraries):
--   1. ezekiel-7-an-end-the-end-is-come-upon-the-four-corners-of-the-land — NT (Matthew 24, Revelation 7) + Tanakh (Amos 8, Lamentations 4) [free]
--      (★★ THE END pronounced on the land; the day of trouble, the day of Yahuah; the four corners / four winds)
--   2. ezekiel-7-their-silver-and-gold-shall-not-deliver-in-the-day-of-wrath — NT (James 5, 1 Peter 1) + Tanakh (Zephaniah 1, Proverbs 11) [free]
--      (★ wealth cannot ransom in the day of wrath; silver cast in the streets, the stumblingblock of their iniquity)
--   3. ezekiel-7-the-law-shall-perish-from-the-priest-a-famine-of-the-word — Tanakh (Amos 8, Psalm 74, Micah 3) [free]
--      (★ the famine of the word in the judgment; they seek a vision but find none; the Torah withheld from the rebellious)
--
-- Framing notes:
--   ★★ THE END UPON THE FOUR CORNERS (THREAD 1): *thus saith Adonai Yahuah (the Lord GOD) unto the land of
--      Yashar''el (Israel); An end, the end is come upon the four corners of the land* (7:2), *Now is the end
--      come upon thee... I will judge thee according to thy ways* (7:3), *An end is come, the end is come: it
--      watcheth for thee; behold, it is come* (7:6), *the day of trouble is near* (7:7). Amos sounded the same
--      word over the same northern house — *The end is come upon my people of Yashar''el (Israel); I will not
--      again pass by them any more* (Amos 8:2); Jeremiah''s lament confesses it fulfilled — *our end is near,
--      our days are fulfilled; for our end is come* (Lam 4:18). The Formed Son carries "the end" forward to
--      the consummation — *the end is not yet* (Matt 24:6), *then shall the end come* (Matt 24:14) — and John
--      sees the four corners again — *four angels standing on the four corners of the earth, holding the four
--      winds* (Rev 7:1). The day of trouble of one land foreshadows the day of Yahuah on all the earth.
--   ★ SILVER AND GOLD CANNOT DELIVER (THREAD 2): *The sword is without, and the pestilence and the famine
--      within* (7:15); *They shall cast their silver in the streets, and their gold shall be removed: their
--      silver and their gold shall not be able to deliver them in the day of the wrath of Yahuah (LORD)...
--      because it is the stumblingblock of their iniquity* (7:19). Zephaniah echoes it almost word for word —
--      *Neither their silver nor their gold shall be able to deliver them in the day of the LORD''S wrath*
--      (Zeph 1:18); Proverbs names the rule — *Riches profit not in the day of wrath: but righteousness
--      delivereth from death* (Prov 11:4). James turns it on the last-days rich — *Your gold and silver is
--      cankered... Ye have heaped treasure together for the last days* (Jas 5:3); and Peter names the only
--      ransom that holds — not *silver and gold* but *the precious blood of Messiah (Christ)* (1 Pet 1:18-19).
--   ★ THE LAW SHALL PERISH FROM THE PRIEST (THREAD 3): *then shall they seek a vision of the prophet; but
--      the law shall perish from the priest, and counsel from the ancients* (7:26). The judgment is a famine
--      of the word — not the Torah abolished, but withheld from the rebellious who would not keep it. Amos
--      names it — *a famine... of hearing the words of Yahuah (LORD)... they shall run to and fro to seek the
--      word of Yahuah, and shall not find it* (Amos 8:11-12); Asaph mourns it — *We see not our signs: there
--      is no more any prophet* (Ps 74:9); Micah pronounces it on the false prophets — *night... that ye shall
--      not have a vision... the seers ashamed, and the diviners confounded... for there is no answer of
--      Elohim (God)* (Mic 3:6-7). When the people will not hear the instruction, the instruction is taken away.
--   VERSES WITH NO SEPARATE ADD: v.1 (superscription); v.7-14 (the unfolding day of trouble — held in THREAD
--      1 prose); v.20-25 (the desecrated sanctuary and invading heathen — held in THREAD 2/3 prose). All
--      verses recorded in the coverage checklist above; every meaningful block carries a thread.

CREATE TEMP VIEW _s308_ezek07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): An end, the end is come upon the four corners of the land — the day of trouble
    ('canon','ezekiel',7,2,'canon','amos',8,2,'free',
      E'*And he said, Amos, what seest thou? And I said, A basket of summer fruit. Then said Yahuah (LORD) unto me, The end is come upon my people of Yashar''el (Israel); I will not again pass by them any more* (Amos 8:2). Amos hears over the same people the very word Ezekiel hears over the land — *An end, the end is come upon the four corners of the land* (Ezekiel 7:2). The summer-fruit basket (ripe for harvest) and the four-cornered end are the one sentence: *the end is come upon my people*, Yahuah will pass by them no more.'),
    ('canon','ezekiel',7,6,'canon','amos',8,2,'free',
      E'*Then said Yahuah (LORD) unto me, The end is come upon my people of Yashar''el (Israel); I will not again pass by them any more* (Amos 8:2). The drumbeat *An end is come, the end is come: it watcheth for thee; behold, it is come* (Ezekiel 7:6) is Amos''s sentence spoken again — *the end is come upon my people*. The end that watches and will not be passed by is the covenant-judgment fallen full.'),
    ('canon','ezekiel',7,6,'canon','lamentations',4,18,'free',
      E'*They hunt our steps, that we cannot go in our streets: our end is near, our days are fulfilled; for our end is come* (Lamentations 4:18). Jeremiah''s lament confesses fulfilled the very word Ezekiel announced — *An end is come, the end is come... behold, it is come* (Ezekiel 7:6). From the prophet''s warning to the mourner''s confession: *for our end is come*; the days were fulfilled and the sentence fell.'),
    ('canon','ezekiel',7,2,'canon','revelation',7,1,'free',
      E'*And after these things I saw four angels standing on the four corners of the earth, holding the four winds of the earth, that the wind should not blow on the earth, nor on the sea, nor on any tree* (Revelation 7:1). The end *come upon the four corners of the land* (Ezekiel 7:2) opens forward into John''s vision of the four angels on *the four corners of the earth*, the winds of judgment held until the servants of Elohim (God) are sealed. The day of trouble on one land foreshadows the day of Yahuah upon all the earth.'),
    ('canon','ezekiel',7,7,'canon','matthew',24,6,'free',
      E'*And ye shall hear of wars and rumours of wars: see that ye be not troubled: for all these things must come to pass, but the end is not yet* (Matthew 24:6). The Formed Son takes up *the end* and *the day of trouble is near* (Ezekiel 7:7) and stretches it to the consummation — *the end is not yet*: the wars and rumours that fill Ezekiel''s chapter (7:14, 7:25-26) are the birth-pangs, not the final end. The end of one land is the type of the end of the age.'),
    ('canon','ezekiel',7,6,'canon','matthew',24,14,'free',
      E'*And this gospel of the kingdom shall be preached in all the world for a witness unto all nations; and then shall the end come* (Matthew 24:14). Ezekiel''s *An end is come, the end is come* (Ezekiel 7:6) is the near, local fulfilment of the word the Son carries to its full reach — *then shall the end come*. The same sentence runs from the land of Yashar''el (Israel) to all nations: an end is decreed, and it comes.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 2 (★): silver and gold shall not deliver in the day of the wrath of Yahuah
    ('canon','ezekiel',7,19,'canon','zephaniah',1,18,'free',
      E'*Neither their silver nor their gold shall be able to deliver them in the day of the LORD''S wrath; but the whole land shall be devoured by the fire of his jealousy: for he shall make even a speedy riddance of all them that dwell in the land* (Zephaniah 1:18). Zephaniah echoes Ezekiel almost word for word — *their silver and their gold shall not be able to deliver them in the day of the wrath of Yahuah (LORD)* (Ezekiel 7:19). In the day of wrath no purchase price can ransom; the hoarded silver and gold are powerless against the fire of his jealousy.'),
    ('canon','ezekiel',7,19,'canon','proverbs',11,4,'free',
      E'*Riches profit not in the day of wrath: but righteousness delivereth from death* (Proverbs 11:4). The proverb names the rule Ezekiel''s judgment enacts — *their silver and their gold shall not be able to deliver them in the day of the wrath of Yahuah (LORD)* (Ezekiel 7:19): riches cannot deliver, only righteousness delivers from death. The silver cast in the streets *shall not satisfy their souls* (7:19), for it never could.'),
    ('canon','ezekiel',7,19,'canon','james',5,3,'free',
      E'*Your gold and silver is cankered; and the rust of them shall be a witness against you, and shall eat your flesh as it were fire. Ye have heaped treasure together for the last days* (James 5:3). James turns Ezekiel''s judgment on the last-days rich: the very *gold and silver* that Ezekiel says *shall not be able to deliver them in the day of the wrath of Yahuah (LORD)* (Ezekiel 7:19) is cankered, a witness against its hoarders, fuel for the fire. Treasure heaped for the last days delivers no one.'),
    ('canon','ezekiel',7,19,'canon','james',5,1,'free',
      E'*Go to now, ye rich men, weep and howl for your miseries that shall come upon you* (James 5:1). The wailing of those who *cast their silver in the streets* (Ezekiel 7:19) is the *weep and howl* of the rich whose miseries are come. The silver that cannot deliver becomes the occasion of their mourning in the day of wrath.'),
    ('canon','ezekiel',7,19,'canon','1-peter',1,18,'free',
      E'*Forasmuch as ye know that ye were not redeemed with corruptible things, as silver and gold, from your vain conversation received by tradition from your fathers* (1 Peter 1:18). Ezekiel''s verdict that *silver and... gold shall not be able to deliver them in the day of the wrath of Yahuah (LORD)* (Ezekiel 7:19) is the negative of Peter''s gospel: corruptible silver and gold redeem nothing; only *the precious blood of Messiah (Christ), as of a lamb without blemish* (1 Pet 1:19) ransoms. The wealth that fails in the day of wrath is no redemption at all.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 3 (★): the law shall perish from the priest — a famine of the word
    ('canon','ezekiel',7,26,'canon','amos',8,11,'free',
      E'*Behold, the days come, saith Adonai Yahuah (the Lord GOD), that I will send a famine in the land, not a famine of bread, nor a thirst for water, but of hearing the words of Yahuah (LORD)* (Amos 8:11). Amos names the very deprivation Ezekiel pronounces — *the law shall perish from the priest, and counsel from the ancients* (Ezekiel 7:26): a famine not of bread but of the word. When the people will not keep the instruction, the instruction is withdrawn.'),
    ('canon','ezekiel',7,26,'canon','amos',8,12,'free',
      E'*And they shall wander from sea to sea, and from the north even to the east, they shall run to and fro to seek the word of Yahuah (LORD), and shall not find it* (Amos 8:12). The seeking of *a vision of the prophet* that finds none, *but the law shall perish from the priest* (Ezekiel 7:26), is Amos''s running to and fro for the word that is no longer found. The desperate search in the day of judgment meets only silence.'),
    ('canon','ezekiel',7,26,'canon','psalms',74,9,'free',
      E'*We see not our signs: there is no more any prophet: neither is there among us any that knoweth how long* (Psalm 74:9). Asaph mourns the very famine Ezekiel decrees — *then shall they seek a vision of the prophet; but the law shall perish from the priest* (Ezekiel 7:26). When the sanctuary is defiled (7:22, 24) the vision ceases: *there is no more any prophet*, and none knows how long.'),
    ('canon','ezekiel',7,26,'canon','micah',3,7,'free',
      E'*Then shall the seers be ashamed, and the diviners confounded: yea, they shall all cover their lips; for there is no answer of Elohim (God)* (Micah 3:7). Micah pronounces on the false prophets the dearth Ezekiel announces — *they seek a vision of the prophet; but the law shall perish from the priest* (Ezekiel 7:26): the seers ashamed, the night without vision (Mic 3:6), *for there is no answer of Elohim (God)*. The withheld word leaves the would-be seers silent.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-7-an-end-the-end-is-come-upon-the-four-corners-of-the-land',
       E'An end, the end is come upon the four corners of the land — the day of trouble is near',
       E'The word falls with terrible finality: *thus saith Adonai Yahuah (the Lord GOD) unto the land of Yashar''el (Israel); An end, the end is come upon the four corners of the land* (7:2), *Now is the end come upon thee, and I will send mine anger upon thee, and will judge thee according to thy ways* (7:3). The drumbeat repeats and will not be stilled: *An end is come, the end is come: it watcheth for thee; behold, it is come* (7:6), *The morning is come unto thee, O thou that dwellest in the land: the time is come, the day of trouble is near* (7:7). This is the Deuteronomy-28 covenant-judgment fallen full — never the Torah itself indicted, but the land judged for breaking it. Amos heard the same sentence over the same people: *The end is come upon my people of Yashar''el (Israel); I will not again pass by them any more* (Amos 8:2). And Jeremiah''s lament confesses it fulfilled: *our end is near, our days are fulfilled; for our end is come* (Lamentations 4:18). The Formed Son takes up "the end" and stretches it to the consummation of the age — *all these things must come to pass, but the end is not yet* (Matthew 24:6), *and this gospel of the kingdom shall be preached in all the world for a witness unto all nations; and then shall the end come* (Matthew 24:14) — and John sees the four corners of Ezekiel once more: *four angels standing on the four corners of the earth, holding the four winds of the earth* (Revelation 7:1). The day of trouble on one land is the near foreshadow of the day of Yahuah upon all the earth.',
       sv.verse_id, ev.verse_id, 'free', 32150
  FROM _s308_ezek07_lookup sv, _s308_ezek07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=7 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-7-their-silver-and-gold-shall-not-deliver-in-the-day-of-wrath',
       E'Their silver and their gold shall not be able to deliver them in the day of the wrath of Yahuah',
       E'The judgment closes every door of escape: *The sword is without, and the pestilence and the famine within: he that is in the field shall die with the sword; and he that is in the city, famine and pestilence shall devour him* (7:15). And the one refuge men trust most — their wealth — fails utterly: *They shall cast their silver in the streets, and their gold shall be removed: their silver and their gold shall not be able to deliver them in the day of the wrath of Yahuah (LORD): they shall not satisfy their souls, neither fill their bowels: because it is the stumblingblock of their iniquity* (7:19). Silver flung in the streets as worthless, gold powerless — for it was the very *stumblingblock of their iniquity*, the idol that turned their hearts. Zephaniah echoes the verdict almost word for word: *Neither their silver nor their gold shall be able to deliver them in the day of the LORD''S wrath; but the whole land shall be devoured by the fire of his jealousy* (Zephaniah 1:18). Proverbs names the rule beneath it: *Riches profit not in the day of wrath: but righteousness delivereth from death* (Proverbs 11:4). James turns the same word on the last-days rich: *Go to now, ye rich men, weep and howl for your miseries that shall come upon you... Your gold and silver is cankered; and the rust of them shall be a witness against you... Ye have heaped treasure together for the last days* (James 5:1,3). And Peter names the only ransom that holds: *ye were not redeemed with corruptible things, as silver and gold... But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:18-19). The wealth that cannot deliver in the day of wrath was never a redemption at all.',
       sv.verse_id, ev.verse_id, 'free', 32153
  FROM _s308_ezek07_lookup sv, _s308_ezek07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=7 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=7 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-7-the-law-shall-perish-from-the-priest-a-famine-of-the-word',
       E'The law shall perish from the priest, and counsel from the ancients — a famine of the word',
       E'In the day of judgment a strange dearth falls: *Mischief shall come upon mischief, and rumour shall be upon rumour; then shall they seek a vision of the prophet; but the law shall perish from the priest, and counsel from the ancients* (7:26). They will look at last for the word they would not keep — and it is gone. This is no abolition of the Torah; it is the instruction withheld from a people who despised it, the lamp removed from those who would not walk by it. Amos names the very famine: *Behold, the days come... that I will send a famine in the land, not a famine of bread, nor a thirst for water, but of hearing the words of Yahuah (LORD)* (Amos 8:11), *they shall run to and fro to seek the word of Yahuah (LORD), and shall not find it* (Amos 8:12). Asaph mourns it in the ruined sanctuary: *We see not our signs: there is no more any prophet: neither is there among us any that knoweth how long* (Psalm 74:9). And Micah pronounces it on the false prophets who led the people astray: *night... that ye shall not have a vision; and it shall be dark unto you, that ye shall not divine... Then shall the seers be ashamed, and the diviners confounded... for there is no answer of Elohim (God)* (Micah 3:6-7). When the priest will not teach the Torah and the people will not hear it, the word itself is taken away — and the seekers of a vision find only silence.',
       sv.verse_id, ev.verse_id, 'free', 32156
  FROM _s308_ezek07_lookup sv, _s308_ezek07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=7 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=7 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *The end is come upon my people of Yashar''el (Israel); I will not again pass by them any more* (Amos 8:2) — Amos hears over the people the word Ezekiel hears over the land; the four-cornered end and the summer-fruit basket are one sentence.'
  FROM cross_reference_threads t
  JOIN _s308_ezek07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s308_ezek07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-7-an-end-the-end-is-come-upon-the-four-corners-of-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *The end is come upon my people of Yashar''el (Israel)* (Amos 8:2) — the drumbeat *An end is come, the end is come* (Ezekiel 7:6) is Amos''s sentence spoken again; the end will not be passed by.'
  FROM cross_reference_threads t
  JOIN _s308_ezek07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s308_ezek07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-7-an-end-the-end-is-come-upon-the-four-corners-of-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *our end is near, our days are fulfilled; for our end is come* (Lamentations 4:18) — Jeremiah''s lament confesses fulfilled the word Ezekiel 7:6 announced; from warning to mourning.'
  FROM cross_reference_threads t
  JOIN _s308_ezek07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s308_ezek07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=4 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-7-an-end-the-end-is-come-upon-the-four-corners-of-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *four angels standing on the four corners of the earth, holding the four winds* (Revelation 7:1) — the end upon *the four corners of the land* (Ezekiel 7:2) opens into John''s four angels on the four corners of the earth; one land foreshadows all the earth.'
  FROM cross_reference_threads t
  JOIN _s308_ezek07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s308_ezek07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-7-an-end-the-end-is-come-upon-the-four-corners-of-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *all these things must come to pass, but the end is not yet* (Matthew 24:6) — the Formed Son stretches *the day of trouble is near* (Ezekiel 7:7) to the consummation; the end of one land is the type of the end of the age.'
  FROM cross_reference_threads t
  JOIN _s308_ezek07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=7 AND sv.verse_number=7
  JOIN _s308_ezek07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-7-an-end-the-end-is-come-upon-the-four-corners-of-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *and then shall the end come* (Matthew 24:14) — Ezekiel''s *An end is come, the end is come* (Ezekiel 7:6) is the near fulfilment of the word the Son carries to all nations; an end is decreed, and it comes.'
  FROM cross_reference_threads t
  JOIN _s308_ezek07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s308_ezek07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-7-an-end-the-end-is-come-upon-the-four-corners-of-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Neither their silver nor their gold shall be able to deliver them in the day of the LORD''S wrath* (Zephaniah 1:18) — Zephaniah echoes Ezekiel 7:19 almost word for word; no price ransoms in the day of wrath.'
  FROM cross_reference_threads t
  JOIN _s308_ezek07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=7 AND sv.verse_number=19
  JOIN _s308_ezek07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-7-their-silver-and-gold-shall-not-deliver-in-the-day-of-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Riches profit not in the day of wrath: but righteousness delivereth from death* (Proverbs 11:4) — the proverb names the rule Ezekiel 7:19 enacts; silver and gold cannot satisfy the soul.'
  FROM cross_reference_threads t
  JOIN _s308_ezek07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=7 AND sv.verse_number=19
  JOIN _s308_ezek07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-7-their-silver-and-gold-shall-not-deliver-in-the-day-of-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Your gold and silver is cankered... Ye have heaped treasure together for the last days* (James 5:3) — James turns Ezekiel 7:19''s verdict on the last-days rich; the hoarded wealth is a witness against them.'
  FROM cross_reference_threads t
  JOIN _s308_ezek07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=7 AND sv.verse_number=19
  JOIN _s308_ezek07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-7-their-silver-and-gold-shall-not-deliver-in-the-day-of-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Go to now, ye rich men, weep and howl for your miseries* (James 5:1) — the wailing of those who cast their silver in the streets (Ezekiel 7:19) is the howl of the rich whose miseries are come.'
  FROM cross_reference_threads t
  JOIN _s308_ezek07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=7 AND sv.verse_number=19
  JOIN _s308_ezek07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-7-their-silver-and-gold-shall-not-deliver-in-the-day-of-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *ye were not redeemed with corruptible things, as silver and gold* (1 Peter 1:18) — the wealth that fails in the day of wrath (Ezekiel 7:19) is no ransom; only the precious blood of Messiah (Christ) redeems (1 Peter 1:19).'
  FROM cross_reference_threads t
  JOIN _s308_ezek07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=7 AND sv.verse_number=19
  JOIN _s308_ezek07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-7-their-silver-and-gold-shall-not-deliver-in-the-day-of-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *a famine in the land, not a famine of bread... but of hearing the words of Yahuah (LORD)* (Amos 8:11) — Amos names the very dearth Ezekiel 7:26 pronounces; the word withdrawn from a people who despised it.'
  FROM cross_reference_threads t
  JOIN _s308_ezek07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=7 AND sv.verse_number=26
  JOIN _s308_ezek07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-7-the-law-shall-perish-from-the-priest-a-famine-of-the-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *they shall run to and fro to seek the word of Yahuah (LORD), and shall not find it* (Amos 8:12) — the seeking of a vision that finds none (Ezekiel 7:26); the desperate search meets only silence.'
  FROM cross_reference_threads t
  JOIN _s308_ezek07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=7 AND sv.verse_number=26
  JOIN _s308_ezek07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-7-the-law-shall-perish-from-the-priest-a-famine-of-the-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *We see not our signs: there is no more any prophet* (Psalm 74:9) — Asaph mourns in the ruined sanctuary the famine Ezekiel 7:26 decrees; the vision ceases when the holy place is defiled.'
  FROM cross_reference_threads t
  JOIN _s308_ezek07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=7 AND sv.verse_number=26
  JOIN _s308_ezek07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=74 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-7-the-law-shall-perish-from-the-priest-a-famine-of-the-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *the seers be ashamed, and the diviners confounded... for there is no answer of Elohim (God)* (Micah 3:7) — Micah pronounces on the false prophets the dearth of Ezekiel 7:26; the night without vision.'
  FROM cross_reference_threads t
  JOIN _s308_ezek07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=7 AND sv.verse_number=26
  JOIN _s308_ezek07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=3 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-7-the-law-shall-perish-from-the-priest-a-famine-of-the-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezekiel_8.sql (Ezekiel 8) -----
-- Chapter: Ezekiel 8 — the prophet carried in vision to Jerusalem; the IMAGE OF JEALOUSY in the gate
-- that provoketh to jealousy and drives the Glory far off from the sanctuary; the SEVENTY ANCIENTS of
-- the house of Yashar''el (Israel) each with his censer in the dark chambers of imagery, saying *Yahuah
-- (LORD) seeth us not; Yahuah hath forsaken the earth*; the WOMEN WEEPING FOR TAMMUZ; the five-and-twenty
-- men with their BACKS toward the temple of Yahuah and their faces toward the east, WORSHIPPING THE SUN.
-- The escalating abominations IN Yahuah''s own house that drive the Glory of the Elohim of Yashar''el out
-- (the departure consummated in ch10-11). The lens: idolatry inside the covenant house is covenant-breach,
-- not the Torah''s failure — the jealous El of Exodus 20 and Deuteronomy 32 against the strange gods, the
-- lie that Yahuah does not see answered by the One who planted the ear and formed the eye.
-- Tag: ezek08   Temp view: _s308_ezek08_lookup
-- Sort band: base 32175, step 3 -> threads at 32175, 32178, 32181 (3 threads)
-- Source of EVERY row: 'canon','ezekiel',8,v
--
-- Ezekiel 8 coverage:
--   v.1-2 (the sixth year; the elders of Yahudah sat before me; the hand of Adonai Yahuah fell; a likeness
--          as the appearance of fire... amber)
--        NT:     none warranted (the throne-fire theophany; held — the same likeness as Ezek 1, the FORMED
--                One; woven in prose of THREAD 1)
--        Extras: none warranted
--        Tanakh: none separate (the amber/fire vision = the Glory-form of ch1; preface to v.3-6)
--   ★ v.3-6 (brought to Jerusalem, the door of the inner gate; the SEAT OF THE IMAGE OF JEALOUSY, WHICH
--          PROVOKETH TO JEALOUSY; the glory of the Elohim of Yashar''el was there; the great abominations
--          that the house of Yashar''el committeth here, that I should go far off from my sanctuary)
--        NT:     ★ 1 Corinthians 10:22 (Do we provoke Yahuah (Lord) to jealousy? are we stronger than he?),
--                ★ 1 Corinthians 10:21 (ye cannot be partakers of Yahuah''s table, and of the table of
--                devils) — THREAD 1
--        Extras: none warranted (clean Torah-canon-NT jealousy weave; no extras forced)
--        Tanakh: ★★ Exodus 20:5 (I Yahuah Elohayka am a jealous Elohim), ★ Exodus 20:4 (thou shalt not make
--                unto thee any graven image), ★★ Deuteronomy 32:16 (they provoked him to jealousy with
--                strange gods... provoked they him to anger), ★ Deuteronomy 32:21 (they have moved me to
--                jealousy with that which is not Elohim) — THREAD 1
--   ★★ v.7-12 (the hole in the wall, the door, the chambers of imagery; every form of creeping things and
--          all the idols of the house of Yashar''el pourtrayed; the SEVENTY ANCIENTS with censers in the
--          dark; FOR THEY SAY, YAHUAH SEETH US NOT; YAHUAH HATH FORSAKEN THE EARTH)
--        NT:     ★★ Romans 1:23 (changed the glory of the uncorruptible Elohim into an image made like to...
--                creeping things), ★★ Romans 1:25 (worshipped and served the creature more than the
--                Creator), ★★ Hebrews 4:13 (all things are naked and opened unto the eyes of him with whom
--                we have to do) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Psalm 94:7 (Yahuah shall not see, neither shall the Elohim of Jacob regard it), ★★ Psalm
--                94:9 (he that planted the ear, shall he not hear? he that formed the eye, shall he not see?),
--                ★ Psalm 10:11 (Elohim hath forgotten: he hideth his face; he will never see it) — THREAD 2
--   ★ v.13-16 (the WOMEN WEEPING FOR TAMMUZ; the five and twenty men with their BACKS toward the temple of
--          Yahuah and their faces toward the east; and they WORSHIPPED THE SUN toward the east)
--        NT:     ★ Romans 1:25 (worshipped and served the creature more than the Creator — the sun-cult, the
--                creature worshipped) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★★ Deuteronomy 4:19 (lest thou... seest the sun, and the moon... shouldest be driven to
--                worship them... which Yahuah hath divided unto all nations), ★ Deuteronomy 17:3 (served...
--                either the sun, or moon, or any of the host of heaven, which I have not commanded), ★★ 2
--                Kings 23:11 (he took away the horses that the kings of Yahudah had given to the sun), ★ 2
--                Kings 23:5 (them also that burned incense... to the sun, and to the moon) — THREAD 3
--   v.17-18 (the violence; they put the branch to their nose; therefore will I deal in fury; mine eye shall
--          not spare, neither will I have pity)
--        NT:     none warranted (the verdict of fury on the abominations; the not-hearing answers their
--                "seeth us not"; woven in THREAD 2/3 prose)
--        Extras: none warranted
--        Tanakh: none separate (the judgment-sentence; the Glory''s departure consummated in Ezek 10-11 —
--                noted in prose, not forced as a row)
--
-- Threads (slug — target libraries):
--   1. ezekiel-8-the-image-of-jealousy-that-provoketh-to-jealousy — Tanakh (Exodus 20, Deuteronomy 32) + NT (1 Corinthians 10) [free]
--      (★ the idol set up in Yahuah''s own house provoking the jealous El; drives the Glory far off from the sanctuary)
--   2. ezekiel-8-they-say-yahuah-seeth-us-not — Tanakh (Psalm 94, Psalm 10) + NT (Romans 1, Hebrews 4) [free]
--      (★★ the hidden idolatry in the dark; the lie that Yahuah does not see; answered by him who planted the ear and formed the eye)
--   3. ezekiel-8-their-backs-to-the-temple-worshipping-the-sun — Tanakh (Deuteronomy 4, Deuteronomy 17, 2 Kings 23) + NT (Romans 1) [free]
--      (★ the pagan cults in the temple courts — Tammuz mourning, sun-worship — backs to Yahuah, the creature worshipped, the Torah ban)
--
-- Framing notes:
--   ★ THE IMAGE OF JEALOUSY (THREAD 1): the prophet is set down *to the door of the inner gate that looketh
--      toward the north; where was the seat of the image of jealousy, which provoketh to jealousy* (8:3),
--      and *the glory of the Elohim (God) of Yashar''el (Israel) was there* (8:4) — the visible Glory (the
--      FORMED One of ch1) confronting the idol in his own gate. Yahuah names the breach: *the great
--      abominations that the house of Yashar''el (Israel) committeth here, that I should go far off from my
--      sanctuary* (8:6) — the idol drives the Glory away (consummated in ch10-11). This is the jealous El of
--      Sinai: *I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God)* (Exod 20:5), against *any
--      graven image* (Exod 20:4); the song of Moses already named the wound — *They provoked him to jealousy
--      with strange gods, with abominations provoked they him to anger* (Deut 32:16), *they have moved me to
--      jealousy with that which is not Elohim (God)* (Deut 32:21). Paul presses the same question on the
--      Lord''s table: *Do we provoke Yahuah (Lord) to jealousy? are we stronger than he?* (1 Cor 10:22),
--      *ye cannot be partakers of Yahuah''s (Lord''s) table, and of the table of devils* (1 Cor 10:21). The
--      image of jealousy IN the sanctuary is the same affront the whole Torah forbids — covenant-breach,
--      never the Torah''s failure.
--   ★★ YAHUAH SEETH US NOT (THREAD 2): through a hole in the wall the prophet digs to a door, and inside,
--      *every form of creeping things, and abominable beasts, and all the idols of the house of Yashar''el
--      (Israel), pourtrayed upon the wall* (8:10), with *seventy men of the ancients of the house of
--      Yashar''el (Israel)... with every man his censer in his hand* (8:11) — the elders themselves leading
--      the secret idolatry, *for they say, Yahuah (LORD) seeth us not; Yahuah (LORD) hath forsaken the
--      earth* (8:12). That is the lie the Psalms answer head-on: *Yet they say, Yahuah (LORD) shall not see,
--      neither shall the Elohim (God) of Jacob regard it* (Ps 94:7), met by *He that planted the ear, shall
--      he not hear? he that formed the eye, shall he not see?* (Ps 94:9); and the wicked''s heart-word, *Elohim
--      (God) hath forgotten: he hideth his face; he will never see it* (Ps 10:11). The creeping-things-on-the-
--      wall idolatry is exactly Paul''s indictment: men *changed the glory of the uncorruptible Elohim (God)
--      into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things*
--      (Rom 1:23), and *worshipped and served the creature more than the Creator* (Rom 1:25). And the
--      seeth-us-not lie is undone forever: *all things are naked and opened unto the eyes of him with whom we
--      have to do* (Heb 4:13). The dark chamber is fully lit to the eyes of Yahuah.
--   ★ BACKS TO THE TEMPLE, WORSHIPPING THE SUN (THREAD 3): the greater abominations are the imported pagan
--      cults in the temple courts — *there sat women weeping for Tammuz* (8:14), the fertility-god mourning
--      at the very gate; and *between the porch and the altar, were about five and twenty men, with their
--      backs toward the temple of Yahuah (LORD), and their faces toward the east; and they worshipped the
--      sun toward the east* (8:16) — backs turned on Yahuah to bow to the sun. The Torah expressly forbade
--      it: *lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the
--      stars... shouldest be driven to worship them... which Yahuah Elohayka (the LORD thy God) hath divided
--      unto all nations* (Deut 4:19); the man who *hath gone and served other gods, and worshipped them,
--      either the sun, or moon, or any of the host of heaven, which I have not commanded* is put away (Deut
--      17:3). Josiah had purged exactly this: he *took away the horses that the kings of Yahudah (Judah) had
--      given to the sun, at the entering in of the house of Yahuah (LORD)... and burned the chariots of the
--      sun with fire* (2 Kings 23:11), and put down those *that burned incense... to the sun, and to the
--      moon* (2 Kings 23:5) — yet here it returns. Paul names the root: *worshipped and served the creature
--      more than the Creator, who is blessed for ever* (Rom 1:25). The sun is a creature; Yahuah who made it
--      is the One to whom the back must never be turned.
--   VERSES WITH NO SEPARATE ADD: v.1-2 (the date-stamp and the amber/fire likeness = the throne-Glory of
--      ch1, the FORMED One; woven into THREAD 1 prose), v.17-18 (the violence, the branch to the nose, the
--      verdict of fury — *mine eye shall not spare* answering their "seeth us not"; the Glory''s full
--      departure held to Ezek 10-11; woven into THREAD 2/3 prose). All verses recorded in the checklist above.

CREATE TEMP VIEW _s308_ezek08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): the image of jealousy that provoketh to jealousy
    ('canon','ezekiel',8,3,'canon','exodus',20,5,'free',
      E'*Thou shalt not bow down thyself to them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God), visiting the iniquity of the fathers upon the children unto the third and fourth generation of them that hate me* (Exodus 20:5). The *seat of the image of jealousy, which provoketh to jealousy* (Ezekiel 8:3) set up in Yahuah''s own gate is the direct affront to the jealous El of Sinai: the idol provokes the very jealousy the second word names. Idolatry inside the covenant house is covenant-breach against a jealous Elohim, not a failure of the Torah.'),
    ('canon','ezekiel',8,3,'canon','exodus',20,4,'free',
      E'*Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth* (Exodus 20:4). The *image of jealousy* in the gate (Ezekiel 8:3) is precisely the graven image the second word forbids — and set, of all places, in the sanctuary of Yahuah. The carved likeness the Torah bans is enthroned where the Glory dwells.'),
    ('canon','ezekiel',8,3,'canon','deuteronomy',32,16,'free',
      E'*They provoked him to jealousy with strange gods, with abominations provoked they him to anger* (Deuteronomy 32:16). The song of Moses had already named the wound the *image of jealousy, which provoketh to jealousy* (Ezekiel 8:3) re-opens: strange gods and abominations provoking Yahuah to jealousy and to anger. Ezekiel sees the song''s indictment enacted in the temple itself.'),
    ('canon','ezekiel',8,3,'canon','deuteronomy',32,21,'free',
      E'*They have moved me to jealousy with that which is not Elohim (God); they have provoked me to anger with their vanities: and I will move them to jealousy with those which are not a people; I will provoke them to anger with a foolish nation* (Deuteronomy 32:21). The provoking *to jealousy* in the gate (Ezekiel 8:3) is the *not-Elohim* and *vanities* of the song of Moses — and the answering jealousy of Yahuah, the scattering among a foolish nation, is the very exile Ezekiel writes from. The image that provokes the jealous El draws the jealous judgment.'),
    ('canon','ezekiel',8,6,'canon','1-corinthians',10,22,'free',
      E'*Do we provoke Yahuah (Lord) to jealousy? are we stronger than he?* (1 Corinthians 10:22). Paul presses on the Lord''s table the very question Ezekiel''s vision forces: *the great abominations that the house of Yashar''el (Israel) committeth here, that I should go far off from my sanctuary* (Ezekiel 8:6) — to set an idol before Yahuah is to provoke him to jealousy, and we are not stronger than he. The Glory goes far off; the jealous El is not mocked.'),
    ('canon','ezekiel',8,6,'canon','1-corinthians',10,21,'free',
      E'*Ye cannot drink the cup of Yahuah (Lord), and the cup of devils: ye cannot be partakers of Yahuah''s (Lord''s) table, and of the table of devils* (1 Corinthians 10:21). The *great abominations* the house commits *here* — in the sanctuary — that drive Yahuah *far off from my sanctuary* (Ezekiel 8:6) are the impossible double-allegiance Paul forbids: the table of Yahuah and the table of devils cannot stand together. The idol in the holy place makes the sanctuary forsaken.'),

    -- THREAD 2 (★★): they say, Yahuah seeth us not
    ('canon','ezekiel',8,12,'canon','psalms',94,7,'free',
      E'*Yet they say, Yahuah (LORD) shall not see, neither shall the Elohim (God) of Jacob regard it* (Psalm 94:7). The Psalm speaks the very lie of the ancients in the dark chambers — *for they say, Yahuah (LORD) seeth us not; Yahuah (LORD) hath forsaken the earth* (Ezekiel 8:12). The secret idolaters tell themselves the Elohim of Jacob does not see; the Psalm exposes it as the boast of brutish men.'),
    ('canon','ezekiel',8,12,'canon','psalms',94,9,'free',
      E'*He that planted the ear, shall he not hear? he that formed the eye, shall he not see?* (Psalm 94:9). Against the seventy elders'' lie *Yahuah (LORD) seeth us not* (Ezekiel 8:12), the Psalm gives the unanswerable rebuke: the One who formed the eye is not blind, the One who planted the ear is not deaf. The hidden chambers of imagery are wide open to the Maker of sight itself.'),
    ('canon','ezekiel',8,12,'canon','psalms',10,11,'free',
      E'*He hath said in his heart, Elohim (God) hath forgotten: he hideth his face; he will never see it* (Psalm 10:11). The wicked''s heart-word is the elders'' word in the dark — *Yahuah (LORD) seeth us not; Yahuah (LORD) hath forsaken the earth* (Ezekiel 8:12). The lie that Yahuah has forgotten and hidden his face is the same self-deception that emboldens the secret abomination.'),
    ('canon','ezekiel',8,10,'canon','romans',1,23,'free',
      E'*And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things* (Romans 1:23). The walls of the dark chamber — *every form of creeping things, and abominable beasts, and all the idols of the house of Yashar''el (Israel), pourtrayed upon the wall* (Ezekiel 8:10) — are exactly the exchange Paul names: the glory of the incorruptible Elohim traded for images of beasts and creeping things. Ezekiel sees the apostasy Romans diagnoses, painted on the temple wall.'),
    ('canon','ezekiel',8,11,'canon','romans',1,25,'free',
      E'*Who changed the truth of Elohim (God) into a lie, and worshipped and served the creature more than the Creator, who is blessed for ever. Amen* (Romans 1:25). The seventy ancients with their censers — *with every man his censer in his hand; and a thick cloud of incense went up* (Ezekiel 8:11) — burn incense to the creature, serving the made thing over the Maker. The thick cloud of false worship is the creature exalted above the Creator.'),
    ('canon','ezekiel',8,12,'canon','hebrews',4,13,'free',
      E'*Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13). The lie *Yahuah (LORD) seeth us not* (Ezekiel 8:12) is undone forever: nothing the ancients do *in the dark, every man in the chambers of his imagery* is hidden — all things are naked and opened to the eyes of Yahuah. The darkest chamber is fully lit before him.'),

    -- THREAD 3 (★): their backs to the temple, worshipping the sun
    ('canon','ezekiel',8,16,'canon','deuteronomy',4,19,'free',
      E'*And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven* (Deuteronomy 4:19). The five and twenty men *with their backs toward the temple of Yahuah (LORD)... and they worshipped the sun toward the east* (Ezekiel 8:16) do the very thing the Torah warned against — bowing to the sun, a creature Yahuah divided to the nations, never to be the worship of his own house.'),
    ('canon','ezekiel',8,16,'canon','deuteronomy',17,3,'free',
      E'*And hath gone and served other gods, and worshipped them, either the sun, or moon, or any of the host of heaven, which I have not commanded* (Deuteronomy 17:3). The sun-worship in the inner court — *they worshipped the sun toward the east* (Ezekiel 8:16) — is the capital abomination of the Torah: serving the host of heaven *which I have not commanded*. What Deuteronomy condemns at the gate is found between the porch and the altar.'),
    ('canon','ezekiel',8,16,'canon','2-kings',23,11,'free',
      E'*And he took away the horses that the kings of Yahudah (Judah) had given to the sun, at the entering in of the house of Yahuah (LORD), by the chamber of Nathan-melech the chamberlain... and burned the chariots of the sun with fire* (2 Kings 23:11). Josiah had purged the very cult Ezekiel now sees returned — sun-worship *at the entering in of the house of Yahuah*, answering *they worshipped the sun toward the east* (Ezekiel 8:16). The abomination Josiah burned with fire creeps back into the temple courts.'),
    ('canon','ezekiel',8,16,'canon','2-kings',23,5,'free',
      E'*And he put down the idolatrous priests, whom the kings of Yahudah (Judah) had ordained to burn incense in the high places... them also that burned incense unto Baal, to the sun, and to the moon, and to the planets, and to all the host of heaven* (2 Kings 23:5). The reforming king put down those who *burned incense... to the sun, and to the moon*; yet here are men in the inner court who *worshipped the sun toward the east* (Ezekiel 8:16). The host-of-heaven worship Josiah abolished is the abomination that drives the Glory out.'),
    ('canon','ezekiel',8,16,'canon','romans',1,25,'free',
      E'*Who changed the truth of Elohim (God) into a lie, and worshipped and served the creature more than the Creator, who is blessed for ever. Amen* (Romans 1:25). To turn *their backs toward the temple of Yahuah (LORD)* and bow to the rising sun (Ezekiel 8:16) is precisely to worship and serve the creature above the Creator. The sun is a made thing; Yahuah who made it is the One to whom the back must never be turned.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-8-the-image-of-jealousy-that-provoketh-to-jealousy',
       E'The image of jealousy in the gate — that I should go far off from my sanctuary',
       E'Carried in vision to Jerusalem, the prophet is set down *to the door of the inner gate that looketh toward the north; where was the seat of the image of jealousy, which provoketh to jealousy* (8:3) — and *the glory of the Elohim (God) of Yashar''el (Israel) was there* (8:4), the visible Glory of his throne-vision facing the idol in his own house. Yahuah names the breach: *Son of Adam, seest thou what they do? even the great abominations that the house of Yashar''el (Israel) committeth here, that I should go far off from my sanctuary?* (8:6). The idol set up in the holy place drives the Glory away — the departure this chapter begins and chapters 10 and 11 consummate. This is an affront to the jealous El of Sinai himself: *Thou shalt not make unto thee any graven image* (Exodus 20:4), *for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God)* (Exodus 20:5). The song of Moses had already foreseen the wound — *They provoked him to jealousy with strange gods, with abominations provoked they him to anger* (Deuteronomy 32:16); *they have moved me to jealousy with that which is not Elohim (God)... and I will move them to jealousy with those which are not a people* (Deuteronomy 32:21) — the provoking jealousy that draws the answering jealousy of exile. Paul presses the same on the Lord''s table: *Ye cannot be partakers of Yahuah''s (Lord''s) table, and of the table of devils* (1 Corinthians 10:21); *Do we provoke Yahuah (Lord) to jealousy? are we stronger than he?* (1 Corinthians 10:22). The image in the sanctuary is not the Torah''s failure but covenant-breach against a jealous Elohim — and the jealous El is not mocked: the Glory goes far off.',
       sv.verse_id, ev.verse_id, 'free', 32175
  FROM _s308_ezek08_lookup sv, _s308_ezek08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=8 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-8-they-say-yahuah-seeth-us-not',
       E'The ancients in the dark — for they say, Yahuah seeth us not',
       E'The prophet is shown a hole in the wall, digs through it to a door, and inside is the hidden idolatry of the leaders: *every form of creeping things, and abominable beasts, and all the idols of the house of Yashar''el (Israel), pourtrayed upon the wall round about* (8:10), with *seventy men of the ancients of the house of Yashar''el (Israel)... with every man his censer in his hand; and a thick cloud of incense went up* (8:11). The elders themselves lead the secret worship, and Yahuah gives their reason: *hast thou seen what the ancients of the house of Yashar''el (Israel) do in the dark, every man in the chambers of his imagery? for they say, Yahuah (LORD) seeth us not; Yahuah (LORD) hath forsaken the earth* (8:12). That lie is the one the Psalms answer head-on: *Yet they say, Yahuah (LORD) shall not see, neither shall the Elohim (God) of Jacob regard it* (Psalm 94:7), met by the unanswerable rebuke *He that planted the ear, shall he not hear? he that formed the eye, shall he not see?* (Psalm 94:9); and the wicked''s heart-word, *Elohim (God) hath forgotten: he hideth his face; he will never see it* (Psalm 10:11). The creeping-things-on-the-wall idolatry is exactly Paul''s indictment of the apostate mind: men *changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things* (Romans 1:23), and *worshipped and served the creature more than the Creator, who is blessed for ever* (Romans 1:25). And the seeth-us-not lie is overturned forever: *all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13). The darkest chamber of imagery is fully lit before the eyes of Yahuah; and to that pretended blindness he answers in fury — *mine eye shall not spare, neither will I have pity... yet will I not hear them* (8:18).',
       sv.verse_id, ev.verse_id, 'free', 32178
  FROM _s308_ezek08_lookup sv, _s308_ezek08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=8 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-8-their-backs-to-the-temple-worshipping-the-sun',
       E'Women weeping for Tammuz, their backs to the temple, worshipping the sun toward the east',
       E'The greater abominations are the imported pagan cults brought into the temple courts themselves. First, *behold, there sat women weeping for Tammuz* (8:14) — the fertility-god mourning rite at the very gate of the house of Yahuah. Then, the worst: *he brought me into the inner court of the LORD''S house, and, behold, at the door of the temple of Yahuah (LORD), between the porch and the altar, were about five and twenty men, with their backs toward the temple of Yahuah (LORD), and their faces toward the east; and they worshipped the sun toward the east* (8:16) — turning their backs on Yahuah to bow to the rising sun in his own sanctuary. The Torah had expressly forbidden it: *lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations* (Deuteronomy 4:19); the one who *hath gone and served other gods, and worshipped them, either the sun, or moon, or any of the host of heaven, which I have not commanded* is the capital apostate (Deuteronomy 17:3). Faithful Josiah had purged exactly this — he *took away the horses that the kings of Yahudah (Judah) had given to the sun, at the entering in of the house of Yahuah (LORD)... and burned the chariots of the sun with fire* (2 Kings 23:11), and put down those who *burned incense... to the sun, and to the moon* (2 Kings 23:5) — yet here the cult returns to the inner court. Paul names the root of all of it: men *worshipped and served the creature more than the Creator, who is blessed for ever* (Romans 1:25). The sun is a made thing, divided to the nations; Yahuah who formed it is the One to whom the back must never be turned. For this the verdict falls: *Therefore will I also deal in fury: mine eye shall not spare, neither will I have pity* (8:18) — and the Glory departs.',
       sv.verse_id, ev.verse_id, 'free', 32181
  FROM _s308_ezek08_lookup sv, _s308_ezek08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=8 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God)* (Exodus 20:5) — the image of jealousy (Ezekiel 8:3) directly provokes the jealous El of the second word.'
  FROM cross_reference_threads t
  JOIN _s308_ezek08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s308_ezek08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-8-the-image-of-jealousy-that-provoketh-to-jealousy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Thou shalt not make unto thee any graven image* (Exodus 20:4) — the image of jealousy (Ezekiel 8:3) is the graven image the Torah bans, set in the sanctuary itself.'
  FROM cross_reference_threads t
  JOIN _s308_ezek08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s308_ezek08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-8-the-image-of-jealousy-that-provoketh-to-jealousy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *They provoked him to jealousy with strange gods, with abominations* (Deuteronomy 32:16) — the song of Moses foresaw the very provoking the image of jealousy re-opens (Ezekiel 8:3).'
  FROM cross_reference_threads t
  JOIN _s308_ezek08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s308_ezek08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-8-the-image-of-jealousy-that-provoketh-to-jealousy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *They have moved me to jealousy with that which is not Elohim (God)* (Deuteronomy 32:21) — the not-Elohim of the song provokes the jealousy that draws the exile Ezekiel writes from.'
  FROM cross_reference_threads t
  JOIN _s308_ezek08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s308_ezek08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-8-the-image-of-jealousy-that-provoketh-to-jealousy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Do we provoke Yahuah (Lord) to jealousy? are we stronger than he?* (1 Corinthians 10:22) — Paul presses the question Ezekiel 8:6 forces; the abomination drives the Glory far off.'
  FROM cross_reference_threads t
  JOIN _s308_ezek08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s308_ezek08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-8-the-image-of-jealousy-that-provoketh-to-jealousy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*ye cannot be partakers of Yahuah''s (Lord''s) table, and of the table of devils* (1 Corinthians 10:21) — the idol in the holy place is the impossible double-allegiance that makes the sanctuary forsaken (Ezekiel 8:6).'
  FROM cross_reference_threads t
  JOIN _s308_ezek08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s308_ezek08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-8-the-image-of-jealousy-that-provoketh-to-jealousy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Yet they say, Yahuah (LORD) shall not see, neither shall the Elohim (God) of Jacob regard it* (Psalm 94:7) — the very lie of the ancients in the dark (Ezekiel 8:12).'
  FROM cross_reference_threads t
  JOIN _s308_ezek08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s308_ezek08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=94 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-8-they-say-yahuah-seeth-us-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *He that planted the ear, shall he not hear? he that formed the eye, shall he not see?* (Psalm 94:9) — the unanswerable rebuke to *Yahuah seeth us not* (Ezekiel 8:12); the Maker of sight is not blind.'
  FROM cross_reference_threads t
  JOIN _s308_ezek08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s308_ezek08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=94 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-8-they-say-yahuah-seeth-us-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Elohim (God) hath forgotten: he hideth his face; he will never see it* (Psalm 10:11) — the wicked''s heart-word, the same self-deception as the elders'' *Yahuah hath forsaken the earth* (Ezekiel 8:12).'
  FROM cross_reference_threads t
  JOIN _s308_ezek08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s308_ezek08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-8-they-say-yahuah-seeth-us-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *changed the glory of the uncorruptible Elohim (God) into an image made like to... creeping things* (Romans 1:23) — the creeping-things idols on the chamber wall (Ezekiel 8:10) are the exchange Paul names.'
  FROM cross_reference_threads t
  JOIN _s308_ezek08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=10
  JOIN _s308_ezek08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-8-they-say-yahuah-seeth-us-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *worshipped and served the creature more than the Creator* (Romans 1:25) — the seventy ancients with their censers (Ezekiel 8:11) burn incense to the made thing over its Maker.'
  FROM cross_reference_threads t
  JOIN _s308_ezek08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s308_ezek08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-8-they-say-yahuah-seeth-us-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13) — the seeth-us-not lie (Ezekiel 8:12) undone; the darkest chamber is fully lit before Yahuah.'
  FROM cross_reference_threads t
  JOIN _s308_ezek08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s308_ezek08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-8-they-say-yahuah-seeth-us-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *when thou seest the sun... shouldest be driven to worship them... which Yahuah hath divided unto all nations* (Deuteronomy 4:19) — the Torah''s warning against the very sun-worship of Ezekiel 8:16.'
  FROM cross_reference_threads t
  JOIN _s308_ezek08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=16
  JOIN _s308_ezek08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-8-their-backs-to-the-temple-worshipping-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *served other gods, and worshipped them, either the sun, or moon, or any of the host of heaven, which I have not commanded* (Deuteronomy 17:3) — the capital abomination found between the porch and the altar (Ezekiel 8:16).'
  FROM cross_reference_threads t
  JOIN _s308_ezek08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=16
  JOIN _s308_ezek08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=17 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-8-their-backs-to-the-temple-worshipping-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *he took away the horses that the kings of Yahudah had given to the sun... and burned the chariots of the sun with fire* (2 Kings 23:11) — Josiah purged the very cult Ezekiel 8:16 sees returned to the temple.'
  FROM cross_reference_threads t
  JOIN _s308_ezek08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=16
  JOIN _s308_ezek08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=23 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-8-their-backs-to-the-temple-worshipping-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *them also that burned incense... to the sun, and to the moon, and to the planets, and to all the host of heaven* (2 Kings 23:5) — the host-of-heaven worship Josiah abolished, the abomination that drives the Glory out (Ezekiel 8:16).'
  FROM cross_reference_threads t
  JOIN _s308_ezek08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=16
  JOIN _s308_ezek08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=23 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-8-their-backs-to-the-temple-worshipping-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *worshipped and served the creature more than the Creator* (Romans 1:25) — to turn the back on the temple and bow to the sun (Ezekiel 8:16) is the creature exalted above its Maker.'
  FROM cross_reference_threads t
  JOIN _s308_ezek08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=8 AND sv.verse_number=16
  JOIN _s308_ezek08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-8-their-backs-to-the-temple-worshipping-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezekiel_9.sql (Ezekiel 9) -----
-- Chapter: Ezekiel 9 — ★★ THE SEALING-MARK keystone. The six men with slaughter weapons; the man clothed
-- in linen with the writer's inkhorn who SETS A MARK upon the foreheads of the men that sigh and that cry
-- for all the abominations done in the midst of the city; the destroyers told to come not near any man upon
-- whom is the mark; judgment BEGINS at the sanctuary; the prophet's intercession (wilt thou destroy all the
-- residue of Yashar'el?) and Yahuah's verdict (mine eye shall not spare). The marked-and-spared remnant of
-- Ezekiel 9 is the sealed 144,000 of Revelation 7 — the Father's name in their foreheads.
-- Tag: ezek09   Temp view: _s308_ezek09_lookup
-- Sort band: base 32200, step 3 -> threads at 32200, 32203, 32206 (3 threads)
-- Source of EVERY row: 'canon','ezekiel',9,v
--
-- Ezekiel 9 coverage:
--   v.1-2 (six men with slaughter weapons from the higher gate toward the north; one man clothed with linen
--          with a writer's inkhorn by his side; they stood beside the brasen altar)
--        NT:     none warranted (the agents of judgment set in place; the linen-clothed scribe carried
--                forward through his MARK-act in v.4 — held to THREAD 1)
--        Extras: none warranted
--        Tanakh: none separate (the scene-setting of the executioners and the recording scribe)
--   ★★★ v.3-6 (set a mark upon the foreheads of the men that SIGH and that CRY for all the abominations...
--          but come not near any man upon whom is the mark; and begin at my sanctuary)
--        NT:     ★★★ Revelation 7:3 (till we have sealed the servants of our Elohim in their foreheads),
--                ★★★ Revelation 9:4 (only those men which have not the seal of Elohim in their foreheads),
--                ★★ Revelation 14:1 (the 144,000 having his Father's name written in their foreheads) — THREAD 1
--        Extras: none warranted (clean canon-NT-Torah seal weave)
--        Tanakh: ★★ Exodus 12:13 (the blood a token; when I see the blood, I will pass over you), ★★ Malachi
--                3:16-18 (a book of remembrance for them that feared Yahuah; I will spare them as a man
--                spareth his own son) — THREAD 1
--   ★★ v.6-7 (begin at my sanctuary; then they began at the ancient men which were before the house; defile
--          the house, and fill the courts with the slain)
--        NT:     ★★ 1 Peter 4:17 (the time is come that judgment must begin at the house of Elohim) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Jeremiah 25:29 (lo, I begin to bring evil on the city which is called by my name),
--                ★ Amos 3:2 (you only have I known... therefore I will punish you for all your iniquities) — THREAD 2
--   ★ v.8-10 (Ah Adonai Yahuah! wilt thou destroy all the residue of Yashar'el?... mine eye shall not spare,
--          neither will I have pity, but I will recompense their way upon their head)
--        NT:     none warranted (the prophet's intercession + Yahuah's verdict; canon-internal weave)
--        Extras: none warranted
--        Tanakh: ★★ Genesis 18:23-25 (Abraham: wilt thou also destroy the righteous with the wicked?...
--                Shall not the Judge of all the earth do right?), ★ Ezekiel 14:14 (Noah, Daniel, and Job...
--                they should deliver but their own souls by their righteousness) — THREAD 3
--   v.11 (the man clothed with linen reported the matter: I have done as thou hast commanded me)
--        NT:     none warranted (the recording scribe's report; the marking is finished — woven into THREAD 1 prose)
--        Extras: none warranted
--        Tanakh: none separate (the closing report; the sealing accomplished)
--
-- Threads (slug — target libraries):
--   1. ezekiel-9-set-a-mark-upon-the-foreheads-of-them-that-sigh-and-cry — NT (Revelation 7, Revelation 9,
--      Revelation 14) + Tanakh (Exodus 12, Malachi 3) [free]
--      (★★★ THE sealing-mark; the linen scribe marks the sighing-and-crying remnant; the destroyer comes not
--       near the marked; forward to the sealed 144,000 with the Father's name in their foreheads)
--   2. ezekiel-9-begin-at-my-sanctuary-judgment-at-the-house-of-elohim — NT (1 Peter 4) + Tanakh (Jeremiah 25,
--      Amos 3) [free]
--      (★★ judgment begins at the sanctuary, at the house of Elohim — the greater the light, the heavier the
--       reckoning; the ancient men before the house first)
--   3. ezekiel-9-wilt-thou-destroy-all-the-residue-of-yasharel — Tanakh (Genesis 18, Ezekiel 14) [free]
--      (★ the prophet's intercession and Yahuah's verdict; Abraham's plea for Sodom; Noah, Daniel, Job deliver
--       but their own souls)
--
-- Framing notes:
--   ★★★ THE MARK ON THE FOREHEADS (THREAD 1): *Go through the midst of the city... and set a mark upon the
--      foreheads of the men that sigh and that cry for all the abominations that be done in the midst thereof*
--      (9:4), *but come not near any man upon whom is the mark* (9:6). The man clothed with linen with the
--      writer's inkhorn marks the grieving remnant, and the destroyers pass them by. John fills it: *Hurt not
--      the earth, neither the sea, nor the trees, till we have sealed the servants of our Elohim (God) in
--      their foreheads* (Revelation 7:3); the locust-judgment may touch *only those men which have not the
--      seal of Elohim (God) in their foreheads* (Revelation 9:4); and the sealed are *an hundred forty and
--      four thousand, having his Father's name written in their foreheads* (Revelation 14:1) — the
--      two-house tribes of v.5-8 numbered and kept. The token-of-blood at Passover is the same mercy:
--      *when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you*
--      (Exodus 12:13); and Malachi names the marked ones a written remembrance: *a book of remembrance was
--      written before him for them that feared Yahuah (LORD)... and I will spare them, as a man spareth his
--      own son that serveth him* (Malachi 3:16-17). The sighing-and-crying remnant marked and spared.
--   ★★ BEGIN AT MY SANCTUARY (THREAD 2): *and begin at my sanctuary. Then they began at the ancient men
--      which were before the house* (9:6). Judgment falls first on the house of Elohim — Peter says it plainly:
--      *the time is come that judgment must begin at the house of Elohim (God): and if it first begin at us,
--      what shall the end be of them that obey not the gospel of Elohim (God)?* (1 Peter 4:17). Jeremiah:
--      *lo, I begin to bring evil on the city which is called by my name, and should ye be utterly
--      unpunished?* (Jeremiah 25:29). Amos: *You only have I known of all the families of the earth: therefore
--      I will punish you for all your iniquities* (Amos 3:2). The nearer the Name, the heavier the reckoning.
--   ★ WILT THOU DESTROY ALL THE RESIDUE (THREAD 3): *Ah Yahuah (Lord) GOD! wilt thou destroy all the residue
--      of Yashar'el (Israel)?* (9:8) — the prophet falls on his face and pleads, as Abraham pled for Sodom:
--      *Wilt thou also destroy the righteous with the wicked?... Shall not the Judge of all the earth do
--      right?* (Genesis 18:23,25). Yahuah's verdict: *mine eye shall not spare, neither will I have pity, but
--      I will recompense their way upon their head* (9:10) — and Ezekiel's own later word seals it: in a land
--      ripe for judgment, *Noah, Daniel, and Job... they should deliver but their own souls by their
--      righteousness* (Ezekiel 14:14). Each is answerable for his own way; the marked remnant alone is spared.
--   VERSES WITH NO SEPARATE ADD: v.1-2 (the six men and the linen scribe set in place — the marking carried
--      into THREAD 1), v.11 (the scribe reports the marking done — woven into THREAD 1 prose). All recorded.

CREATE TEMP VIEW _s308_ezek09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): set a mark upon the foreheads of them that sigh and cry — the sealing-mark
    ('canon','ezekiel',9,4,'canon','revelation',7,3,'free',
      E'*Saying, Hurt not the earth, neither the sea, nor the trees, till we have sealed the servants of our Elohim (God) in their foreheads* (Revelation 7:3). John fills Ezekiel''s vision: as the man clothed in linen is sent to *set a mark upon the foreheads of the men that sigh and that cry for all the abominations* (Ezekiel 9:4), so the angel seals *the servants of our Elohim (God) in their foreheads* before the judgment may fall. The mark on the brow of the grieving remnant is the seal of the living Elohim.'),
    ('canon','ezekiel',9,6,'canon','revelation',9,4,'free',
      E'*And it was commanded them that they should not hurt the grass of the earth, neither any green thing, neither any tree; but only those men which have not the seal of Elohim (God) in their foreheads* (Revelation 9:4). The command to the destroyers — *come not near any man upon whom is the mark* (Ezekiel 9:6) — is the same boundary John sees: the plague touches *only those men which have not the seal of Elohim (God) in their foreheads*. The marked are passed by; the unmarked alone are smitten.'),
    ('canon','ezekiel',9,4,'canon','revelation',14,1,'free',
      E'*And I looked, and, lo, a Lamb stood on the mount Sion, and with him an hundred forty and four thousand, having his Father''s name written in their foreheads* (Revelation 14:1). The mark Ezekiel''s scribe sets *upon the foreheads* of the faithful (Ezekiel 9:4) is filled out in the sealed company who bear *his Father''s name written in their foreheads* — the two-house tribes of Yashar''el (Israel) numbered and kept. The mark is the Name; the sealed are the Father''s own.'),
    ('canon','ezekiel',9,6,'canon','exodus',12,13,'free',
      E'*And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt* (Exodus 12:13). The mark that makes the destroyer *come not near any man upon whom is the mark* (Ezekiel 9:6) is the Passover token answered forward: the blood on the door is the sign at which the destroyer passes over. The marked house in Egypt and the marked brow in Jerusalem are one mercy — the token that turns away the plague.'),
    ('canon','ezekiel',9,4,'canon','malachi',3,16,'free',
      E'*Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name* (Malachi 3:16). The men *that sigh and that cry for all the abominations* (Ezekiel 9:4) are the very ones Malachi names — *them that feared Yahuah (LORD)*, written in a *book of remembrance*. To grieve over the abominations is to fear his name; the mark on the brow and the entry in the book are the same record of the faithful remnant.'),
    ('canon','ezekiel',9,6,'canon','malachi',3,17,'free',
      E'*And they shall be mine, saith Yahuah Tseva''ot (LORD of hosts), in that day when I make up my jewels; and I will spare them, as a man spareth his own son that serveth him* (Malachi 3:17). The promise that the destroyer shall *come not near any man upon whom is the mark* (Ezekiel 9:6) is Malachi''s sparing of the remembered remnant — *I will spare them, as a man spareth his own son that serveth him*. The marked are not destroyed but claimed: in the day of judgment they are his jewels, his sons, spared.'),

    -- THREAD 2 (★★): begin at my sanctuary — judgment at the house of Elohim
    ('canon','ezekiel',9,6,'canon','1-peter',4,17,'free',
      E'*For the time is come that judgment must begin at the house of Elohim (God): and if it first begin at us, what shall the end be of them that obey not the gospel of Elohim (God)?* (1 Peter 4:17). Peter names the very order of Ezekiel''s judgment — *begin at my sanctuary* (Ezekiel 9:6), and *they began at the ancient men which were before the house*. Judgment falls first on the house of Elohim; if it begins there, *what shall the end be of them that obey not*? The nearer the Name, the heavier the reckoning.'),
    ('canon','ezekiel',9,6,'canon','jeremiah',25,29,'free',
      E'*For, lo, I begin to bring evil on the city which is called by my name, and should ye be utterly unpunished? Ye shall not be unpunished: for I will call for a sword upon all the inhabitants of the earth, saith Yahuah Tseva''ot (LORD of hosts)* (Jeremiah 25:29). Jeremiah speaks the same beginning-at-the-sanctuary principle: Yahuah begins the evil *on the city which is called by my name*. As the slaughter in Ezekiel starts *at my sanctuary* (Ezekiel 9:6), so judgment starts where the Name is set — and from there reaches the nations.'),
    ('canon','ezekiel',9,7,'canon','amos',3,2,'free',
      E'*You only have I known of all the families of the earth: therefore I will punish you for all your iniquities* (Amos 3:2). The command to *Defile the house, and fill the courts with the slain* (Ezekiel 9:7) rests on the logic Amos names: election is not exemption but accountability — *you only have I known... therefore I will punish you*. The house that bore the glory is judged first, for it knew the most and abandoned it.'),

    -- THREAD 3 (★): wilt thou destroy all the residue of Yashar'el — intercession and verdict
    ('canon','ezekiel',9,8,'canon','genesis',18,23,'free',
      E'*And Abraham drew near, and said, Wilt thou also destroy the righteous with the wicked?* (Genesis 18:23). Ezekiel falls on his face and pleads as Abraham pled for Sodom — *Ah Yahuah (Lord) GOD! wilt thou destroy all the residue of Yashar''el (Israel)?* (Ezekiel 9:8). The same intercessor''s cry: will the Judge sweep away the righteous with the wicked? The marked remnant is the answer to the plea — the faithful are not destroyed with the rebellious.'),
    ('canon','ezekiel',9,8,'canon','genesis',18,25,'free',
      E'*That be far from thee to do after this manner, to slay the righteous with the wicked: and that the righteous should be as the wicked, that be far from thee: Shall not the Judge of all the earth do right?* (Genesis 18:25). Behind Ezekiel''s plea *wilt thou destroy all the residue of Yashar''el (Israel)?* (Ezekiel 9:8) stands Abraham''s confidence in the justice of the Judge — *Shall not the Judge of all the earth do right?* He does: the man clothed in linen marks the sighing remnant first, that the righteous not perish as the wicked.'),
    ('canon','ezekiel',9,10,'canon','ezekiel',14,14,'free',
      E'*Though these three men, Noah, Daniel, and Job, were in it, they should deliver but their own souls by their righteousness, saith Adonai Yahuah (the Lord GOD)* (Ezekiel 14:14). Yahuah''s verdict — *mine eye shall not spare, neither will I have pity, but I will recompense their way upon their head* (Ezekiel 9:10) — is the same answered a few chapters on: in a land ripe for judgment even the most righteous *deliver but their own souls*. Each is recompensed his own way; no man''s righteousness shelters the guilty, but the marked remnant is spared.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-9-set-a-mark-upon-the-foreheads-of-them-that-sigh-and-cry',
       E'Set a mark upon the foreheads of them that sigh and cry — the sealing of the remnant',
       E'As the glory of Elohim rises from the cherub to the threshold of the house, Yahuah singles out a man for mercy before the slaughter. *And he called to the man clothed with linen, which had the writer''s inkhorn by his side* (9:3), *And Yahuah (LORD) said unto him, Go through the midst of the city, through the midst of Jerusalem, and set a mark upon the foreheads of the men that sigh and that cry for all the abominations that be done in the midst thereof* (9:4). To the destroyers with their slaughter weapons the word is: *smite: let not your eye spare, neither have ye pity... but come not near any man upon whom is the mark* (9:5-6). The grieving remnant — those who sigh and cry over the abominations — are marked on the brow and passed over. John fills the vision word for word: *Hurt not the earth, neither the sea, nor the trees, till we have sealed the servants of our Elohim (God) in their foreheads* (Revelation 7:3); the locust-judgment may touch *only those men which have not the seal of Elohim (God) in their foreheads* (Revelation 9:4); and the sealed company stands with *his Father''s name written in their foreheads* (Revelation 14:1) — the hundred forty and four thousand of all the tribes of the children of Yashar''el (Israel), the two-house people numbered and kept. The mercy is the Passover''s own: *when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you* (Exodus 12:13) — the token that turns the destroyer aside. And Malachi names the marked a written remembrance: *a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name* (Malachi 3:16), *and I will spare them, as a man spareth his own son that serveth him* (Malachi 3:17). To sigh and cry over the abominations is to fear his name; the mark on the brow, the blood on the door, and the entry in the book are one — the faithful remnant sealed and spared while judgment falls. *And, behold, the man clothed with linen, which had the inkhorn by his side, reported the matter, saying, I have done as thou hast commanded me* (9:11): the sealing is finished before the sword does its work.',
       sv.verse_id, ev.verse_id, 'free', 32200
  FROM _s308_ezek09_lookup sv, _s308_ezek09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=9 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-9-begin-at-my-sanctuary-judgment-at-the-house-of-elohim',
       E'Begin at my sanctuary — judgment begins at the house of Elohim',
       E'When the destroyers are loosed, the order is exact: *Slay utterly old and young, both maids, and little children, and women: but come not near any man upon whom is the mark; and begin at my sanctuary. Then they began at the ancient men which were before the house* (9:6), *And he said unto them, Defile the house, and fill the courts with the slain: go ye forth* (9:7). Judgment does not start with the heathen or the streets — it begins at the sanctuary, with the ancient men before the house. Peter names the principle plainly: *For the time is come that judgment must begin at the house of Elohim (God): and if it first begin at us, what shall the end be of them that obey not the gospel of Elohim (God)?* (1 Peter 4:17). Jeremiah hears the same: *lo, I begin to bring evil on the city which is called by my name, and should ye be utterly unpunished? Ye shall not be unpunished* (Jeremiah 25:29) — the reckoning starts where the Name is set. And Amos names the logic underneath: *You only have I known of all the families of the earth: therefore I will punish you for all your iniquities* (Amos 3:2). Election is not exemption but accountability; the house that bore the glory — the glory now risen from the cherub to the threshold (9:3) and departing — is judged first, for it knew the most and abandoned it. The nearer the Name, the heavier the reckoning.',
       sv.verse_id, ev.verse_id, 'free', 32203
  FROM _s308_ezek09_lookup sv, _s308_ezek09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=9 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-9-wilt-thou-destroy-all-the-residue-of-yasharel',
       E'Wilt thou destroy all the residue of Yashar''el — the prophet''s plea and Yahuah''s verdict',
       E'While the slaughter goes on, the prophet is left alone and falls on his face to intercede: *And it came to pass, while they were slaying them, and I was left, that I fell upon my face, and cried, and said, Ah Yahuah (Lord) GOD! wilt thou destroy all the residue of Yashar''el (Israel) in thy pouring out of thy fury upon Jerusalem?* (9:8). It is Abraham''s cry over Sodom: *And Abraham drew near, and said, Wilt thou also destroy the righteous with the wicked?* (Genesis 18:23), *Shall not the Judge of all the earth do right?* (Genesis 18:25). The answer is heavy: *The iniquity of the house of Yashar''el (Israel) and Yahudah (Judah) is exceeding great... for they say, Yahuah (LORD) hath forsaken the earth, and Yahuah (LORD) seeth not* (9:9), *And as for me also, mine eye shall not spare, neither will I have pity, but I will recompense their way upon their head* (9:10). Yet the plea is not refused — it is already answered in the mark of v.4: the Judge of all the earth does right, sparing the sighing remnant while recompensing the guilty their own way. Ezekiel''s own later word settles it: *Though these three men, Noah, Daniel, and Job, were in it, they should deliver but their own souls by their righteousness* (Ezekiel 14:14) — in a land ripe for judgment no man''s righteousness shelters the guilty; each bears his own way upon his own head, and the marked alone are spared.',
       sv.verse_id, ev.verse_id, 'free', 32206
  FROM _s308_ezek09_lookup sv, _s308_ezek09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *till we have sealed the servants of our Elohim (God) in their foreheads* (Revelation 7:3) — John fills Ezekiel 9:4; the mark on the brow of the grieving remnant is the seal of the living Elohim.'
  FROM cross_reference_threads t
  JOIN _s308_ezek09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=9 AND sv.verse_number=4
  JOIN _s308_ezek09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-9-set-a-mark-upon-the-foreheads-of-them-that-sigh-and-cry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *only those men which have not the seal of Elohim (God) in their foreheads* (Revelation 9:4) — the destroyers *come not near any man upon whom is the mark* (Ezekiel 9:6); the unmarked alone are smitten.'
  FROM cross_reference_threads t
  JOIN _s308_ezek09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s308_ezek09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=9 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-9-set-a-mark-upon-the-foreheads-of-them-that-sigh-and-cry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *having his Father''s name written in their foreheads* (Revelation 14:1) — the mark of Ezekiel 9:4 is the Name; the sealed 144,000 of the tribes of Yashar''el (Israel) are the Father''s own.'
  FROM cross_reference_threads t
  JOIN _s308_ezek09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=9 AND sv.verse_number=4
  JOIN _s308_ezek09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-9-set-a-mark-upon-the-foreheads-of-them-that-sigh-and-cry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you* (Exodus 12:13) — the Passover token; the marked door and the marked brow (Ezekiel 9:6) are one mercy that turns the destroyer aside.'
  FROM cross_reference_threads t
  JOIN _s308_ezek09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s308_ezek09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-9-set-a-mark-upon-the-foreheads-of-them-that-sigh-and-cry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *a book of remembrance was written before him for them that feared Yahuah (LORD)* (Malachi 3:16) — the men that sigh and cry (Ezekiel 9:4) are they that fear his name, written in the book of remembrance.'
  FROM cross_reference_threads t
  JOIN _s308_ezek09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=9 AND sv.verse_number=4
  JOIN _s308_ezek09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-9-set-a-mark-upon-the-foreheads-of-them-that-sigh-and-cry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *I will spare them, as a man spareth his own son that serveth him* (Malachi 3:17) — the marked are not destroyed but claimed; the destroyer *come not near* them (Ezekiel 9:6), for they are his jewels.'
  FROM cross_reference_threads t
  JOIN _s308_ezek09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s308_ezek09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-9-set-a-mark-upon-the-foreheads-of-them-that-sigh-and-cry'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *judgment must begin at the house of Elohim (God): and if it first begin at us, what shall the end be of them that obey not* (1 Peter 4:17) — Peter names the order of Ezekiel 9:6: begin at the sanctuary.'
  FROM cross_reference_threads t
  JOIN _s308_ezek09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s308_ezek09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=4 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-9-begin-at-my-sanctuary-judgment-at-the-house-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *lo, I begin to bring evil on the city which is called by my name* (Jeremiah 25:29) — judgment starts where the Name is set, as the slaughter starts *at my sanctuary* (Ezekiel 9:6).'
  FROM cross_reference_threads t
  JOIN _s308_ezek09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s308_ezek09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-9-begin-at-my-sanctuary-judgment-at-the-house-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *You only have I known of all the families of the earth: therefore I will punish you for all your iniquities* (Amos 3:2) — election is accountability, not exemption; the house judged first (Ezekiel 9:7) knew the most.'
  FROM cross_reference_threads t
  JOIN _s308_ezek09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s308_ezek09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=3 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-9-begin-at-my-sanctuary-judgment-at-the-house-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Wilt thou also destroy the righteous with the wicked?* (Genesis 18:23) — Ezekiel''s plea *wilt thou destroy all the residue of Yashar''el (Israel)?* (Ezekiel 9:8) is Abraham''s cry over Sodom.'
  FROM cross_reference_threads t
  JOIN _s308_ezek09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=9 AND sv.verse_number=8
  JOIN _s308_ezek09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-9-wilt-thou-destroy-all-the-residue-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Shall not the Judge of all the earth do right?* (Genesis 18:25) — the confidence behind Ezekiel''s plea (9:8); the Judge spares the marked remnant while recompensing the guilty.'
  FROM cross_reference_threads t
  JOIN _s308_ezek09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=9 AND sv.verse_number=8
  JOIN _s308_ezek09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-9-wilt-thou-destroy-all-the-residue-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Noah, Daniel, and Job... should deliver but their own souls by their righteousness* (Ezekiel 14:14) — Yahuah''s verdict *I will recompense their way upon their head* (Ezekiel 9:10); each bears his own way, the marked alone spared.'
  FROM cross_reference_threads t
  JOIN _s308_ezek09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s308_ezek09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=14 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-9-wilt-thou-destroy-all-the-residue-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezekiel_11.sql (Ezekiel 11) -----
-- Chapter: Ezekiel 11 — the wicked counsellors at the east gate (*this city is the caldron, and we
-- be the flesh*); the false-security counsel of the twenty-five princes judged; Pelatiah the son of
-- Benaiah dies as the prophet speaks; ★★★ THE FIRST STATEMENT OF THE NEW-HEART PROMISE to the
-- scattered exiles — *I will give them one heart, and I will put a new spirit within you... an heart
-- of flesh: That they may walk in my statutes, and keep mine ordinances, and do them* (the seed of
-- Ezekiel 36:26-27); Yahuah a *little sanctuary* to the scattered; and the Glory of Yahuah departing
-- eastward, up from the city to the mountain on the east side (continuing ch10's withdrawal).
-- Tag: ezek11   Temp view: _s308_ezek11_lookup
-- Sort band: base 32250, step 3 -> threads at 32250, 32253, 32256, 32259 (4 threads)
-- Source of EVERY row: 'canon','ezekiel',11,v
--
-- Ezekiel 11 coverage:
--   v.1 (the spirit lifted me to the east gate... five and twenty men; Jaazaniah and Pelatiah, princes)
--        NT:     none warranted (the scene-setting; the east-gate location belongs to the Glory-departs
--                thread, THREAD 4; woven in prose there)
--        Extras: none warranted
--        Tanakh: none separate (preface to the wicked-counsel oracle of v.2-12)
--   ★ v.2-12 (the men that devise mischief... *this city is the caldron, and we be the flesh*... ye have
--          feared the sword; and I will bring a sword upon you; ye have not walked in my statutes)
--        NT:     none warranted (the covenant-lawsuit against the false-secure princes; OT-internal)
--        Extras: none warranted
--        Tanakh: ★ Jeremiah 1:13-16 (the seething pot toward the north; out of the north an evil shall
--                break forth), ★ Micah 3:1-3 (the heads of Jacob who eat the flesh of my people... as
--                flesh within the caldron), ★ Amos 6:1 (woe to them that are at ease in Zion) — THREAD 2
--   v.13 (Pelatiah the son of Benaiah died... wilt thou make a full end of the remnant of Yashar''el?)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: held in prose (the death-as-sign + the prophet's intercession for the remnant; the
--                remnant-question answered by the regathering promise of THREAD 1)
--   ★ v.15-16 (thy brethren... all the house of Yashar''el wholly... yet will I be to them as a little
--          sanctuary in the countries where they shall come)
--        NT:     none warranted distinct (the Sanctuary-to-the-scattered held canon/Tanakh)
--        Extras: none warranted
--        Tanakh: ★ Isaiah 8:14 (he shall be for a sanctuary), ★ Psalm 90:1 (Yahuah, thou hast been our
--                dwelling place in all generations) — THREAD 3
--   ★★★ v.17-20 (I will gather you from the people... and I will give you the land of Yashar''el... and
--          I will give them one heart, and I will put a new spirit within you; and I will take the stony
--          heart out of their flesh, and will give them an heart of flesh: That they may walk in my
--          statutes, and keep mine ordinances, and do them: and they shall be my people)
--        NT:     ★★★ Jeremiah 31:33 [Tanakh, lateral] + ★★★ Hebrews 8:10 (I will put my laws into their
--                mind, and write them in their hearts), ★★ 2 Corinthians 3:3 (written... with the Spirit
--                of the living Elohim... in fleshy tables of the heart) — THREAD 1
--        Extras: none warranted
--        Tanakh: ★★★ Ezekiel 36:26-27 (a new heart... a new spirit... I will put my spirit within you,
--                and cause you to walk in my statutes — the FULLER promise), ★★ Ezekiel 37:23-24 (so
--                shall they be my people... they shall walk in my judgments), ★★★ Jeremiah 31:33 (I will
--                put my law in their inward parts, and write it in their hearts) — THREAD 1
--   v.21 (whose heart walketh after... their detestable things... I will recompense their way) — woven
--        into THREAD 1 prose (the obverse of the new heart); no separate add.
--   ★ v.22-23 (the cherubims lift up their wings... the glory of Yahuah went up from the midst of the
--          city, and stood upon the mountain which is on the east side of the city)
--        NT:     ★ Matthew 24:3 (as he sat upon the mount of Olives), ★ Matthew 24:30 (the sign of the
--                Son of Adam... coming in the clouds) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★★ Ezekiel 10:18-19 (the glory of Yahuah departed from off the threshold... stood at
--                the door of the east gate), ★★★ Ezekiel 43:1-4 (the glory came from the way of the
--                east... came into the house by the way of the gate toward the east — the RETURN),
--                ★ Zechariah 14:4 (his feet shall stand... upon the mount of Olives... on the east) — THREAD 4
--   v.24-25 (the spirit took me up... into Chaldea, to them of the captivity... I spake all the things)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none separate (the vision ends; the prophet reports to the captivity)
--
-- Threads (slug — target libraries):
--   1. ezekiel-11-i-will-give-them-one-heart-and-a-new-spirit-to-walk-in-my-statutes
--        — NT (Hebrews 8, 2 Corinthians 3) + Tanakh (Ezekiel 36, Ezekiel 37, Jeremiah 31) [free]
--      (★★★ THE FIRST new-heart promise: the two-house regathering + the Spirit-given heart that WALKS
--       IN THE STATUTES; Torah on the heart, never abolished; the seed of Ezekiel 36:26-27)
--   2. ezekiel-11-this-city-is-the-caldron-and-we-be-the-flesh — Tanakh (Jeremiah 1, Micah 3, Amos 6) [free]
--      (★ the false-security counsel of the wicked princes judged; the caldron turned against them)
--   3. ezekiel-11-a-little-sanctuary-in-the-countries-where-they-shall-come — Tanakh (Isaiah 8, Psalm 90) [free]
--      (★ Yahuah himself a sanctuary/dwelling-place to the scattered, even far off among the heathen)
--   4. ezekiel-11-the-glory-of-yahuah-went-up-to-the-mountain-on-the-east — NT (Matthew 24) + Tanakh (Ezekiel 10, Ezekiel 43, Zechariah 14) [free]
--      (★ the Formed Glory withdrawing eastward to the mount on the east — to RETURN by the east gate;
--       the mount of Olives on the east)
--
-- Framing notes:
--   ★★★ ONE HEART, A NEW SPIRIT (THREAD 1): to the very exiles the inhabitants of Jerusalem despised
--      (*Get you far from Yahuah... unto us is this land given*, 11:15), Yahuah makes the FIRST statement
--      of the new-heart promise — *I will even gather you from the people, and assemble you out of the
--      countries where ye have been scattered, and I will give you the land of Yashar''el (Israel)*
--      (11:17), *And I will give them one heart, and I will put a new spirit within you; and I will take
--      the stony heart out of their flesh, and will give them an heart of flesh: That they may walk in my
--      statutes, and keep mine ordinances, and do them: and they shall be my people, and I will be their
--      Elohim (God)* (11:19-20). The new heart is FOR Torah-obedience — *that they may walk in my
--      statutes*. This is the seed of the fuller promise a chapter on: *A new heart also will I give you,
--      and a new spirit will I put within you... And I will put my spirit within you, and cause you to
--      walk in my statutes* (Ezekiel 36:26-27); and of Ezekiel 37:23-24 — *so shall they be my people...
--      they shall also walk in my judgments, and observe my statutes, and do them*. Jeremiah names the
--      same new covenant: *I will put my law in their inward parts, and write it in their hearts; and
--      will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). Hebrews quotes it as the
--      new covenant — *I will put my laws into their mind, and write them in their hearts* (Hebrews 8:10);
--      and Paul names the writing — *written not with ink, but with the Spirit of the living Elohim (God);
--      not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3). The same Torah,
--      moved from stone to heart — never abolished, now WALKED in by the Spirit-given heart.
--   ★ THE CALDRON (THREAD 2): the wicked princes' false security — *It is not near; let us build houses:
--      this city is the caldron, and we be the flesh* (11:3) — is turned back on them: *Your slain... they
--      are the flesh, and this city is the caldron: but I will bring you forth out of the midst of it*
--      (11:7), *Ye have feared the sword; and I will bring a sword upon you* (11:8). Jeremiah saw the same
--      pot of judgment boiling from the north — *I see a seething pot; and the face thereof is toward the
--      north... Out of the north an evil shall break forth* (Jeremiah 1:13-14); Micah indicts the same
--      flesh-devouring heads — *Who also eat the flesh of my people... and chop them in pieces, as for the
--      pot, and as flesh within the caldron* (Micah 3:3); Amos names their ease — *Woe to them that are at
--      ease in Zion* (Amos 6:1). The judgment falls because *ye have not walked in my statutes* (11:12).
--   ★ A LITTLE SANCTUARY (THREAD 3): to the scattered house, far off among the heathen, Yahuah himself is
--      refuge — *Although I have cast them far off among the heathen... yet will I be to them as a little
--      sanctuary in the countries where they shall come* (11:16). The same One who is *for a sanctuary*
--      to those who fear him (Isaiah 8:14) is the dwelling-place of the dispersed — *Yahuah (Lord), thou
--      hast been our dwelling place in all generations* (Psalm 90:1). No temple in exile, yet Yahuah a
--      sanctuary in the very countries of their scattering.
--   ★ THE GLORY DEPARTS EASTWARD (THREAD 4): *the glory of Yahuah (LORD) went up from the midst of the
--      city, and stood upon the mountain which is on the east side of the city* (11:23) — the Formed
--      Glory withdrawing, continuing the departure of ch10: *the glory of Yahuah (LORD) departed from off
--      the threshold of the house... at the door of the east gate* (Ezekiel 10:18-19). But the eastward
--      withdrawal is not the end — the same Glory returns by the same gate: *the glory of the Elohim (God)
--      of Yashar''el (Israel) came from the way of the east... And the glory of Yahuah (LORD) came into the
--      house by the way of the gate whose prospect is toward the east* (Ezekiel 43:2,4). The mountain on
--      the east is the mount of Olives, where the Formed Son sat (Matthew 24:3) and shall stand again —
--      *his feet shall stand in that day upon the mount of Olives, which is before Jerusalem on the east*
--      (Zechariah 14:4); *they shall see the Son of Adam coming in the clouds of heaven* (Matthew 24:30).
--      The Formed Glory departs to the east — to return.
--   VERSES WITH NO SEPARATE ADD: v.1 (the east-gate scene; woven into THREAD 4), v.13 (Pelatiah's death
--      and the remnant-intercession; woven in THREAD 1 prose — the remnant the regathering answers), v.21
--      (the obverse of the new heart; woven in THREAD 1), v.24-25 (the vision ends; the report to the
--      captivity). All verses recorded in the coverage checklist above; every block carries a thread.

CREATE TEMP VIEW _s308_ezek11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): I will give them one heart, and a new spirit — to walk in my statutes
    ('canon','ezekiel',11,19,'canon','ezekiel',36,26,'free',
      E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26). The new-heart promise here in Ezekiel 11 is its first and seed-statement — *I will give them one heart, and I will put a new spirit within you; and I will take the stony heart out of their flesh, and will give them an heart of flesh* (Ezekiel 11:19) — and a chapter on it is unfolded fully. The same gift, the same stony heart removed: not a new law, but a new heart for the old commandment.'),
    ('canon','ezekiel',11,20,'canon','ezekiel',36,27,'free',
      E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The purpose of the new heart is named identically in both chapters — *That they may walk in my statutes, and keep mine ordinances, and do them* (Ezekiel 11:20). The Spirit-given heart is given FOR Torah-obedience; the statutes are walked in, never abolished. The Ruach (Spirit) and the Torah are one gift.'),
    ('canon','ezekiel',11,20,'canon','ezekiel',37,24,'free',
      E'*And David my servant shall be king over them; and they all shall have one shepherd: they shall also walk in my judgments, and observe my statutes, and do them* (Ezekiel 37:24). The reunited two-house people under the one Shepherd-King keep the very statutes promised here — *That they may walk in my statutes, and keep mine ordinances, and do them: and they shall be my people, and I will be their Elohim (God)* (Ezekiel 11:20). The regathered, new-hearted house is the Torah-walking house.'),
    ('canon','ezekiel',11,20,'canon','ezekiel',37,23,'free',
      E'*...so shall they be my people, and I will be their Elohim (God)* (Ezekiel 37:23). The covenant-formula sealed of a cleansed, regathered people answers the close of the new-heart promise — *and they shall be my people, and I will be their Elohim (God)* (Ezekiel 11:20). The one heart and new spirit make a people who are his, and an Elohim who is theirs.'),
    ('canon','ezekiel',11,19,'canon','jeremiah',31,33,'free',
      E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The new heart of Ezekiel 11:19 IS the new covenant Jeremiah names — the Torah moved from tablet to the inward parts. *I will give them one heart, and I will put a new spirit within you* and *I will put my law in their inward parts, and write it in their hearts* are one promise: the law internalized, the heart of flesh that loves it.'),
    ('canon','ezekiel',11,19,'canon','hebrews',8,10,'free',
      E'*For this is the covenant that I will make with the house of Yashar''el (Israel) after those days, saith Yahuah (Lord); I will put my laws into their mind, and write them in their hearts: and I will be to them a Elohim (God), and they shall be to me a people* (Hebrews 8:10). The new covenant is the Torah written on the heart — exactly the heart of flesh given in *I will take the stony heart out of their flesh, and will give them an heart of flesh* (Ezekiel 11:19). The covenant is not the law abolished but the law inscribed within; the people are still *his people*, the Elohim still *their Elohim*.'),
    ('canon','ezekiel',11,19,'canon','2-corinthians',3,3,'free',
      E'*Forasmuch as ye are manifestly declared to be the epistle of Messiah (Christ) ministered by us, written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3). Paul names the very writing Ezekiel promised — *an heart of flesh* (Ezekiel 11:19), *fleshy tables of the heart*. The Spirit of the living Elohim writes the same Torah on the heart of flesh; stone gives way to flesh, but the words written are the words of the covenant.'),

    -- THREAD 2 (★): this city is the caldron, and we be the flesh — the wicked counsel judged
    ('canon','ezekiel',11,3,'canon','jeremiah',1,13,'free',
      E'*And the word of Yahuah (LORD) came unto me the second time, saying, What seest thou? And I said, I see a seething pot; and the face thereof is toward the north* (Jeremiah 1:13). The wicked princes call the city a safe caldron — *this city is the caldron, and we be the flesh* (Ezekiel 11:3) — but Jeremiah sees the true pot, the seething pot of judgment whose face is toward the north, *Out of the north an evil shall break forth* (Jeremiah 1:14). The pot they trust in is the pot of their own undoing.'),
    ('canon','ezekiel',11,7,'canon','micah',3,3,'free',
      E'*Who also eat the flesh of my people, and flay their skin from off them; and they break their bones, and chop them in pieces, as for the pot, and as flesh within the caldron* (Micah 3:3). The princes who said *we be the flesh* (Ezekiel 11:3) are the very heads who made the people the flesh in the pot — and Yahuah answers them in their own figure: *Your slain whom ye have laid in the midst of it, they are the flesh, and this city is the caldron* (Ezekiel 11:7). The flesh in the caldron is the people they devoured; the judgment turns the caldron against them.'),
    ('canon','ezekiel',11,3,'canon','amos',6,1,'free',
      E'*Woe to them that are at ease in Zion, and trust in the mountain of Samaria, which are named chief of the nations, to whom the house of Yashar''el (Israel) came!* (Amos 6:1). The false ease of *let us build houses: this city is the caldron, and we be the flesh* (Ezekiel 11:3) is the same complacent security Amos curses — the princes at ease, trusting the city as a refuge, sure no judgment is near. The woe of Amos rests on the careless counsel of Ezekiel''s twenty-five.'),

    -- THREAD 3 (★): a little sanctuary in the countries where they shall come
    ('canon','ezekiel',11,16,'canon','isaiah',8,14,'free',
      E'*And he shall be for a sanctuary; but for a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel), for a gin and for a snare to the inhabitants of Jerusalem* (Isaiah 8:14). The same One who *shall be for a sanctuary* to those who fear him is the *little sanctuary in the countries where they shall come* (Ezekiel 11:16) for the scattered. Yahuah himself — refuge to the trusting remnant, in the temple or far from it — is the sanctuary; the inhabitants of Jerusalem who cast the exiles off meet him as a stone of stumbling instead.'),
    ('canon','ezekiel',11,16,'canon','psalms',90,1,'free',
      E'*Yahuah (Lord), thou hast been our dwelling place in all generations* (Psalm 90:1). Though cast far off among the heathen with no temple, the scattered have Yahuah himself as their sanctuary — *yet will I be to them as a little sanctuary in the countries where they shall come* (Ezekiel 11:16). Moses sang it before the exile: Yahuah is the dwelling place in every generation, the sanctuary that needs no walls, present in the very countries of their scattering.'),

    -- THREAD 4 (★): the glory of Yahuah went up to the mountain on the east — to return
    ('canon','ezekiel',11,23,'canon','ezekiel',10,18,'free',
      E'*Then the glory of Yahuah (LORD) departed from off the threshold of the house, and stood over the cherubims* (Ezekiel 10:18). The departure begun in ch10 is completed here — *the glory of Yahuah (LORD) went up from the midst of the city, and stood upon the mountain which is on the east side of the city* (Ezekiel 11:23). Step by step the Glory withdraws: from the threshold, to the cherubim, to the east gate, and now up out of the city to the eastern mount. The Presence leaves the defiled house.'),
    ('canon','ezekiel',11,23,'canon','ezekiel',10,19,'free',
      E'*And the cherubims lifted up their wings, and mounted up from the earth in my sight... and every one stood at the door of the east gate of the LORD''S house; and the glory of the Elohim (God) of Yashar''el (Israel) was over them above* (Ezekiel 10:19). The cherubim that bore the Glory to the east gate now carry it up and out — *Then did the cherubims lift up their wings, and the wheels beside them; and the glory of the Elohim (God) of Yashar''el (Israel) was over them above* (Ezekiel 11:22), *and stood upon the mountain which is on the east side of the city* (11:23). The same Glory, the same cherubim, moving ever eastward.'),
    ('canon','ezekiel',11,23,'canon','ezekiel',43,2,'free',
      E'*And, behold, the glory of the Elohim (God) of Yashar''el (Israel) came from the way of the east: and his voice was like a noise of many waters: and the earth shined with his glory* (Ezekiel 43:2). The Glory that *went up from the midst of the city, and stood upon the mountain which is on the east side* (Ezekiel 11:23) is the same Glory that returns — by the very way it left, *from the way of the east*. The eastward departure is not abandonment but the promise of a return: the Formed Glory withdraws to the east to come back from the east.'),
    ('canon','ezekiel',11,23,'canon','ezekiel',43,4,'free',
      E'*And the glory of Yahuah (LORD) came into the house by the way of the gate whose prospect is toward the east* (Ezekiel 43:4). What departed eastward in 11:23 re-enters by the eastern gate: the Glory comes *into the house by the way of the gate whose prospect is toward the east*. The mountain on the east where the Glory paused becomes the road of its homecoming; the Presence that left will dwell again.'),
    ('canon','ezekiel',11,23,'canon','zechariah',14,4,'free',
      E'*And his feet shall stand in that day upon the mount of Olives, which is before Jerusalem on the east, and the mount of Olives shall cleave in the midst thereof toward the east and toward the west* (Zechariah 14:4). The mountain on the east where the Glory stood (Ezekiel 11:23) is the mount of Olives, before Jerusalem on the east — and there the feet of Yahuah, the Formed Son, shall stand in the day of his coming. The eastern mount of the departed Glory is the eastern mount of his return.'),
    ('canon','ezekiel',11,23,'canon','matthew',24,3,'free',
      E'*And as he sat upon the mount of Olives, the disciples came unto him privately, saying, Tell us, when shall these things be? and what shall be the sign of thy coming, and of the end of the world?* (Matthew 24:3). The Glory that stood *upon the mountain which is on the east side of the city* (Ezekiel 11:23) — the mount of Olives — is where the Formed Son, the Glory made flesh, sat and foretold his coming. The eastern mount of the departing Glory is the very place from which the returning Glory speaks.'),
    ('canon','ezekiel',11,23,'canon','matthew',24,30,'free',
      E'*And then shall appear the sign of the Son of Adam in heaven: and then shall all the tribes of the earth mourn, and they shall see the Son of Adam coming in the clouds of heaven with power and great glory* (Matthew 24:30). The Glory that went up from the city (Ezekiel 11:23) returns in the open coming of the Son of Adam — *in the clouds of heaven with power and great glory*. The Formed Glory that departed eastward is the Son of Adam whom all the tribes shall see return.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-11-i-will-give-them-one-heart-and-a-new-spirit-to-walk-in-my-statutes',
       E'I will give them one heart, and a new spirit — that they may walk in my statutes',
       E'To the very exiles the inhabitants of Jerusalem had despised — *Get you far from Yahuah (LORD): unto us is this land given in possession* (11:15) — Yahuah speaks the FIRST statement of the new-heart promise. First the regathering of the scattered house: *I will even gather you from the people, and assemble you out of the countries where ye have been scattered, and I will give you the land of Yashar''el (Israel)* (11:17). Then the heart that makes them his: *And I will give them one heart, and I will put a new spirit within you; and I will take the stony heart out of their flesh, and will give them an heart of flesh: That they may walk in my statutes, and keep mine ordinances, and do them: and they shall be my people, and I will be their Elohim (God)* (11:19-20). Mark the PURPOSE of the new heart — *that they may walk in my statutes*. It is given FOR Torah-obedience, not instead of it. This is the seed of the fuller promise a chapter on: *A new heart also will I give you, and a new spirit will I put within you... And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:26-27); and of the reunited house under the one Shepherd-King — *they shall also walk in my judgments, and observe my statutes, and do them* (Ezekiel 37:24), *so shall they be my people, and I will be their Elohim (God)* (Ezekiel 37:23). Jeremiah names the same new covenant: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). Hebrews quotes it as the covenant itself — *I will put my laws into their mind, and write them in their hearts: and I will be to them a Elohim (God), and they shall be to me a people* (Hebrews 8:10); and Paul names the writing — *written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3). The same Torah, moved from stone to heart of flesh, the stony heart taken away — never abolished, now WALKED in by the Spirit-given heart. (The obverse stands too: *as for them whose heart walketh after the heart of their detestable things... I will recompense their way upon their own heads*, 11:21 — the new heart is gift and choice both.)',
       sv.verse_id, ev.verse_id, 'free', 32250
  FROM _s308_ezek11_lookup sv, _s308_ezek11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=11 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-11-this-city-is-the-caldron-and-we-be-the-flesh',
       E'This city is the caldron, and we be the flesh — the wicked counsel judged',
       E'At the east gate stand twenty-five men, *the men that devise mischief, and give wicked counsel in this city* (11:2), and their counsel is a false security: *It is not near; let us build houses: this city is the caldron, and we be the flesh* (11:3) — the city, they say, is a strong pot that keeps its flesh safe; no judgment is near. Yahuah turns the figure against them: *Your slain whom ye have laid in the midst of it, they are the flesh, and this city is the caldron: but I will bring you forth out of the midst of it* (11:7); *Ye have feared the sword; and I will bring a sword upon you* (11:8). The caldron will not shelter them — *This city shall not be your caldron, neither shall ye be the flesh in the midst thereof* (11:11) — *for ye have not walked in my statutes* (11:12). The prophets see the same false-secure judgment. Jeremiah is shown the true pot: *I see a seething pot; and the face thereof is toward the north... Out of the north an evil shall break forth upon all the inhabitants of the land* (Jeremiah 1:13-14). Micah indicts the very flesh-devouring heads who made the people the meat: *Who also eat the flesh of my people... and chop them in pieces, as for the pot, and as flesh within the caldron* (Micah 3:3). And Amos curses their ease: *Woe to them that are at ease in Zion... which are named chief of the nations* (Amos 6:1). The princes who said *we be the flesh* are the cooks who filled the pot with their own people''s blood — and the sword they did not fear comes upon them.',
       sv.verse_id, ev.verse_id, 'free', 32253
  FROM _s308_ezek11_lookup sv, _s308_ezek11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=11 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-11-a-little-sanctuary-in-the-countries-where-they-shall-come',
       E'Yet will I be to them as a little sanctuary in the countries where they shall come',
       E'When the prophet cries out at Pelatiah''s death — *wilt thou make a full end of the remnant of Yashar''el (Israel)?* (11:13) — Yahuah answers by turning to the scattered, the very exiles the men of Jerusalem despised: *thy brethren, even thy brethren, the men of thy kindred, and all the house of Yashar''el (Israel) wholly, are they unto whom the inhabitants of Jerusalem have said, Get you far from Yahuah (LORD): unto us is this land given in possession* (11:15). To those cast far off Yahuah gives himself as their refuge: *Although I have cast them far off among the heathen, and although I have scattered them among the countries, yet will I be to them as a little sanctuary in the countries where they shall come* (11:16). No temple in exile, yet a sanctuary — Yahuah himself. The same One is named *for a sanctuary* to those who fear him: *And he shall be for a sanctuary; but for a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel)* (Isaiah 8:14) — refuge to the trusting remnant, offence to the proud inhabitants who cast the exiles off. And Moses sang it before ever the exile came: *Yahuah (Lord), thou hast been our dwelling place in all generations* (Psalm 90:1) — the dwelling-place that needs no walls, the sanctuary present in the very countries of the scattering.',
       sv.verse_id, ev.verse_id, 'free', 32256
  FROM _s308_ezek11_lookup sv, _s308_ezek11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=11 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-11-the-glory-of-yahuah-went-up-to-the-mountain-on-the-east',
       E'The glory of Yahuah went up to the mountain on the east side — to return',
       E'The vision closes on the most grievous sight of all: *Then did the cherubims lift up their wings, and the wheels beside them; and the glory of the Elohim (God) of Yashar''el (Israel) was over them above. And the glory of Yahuah (LORD) went up from the midst of the city, and stood upon the mountain which is on the east side of the city* (11:22-23). The Presence leaves the defiled house. This completes the departure begun a chapter before, step by step: *Then the glory of Yahuah (LORD) departed from off the threshold of the house, and stood over the cherubims* (Ezekiel 10:18), then *every one stood at the door of the east gate of the LORD''S house* (Ezekiel 10:19), and now up out of the city to the eastern mount. Yet the eastward withdrawal is not abandonment — it is the road of the return. By the very way it left, the Glory comes home: *behold, the glory of the Elohim (God) of Yashar''el (Israel) came from the way of the east: and his voice was like a noise of many waters: and the earth shined with his glory* (Ezekiel 43:2), *And the glory of Yahuah (LORD) came into the house by the way of the gate whose prospect is toward the east* (Ezekiel 43:4). The mountain on the east is the mount of Olives, before Jerusalem on the east — where the Formed Son, the Glory made flesh, sat and foretold his coming (*as he sat upon the mount of Olives*, Matthew 24:3), and where his feet shall stand again: *his feet shall stand in that day upon the mount of Olives, which is before Jerusalem on the east* (Zechariah 14:4); *they shall see the Son of Adam coming in the clouds of heaven with power and great glory* (Matthew 24:30). The Formed Glory departs eastward — to return from the east.',
       sv.verse_id, ev.verse_id, 'free', 32259
  FROM _s308_ezek11_lookup sv, _s308_ezek11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=11 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *A new heart also will I give you, and a new spirit will I put within you... I will give you an heart of flesh* (Ezekiel 36:26) — the fuller form of the same promise; Ezekiel 11:19 is its seed.'
  FROM cross_reference_threads t
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=19
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-11-i-will-give-them-one-heart-and-a-new-spirit-to-walk-in-my-statutes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27) — the Spirit-given heart is FOR Torah-obedience; the same purpose-clause as 11:20.'
  FROM cross_reference_threads t
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=20
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-11-i-will-give-them-one-heart-and-a-new-spirit-to-walk-in-my-statutes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *they shall also walk in my judgments, and observe my statutes, and do them* (Ezekiel 37:24) — the reunited house under the one Shepherd-King keeps the very statutes 11:20 promised.'
  FROM cross_reference_threads t
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=20
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-11-i-will-give-them-one-heart-and-a-new-spirit-to-walk-in-my-statutes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *so shall they be my people, and I will be their Elohim (God)* (Ezekiel 37:23) — the covenant-formula that closes the new-heart promise (11:20); a cleansed people made his.'
  FROM cross_reference_threads t
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=20
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-11-i-will-give-them-one-heart-and-a-new-spirit-to-walk-in-my-statutes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★★ *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33) — the new covenant is the Torah internalized; the new heart of 11:19 is the same promise.'
  FROM cross_reference_threads t
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=19
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-11-i-will-give-them-one-heart-and-a-new-spirit-to-walk-in-my-statutes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★★ *I will put my laws into their mind, and write them in their hearts* (Hebrews 8:10) — the new covenant quoted: the law inscribed within, not abolished; the heart of flesh of 11:19.'
  FROM cross_reference_threads t
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=19
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-11-i-will-give-them-one-heart-and-a-new-spirit-to-walk-in-my-statutes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3) — the Spirit writes the Torah on the *heart of flesh* (11:19); stone gives way to flesh.'
  FROM cross_reference_threads t
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=19
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=3 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-11-i-will-give-them-one-heart-and-a-new-spirit-to-walk-in-my-statutes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *I see a seething pot; and the face thereof is toward the north* (Jeremiah 1:13) — the true pot of judgment; the safe-caldron of 11:3 is the pot of their own undoing.'
  FROM cross_reference_threads t
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=3
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-11-this-city-is-the-caldron-and-we-be-the-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *they break their bones, and chop them in pieces, as for the pot, and as flesh within the caldron* (Micah 3:3) — the princes who said *we be the flesh* (11:3) made the people the flesh in the pot; 11:7 turns it on them.'
  FROM cross_reference_threads t
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=7
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=3 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-11-this-city-is-the-caldron-and-we-be-the-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Woe to them that are at ease in Zion* (Amos 6:1) — the same complacent security as *let us build houses... we be the flesh* (11:3); the careless counsel cursed.'
  FROM cross_reference_threads t
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=3
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=6 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-11-this-city-is-the-caldron-and-we-be-the-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *And he shall be for a sanctuary* (Isaiah 8:14) — the same One who is sanctuary to those who fear him is the *little sanctuary* to the scattered (11:16).'
  FROM cross_reference_threads t
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=16
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-11-a-little-sanctuary-in-the-countries-where-they-shall-come'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Yahuah (Lord), thou hast been our dwelling place in all generations* (Psalm 90:1) — the sanctuary that needs no walls; Yahuah a dwelling-place in the very countries of scattering (11:16).'
  FROM cross_reference_threads t
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=16
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-11-a-little-sanctuary-in-the-countries-where-they-shall-come'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the glory of Yahuah (LORD) departed from off the threshold of the house* (Ezekiel 10:18) — the departure begun a chapter before; 11:23 completes it up out of the city.'
  FROM cross_reference_threads t
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=23
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-11-the-glory-of-yahuah-went-up-to-the-mountain-on-the-east'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *every one stood at the door of the east gate of the LORD''S house; and the glory of the Elohim (God) of Yashar''el (Israel) was over them above* (Ezekiel 10:19) — the same cherubim and Glory, moving ever eastward (11:22-23).'
  FROM cross_reference_threads t
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=23
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-11-the-glory-of-yahuah-went-up-to-the-mountain-on-the-east'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★★ *the glory of the Elohim (God) of Yashar''el (Israel) came from the way of the east* (Ezekiel 43:2) — what departed eastward (11:23) returns by the same way; the answer to the departure.'
  FROM cross_reference_threads t
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=23
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=43 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-11-the-glory-of-yahuah-went-up-to-the-mountain-on-the-east'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the glory of Yahuah (LORD) came into the house by the way of the gate whose prospect is toward the east* (Ezekiel 43:4) — the Glory re-enters by the eastern gate; the homecoming of 11:23.'
  FROM cross_reference_threads t
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=23
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=43 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-11-the-glory-of-yahuah-went-up-to-the-mountain-on-the-east'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *his feet shall stand in that day upon the mount of Olives, which is before Jerusalem on the east* (Zechariah 14:4) — the eastern mount of 11:23 is the mount of Olives where Yahuah''s feet shall stand.'
  FROM cross_reference_threads t
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=23
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-11-the-glory-of-yahuah-went-up-to-the-mountain-on-the-east'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *as he sat upon the mount of Olives* (Matthew 24:3) — the Glory made flesh sat on the very eastern mount where the Glory had stood (11:23), foretelling his coming.'
  FROM cross_reference_threads t
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=23
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-11-the-glory-of-yahuah-went-up-to-the-mountain-on-the-east'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *they shall see the Son of Adam coming in the clouds of heaven with power and great glory* (Matthew 24:30) — the Glory that went up from the city (11:23) returns in the open coming of the Son of Adam.'
  FROM cross_reference_threads t
  JOIN _s308_ezek11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=11 AND sv.verse_number=23
  JOIN _s308_ezek11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-11-the-glory-of-yahuah-went-up-to-the-mountain-on-the-east'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezekiel_12.sql (Ezekiel 12) -----
-- Chapter: Ezekiel 12 — the prophet's SIGN of the exile baggage: digging through the wall, carrying out
-- by night, the face covered. The rebellious house that have eyes to see, and see not; ears to hear, and
-- hear not. The PRINCE (Zedekiah) shall bear upon his shoulder in the twilight, his net spread upon him,
-- carried to Babylon — yet shall he not SEE it, though he shall die there (the precise prophecy: blinded
-- before Babylon). And against the scoffers: *the days are at hand, and the effect of every vision* —
-- *there shall none of my words be deferred any more* — no more deferring, the word WILL come to pass.
-- Tag: ezek12   Temp view: _s308_ezek12_lookup
-- Sort band: base 32275, step 3 -> threads at 32275, 32278, 32281 (3 threads)
-- Source of EVERY row: 'canon','ezekiel',12,v
--
-- Ezekiel 12 coverage:
--   ★ v.1-6 (Son of Adam, thou dwellest in the midst of a rebellious house, which have eyes to see, and
--          see not; they have ears to hear, and hear not; prepare thee stuff for removing; go forth at
--          even as they that go forth into captivity; dig through the wall; cover thy face; a sign)
--        NT:     ★ Matthew 13:13-15 (because they seeing see not; and hearing they hear not... in them is
--                fulfilled the prophecy of Esaias — the Messiah names the SAME hardness) — THREAD 1
--        Extras: none warranted (clean canon-NT-Tanakh blindness weave)
--        Tanakh: ★ Isaiah 6:9-10 (Hear ye indeed, but understand not; and see ye indeed, but perceive
--                not... shut their eyes; lest they see), ★ Jeremiah 5:21 (O foolish people, and without
--                understanding; which have eyes, and see not; which have ears, and hear not),
--                ★ Deuteronomy 29:4 (Yahuah hath not given you an heart to perceive, and eyes to see, and
--                ears to hear, unto this day) — THREAD 1
--   v.7-11 (And I did so as I was commanded... This burden concerneth the prince in Jerusalem... I am your
--          sign; they shall remove and go into captivity)
--        NT:     none warranted (the sign-act obeyed and interpreted; woven into THREAD 1/2 prose)
--        Extras: none warranted
--        Tanakh: none separate (the prince-burden flows into THREAD 2)
--   ★ v.12-13 (the prince that is among them shall bear upon his shoulder in the twilight... cover his
--          face, that he see not the ground with his eyes; My net also will I spread upon him... and I
--          will bring him to Babylon... yet shall he not see it, though he shall die there)
--        NT:     none warranted (a specific historical fulfillment — the captivity of Zedekiah — answered
--                IN the Tanakh's own record, not forward in the NT)
--        Extras: none warranted
--        Tanakh: ★ 2 Kings 25:7 (they slew the sons of Zedekiah before his eyes, and put out the eyes of
--                Zedekiah, and bound him... and carried him to Babylon — blinded, so he saw it NOT),
--                ★ 2 Kings 25:4 (the city was broken up, and all the men of war fled by night... the king
--                went the way toward the plain — the flight), ★ Jeremiah 52:11 (he put out the eyes of
--                Zedekiah... carried him to Babylon, and put him in prison till the day of his death — yet
--                he should DIE there), ★ Jeremiah 39:7 (he put out Zedekiah's eyes, and bound him with
--                chains, to carry him to Babylon) — THREAD 2
--   v.14-20 (I will scatter toward every wind all that are about him... they shall know that I am Yahuah;
--          eat thy bread with quaking; the land made desolate)
--        NT:     none warranted (the scattering/desolation; recognition-formula; woven into THREAD 2 prose)
--        Extras: none warranted
--        Tanakh: none separate (the dispersion of v.15 woven into THREAD 2)
--   ★★ v.21-28 (what is that proverb... The days are prolonged, and every vision faileth? I will make this
--          proverb to cease... The days are at hand, and the effect of every vision... the word that I
--          shall speak shall come to pass; it shall be no more prolonged... the vision that he seeth is
--          for many days to come... There shall none of my words be prolonged any more, but the word
--          which I have spoken shall be done)
--        NT:     ★★ 2 Peter 3:4 (Where is the promise of his coming? for since the fathers fell asleep, all
--                things continue as they were — the END-DAYS scoffers, the same deferring spirit), ★★ 2
--                Peter 3:9 (Yahuah is not slack concerning his promise... not willing that any should
--                perish), ★ 2 Peter 3:3 (there shall come in the last days scoffers, walking after their
--                own lusts), ★ Matthew 24:48 (the evil servant: My lord delayeth his coming) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★ Habakkuk 2:3 (the vision is yet for an appointed time, but at the end it shall speak,
--                and not lie: though it tarry, wait for it; because it will surely come) — THREAD 3
--
-- Threads (slug — target libraries):
--   1. ezekiel-12-eyes-to-see-and-see-not-the-rebellious-house — NT (Matthew 13) + Tanakh (Isaiah 6, Jeremiah 5, Deuteronomy 29) [free]
--      (★ the rebellious house with eyes-that-see-not; the Messiah quotes Isaiah of the SAME hardness)
--   2. ezekiel-12-the-prince-carried-to-babylon-yet-shall-he-not-see-it — Tanakh (2 Kings 25, Jeremiah 52, Jeremiah 39) [free]
--      (★ Zedekiah's flight, blinding, captivity, and death in Babylon — the word fulfilled to the letter)
--   3. ezekiel-12-the-days-are-at-hand-none-of-my-words-deferred — NT (2 Peter 3, Matthew 24) + Tanakh (Habakkuk 2) [free]
--      (★★ against the scoffers; the vision shall NOT be deferred; the word will surely come to pass)
--
-- Framing notes:
--   ★ THE REBELLIOUS HOUSE — EYES TO SEE, AND SEE NOT (THREAD 1): *Son of Adam, thou dwellest in the
--      midst of a rebellious house, which have eyes to see, and see not; they have ears to hear, and hear
--      not: for they are a rebellious house* (12:2). The very hardness Isaiah was sent into — *Hear ye
--      indeed, but understand not; and see ye indeed, but perceive not* (Isa 6:9), *shut their eyes; lest
--      they see with their eyes* (Isa 6:10); the same Jeremiah named — *which have eyes, and see not;
--      which have ears, and hear not* (Jer 5:21); the same Moses named at the covenant in Moab — *Yahuah
--      (LORD) hath not given you an heart to perceive, and eyes to see, and ears to hear, unto this day*
--      (Deut 29:4). And the Formed Son names the SAME hardness as the reason he speaks in parables — *they
--      seeing see not; and hearing they hear not, neither do they understand. And in them is fulfilled the
--      prophecy of Esaias* (Matt 13:13-14). The blindness is moral rebellion, not mere ignorance; the
--      eyes-that-see-not is a covenant verdict running from Moses to the Messiah.
--   ★ THE PRINCE CARRIED TO BABYLON — YET SHALL HE NOT SEE IT (THREAD 2): *the prince that is among them
--      shall bear upon his shoulder in the twilight, and shall go forth... he shall cover his face, that
--      he see not the ground with his eyes. My net also will I spread upon him, and he shall be taken in
--      my snare: and I will bring him to Babylon to the land of the Chaldeans; yet shall he not see it,
--      though he shall die there* (12:12-13). The riddle solved to the letter in the Tanakh's own record:
--      Zedekiah *fled by night* (2 Kgs 25:4); taken, *they... put out the eyes of Zedekiah, and bound him
--      with fetters of brass, and carried him to Babylon* (2 Kgs 25:7) — brought to Babylon yet, being
--      BLINDED, never SEEING it; *carried him to Babylon, and put him in prison till the day of his death*
--      (Jer 52:11) — yet he should DIE there. Jeremiah seals it: *he put out Zedekiah's eyes, and bound
--      him with chains, to carry him to Babylon* (Jer 39:7). Every clause of the sign — shoulder, twilight,
--      net, Babylon, not-see, death — came to pass exactly.
--   ★★ THE DAYS ARE AT HAND — NONE OF MY WORDS DEFERRED (THREAD 3): against the scoffers' proverb — *The
--      days are prolonged, and every vision faileth?* (12:22) — Yahuah swears: *The days are at hand, and
--      the effect of every vision* (12:23); *I will speak, and the word that I shall speak shall come to
--      pass; it shall be no more prolonged* (12:25); against those who say *The vision that he seeth is for
--      many days to come, and he prophesieth of the times that are far off* (12:27), *There shall none of
--      my words be prolonged any more, but the word which I have spoken shall be done* (12:28). Habakkuk
--      gives the same answer to the same impatience — *the vision is yet for an appointed time... though it
--      tarry, wait for it; because it will surely come, it will not tarry* (Hab 2:3). And Peter names the
--      SAME deferring spirit in the last days — *there shall come in the last days scoffers... saying,
--      Where is the promise of his coming? for since the fathers fell asleep, all things continue as they
--      were* (2 Pet 3:3-4); *Yahuah (Lord) is not slack concerning his promise* (2 Pet 3:9). The Messiah
--      names it in the evil servant — *My lord delayeth his coming* (Matt 24:48). The deferring-scoffer of
--      Ezekiel's day is the deferring-scoffer of the last days; the word is not slack — it shall be done.
--   VERSES WITH NO SEPARATE ADD: v.7-11 (the sign-act obeyed and the prince-burden declared — woven into
--      THREAD 1/2 prose), v.14-20 (the scattering toward every wind, the recognition-formula *they shall
--      know that I am Yahuah*, the bread eaten with quaking, the desolation — woven into THREAD 2 prose).
--      All verses recorded in the coverage checklist; every block carries at least one thread.

CREATE TEMP VIEW _s308_ezek12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): eyes to see, and see not — the rebellious house
    ('canon','ezekiel',12,2,'canon','isaiah',6,9,'free',
      E'*And he said, Go, and tell this people, Hear ye indeed, but understand not; and see ye indeed, but perceive not* (Isaiah 6:9). The rebellious house *which have eyes to see, and see not; they have ears to hear, and hear not* (Ezekiel 12:2) is the very people Isaiah was sent into — eyes that look and perceive not, ears that hear and understand not. The same covenant blindness Ezekiel preaches to, Isaiah was commissioned against; it is moral rebellion, not mere ignorance.'),
    ('canon','ezekiel',12,2,'canon','isaiah',6,10,'free',
      E'*Make the heart of this people fat, and make their ears heavy, and shut their eyes; lest they see with their eyes, and hear with their ears, and understand with their heart, and convert, and be healed* (Isaiah 6:10). The house that has *eyes to see, and see not... ears to hear, and hear not* (Ezekiel 12:2) is the people whose eyes are shut and ears made heavy — lest they see, and turn, and be healed. The shut eye is the rebellious heart; the sign-act of the exile baggage is given to a house that will not look.'),
    ('canon','ezekiel',12,2,'canon','jeremiah',5,21,'free',
      E'*Hear now this, O foolish people, and without understanding; which have eyes, and see not; which have ears, and hear not* (Jeremiah 5:21). Jeremiah names the same indictment in the same words Ezekiel uses — *which have eyes to see, and see not; they have ears to hear, and hear not* (Ezekiel 12:2). Two prophets, one verdict on the rebellious house: senses given by Yahuah (LORD) and refused, eyes and ears turned away from his word.'),
    ('canon','ezekiel',12,2,'canon','deuteronomy',29,4,'free',
      E'*Yet Yahuah (LORD) hath not given you an heart to perceive, and eyes to see, and ears to hear, unto this day* (Deuteronomy 29:4). At the covenant in Moab Moses already named the hardness Ezekiel preaches to — *eyes to see, and see not; ... ears to hear, and hear not* (Ezekiel 12:2). The eyes-that-see-not is a verdict reaching back to the wilderness generation: the heart that will not perceive, even after all Yahuah''s signs.'),
    ('canon','ezekiel',12,2,'canon','matthew',13,13,'free',
      E'*Therefore speak I to them in parables: because they seeing see not; and hearing they hear not, neither do they understand* (Matthew 13:13). The Formed Son names the SAME hardness Ezekiel was sent into — a house *which have eyes to see, and see not; they have ears to hear, and hear not* (Ezekiel 12:2). The eyes-that-see-not runs from Ezekiel''s rebellious house to the crowds who would not receive the kingdom; the Messiah speaks in parables because the eyes are shut.'),
    ('canon','ezekiel',12,2,'canon','matthew',13,14,'free',
      E'*And in them is fulfilled the prophecy of Esaias, which saith, By hearing ye shall hear, and shall not understand; and seeing ye shall see, and shall not perceive* (Matthew 13:14). The Messiah quotes Isaiah 6:9 of his own generation — the same seeing-that-perceives-not that Ezekiel''s house carried: *eyes to see, and see not* (Ezekiel 12:2). One unbroken hardness from the prophets to the Messiah, fulfilled in those who would not see.'),
    ('canon','ezekiel',12,2,'canon','matthew',13,15,'free',
      E'*For this people''s heart is waxed gross, and their ears are dull of hearing, and their eyes they have closed; lest at any time they should see with their eyes, and hear with their ears, and should understand with their heart, and should be converted, and I should heal them* (Matthew 13:15). The closed eye and dull ear of the rebellious house — *eyes to see, and see not; ... ears to hear, and hear not* (Ezekiel 12:2) — is the gross heart the Messiah names, lest they see and turn and be healed. The verdict of Isaiah 6 and Ezekiel 12 is one and the same in the Messiah''s mouth.'),

    -- THREAD 2 (★): the prince carried to Babylon — yet shall he not see it
    ('canon','ezekiel',12,13,'canon','2-kings',25,7,'free',
      E'*And they slew the sons of Zedekiah before his eyes, and put out the eyes of Zedekiah, and bound him with fetters of brass, and carried him to Babylon* (2 Kings 25:7). Here the riddle is solved to the letter: *I will bring him to Babylon to the land of the Chaldeans; yet shall he not see it, though he shall die there* (Ezekiel 12:13). Zedekiah was carried to Babylon, but his eyes were put out first — so he came to it yet never SAW it. The covering of the face in the sign (12:12) is the blinding fulfilled.'),
    ('canon','ezekiel',12,12,'canon','2-kings',25,4,'free',
      E'*And the city was broken up, and all the men of war fled by night by the way of the gate between two walls, which is by the king''s garden... and the king went the way toward the plain* (2 Kings 25:4). The sign of the prince who *shall bear upon his shoulder in the twilight, and shall go forth* (Ezekiel 12:12) is enacted in Zedekiah''s flight by night through the broken wall. The exile baggage carried out by twilight is the king''s own escape from the breached city.'),
    ('canon','ezekiel',12,13,'canon','jeremiah',52,11,'free',
      E'*Then he put out the eyes of Zedekiah; and the king of Babylon bound him in chains, and carried him to Babylon, and put him in prison till the day of his death* (Jeremiah 52:11). Every clause of Ezekiel''s word lands: *I will bring him to Babylon... yet shall he not see it, though he shall die there* (Ezekiel 12:13). Blinded, so he never saw Babylon; imprisoned there until death, so he died there. The prophecy fulfilled to the letter.'),
    ('canon','ezekiel',12,13,'canon','jeremiah',39,7,'free',
      E'*Moreover he put out Zedekiah''s eyes, and bound him with chains, to carry him to Babylon* (Jeremiah 39:7). Jeremiah seals the same fulfillment of the snare-and-net of Ezekiel — *My net also will I spread upon him, and he shall be taken in my snare: and I will bring him to Babylon... yet shall he not see it* (Ezekiel 12:13). The prince was taken, blinded, and carried to a Babylon his eyes would never behold.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 3 (★★): the days are at hand — none of my words deferred
    ('canon','ezekiel',12,22,'canon','habakkuk',2,3,'free',
      E'*For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry* (Habakkuk 2:3). Against the scoffers'' proverb — *The days are prolonged, and every vision faileth?* (Ezekiel 12:22) — Habakkuk gives the same answer: the vision has an appointed time; though it seem to tarry, it will surely come. The word does not fail; it waits for its hour, then speaks and does not lie.'),
    ('canon','ezekiel',12,27,'canon','2-peter',3,4,'free',
      E'*And saying, Where is the promise of his coming? for since the fathers fell asleep, all things continue as they were from the beginning of the creation* (2 Peter 3:4). The very spirit Ezekiel rebukes — *The vision that he seeth is for many days to come, and he prophesieth of the times that are far off* (Ezekiel 12:27) — is the last-days scoffer who mocks the deferred promise. The same deferring unbelief, then and at the end: pushing the word off to far-off days because it has not yet come.'),
    ('canon','ezekiel',12,27,'canon','2-peter',3,3,'free',
      E'*Knowing this first, that there shall come in the last days scoffers, walking after their own lusts* (2 Peter 3:3). Those who say *The vision... is for many days to come, and he prophesieth of the times that are far off* (Ezekiel 12:27) are the same kind Peter foretells — scoffers who defer the word to distance their own lusts from its reckoning. The far-off-times mockery of Ezekiel''s house is the scoffing of the last days.'),
    ('canon','ezekiel',12,28,'canon','2-peter',3,9,'free',
      E'*Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance* (2 Peter 3:9). Ezekiel''s oath answers the same charge of slackness — *There shall none of my words be prolonged any more, but the word which I have spoken shall be done* (Ezekiel 12:28). What looks like delay is longsuffering, not failure; the word is not slack — it shall be done.'),
    ('canon','ezekiel',12,22,'canon','matthew',24,48,'free',
      E'*But and if that evil servant shall say in his heart, My lord delayeth his coming* (Matthew 24:48). The proverb *The days are prolonged, and every vision faileth?* (Ezekiel 12:22) is the heart of the evil servant — counting on delay, presuming the word will not come. The Messiah names the same deferring presumption Ezekiel rebukes, and the lord comes *in a day when he looketh not for him* (Matt 24:50).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-12-eyes-to-see-and-see-not-the-rebellious-house',
       E'Eyes to see, and see not — the rebellious house, and the sign of the exile baggage',
       E'The word of Yahuah (LORD) sets the prophet against a house that will not look: *Son of Adam, thou dwellest in the midst of a rebellious house, which have eyes to see, and see not; they have ears to hear, and hear not: for they are a rebellious house* (12:2). To this blind house Yahuah gives a SIGN they cannot miss — the prophet packs his exile baggage by day, digs through the wall at even, bears it on his shoulder in the twilight, and covers his face: *prepare thee stuff for removing... thou shalt go forth at even in their sight, as they that go forth into captivity. Dig thou through the wall in their sight, and carry out thereby... thou shalt cover thy face, that thou see not the ground: for I have set thee for a sign unto the house of Yashar''el (Israel)* (12:3-6). The eyes-that-see-not is no new verdict. Moses named it at the covenant in Moab: *Yahuah (LORD) hath not given you an heart to perceive, and eyes to see, and ears to hear, unto this day* (Deuteronomy 29:4). Isaiah was commissioned into it: *Hear ye indeed, but understand not; and see ye indeed, but perceive not* (Isaiah 6:9), *shut their eyes; lest they see with their eyes, and hear with their ears, and understand with their heart, and convert, and be healed* (Isaiah 6:10). Jeremiah indicts the same people in the same words: *O foolish people, and without understanding; which have eyes, and see not; which have ears, and hear not* (Jeremiah 5:21). And the Formed Son names the SAME hardness as the reason he speaks in parables: *they seeing see not; and hearing they hear not, neither do they understand. And in them is fulfilled the prophecy of Esaias... this people''s heart is waxed gross, and their ears are dull of hearing, and their eyes they have closed; lest at any time they should see with their eyes... and should be converted, and I should heal them* (Matthew 13:13-15). One unbroken verdict from the wilderness to the Messiah: the blindness of the rebellious house is moral, a refusal to see — not the failure of the sign, but the hardness of the eye.',
       sv.verse_id, ev.verse_id, 'free', 32275
  FROM _s308_ezek12_lookup sv, _s308_ezek12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=12 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-12-the-prince-carried-to-babylon-yet-shall-he-not-see-it',
       E'The prince carried to Babylon — yet shall he not see it, though he shall die there',
       E'The sign is interpreted: *This burden concerneth the prince in Jerusalem, and all the house of Yashar''el (Israel) that are among them* (12:10). The prophecy is exact, and it lands on Zedekiah to the letter: *And the prince that is among them shall bear upon his shoulder in the twilight, and shall go forth: they shall dig through the wall to carry out thereby: he shall cover his face, that he see not the ground with his eyes. My net also will I spread upon him, and he shall be taken in my snare: and I will bring him to Babylon to the land of the Chaldeans; yet shall he not see it, though he shall die there* (12:12-13). Every clause came to pass. The flight by night through the breached wall: *the city was broken up, and all the men of war fled by night by the way of the gate between two walls... and the king went the way toward the plain* (2 Kings 25:4). The net and the snare, the capture, the blinding: *they slew the sons of Zedekiah before his eyes, and put out the eyes of Zedekiah, and bound him with fetters of brass, and carried him to Babylon* (2 Kings 25:7). Brought to Babylon, yet — being blinded first — he never SAW it. Jeremiah records the same: *he put out Zedekiah''s eyes, and bound him with chains, to carry him to Babylon* (Jeremiah 39:7); *and carried him to Babylon, and put him in prison till the day of his death* (Jeremiah 52:11) — so he died there, exactly as the word said. And after the prince, the scattering: *I will scatter toward every wind all that are about him... and they shall know that I am Yahuah (LORD), when I shall scatter them among the nations* (12:14-15). Not a vague oracle but a riddle answered down to the eyes and the grave — the word of Yahuah fulfilled to the letter.',
       sv.verse_id, ev.verse_id, 'free', 32278
  FROM _s308_ezek12_lookup sv, _s308_ezek12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=12 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=12 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-12-the-days-are-at-hand-none-of-my-words-deferred',
       E'The days are at hand — there shall none of my words be deferred any more',
       E'The chapter closes against the scoffers who treat prophecy as forever postponed. Yahuah (LORD) takes up their saying: *Son of Adam, what is that proverb that ye have in the land of Yashar''el (Israel), saying, The days are prolonged, and every vision faileth?* (12:22). He swears to end it: *I will make this proverb to cease... but say unto them, The days are at hand, and the effect of every vision* (12:23); *For I am Yahuah (LORD): I will speak, and the word that I shall speak shall come to pass; it shall be no more prolonged* (12:25). And against those who push the word off to distant days — *The vision that he seeth is for many days to come, and he prophesieth of the times that are far off* (12:27) — the final oath: *There shall none of my words be prolonged any more, but the word which I have spoken shall be done, saith Adonai Yahuah (the Lord GOD)* (12:28). Habakkuk gives the same answer to the same impatience: *the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry* (Habakkuk 2:3). And the deferring scoffer of Ezekiel''s day is the deferring scoffer of the last days. Peter foretells them word for word: *there shall come in the last days scoffers, walking after their own lusts, And saying, Where is the promise of his coming? for since the fathers fell asleep, all things continue as they were from the beginning of the creation* (2 Peter 3:3-4) — yet *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish* (2 Peter 3:9). The Messiah names the same presumption in the evil servant: *My lord delayeth his coming* (Matthew 24:48) — and the lord comes in an hour he is not aware of. What looks like delay is longsuffering, never failure; the word is not deferred — it shall be done.',
       sv.verse_id, ev.verse_id, 'free', 32281
  FROM _s308_ezek12_lookup sv, _s308_ezek12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=12 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=12 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Hear ye indeed, but understand not; and see ye indeed, but perceive not* (Isaiah 6:9) — the rebellious house of Ezekiel 12:2 is the people Isaiah was sent into; eyes that look and perceive not.'
  FROM cross_reference_threads t
  JOIN _s308_ezek12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=12 AND sv.verse_number=2
  JOIN _s308_ezek12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-12-eyes-to-see-and-see-not-the-rebellious-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *shut their eyes; lest they see with their eyes... and convert, and be healed* (Isaiah 6:10) — the shut eye is the rebellious heart of Ezekiel 12:2; the sign is given to a house that will not look.'
  FROM cross_reference_threads t
  JOIN _s308_ezek12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=12 AND sv.verse_number=2
  JOIN _s308_ezek12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-12-eyes-to-see-and-see-not-the-rebellious-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *which have eyes, and see not; which have ears, and hear not* (Jeremiah 5:21) — Jeremiah names the same indictment in the same words as Ezekiel 12:2; one verdict on the rebellious house.'
  FROM cross_reference_threads t
  JOIN _s308_ezek12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=12 AND sv.verse_number=2
  JOIN _s308_ezek12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=5 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-12-eyes-to-see-and-see-not-the-rebellious-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Yahuah (LORD) hath not given you an heart to perceive, and eyes to see, and ears to hear, unto this day* (Deuteronomy 29:4) — Moses named the eyes-that-see-not at the covenant in Moab; the verdict reaches back to the wilderness.'
  FROM cross_reference_threads t
  JOIN _s308_ezek12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=12 AND sv.verse_number=2
  JOIN _s308_ezek12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-12-eyes-to-see-and-see-not-the-rebellious-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *they seeing see not; and hearing they hear not, neither do they understand* (Matthew 13:13) — the Formed Son names the SAME hardness of Ezekiel 12:2 as why he speaks in parables.'
  FROM cross_reference_threads t
  JOIN _s308_ezek12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=12 AND sv.verse_number=2
  JOIN _s308_ezek12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-12-eyes-to-see-and-see-not-the-rebellious-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*By hearing ye shall hear, and shall not understand; and seeing ye shall see, and shall not perceive* (Matthew 13:14) — the Messiah quotes Isaiah 6:9 of his own generation, the same seeing-that-perceives-not Ezekiel''s house carried.'
  FROM cross_reference_threads t
  JOIN _s308_ezek12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=12 AND sv.verse_number=2
  JOIN _s308_ezek12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-12-eyes-to-see-and-see-not-the-rebellious-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*their eyes they have closed; lest at any time they should see... and should be converted, and I should heal them* (Matthew 13:15) — the closed eye of Ezekiel 12:2 is the gross heart the Messiah names; the verdict of Isaiah 6 and Ezekiel 12 made one.'
  FROM cross_reference_threads t
  JOIN _s308_ezek12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=12 AND sv.verse_number=2
  JOIN _s308_ezek12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-12-eyes-to-see-and-see-not-the-rebellious-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *put out the eyes of Zedekiah, and bound him with fetters of brass, and carried him to Babylon* (2 Kings 25:7) — solved to the letter: brought to Babylon yet, being blinded, he never SAW it (Ezekiel 12:13).'
  FROM cross_reference_threads t
  JOIN _s308_ezek12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=12 AND sv.verse_number=13
  JOIN _s308_ezek12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=25 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-12-the-prince-carried-to-babylon-yet-shall-he-not-see-it'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *all the men of war fled by night by the way of the gate between two walls* (2 Kings 25:4) — the prince who *shall bear upon his shoulder in the twilight, and shall go forth* (Ezekiel 12:12) is Zedekiah''s flight by night through the breach.'
  FROM cross_reference_threads t
  JOIN _s308_ezek12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=12 AND sv.verse_number=12
  JOIN _s308_ezek12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=25 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-12-the-prince-carried-to-babylon-yet-shall-he-not-see-it'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *carried him to Babylon, and put him in prison till the day of his death* (Jeremiah 52:11) — *yet shall he not see it, though he shall die there* (Ezekiel 12:13): blinded, so unseeing; imprisoned, so he died there.'
  FROM cross_reference_threads t
  JOIN _s308_ezek12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=12 AND sv.verse_number=13
  JOIN _s308_ezek12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=52 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-12-the-prince-carried-to-babylon-yet-shall-he-not-see-it'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *he put out Zedekiah''s eyes, and bound him with chains, to carry him to Babylon* (Jeremiah 39:7) — Jeremiah seals the snare-and-net of Ezekiel 12:13; the prince taken, blinded, carried to a Babylon his eyes would never behold.'
  FROM cross_reference_threads t
  JOIN _s308_ezek12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=12 AND sv.verse_number=13
  JOIN _s308_ezek12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=39 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-12-the-prince-carried-to-babylon-yet-shall-he-not-see-it'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the vision is yet for an appointed time... though it tarry, wait for it; because it will surely come* (Habakkuk 2:3) — the same answer to the same impatience as Ezekiel 12:22; the word does not fail, it waits for its hour.'
  FROM cross_reference_threads t
  JOIN _s308_ezek12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=12 AND sv.verse_number=22
  JOIN _s308_ezek12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-12-the-days-are-at-hand-none-of-my-words-deferred'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Where is the promise of his coming? for since the fathers fell asleep, all things continue as they were* (2 Peter 3:4) — the last-days scoffer is the far-off-times mocker of Ezekiel 12:27; the same deferring unbelief.'
  FROM cross_reference_threads t
  JOIN _s308_ezek12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=12 AND sv.verse_number=27
  JOIN _s308_ezek12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-12-the-days-are-at-hand-none-of-my-words-deferred'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *there shall come in the last days scoffers, walking after their own lusts* (2 Peter 3:3) — those who say the vision is *for the times that are far off* (Ezekiel 12:27) are the same scoffers Peter foretells.'
  FROM cross_reference_threads t
  JOIN _s308_ezek12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=12 AND sv.verse_number=27
  JOIN _s308_ezek12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-12-the-days-are-at-hand-none-of-my-words-deferred'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *Yahuah (Lord) is not slack concerning his promise... but is longsuffering* (2 Peter 3:9) — answers the same charge as Ezekiel 12:28: what looks like delay is longsuffering, not failure; the word shall be done.'
  FROM cross_reference_threads t
  JOIN _s308_ezek12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=12 AND sv.verse_number=28
  JOIN _s308_ezek12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-12-the-days-are-at-hand-none-of-my-words-deferred'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *that evil servant shall say in his heart, My lord delayeth his coming* (Matthew 24:48) — the proverb of Ezekiel 12:22 is the heart of the evil servant, counting on delay; the lord comes in an hour he is not aware of.'
  FROM cross_reference_threads t
  JOIN _s308_ezek12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=12 AND sv.verse_number=22
  JOIN _s308_ezek12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=48
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-12-the-days-are-at-hand-none-of-my-words-deferred'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezekiel_13.sql (Ezekiel 13) -----
-- Chapter: Ezekiel 13 — ★★ AGAINST THE FALSE PROPHETS. Woe unto the foolish prophets that
-- prophesy out of their own hearts and have seen nothing; they have seen vanity and lying
-- divination, saying Yahuah saith — and Yahuah hath NOT sent them. They have seduced my people,
-- saying Peace; and there was no peace; the whitewashed wall of false assurance daubed with
-- untempered morter — Yahuah will break it down. And the women that sew pillows to all armholes
-- to hunt souls, who make the heart of the righteous sad and strengthen the hands of the wicked.
-- The measuring line of Isaiah 8:20 (to the Torah and to the testimony) tried against the prophet
-- not sent; the anti-antinomian guard standing over false comfort and soul-hunting witchcraft.
-- Tag: ezek13   Temp view: _s308_ezek13_lookup   Session: s308
-- Sort band: base 32300, step 3 -> threads at 32300, 32303, 32306 (3 threads)
-- Source of EVERY row: 'canon','ezekiel',13,v
--
-- Ezekiel 13 coverage:
--   ★★ v.1-7 (prophesy against the prophets that prophesy OUT OF THEIR OWN HEARTS; Woe unto the
--          foolish prophets that follow their own spirit, and have seen nothing; they have seen
--          vanity and lying divination, saying, Yahuah saith: and Yahuah hath NOT sent them)
--        NT:     ★★ Matthew 7:15 (Beware of false prophets... inwardly ravening wolves), ★★ 2 Peter
--                2:1 (false prophets... false teachers who privily bring in damnable heresies) — THREAD 1
--        Extras: none warranted (clean canon-NT-Tanakh false-prophet weave)
--        Tanakh: ★★ Jeremiah 23:16 (they speak a vision of their own heart, and not out of the mouth
--                of Yahuah), ★★ Jeremiah 23:21 (I have not sent these prophets, yet they ran),
--                ★★ Deuteronomy 18:20 (the prophet which shall presume to speak a word in my name...
--                even that prophet shall die), ★ Deuteronomy 18:22 (if the thing follow not... the
--                prophet hath spoken it presumptuously) — THREAD 1
--   ★★ v.10-16 (they have seduced my people, saying, Peace; and there was no peace; one built up a
--          wall, others daubed it with untempered morter; I will break down the wall... it shall fall;
--          which see visions of peace for her, and there is no peace)
--        NT:     ★★ 1 Thessalonians 5:3 (when they shall say, Peace and safety; then sudden
--                destruction cometh upon them), ★★ Matthew 7:26 (the foolish man which built his house
--                upon the sand), ★ Matthew 7:27 (the rain descended... and it fell: and great was the
--                fall of it), ★ Acts 23:3 (thou whited wall) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Jeremiah 6:14 (saying, Peace, peace; when there is no peace), ★ Jeremiah 8:11
--                (the same — they healed the hurt slightly, Peace, peace, no peace) — THREAD 2
--   ★ v.17-23 (the daughters of thy people which prophesy out of their own heart; Woe to the women
--          that sew pillows to all armholes... to hunt souls; Will ye hunt the souls of my people?;
--          with lies ye have made the heart of the righteous sad... and strengthened the hands of the
--          wicked, that he should not return... by promising him life)
--        NT:     ★ 2 Timothy 4:3 (they heap to themselves teachers, having itching ears) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★★ Jeremiah 23:14 (they strengthen also the hands of evildoers, that none doth
--                return from his wickedness), ★ Micah 3:5 (the prophets... that cry, Peace; and he
--                that putteth not into their mouths, they even prepare war against him) — THREAD 3
--   v.8-9 (Because ye have spoken vanity, and seen lies, behold, I am against you... they shall not
--          be in the assembly of my people, neither written in the writing of the house of Yashar''el)
--          — the verdict on the false prophets of v.1-7; woven into THREAD 1 prose; no separate add
--          (NT none warranted / Extras none / Tanakh held — the not-written-in-the-writing answered in
--          the false-prophet weave).
--
-- Threads (slug — target libraries):
--   1. ezekiel-13-the-foolish-prophets-that-follow-their-own-spirit — NT (Matthew 7, 2 Peter 2) + Tanakh (Jeremiah 23, Deuteronomy 18) [free]
--      (★★ the false prophets who speak from their own heart, NOT sent; the Torah test of the presumptuous prophet)
--   2. ezekiel-13-peace-when-there-was-no-peace-the-untempered-wall — NT (1 Thessalonians 5, Matthew 7, Acts 23) + Tanakh (Jeremiah 6, Jeremiah 8) [free]
--      (★★ the whitewashed wall of false assurance; Peace when no peace; the house on sand; the whited wall that falls)
--   3. ezekiel-13-the-women-that-hunt-souls-and-strengthen-the-wicked — NT (2 Timothy 4) + Tanakh (Jeremiah 23, Micah 3) [free]
--      (★ the prophetesses'' soul-hunting; the heart of the righteous made sad, the hands of the wicked strengthened)
--
-- Framing notes:
--   ★★ THE FOOLISH PROPHETS (THREAD 1): *prophesy against the prophets of Yashar''el (Israel) that
--      prophesy, and say thou unto them that prophesy out of their own hearts* (13:2); *Woe unto the
--      foolish prophets, that follow their own spirit, and have seen nothing!* (13:3); *They have seen
--      vanity and lying divination, saying, Yahuah (LORD) saith: and Yahuah (LORD) hath not sent them*
--      (13:6). The mark of the false prophet is the unsent word from the own heart. Jeremiah names the
--      same — *they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD)* (Jer
--      23:16); *I have not sent these prophets, yet they ran* (Jer 23:21). The Torah set the test: *the
--      prophet, which shall presume to speak a word in my name, which I have not commanded him to speak...
--      even that prophet shall die* (Deut 18:20), *if the thing follow not... the prophet hath spoken it
--      presumptuously* (Deut 18:22). The Formed Son warns: *Beware of false prophets, which come to you
--      in sheep''s clothing, but inwardly they are ravening wolves* (Matt 7:15); Peter foresees them
--      among the people — *there were false prophets also among the people, even as there shall be false
--      teachers among you* (2 Pet 2:1). The verdict: *they shall not be in the assembly of my people,
--      neither shall they be written in the writing of the house of Yashar''el (Israel)* (13:9).
--   ★★ PEACE WHEN THERE WAS NO PEACE (THREAD 2): *they have seduced my people, saying, Peace; and there
--      was no peace; and one built up a wall, and, lo, others daubed it with untempered morter* (13:10) —
--      the whitewashed wall of false assurance that cannot stand: *So will I break down the wall that ye
--      have daubed with untempered morter, and bring it down to the ground... and it shall fall* (13:14);
--      *which see visions of peace for her, and there is no peace* (13:16). Jeremiah cries the very words
--      twice — *saying, Peace, peace; when there is no peace* (Jer 6:14; Jer 8:11). Paul names the sudden
--      ruin of the false peace — *when they shall say, Peace and safety; then sudden destruction cometh
--      upon them* (1 Thess 5:3). The Formed Son draws the same falling wall as the house on sand — *the
--      rain descended, and the floods came, and the winds blew, and beat upon that house; and it fell:
--      and great was the fall of it* (Matt 7:26-27). And Paul names a daubed wall to its face — *Elohim
--      (God) shall smite thee, thou whited wall* (Acts 23:3). Untempered morter, false peace, a wall
--      built to fall.
--   ★ THE WOMEN THAT HUNT SOULS (THREAD 3): *Woe to the women that sew pillows to all armholes... to
--      hunt souls! Will ye hunt the souls of my people, and will ye save the souls alive that come unto
--      you?* (13:18); *with lies ye have made the heart of the righteous sad, whom I have not made sad;
--      and strengthened the hands of the wicked, that he should not return from his wicked way, by
--      promising him life* (13:22). The false comfort that hunts souls inverts Yahuah''s own measure —
--      grieving whom he has not grieved, comforting whom he has not comforted. Jeremiah names the same
--      strengthening of the wicked — *they strengthen also the hands of evildoers, that none doth return
--      from his wickedness* (Jer 23:14). Micah names the peace-criers who turn on whoever will not pay —
--      *the prophets... that cry, Peace; and he that putteth not into their mouths, they even prepare war
--      against him* (Micah 3:5). Paul foresees the itching-ears market for the same false comfort —
--      *they heap to themselves teachers, having itching ears* (2 Tim 4:3). Yahuah''s answer: *I will
--      deliver my people out of your hand* (13:23).
--   VERSES WITH NO SEPARATE ADD: v.4-5 (thy prophets are like foxes; ye have not gone up into the gaps —
--      the unfaithful watchman imagery; woven into THREAD 1 prose), v.8-9 (the verdict on the false
--      prophets — not written in the writing of the house; THREAD 1 prose), v.11-13 (the overflowing
--      shower, hailstones, stormy wind that rends the wall — THREAD 2 prose), v.19-21 (the handfuls of
--      barley, the pillows torn, the souls let go — THREAD 3 prose). All recorded; every block carries a
--      thread.

CREATE TEMP VIEW _s308_ezek13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): the foolish prophets that follow their own spirit — NOT sent
    ('canon','ezekiel',13,2,'canon','jeremiah',23,16,'free',
      E'*Thus saith Yahuah Tseva''ot (LORD of hosts), Hearken not unto the words of the prophets that prophesy unto you: they make you vain: they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD)* (Jeremiah 23:16). Jeremiah names the very fault Ezekiel rebukes — those *that prophesy out of their own hearts* (Ezekiel 13:2). The false prophet''s word rises from his own heart, *not out of the mouth of Yahuah (LORD)*; it makes the people vain, never sent.'),
    ('canon','ezekiel',13,6,'canon','jeremiah',23,21,'free',
      E'*I have not sent these prophets, yet they ran: I have not spoken to them, yet they prophesied* (Jeremiah 23:21). This is the exact charge of Ezekiel — *saying, Yahuah (LORD) saith: and Yahuah (LORD) hath not sent them* (Ezekiel 13:6). They ran unsent and spoke unbidden; the word in their mouth was never Yahuah''s. The unsent prophet is the heart of the false-prophet judgment in both books.'),
    ('canon','ezekiel',13,6,'canon','deuteronomy',18,20,'free',
      E'*But the prophet, which shall presume to speak a word in my name, which I have not commanded him to speak, or that shall speak in the name of other gods, even that prophet shall die* (Deuteronomy 18:20). The Torah set the sentence Ezekiel now executes — those who say *Yahuah (LORD) saith: and Yahuah (LORD) hath not sent them* (Ezekiel 13:6) are the prophets who *presume to speak a word in my name, which I have not commanded*. To speak unsent in the Name is a capital offence against the covenant; the false prophet stands already condemned by the Torah.'),
    ('canon','ezekiel',13,7,'canon','deuteronomy',18,22,'free',
      E'*When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken, but the prophet hath spoken it presumptuously: thou shalt not be afraid of him* (Deuteronomy 18:22). The Torah''s test exposes Ezekiel''s liars — *Have ye not seen a vain vision, and have ye not spoken a lying divination, whereas ye say, Yahuah (LORD) saith it; albeit I have not spoken?* (Ezekiel 13:7). The vain vision is the word Yahuah never spoke; the test is whether the word stands — and theirs is *spoken presumptuously*.'),
    ('canon','ezekiel',13,3,'canon','matthew',7,15,'free',
      E'*Beware of false prophets, which come to you in sheep''s clothing, but inwardly they are ravening wolves* (Matthew 7:15). The Formed Son warns of the very figures Ezekiel names — *the foolish prophets, that follow their own spirit, and have seen nothing!* (Ezekiel 13:3). The sheep''s clothing is the borrowed *Yahuah (LORD) saith*; inwardly they are wolves who follow their own spirit and feed on the flock.'),
    ('canon','ezekiel',13,3,'canon','2-peter',2,1,'free',
      E'*But there were false prophets also among the people, even as there shall be false teachers among you, who privily shall bring in damnable heresies, even denying Yahuah (Lord) that bought them, and bring upon themselves swift destruction* (2 Peter 2:1). Peter reads the false prophets straight out of Ezekiel''s frame — *the foolish prophets, that follow their own spirit, and have seen nothing!* (Ezekiel 13:3) — and names their heirs, the false teachers who creep in. The unsent prophet of Ezekiel''s day is the false teacher of the last days; both bring swift destruction on themselves.'),

    -- THREAD 2 (★★): Peace, and there was no peace — the untempered wall that falls
    ('canon','ezekiel',13,10,'canon','jeremiah',6,14,'free',
      E'*They have healed also the hurt of the daughter of my people slightly, saying, Peace, peace; when there is no peace* (Jeremiah 6:14). Jeremiah cries the very seduction Ezekiel exposes — *they have seduced my people, saying, Peace; and there was no peace* (Ezekiel 13:10). The slight healing and the false *Peace, peace* are the untempered morter daubed over the breach; the wound is covered, never closed.'),
    ('canon','ezekiel',13,10,'canon','jeremiah',8,11,'free',
      E'*For they have healed the hurt of the daughter of my people slightly, saying, Peace, peace; when there is no peace* (Jeremiah 8:11). Jeremiah repeats the cry — the false prophets *saying, Peace, peace; when there is no peace* — the same lie Ezekiel calls the wall daubed *with untempered morter* (Ezekiel 13:10). Twice spoken because the deceit is the signature sin of the unsent prophet: a peace declared where Yahuah declares none.'),
    ('canon','ezekiel',13,16,'canon','1-thessalonians',5,3,'free',
      E'*For when they shall say, Peace and safety; then sudden destruction cometh upon them, as travail upon a woman with child; and they shall not escape* (1 Thessalonians 5:3). Paul names the end of the false peace Ezekiel''s prophets proclaim — those *which see visions of peace for her, and there is no peace* (Ezekiel 13:16). The cry of *Peace and safety* is the daubed wall standing tall the moment before the stormy wind rends it; sudden destruction follows the false assurance.'),
    ('canon','ezekiel',13,14,'canon','matthew',7,26,'free',
      E'*And every one that heareth these sayings of mine, and doeth them not, shall be likened unto a foolish man, which built his house upon the sand* (Matthew 7:26). The Formed Son draws Ezekiel''s falling wall as the house on sand — *So will I break down the wall that ye have daubed with untempered morter, and bring it down to the ground... and it shall fall* (Ezekiel 13:14). The wall daubed without foundation and the house built without rock are the same false security; both are built to fall.'),
    ('canon','ezekiel',13,14,'canon','matthew',7,27,'free',
      E'*And the rain descended, and the floods came, and the winds blew, and beat upon that house; and it fell: and great was the fall of it* (Matthew 7:27). The storm that takes the sand-built house is the storm Yahuah sends against the daubed wall — *I will even rend it with a stormy wind in my fury; and there shall be an overflowing shower in mine anger, and great hailstones* (Ezekiel 13:13), *and it shall fall* (Ezekiel 13:14). Overflowing shower, stormy wind, hailstones, floods and rain and wind: the false wall and the false house meet the same fall, and great is the fall of it.'),
    ('canon','ezekiel',13,10,'canon','acts',23,3,'free',
      E'*Then said Paul unto him, Elohim (God) shall smite thee, thou whited wall: for sittest thou to judge me after the law, and commandest me to be smitten contrary to the law?* (Acts 23:3). Paul names a man to his face with Ezekiel''s very image — *thou whited wall* — the wall daubed fair on the outside, hollow within: *one built up a wall, and, lo, others daubed it with untempered morter* (Ezekiel 13:10). The whitewash hides corruption; Elohim smites the daubed wall whether it be a man or a false peace.'),

    -- THREAD 3 (★): the women that hunt souls — sad the righteous, strengthen the wicked
    ('canon','ezekiel',13,22,'canon','jeremiah',23,14,'free',
      E'*I have seen also in the prophets of Jerusalem an horrible thing: they commit adultery, and walk in lies: they strengthen also the hands of evildoers, that none doth return from his wickedness* (Jeremiah 23:14). Jeremiah names the very crime of Ezekiel''s soul-hunters — *strengthened the hands of the wicked, that he should not return from his wicked way, by promising him life* (Ezekiel 13:22). The false comfort holds the wicked in his wickedness by promising him peace; it shuts the door of return that Yahuah opened.'),
    ('canon','ezekiel',13,18,'canon','micah',3,5,'free',
      E'*Thus saith Yahuah (LORD) concerning the prophets that make my people err, that bite with their teeth, and cry, Peace; and he that putteth not into their mouths, they even prepare war against him* (Micah 3:5). Micah names the same mercenary soul-hunting Ezekiel rebukes — the women who hunt souls *for handfuls of barley and for pieces of bread* (Ezekiel 13:19; 13:18). The prophet who cries *Peace* for pay and turns on whoever will not feed him is the soul-hunter who sells comfort and lies; the price is bread, the merchandise is souls.'),
    ('canon','ezekiel',13,22,'canon','2-timothy',4,3,'free',
      E'*For the time will come when they will not endure sound doctrine; but after their own lusts shall they heap to themselves teachers, having itching ears* (2 Timothy 4:3). Paul foresees the market for the false comfort Ezekiel exposes — the women who *made the heart of the righteous sad... and strengthened the hands of the wicked... by promising him life* (Ezekiel 13:22). Itching ears heap up teachers who will *promise life*, soothing the wicked and grieving none; the soul-hunters and their hearers deserve each other.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-13-the-foolish-prophets-that-follow-their-own-spirit',
       E'Woe unto the foolish prophets that follow their own spirit — Yahuah hath not sent them',
       E'The word comes against the men who speak for Yahuah without being sent: *Son of Adam, prophesy against the prophets of Yashar''el (Israel) that prophesy, and say thou unto them that prophesy out of their own hearts, Hear ye the word of Yahuah (LORD)* (13:2); *Thus saith Adonai Yahuah (the Lord GOD); Woe unto the foolish prophets, that follow their own spirit, and have seen nothing!* (13:3). They are watchmen who never manned the breach — *Ye have not gone up into the gaps, neither made up the hedge for the house of Yashar''el (Israel) to stand in the battle in the day of Yahuah (LORD)* (13:5) — and their oracle is fabricated: *They have seen vanity and lying divination, saying, Yahuah (LORD) saith: and Yahuah (LORD) hath not sent them* (13:6), *whereas ye say, Yahuah (LORD) saith it; albeit I have not spoken?* (13:7). The mark of the false prophet is the unsent word drawn from the own heart. Jeremiah names it in the same words: *they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD)* (Jeremiah 23:16); *I have not sent these prophets, yet they ran: I have not spoken to them, yet they prophesied* (Jeremiah 23:21). The Torah set the sentence long before: *the prophet, which shall presume to speak a word in my name, which I have not commanded him to speak... even that prophet shall die* (Deuteronomy 18:20), and the test by which he is known — *if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken, but the prophet hath spoken it presumptuously* (Deuteronomy 18:22). The Formed Son carries the warning forward: *Beware of false prophets, which come to you in sheep''s clothing, but inwardly they are ravening wolves* (Matthew 7:15); and Peter names their heirs: *there were false prophets also among the people, even as there shall be false teachers among you, who privily shall bring in damnable heresies* (2 Peter 2:1). The verdict on them all is the same — *they shall not be in the assembly of my people, neither shall they be written in the writing of the house of Yashar''el (Israel)* (13:9).',
       sv.verse_id, ev.verse_id, 'free', 32300
  FROM _s308_ezek13_lookup sv, _s308_ezek13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=13 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-13-peace-when-there-was-no-peace-the-untempered-wall',
       E'Peace, and there was no peace — the wall daubed with untempered morter shall fall',
       E'The lie of the false prophets takes a shape: a wall whitewashed to look sound. *Because, even because they have seduced my people, saying, Peace; and there was no peace; and one built up a wall, and, lo, others daubed it with untempered morter* (13:10). The daubing is the false comfort smeared over a breach that was never repaired. Yahuah will test it with the storm: *there shall be an overflowing shower; and ye, O great hailstones, shall fall; and a stormy wind shall rend it* (13:11), *So will I break down the wall that ye have daubed with untempered morter, and bring it down to the ground, so that the foundation thereof shall be discovered, and it shall fall* (13:14) — and the verdict on the peace-prophets: *the prophets of Yashar''el (Israel) which prophesy concerning Jerusalem, and which see visions of peace for her, and there is no peace* (13:16). Jeremiah cries the very lie twice — *saying, Peace, peace; when there is no peace* (Jeremiah 6:14; Jeremiah 8:11) — the slight healing that covers the wound without closing it. Paul names where the false peace ends: *when they shall say, Peace and safety; then sudden destruction cometh upon them, as travail upon a woman with child; and they shall not escape* (1 Thessalonians 5:3). The Formed Son draws the same collapsing structure as the house on sand: *every one that heareth these sayings of mine, and doeth them not, shall be likened unto a foolish man, which built his house upon the sand: And the rain descended, and the floods came, and the winds blew, and beat upon that house; and it fell: and great was the fall of it* (Matthew 7:26-27) — the storm that rends the daubed wall and the storm that beats down the sand-built house are one. And Paul names a man to his face with Ezekiel''s image: *Elohim (God) shall smite thee, thou whited wall* (Acts 23:3) — fair without, hollow within. Untempered morter and a false *Peace*: a wall built to fall.',
       sv.verse_id, ev.verse_id, 'free', 32303
  FROM _s308_ezek13_lookup sv, _s308_ezek13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=13 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=13 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-13-the-women-that-hunt-souls-and-strengthen-the-wicked',
       E'The women that sew pillows to hunt souls — sad the righteous, strengthen the wicked',
       E'The word turns to the prophetesses who deal the same false comfort. *Likewise, thou son of Adam, set thy face against the daughters of thy people, which prophesy out of their own heart* (13:17); *Woe to the women that sew pillows to all armholes, and make kerchiefs upon the head of every stature to hunt souls! Will ye hunt the souls of my people, and will ye save the souls alive that come unto you?* (13:18). Their trade is soul-hunting witchcraft sold for scraps — *will ye pollute me among my people for handfuls of barley and for pieces of bread, to slay the souls that should not die, and to save the souls alive that should not live, by your lying to my people that hear your lies?* (13:19). And the deepest charge is the inversion of Yahuah''s own measure: *with lies ye have made the heart of the righteous sad, whom I have not made sad; and strengthened the hands of the wicked, that he should not return from his wicked way, by promising him life* (13:22). They grieve whom Yahuah comforts and comfort whom Yahuah warns; by *promising him life* they shut the door of repentance the warning would have opened. Jeremiah names the same crime among the prophets of Jerusalem — *they strengthen also the hands of evildoers, that none doth return from his wickedness* (Jeremiah 23:14). Micah names the mercenary edge — *the prophets... that bite with their teeth, and cry, Peace; and he that putteth not into their mouths, they even prepare war against him* (Micah 3:5): comfort for pay, war on whoever will not feed them. Paul foresees the itching-ears market for the same false promise — *they will not endure sound doctrine; but after their own lusts shall they heap to themselves teachers, having itching ears* (2 Timothy 4:3). Yahuah''s answer breaks the snare: *I will tear them from your arms, and will let the souls go* (13:20), *and deliver my people out of your hand... and ye shall know that I am Yahuah (LORD)* (13:21,23).',
       sv.verse_id, ev.verse_id, 'free', 32306
  FROM _s308_ezek13_lookup sv, _s308_ezek13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=13 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=13 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD)* (Jeremiah 23:16) — Jeremiah names the very fault of Ezekiel 13:2, the word from the own heart.'
  FROM cross_reference_threads t
  JOIN _s308_ezek13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=13 AND sv.verse_number=2
  JOIN _s308_ezek13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-13-the-foolish-prophets-that-follow-their-own-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I have not sent these prophets, yet they ran* (Jeremiah 23:21) — the exact charge of Ezekiel 13:6: ran unsent, spoke unbidden.'
  FROM cross_reference_threads t
  JOIN _s308_ezek13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=13 AND sv.verse_number=6
  JOIN _s308_ezek13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-13-the-foolish-prophets-that-follow-their-own-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *the prophet, which shall presume to speak a word in my name, which I have not commanded him to speak... even that prophet shall die* (Deuteronomy 18:20) — the Torah''s sentence on the unsent prophet of Ezekiel 13:6.'
  FROM cross_reference_threads t
  JOIN _s308_ezek13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=13 AND sv.verse_number=6
  JOIN _s308_ezek13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-13-the-foolish-prophets-that-follow-their-own-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *if the thing follow not... the prophet hath spoken it presumptuously* (Deuteronomy 18:22) — the Torah''s test exposes the vain vision of Ezekiel 13:7.'
  FROM cross_reference_threads t
  JOIN _s308_ezek13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=13 AND sv.verse_number=7
  JOIN _s308_ezek13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-13-the-foolish-prophets-that-follow-their-own-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *Beware of false prophets, which come to you in sheep''s clothing, but inwardly they are ravening wolves* (Matthew 7:15) — the Formed Son names the foolish prophets of Ezekiel 13:3; sheep''s clothing over a wolf.'
  FROM cross_reference_threads t
  JOIN _s308_ezek13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=13 AND sv.verse_number=3
  JOIN _s308_ezek13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-13-the-foolish-prophets-that-follow-their-own-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *there were false prophets also among the people, even as there shall be false teachers among you* (2 Peter 2:1) — Peter names the heirs of Ezekiel 13:3''s unsent prophets.'
  FROM cross_reference_threads t
  JOIN _s308_ezek13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=13 AND sv.verse_number=3
  JOIN _s308_ezek13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-13-the-foolish-prophets-that-follow-their-own-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *saying, Peace, peace; when there is no peace* (Jeremiah 6:14) — Jeremiah cries the very seduction of Ezekiel 13:10; the slight healing daubed over the breach.'
  FROM cross_reference_threads t
  JOIN _s308_ezek13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=13 AND sv.verse_number=10
  JOIN _s308_ezek13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=6 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-13-peace-when-there-was-no-peace-the-untempered-wall'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *saying, Peace, peace; when there is no peace* (Jeremiah 8:11) — Jeremiah repeats the lie; the same false peace Ezekiel 13:10 calls untempered morter.'
  FROM cross_reference_threads t
  JOIN _s308_ezek13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=13 AND sv.verse_number=10
  JOIN _s308_ezek13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=8 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-13-peace-when-there-was-no-peace-the-untempered-wall'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *when they shall say, Peace and safety; then sudden destruction cometh upon them* (1 Thessalonians 5:3) — Paul names the end of the false peace of Ezekiel 13:16.'
  FROM cross_reference_threads t
  JOIN _s308_ezek13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=13 AND sv.verse_number=16
  JOIN _s308_ezek13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-13-peace-when-there-was-no-peace-the-untempered-wall'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *a foolish man, which built his house upon the sand* (Matthew 7:26) — the Formed Son''s house on sand is Ezekiel 13:14''s wall daubed without foundation.'
  FROM cross_reference_threads t
  JOIN _s308_ezek13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s308_ezek13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-13-peace-when-there-was-no-peace-the-untempered-wall'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *the rain descended, and the floods came, and the winds blew... and it fell: and great was the fall of it* (Matthew 7:27) — the storm that takes the sand-house is the stormy wind and hail that rend the wall (Ezekiel 13:13-14).'
  FROM cross_reference_threads t
  JOIN _s308_ezek13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s308_ezek13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-13-peace-when-there-was-no-peace-the-untempered-wall'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Elohim (God) shall smite thee, thou whited wall* (Acts 23:3) — Paul names a man with Ezekiel 13:10''s image: fair without, hollow within, daubed with untempered morter.'
  FROM cross_reference_threads t
  JOIN _s308_ezek13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=13 AND sv.verse_number=10
  JOIN _s308_ezek13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=23 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-13-peace-when-there-was-no-peace-the-untempered-wall'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *they strengthen also the hands of evildoers, that none doth return from his wickedness* (Jeremiah 23:14) — Jeremiah names the crime of Ezekiel 13:22: holding the wicked in his wickedness.'
  FROM cross_reference_threads t
  JOIN _s308_ezek13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=13 AND sv.verse_number=22
  JOIN _s308_ezek13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-13-the-women-that-hunt-souls-and-strengthen-the-wicked'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the prophets... that cry, Peace; and he that putteth not into their mouths, they even prepare war against him* (Micah 3:5) — the mercenary soul-hunting of Ezekiel 13:18-19: comfort for pay.'
  FROM cross_reference_threads t
  JOIN _s308_ezek13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=13 AND sv.verse_number=18
  JOIN _s308_ezek13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-13-the-women-that-hunt-souls-and-strengthen-the-wicked'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *they heap to themselves teachers, having itching ears* (2 Timothy 4:3) — Paul foresees the market for Ezekiel 13:22''s false comfort that promises the wicked life.'
  FROM cross_reference_threads t
  JOIN _s308_ezek13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=13 AND sv.verse_number=22
  JOIN _s308_ezek13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-13-the-women-that-hunt-souls-and-strengthen-the-wicked'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezekiel_14.sql (Ezekiel 14) -----
-- Chapter: Ezekiel 14 — the elders of Yashar''el (Israel) come to enquire while their idols are set up
-- in their HEART and the stumblingblock of their iniquity is before their face; Yahuah (LORD) answers
-- the double-minded ACCORDING to the multitude of their idols, to take the house in their own heart.
-- THE THREE PARAGONS: *Though these three men, Noah, Daniel, and Job, were in it, they should deliver
-- but their own souls by their righteousness* — righteousness is personal, never transferable; even the
-- three could save only themselves (the one exception the whole canon points to is the Messiah, framed
-- in prose, Isaiah 53). The FOUR SORE JUDGMENTS — sword, famine, noisome beast, pestilence — and the
-- preserved REMNANT that justifies Yahuah''s dealings.
-- Tag: ezek14   Temp view: _s308_ezek14_lookup
-- Sort band: base 32325, step 3 -> threads at 32325, 32328, 32331 (3 threads)
-- Source of EVERY row: 'canon','ezekiel',14,v
--
-- Ezekiel 14 coverage:
--   ★★ v.1-8 (certain of the elders... sat before me; these men have set up their IDOLS IN THEIR HEART,
--          and put the stumblingblock of their iniquity before their face; I Yahuah will ANSWER him that
--          cometh according to the MULTITUDE of his idols; that I may take the house in their own heart)
--        NT:     ★★ James 4:8 (purify your hearts, ye double minded), ★ Matthew 6:24 (no man can serve
--                two masters... ye cannot serve Elohim and mammon), ★ 1 John 5:21 (little children, keep
--                yourselves from idols) — THREAD 1
--        Extras: none warranted (clean canon-NT weave; the idols-of-the-heart frame)
--        Tanakh: ★ Isaiah 1:15 (when ye make many prayers, I will not hear: your hands are full of
--                blood — prayer refused while the heart is defiled) — THREAD 1
--   v.9-11 (if the prophet be deceived, I Yahuah have deceived that prophet... that the house may go no
--          more astray, but that they may be my people, and I their Elohim) — the covenant-formula close
--          to the idolatry oracle; woven into THREAD 1 prose; no separate add (NT none / Extras none /
--          Tanakh none warranted distinct — the my-people/their-Elohim refrain held in the Ezek-37 weave).
--   ★★★ v.12-20 (the land sinneth grievously; break the staff of bread, send famine; THOUGH THESE THREE
--          MEN, NOAH, DANIEL, AND JOB, were in it, they should deliver but THEIR OWN SOULS by their
--          righteousness; they shall deliver neither sons nor daughters; THEY ONLY shall be delivered)
--        NT:     ★★ Romans 14:12 (every one of us shall give account of himself to Elohim), ★ Philippians
--                2:12 (work out YOUR OWN salvation with fear and trembling) — THREAD 2
--        Extras: none warranted (the three are canon witnesses — Noah Gen 7, Job Job 1; Daniel a
--                contemporary; no extra-canonical member forced)
--        Tanakh: ★★ Ezekiel 18:20 (the soul that sinneth, it shall die... the righteousness of the
--                righteous shall be upon HIM), ★★ Jeremiah 15:1 (though Moses and Samuel stood before me,
--                yet my mind could not be toward this people), ★ Genesis 7:23 (Noah only remained alive),
--                ★ Job 1:1 (that man was perfect and upright, one that feared Elohim) — THREAD 2
--   ★ v.21-23 (my FOUR SORE JUDGMENTS upon Jerusalem, the sword, and the famine, and the noisome beast,
--          and the pestilence; YET, behold, therein shall be left a REMNANT... ye shall be comforted...
--          ye shall know that I have not done without cause all that I have done)
--        NT:     ★ Revelation 6:8 (power... to kill with sword, and with hunger, and with death, and with
--                the beasts of the earth — the four) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★★ Leviticus 26:25-26 (I will bring a sword... I will send the pestilence... I have
--                broken the staff of your bread), ★ Ezekiel 5:17 (famine and evil beasts... pestilence
--                and blood... I will bring the sword upon thee) — THREAD 3
--
-- Threads (slug — target libraries):
--   1. ezekiel-14-the-idols-set-up-in-their-heart — NT (James 4, Matthew 6, 1 John 5) + Tanakh (Isaiah 1) [free]
--      (★★ the idols of the heart that defile worship; Yahuah answers the double-minded according to their idols)
--   2. ezekiel-14-noah-daniel-and-job-deliver-but-their-own-souls — NT (Romans 14, Philippians 2) + Tanakh (Ezekiel 18, Jeremiah 15, Genesis 7, Job 1) [free]
--      (★★★ righteousness is personal, never transferable; even the three paragons save only themselves; the one
--       exception the whole canon points to — the Messiah''s righteousness given to others, Isaiah 53 — framed in prose)
--   3. ezekiel-14-my-four-sore-judgments-and-the-remnant-left — NT (Revelation 6) + Tanakh (Leviticus 26, Ezekiel 5) [free]
--      (★ the four sore judgments — sword, famine, noisome beast, pestilence — and the preserved remnant that justifies Yahuah)
--
-- Framing notes:
--   ★★ THE IDOLS OF THE HEART (THREAD 1): the elders come to enquire of Yahuah while their hearts are full
--      of idols — *these men have set up their idols in their heart, and put the stumblingblock of their
--      iniquity before their face: should I be enquired of at all by them?* (14:3). Yahuah''s answer is
--      terrible: *I Yahuah (LORD) will answer him that cometh according to the multitude of his idols; That
--      I may take the house of Yashar''el (Israel) in their own heart* (14:4-5) — he answers the
--      double-minded by their own idols, to expose and take them. James names the cure: *Cleanse your
--      hands, ye sinners; and purify your hearts, ye double minded* (Jas 4:8); the Formed Son names the
--      impossibility of the divided heart: *No man can serve two masters... Ye cannot serve Elohim (God)
--      and mammon* (Matt 6:24); John''s last word: *Little children, keep yourselves from idols* (1 John
--      5:21); and Isaiah — prayer refused while the heart is defiled: *when ye make many prayers, I will
--      not hear: your hands are full of blood* (Isa 1:15). The enquiry of a heart full of idols is no
--      worship at all.
--   ★★★ NOAH, DANIEL, AND JOB — PERSONAL RIGHTEOUSNESS (THREAD 2): *Though these three men, Noah, Daniel,
--      and Job, were in it, they should deliver but their own souls by their righteousness* (14:14); *they
--      shall deliver neither sons nor daughters; they only shall be delivered* (14:16); *they shall but
--      deliver their own souls by their righteousness* (14:20). The most righteous men the canon knows —
--      Noah, the only one found righteous before the Flood (*Noah only remained alive*, Gen 7:23); Job,
--      *perfect and upright, and one that feared Elohim (God)* (Job 1:1); Daniel, the faithful exile — could
--      not transfer their righteousness even to their own children. The same prophet states the law of it:
--      *The soul that sinneth, it shall die... the righteousness of the righteous shall be upon him* (Ezek
--      18:20) — upon HIM, not lent out. Jeremiah hears the same verdict: *Though Moses and Samuel stood
--      before me, yet my mind could not be toward this people* (Jer 15:1). And the New Testament keeps the
--      personal frame: *every one of us shall give account of himself to Elohim (God)* (Rom 14:12); *work
--      out your own salvation with fear and trembling* (Phil 2:12). THE ONE EXCEPTION the whole canon points
--      to: only the Messiah''s righteousness is ever given to others — the righteous Servant who *shall
--      justify many; for he shall bear their iniquities* (Isaiah 53:11). No paragon, only the Suffering
--      Servant, can deliver a soul not his own.
--   ★ THE FOUR SORE JUDGMENTS AND THE REMNANT (THREAD 3): *How much more when I send my four sore judgments
--      upon Jerusalem, the sword, and the famine, and the noisome beast, and the pestilence, to cut off
--      from it man and beast?* (14:21). The same four are the covenant-curses of Leviticus 26 — *I will
--      bring a sword upon you... I will send the pestilence... I have broken the staff of your bread* (Lev
--      26:25-26) — and the four Ezekiel already named: *famine and evil beasts... and pestilence and blood...
--      and I will bring the sword upon thee* (Ezek 5:17). John sees the four ride out at the fourth seal:
--      *power was given unto them over the fourth part of the earth, to kill with sword, and with hunger,
--      and with death, and with the beasts of the earth* (Rev 6:8). Yet the chapter ends in mercy and
--      vindication: *therein shall be left a remnant that shall be brought forth... and ye shall be
--      comforted* (14:22), *ye shall know that I have not done without cause all that I have done* (14:23).
--      The preserved remnant justifies Yahuah''s dealings — the judgment is not without cause, and a seed is
--      always left.
--   VERSES WITH NO SEPARATE ADD: v.1-2 (the elders sit before the prophet; the setting — woven into THREAD
--      1), v.9-11 (the deceived prophet and the covenant-formula close — *that they may be my people, and I
--      may be their Elohim* — held in THREAD 1 prose; the my-people refrain belongs to the Ezekiel 37 weave),
--      v.13,15,17,18,19 (the successive single-judgment scenarios — famine, beasts, sword, pestilence —
--      carried under THREAD 2 with vv.14,16,20, and the four gathered in THREAD 3 at v.21). All recorded.

CREATE TEMP VIEW _s308_ezek14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): the idols set up in their heart — Yahuah answers the double-minded by their idols
    ('canon','ezekiel',14,4,'canon','james',4,8,'free',
      E'*Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded* (James 4:8). The men of Ezekiel come to enquire of Yahuah while their hearts are full of idols, and Yahuah *will answer him that cometh according to the multitude of his idols* (Ezekiel 14:4) — the divided, double heart cannot draw nigh until it is purified. James names the cure for the very condition Ezekiel exposes: the double minded must cleanse their hands and purify their hearts before they can draw nigh.'),
    ('canon','ezekiel',14,3,'canon','matthew',6,24,'free',
      E'*No man can serve two masters: for either he will hate the one, and love the other; or else he will hold to the one, and despise the other. Ye cannot serve Elohim (God) and mammon* (Matthew 6:24). The men who *have set up their idols in their heart, and put the stumblingblock of their iniquity before their face* (Ezekiel 14:3) try to serve Yahuah and their idols at once. The Formed Son names the impossibility: the heart cannot hold two masters; the idol in the heart is already the chosen master.'),
    ('canon','ezekiel',14,6,'canon','1-john',5,21,'free',
      E'*Little children, keep yourselves from idols. Amen* (1 John 5:21). Yahuah''s call to the house is exactly this: *Repent, and turn yourselves from your idols; and turn away your faces from all your abominations* (Ezekiel 14:6). John''s final word to his little children seals the whole prophet''s plea — the idols are not only the carved images but the things set up in the heart; keep yourselves from them.'),
    ('canon','ezekiel',14,3,'canon','isaiah',1,15,'free',
      E'*And when ye spread forth your hands, I will hide mine eyes from you: yea, when ye make many prayers, I will not hear: your hands are full of blood* (Isaiah 1:15). Isaiah names the same refusal Ezekiel pronounces: the enquiry of a defiled heart is no worship. As Yahuah asks *should I be enquired of at all by them?* (Ezekiel 14:3) of men with idols in the heart, so he hides his eyes from prayers made with hands full of blood. Prayer is refused while the heart is full of idols.')
,
    -- THREAD 2 (★★★): Noah, Daniel, and Job — they should deliver but their own souls
    ('canon','ezekiel',14,20,'canon','ezekiel',18,20,'free',
      E'*The soul that sinneth, it shall die. The son shall not bear the iniquity of the father, neither shall the father bear the iniquity of the son: the righteousness of the righteous shall be upon him, and the wickedness of the wicked shall be upon him* (Ezekiel 18:20). This is the law behind the three men: *they shall but deliver their own souls by their righteousness* (Ezekiel 14:20). The righteousness of the righteous is upon HIM — not lent to son or daughter. Even Noah, Daniel, and Job could deliver no soul but their own, for righteousness is personal and untransferable.'),
    ('canon','ezekiel',14,14,'canon','jeremiah',15,1,'free',
      E'*Then said Yahuah (LORD) unto me, Though Moses and Samuel stood before me, yet my mind could not be toward this people: cast them out of my sight, and let them go forth* (Jeremiah 15:1). Jeremiah hears the same verdict Ezekiel hears: as *Though these three men, Noah, Daniel, and Job, were in it, they should deliver but their own souls* (Ezekiel 14:14), so not even Moses and Samuel, the great intercessors, could turn Yahuah''s mind toward a people ripe for judgment. The presence of the righteous does not cancel the guilt of the unrepentant.'),
    ('canon','ezekiel',14,14,'canon','genesis',7,23,'free',
      E'*And every living substance was destroyed which was upon the face of the ground... and Noah only remained alive, and they that were with him in the ark* (Genesis 7:23). Noah is the first of the three named — and his story shows the very principle: in the world''s great judgment *Noah only remained alive*, delivered by the righteousness for which Yahuah had seen him righteous before him. As in Ezekiel, the righteous man is preserved through judgment, but the deliverance is his own.'),
    ('canon','ezekiel',14,14,'canon','job',1,1,'free',
      E'*There was a man in the land of Uz, whose name was Job; and that man was perfect and upright, and one that feared Elohim (God), and eschewed evil* (Job 1:1). Job is the third of the three — *perfect and upright, and one that feared Elohim* — the canon''s very picture of the righteous man. Yet Ezekiel''s word is that even such a man *should deliver but their own souls by their righteousness* (Ezekiel 14:14): the most upright cannot transfer his righteousness to another.'),
    ('canon','ezekiel',14,20,'canon','romans',14,12,'free',
      E'*So then every one of us shall give account of himself to Elohim (God)* (Romans 14:12). Paul keeps the personal frame Ezekiel sets: as Noah, Daniel, and Job *shall but deliver their own souls by their righteousness* (Ezekiel 14:20), so every one of us shall give account of HIMSELF. No man answers in another''s stead; each soul stands or falls on its own before Elohim.'),
    ('canon','ezekiel',14,20,'canon','philippians',2,12,'free',
      E'*Wherefore, my beloved, as ye have always obeyed, not as in my presence only, but now much more in my absence, work out your own salvation with fear and trembling* (Philippians 2:12). The charge to *work out your OWN salvation* echoes Ezekiel''s law that the three *shall but deliver their own souls by their righteousness* (Ezekiel 14:20). Salvation is not inherited from a righteous parent or borrowed from a righteous neighbour; it is worked out, each one, with fear and trembling.')
,
    -- THREAD 3 (★): my four sore judgments upon Jerusalem — and the remnant left
    ('canon','ezekiel',14,21,'canon','revelation',6,8,'free',
      E'*And I looked, and behold a pale horse: and his name that sat on him was Death, and Hell followed with him. And power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death, and with the beasts of the earth* (Revelation 6:8). John sees the same four judgments ride out at the fourth seal that Ezekiel names — *my four sore judgments upon Jerusalem, the sword, and the famine, and the noisome beast, and the pestilence* (Ezekiel 14:21). Sword, hunger, death (pestilence), and the beasts of the earth: the four sore judgments of the covenant unfold to the very end.'),
    ('canon','ezekiel',14,21,'canon','leviticus',26,25,'free',
      E'*And I will bring a sword upon you, that shall avenge the quarrel of my covenant... I will send the pestilence among you; and ye shall be delivered into the hand of the enemy* (Leviticus 26:25). Ezekiel''s *four sore judgments... the sword, and the famine, and the noisome beast, and the pestilence* (Ezekiel 14:21) are the covenant-curses of the Torah itself: the sword that avenges the quarrel of the covenant, the pestilence sent among them. These are not arbitrary disasters but the covenant''s own sanctions for grievous trespass.'),
    ('canon','ezekiel',14,21,'canon','leviticus',26,26,'free',
      E'*And when I have broken the staff of your bread, ten women shall bake your bread in one oven, and they shall deliver you your bread again by weight: and ye shall eat, and not be satisfied* (Leviticus 26:26). The famine of the four judgments is the Torah''s broken staff of bread — and Ezekiel uses the very phrase, *break the staff of the bread thereof, and will send famine upon it* (Ezekiel 14:13). The famine that cuts off man and beast is the covenant-curse foretold, the staff of bread broken.'),
    ('canon','ezekiel',14,21,'canon','ezekiel',5,17,'free',
      E'*So will I send upon you famine and evil beasts, and they shall bereave thee; and pestilence and blood shall pass through thee; and I will bring the sword upon thee. I Yahuah (LORD) have spoken it* (Ezekiel 5:17). Ezekiel had already gathered the same four — famine, evil beasts, pestilence, and the sword — before naming them *my four sore judgments upon Jerusalem* (Ezekiel 14:21). The prophet''s earlier word and this one are one verdict: the fourfold curse upon the city that has trespassed grievously.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-14-the-idols-set-up-in-their-heart',
       E'The idols set up in their heart — Yahuah answers the double-minded according to their idols',
       E'Certain of the elders of Yashar''el (Israel) come and sit before the prophet to enquire of Yahuah (LORD) — but their hearts are full of idols. Yahuah exposes them: *Son of Adam, these men have set up their idols in their heart, and put the stumblingblock of their iniquity before their face: should I be enquired of at all by them?* (14:3). The idolatry is not only carved images but the things enthroned in the heart, and it defiles the very enquiry. The answer is terrible and exact: *I Yahuah (LORD) will answer him that cometh according to the multitude of his idols; That I may take the house of Yashar''el (Israel) in their own heart, because they are all estranged from me through their idols* (14:4-5) — he answers the double-minded by their own idols, to expose and take them. Then the call to turn: *Repent, and turn yourselves from your idols; and turn away your faces from all your abominations* (14:6), that the house *may go no more astray from me... but that they may be my people, and I may be their Elohim (God)* (14:11). The New Testament names both the cure and the impossibility of the divided heart. James: *Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded* (James 4:8). The Formed Son: *No man can serve two masters... Ye cannot serve Elohim (God) and mammon* (Matthew 6:24) — the idol in the heart is already the chosen master. John''s last word: *Little children, keep yourselves from idols* (1 John 5:21). And Isaiah names the refusal of defiled worship: *when ye make many prayers, I will not hear: your hands are full of blood* (Isaiah 1:15). The enquiry of a heart full of idols is no worship at all; the heart must be purified before it can draw nigh.',
       sv.verse_id, ev.verse_id, 'free', 32325
  FROM _s308_ezek14_lookup sv, _s308_ezek14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=14 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-14-noah-daniel-and-job-deliver-but-their-own-souls',
       E'Though Noah, Daniel, and Job were in it — they should deliver but their own souls',
       E'When the land sins grievously and Yahuah stretches out his hand against it, he sets down a law that runs the whole canon: *Though these three men, Noah, Daniel, and Job, were in it, they should deliver but their own souls by their righteousness, saith Adonai Yahuah (the Lord GOD)* (14:14); and again, through each of the four judgments, *they shall deliver neither sons nor daughters; they only shall be delivered* (14:16), *they shall but deliver their own souls by their righteousness* (14:20). The three are the most righteous men the canon knows: Noah, the only one found righteous before the Flood — *Noah only remained alive, and they that were with him in the ark* (Genesis 7:23); Job, *perfect and upright, and one that feared Elohim (God), and eschewed evil* (Job 1:1); and Daniel, the faithful exile. Yet not one of them could transfer his righteousness — not even to his own son or daughter. The same prophet states the principle plainly: *The soul that sinneth, it shall die... the righteousness of the righteous shall be upon him, and the wickedness of the wicked shall be upon him* (Ezekiel 18:20) — upon HIM, never lent out. Jeremiah hears the identical verdict: *Though Moses and Samuel stood before me, yet my mind could not be toward this people* (Jeremiah 15:1) — not even the great intercessors avail for the unrepentant. And the New Testament keeps the personal frame to the end: *every one of us shall give account of himself to Elohim (God)* (Romans 14:12); *work out your own salvation with fear and trembling* (Philippians 2:12). Righteousness is personal; no man delivers a soul not his own. And here is the one exception the whole canon points to: only the righteous Servant''s righteousness is ever given to others — *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* (Isaiah 53:11). No paragon, only the Suffering Servant who took flesh, the Formed Son, can deliver souls beside his own.',
       sv.verse_id, ev.verse_id, 'free', 32328
  FROM _s308_ezek14_lookup sv, _s308_ezek14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=14 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=14 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-14-my-four-sore-judgments-and-the-remnant-left',
       E'My four sore judgments upon Jerusalem — yet therein shall be left a remnant',
       E'The single judgments of the chapter — famine, noisome beasts, the sword, pestilence — are gathered into one fourfold sentence: *For thus saith Adonai Yahuah (the Lord GOD); How much more when I send my four sore judgments upon Jerusalem, the sword, and the famine, and the noisome beast, and the pestilence, to cut off from it man and beast?* (14:21). These four are not arbitrary disasters but the covenant-curses of the Torah itself — *I will bring a sword upon you, that shall avenge the quarrel of my covenant... I will send the pestilence among you* (Leviticus 26:25), *And when I have broken the staff of your bread... ye shall eat, and not be satisfied* (Leviticus 26:26) — the famine that Ezekiel names as the *staff of the bread* broken (14:13). The prophet had already gathered the same four: *So will I send upon you famine and evil beasts... and pestilence and blood... and I will bring the sword upon thee* (Ezekiel 5:17). And the four ride out at the very end, at the opening of the fourth seal: *power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death, and with the beasts of the earth* (Revelation 6:8). Yet the chapter does not close in wrath but in mercy and vindication: *Yet, behold, therein shall be left a remnant that shall be brought forth, both sons and daughters... and ye shall be comforted concerning the evil that I have brought upon Jerusalem* (14:22), *and ye shall know that I have not done without cause all that I have done in it* (14:23). The preserved remnant justifies Yahuah''s dealings: the judgment is never without cause, and a seed is always left.',
       sv.verse_id, ev.verse_id, 'free', 32331
  FROM _s308_ezek14_lookup sv, _s308_ezek14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=14 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=14 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Cleanse your hands, ye sinners; and purify your hearts, ye double minded* (James 4:8) — the cure for the heart full of idols; the double-minded cannot draw nigh till purified (Ezekiel 14:4).'
  FROM cross_reference_threads t
  JOIN _s308_ezek14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=14 AND sv.verse_number=4
  JOIN _s308_ezek14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-14-the-idols-set-up-in-their-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Ye cannot serve Elohim (God) and mammon* (Matthew 6:24) — the heart with an idol set up in it (Ezekiel 14:3) cannot serve two masters; the idol is already the chosen master.'
  FROM cross_reference_threads t
  JOIN _s308_ezek14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=14 AND sv.verse_number=3
  JOIN _s308_ezek14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-14-the-idols-set-up-in-their-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Little children, keep yourselves from idols* (1 John 5:21) — John''s final word seals Yahuah''s call to *turn yourselves from your idols* (Ezekiel 14:6); the idols of the heart included.'
  FROM cross_reference_threads t
  JOIN _s308_ezek14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=14 AND sv.verse_number=6
  JOIN _s308_ezek14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=5 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-14-the-idols-set-up-in-their-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *when ye make many prayers, I will not hear: your hands are full of blood* (Isaiah 1:15) — prayer refused while the heart is defiled; the same verdict as *should I be enquired of at all by them?* (Ezekiel 14:3).'
  FROM cross_reference_threads t
  JOIN _s308_ezek14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=14 AND sv.verse_number=3
  JOIN _s308_ezek14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-14-the-idols-set-up-in-their-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the righteousness of the righteous shall be upon him* (Ezekiel 18:20) — the law behind the three men; righteousness is upon HIM, never lent to son or daughter (Ezekiel 14:20).'
  FROM cross_reference_threads t
  JOIN _s308_ezek14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=14 AND sv.verse_number=20
  JOIN _s308_ezek14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-14-noah-daniel-and-job-deliver-but-their-own-souls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Though Moses and Samuel stood before me, yet my mind could not be toward this people* (Jeremiah 15:1) — even the great intercessors avail nothing; the same verdict as the three (Ezekiel 14:14).'
  FROM cross_reference_threads t
  JOIN _s308_ezek14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s308_ezek14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=15 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-14-noah-daniel-and-job-deliver-but-their-own-souls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Noah only remained alive, and they that were with him in the ark* (Genesis 7:23) — Noah the first of the three; preserved through judgment by his own righteousness (Ezekiel 14:14).'
  FROM cross_reference_threads t
  JOIN _s308_ezek14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s308_ezek14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-14-noah-daniel-and-job-deliver-but-their-own-souls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *that man was perfect and upright, and one that feared Elohim (God)* (Job 1:1) — Job the third of the three, the canon''s picture of the righteous man; yet he too delivers but his own soul (Ezekiel 14:14).'
  FROM cross_reference_threads t
  JOIN _s308_ezek14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s308_ezek14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-14-noah-daniel-and-job-deliver-but-their-own-souls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *every one of us shall give account of himself to Elohim (God)* (Romans 14:12) — the personal frame kept forward; each soul answers for itself, as the three deliver but their own (Ezekiel 14:20).'
  FROM cross_reference_threads t
  JOIN _s308_ezek14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=14 AND sv.verse_number=20
  JOIN _s308_ezek14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=14 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-14-noah-daniel-and-job-deliver-but-their-own-souls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *work out your own salvation with fear and trembling* (Philippians 2:12) — salvation is not inherited nor borrowed; worked out each one, as the three deliver but their own souls (Ezekiel 14:20).'
  FROM cross_reference_threads t
  JOIN _s308_ezek14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=14 AND sv.verse_number=20
  JOIN _s308_ezek14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-14-noah-daniel-and-job-deliver-but-their-own-souls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *to kill with sword, and with hunger, and with death, and with the beasts of the earth* (Revelation 6:8) — the same four ride at the fourth seal; the four sore judgments of Ezekiel 14:21 unfold to the end.'
  FROM cross_reference_threads t
  JOIN _s308_ezek14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=14 AND sv.verse_number=21
  JOIN _s308_ezek14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-14-my-four-sore-judgments-and-the-remnant-left'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I will bring a sword upon you, that shall avenge the quarrel of my covenant... I will send the pestilence* (Leviticus 26:25) — the four are the Torah''s own covenant-curses (Ezekiel 14:21).'
  FROM cross_reference_threads t
  JOIN _s308_ezek14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=14 AND sv.verse_number=21
  JOIN _s308_ezek14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-14-my-four-sore-judgments-and-the-remnant-left'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *when I have broken the staff of your bread... ye shall eat, and not be satisfied* (Leviticus 26:26) — the famine = the Torah''s broken staff of bread, Ezekiel''s very phrase (14:13,21).'
  FROM cross_reference_threads t
  JOIN _s308_ezek14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=14 AND sv.verse_number=21
  JOIN _s308_ezek14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-14-my-four-sore-judgments-and-the-remnant-left'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *famine and evil beasts... and pestilence and blood... and I will bring the sword upon thee* (Ezekiel 5:17) — the prophet already gathered the same four before naming them (Ezekiel 14:21).'
  FROM cross_reference_threads t
  JOIN _s308_ezek14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=14 AND sv.verse_number=21
  JOIN _s308_ezek14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=5 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-14-my-four-sore-judgments-and-the-remnant-left'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezekiel_15.sql (Ezekiel 15) -----
-- Chapter: Ezekiel 15 — ★★ THE PARABLE OF THE VINE WOOD. What is the vine tree more than any tree? — its
-- wood is good for nothing but the fire; it makes no pin to hang a vessel, no work at all. Whole, it was
-- meet for no work; burned at both ends, less still. So Yahuah gives the inhabitants of Jerusalem to the
-- fire: they shall go out from one fire, and another fire shall devour them. The vine's ONLY worth is
-- fruit; Yashar'el-the-vine bore none (Isaiah 5; Psalm 80), so the useless wood is given to the burning.
-- The FORMED Son is the TRUE Vine that Israel-the-vine failed to be (John 15); the unfruitful branch is
-- cast forth and burned. v.8 = the land made desolate for the trespass (covenant-breaking, Lev 26).
-- Tag: ezek15   Temp view: _s308_ezek15_lookup
-- Sort band: base 32350, step 3 -> threads at 32350, 32353 (2 threads)
-- Source of EVERY row: 'canon','ezekiel',15,v
--
-- Ezekiel 15 coverage:
--   v.1 (the word of Yahuah came unto me) — prophetic-formula preface; no add (NT/Extras/Tanakh none warranted)
--   ★★ v.2-7 (What is the vine tree more than any tree?... Shall wood be taken thereof to do any work?...
--          Behold, it is cast into the fire for fuel... I will set my face against them; they shall go out
--          from one fire, and another fire shall devour them)
--        NT:     ★★★ John 15:6 (If a man abide not in me, he is cast forth as a branch... cast them into the
--                fire, and they are burned), ★★ John 15:1 (I am the true vine), ★★ John 15:5 (I am the vine,
--                ye are the branches), ★ Matthew 3:10 (every tree which bringeth not forth good fruit is hewn
--                down, and cast into the fire), ★ Hebrews 6:8 (that which beareth thorns and briers... whose
--                end is to be burned) — THREAD 1
--        Extras: none warranted (clean canon-NT-Tanakh vine weave; no extras forced)
--        Tanakh: ★★ Isaiah 5:1-2 (the vineyard that brought forth wild grapes), ★★ Isaiah 5:7 (the vineyard
--                of Yahuah is the house of Yashar'el), ★★ Psalm 80:8 (a vine out of Egypt), ★ Psalm 80:16
--                (it is burned with fire, it is cut down) — THREAD 1
--   ★ v.8 (And I will make the land desolate, because they have committed a trespass)
--        NT:     none warranted (the covenant-desolation; held in the Tanakh covenant-lawsuit)
--        Extras: none warranted
--        Tanakh: ★★ Leviticus 26:33 (your land shall be desolate, and your cities waste), ★ Ezekiel 14:13
--                (when the land sinneth against me by trespassing grievously... and will cut off man and
--                beast) — THREAD 2
--
-- Threads (slug — target libraries):
--   1. ezekiel-15-the-vine-wood-good-for-nothing-but-the-fire — NT (John 15, Matthew 3, Hebrews 6) + Tanakh (Isaiah 5, Psalm 80) [free]
--      (★★ the unfruitful vine fit only for burning; the Formed Son is the TRUE Vine Israel-the-vine failed to be)
--   2. ezekiel-15-the-land-made-desolate-for-the-trespass — Tanakh (Leviticus 26, Ezekiel 14) [free]
--      (★ the covenant-desolation for the trespass; the curse is covenant-breaking, never the Torah itself)
--
-- Framing notes:
--   ★★ THE VINE WOOD (THREAD 1): the parable turns on the vine's single worth. *What is the vine tree more
--      than any tree, or than a branch which is among the trees of the forest? Shall wood be taken thereof to
--      do any work? or will men take a pin of it to hang any vessel thereon?* (15:2-3) — no. A vine is not
--      timber; its wood makes nothing. *Behold, it is cast into the fire for fuel; the fire devoureth both
--      the ends of it, and the midst of it is burned* (15:4). Its only value is its fruit; bearing none, it
--      is fit only for burning — *so will I give the inhabitants of Jerusalem... they shall go out from one
--      fire, and another fire shall devour them* (15:6-7). Isaiah named the vine: *the vineyard of Yahuah
--      Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel)* (Isaiah 5:7), planted with the choicest
--      vine yet bringing forth *wild grapes* (Isaiah 5:2). The psalmist sang it: *Thou hast brought a vine out
--      of Egypt* (Psalm 80:8), now *burned with fire... cut down* (Psalm 80:16). Then the Formed Son speaks
--      the answer the whole figure waited for: *I am the true vine* (John 15:1), *I am the vine, ye are the
--      branches* (John 15:5) — HE is the true Vine that Israel-the-vine failed to be, and the unfruitful
--      branch meets Ezekiel''s fire: *If a man abide not in me, he is cast forth as a branch, and is withered;
--      and men gather them, and cast them into the fire, and they are burned* (John 15:6). John the Baptist:
--      *every tree which bringeth not forth good fruit is hewn down, and cast into the fire* (Matthew 3:10);
--      Hebrews: *that which beareth thorns and briers is rejected... whose end is to be burned* (Hebrews 6:8).
--      The vine's worth is fruit; fruitless, it burns — and the only way to bear it is to abide in the Vine.
--   ★ THE DESOLATION (THREAD 2): *And I will make the land desolate, because they have committed a trespass*
--      (15:8). The fire ends in the desolation of the land — the Deuteronomy 28 / Leviticus 26 covenant-
--      judgment for covenant-breaking, NEVER the Torah itself made a curse: *your land shall be desolate, and
--      your cities waste* (Leviticus 26:33), the sworn consequence of trespass. Ezekiel had just framed it:
--      *when the land sinneth against me by trespassing grievously, then will I stretch out mine hand upon it*
--      (Ezekiel 14:13). The trespass is the covenant broken; the desolation is its sworn wage.
--   VERSES WITH NO SEPARATE ADD: v.1 (the word-of-Yahuah prophetic formula; no library warranted). v.5 (the
--      whole/burned wood meet for no work) and v.7 (set my face against them) carried in THREAD 1 prose under
--      the v.4/v.6 anchors. All verses recorded in the coverage checklist above; every block carries a thread.

CREATE TEMP VIEW _s308_ezek15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): the vine wood good for nothing but the fire — the unfruitful branch burned
    ('canon','ezekiel',15,6,'canon','john',15,6,'free',
      E'*If a man abide not in me, he is cast forth as a branch, and is withered; and men gather them, and cast them into the fire, and they are burned* (John 15:6). The Formed Son speaks Ezekiel''s verdict on the fruitless vine: as *the vine tree among the trees of the forest, which I have given to the fire for fuel, so will I give the inhabitants of Jerusalem* (Ezekiel 15:6), so the branch that will not abide is *cast forth* and *burned*. The vine''s only worth is fruit; the branch that bears none meets the fire.'),
    ('canon','ezekiel',15,2,'canon','john',15,1,'free',
      E'*I am the true vine, and my Father is the husbandman* (John 15:1). Ezekiel asks *What is the vine tree more than any tree* (Ezekiel 15:2) — the vine of Yashar''el (Israel) whose wood was good for nothing; the Formed Son answers as the *true vine* that Israel-the-vine failed to be. He is Yahuah and has a Father (*my Father is the husbandman*); in him alone the vine bears the fruit Jerusalem''s vine could not.'),
    ('canon','ezekiel',15,2,'canon','john',15,5,'free',
      E'*I am the vine, ye are the branches: He that abideth in me, and I in him, the same bringeth forth much fruit: for without me ye can do nothing* (John 15:5). The branch *among the trees of the forest* (Ezekiel 15:2) that bore no fruit is answered by the Vine in whom the branches bear *much fruit*. Apart from the true Vine the branch is the useless wood of Ezekiel''s parable — *without me ye can do nothing*; abiding in him is the one way it is not given to the fire.'),
    ('canon','ezekiel',15,4,'canon','matthew',3,10,'free',
      E'*And now also the axe is laid unto the root of the trees: therefore every tree which bringeth not forth good fruit is hewn down, and cast into the fire* (Matthew 3:10). John the Baptist preaches Ezekiel''s judgment on the fruitless wood — *Behold, it is cast into the fire for fuel; the fire devoureth both the ends of it* (Ezekiel 15:4): the tree that bears no good fruit is *hewn down, and cast into the fire*. The measure is fruit; what bears none is fuel.'),
    ('canon','ezekiel',15,4,'canon','hebrews',6,8,'free',
      E'*But that which beareth thorns and briers is rejected, and is nigh unto cursing; whose end is to be burned* (Hebrews 6:8). The wood *cast into the fire for fuel... and the midst of it is burned* (Ezekiel 15:4) is the same end Hebrews names for the fruitless ground — *whose end is to be burned*. The unfruitful is rejected and given to the fire; the parable of the vine wood and the warning of Hebrews are one verdict.'),
    ('canon','ezekiel',15,2,'canon','isaiah',5,7,'free',
      E'*For the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel), and the men of Yahudah (Judah) his pleasant plant: and he looked for judgment, but behold oppression* (Isaiah 5:7). Isaiah names the vine Ezekiel weighs — *What is the vine tree more than any tree* (Ezekiel 15:2): the vine IS *the house of Yashar''el*, planted to bear fruit. Looked-for judgment yielded oppression; the choicest vine bore wild grapes, and the fruitless wood is given to the fire.'),
    ('canon','ezekiel',15,2,'canon','isaiah',5,2,'free',
      E'*And he fenced it, and gathered out the stones thereof, and planted it with the choicest vine... and he looked that it should bring forth grapes, and it brought forth wild grapes* (Isaiah 5:2). The vine *among the trees of the forest* (Ezekiel 15:2) was Yahuah''s own planting, *the choicest vine*, tended for fruit — yet it *brought forth wild grapes*. Bearing no true fruit, the vine''s wood is worth nothing but the burning of Ezekiel''s parable.'),
    ('canon','ezekiel',15,6,'canon','psalms',80,8,'free',
      E'*Thou hast brought a vine out of Egypt: thou hast cast out the heathen, and planted it* (Psalm 80:8). The psalm sings the same vine Ezekiel burns — Yahuah *brought a vine out of Egypt* and planted it, yet when it bore no fruit *so will I give the inhabitants of Jerusalem* to the fire (Ezekiel 15:6). The vine carried up out of Egypt is the house given to the burning when it failed to bear.'),
    ('canon','ezekiel',15,4,'canon','psalms',80,16,'free',
      E'*It is burned with fire, it is cut down: they perish at the rebuke of thy countenance* (Psalm 80:16). The psalmist already sees the vine in Ezekiel''s fire — *Behold, it is cast into the fire for fuel; the fire devoureth both the ends of it* (Ezekiel 15:4) is *burned with fire... cut down*. The vine that would not bear perishes at the rebuke of Yahuah''s countenance, given to the flame.'),

    -- THREAD 2 (★): the land made desolate for the trespass — the covenant-judgment
    ('canon','ezekiel',15,8,'canon','leviticus',26,33,'free',
      E'*And I will scatter you among the heathen, and will draw out a sword after you: and your land shall be desolate, and your cities waste* (Leviticus 26:33). The threat *And I will make the land desolate, because they have committed a trespass* (Ezekiel 15:8) is the sworn covenant-judgment of Leviticus — *your land shall be desolate, and your cities waste* — the wage of covenant-breaking, not the Torah made a curse. The desolation is the consequence the covenant itself named for trespass.'),
    ('canon','ezekiel',15,8,'canon','ezekiel',14,13,'free',
      E'*Son of Adam, when the land sinneth against me by trespassing grievously, then will I stretch out mine hand upon it, and will break the staff of the bread thereof, and will send famine upon it, and will cut off man and beast from it* (Ezekiel 14:13). Ezekiel had just framed the verdict the vine-parable seals — *I will make the land desolate, because they have committed a trespass* (Ezekiel 15:8): when *the land sinneth against me by trespassing grievously*, Yahuah''s hand stretches out to desolation. The trespass is the covenant broken; the desolation is its sworn answer.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-15-the-vine-wood-good-for-nothing-but-the-fire',
       E'The vine wood good for nothing but the fire — the unfruitful vine given to the burning',
       E'The parable turns on the vine''s single worth. Yahuah (LORD) asks: *Son of Adam, What is the vine tree more than any tree, or than a branch which is among the trees of the forest? Shall wood be taken thereof to do any work? or will men take a pin of it to hang any vessel thereon?* (15:2-3). The answer is no — a vine is not timber; its crooked wood makes nothing, not even a peg. *Behold, it is cast into the fire for fuel; the fire devoureth both the ends of it, and the midst of it is burned. Is it meet for any work?* (15:4). Whole it was useless; charred it is less than useless — *how much less shall it be meet yet for any work, when the fire hath devoured it* (15:5). So the verdict falls on the city: *As the vine tree among the trees of the forest, which I have given to the fire for fuel, so will I give the inhabitants of Jerusalem... they shall go out from one fire, and another fire shall devour them* (15:6-7). The vine''s ONLY value is its fruit; bearing none, it is fit for nothing but the flame. Isaiah names the vine outright: *the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel)* (Isaiah 5:7), planted *with the choicest vine* yet bringing forth *wild grapes* (Isaiah 5:2). The psalmist sang it: *Thou hast brought a vine out of Egypt: thou hast cast out the heathen, and planted it* (Psalm 80:8), now *burned with fire... cut down* (Psalm 80:16). Then the Formed Son speaks the word the whole figure waited for: *I am the true vine, and my Father is the husbandman* (John 15:1), *I am the vine, ye are the branches: He that abideth in me, and I in him, the same bringeth forth much fruit: for without me ye can do nothing* (John 15:5). HE is the TRUE Vine that Israel-the-vine failed to be — Yahuah who has a Father — and the unfruitful branch meets Ezekiel''s fire exactly: *If a man abide not in me, he is cast forth as a branch, and is withered; and men gather them, and cast them into the fire, and they are burned* (John 15:6). John the Baptist preaches the same measure: *every tree which bringeth not forth good fruit is hewn down, and cast into the fire* (Matthew 3:10); and Hebrews: *that which beareth thorns and briers is rejected, and is nigh unto cursing; whose end is to be burned* (Hebrews 6:8). The vine''s worth is fruit; fruitless, it burns — and the one way the branch is not given to the fire is to abide in the true Vine.',
       sv.verse_id, ev.verse_id, 'free', 32350
  FROM _s308_ezek15_lookup sv, _s308_ezek15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=15 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=15 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-15-the-land-made-desolate-for-the-trespass',
       E'I will make the land desolate, because they have committed a trespass',
       E'The fire of the parable ends in the desolation of the land: *And I will make the land desolate, because they have committed a trespass, saith Adonai Yahuah (the Lord GOD)* (15:8). This is the sworn covenant-judgment for covenant-breaking — the Leviticus 26 / Deuteronomy 28 curse — never the Torah itself made a curse. Yahuah swore the consequence at Sinai: *And I will scatter you among the heathen, and will draw out a sword after you: and your land shall be desolate, and your cities waste* (Leviticus 26:33). The desolation is the wage the covenant named for trespass, not an arbitrary wrath. And Ezekiel had just framed the same verdict a chapter before: *when the land sinneth against me by trespassing grievously, then will I stretch out mine hand upon it, and will break the staff of the bread thereof, and will send famine upon it, and will cut off man and beast from it* (Ezekiel 14:13). The trespass is the covenant broken; the desolation is its sworn answer. The vine that would not bear fruit, and the land made waste for its trespass, are one judgment — the curse falling on covenant-breaking, while the covenant-instruction stands.',
       sv.verse_id, ev.verse_id, 'free', 32353
  FROM _s308_ezek15_lookup sv, _s308_ezek15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=15 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=15 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *If a man abide not in me, he is cast forth as a branch... and cast them into the fire, and they are burned* (John 15:6) — the Formed Son speaks Ezekiel 15:6 word for word; the fruitless branch given to the fire.'
  FROM cross_reference_threads t
  JOIN _s308_ezek15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=15 AND sv.verse_number=6
  JOIN _s308_ezek15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-15-the-vine-wood-good-for-nothing-but-the-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I am the true vine, and my Father is the husbandman* (John 15:1) — the Formed Son is the TRUE Vine that Yashar''el (Israel)-the-vine (Ezekiel 15:2) failed to be; Yahuah who has a Father.'
  FROM cross_reference_threads t
  JOIN _s308_ezek15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=15 AND sv.verse_number=2
  JOIN _s308_ezek15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-15-the-vine-wood-good-for-nothing-but-the-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *I am the vine, ye are the branches... without me ye can do nothing* (John 15:5) — apart from the true Vine the branch is the useless wood of Ezekiel 15:2; abiding is the one way it is not burned.'
  FROM cross_reference_threads t
  JOIN _s308_ezek15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=15 AND sv.verse_number=2
  JOIN _s308_ezek15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-15-the-vine-wood-good-for-nothing-but-the-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *every tree which bringeth not forth good fruit is hewn down, and cast into the fire* (Matthew 3:10) — John the Baptist preaches Ezekiel 15:4''s verdict; the measure is fruit, the fruitless is fuel.'
  FROM cross_reference_threads t
  JOIN _s308_ezek15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=15 AND sv.verse_number=4
  JOIN _s308_ezek15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-15-the-vine-wood-good-for-nothing-but-the-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *that which beareth thorns and briers is rejected... whose end is to be burned* (Hebrews 6:8) — the same end as the wood burned at both ends (Ezekiel 15:4); the unfruitful is given to the fire.'
  FROM cross_reference_threads t
  JOIN _s308_ezek15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=15 AND sv.verse_number=4
  JOIN _s308_ezek15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-15-the-vine-wood-good-for-nothing-but-the-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel)* (Isaiah 5:7) — Isaiah names the vine Ezekiel 15:2 weighs; planted for fruit, it bore oppression.'
  FROM cross_reference_threads t
  JOIN _s308_ezek15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=15 AND sv.verse_number=2
  JOIN _s308_ezek15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-15-the-vine-wood-good-for-nothing-but-the-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *planted it with the choicest vine... and it brought forth wild grapes* (Isaiah 5:2) — Yahuah''s own choicest planting bore no true fruit; the vine of Ezekiel 15:2 is worth nothing but the burning.'
  FROM cross_reference_threads t
  JOIN _s308_ezek15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=15 AND sv.verse_number=2
  JOIN _s308_ezek15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-15-the-vine-wood-good-for-nothing-but-the-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★★ *Thou hast brought a vine out of Egypt... and planted it* (Psalm 80:8) — the psalm sings the same vine Ezekiel 15:6 burns; carried up out of Egypt, given to the fire when it failed to bear.'
  FROM cross_reference_threads t
  JOIN _s308_ezek15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=15 AND sv.verse_number=6
  JOIN _s308_ezek15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=80 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-15-the-vine-wood-good-for-nothing-but-the-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★ *It is burned with fire, it is cut down* (Psalm 80:16) — the psalmist already sees the vine in Ezekiel 15:4''s fire, devoured at both ends; it perishes at the rebuke of Yahuah''s countenance.'
  FROM cross_reference_threads t
  JOIN _s308_ezek15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=15 AND sv.verse_number=4
  JOIN _s308_ezek15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=80 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-15-the-vine-wood-good-for-nothing-but-the-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *your land shall be desolate, and your cities waste* (Leviticus 26:33) — the sworn covenant-judgment behind Ezekiel 15:8; the wage of covenant-breaking, not the Torah made a curse.'
  FROM cross_reference_threads t
  JOIN _s308_ezek15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=15 AND sv.verse_number=8
  JOIN _s308_ezek15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-15-the-land-made-desolate-for-the-trespass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *when the land sinneth against me by trespassing grievously, then will I stretch out mine hand upon it* (Ezekiel 14:13) — Ezekiel just framed the verdict 15:8 seals; trespass draws the desolation.'
  FROM cross_reference_threads t
  JOIN _s308_ezek15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=15 AND sv.verse_number=8
  JOIN _s308_ezek15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=14 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-15-the-land-made-desolate-for-the-trespass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ezekiel_16.sql (Ezekiel 16) -----
-- Chapter: Ezekiel 16 — THE FOUNDLING JERUSALEM. The great covenant-marriage allegory: Yahuah finds the
-- abandoned infant cast out in the open field, weltering in her blood; says LIVE; raises her, washes,
-- clothes, decks, and WEDS her — *I sware unto thee, and entered into a covenant with thee... and thou
-- becamest mine* (16:8). She trusts in her own beauty, plays the harlot with every passer-by, pours out
-- her fornications on Egypt, Assyria, Chaldea, and is judged as women that break wedlock. She is more
-- guilty than her sisters Samaria (the northern house) and Sodom because of her greater light. YET the
-- chapter ends in unbreakable mercy: *Nevertheless I will remember my covenant with thee in the days of
-- thy youth, and I will establish unto thee an everlasting covenant* (16:60). The harsh lawsuit language
-- is conduct-WITHIN-the-covenant — the unfaithful wife is still the beloved, victims not enemies, NEVER
-- ethnic accusation. The everlasting covenant = the restored two-house bride.
-- Tag: ezek16   Temp view: _s308_ezek16_lookup
-- Sort band: base 32375, step 3 -> 32375, 32378, 32381, 32384, 32387 (5 threads)
-- Source of EVERY row: 'canon','ezekiel',16,v
--
-- Ezekiel 16 coverage:
--   v.1-3 (cause Jerusalem to know her abominations; thy birth... of the land of Canaan; thy father an
--          Amorite, thy mother an Hittite)
--        NT:     none warranted (the pagan-origin indictment; preface to the foundling)
--        Extras: none warranted
--        Tanakh: none separate (origin-of-shame framing; woven into THREAD 1 prose)
--   ★★ v.4-8 (none eye pitied thee... I said unto thee when thou wast in thy blood, Live... I sware unto
--          thee, and entered into a covenant with thee... and thou becamest mine)
--        NT:     ★★ Romans 9:25 (I will call them my people, which were not my people), ★ Titus 3:5 (not
--                by works of righteousness... but according to his mercy he saved us) — THREAD 1
--        Extras: none warranted
--        Tanakh: ★★ Deuteronomy 7:7-8 (not because ye were more in number... but because Yahuah loved
--                you), ★ Exodus 19:5 (a peculiar treasure unto me) — THREAD 1
--   ★ v.9-14 (I clothed thee... decked thee with ornaments... exceeding beautiful... prosper into a
--          kingdom... thy renown went forth for thy beauty: for it was perfect through MY comeliness)
--        NT:     ★ Revelation 19:7-8 (the bride... arrayed in fine linen... the righteousness of saints)
--                — THREAD 2
--        Extras: none warranted
--        Tanakh: ★ Psalm 45:13-14 (the king's daughter is all glorious within), ★ Isaiah 61:10 (he hath
--                clothed me with the garments of salvation... as a bride adorneth herself) — THREAD 2
--   ★★ v.15-34 (thou didst trust in thine own beauty, and playedst the harlot... pouredst out thy
--          fornications on every one that passed by)
--        NT:     ★★ James 4:4 (ye adulterers and adulteresses, the friendship of the world is enmity
--                with Elohim) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★★ Hosea 2:5 (she... went after her lovers), ★ Hosea 2:13 (she... forgat me), ★ Hosea
--                2:2 (she is not my wife), ★★ Jeremiah 3:1 (thou hast played the harlot with many
--                lovers; yet return again to me), ★ Jeremiah 2:20 (playing the harlot) — THREAD 3
--   v.35-43 (the harlot's judgment — I will gather all thy lovers against thee... as women that break
--          wedlock... are judged) — the lawsuit verdict; woven into THREAD 3 prose
--        NT:     none warranted (covenant-lawsuit verdict; held in prose)
--        Extras: none warranted
--        Tanakh: none separate (the wedlock-breaker judgment; THREAD 3 prose)
--   v.44-45 (As is the mother, so is her daughter; your mother an Hittite, your father an Amorite) —
--          the proverb introducing the sisters; woven into THREAD 4 prose
--   ★ v.46-52 (thy elder sister is Samaria... thy younger sister is Sodom... thou hast justified thy
--          sisters in all thine abominations)
--        NT:     ★ Matthew 11:24 (it shall be more tolerable for the land of Sodom... than for thee),
--                ★ Matthew 10:15 (more tolerable for Sodom and Gomorrha... than for that city), ★ Luke
--                12:48 (unto whomsoever much is given, of him shall be much required) — THREAD 4
--        Extras: none warranted
--        Tanakh: held in prose — Samaria the elder sister = the northern kingdom (two-house note)
--   v.53-58 (when I shall bring again their captivity... of Sodom... and of Samaria... then thee) —
--          the restoration of the sisters; the turn toward mercy; woven into THREAD 5 prose
--   ★★★ v.59-63 (Nevertheless I will remember my covenant... I will establish unto thee an everlasting
--          covenant... thou shalt know that I am Yahuah... when I am pacified toward thee)
--        NT:     ★★ Ephesians 5:25-27 (Messiah loved the church and gave himself for it... a glorious
--                bride without spot), ★★ Revelation 21:2 (new Jerusalem... prepared as a bride adorned
--                for her husband), ★ Revelation 19:7 (the marriage of the Lamb), ★★ Romans 11:27-29 (this
--                is my covenant... the gifts and calling are without repentance) — THREAD 5
--        Extras: none warranted
--        Tanakh: ★★★ Hosea 2:19-20 (I will betroth thee unto me for ever), ★★ Jeremiah 31:31,33 (the new
--                covenant... I will write it in their hearts) — THREAD 5
--
-- Threads (slug — target libraries):
--   1. ezekiel-16-when-thou-wast-in-thy-blood-live-the-foundling-betrothed — NT (Romans 9, Titus 3) + Tanakh (Deuteronomy 7, Exodus 19) [free]
--      (★★ electing love on the helpless foundling; LIVE; the covenant-betrothal; loved not for merit but for mercy)
--   2. ezekiel-16-i-decked-thee-the-bride-adorned-by-my-comeliness — NT (Revelation 19) + Tanakh (Psalm 45, Isaiah 61) [free]
--      (★ the bride adorned by Yahuah's own glory; her beauty is HIS gift, not her merit)
--   3. ezekiel-16-thou-playedst-the-harlot-the-covenant-bride-turned — NT (James 4) + Tanakh (Hosea 2, Jeremiah 2, Jeremiah 3) [free]
--      (★★ idolatry as spiritual adultery; the covenant-lawsuit against SIN, never ethnic accusation; the unfaithful wife still beloved)
--   4. ezekiel-16-thy-elder-sister-samaria-thy-younger-sodom — NT (Matthew 11, Matthew 10, Luke 12) [free]
--      (★ more guilty than Samaria the northern house and Sodom because of her greater light; to whom much is given)
--   5. ezekiel-16-nevertheless-i-will-remember-my-covenant-everlasting — NT (Ephesians 5, Revelation 21, Revelation 19) + Tanakh (Hosea 2, Jeremiah 31) [free]
--      (★★★ the unbreakable everlasting covenant despite her unfaithfulness; mercy triumphs; the marriage restored; the two-house bride)
--
-- Framing notes:
--   ★★ THE FOUNDLING BETROTHED (THREAD 1): *None eye pitied thee... but thou wast cast out in the open
--      field, to the lothing of thy person, in the day that thou wast born. And when I passed by thee...
--      I said unto thee when thou wast in thy blood, Live* (16:5-6); *I sware unto thee, and entered into
--      a covenant with thee, saith Adonai Yahuah (the Lord GOD), and thou becamest mine* (16:8). Electing
--      love on the helpless — not for merit but mercy: *Yahuah (LORD) did not set his love upon you, nor
--      choose you, because ye were more in number... But because Yahuah (LORD) loved you* (Deut 7:7-8); a
--      *peculiar treasure unto me* (Exod 19:5); *I will call them my people, which were not my people*
--      (Rom 9:25); *Not by works of righteousness which we have done, but according to his mercy he saved
--      us* (Titus 3:5).
--   ★ THE BRIDE ADORNED (THREAD 2): *I decked thee also with ornaments... thou wast exceeding beautiful,
--      and thou didst prosper into a kingdom... it was perfect through MY comeliness, which I had put upon
--      thee* (16:11-14). Her beauty is HIS gift: *The king's daughter is all glorious within* (Ps 45:13);
--      *he hath clothed me with the garments of salvation... as a bride adorneth herself with her jewels*
--      (Isa 61:10); *to her was granted that she should be arrayed in fine linen, clean and white: for the
--      fine linen is the righteousness of saints* (Rev 19:8).
--   ★★ THE HARLOT (THREAD 3): *But thou didst trust in thine own beauty, and playedst the harlot... and
--      pouredst out thy fornications on every one that passed by* (16:15). Idolatry as adultery — *Ye
--      adulterers and adulteresses, know ye not that the friendship of the world is enmity with Elohim
--      (God)?* (Jas 4:4); *she is not my wife, neither am I her husband* (Hos 2:2); *she... went after her
--      lovers* (Hos 2:5) and *forgat me* (Hos 2:13); *thou hast played the harlot with many lovers; yet
--      return again to me* (Jer 3:1). The covenant-lawsuit is against SIN; the unfaithful wife is still the
--      beloved Yahuah calls home — victims, not enemies.
--   ★ THE SISTERS (THREAD 4): *thine elder sister is Samaria... thy younger sister... is Sodom... thou
--      hast justified thy sisters in all thine abominations* (16:46,51). Jerusalem more guilty because of
--      her greater light: *more tolerable for the land of Sodom in the day of judgment, than for thee*
--      (Matt 11:24); *more tolerable for the land of Sodom and Gomorrha... than for that city* (Matt
--      10:15); *unto whomsoever much is given, of him shall be much required* (Luke 12:48). Two-house note:
--      Samaria the elder sister = the northern kingdom.
--   ★★★ THE EVERLASTING COVENANT (THREAD 5): *Nevertheless I will remember my covenant with thee in the
--      days of thy youth, and I will establish unto thee an everlasting covenant* (16:60); *when I am
--      pacified toward thee for all that thou hast done* (16:63). Mercy triumphs; the marriage restored —
--      *I will betroth thee unto me for ever* (Hos 2:19); *I will make a new covenant... I will write it in
--      their hearts* (Jer 31:31,33); *Messiah (Christ) also loved the church, and gave himself for it...
--      a glorious church, not having spot, or wrinkle* (Eph 5:25,27); *new Jerusalem... prepared as a bride
--      adorned for her husband* (Rev 21:2); *the marriage of the Lamb is come* (Rev 19:7); *the gifts and
--      calling of Elohim (God) are without repentance* (Rom 11:29). The everlasting covenant = the restored
--      two-house bride.
--   VERSES WITH NO SEPARATE ADD: v.1-3 (the pagan-origin indictment — preface to the foundling, THREAD 1
--      prose), v.35-43 (the wedlock-breaker judgment — THREAD 3 prose), v.44-45 (the mother/daughter
--      proverb — THREAD 4 prose), v.53-58 (the captivity of the sisters brought again — THREAD 5 prose).
--      All blocks recorded; every meaningful block carries a thread.

CREATE TEMP VIEW _s308_ezek16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): when thou wast in thy blood, Live — the foundling betrothed
    ('canon','ezekiel',16,8,'canon','deuteronomy',7,7,'free',
      E'*Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people* (Deuteronomy 7:7). When Yahuah passes the cast-out infant and *sware unto thee, and entered into a covenant with thee... and thou becamest mine* (Ezekiel 16:8), the choosing is not for worth — she had none, naked and weltering in blood — but for love alone. The foundling-bride is chosen as Yashar''el (Israel) was chosen: not for number or merit, but because Yahuah set his love.'),
    ('canon','ezekiel',16,8,'canon','deuteronomy',7,8,'free',
      E'*But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD) brought you out with a mighty hand* (Deuteronomy 7:8). The covenant-oath of *I sware unto thee, and entered into a covenant with thee* (Ezekiel 16:8) is the very oath of Deuteronomy — Yahuah weds the helpless because *he loved you*, and because he keeps the oath sworn to the fathers. Electing love, not earned standing, raises the foundling into a bride.'),
    ('canon','ezekiel',16,8,'canon','exodus',19,5,'free',
      E'*Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine* (Exodus 19:5). The infant who *becamest mine* (Ezekiel 16:8) becomes the *peculiar treasure* of the covenant at Sinai — Yahuah''s own cherished possession, taken not for her beauty (she had none) but as his treasured people. The marriage of Ezekiel 16 and the betrothal at the mount are one covenant.'),
    ('canon','ezekiel',16,6,'canon','romans',9,25,'free',
      E'*As he saith also in Osee, I will call them my people, which were not my people; and her beloved, which was not beloved* (Romans 9:25). The word *I said unto thee when thou wast in thy blood, Live* (Ezekiel 16:6) is the same electing mercy Paul names — the not-beloved called beloved, the not-people made *my people*. Yahuah speaks life over the one no eye pitied; the rejected foundling is made his own.'),
    ('canon','ezekiel',16,6,'canon','titus',3,5,'free',
      E'*Not by works of righteousness which we have done, but according to his mercy he saved us, by the washing of regeneration, and renewing of the Ruach HaKodesh (Holy Spirit)* (Titus 3:5). The naked infant *cast out in the open field* (16:5), over whom Yahuah says *Live* and whom he then *washed... with water* (16:9), is saved by mercy alone — *not by works of righteousness*. She brought nothing but her blood and helplessness; he brought the washing and the life.'),

    -- THREAD 2 (★): I decked thee — the bride adorned by my comeliness
    ('canon','ezekiel',16,13,'canon','psalms',45,13,'free',
      E'*The king''s daughter is all glorious within: her clothing is of wrought gold* (Psalm 45:13). The bride decked *with gold and silver* whose *raiment was of fine linen, and silk, and broidered work* (Ezekiel 16:13) is the glorious king''s daughter of the wedding psalm — clothed in wrought gold, all her glory given her by the King. The adorned foundling and the king''s bride are the same: their splendour is the gift of the bridegroom.'),
    ('canon','ezekiel',16,13,'canon','psalms',45,14,'free',
      E'*She shall be brought unto the king in raiment of needlework: the virgins her companions that follow her shall be brought unto thee* (Psalm 45:14). The *broidered work* in which Yahuah clothes the bride (Ezekiel 16:13) is the *raiment of needlework* in which she is *brought unto the king*. The bride does not array herself; she is arrayed and brought — her beauty is wholly the King''s doing.'),
    ('canon','ezekiel',16,14,'canon','isaiah',61,10,'free',
      E'*I will greatly rejoice in Yahuah (LORD)... for he hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness, as a bridegroom decketh himself with ornaments, and as a bride adorneth herself with her jewels* (Isaiah 61:10). The renown that *was perfect through my comeliness, which I had put upon thee* (Ezekiel 16:14) is the beauty Isaiah names — *he hath clothed me*, the garments of salvation, the bride adorned with the jewels her Husband gave. Her loveliness is borrowed glory: it was perfect through HIS comeliness.'),
    ('canon','ezekiel',16,14,'canon','revelation',19,8,'free',
      E'*And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints* (Revelation 19:8). The bride whose *renown went forth among the heathen for thy beauty: for it was perfect through my comeliness* (Ezekiel 16:14) is the Lamb''s wife, whose fine linen *was granted* her — not earned but given. The righteousness she wears is conferred, the comeliness her Husband''s; her beauty is grace clothed.'),
    ('canon','ezekiel',16,7,'canon','revelation',19,7,'free',
      E'*Let us be glad and rejoice, and give honour to him: for the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7). The foundling Yahuah *caused to multiply as the bud of the field... thy breasts are fashioned, and thine hair is grown* (Ezekiel 16:7) is grown up unto the marriage — the bride made ready for the Lamb. The raising of the helpless infant into a bride is the whole arc that ends at the marriage of the Lamb.'),

    -- THREAD 3 (★★): thou playedst the harlot — the covenant-bride turned
    ('canon','ezekiel',16,15,'canon','hosea',2,5,'free',
      E'*For their mother hath played the harlot... for she said, I will go after my lovers, that give me my bread and my water, my wool and my flax, mine oil and my drink* (Hosea 2:5). The bride who *didst trust in thine own beauty, and playedst the harlot... and pouredst out thy fornications on every one that passed by* (Ezekiel 16:15) is the harlot-mother of Hosea, chasing lovers for the very gifts her Husband gave. The idolatry is adultery: she credits her lovers for the bread Yahuah provided.'),
    ('canon','ezekiel',16,15,'canon','hosea',2,13,'free',
      E'*And I will visit upon her the days of Baalim, wherein she burned incense to them, and she decked herself with her earrings and her jewels, and she went after her lovers, and forgat me, saith Yahuah (LORD)* (Hosea 2:13). The bride who took *my gold and... my silver, which I had given thee* and made idols (Ezekiel 16:17), decking her high places, is Hosea''s wife decking herself with her jewels for the Baalim — and *forgat me*. The ornaments Yahuah gave become the harlot''s adornment for her lovers.'),
    ('canon','ezekiel',16,32,'canon','hosea',2,2,'free',
      E'*Plead with your mother, plead: for she is not my wife, neither am I her husband: let her therefore put away her whoredoms out of her sight, and her adulteries from between her breasts* (Hosea 2:2). The bride who is *as a wife that committeth adultery, which taketh strangers instead of her husband* (Ezekiel 16:32) stands under Hosea''s same lawsuit — *she is not my wife*. Yet the very plea is a call to put away the whoredoms and return; the covenant-suit aims at restoration, not divorce final.'),
    ('canon','ezekiel',16,15,'canon','jeremiah',3,1,'free',
      E'*If a man put away his wife, and she go from him, and become another man''s, shall he return unto her again?... but thou hast played the harlot with many lovers; yet return again to me, saith Yahuah (LORD)* (Jeremiah 3:1). The harlotry of *playedst the harlot... on every one that passed by* (Ezekiel 16:15) is Jeremiah''s *thou hast played the harlot with many lovers* — and the same astonishing word follows: *yet return again to me*. The covenant-lawsuit against the bride''s SIN is never ethnic hatred; it ends in the offer of return.'),
    ('canon','ezekiel',16,26,'canon','jeremiah',2,20,'free',
      E'*For of old time I have broken thy yoke, and burst thy bands; and thou saidst, I will not transgress; when upon every high hill and under every green tree thou wanderest, playing the harlot* (Jeremiah 2:20). The fornication *with the Egyptians thy neighbours... to provoke me to anger* (Ezekiel 16:26) is Jeremiah''s harlotry *upon every high hill and under every green tree* — the same picture of the covenant-bride chasing other gods on the high places. The conduct is indicted, the people still beloved and called.'),

    -- THREAD 4 (★): thy elder sister Samaria, thy younger Sodom
    ('canon','ezekiel',16,48,'canon','matthew',11,24,'free',
      E'*But I say unto you, That it shall be more tolerable for the land of Sodom in the day of judgment, than for thee* (Matthew 11:24). Yahuah''s verdict *Sodom thy sister hath not done... as thou hast done* (Ezekiel 16:48) is the Messiah''s word over Capernaum — *more tolerable for the land of Sodom... than for thee*. Greater light brings greater account: the city with more revelation is more guilty than Sodom, which had less.'),
    ('canon','ezekiel',16,48,'canon','matthew',10,15,'free',
      E'*Verily I say unto you, It shall be more tolerable for the land of Sodom and Gomorrha in the day of judgment, than for that city* (Matthew 10:15). The measure of Ezekiel — *Sodom thy sister hath not done... as thou hast done, thou and thy daughters* (Ezekiel 16:48) — is the measure the Son gives the cities that reject his apostles. The one who heard and refused is judged more strictly than Sodom, who never heard.'),
    ('canon','ezekiel',16,51,'canon','luke',12,48,'free',
      E'*For unto whomsoever much is given, of him shall be much required: and to whom men have committed much, of him they will ask the more* (Luke 12:48). The charge *thou hast multiplied thine abominations more than they, and hast justified thy sisters* (Ezekiel 16:51) rests on this principle — Jerusalem, given the covenant, the Torah, the prophets, the temple, is held to more than Samaria or Sodom. To whom much is given, much is required: her greater light is her greater reckoning.'),

    -- THREAD 5 (★★★): Nevertheless I will remember my covenant — the everlasting covenant
    ('canon','ezekiel',16,60,'canon','hosea',2,19,'free',
      E'*And I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19). The promise *I will remember my covenant with thee in the days of thy youth, and I will establish unto thee an everlasting covenant* (Ezekiel 16:60) is Hosea''s everlasting betrothal — the unfaithful wife re-wed *for ever*, in righteousness and mercy. The harlot-bride is not cast off but remarried, the marriage made unbreakable.'),
    ('canon','ezekiel',16,60,'canon','hosea',2,20,'free',
      E'*I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* (Hosea 2:20). The *everlasting covenant* of Ezekiel 16:60, sealed so that *thou shalt know that I am Yahuah (LORD)* (16:62), is Hosea''s betrothal *in faithfulness* whose end is the same: *and thou shalt know Yahuah*. The restored bride is bound to a faithful Husband and brought to know him.'),
    ('canon','ezekiel',16,60,'canon','jeremiah',31,31,'free',
      E'*Behold, the days come, saith Yahuah (LORD), that I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah)* (Jeremiah 31:31). The *everlasting covenant* Yahuah will *establish unto thee* (Ezekiel 16:60) is the new covenant Jeremiah names — made with BOTH houses, Yashar''el and Yahudah, the two-house bride re-betrothed. The everlasting covenant is not a covenant abolished but a covenant renewed and made unbreakable.'),
    ('canon','ezekiel',16,62,'canon','jeremiah',31,33,'free',
      E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel)... I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). When Yahuah says *I will establish my covenant with thee; and thou shalt know that I am Yahuah (LORD)* (Ezekiel 16:62), the new-covenant content is Jeremiah''s — the Torah written on the heart, the covenant-formula sealed: *they shall be my people*. The everlasting covenant is the instruction written within, not the instruction discarded.'),
    ('canon','ezekiel',16,60,'canon','ephesians',5,25,'free',
      E'*Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25). The Husband who, after all her harlotry, says *Nevertheless I will remember my covenant... and I will establish unto thee an everlasting covenant* (Ezekiel 16:60), is the One who *loved the church, and gave himself for it* — love that takes the unfaithful bride and gives himself to redeem her. The everlasting covenant is sealed by the Husband''s self-giving love.'),
    ('canon','ezekiel',16,63,'canon','ephesians',5,27,'free',
      E'*That he might present it to himself a glorious church, not having spot, or wrinkle, or any such thing; but that it should be holy and without blemish* (Ephesians 5:27). The bride brought to *remember, and be confounded... when I am pacified toward thee for all that thou hast done* (Ezekiel 16:63) is the church the Husband cleanses and presents glorious — the spotted, harlot-bride washed and made *without blemish*. The shame remembered and the spotless bride presented are the two ends of the same redeeming mercy.'),
    ('canon','ezekiel',16,60,'canon','revelation',21,2,'free',
      E'*And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2). The Jerusalem of the foundling, the harlot, and the everlasting covenant (Ezekiel 16:60) reaches her consummation as the *new Jerusalem... prepared as a bride adorned for her husband*. The infant cast out in the field ends as the bride descending from heaven, fully adorned for her Husband at last.'),
    ('canon','ezekiel',16,60,'canon','revelation',19,7,'free',
      E'*Let us be glad and rejoice, and give honour to him: for the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7). The everlasting covenant *I will establish unto thee* (Ezekiel 16:60) ends in *the marriage of the Lamb* — the once-faithless wife now made ready, the betrothal of the foundling fulfilled in the wedding-feast. The everlasting covenant of Ezekiel and the marriage of the Lamb are one promise consummated.'),
    ('canon','ezekiel',16,60,'canon','romans',11,29,'free',
      E'*For the gifts and calling of Elohim (God) are without repentance* (Romans 11:29). The reason the covenant holds despite all her harlotry — *Nevertheless I will remember my covenant... and I will establish unto thee an everlasting covenant* (Ezekiel 16:60) — is the reason Paul names: the gifts and calling are *without repentance*, never recalled. Yahuah does not unmake the bride he chose; the everlasting covenant cannot be broken from his side.'),
    ('canon','ezekiel',16,63,'canon','romans',11,27,'free',
      E'*For this is my covenant unto them, when I shall take away their sins* (Romans 11:27). The pacifying *when I am pacified toward thee for all that thou hast done* (Ezekiel 16:63) is the covenant Paul cites — *my covenant... when I shall take away their sins*. The everlasting covenant rests on Yahuah taking away the sins he has just judged; the bride is reconciled because her sin is borne away.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-16-when-thou-wast-in-thy-blood-live-the-foundling-betrothed',
       E'When thou wast in thy blood, Live — the foundling found, raised, and betrothed',
       E'The allegory opens on the abandoned infant — Jerusalem''s own origin laid bare: *as for thy nativity, in the day thou wast born thy navel was not cut, neither wast thou washed in water to supple thee* (16:4), *None eye pitied thee, to do any of these unto thee, to have compassion upon thee; but thou wast cast out in the open field, to the lothing of thy person, in the day that thou wast born* (16:5). Into that helplessness Yahuah passes and speaks life: *And when I passed by thee, and saw thee polluted in thine own blood, I said unto thee when thou wast in thy blood, Live; yea, I said unto thee when thou wast in thy blood, Live* (16:6). He raises her, and when she is grown he betroths her: *Now when I passed by thee, and looked upon thee, behold, thy time was the time of love; and I spread my skirt over thee, and covered thy nakedness: yea, I sware unto thee, and entered into a covenant with thee, saith Adonai Yahuah (the Lord GOD), and thou becamest mine* (16:8). This is electing love on the helpless — chosen not for worth but for mercy, exactly as Yashar''el (Israel) was chosen: *Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people: But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers* (Deuteronomy 7:7-8). The one who *becamest mine* is the *peculiar treasure unto me above all people* (Exodus 19:5), taken into covenant at the mount. The New Testament names the same mercy: *I will call them my people, which were not my people; and her beloved, which was not beloved* (Romans 9:25) — the not-people made his own; and *Not by works of righteousness which we have done, but according to his mercy he saved us, by the washing of regeneration* (Titus 3:5) — for the foundling brought nothing but her blood, and he brought the washing (16:9) and the life. The covenant begins not in her beauty but in his love over a child no eye pitied.',
       sv.verse_id, ev.verse_id, 'free', 32375
  FROM _s308_ezek16_lookup sv, _s308_ezek16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=16 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-16-i-decked-thee-the-bride-adorned-by-my-comeliness',
       E'I decked thee with ornaments — the bride adorned by my comeliness',
       E'Having betrothed the foundling, Yahuah clothes and crowns her with his own glory: *Then washed I thee with water; yea, I throughly washed away thy blood from thee, and I anointed thee with oil* (16:9); *I clothed thee also with broidered work... I girded thee about with fine linen, and I covered thee with silk* (16:10); *I decked thee also with ornaments, and I put bracelets upon thy hands, and a chain on thy neck* (16:11); *And I put a jewel on thy forehead, and earrings in thine ears, and a beautiful crown upon thine head* (16:12). The result is splendour — *thou wast exceeding beautiful, and thou didst prosper into a kingdom* (16:13) — but the key is the next word: *And thy renown went forth among the heathen for thy beauty: for it was perfect through my comeliness, which I had put upon thee, saith Adonai Yahuah (the Lord GOD)* (16:14). Her beauty is HIS gift, not her merit. So the wedding-psalm sings: *The king''s daughter is all glorious within: her clothing is of wrought gold. She shall be brought unto the king in raiment of needlework* (Psalm 45:13-14) — brought, not self-arrayed. So Isaiah: *he hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness... as a bride adorneth herself with her jewels* (Isaiah 61:10). And so the Lamb''s wife: *to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints* (Revelation 19:8) — granted, not earned; *the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7), the foundling Yahuah *caused to multiply as the bud of the field* (16:7) grown up unto her wedding. Every thread of her beauty was woven by her Husband: it was perfect through HIS comeliness.',
       sv.verse_id, ev.verse_id, 'free', 32378
  FROM _s308_ezek16_lookup sv, _s308_ezek16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=16 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-16-thou-playedst-the-harlot-the-covenant-bride-turned',
       E'But thou didst trust in thine own beauty — the covenant-bride turned harlot',
       E'The gift becomes the snare. The bride takes the beauty her Husband gave and turns it against him: *But thou didst trust in thine own beauty, and playedst the harlot because of thy renown, and pouredst out thy fornications on every one that passed by* (16:15). She takes *thy fair jewels of my gold and of my silver, which I had given thee, and madest to thyself images of men, and didst commit whoredom with them* (16:17), sets his oil and incense before idols (16:18-19), even sacrifices the children she bore him (16:20-21). She fornicates with Egypt (16:26), Assyria (16:28), Chaldea (16:29) — and worse than a harlot, *as a wife that committeth adultery, which taketh strangers instead of her husband* (16:32), she pays her lovers rather than taking hire (16:33-34). This is idolatry read as spiritual adultery, the covenant-lawsuit against SIN — and the prophets sing it in one voice. Hosea: *she is not my wife, neither am I her husband* (Hosea 2:2); *she... went after her lovers* (Hosea 2:5); *she decked herself with her earrings and her jewels, and she went after her lovers, and forgat me* (Hosea 2:13) — the very ornaments Yahuah gave, worn for the Baalim. Jeremiah: *upon every high hill and under every green tree thou wanderest, playing the harlot* (Jeremiah 2:20); *thou hast played the harlot with many lovers; yet return again to me, saith Yahuah (LORD)* (Jeremiah 3:1). The apostle gives the same charge to the worldly heart: *Ye adulterers and adulteresses, know ye not that the friendship of the world is enmity with Elohim (God)?* (James 4:4). Mark the frame: this is lawsuit against conduct WITHIN the covenant, never an ethnic accusation. The unfaithful wife is still the beloved — even the indictment ends, *yet return again to me*. The judgment that follows (the lovers gathered against her, 16:37; judged *as women that break wedlock*, 16:38) is the grief of a wronged Husband, not the hatred of an enemy.',
       sv.verse_id, ev.verse_id, 'free', 32381
  FROM _s308_ezek16_lookup sv, _s308_ezek16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=16 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-16-thy-elder-sister-samaria-thy-younger-sodom',
       E'Thy elder sister is Samaria, thy younger Sodom — more guilty for her greater light',
       E'Yahuah names the bride''s sisters and turns the verdict against her own pride: *And thine elder sister is Samaria, she and her daughters that dwell at thy left hand: and thy younger sister, that dwelleth at thy right hand, is Sodom and her daughters* (16:46). The shock is that Jerusalem is worse than both: *as if that were a very little thing, thou wast corrupted more than they in all thy ways* (16:47); *Sodom thy sister hath not done, she nor her daughters, as thou hast done* (16:48); *Neither hath Samaria committed half of thy sins; but thou hast multiplied thine abominations more than they, and hast justified thy sisters in all thine abominations which thou hast done* (16:51). She made Sodom and Samaria look righteous by comparison — *they are more righteous than thou* (16:52). The reason is greater light: Jerusalem had the covenant, the Torah, the temple, the prophets, and sinned against all of it. The Messiah lays down the same measure: *it shall be more tolerable for the land of Sodom in the day of judgment, than for thee* (Matthew 11:24); *more tolerable for the land of Sodom and Gomorrha in the day of judgment, than for that city* (Matthew 10:15) — the city that hears and refuses is judged more strictly than the city that never heard. The principle is named outright: *unto whomsoever much is given, of him shall be much required* (Luke 12:48). And note the two-house weight: Samaria the elder sister is the northern kingdom, the house of Yashar''el (Israel) divided from Yahudah (Judah) — her sin already judged, named here as kin, set within the same family of the covenant. Greater revelation is greater reckoning; the bride with the most light bears the heaviest account.',
       sv.verse_id, ev.verse_id, 'free', 32384
  FROM _s308_ezek16_lookup sv, _s308_ezek16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=46
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=16 AND ev.verse_number=52
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ezekiel-16-nevertheless-i-will-remember-my-covenant-everlasting',
       E'Nevertheless I will remember my covenant — an everlasting covenant, the bride restored',
       E'After all the harlotry and all the judgment, the allegory turns on one word: *Nevertheless*. Though she *despised the oath in breaking the covenant* (16:59), Yahuah will not break it from his side: *Nevertheless I will remember my covenant with thee in the days of thy youth, and I will establish unto thee an everlasting covenant* (16:60); *And I will establish my covenant with thee; and thou shalt know that I am Yahuah (LORD)* (16:62); *That thou mayest remember, and be confounded, and never open thy mouth any more because of thy shame, when I am pacified toward thee for all that thou hast done, saith Adonai Yahuah (the Lord GOD)* (16:63). Mercy triumphs; the unfaithful wife is re-wed. Hosea names the same everlasting remarriage: *I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19), *I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* (Hosea 2:20) — the very end Ezekiel names, *thou shalt know that I am Yahuah*. The everlasting covenant is the new covenant Jeremiah foretells, made with BOTH houses: *I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah)* (Jeremiah 31:31), *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33) — the Torah written within, not discarded. The Husband who re-establishes the covenant is the One who *loved the church, and gave himself for it* (Ephesians 5:25), *That he might present it to himself a glorious church, not having spot, or wrinkle, or any such thing; but that it should be holy and without blemish* (Ephesians 5:27) — the spotted harlot-bride washed and presented spotless. And the arc that began with the infant cast out in the field ends with the bride descending from heaven: *new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2); *the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7). Why does the covenant hold despite everything? *For the gifts and calling of Elohim (God) are without repentance* (Romans 11:29); *this is my covenant unto them, when I shall take away their sins* (Romans 11:27). The everlasting covenant cannot be broken from Yahuah''s side — it is the restored two-house bride, found as a foundling, faithless as a harlot, and re-wed forever.',
       sv.verse_id, ev.verse_id, 'free', 32387
  FROM _s308_ezek16_lookup sv, _s308_ezek16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=59
   AND ev.edition_slug='canon' AND ev.book_slug='ezekiel' AND ev.chapter_number=16 AND ev.verse_number=63
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *not because ye were more in number... But because Yahuah (LORD) loved you* (Deuteronomy 7:7-8) — the foundling is chosen as Yashar''el (Israel) was: not for merit but for love. (v.7)'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=8
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-when-thou-wast-in-thy-blood-live-the-foundling-betrothed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers* (Deuteronomy 7:8) — the covenant-oath of *I sware unto thee* (Ezekiel 16:8); electing love keeps the oath.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=8
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-when-thou-wast-in-thy-blood-live-the-foundling-betrothed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *then ye shall be a peculiar treasure unto me above all people* (Exodus 19:5) — the one who *becamest mine* (Ezekiel 16:8) is the treasured people taken into covenant at Sinai.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=8
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-when-thou-wast-in-thy-blood-live-the-foundling-betrothed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *I will call them my people, which were not my people; and her beloved, which was not beloved* (Romans 9:25) — *Live* (Ezekiel 16:6) is the electing mercy; the not-people made his own.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=6
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-when-thou-wast-in-thy-blood-live-the-foundling-betrothed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Not by works of righteousness which we have done, but according to his mercy he saved us, by the washing of regeneration* (Titus 3:5) — the foundling brought only her blood; he brought the washing (16:9) and the life.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=6
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='titus' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-when-thou-wast-in-thy-blood-live-the-foundling-betrothed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *The king''s daughter is all glorious within: her clothing is of wrought gold* (Psalm 45:13) — the bride decked with gold (Ezekiel 16:13); her glory is the King''s gift.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=13
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=45 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-i-decked-thee-the-bride-adorned-by-my-comeliness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*She shall be brought unto the king in raiment of needlework* (Psalm 45:14) — the broidered work of Ezekiel 16:13; she is arrayed and brought, not self-adorned.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=13
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=45 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-i-decked-thee-the-bride-adorned-by-my-comeliness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *he hath clothed me with the garments of salvation... as a bride adorneth herself with her jewels* (Isaiah 61:10) — the renown perfect through *my comeliness* (Ezekiel 16:14); borrowed glory.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=14
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-i-decked-thee-the-bride-adorned-by-my-comeliness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints* (Revelation 19:8) — the Lamb''s wife; her beauty *was granted*, not earned, as it was *perfect through my comeliness* (Ezekiel 16:14).'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=14
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-i-decked-thee-the-bride-adorned-by-my-comeliness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7) — the foundling caused to grow *as the bud of the field* (Ezekiel 16:7) grown up unto her wedding.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=7
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-i-decked-thee-the-bride-adorned-by-my-comeliness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *she... went after her lovers, that give me my bread and my water* (Hosea 2:5) — the bride trusting her beauty and chasing lovers (Ezekiel 16:15); she credits her lovers for the gifts Yahuah gave.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=15
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-thou-playedst-the-harlot-the-covenant-bride-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *she decked herself with her earrings and her jewels, and she went after her lovers, and forgat me* (Hosea 2:13) — the ornaments Yahuah gave (Ezekiel 16:17) worn for the Baalim.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=15
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-thou-playedst-the-harlot-the-covenant-bride-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *she is not my wife, neither am I her husband: let her therefore put away her whoredoms* (Hosea 2:2) — the wife taking strangers (Ezekiel 16:32); the plea aims at return, not final divorce.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=32
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-thou-playedst-the-harlot-the-covenant-bride-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *thou hast played the harlot with many lovers; yet return again to me, saith Yahuah (LORD)* (Jeremiah 3:1) — the harlotry of Ezekiel 16:15; the lawsuit ends in the offer of return.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=15
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-thou-playedst-the-harlot-the-covenant-bride-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *upon every high hill and under every green tree thou wanderest, playing the harlot* (Jeremiah 2:20) — the fornication with Egypt (Ezekiel 16:26); the covenant-bride chasing other gods on the high places.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=26
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=2 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-thou-playedst-the-harlot-the-covenant-bride-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *Ye adulterers and adulteresses, know ye not that the friendship of the world is enmity with Elohim (God)?* (James 4:4) — the apostolic echo; idolatry/worldliness as spiritual adultery against the covenant-Husband.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=15
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-thou-playedst-the-harlot-the-covenant-bride-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *more tolerable for the land of Sodom in the day of judgment, than for thee* (Matthew 11:24) — the Messiah''s word echoes *Sodom thy sister hath not done... as thou hast done* (Ezekiel 16:48); greater light, greater account.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=48
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-thy-elder-sister-samaria-thy-younger-sodom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *more tolerable for the land of Sodom and Gomorrha in the day of judgment, than for that city* (Matthew 10:15) — the same measure; the one who hears and refuses judged more strictly than Sodom.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=48
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-thy-elder-sister-samaria-thy-younger-sodom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *unto whomsoever much is given, of him shall be much required* (Luke 12:48) — the principle behind *thou hast multiplied thine abominations more than they* (Ezekiel 16:51); Jerusalem''s greater light is her greater reckoning.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=51
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=48
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-thy-elder-sister-samaria-thy-younger-sodom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *I will betroth thee unto me for ever... in lovingkindness, and in mercies* (Hosea 2:19) — the everlasting covenant (Ezekiel 16:60); the unfaithful wife re-wed forever.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=60
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-nevertheless-i-will-remember-my-covenant-everlasting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* (Hosea 2:20) — the same end as *thou shalt know that I am Yahuah* (Ezekiel 16:62); the restored bride brought to know him.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=60
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-nevertheless-i-will-remember-my-covenant-everlasting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah)* (Jeremiah 31:31) — the everlasting covenant (Ezekiel 16:60) is the new covenant with BOTH houses; the two-house bride.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=60
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-nevertheless-i-will-remember-my-covenant-everlasting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *I will put my law in their inward parts, and write it in their hearts... they shall be my people* (Jeremiah 31:33) — the everlasting covenant (Ezekiel 16:62) is the Torah written within, not discarded.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=62
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-nevertheless-i-will-remember-my-covenant-everlasting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25) — the Husband''s self-giving love behind *Nevertheless I will remember my covenant* (Ezekiel 16:60).'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=60
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-nevertheless-i-will-remember-my-covenant-everlasting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *a glorious church, not having spot, or wrinkle... holy and without blemish* (Ephesians 5:27) — the spotted harlot-bride (Ezekiel 16:63) washed and presented spotless; shame remembered, blemish removed.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=63
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-nevertheless-i-will-remember-my-covenant-everlasting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2) — the foundling''s arc consummated; the infant cast in the field is the bride descending from heaven (Ezekiel 16:60).'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=60
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-nevertheless-i-will-remember-my-covenant-everlasting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7) — the everlasting betrothal of Ezekiel 16:60 fulfilled in the wedding-feast of the Lamb.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=60
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-nevertheless-i-will-remember-my-covenant-everlasting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★★ *the gifts and calling of Elohim (God) are without repentance* (Romans 11:29) — why the covenant holds despite all her harlotry (Ezekiel 16:60); Yahuah does not unmake the bride he chose.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=60
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-nevertheless-i-will-remember-my-covenant-everlasting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'★ *this is my covenant unto them, when I shall take away their sins* (Romans 11:27) — the pacifying of Ezekiel 16:63; the bride reconciled because her sin is borne away.'
  FROM cross_reference_threads t
  JOIN _s308_ezek16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ezekiel' AND sv.chapter_number=16 AND sv.verse_number=63
  JOIN _s308_ezek16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ezekiel-16-nevertheless-i-will-remember-my-covenant-everlasting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session308 — Ezekiel cross-references complete.'
