-- ----- fragment: minion_2thessalonians_01.sql (S234 2 Thessalonians 1) -----
-- =====================================================================
-- S234 minion — 2 THESSALONIANS 1 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 THESSALONIANS 1 (12 verses) — the coming in flaming fire / vengeance / glorified in his saints.
-- Tag: t201 (temp view _s234_t201_lookup).
-- Sort band: floor 8200, step 3 (8200, 8203, 8206, 8209, 8212 used; under 8225).
-- Source is ALWAYS the canon 2 Thessalonians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul comforts the persecuted called-out ones with the day Yahusha (Jesus) is revealed
-- from heaven. This is no new program — it is the day of Yahuah of the Tanakh: Yahuah comes with fire to
-- render his anger (Isaiah 66:15-16), the fiery stream before the Ancient of Days where the judgment is
-- set and the books opened (Daniel 7:9-10), the proud who hide for fear of Yahuah and the glory of his
-- majesty (Isaiah 2:10,19). The Formed comes to be glorified in his saints — Elohim greatly feared in the
-- assembly of the saints (Psalm 89:7). The persecuted who endure are counted worthy of the kingdom: the
-- saints of the El Elyon possess the kingdom for ever (Daniel 7:18,22), the elect protected in the day of
-- tribulation (1 Enoch 1:8). The Hebrew library beheld this same day of judgment — He cometh with ten
-- thousands of His set-apart ones to execute judgement and destroy the ungodly (1 Enoch 1:9), the man who
-- sends a blast of fire from his mouth and burns the gathered enemies (2 Esdras 13:10-11), the Most High
-- upon the seat of judgment (2 Esdras 7:33-35). Christology: the Father RAISED and now REVEALS the Son
-- from heaven; the Son is the Formed, sent, returning to gather his own and to consume the wicked — no
-- co-equal-persons grammar. The vengeance falls on the persecuting wicked, NOT on Israel; the saints are
-- the gathered house, not a church replacing Israel.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   greeting; thanks for faith and charity growing
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (epistolary form)
--   v.4-5   patience and faith in persecutions; counted worthy of the kingdom of Elohim
--           Tanakh: Daniel 7:18 (the saints take the kingdom and possess it for ever), Daniel 7:22
--                   (the saints possessed the kingdom)
--           Extras: 1 Enoch 1:8 (with the righteous He will make peace, protect the elect, mercy upon them)
--           NT: none warranted (carried in prose)
--   v.7-8   the Lord Yahusha revealed from heaven with his mighty angels, in flaming fire taking vengeance
--           Tanakh: Isaiah 66:15-16 (Yahuah will come with fire... by fire... will Yahuah plead with all
--                   flesh), Daniel 7:9-10 (the Ancient of days... his throne like the fiery flame... a
--                   fiery stream... the judgment was set, and the books were opened)
--           Extras: 1 Enoch 1:9 (He cometh with ten thousands of His set-apart ones to execute judgement
--                   and destroy the ungodly), 2 Esdras 13:10-11 (he sent out of his mouth a blast of
--                   fire... and burned them up every one)
--           NT: none warranted (the day-of-Yahuah root is the Tanakh + extras weight here)
--   v.9     punished with everlasting destruction from the presence of Yahuah and the glory of his power
--           Tanakh: Isaiah 2:10 (hide thee in the dust, for fear of Yahuah, and for the glory of his
--                   majesty), Isaiah 2:19 (into the caves of the earth, for fear of Yahuah... when he
--                   ariseth to shake terribly the earth)
--           Extras: none warranted (carried in the vengeance/judgment threads)   NT: none warranted
--   v.10    glorified in his saints, admired in all them that believe, in that day
--           Tanakh: Psalm 89:7 (Elohim is greatly to be feared in the assembly of the saints, and to be
--                   had in reverence of all them that are about him)
--           Extras: none warranted   NT: none warranted
--   v.11-12 the name of our Lord Yahusha HaMashiach glorified in you, and ye in him
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (carried at v.10)
--
-- THREADS (slug -> target libraries):
--   8200 2-thessalonians-1-revealed-from-heaven-in-flaming-fire-taking-vengeance-isaiah-66-daniel-7  (Tanakh + Extras)
--   8203 2-thessalonians-1-everlasting-destruction-from-the-presence-of-yahuah-and-the-glory-isaiah-2  (Tanakh)
--   8206 2-thessalonians-1-glorified-in-his-saints-elohim-feared-in-the-assembly-psalm-89  (Tanakh)
--   8209 2-thessalonians-1-counted-worthy-of-the-kingdom-the-saints-possess-it-daniel-7  (Tanakh + Extras)
--   8212 2-thessalonians-1-the-day-the-most-high-appears-upon-the-seat-of-judgment-2-esdras-7-1-enoch-100  (Extras)
-- =====================================================================

CREATE TEMP VIEW _s234_t201_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-thessalonians-1-revealed-from-heaven-in-flaming-fire-taking-vengeance-isaiah-66-daniel-7
  ('canon', '2-thessalonians', 1, 8, 'canon', 'isaiah', 66, 15, 'free', E'*For, behold, Yahuah (LORD) will come with fire, and with his chariots like a whirlwind, to render his anger with fury, and his rebuke with flames of fire.* (Isaiah 66:15). Paul''s word that *the Lord Yahusha (Lord Jesus) shall be revealed from heaven with his mighty angels, In flaming fire taking vengeance* (2 Thessalonians 1:7-8) is the day of Yahuah Isaiah saw: Yahuah comes *with fire... to render his anger with fury... with flames of fire.* The flaming fire of the appearing is not a new image but the Tanakh''s own; the One revealed from heaven in fire is the Formed, sent by the Father, who comes as Yahuah (LORD) was always said to come.'),
  ('canon', '2-thessalonians', 1, 8, 'canon', 'isaiah', 66, 16, 'free', E'*For by fire and by his sword will Yahuah (LORD) plead with all flesh: and the slain of Yahuah (LORD) shall be many.* (Isaiah 66:16). When the Lord Yahusha (Lord Jesus) is revealed *In flaming fire taking vengeance on them that know not Elohim (God), and that obey not the gospel* (2 Thessalonians 1:8), it is this pleading *by fire and by his sword* with all flesh. The vengeance falls on the persecuting wicked who know not Elohim (God) — *the slain of Yahuah (LORD)* — not on his covenant people; the same fire that judges the rebel is the fire that vindicates the troubled who are given rest with the apostles.'),
  ('canon', '2-thessalonians', 1, 7, 'canon', 'daniel', 7, 9, 'free', E'*I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* (Daniel 7:9). Daniel saw the throne of judgment *like the fiery flame,* the wheels *as burning fire.* It is the same fiery appearing Paul promises: *the Lord Yahusha (Lord Jesus) shall be revealed from heaven with his mighty angels* (2 Thessalonians 1:7). The fire of the Ancient of Days'' throne is the flaming fire in which the Formed comes; the revealing from heaven is the court of Daniel 7 come to render its verdict.'),
  ('canon', '2-thessalonians', 1, 8, 'canon', 'daniel', 7, 10, 'free', E'*A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* (Daniel 7:10). The *fiery stream* before the throne, the *ten thousand times ten thousand* who stand before him, the set judgment — this is the appearing Paul names, when the Lord Yahusha (Lord Jesus) is revealed *with his mighty angels, In flaming fire taking vengeance* (2 Thessalonians 1:7-8). The mighty angels are the ministering host of Daniel''s court; the flaming fire is the fiery stream; the vengeance on them that obey not is the verdict of the opened books.'),
  ('canon', '2-thessalonians', 1, 8, 'enoch', '1-enoch', 1, 9, 'extras', E'*And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly: And to convict all flesh Of all the works of their ungodliness which they have ungodly committed.* (1 Enoch 1:9). The Hebrew library beheld the very coming Paul proclaims: He *cometh with ten thousands of His set-apart ones To execute judgement... And to destroy all the ungodly.* So *the Lord Yahusha (Lord Jesus) shall be revealed from heaven with his mighty angels, In flaming fire taking vengeance on them that know not Elohim (God)* (2 Thessalonians 1:7-8) — the ten thousands of the set-apart ones are the mighty angels, and the judgment to destroy the ungodly is the vengeance on them that obey not the gospel.'),
  ('canon', '2-thessalonians', 1, 8, 'apocrypha', '2-esdras', 13, 10, 'extras', E'*But only I saw that he sent out of his mouth as it had been a blast of fire, and out of his lips a flaming breath, and out of his tongue he cast out sparks and tempests.* (2 Esdras 13:10). Esdras saw the man from the sea, against whom the nations gathered, send *out of his mouth... a blast of fire, and out of his lips a flaming breath.* This is the flaming fire of the appearing: *the Lord Yahusha (Lord Jesus) shall be revealed from heaven with his mighty angels, In flaming fire taking vengeance* (2 Thessalonians 1:7-8). The Formed revealed from heaven is the man of Esdras''s vision who consumes the assembled wicked with fire from his own mouth — the same vengeance, the same flame.'),
  -- thread: 2-thessalonians-1-everlasting-destruction-from-the-presence-of-yahuah-and-the-glory-isaiah-2
  ('canon', '2-thessalonians', 1, 9, 'canon', 'isaiah', 2, 10, 'free', E'*Enter into the rock, and hide thee in the dust, for fear of Yahuah (LORD), and for the glory of his majesty.* (Isaiah 2:10). The wicked are told to hide *for fear of Yahuah (LORD), and for the glory of his majesty.* Paul says they *shall be punished with everlasting destruction from the presence of Yahuah (Lord), and from the glory of his power* (2 Thessalonians 1:9). The two phrases are one: the *presence of Yahuah* is the *fear of Yahuah* before which they flee, and the *glory of his power* is the *glory of his majesty* — the proud cannot stand before the One revealed in fire.'),
  ('canon', '2-thessalonians', 1, 9, 'canon', 'isaiah', 2, 19, 'free', E'*And they shall go into the holes of the rocks, and into the caves of the earth, for fear of Yahuah (LORD), and for the glory of his majesty, when he ariseth to shake terribly the earth.* (Isaiah 2:19). When Yahuah (LORD) *ariseth to shake terribly the earth,* the lofty flee into the caves *for fear of Yahuah (LORD), and for the glory of his majesty.* This is the day of *everlasting destruction from the presence of Yahuah (Lord), and from the glory of his power* (2 Thessalonians 1:9): the destruction is not annihilation from his sight only but banishment from his presence, the same presence and glory the proud could not endure when he arose.'),
  -- thread: 2-thessalonians-1-glorified-in-his-saints-elohim-feared-in-the-assembly-psalm-89
  ('canon', '2-thessalonians', 1, 10, 'canon', 'psalms', 89, 7, 'free', E'*Elohim (God) is greatly to be feared in the assembly of the saints, and to be had in reverence of all them that are about him.* (Psalm 89:7). The psalmist sings that Elohim (God) is *greatly to be feared in the assembly of the saints.* Paul says the Lord comes *to be glorified in his saints, and to be admired in all them that believe... in that day* (2 Thessalonians 1:10). The assembly of the saints in which Elohim is feared and reverenced is the company in which the Formed is glorified and admired when he appears; the saints are not his audience only but the very place his glory shines, the gathered house in whom the day of his appearing is honoured.'),
  -- thread: 2-thessalonians-1-counted-worthy-of-the-kingdom-the-saints-possess-it-daniel-7
  ('canon', '2-thessalonians', 1, 5, 'canon', 'daniel', 7, 18, 'free', E'*But the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever, even for ever and ever.* (Daniel 7:18). Daniel was shown that after the beast wars upon them, *the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever.* Paul tells the persecuted that their patience is *a manifest token of the righteous judgment of Elohim (God), that ye may be counted worthy of the kingdom of Elohim (God), for which ye also suffer* (2 Thessalonians 1:5). The suffering saints counted worthy of the kingdom are the saints of the El Elyon (most High) who possess it for ever; the affliction now is the appointed path to the kingdom Daniel saw given them.'),
  ('canon', '2-thessalonians', 1, 5, 'canon', 'daniel', 7, 22, 'free', E'*Until the Ancient of days came, and judgment was given to the saints of the El Elyon (most High); and the time came that the saints possessed the kingdom.* (Daniel 7:22). The horn made war with the saints and prevailed against them *until the Ancient of days came, and judgment was given to the saints,* and they *possessed the kingdom.* This is Paul''s comfort to the troubled: the *righteous judgment of Elohim (God)* will *recompense tribulation to them that trouble you* and give *rest* to the afflicted (2 Thessalonians 1:5-7), counting them *worthy of the kingdom.* The coming of the Ancient of Days that turns the verdict for the warred-upon saints is the appearing that gives the persecuted Thessalonians their rest and their kingdom.'),
  ('canon', '2-thessalonians', 1, 4, 'enoch', '1-enoch', 1, 8, 'extras', E'*But with the righteous He will make peace. And will protect the elect, And mercy shall be upon them. And they shall all belong to Elohim (God), And they shall be prospered, And they shall all be blessed.* (1 Enoch 1:8). The library''s word of the day of tribulation is that with the righteous He makes peace and *will protect the elect, And mercy shall be upon them.* So Paul glories *in you... for your patience and faith in all your persecutions and tribulations that ye endure* (2 Thessalonians 1:4): the elect protected and blessed in the day of judgment are the patient sufferers whom Elohim counts worthy, given rest when the Formed is revealed.'),
  -- thread: 2-thessalonians-1-the-day-the-most-high-appears-upon-the-seat-of-judgment-2-esdras-7-1-enoch-100
  ('canon', '2-thessalonians', 1, 10, 'apocrypha', '2-esdras', 7, 33, 'extras', E'*And the Most High shall appear upon the seat of judgment, and misery shall pass away, and the long suffering shall have an end.* (2 Esdras 7:33). Esdras was shown that *the Most High shall appear upon the seat of judgment, and misery shall pass away.* Paul names that same appearing: *When he shall come to be glorified in his saints, and to be admired in all them that believe... in that day* (2 Thessalonians 1:10). The day the Most High appears upon the seat of judgment is the day the Formed comes to be glorified in his saints; for the persecuted, the misery passes away and the long suffering has its end.'),
  ('canon', '2-thessalonians', 1, 9, 'enoch', '1-enoch', 100, 9, 'extras', E'*Woe to you, ye sinners, on account of the words of your mouth, And on account of the deeds of your hands which your godlessness has wrought, In blazing flames burning worse than fire shall ye burn.* (1 Enoch 100:9). The library declares the godless shall burn *In blazing flames burning worse than fire.* Paul says they *shall be punished with everlasting destruction from the presence of Yahuah (Lord)* (2 Thessalonians 1:9), the same end for *them that know not Elohim (God), and that obey not the gospel* (2 Thessalonians 1:8). The blazing flames that requite the godless for the deeds of their hands are the flaming fire of the appearing; the everlasting destruction is the burning worse than fire the wicked are warned of.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s234_t201_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s234_t201_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-1-revealed-from-heaven-in-flaming-fire-taking-vengeance-isaiah-66-daniel-7',
       E'The Lord Yahusha revealed from heaven in flaming fire, taking vengeance (Isaiah 66, Daniel 7)',
       E'Paul comforts the persecuted with the day the Formed appears: *the Lord Yahusha (Lord Jesus) shall be revealed from heaven with his mighty angels, In flaming fire taking vengeance on them that know not Elohim (God), and that obey not the gospel of our Lord Yahusha HaMashiach (Lord Jesus Christ)* (2 Thessalonians 1:7-8). This is no new program — it is the day of Yahuah of the Tanakh. Isaiah saw it: *For, behold, Yahuah (LORD) will come with fire, and with his chariots like a whirlwind, to render his anger with fury, and his rebuke with flames of fire* (Isaiah 66:15), *For by fire and by his sword will Yahuah (LORD) plead with all flesh: and the slain of Yahuah (LORD) shall be many* (Isaiah 66:16). The flaming fire of the appearing is Yahuah''s own fire; the vengeance falls on the persecuting wicked who know not Elohim (God), not on his covenant people. Daniel saw the same court: *the Ancient of days did sit... his throne was like the fiery flame, and his wheels as burning fire. A fiery stream issued and came forth from before him: thousand thousands ministered unto him... the judgment was set, and the books were opened* (Daniel 7:9-10). The mighty angels are the ministering host; the flaming fire is the fiery stream; the vengeance is the verdict of the opened books. And the Hebrew library beheld this very coming: *behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly* (1 Enoch 1:9); and Esdras saw the man from the sea, against whom the nations gathered, who *sent out of his mouth as it had been a blast of fire, and out of his lips a flaming breath... and burned them up every one* (2 Esdras 13:10-11). The One revealed from heaven is the Formed, raised and sent by the Father, who comes as Yahuah was always said to come — with fire, with his angels, to render the long-awaited judgment and to give rest to the troubled who suffer for his name.',
       sv.verse_id, ev.verse_id, 'extras', 8200
  FROM _s234_t201_lookup sv, _s234_t201_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-1-everlasting-destruction-from-the-presence-of-yahuah-and-the-glory-isaiah-2',
       E'Everlasting destruction from the presence of Yahuah and the glory of his power (Isaiah 2)',
       E'The end of the persecuting wicked: they *shall be punished with everlasting destruction from the presence of Yahuah (Lord), and from the glory of his power* (2 Thessalonians 1:9). The phrasing is Isaiah''s twice-spoken word over the proud in the day Yahuah arises. *Enter into the rock, and hide thee in the dust, for fear of Yahuah (LORD), and for the glory of his majesty* (Isaiah 2:10); and again, *they shall go into the holes of the rocks, and into the caves of the earth, for fear of Yahuah (LORD), and for the glory of his majesty, when he ariseth to shake terribly the earth* (Isaiah 2:19). The *presence of Yahuah* from which they are destroyed is the *fear of Yahuah* before which they flee; the *glory of his power* is the *glory of his majesty* the lofty could not endure. The destruction is everlasting banishment from the presence of the One revealed in fire — the proud who exalted themselves brought low, *Yahuah (LORD) alone... exalted in that day.*',
       sv.verse_id, ev.verse_id, 'free', 8203
  FROM _s234_t201_lookup sv, _s234_t201_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-1-glorified-in-his-saints-elohim-feared-in-the-assembly-psalm-89',
       E'Glorified in his saints — Elohim greatly feared in the assembly of the saints (Psalm 89)',
       E'The other side of that day is glory, not for himself apart but in his own: *When he shall come to be glorified in his saints, and to be admired in all them that believe (because our testimony among you was believed) in that day* (2 Thessalonians 1:10). The psalmist sang of this very assembly: *Elohim (God) is greatly to be feared in the assembly of the saints, and to be had in reverence of all them that are about him* (Psalm 89:7). The company in which Elohim is feared and reverenced is the company in which the Formed is glorified and admired when he appears. The saints are not the audience of his glory only but the very place it shines — the gathered house in whom the day of his appearing is honoured. The persecuted Thessalonians, troubled now, are among *all them that believe* in whom he will be admired in that day.',
       sv.verse_id, ev.verse_id, 'free', 8206
  FROM _s234_t201_lookup sv, _s234_t201_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=1 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-1-counted-worthy-of-the-kingdom-the-saints-possess-it-daniel-7',
       E'Counted worthy of the kingdom — the saints of the El Elyon possess it for ever (Daniel 7)',
       E'Paul reads the suffering of the called-out ones as the appointed road to the kingdom: *we ourselves glory in you... for your patience and faith in all your persecutions and tribulations that ye endure: Which is a manifest token of the righteous judgment of Elohim (God), that ye may be counted worthy of the kingdom of Elohim (God), for which ye also suffer* (2 Thessalonians 1:4-5). Daniel was shown the same pattern from the other end. After the beast''s horn *made war with the saints, and prevailed against them,* the verdict turns: *the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever, even for ever and ever* (Daniel 7:18); *Until the Ancient of days came, and judgment was given to the saints of the El Elyon (most High); and the time came that the saints possessed the kingdom* (Daniel 7:22). The warred-upon saints who at last possess the kingdom are the persecuted Thessalonians counted worthy of it. The Hebrew library held the same comfort for the day of tribulation: with the righteous He makes peace and *will protect the elect, And mercy shall be upon them... And they shall all be blessed* (1 Enoch 1:8). The affliction is not the absence of the kingdom but the manifest token of it — the same righteous judgment that recompenses the troubler gives rest and the kingdom to the troubled.',
       sv.verse_id, ev.verse_id, 'extras', 8209
  FROM _s234_t201_lookup sv, _s234_t201_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=1 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-1-the-day-the-most-high-appears-upon-the-seat-of-judgment-2-esdras-7-1-enoch-100',
       E'The day the Most High appears upon the seat of judgment (2 Esdras 7, 1 Enoch 100)',
       E'The Hebrew library beheld the day Paul proclaims and named its two faces — the misery ended for the righteous, the burning flame for the godless. Esdras was shown that *the Most High shall appear upon the seat of judgment, and misery shall pass away, and the long suffering shall have an end* (2 Esdras 7:33); so the Formed comes *to be glorified in his saints, and to be admired in all them that believe... in that day* (2 Thessalonians 1:10), and for the troubled the misery passes away. But for the persecutor the same day burns: *Woe to you, ye sinners... In blazing flames burning worse than fire shall ye burn* (1 Enoch 100:9), the requital for *the deeds of your hands.* This is the *everlasting destruction* of *them that know not Elohim (God), and that obey not the gospel* (2 Thessalonians 1:8-9). One appearing, two ends: the seat of judgment that ends the suffering of the saints is the blazing flame that overtakes the wicked who afflicted them.',
       sv.verse_id, ev.verse_id, 'extras', 8212
  FROM _s234_t201_lookup sv, _s234_t201_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=1 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-thessalonians-1-revealed-from-heaven-in-flaming-fire-taking-vengeance-isaiah-66-daniel-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 66:15 — *Yahuah (LORD) will come with fire, and with his chariots like a whirlwind, to render his anger with fury... with flames of fire* the day-of-Yahuah fire behind *the Lord Yahusha (Lord Jesus) shall be revealed from heaven... In flaming fire* (2 Thessalonians 1:7-8).'
  FROM cross_reference_threads t, cross_references x, _s234_t201_lookup sv, _s234_t201_lookup tv
 WHERE t.slug='2-thessalonians-1-revealed-from-heaven-in-flaming-fire-taking-vengeance-isaiah-66-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 66:16 — *by fire and by his sword will Yahuah (LORD) plead with all flesh: and the slain of Yahuah (LORD) shall be many* the vengeance on the persecuting wicked, *taking vengeance on them that know not Elohim (God)* (2 Thessalonians 1:8); the slain are the rebel, not the covenant people.'
  FROM cross_reference_threads t, cross_references x, _s234_t201_lookup sv, _s234_t201_lookup tv
 WHERE t.slug='2-thessalonians-1-revealed-from-heaven-in-flaming-fire-taking-vengeance-isaiah-66-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:9 — *the Ancient of days did sit... his throne was like the fiery flame, and his wheels as burning fire* the fiery throne of judgment; the fire in which *the Lord Yahusha (Lord Jesus) shall be revealed from heaven with his mighty angels* (2 Thessalonians 1:7).'
  FROM cross_reference_threads t, cross_references x, _s234_t201_lookup sv, _s234_t201_lookup tv
 WHERE t.slug='2-thessalonians-1-revealed-from-heaven-in-flaming-fire-taking-vengeance-isaiah-66-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 7:10 — *A fiery stream issued... ten thousand times ten thousand stood before him: the judgment was set, and the books were opened* the angelic host and the set judgment; the mighty angels and the vengeance of *In flaming fire* (2 Thessalonians 1:8).'
  FROM cross_reference_threads t, cross_references x, _s234_t201_lookup sv, _s234_t201_lookup tv
 WHERE t.slug='2-thessalonians-1-revealed-from-heaven-in-flaming-fire-taking-vengeance-isaiah-66-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 1:9 — *He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly* the library''s same coming; the ten thousands are the mighty angels, the judgment the vengeance of 2 Thessalonians 1:7-8.'
  FROM cross_reference_threads t, cross_references x, _s234_t201_lookup sv, _s234_t201_lookup tv
 WHERE t.slug='2-thessalonians-1-revealed-from-heaven-in-flaming-fire-taking-vengeance-isaiah-66-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'2 Esdras 13:10 — *he sent out of his mouth as it had been a blast of fire, and out of his lips a flaming breath* the man from the sea who burns the gathered enemies; the flaming fire of the appearing (2 Thessalonians 1:8).'
  FROM cross_reference_threads t, cross_references x, _s234_t201_lookup sv, _s234_t201_lookup tv
 WHERE t.slug='2-thessalonians-1-revealed-from-heaven-in-flaming-fire-taking-vengeance-isaiah-66-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-thessalonians-1-everlasting-destruction-from-the-presence-of-yahuah-and-the-glory-isaiah-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 2:10 — *hide thee in the dust, for fear of Yahuah (LORD), and for the glory of his majesty* the proud flee his presence; *everlasting destruction from the presence of Yahuah (Lord), and from the glory of his power* (2 Thessalonians 1:9).'
  FROM cross_reference_threads t, cross_references x, _s234_t201_lookup sv, _s234_t201_lookup tv
 WHERE t.slug='2-thessalonians-1-everlasting-destruction-from-the-presence-of-yahuah-and-the-glory-isaiah-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 2:19 — *into the caves of the earth, for fear of Yahuah (LORD), and for the glory of his majesty, when he ariseth to shake terribly the earth* the same presence and glory the lofty cannot endure (2 Thessalonians 1:9).'
  FROM cross_reference_threads t, cross_references x, _s234_t201_lookup sv, _s234_t201_lookup tv
 WHERE t.slug='2-thessalonians-1-everlasting-destruction-from-the-presence-of-yahuah-and-the-glory-isaiah-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-thessalonians-1-glorified-in-his-saints-elohim-feared-in-the-assembly-psalm-89
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 89:7 — *Elohim (God) is greatly to be feared in the assembly of the saints, and to be had in reverence of all them that are about him* the assembly in which the Formed comes *to be glorified in his saints, and to be admired in all them that believe* (2 Thessalonians 1:10).'
  FROM cross_reference_threads t, cross_references x, _s234_t201_lookup sv, _s234_t201_lookup tv
 WHERE t.slug='2-thessalonians-1-glorified-in-his-saints-elohim-feared-in-the-assembly-psalm-89'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-thessalonians-1-counted-worthy-of-the-kingdom-the-saints-possess-it-daniel-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:18 — *the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever* the warred-upon saints who inherit; the persecuted *counted worthy of the kingdom of Elohim (God)* (2 Thessalonians 1:5).'
  FROM cross_reference_threads t, cross_references x, _s234_t201_lookup sv, _s234_t201_lookup tv
 WHERE t.slug='2-thessalonians-1-counted-worthy-of-the-kingdom-the-saints-possess-it-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:22 — *the Ancient of days came, and judgment was given to the saints of the El Elyon (most High); and the time came that the saints possessed the kingdom* the coming that turns the verdict for the warred-upon; the rest and kingdom given the troubled (2 Thessalonians 1:5-7).'
  FROM cross_reference_threads t, cross_references x, _s234_t201_lookup sv, _s234_t201_lookup tv
 WHERE t.slug='2-thessalonians-1-counted-worthy-of-the-kingdom-the-saints-possess-it-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 1:8 — *with the righteous He will make peace. And will protect the elect, And mercy shall be upon them... And they shall all be blessed* the elect kept in the day of tribulation; the patient sufferers Elohim counts worthy (2 Thessalonians 1:4).'
  FROM cross_reference_threads t, cross_references x, _s234_t201_lookup sv, _s234_t201_lookup tv
 WHERE t.slug='2-thessalonians-1-counted-worthy-of-the-kingdom-the-saints-possess-it-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-thessalonians-1-the-day-the-most-high-appears-upon-the-seat-of-judgment-2-esdras-7-1-enoch-100
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 7:33 — *the Most High shall appear upon the seat of judgment, and misery shall pass away, and the long suffering shall have an end* the day the Formed comes *to be glorified in his saints... in that day* (2 Thessalonians 1:10); the troubled''s misery ends.'
  FROM cross_reference_threads t, cross_references x, _s234_t201_lookup sv, _s234_t201_lookup tv
 WHERE t.slug='2-thessalonians-1-the-day-the-most-high-appears-upon-the-seat-of-judgment-2-esdras-7-1-enoch-100'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 100:9 — *Woe to you, ye sinners... In blazing flames burning worse than fire shall ye burn* the requital of the godless; the *everlasting destruction* of *them that... obey not the gospel* (2 Thessalonians 1:8-9).'
  FROM cross_reference_threads t, cross_references x, _s234_t201_lookup sv, _s234_t201_lookup tv
 WHERE t.slug='2-thessalonians-1-the-day-the-most-high-appears-upon-the-seat-of-judgment-2-esdras-7-1-enoch-100'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=100 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
