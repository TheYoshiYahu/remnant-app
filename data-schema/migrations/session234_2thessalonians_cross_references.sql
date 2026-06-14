-- =====================================================================
-- Session 234 — 2 Thessalonians FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session234_2thessalonians_cross_references.sql
-- =====================================================================

\echo 'session234 — 2 Thessalonians cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_2thessalonians_02.sql (S234 2 Thessalonians 2) -----
-- =====================================================================
-- S234 minion — 2 THESSALONIANS 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 THESSALONIANS 2 (17 verses) — ★★ HIGHEST watchpoint / BLESSING (the man of sin).
-- Tag: t202 (temp view _s234_t202_lookup).
-- Sort band: floor 8225, step 3 (8225, 8228, 8231, 8234, 8237 used; under 8250).
-- Source is ALWAYS the canon 2 Thessalonians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (2 Thess 2 = the falling away and the man of sin). The man of sin = the antichrist =
-- Daniel's little horn / the self-deifying tyrant already drawn in the Tanakh. The deceiver is the
-- COUNTERFEIT, not the covenant people; the *falling away* and *the temple* are NOT Israel cast off.
-- Build the man-of-sin thread on Daniel 11:36 + 7:25 + 8:25 + Isaiah 14:13-14 + Ezekiel 28:2 (the king
-- who exalts himself above every god, the self-deifying man who says he is Elohim), with NT twins
-- Matthew 24:15 (the abomination) and Revelation 13 (the beast who blasphemes). His consuming *with the
-- spirit of his mouth* (2:8) is Isaiah 11:4 (*with the breath of his lips shall he slay the wicked*) —
-- the Formed Son slays the Wicked by his word. *Our gathering together unto him* (2:1) is the SAME
-- ingathering as 1 Thess 4 / Isaiah 27:13 / 1 Cor 15:52 — the one great trump-gathering, NOT severed
-- from Israel's regathering. *Chosen from the beginning to salvation* (2:13) is the election of
-- Deuteronomy 7 carried into Ephesians 1:4. Christology: the Father chose and called (2:13-14); the Son
-- the Formed who consumes the Wicked at his coming. No replacement theology; the antichrist is the
-- self-exalting counterfeit, Israel is never replaced.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   our gathering together unto him; the day of Messiah
--           Tanakh: Isaiah 27:13 (the great trumpet shall be blown, and they shall come which were
--                   ready to perish... and shall worship Yahuah)
--           Extras: none warranted (carried at 2:8 / the day-tokens at 2:7,11)
--           NT: 1 Corinthians 15:52 (at the last trump... the dead shall be raised) — the one
--               ingathering, the same trump as 1 Thess 4
--   v.3-4   the man of sin revealed, who exalts himself above all called Elohim, sits in the temple
--           Tanakh: Daniel 11:36 (the king... shall exalt himself, and magnify himself above every
--                   god, and shall speak marvellous things), Daniel 7:25 (he shall speak great words
--                   against the most High, and wear out the saints), Daniel 8:25 (he shall magnify
--                   himself in his heart... stand up against the Prince of princes), Isaiah 14:13-14
--                   (I will exalt my throne... I will be like the most High), Ezekiel 28:2 (thou hast
--                   said, I am a Elohim... yet thou art a man)
--           Extras: none warranted (the self-deifying figure is fully drawn in the canon Tanakh)
--           NT: Matthew 24:15 (the abomination of desolation... stand in the holy place), Revelation
--               13:5-6 (a mouth speaking great things and blasphemies... blaspheme his name, and his
--               tabernacle)
--   v.5-7   ye know what withholdeth; the mystery of iniquity doth already work
--           Tanakh: none warranted   NT: none warranted
--           Extras: 2 Esdras 5:6 (even he shall rule, whom they look not for that dwell upon the earth)
--                   — the deceiving rule revealed in the day of tokens / lawlessness multiplied
--   v.8     that Wicked... whom Yahuah shall consume with the spirit of his mouth
--           Tanakh: Isaiah 11:4 (with the breath of his lips shall he slay the wicked)
--           Extras: none warranted   NT: none warranted
--   v.9-12  the working of Satan, lying wonders, strong delusion, believe a lie
--           Tanakh: none warranted (carried in the mystery-of-iniquity thread)
--           Extras: weighed (2 Esdras 5 lawlessness) — folded into the mystery thread; none added here
--           NT: none warranted
--   v.13-14 chosen from the beginning to salvation, called by the gospel
--           Tanakh: Deuteronomy 7:6-7 (Yahuah thy Elohim hath chosen thee to be a special people)
--           Extras: none warranted   NT: Ephesians 1:4 (chosen us in him before the foundation of
--                   the world)
--   v.15-17 hold the traditions taught; comfort your hearts, stablish you in every good word and work
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   8225 2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28  (Tanakh + NT)  [★★ BLESSING]
--   8228 2-thessalonians-2-whom-yahuah-shall-consume-with-the-spirit-of-his-mouth-isaiah-11  (Tanakh)
--   8231 2-thessalonians-2-our-gathering-together-unto-him-at-the-last-trump-isaiah-27  (Tanakh + NT)
--   8234 2-thessalonians-2-chosen-from-the-beginning-to-salvation-deuteronomy-7-ephesians-1  (Tanakh + NT)
--   8237 2-thessalonians-2-the-mystery-of-iniquity-already-at-work-2-esdras-5  (Extras)
-- =====================================================================

CREATE TEMP VIEW _s234_t202_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28  [★★ BLESSING]
  ('canon', '2-thessalonians', 2, 4, 'canon', 'daniel', 11, 36, 'free', E'*And the king shall do according to his will; and he shall exalt himself, and magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods, and shall prosper till the indignation be accomplished: for that that is determined shall be done.* (Daniel 11:36). The man of sin is no new figure; Daniel drew him long before. The king who *shall exalt himself, and magnify himself above every god* is the one *who opposeth and exalteth himself above all that is called Elohim (God)* (2 Thessalonians 2:4); the one who *speak marvellous things against the Elohim (God) of gods* is the one *shewing himself that he is Elohim (God).* This is the antichrist drawn in the Tanakh — Daniel''s self-deifying tyrant — not Israel cast off; the deceiver is the counterfeit, and he prospers only *till the indignation be accomplished,* his end already determined.'),
  ('canon', '2-thessalonians', 2, 4, 'canon', 'daniel', 7, 25, 'free', E'*And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* (Daniel 7:25). Daniel''s little horn *shall speak great words against the El Elyon (most High)* and set himself against the saints — the very posture of the man of sin who *exalteth himself above all that is called Elohim (God)... so that he as Elohim (God) sitteth in the temple of Elohim (God)* (2 Thessalonians 2:4). The horn is given the saints only for an appointed season, *a time and times and the dividing of time*; just so Paul''s man of sin is permitted only *in his time* (2 Thessalonians 2:6) before he is consumed. The blasphemer is the counterfeit who wears out the holy people, not the holy people themselves.'),
  ('canon', '2-thessalonians', 2, 4, 'canon', 'daniel', 8, 25, 'free', E'*And through his policy also he shall cause craft to prosper in his hand; and he shall magnify himself in his heart, and by peace shall destroy many: he shall also stand up against the Prince of princes; but he shall be broken without hand.* (Daniel 8:25). Daniel''s self-magnifying king *shall magnify himself in his heart* and *stand up against the Prince of princes* — the same lifting-up as the man of sin who *exalteth himself above all that is called Elohim (God)* (2 Thessalonians 2:4). And mark his end: *he shall be broken without hand* — broken by no mortal power, even as the Wicked is consumed *with the spirit of his mouth* and destroyed *with the brightness of his coming* (2 Thessalonians 2:8). The tyrant who stands against the Prince of princes is shattered by the Prince himself.'),
  ('canon', '2-thessalonians', 2, 4, 'canon', 'isaiah', 14, 13, 'free', E'*For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north:* (Isaiah 14:13). The boast of the fallen one is the boast of the man of sin: *I will exalt my throne above the stars of Elohim (God)* is the self-exaltation of him who *exalteth himself above all that is called Elohim (God)* and *as Elohim (God) sitteth in the temple of Elohim (God)* (2 Thessalonians 2:4). The man of sin enthrones himself in the seat of the Most High, the ancient lie that one cut down to the ground would *be like the El Elyon (most High)* (Isaiah 14:14) — the counterfeit god, never the covenant people.'),
  ('canon', '2-thessalonians', 2, 4, 'canon', 'isaiah', 14, 14, 'free', E'*I will ascend above the heights of the clouds; I will be like the El Elyon (most High).* (Isaiah 14:14). Here is the root blasphemy: *I will be like the El Elyon (most High).* The man of sin is its full flower — he *exalteth himself above all that is called Elohim (God), or that is worshipped... shewing himself that he is Elohim (God)* (2 Thessalonians 2:4). To be *like the most High,* to be worshipped as Elohim (God) — this is the lie spoken in the heart of the fallen one and acted out by the son of perdition. He is the counterfeit who claims the throne of the Most High, and is broken for it.'),
  ('canon', '2-thessalonians', 2, 4, 'canon', 'ezekiel', 28, 2, 'free', E'*Son of Adam, say unto the prince of Tyrus, Thus saith Adonai Yahuah (the Lord GOD); Because thine heart is lifted up, and thou hast said, I am a Elohim (God), I sit in the seat of Elohim (God), in the midst of the seas; yet thou art a man, and not Elohim (God), though thou set thine heart as the heart of Elohim (God):* (Ezekiel 28:2). The prince of Tyrus said *I am a Elohim (God), I sit in the seat of Elohim (God)* — and Yahuah (LORD) answers, *yet thou art a man, and not Elohim (God).* This is the exact unmasking of the man of sin: he *sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4), yet Paul names him *that man of sin... the son of perdition* (2 Thessalonians 2:3) — a man, not Elohim (God). The self-deifying claim is the heart lifted up; the truth is he is a man, and will be consumed.'),
  ('canon', '2-thessalonians', 2, 4, 'canon', 'matthew', 24, 15, 'free', E'*When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* (Matthew 24:15). Yahusha (Jesus) pointed to *the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place* — the defiling thing set up where it ought not to be. Paul names the same: the man of sin who *as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4). The abomination standing in the holy place and the son of perdition seated in the temple are one prophecy; both are Daniel''s figure, the counterfeit in the sanctuary, not the holy people cast off.'),
  ('canon', '2-thessalonians', 2, 4, 'canon', 'revelation', 13, 5, 'free', E'*And there was given unto him a mouth speaking great things and blasphemies; and power was given unto him to continue forty and two months.* (Revelation 13:5). The beast is given *a mouth speaking great things and blasphemies* — Daniel''s *great words against the most High* (Daniel 7:25) become flesh in the beast, and the same mouth in the man of sin who *opposeth and exalteth himself above all that is called Elohim (God)* (2 Thessalonians 2:4). And as the man of sin is permitted only *in his time* (2 Thessalonians 2:6), the beast is given *forty and two months* — a fixed and bounded season. The self-exalting blasphemer of Paul, of Daniel, and of John is one figure under one limit.'),
  ('canon', '2-thessalonians', 2, 4, 'canon', 'revelation', 13, 6, 'free', E'*And he opened his mouth in blasphemy against Elohim (God), to blaspheme his name, and his tabernacle, and them that dwell in heaven.* (Revelation 13:6). The beast *opened his mouth in blasphemy against Elohim (God), to blaspheme his name, and his tabernacle* — the very sacrilege of the man of sin who seats himself *in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4). To blaspheme the name and the tabernacle is to usurp the place of Elohim (God); the beast and the son of perdition both make war on the dwelling of the Most High, and both are revealed only to be destroyed by the One who truly reigns.'),
  -- thread: 2-thessalonians-2-whom-yahuah-shall-consume-with-the-spirit-of-his-mouth-isaiah-11
  ('canon', '2-thessalonians', 2, 8, 'canon', 'isaiah', 11, 4, 'free', E'*But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* (Isaiah 11:4). The Branch from the stem of Jesse *shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* This is the weapon Paul names against the man of sin: *that Wicked... whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming* (2 Thessalonians 2:8). The Formed Son slays the Wicked by no army and no hand, but by the breath of his lips, the word of his mouth; the self-deifying tyrant who exalted himself above all is undone by a single utterance of the true King.'),
  -- thread: 2-thessalonians-2-our-gathering-together-unto-him-at-the-last-trump-isaiah-27
  ('canon', '2-thessalonians', 2, 1, 'canon', 'isaiah', 27, 13, 'free', E'*And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* (Isaiah 27:13). When Paul writes *by the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ), and by our gathering together unto him* (2 Thessalonians 2:1), he names the same ingathering Isaiah saw — *the great trumpet shall be blown, and they shall come which were ready to perish... the outcasts.* The gathering is the regathering of the scattered to worship Yahuah (LORD) in the holy mount; the day cannot be severed from Israel''s ingathering. This is the one great trump-gathering, not a secret rapture detached from the regathered people.'),
  ('canon', '2-thessalonians', 2, 1, 'canon', '1-corinthians', 15, 52, 'free', E'*In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed.* (1 Corinthians 15:52). Paul''s *our gathering together unto him* (2 Thessalonians 2:1) is the same event he names *at the last trump: for the trumpet shall sound, and the dead shall be raised.* The trump of Isaiah 27:13, the last trump of this verse, and the trump of Elohim (God) at the descent in 1 Thessalonians 4:16 are one sounding — the single resurrection-ingathering of the gathered house and the grafted-in. The day of the man of sin and the day of the gathering belong together; the saints are not snatched away in secret but raised and assembled at the trumpet of the King.'),
  -- thread: 2-thessalonians-2-chosen-from-the-beginning-to-salvation-deuteronomy-7-ephesians-1
  ('canon', '2-thessalonians', 2, 13, 'canon', 'deuteronomy', 7, 6, 'free', E'*For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* (Deuteronomy 7:6). The election Paul gives thanks for — *Elohim (God) hath from the beginning chosen you to salvation through sanctification of the Spirit* (2 Thessalonians 2:13) — is the ancient choosing of Yahuah (LORD): *Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself.* The same electing love that set Yahuah (LORD)''s love upon Yashar''el (Israel) gathers the called-out at Thessalonica; not a new election replacing the old, but the one choosing extended to the grafted-in, *a special people unto himself.*'),
  ('canon', '2-thessalonians', 2, 13, 'canon', 'ephesians', 1, 4, 'free', E'*According as he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him in love:* (Ephesians 1:4). Paul says the same to the Thessalonians as to the Ephesians: *Elohim (God) hath from the beginning chosen you to salvation* (2 Thessalonians 2:13) is *he hath chosen us in him before the foundation of the world.* The choosing is the Father''s, from the beginning, before the world was; and it is *to salvation through sanctification of the Spirit* — chosen *that we should be holy.* The Father elects and calls (2 Thessalonians 2:13-14); the Son is the One *unto* whose glory they are called, the Formed in whom the choosing is made.'),
  -- thread: 2-thessalonians-2-the-mystery-of-iniquity-already-at-work-2-esdras-5
  ('canon', '2-thessalonians', 2, 7, 'apocrypha', '2-esdras', 5, 6, 'extras', E'*And even he shall rule, whom they look not for that dwell upon the earth, and the fowls shall take their flight away together:* (2 Esdras 5:6). The restored library foresaw a deceiving rule rising in the days of lawlessness — *even he shall rule, whom they look not for that dwell upon the earth* — set among the tokens when *unrighteousness and incontinency be multiplied upon earth* (2 Esdras 5:10). Paul says of his own day, *the mystery of iniquity doth already work: only he who now letteth will let, until he be taken out of the way* (2 Thessalonians 2:7), and then *that Wicked* is revealed. The unlooked-for ruler of Esdras and the man of sin held back for his time are the same shadow — the lawless one whose rising is the sign of the day, who is then consumed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s234_t202_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s234_t202_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28',
       E'The man of sin who exalts himself above all that is called Elohim (Daniel 11, 7, 8; Isaiah 14; Ezekiel 28)',
       E'Paul warns the assembly not to be shaken, *for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition; Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:3-4). This man of sin is no new figure — he is the antichrist already drawn in the Tanakh, Daniel''s self-deifying tyrant. *And the king shall do according to his will; and he shall exalt himself, and magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods* (Daniel 11:36); the little horn *shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High)* (Daniel 7:25); the king of fierce countenance *shall magnify himself in his heart... he shall also stand up against the Prince of princes; but he shall be broken without hand* (Daniel 8:25). Behind them all is the ancient boast of the one cut down: *I will exalt my throne above the stars of Elohim (God)... I will be like the El Elyon (most High)* (Isaiah 14:13-14), and the prince of Tyrus who *said, I am a Elohim (God), I sit in the seat of Elohim (God)* — to whom Yahuah (LORD) answers *yet thou art a man, and not Elohim (God)* (Ezekiel 28:2). That answer is the whole truth of the matter: Paul calls him *the son of perdition,* a man, not Elohim (God) — the self-deifying claim unmasked. Yahusha (Jesus) named the same defiling thing: *the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place* (Matthew 24:15); and John saw the beast given *a mouth speaking great things and blasphemies* who *opened his mouth in blasphemy against Elohim (God), to blaspheme his name, and his tabernacle* (Revelation 13:5-6). One figure runs through the whole library — the counterfeit who usurps the seat of the Most High. GUARD this with care: the man of sin = the antichrist = Daniel''s little horn, the self-deifying tyrant. The *falling away* and *the temple* are NOT Israel cast off; the deceiver is the counterfeit, never the covenant people. And he is bounded — revealed only *in his time* (2 Thessalonians 2:6), prospering only *till the indignation be accomplished* (Daniel 11:36), broken *without hand* (Daniel 8:25), then consumed *with the spirit of his mouth* by the true King (2 Thessalonians 2:8).',
       sv.verse_id, ev.verse_id, 'free', 8225
  FROM _s234_t202_lookup sv, _s234_t202_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=2 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-2-whom-yahuah-shall-consume-with-the-spirit-of-his-mouth-isaiah-11',
       E'Whom Yahuah shall consume with the spirit of his mouth (Isaiah 11)',
       E'When the man of sin is at last revealed, his undoing needs no army: *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming* (2 Thessalonians 2:8). This is the weapon Isaiah set in the hand of the Branch from the stem of Jesse: *he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* (Isaiah 11:4). The self-exalting tyrant who magnified himself above every god is slain by the breath of the lips of the true King — a single word. Daniel said the same: the king who stands up against the Prince of princes *shall be broken without hand* (Daniel 8:25). The Formed Son, anointed with the Spirit of Yahuah (LORD), does not wrestle the counterfeit but speaks, and the lawless one is consumed; the brightness of his coming is the end of the deceiver.',
       sv.verse_id, ev.verse_id, 'free', 8228
  FROM _s234_t202_lookup sv, _s234_t202_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-2-our-gathering-together-unto-him-at-the-last-trump-isaiah-27',
       E'Our gathering together unto him at the last trump (Isaiah 27; 1 Corinthians 15)',
       E'Paul opens the chapter on the great hope: *Now we beseech you, brethren, by the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ), and by our gathering together unto him* (2 Thessalonians 2:1). This *gathering together* is the same ingathering the prophets foretold and Paul names elsewhere. Isaiah saw it: *in that day... the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem* (Isaiah 27:13) — the regathering of the scattered at the great trumpet. And to the Corinthians Paul names the trump again: *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:52). The trump of Isaiah, the last trump of 1 Corinthians, and the trump of Elohim (God) at the descent in 1 Thessalonians 4:16 are one sounding — the single resurrection-ingathering of the gathered house of Yashar''el (Israel) and the grafted-in, assembled to meet the returning King. The day of the man of sin and the day of the gathering belong together; this is no secret rapture severed from Israel''s regathering, but the one great trump-gathering of the whole olive tree.',
       sv.verse_id, ev.verse_id, 'free', 8231
  FROM _s234_t202_lookup sv, _s234_t202_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=2 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-2-chosen-from-the-beginning-to-salvation-deuteronomy-7-ephesians-1',
       E'Chosen from the beginning to salvation (Deuteronomy 7; Ephesians 1)',
       E'Against the perishing who *received not the love of the truth,* Paul turns to thanksgiving: *But we are bound to give thanks alway to Elohim (God) for you, brethren beloved of Yahuah (Lord), because Elohim (God) hath from the beginning chosen you to salvation through sanctification of the Spirit and belief of the truth* (2 Thessalonians 2:13). This electing from the beginning is the ancient choosing of Yahuah (LORD): *thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth* (Deuteronomy 7:6). The same love that set Yahuah (LORD)''s choosing upon Yashar''el (Israel) — not for their number but for his own love — is the love that gathers the called-out at Thessalonica. Paul says it again to the Ephesians: *he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him* (Ephesians 1:4). The choosing is the Father''s, from before the world, *to salvation through sanctification of the Spirit*; and they are *called... by our gospel, to the obtaining of the glory of our Lord Yahusha HaMashiach (Lord Jesus Christ)* (2 Thessalonians 2:14). The Father elects and calls; the Son is the Formed unto whose glory they are gathered. This is not a new election replacing the old, but the one choosing extended to the grafted-in.',
       sv.verse_id, ev.verse_id, 'free', 8234
  FROM _s234_t202_lookup sv, _s234_t202_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-2-the-mystery-of-iniquity-already-at-work-2-esdras-5',
       E'The mystery of iniquity already at work (2 Esdras 5)',
       E'Paul tells the assembly that the lawless one is, for now, held back: *And now ye know what withholdeth that he might be revealed in his time. For the mystery of iniquity doth already work: only he who now letteth will let, until he be taken out of the way* (2 Thessalonians 2:6-7). The restored library held a like expectation — a deceiving rule rising in the days of mounting lawlessness, the sign of the latter tokens. Esdras was shown: *even he shall rule, whom they look not for that dwell upon the earth* (2 Esdras 5:6), in the days when *unrighteousness and incontinency be multiplied upon earth* (2 Esdras 5:10) and *the way of truth shall be hidden.* The unlooked-for ruler of Esdras and the man of sin held for his time are one shadow: the lawless one whose unveiling is the mark of the day. Yet the working of iniquity is a *mystery* under restraint, permitted only its season — for *that Wicked* once revealed is consumed *with the spirit of his mouth* (2 Thessalonians 2:8). The deceiver rises only to be unmasked and undone.',
       sv.verse_id, ev.verse_id, 'extras', 8237
  FROM _s234_t202_lookup sv, _s234_t202_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:36 — *the king... shall exalt himself, and magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods* the self-deifying tyrant Daniel drew; the man of sin who *exalteth himself above all that is called Elohim (God)* (2 Thessalonians 2:4), prospering only till the indignation is accomplished.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:25 — *he shall speak great words against the El Elyon (most High), and shall wear out the saints* the little horn given a bounded season (*a time and times and the dividing of time*); the man of sin permitted only *in his time* (2 Thessalonians 2:6), the counterfeit who wears out the saints, not the saints cast off.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 8:25 — *he shall magnify himself in his heart... stand up against the Prince of princes; but he shall be broken without hand* the same self-magnifying king; broken by no mortal power, as the Wicked is consumed *with the spirit of his mouth* (2 Thessalonians 2:8).'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=8 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 14:13 — *I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation* the boast of the fallen one; the man of sin who *as Elohim (God) sitteth in the temple of Elohim (God)* (2 Thessalonians 2:4), enthroning himself in the seat of the Most High.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 14:14 — *I will ascend above the heights of the clouds; I will be like the El Elyon (most High)* the root blasphemy, full-flowered in him who *shewing himself that he is Elohim (God)* (2 Thessalonians 2:4) — the counterfeit god, never the covenant people.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Ezekiel 28:2 — *thou hast said, I am a Elohim (God), I sit in the seat of Elohim (God)... yet thou art a man, and not Elohim (God)* the exact unmasking of the man of sin who *sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4) — yet Paul names him *the son of perdition,* a man, not Elohim (God).'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Matthew 24:15 — *the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place* Yahusha (Jesus) naming the same defiling thing; the man of sin who *as Elohim (God) sitteth in the temple of Elohim (God)* (2 Thessalonians 2:4) — the counterfeit in the sanctuary, not the holy people cast off.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Revelation 13:5 — *a mouth speaking great things and blasphemies; and power was given unto him to continue forty and two months* Daniel''s great words become the beast''s mouth; the man of sin permitted only *in his time* (2 Thessalonians 2:6), one figure under one bounded limit.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Revelation 13:6 — *he opened his mouth in blasphemy against Elohim (God), to blaspheme his name, and his tabernacle* the beast''s sacrilege; the man of sin who seats himself *in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4) — both usurp the dwelling of the Most High.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-thessalonians-2-whom-yahuah-shall-consume-with-the-spirit-of-his-mouth-isaiah-11
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 11:4 — *with the breath of his lips shall he slay the wicked* the weapon of the Branch from the stem of Jesse; *that Wicked... whom Yahuah (Lord) shall consume with the spirit of his mouth* (2 Thessalonians 2:8) — the Formed Son slays the lawless one by a single utterance.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-whom-yahuah-shall-consume-with-the-spirit-of-his-mouth-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-thessalonians-2-our-gathering-together-unto-him-at-the-last-trump-isaiah-27
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 27:13 — *the great trumpet shall be blown, and they shall come which were ready to perish... and shall worship Yahuah (LORD) in the holy mount at Jerusalem* the regathering of the scattered; *our gathering together unto him* (2 Thessalonians 2:1) is the same ingathering, not severed from Israel''s regathering.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-our-gathering-together-unto-him-at-the-last-trump-isaiah-27'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=27 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:52 — *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* the same trump as Isaiah 27 and the descent of 1 Thessalonians 4:16; *our gathering together unto him* (2 Thessalonians 2:1) is the one resurrection-ingathering, no secret rapture.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-our-gathering-together-unto-him-at-the-last-trump-isaiah-27'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-thessalonians-2-chosen-from-the-beginning-to-salvation-deuteronomy-7-ephesians-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 7:6 — *Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself* the ancient choosing of Yahuah (LORD); *Elohim (God) hath from the beginning chosen you to salvation* (2 Thessalonians 2:13), the one election extended to the grafted-in.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-chosen-from-the-beginning-to-salvation-deuteronomy-7-ephesians-1'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 1:4 — *he hath chosen us in him before the foundation of the world, that we should be holy* the Father''s choosing before the world; *from the beginning chosen you to salvation through sanctification of the Spirit* (2 Thessalonians 2:13), called unto the glory of the Formed Son.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-chosen-from-the-beginning-to-salvation-deuteronomy-7-ephesians-1'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-thessalonians-2-the-mystery-of-iniquity-already-at-work-2-esdras-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 5:6 — *even he shall rule, whom they look not for that dwell upon the earth* the deceiving rule rising in the days of multiplied lawlessness; *the mystery of iniquity doth already work* (2 Thessalonians 2:7), the lawless one held for his time, then consumed.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-mystery-of-iniquity-already-at-work-2-esdras-5'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2thessalonians_03.sql (S234 2 Thessalonians 3) -----
-- =====================================================================
-- S234 minion — 2 THESSALONIANS 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 THESSALONIANS 3 (18 verses) — the closing practical-instruction chapter:
--   pray the word run free, Yahuah is faithful, withdraw from the disorderly, work and eat
--   your own bread, be not weary in well doing.
-- Tag: t203 (temp view _s234_t203_lookup).
-- Sort band: floor 8250, step 3 (8250, 8253, 8256, 8259 used; under 8275).
-- Source is ALWAYS the canon 2 Thessalonians verse; targets span Tanakh + NT (no extras warranted).
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: a chapter of apostolic order, not eschatology. Paul, Silvanus and Timotheus
-- close the letter with the practical Torah of the assembly — the word running free, the Faithful
-- One who keeps his own from evil, the diligence that eats its own bread, the well-doing that does
-- not grow weary. These are not new ethics severed from Israel''s Scriptures: every charge re-speaks
-- the Tanakh — the swift word of Psalm 147, the Keeper of Psalm 121, the sweat-of-the-face and the
-- ant-and-the-sluggard of Genesis and Proverbs, the wait-upon-Yahuah who runs and is not weary of
-- Isaiah 40. No replacement theology, no law-vs-grace antithesis: the apostolic *tradition which he
-- received of us* (3:6) is the same instruction Yahuah (Lord) gave from the beginning. Christology
-- stays the Formed — the charges come *in the name of our Lord Yahusha HaMashiach (Lord Jesus
-- Christ)* (3:6,12), the sent Son through whom the Father is served.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   pray that the word of Yahuah may have free course, and be glorified
--           Tanakh: Psalm 147:15 (his word runneth very swiftly), Psalm 147:18 (he sendeth out his
--                   word), Psalm 147:19 (he sheweth his word unto Jacob)
--           Extras: none warranted   NT: none warranted (the swift-word root is the Tanakh)
--   v.3-5   Yahuah is faithful, who shall stablish you, and keep you from evil
--           Tanakh: Psalm 121:7 (Yahuah shall preserve thee from all evil), Psalm 121:4 (he that
--                   keepeth Yashar'el shall neither slumber nor sleep)
--           Extras: none warranted   NT: Matthew 6:13 (deliver us from evil)
--   v.6-9   withdraw from the disorderly; we wrought with labour night and day, an ensample
--           Tanakh: none warranted (the eat-your-own-bread weight carried at v.10-12 / Psalm 128)
--           Extras: none warranted   NT: none warranted
--   v.10-12 if any would not work, neither should he eat; work, and eat their own bread
--           Tanakh: Genesis 3:19 (in the sweat of thy face shalt thou eat bread), Proverbs 10:4
--                   (the hand of the diligent maketh rich), Proverbs 6:6-11 (go to the ant, thou
--                   sluggard), Psalm 128:2 (thou shalt eat the labour of thine hands)
--           Extras: none warranted   NT: none warranted
--   v.13    be not weary in well doing
--           Tanakh: Isaiah 40:31 (they that wait upon Yahuah... shall run, and not be weary)
--           Extras: none warranted   NT: Galatians 6:9 (let us not be weary in well doing)
--   v.14-18 note the disobedient, admonish as a brother, Yahuah of peace, the salutation, the grace
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   8250 2-thessalonians-3-pray-that-the-word-of-yahuah-run-free-psalm-147   (Tanakh)
--   8253 2-thessalonians-3-yahuah-is-faithful-who-shall-keep-you-from-evil-psalm-121   (Tanakh + NT)
--   8256 2-thessalonians-3-if-any-would-not-work-neither-should-he-eat-genesis-3-proverbs-6   (Tanakh)
--   8259 2-thessalonians-3-be-not-weary-in-well-doing-isaiah-40-galatians-6   (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s234_t203_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-thessalonians-3-pray-that-the-word-of-yahuah-run-free-psalm-147
  ('canon', '2-thessalonians', 3, 1, 'canon', 'psalms', 147, 15, 'free', E'*He sendeth forth his commandment upon earth: his word runneth very swiftly.* (Psalm 147:15). When Paul asks the assembly to *pray for us, that the word of Yahuah (Lord) may have free course, and be glorified* (2 Thessalonians 3:1), he is asking that the word do what the Psalm says it does: run. The *free course* of the word is the swift running of Psalm 147 — Yahuah (Lord) sends forth his commandment and *his word runneth very swiftly,* outpacing every hindrance. The prayer is not for a new thing but that the same swift word of Yahuah (Lord) run unhindered among the nations as it has always run upon the earth.'),
  ('canon', '2-thessalonians', 3, 1, 'canon', 'psalms', 147, 18, 'free', E'*He sendeth out his word, and melteth them: he causeth his wind to blow, and the waters flow.* (Psalm 147:18). The Psalm shows the word of Yahuah (Lord) as the agent that accomplishes his will — *he sendeth out his word, and melteth them.* This is the word Paul would have run free and *be glorified* (2 Thessalonians 3:1): the sent word that does the sending One''s work, melting the frost, freeing the waters. To pray the word have *free course* is to pray that the effectual word of Yahuah (Lord), which never returns void, be glorified in its running among men.'),
  ('canon', '2-thessalonians', 3, 1, 'canon', 'psalms', 147, 19, 'free', E'*He sheweth his word unto Jacob, his statutes and his judgments unto Yashar''el (Israel).* (Psalm 147:19). The word Yahuah (Lord) sends running swiftly upon the earth is the word he first *sheweth unto Jacob, his statutes and his judgments unto Yashar''el (Israel).* It is no other word that Paul would see glorified — *that the word of Yahuah (Lord) may have free course, and be glorified* (2 Thessalonians 3:1) — than the word given to Yashar''el (Israel), now running out to the grafted-in nations. The free course of the gospel is the statutes and judgments of Yahuah (Lord) carried to the ends of the earth, not a different word replacing the old.'),
  -- thread: 2-thessalonians-3-yahuah-is-faithful-who-shall-keep-you-from-evil-psalm-121
  ('canon', '2-thessalonians', 3, 3, 'canon', 'psalms', 121, 7, 'free', E'*Yahuah (LORD) shall preserve thee from all evil: he shall preserve thy soul.* (Psalm 121:7). Paul''s assurance — *Yahuah (Lord) is faithful, who shall stablish you, and keep you from evil* (2 Thessalonians 3:3) — is the very promise of the Psalm of ascents: *Yahuah (LORD) shall preserve thee from all evil; he shall preserve thy soul.* The keeping from evil is not a hope Paul invents; it is the covenant fidelity of the Keeper of Yashar''el (Israel), who *shall preserve thy going out and thy coming in.* Because Yahuah (Lord) *is faithful,* the keeping is sure.'),
  ('canon', '2-thessalonians', 3, 3, 'canon', 'psalms', 121, 4, 'free', E'*Behold, he that keepeth Yashar''el (Israel) shall neither slumber nor sleep.* (Psalm 121:4). The One who *shall stablish you, and keep you from evil* (2 Thessalonians 3:3) is the sleepless Keeper of the Psalm: *he that keepeth Yashar''el (Israel) shall neither slumber nor sleep.* The faithfulness Paul names is this unwearying watch — the Keeper who never closes his eyes over his people. To be kept from evil is to be kept by the One who keeps Yashar''el (Israel), the same vigilant Yahuah (Lord) over the gathered assembly at Thessalonica.'),
  ('canon', '2-thessalonians', 3, 3, 'canon', 'matthew', 6, 13, 'free', E'*And lead us not into temptation, but deliver us from evil: For thine is the kingdom, and the power, and the glory, for ever. Amen.* (Matthew 6:13). The prayer Yahusha (Jesus) taught ends with the petition Paul declares already answered in the faithful Yahuah (Lord): *deliver us from evil.* Where the disciples pray *deliver us from evil,* Paul assures the assembly that *Yahuah (Lord) is faithful, who shall stablish you, and keep you from evil* (2 Thessalonians 3:3). The deliverance asked in the Master''s prayer is the keeping the faithful One performs; the petition and the promise are one.'),
  -- thread: 2-thessalonians-3-if-any-would-not-work-neither-should-he-eat-genesis-3-proverbs-6
  ('canon', '2-thessalonians', 3, 10, 'canon', 'genesis', 3, 19, 'free', E'*In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* (Genesis 3:19). Paul''s rule — *if any would not work, neither should he eat* (2 Thessalonians 3:10) — stands on the word spoken to Adam at the gate of the world: *in the sweat of thy face shalt thou eat bread.* Bread comes to man by labour from the beginning; the one who will not labour has cut himself off from the ordained way bread is eaten. The apostle is not laying a harsh new burden but holding the assembly to the order Yahuah (Lord) set over the earth — bread is the fruit of the sweat of the face.'),
  ('canon', '2-thessalonians', 3, 10, 'canon', 'proverbs', 10, 4, 'free', E'*He becometh poor that dealeth with a slack hand: but the hand of the diligent maketh rich.* (Proverbs 10:4). The wisdom of Proverbs draws the same line Paul draws: *the hand of the diligent maketh rich,* but the slack hand brings poverty. *If any would not work, neither should he eat* (2 Thessalonians 3:10) is the sharp edge of the same teaching — the diligent hand eats its own bread, the slack hand has no claim on another''s table. The apostle speaks the proverb into the assembly: let none deal with a slack hand among the brethren.'),
  ('canon', '2-thessalonians', 3, 11, 'canon', 'proverbs', 6, 6, 'free', E'*Go to the ant, thou sluggard; consider her ways, and be wise:* (Proverbs 6:6). Of the *busybodies* who *walk among you disorderly, working not at all* (2 Thessalonians 3:11), Proverbs has long had the answer: *Go to the ant, thou sluggard.* The ant *provideth her meat in the summer, and gathereth her food in the harvest* (Proverbs 6:8), needing *no guide, overseer, or ruler* — a rebuke to the idle who must be commanded. The sluggard of Proverbs is the disorderly brother of Thessalonica; the wisdom that sends him to the ant is the wisdom Paul presses upon the assembly.'),
  ('canon', '2-thessalonians', 3, 11, 'canon', 'proverbs', 6, 10, 'free', E'*Yet a little sleep, a little slumber, a little folding of the hands to sleep:* (Proverbs 6:10). Proverbs paints the sluggard whose idleness ends in ruin — *a little folding of the hands to sleep: So shall thy poverty come as one that travelleth, and thy want as an armed man* (Proverbs 6:10-11). These are the *working not at all, but are busybodies* (2 Thessalonians 3:11) whom Paul charges to *work, and eat their own bread* (2 Thessalonians 3:12). The folded hands of the sluggard are the working-not-at-all of the disorderly; the apostle calls them out of the slumber Proverbs warned against, into honest labour.'),
  ('canon', '2-thessalonians', 3, 12, 'canon', 'psalms', 128, 2, 'free', E'*For thou shalt eat the labour of thine hands: happy shalt thou be, and it shall be well with thee.* (Psalm 128:2). Paul''s charge that the brethren *work, and eat their own bread* (2 Thessalonians 3:12) is the blessing of the Psalm: *thou shalt eat the labour of thine hands: happy shalt thou be.* To eat one''s own bread is not mere duty but the happiness pronounced on every one *that feareth Yahuah (LORD); that walketh in his ways* (Psalm 128:1). The apostolic order and the Psalm''s blessing meet in the same place — the bread of one''s own labour, eaten with quietness, is the well-being Yahuah (Lord) appoints for the diligent.'),
  -- thread: 2-thessalonians-3-be-not-weary-in-well-doing-isaiah-40-galatians-6
  ('canon', '2-thessalonians', 3, 13, 'canon', 'galatians', 6, 9, 'free', E'*And let us not be weary in well doing: for in due season we shall reap, if we faint not.* (Galatians 6:9). Paul writes the same charge to two assemblies in the same words: *be not weary in well doing* (2 Thessalonians 3:13) and *let us not be weary in well doing* (Galatians 6:9). The reason is the harvest — *in due season we shall reap, if we faint not.* The well-doing is sowing; the not-being-weary is the patience that waits for the reaping. The apostle steadies the gathered against the fainting that lets go before the season of reaping comes.'),
  ('canon', '2-thessalonians', 3, 13, 'canon', 'isaiah', 40, 31, 'free', E'*But they that wait upon Yahuah (LORD) shall renew their strength; they shall mount up with wings as eagles; they shall run, and not be weary; and they shall walk, and not faint.* (Isaiah 40:31). The strength to *be not weary in well doing* (2 Thessalonians 3:13) is the strength Isaiah promises the waiting: *they that wait upon Yahuah (LORD) shall renew their strength... they shall run, and not be weary.* The well-doer does not draw on his own endurance, which fails — *even the youths shall faint and be weary* — but on the renewing strength of the One who *fainteth not, neither is weary* (Isaiah 40:28). To not grow weary in well doing is to wait upon Yahuah (Lord), who gives power to the faint.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s234_t203_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s234_t203_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-3-pray-that-the-word-of-yahuah-run-free-psalm-147',
       E'Pray that the word of Yahuah (Lord) may have free course (Psalm 147)',
       E'Paul opens the closing charge with a request for prayer: *Finally, brethren, pray for us, that the word of Yahuah (Lord) may have free course, and be glorified, even as it is with you* (2 Thessalonians 3:1). The *free course* of the word is the swift running the Psalm sings — *He sendeth forth his commandment upon earth: his word runneth very swiftly* (Psalm 147:15). To pray the word run free is to pray it do what Yahuah (Lord) has always made it do: run, unhindered, upon the earth. And it is the effectual word that accomplishes the sending One''s will — *He sendeth out his word, and melteth them: he causeth his wind to blow, and the waters flow* (Psalm 147:18) — the word that never returns void, now to *be glorified* in its running among men. Nor is it some new word severed from Israel''s Scriptures: it is the word Yahuah (Lord) first *sheweth unto Jacob, his statutes and his judgments unto Yashar''el (Israel)* (Psalm 147:19), now carried out to the grafted-in nations. The prayer Paul asks is that the same swift, effectual, covenant word run free and be glorified, as it had already run among the Thessalonians.',
       sv.verse_id, ev.verse_id, 'free', 8250
  FROM _s234_t203_lookup sv, _s234_t203_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=3 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-3-yahuah-is-faithful-who-shall-keep-you-from-evil-psalm-121',
       E'Yahuah (Lord) is faithful, who shall stablish you, and keep you from evil (Psalm 121)',
       E'*But Yahuah (Lord) is faithful, who shall stablish you, and keep you from evil* (2 Thessalonians 3:3). The keeping from evil is no fresh assurance of the apostle''s own making; it is the covenant promise of the Psalm of ascents: *Yahuah (LORD) shall preserve thee from all evil: he shall preserve thy soul* (Psalm 121:7). The One who keeps is the sleepless Keeper — *Behold, he that keepeth Yashar''el (Israel) shall neither slumber nor sleep* (Psalm 121:4) — whose unwearying watch over his people Paul leans on when he says Yahuah (Lord) is *faithful.* The faithfulness and the keeping are the same divine fidelity that guarded Yashar''el (Israel) and now guards the gathered assembly. And the petition the Master taught his disciples — *lead us not into temptation, but deliver us from evil* (Matthew 6:13) — is here declared already answered in the faithful Yahuah (Lord): what the disciples pray, *deliver us from evil,* the Keeper performs, *who shall stablish you, and keep you from evil.* The prayer of the gospel and the promise of the Psalm meet in the one faithful Yahuah (Lord).',
       sv.verse_id, ev.verse_id, 'free', 8253
  FROM _s234_t203_lookup sv, _s234_t203_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=3 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-3-if-any-would-not-work-neither-should-he-eat-genesis-3-proverbs-6',
       E'If any would not work, neither should he eat (Genesis 3, Proverbs 6)',
       E'*For even when we were with you, this we commanded you, that if any would not work, neither should he eat* (2 Thessalonians 3:10). The rule is not a harsh apostolic invention but the order Yahuah (Lord) set over the world from the beginning, spoken to Adam at the gate of Eden: *In the sweat of thy face shalt thou eat bread, till thou return unto the ground* (Genesis 3:19). Bread comes to man by labour; the one who will not labour has stepped outside the ordained way bread is eaten. The wisdom of Proverbs draws the same line — *He becometh poor that dealeth with a slack hand: but the hand of the diligent maketh rich* (Proverbs 10:4). And to the *busybodies* who *walk among you disorderly, working not at all* (2 Thessalonians 3:11), Proverbs has long sent its answer: *Go to the ant, thou sluggard; consider her ways, and be wise* (Proverbs 6:6) — the ant who *provideth her meat in the summer* with no overseer to drive her, a rebuke to the idle. The sluggard''s ruin is the *little folding of the hands to sleep* whose end is that *poverty come as one that travelleth* (Proverbs 6:10-11). Against this Paul charges the disorderly to *work, and eat their own bread* (2 Thessalonians 3:12) — and that bread, the Psalm says, is itself a blessing: *thou shalt eat the labour of thine hands: happy shalt thou be, and it shall be well with thee* (Psalm 128:2). The apostolic order and the wisdom of the Tanakh meet in one place: the bread of one''s own labour, eaten with quietness, is the well-being Yahuah (Lord) appoints for the diligent.',
       sv.verse_id, ev.verse_id, 'free', 8256
  FROM _s234_t203_lookup sv, _s234_t203_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=3 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-3-be-not-weary-in-well-doing-isaiah-40-galatians-6',
       E'Be not weary in well doing (Isaiah 40, Galatians 6)',
       E'*But ye, brethren, be not weary in well doing* (2 Thessalonians 3:13). Paul writes the same charge to two assemblies in nearly the same words — to the Galatians, *let us not be weary in well doing: for in due season we shall reap, if we faint not* (Galatians 6:9). The well-doing is a sowing, and the not-being-weary is the patience that waits for the reaping; the apostle steadies the gathered against the fainting that lets go before the harvest comes. And the strength to endure is not the well-doer''s own, which fails — *even the youths shall faint and be weary* — but the renewing strength of Yahuah (Lord) himself, who *fainteth not, neither is weary* (Isaiah 40:28): *they that wait upon Yahuah (LORD) shall renew their strength; they shall mount up with wings as eagles; they shall run, and not be weary; and they shall walk, and not faint* (Isaiah 40:31). To not grow weary in well doing is to wait upon Yahuah (Lord), who gives power to the faint. The apostolic exhortation and the prophet''s promise are one: the well-doer who waits on Yahuah (Lord) runs and is not weary, and in due season reaps, if he faint not.',
       sv.verse_id, ev.verse_id, 'free', 8259
  FROM _s234_t203_lookup sv, _s234_t203_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-thessalonians-3-pray-that-the-word-of-yahuah-run-free-psalm-147
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 147:15 — *his word runneth very swiftly* the swift-running word behind the *free course* Paul prays for; *that the word of Yahuah (Lord) may have free course, and be glorified* (2 Thessalonians 3:1).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-pray-that-the-word-of-yahuah-run-free-psalm-147'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=147 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 147:18 — *He sendeth out his word, and melteth them* the effectual word that does Yahuah (Lord)''s work, which Paul would see glorified in its free course (2 Thessalonians 3:1).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-pray-that-the-word-of-yahuah-run-free-psalm-147'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=147 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 147:19 — *He sheweth his word unto Jacob, his statutes and his judgments unto Yashar''el (Israel)* the word given to Yashar''el (Israel), now running out to the nations; no other word has *free course* (2 Thessalonians 3:1).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-pray-that-the-word-of-yahuah-run-free-psalm-147'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=147 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-thessalonians-3-yahuah-is-faithful-who-shall-keep-you-from-evil-psalm-121
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 121:7 — *Yahuah (LORD) shall preserve thee from all evil: he shall preserve thy soul* the covenant promise behind Paul''s assurance; *Yahuah (Lord) is faithful, who shall stablish you, and keep you from evil* (2 Thessalonians 3:3).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-yahuah-is-faithful-who-shall-keep-you-from-evil-psalm-121'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=121 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 121:4 — *he that keepeth Yashar''el (Israel) shall neither slumber nor sleep* the sleepless Keeper whose unwearying watch is the faithfulness Paul names (2 Thessalonians 3:3).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-yahuah-is-faithful-who-shall-keep-you-from-evil-psalm-121'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=121 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 6:13 — *deliver us from evil* the petition the Master taught, declared already answered in the faithful Yahuah (Lord) who shall *keep you from evil* (2 Thessalonians 3:3).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-yahuah-is-faithful-who-shall-keep-you-from-evil-psalm-121'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-thessalonians-3-if-any-would-not-work-neither-should-he-eat-genesis-3-proverbs-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread* the ordained order that bread comes by labour, behind *if any would not work, neither should he eat* (2 Thessalonians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-if-any-would-not-work-neither-should-he-eat-genesis-3-proverbs-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 10:4 — *the hand of the diligent maketh rich* the diligent-vs-slack line that is the sharp edge of Paul''s rule (2 Thessalonians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-if-any-would-not-work-neither-should-he-eat-genesis-3-proverbs-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 6:6 — *Go to the ant, thou sluggard; consider her ways, and be wise* the answer to the *busybodies, working not at all* (2 Thessalonians 3:11).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-if-any-would-not-work-neither-should-he-eat-genesis-3-proverbs-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 6:10 — *a little folding of the hands to sleep* the sluggard''s idleness whose end is poverty, the working-not-at-all of the disorderly (2 Thessalonians 3:11).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-if-any-would-not-work-neither-should-he-eat-genesis-3-proverbs-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 128:2 — *thou shalt eat the labour of thine hands: happy shalt thou be* the blessing on the bread of one''s own labour, behind *work, and eat their own bread* (2 Thessalonians 3:12).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-if-any-would-not-work-neither-should-he-eat-genesis-3-proverbs-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=128 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-thessalonians-3-be-not-weary-in-well-doing-isaiah-40-galatians-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 6:9 — *let us not be weary in well doing: for in due season we shall reap, if we faint not* the same charge Paul writes to two assemblies; *be not weary in well doing* (2 Thessalonians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-be-not-weary-in-well-doing-isaiah-40-galatians-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 40:31 — *they that wait upon Yahuah (LORD) shall renew their strength... they shall run, and not be weary* the renewing strength of the One who fainteth not, behind *be not weary in well doing* (2 Thessalonians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s234_t203_lookup sv, _s234_t203_lookup tv
 WHERE t.slug='2-thessalonians-3-be-not-weary-in-well-doing-isaiah-40-galatians-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session234 — 2 Thessalonians cross-references complete.'
