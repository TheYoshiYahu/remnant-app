-- ----- fragment: minion_genesis_8.sql (Genesis 8) -----
-- Chapter: Genesis 8 (Elohim remembered Noah; the waters assuaged; the ark rested on Ararat; the raven and the dove; the olive leaf; Noah's altar and the sweet savour; seedtime and harvest shall not cease)
-- Tag: ge08   Temp view: _s301_ge08_lookup
-- Sort band: base 20175, step 3 -> threads at 20175, 20178, 20181, 20184 (4 threads)
-- Source of EVERY row: 'canon','genesis',8,v
--
-- Genesis 8 coverage:
--   ★ v.1-3 (Elohim REMEMBERED Noah; made a wind/ruach to pass over the earth; the waters asswaged; the fountains/windows stopped)
--        NT:     1 Peter 3:20 (longsuffering of Elohim waited in the days of Noah... eight souls saved by water);
--                1 Peter 3:21 (the like figure whereunto even baptism doth also now save us, by the resurrection)
--        Extras: Jasher 6:32 (Yahuah remembered him); Jasher 6:33 (a wind passed over the earth, the waters were still, the ark rested)
--        Tanakh: Genesis 1:2 (the Spirit/Ruach of Elohim moved upon the face of the waters — the new-creation-through-water echo)
--   v.4-5 (the ark rested in the seventh month on the seventeenth day, on the mountains of Ararat; the tops of the mountains seen)
--        NT:     none warranted (the resting carried in the remembered-Noah thread)
--        Extras: none warranted as MEMBER (Jubilees 6:27 / Jasher 6:35 are near-verbatim retellings, woven by reference)
--        Tanakh: none warranted
--   v.6-12 (Noah opened the window; the raven to and fro; the dove sent thrice; the olive leaf pluckt off; the dove returned no more)
--        NT:     Matthew 3:16 (he saw the Spirit of Elohim descending like a dove, and lighting upon him — the new creation begun)
--        Extras: none warranted distinct (Jasher's flood-narrative does not carry the dove episode cleanly)
--        Tanakh: none warranted as MEMBER (the dove/olive-leaf sign carried FORWARD to the Spirit-dove at the immersion)
--   v.13-19 (the waters dried; Noah removed the covering; Elohim spake "Go forth"; every living thing went forth after their kinds, breed/be fruitful)
--        NT:     none warranted (go-forth/be-fruitful echoes Genesis 1:28, woven by reference in summary)
--        Extras: none warranted as MEMBER (Jasher 6:40-42 retelling of the going-forth and the blessing, woven by reference)
--        Tanakh: none warranted
--   ★ v.20-21 (Noah builded an altar; took of every CLEAN beast/fowl; offered burnt offerings; Yahuah smelled a SWEET SAVOUR; I will not again curse the ground)
--        NT:     Ephesians 5:2 (Messiah... hath given himself for us an offering and a sacrifice to Elohim for a sweetsmelling savour);
--                Hebrews 13:15 (by him let us offer the sacrifice of praise to Elohim continually)
--        Extras: Jubilees 6:1 (on the new moon of the third month he went forth, built an altar); Jubilees 6:3 (placed a burnt
--                sacrifice... caused a goodly savour to arise, acceptable before Yahuah); Jasher 6:9 (of the clean animals/fowls
--                he brought seven couples, as Elohim had commanded — the clean/unclean distinction pre-Sinai)
--        Tanakh: none warranted as MEMBER (the clean-beast/sweet-savour type carried FORWARD to Messiah's offering)
--   ★ v.22 (While the earth remaineth, seedtime and harvest, cold and heat, summer and winter, day and night shall not cease)
--        NT:     none warranted (the covenant-order of the seasons carried OUT to Jubilees + LATERALLY to Jeremiah/Isaiah)
--        Extras: Jubilees 6:4 (He made a covenant... seed-time and harvest should never cease; cold and heat, summer and winter,
--                day and night should not change their order); Jubilees 6:17 (celebrate the feast of weeks... to renew the covenant
--                every year — the moedim rooted in the constant order)
--        Tanakh: Jeremiah 33:20 (my covenant of the day and my covenant of the night); Jeremiah 33:25 (if my covenant be not with
--                day and night, the ordinances of heaven and earth); Isaiah 54:9 (as the waters of Noah... I have sworn);
--                Genesis 9:11 (I will establish my covenant... neither shall there any more be a flood to destroy the earth)
--
-- Threads (slug -> target libraries):
--   genesis-8-elohim-remembered-noah-the-wind-over-the-waters          [NT+Extras+Tanakh]  tier extras  ★
--   genesis-8-the-dove-and-the-olive-leaf-the-spirit-descending        [NT]                tier free
--   genesis-8-noahs-altar-the-clean-beasts-and-the-sweet-savour        [NT+Extras]         tier extras  ★
--   genesis-8-seedtime-and-harvest-shall-not-cease                     [Extras+Tanakh]     tier extras  ★
--
-- Framework-load-bearing notes:
--   ★ v.1 "Elohim remembered Noah... made a wind to pass over the earth": framed as the TURNING of the flood and as the
--     NEW-CREATION-THROUGH-WATER motif. The ruach (wind) moving over the waters deliberately echoes Genesis 1:2, where *the
--     Spirit of Elohim (God) moved upon the face of the waters* over the same deep — the flood-world re-emerging as a creation
--     re-made through judgement-water. 1 Peter 3:20-21 reads the very water that drowned the world as the figure of the water
--     that now saves by the resurrection. Jasher 6:32-33 carries the same beat verbatim: *Yahuah remembered him... a wind passed
--     over the earth, and the waters were still and the ark rested.* "Remembered" is covenant-faithfulness, not recollection.
--   ★ v.20-21 Noah's altar / clean beasts / sweet savour: the FIRST altar after the flood. The clean/unclean distinction is
--     ALREADY in force (8:20, "every clean beast"; Jasher 6:9, "seven couples" of the clean) — pre-Sinai, against the
--     Christianized "the food/clean laws were a late Jewish invention" default. The *sweet savour* is woven FORWARD to Ephesians
--     5:2, *Messiah... hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* — Noah's
--     accepted offering is the atonement/acceptance foreshadow, fulfilled in the Formed Son's self-offering. Jubilees 6:1-3
--     unfolds the altar and the goodly savour acceptable before Yahuah; Hebrews 13:15 carries the savour forward into the
--     assembly's sacrifice of praise.
--   ★ v.22 "seedtime and harvest... shall not cease": framed as the COVENANT-ORDER of the seasons/appointed times — the
--     faithfulness of Yahuah to the created order He set in Genesis 1:14. The moedim (Leviticus 23) rest on this constancy:
--     Jubilees 6:4 makes the seedtime/harvest promise a COVENANT and Jubilees 6:17 roots the feast of weeks in renewing it;
--     Jeremiah 33:20,25 calls day and night themselves a covenant, the ordinances of heaven — as unbreakable as the throne of
--     David. Isaiah 54:9 swears by "the waters of Noah" that the wrath is past. The order of the seasons is not mere nature; it
--     is the standing pledge the calendar of Yahuah is built upon. (Christianized "seasons = generic providence" default
--     overridden — this is covenant constancy, the ground of the appointed times.)
--   Christology: v.1 the wind/ruach over the waters and v.21 the accepted offering are framed as the work of the covenant
--     Yahuah and the Formed Son's foreshadowed sacrifice; NO Trinitarian co-equal-persons grammar; the Genesis-1:2 Ruach echo
--     is the same Spirit of Elohim over the same waters, not a third co-equal person.
--   Jubilees/Jasher double-write trap honored: every VALUES row writes 'jubilees','jubilees',... and 'jasher','jasher',...
--     (edition AND book slug both literal) to keep 10-column arity. Jubilees 6:7 and several vv. are absent from this parse
--     (the parse jumps 6->8, skips 6:12/18/23/28/33); only clean present verses (6:1,6:3,6:4,6:17) are quoted as members.

CREATE TEMP VIEW _s301_ge08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================== cross_references ==============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): Elohim remembered Noah — the wind/ruach over the waters, new creation through water
    ('canon','genesis',8,1,'canon','genesis',1,2,'free',
      E'*And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of Elohim (God) moved upon the face of the waters* (Genesis 1:2). When *Elohim (God) made a wind to pass over the earth, and the waters asswaged* (Genesis 8:1), the language of the first creation returns: the same *waters*, the same *deep*, and the breath/Spirit of Elohim moving over them. The flood-world is a creation re-made through judgement-water — the deep covered over and then drawn back, the dry land appearing again, as in the beginning.'),
    ('canon','genesis',8,1,'jasher','jasher',6,32,'extras',
      E'*And Yahuah (the Lord) hearkened to the voice of Noah, and Yahuah (the Lord) remembered him* (Jasher 6:32). Jasher carries the very turning of Genesis 8:1 — *And Elohim (God) remembered Noah* — and names it as answered prayer: Noah cried from the tossed ark, and *Yahuah... remembered him.* The "remembering" is covenant-faithfulness acting, not mere recollection; the deliverance begins the instant Yahuah turns toward the one He has kept.'),
    ('canon','genesis',8,1,'jasher','jasher',6,33,'extras',
      E'*And a wind passed over the earth, and the waters were still and the ark rested* (Jasher 6:33). Almost verbatim with the Torah — *Elohim (God) made a wind to pass over the earth, and the waters asswaged* (Genesis 8:1) — Jasher binds the wind, the stilling of the waters, and the resting of the ark into one moment. The ruach passes over the deep and the chaos subsides, the same Spirit-over-the-waters that ordered the first creation now quieting the flood.'),
    ('canon','genesis',8,1,'canon','1-peter',3,20,'free',
      E'*Which sometime were disobedient, when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water* (1 Peter 3:20). The waters that *asswaged* (Genesis 8:1) had borne the *eight souls* through: Kepha reads the flood not only as judgement but as the means by which the remnant was *saved by water* — the deep that drowned the old world carried the ark of the new through.'),
    ('canon','genesis',8,3,'canon','1-peter',3,21,'free',
      E'*The like figure whereunto even baptism doth also now save us (not the putting away of the filth of the flesh, but the answer of a good conscience toward Elohim (God),) by the resurrection of Yahusha HaMashiach (Jesus Christ)* (1 Peter 3:21). As *the waters returned from off the earth continually* (Genesis 8:3) and the dry land rose, the world passed through water into new life. Kepha names this the figure of the salvation now given — the new creation through water, fulfilled *by the resurrection of Yahusha HaMashiach (Jesus Christ).*'),

    -- THREAD 2: the dove and the olive leaf — the Spirit descending like a dove
    ('canon','genesis',8,11,'canon','matthew',3,16,'free',
      E'*And Yahusha (Jesus), when he was baptized, went up straightway out of the water: and, lo, the heavens were opened unto him, and he saw the Spirit of Elohim (God) descending like a dove, and lighting upon him* (Matthew 3:16). *And the dove came in to him in the evening; and, lo, in her mouth was an olive leaf pluckt off: so Noah knew that the waters were abated from off the earth* (Genesis 8:11). The dove returning over the receding waters with the olive leaf — the sign of peace and renewed earth — is answered when, over the waters of the immersion, *the Spirit of Elohim (God) descending like a dove* lights on the Messiah: the new creation begun, the deep crossed, peace declared from heaven.'),

    -- THREAD 3 (★): Noah's altar — the clean beasts and the sweet savour
    ('canon','genesis',8,21,'canon','ephesians',5,2,'free',
      E'*And walk in love, as Messiah (Christ) also hath loved us, and hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2). *And Yahuah (LORD) smelled a sweet savour* (Genesis 8:21) at Noah''s burnt offering, and stayed His hand from the curse. The accepted savour of the first altar after the flood is the foreshadow Sha''ul names fulfilled: the Formed Son *hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* — the offering that finally and fully turns away the wrath.'),
    ('canon','genesis',8,20,'canon','hebrews',13,15,'free',
      E'*By him therefore let us offer the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name* (Hebrews 13:15). *And Noah builded an altar unto Yahuah (LORD)... and offered burnt offerings on the altar* (Genesis 8:20) — the first act of the saved remnant is worship at an altar. That altar-pattern is carried forward into the assembly: *by him* the burnt offering becomes *the sacrifice of praise to Elohim (God) continually*, the same upward-rising savour now borne on the lips of the redeemed.'),
    ('canon','genesis',8,20,'jubilees','jubilees',6,1,'extras',
      E'*And on the new moon of the third month he went forth from the ark, and built an altar on that mountain* (Jubilees 6:1). Jubilees fixes the date of Genesis 8:20 — *And Noah builded an altar unto Yahuah (LORD)* — to the new moon of the third month, the very season of Shavuot. The first altar of the cleansed earth is built not at random but on an appointed time, the worship of the remnant already tied to the calendar of Yahuah.'),
    ('canon','genesis',8,21,'jubilees','jubilees',6,3,'extras',
      E'*And he placed the fat thereof on the altar... and placed a burnt sacrifice on the altar, and poured thereon an offering mingled with oil, and sprinkled wine and strewed frankincense over everything, and caused a goodly savour to arise, acceptable before Yahuah (God)* (Jubilees 6:3). The Torah''s *Yahuah (LORD) smelled a sweet savour* (Genesis 8:21) is unfolded here in full liturgy: the fat, the oil, the wine, the frankincense, and the *goodly savour... acceptable before Yahuah (God).* The acceptance of the offering is the ground on which the no-more-curse oath is spoken.'),
    ('canon','genesis',8,20,'jasher','jasher',6,9,'extras',
      E'*Two and two came to Noah into the ark, but from the clean animals, and clean fowls, he brought seven couples, as Elohim (God) had commanded him* (Jasher 6:9). When Noah *took of every clean beast, and of every clean fowl, and offered burnt offerings* (Genesis 8:20), he could do so because the clean had been gathered by sevens — and Jasher names it *as Elohim (God) had commanded him.* The clean/unclean distinction is already in force, pre-Sinai, written into the gathering of the ark and the altar of the new earth.'),

    -- THREAD 4 (★): While the earth remaineth, seedtime and harvest shall not cease
    ('canon','genesis',8,22,'jubilees','jubilees',6,4,'extras',
      E'*And Yahuah (God) smelt the goodly savour, and He made a covenant with him that there should not be any more a flood to destroy the earth; that all the days of the earth seed-time and harvest should never cease; cold and heat, and summer and winter, and day and night should not change their order, nor cease for ever* (Jubilees 6:4). The Torah''s promise — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease* (Genesis 8:22) — is here declared to be a COVENANT. The constancy of the seasons is not mere nature; it is a sworn order of Yahuah, the standing pledge beneath all the appointed times.'),
    ('canon','genesis',8,22,'jubilees','jubilees',6,17,'extras',
      E'*For this reason it is ordained and written on the heavenly tables, that they should celebrate the feast of weeks in this month once a year, to renew the covenant every year* (Jubilees 6:17). The unbroken order of *seedtime and harvest... summer and winter* (Genesis 8:22) is the ground on which the moed stands: the feast of weeks (Shavuot) is set *to renew the covenant every year*, the appointed time growing directly out of the covenant-constancy of the seasons sworn at Noah''s altar.'),
    ('canon','genesis',8,22,'canon','jeremiah',33,20,'free',
      E'*Thus saith Yahuah (LORD); If ye can break my covenant of the day, and my covenant of the night, and that there should not be day and night in their season* (Jeremiah 33:20). Genesis 8:22 promises that *day and night shall not cease*; Jeremiah calls that very order *my covenant of the day, and my covenant of the night.* The rhythm of *day and night in their season* is a covenant as binding as any oath — the faithfulness of Yahuah to the created order made the surety of His faithfulness to His people.'),
    ('canon','genesis',8,22,'canon','jeremiah',33,25,'free',
      E'*Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth* (Jeremiah 33:25). The pledge of Genesis 8:22 — *summer and winter, and day and night shall not cease* — Jeremiah names *the ordinances of heaven and earth*, as unbreakable as the throne promised to David. The constancy of the seasons is the measure of covenant-certainty itself: as surely as the seasons keep their order, so surely Yahuah keeps His word.'),
    ('canon','genesis',8,22,'canon','isaiah',54,9,'free',
      E'*For this is as the waters of Noah unto me: for as I have sworn that the waters of Noah should no more go over the earth; so have I sworn that I would not be wroth with thee, nor rebuke thee* (Isaiah 54:9). The sworn constancy behind *While the earth remaineth... shall not cease* (Genesis 8:22) is taken up by the prophet as the pattern of Yahuah''s mercy: *as I have sworn that the waters of Noah should no more go over the earth*, so He swears everlasting kindness to His people — the oath of the seasons made the figure of the oath of restoration.'),
    ('canon','genesis',8,21,'canon','genesis',9,11,'free',
      E'*And I will establish my covenant with you; neither shall all flesh be cut off any more by the waters of a flood; neither shall there any more be a flood to destroy the earth* (Genesis 9:11). The resolve spoken in Yahuah''s heart at the altar — *I will not again curse the ground any more for man''s sake... neither will I again smite any more every thing living, as I have done* (Genesis 8:21) — is then sealed openly as covenant: *neither shall there any more be a flood to destroy the earth.* The inward oath of acceptance becomes the standing covenant with all flesh.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================== threads ==============================
-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-8-elohim-remembered-noah-the-wind-over-the-waters',
       E'Elohim remembered Noah — the wind over the waters',
       E'The flood turns at a single word: *And Elohim (God) remembered Noah, and every living thing, and all the cattle that was with him in the ark: and Elohim (God) made a wind to pass over the earth, and the waters asswaged* (Genesis 8:1); *And the waters returned from off the earth continually* (Genesis 8:3). The "remembering" is not recollection but covenant-faithfulness acting — Jasher hears it as answered prayer: *Yahuah (the Lord) hearkened to the voice of Noah, and Yahuah (the Lord) remembered him* (Jasher 6:32), and then, almost in the Torah''s own words, *a wind passed over the earth, and the waters were still and the ark rested* (Jasher 6:33). And the wind over the waters is no new thing: it is the breath of the first creation returning. *And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of Elohim (God) moved upon the face of the waters* (Genesis 1:2) — the same deep, the same waters, the same Spirit-wind, now drawing back the flood so the dry land may rise again. The flood-world is a creation re-made through judgement-water. Kepha names what that water was for: *the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water* (1 Peter 3:20), *the like figure whereunto even baptism doth also now save us... by the resurrection of Yahusha HaMashiach (Jesus Christ)* (1 Peter 3:21). The deep that drowned the old world bore the ark of the new through — the new creation through water, remembered and brought up by the faithfulness of Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 20175
  FROM _s301_ge08_lookup sv, _s301_ge08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=8 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-8-the-dove-and-the-olive-leaf-the-spirit-descending',
       E'The dove and the olive leaf — the Spirit descending',
       E'Noah sends out the birds to read the waters. First *a raven, which went forth to and fro, until the waters were dried up from off the earth* (Genesis 8:7); then the dove, who *found no rest for the sole of her foot* (Genesis 8:9) and returned. Seven days later he sent her again: *And the dove came in to him in the evening; and, lo, in her mouth was an olive leaf pluckt off: so Noah knew that the waters were abated from off the earth* (Genesis 8:11). The dove returning over the receding deep with the olive leaf — the sign of peace and a renewed, fruit-bearing earth — is the quiet emblem of the new creation. And it is answered at the Jordan, over another water, at the beginning of another new creation: *And Yahusha (Jesus), when he was baptized, went up straightway out of the water: and, lo, the heavens were opened unto him, and he saw the Spirit of Elohim (God) descending like a dove, and lighting upon him* (Matthew 3:16). The dove that found rest on the olive over the abated flood becomes the Spirit who lights upon the Messiah as he rises from the water — peace declared from the opened heavens, the new creation begun.',
       sv.verse_id, ev.verse_id, 'free', 20178
  FROM _s301_ge08_lookup sv, _s301_ge08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=8 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-8-noahs-altar-the-clean-beasts-and-the-sweet-savour',
       E'Noah''s altar — the clean beasts and the sweet savour',
       E'The first act of the saved remnant on the cleansed earth is worship: *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar. And Yahuah (LORD) smelled a sweet savour* (Genesis 8:20-21). Two things stand out. First, the clean/unclean distinction is already in force, long before Sinai — Jasher names it plainly: *from the clean animals, and clean fowls, he brought seven couples, as Elohim (God) had commanded him* (Jasher 6:9), the clean gathered by sevens for this very altar. Second, the offering is ACCEPTED — the *sweet savour* turns Yahuah''s heart from the curse. Jubilees fixes the altar to an appointed time and unfolds its liturgy: *on the new moon of the third month he went forth from the ark, and built an altar on that mountain* (Jubilees 6:1); he *placed a burnt sacrifice on the altar... and caused a goodly savour to arise, acceptable before Yahuah (God)* (Jubilees 6:3). And the accepted savour of the first post-flood altar is the foreshadow the apostle names fulfilled: *Messiah (Christ) also hath loved us, and hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2) — the offering that finally and fully turns away the wrath. The altar-pattern continues in the assembly: *by him therefore let us offer the sacrifice of praise to Elohim (God) continually* (Hebrews 13:15). Noah''s burnt offering is atonement and acceptance in figure; the Formed Son is the savour in full.',
       sv.verse_id, ev.verse_id, 'extras', 20181
  FROM _s301_ge08_lookup sv, _s301_ge08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=8 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-8-seedtime-and-harvest-shall-not-cease',
       E'While the earth remaineth — seedtime and harvest shall not cease',
       E'Out of the accepted offering comes a promise about time itself: *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease* (Genesis 8:22). This is not a comment on weather; it is the covenant-order of the seasons, the faithfulness of Yahuah to the created order He set when He made the lights *for signs, and for seasons.* Jubilees declares it outright a covenant: *He made a covenant with him... that all the days of the earth seed-time and harvest should never cease; cold and heat, and summer and winter, and day and night should not change their order, nor cease for ever* (Jubilees 6:4) — and roots the appointed times in it, *that they should celebrate the feast of weeks in this month once a year, to renew the covenant every year* (Jubilees 6:17). The prophets reach back to this very constancy as the measure of Yahuah''s reliability: *If ye can break my covenant of the day, and my covenant of the night, and that there should not be day and night in their season* (Jeremiah 33:20), *if my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth* (Jeremiah 33:25) — only then could His covenant with David be broken. Isaiah swears by it: *as I have sworn that the waters of Noah should no more go over the earth; so have I sworn that I would not be wroth with thee* (Isaiah 54:9). And what was resolved in Yahuah''s heart at the altar — *I will not again curse the ground any more for man''s sake* (Genesis 8:21) — is sealed openly: *neither shall there any more be a flood to destroy the earth* (Genesis 9:11). The unbroken seasons are the standing pledge the whole calendar of the moedim, and every promise of restoration, is built upon.',
       sv.verse_id, ev.verse_id, 'extras', 20184
  FROM _s301_ge08_lookup sv, _s301_ge08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=8 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ============================== thread_members ==============================
-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the Spirit of Elohim (God) moved upon the face of the waters* (Genesis 1:2) — the wind/ruach over the waters of Genesis 8:1 is the breath of the first creation returning over the same deep.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-elohim-remembered-noah-the-wind-over-the-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah (the Lord)... remembered him* (Jasher 6:32) — Genesis 8:1''s remembering read as answered prayer, covenant-faithfulness acting.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=6 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-elohim-remembered-noah-the-wind-over-the-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*a wind passed over the earth, and the waters were still and the ark rested* (Jasher 6:33) — almost verbatim with Genesis 8:1, the ruach quieting the deep.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=6 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-elohim-remembered-noah-the-wind-over-the-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*eight souls were saved by water* (1 Peter 3:20) — the asswaging waters of Genesis 8:1 bore the remnant through; the longsuffering of Elohim fulfilled.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-elohim-remembered-noah-the-wind-over-the-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the like figure whereunto even baptism doth also now save us... by the resurrection* (1 Peter 3:21) — the waters returning off the earth (Genesis 8:3) as the figure of the new creation through water.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-elohim-remembered-noah-the-wind-over-the-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he saw the Spirit of Elohim (God) descending like a dove, and lighting upon him* (Matthew 3:16) — the dove with the olive leaf over the abated flood (Genesis 8:11) answered by the Spirit-dove over the immersion, the new creation begun.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-the-dove-and-the-olive-leaf-the-spirit-descending'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*from the clean animals, and clean fowls, he brought seven couples, as Elohim (God) had commanded him* (Jasher 6:9) — the clean/unclean distinction already in force pre-Sinai, the clean gathered for the altar of Genesis 8:20.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=20
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=6 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-noahs-altar-the-clean-beasts-and-the-sweet-savour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*on the new moon of the third month he went forth from the ark, and built an altar* (Jubilees 6:1) — the first altar (Genesis 8:20) fixed to an appointed time, the season of Shavuot.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=20
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-noahs-altar-the-clean-beasts-and-the-sweet-savour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*caused a goodly savour to arise, acceptable before Yahuah (God)* (Jubilees 6:3) — the *sweet savour* of Genesis 8:21 unfolded in full liturgy, the offering accepted.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=21
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-noahs-altar-the-clean-beasts-and-the-sweet-savour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2) — Noah''s accepted savour (Genesis 8:21) the foreshadow of the Formed Son''s self-offering that turns away the wrath.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=21
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-noahs-altar-the-clean-beasts-and-the-sweet-savour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*by him... let us offer the sacrifice of praise to Elohim (God) continually* (Hebrews 13:15) — Noah''s altar (Genesis 8:20) the pattern carried into the assembly''s continual upward-rising savour.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=20
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-noahs-altar-the-clean-beasts-and-the-sweet-savour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*He made a covenant with him... seed-time and harvest should never cease; cold and heat, and summer and winter... should not change their order* (Jubilees 6:4) — Genesis 8:22''s promise declared a COVENANT, the constancy of the seasons a sworn order.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-seedtime-and-harvest-shall-not-cease'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*celebrate the feast of weeks in this month once a year, to renew the covenant every year* (Jubilees 6:17) — the moed (Shavuot) rooted in the season-constancy of Genesis 8:22.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-seedtime-and-harvest-shall-not-cease'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*my covenant of the day, and my covenant of the night... day and night in their season* (Jeremiah 33:20) — the day/night order of Genesis 8:22 named a covenant as binding as the throne of David.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-seedtime-and-harvest-shall-not-cease'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*if my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth* (Jeremiah 33:25) — Genesis 8:22''s seasons named *the ordinances of heaven*, the measure of covenant-certainty.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-seedtime-and-harvest-shall-not-cease'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*as I have sworn that the waters of Noah should no more go over the earth; so have I sworn... everlasting kindness* (Isaiah 54:9) — the oath of the seasons (Genesis 8:22) the figure of the oath of restoration.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=22
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-seedtime-and-harvest-shall-not-cease'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*neither shall there any more be a flood to destroy the earth* (Genesis 9:11) — the inward resolve at the altar (Genesis 8:21) sealed openly as the covenant with all flesh.'
  FROM cross_reference_threads t
  JOIN _s301_ge08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=8 AND sv.verse_number=21
  JOIN _s301_ge08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-8-seedtime-and-harvest-shall-not-cease'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
