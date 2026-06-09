-- ----- fragment: minion_acts_06_07.sql (S217 Acts 6-7) -----
-- =====================================================================
-- S217 minion — ACTS 6-7 FULL-LIBRARY cross-references
-- =====================================================================
-- Range:  ACTS 6-7.  Tag: a0607 (temp view _s217_a0607_lookup).  Sort band: 5200-5270.
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- WATCHPOINT (Checklist 9): Stephen's speech climaxes in the prophets' own charge against a
-- faithless generation WITHIN the covenant (stiffnecked, uncircumcised in heart, resisting the
-- Spirit, persecuting the sent ones). It is covenant-internal rebuke of CONDUCT — the same
-- charge Moses and the prophets made of the same people — never ethnic condemnation of the
-- Yahudim (Jews) / the seed of Yashar'el (Israel). Framed accordingly in thread acts-7-stiffnecked.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 6:
--   v.1-7   the seven appointed   Tanakh: Numbers 11:16-17 (Exodus 18:21 weighed; no Spirit element, not added)  Extras: none warranted  NT: none warranted (narrative)
--   v.8-10  wisdom none resisted  Tanakh: none added  Extras: none warranted  NT: Luke 21:15
--   v.11-14 false witnesses       Tanakh: none added  Extras: none warranted  NT: Matthew 26:60-61
--   v.15    face as an angel      Tanakh: Exodus 34:29-30  Extras: none warranted  NT: none warranted
--  ACTS 7:
--   v.2-7   God of glory/Abraham  Tanakh: Genesis 12:1, 15:13-14  Extras: 1 Maccabees 2:52  NT: none warranted
--   v.8     circumcision/12 patr  Tanakh: (Genesis 17:10 weighed) none added  Extras: none  NT: none (carried in promise thread)
--   v.9-19  Joseph sold to Egypt  Tanakh: Genesis 37:28, 45:5  Extras: 1 Maccabees 2:53  NT: none added
--   v.20-37 Moses refused->sent   Tanakh: Exodus 2:14 (Exodus 3 bush + Deut 18:15 quoted in 7:32-37 carried in Acts 3 threads, not re-added)  Extras: none  NT: none
--   v.38-43 calf / host of heaven Tanakh: Exodus 32:1, Amos 5:25-27  Extras: (Jubilees 1:8-10, 1 Enoch 99:7 weighed; cleanest witnesses carry apparatus/parentheticals, not added)  NT: none
--   v.44-50 temple/Most High      Tanakh: Isaiah 66:1-2, 1 Kings 8:27  Extras: none warranted  NT: none ("Gentiles" of 7:45 = nations dispossessed, narrative; 7:45 "Yahusha"=Joshua parse artifact, not threaded)
--   v.51-53 stiffnecked/prophets  Tanakh: Exodus 33:5, Deuteronomy 10:16, Isaiah 63:10  Extras: Jubilees 1:12  NT: none added
--   v.55-60 Son of Adam/forgive   Tanakh: Daniel 7:13  Extras: (1 Enoch 62/69 enthroned Son of Adam carried in Acts 2 thread, not re-added)  NT: Luke 22:69, Luke 23:34
--
-- THREADS (slug -> target libraries):
--   5200 acts-6-the-seven-chosen-and-the-spirit-of-the-seventy                (Tanakh)
--   5210 acts-6-tried-like-his-master-the-wisdom-none-could-resist            (Tanakh + NT)
--   5220 acts-7-the-god-of-glory-and-the-promise-to-abrahams-seed             (Tanakh + Extras)
--   5230 acts-7-the-rejected-deliverer-joseph-sold-and-moses-refused-then-sent (Tanakh + Extras)
--   5240 acts-7-the-calf-and-the-host-of-heaven-the-charge-of-amos            (Tanakh)
--   5250 acts-7-the-most-high-dwelleth-not-in-temples-made-with-hands         (Tanakh)
--   5260 acts-7-stiffnecked-and-uncircumcised-in-heart-the-prophets-charge    (Tanakh + Extras)
--   5270 acts-7-the-son-of-adam-standing-at-the-right-hand                    (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s217_a0607_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-6-the-seven-chosen-and-the-spirit-of-the-seventy
  ('canon', 'acts', 6, 3, 'canon', 'numbers', 11, 16, 'free', E'*And Yahuah (LORD) said unto Moses, Gather unto me seventy men of the elders of Yashar''el (Israel), whom thou knowest to be the elders of the people, and officers over them; and bring them unto the tabernacle of the congregation, that they may stand there with thee.* (Numbers 11:16). When the apostles say *look ye out among you seven men of honest report, full of the Ruach HaKodesh (Holy Spirit) and wisdom* (Acts 6:3), they do what Moses did — gather Spirit-bearing men to share the burden of the people, so the word is not left for serving tables.'),
  ('canon', 'acts', 6, 3, 'canon', 'numbers', 11, 17, 'free', E'*And I will come down and talk with thee there: and I will take of the spirit which is upon thee, and will put it upon them; and they shall bear the burden of the people with thee, that thou bear it not thyself alone.* (Numbers 11:17). The seventy bore the burden with Moses by the same Spirit that was on him; the seven of Acts 6:3, *full of the Ruach HaKodesh (Holy Spirit),* bear the burden with the twelve. The Spirit distributes the load so the ministry of the word is not abandoned.'),
  -- thread: acts-6-tried-like-his-master-the-wisdom-none-could-resist
  ('canon', 'acts', 6, 10, 'canon', 'luke', 21, 15, 'free', E'*For I will give you a mouth and wisdom, which all your adversaries shall not be able to gainsay nor resist.* (Luke 21:15). *They were not able to resist the wisdom and the spirit by which he spake* (Acts 6:10) — the Master''s promise kept in his servant. Yahusha (Jesus) said the wisdom he gave would be unanswerable, and Stephen''s accusers could not withstand it.'),
  ('canon', 'acts', 6, 13, 'canon', 'matthew', 26, 61, 'free', E'*And said, This fellow said, I am able to destroy the temple of Elohim (God), and to build it in three days.* (Matthew 26:61). The charge against Stephen is the charge they laid on his Master — *this Yahusha (Jesus) of Nazareth shall destroy this place* (Acts 6:14). False witnesses brought the temple-accusation against the Messiah; false witnesses bring it now against the one who follows him.'),
  ('canon', 'acts', 6, 15, 'canon', 'exodus', 34, 29, 'free', E'*And it came to pass, when Moses came down from mount Sinai with the two tables of testimony in Moses'' hand, when he came down from the mount, that Moses wist not that the skin of his face shone while he talked with him.* (Exodus 34:29). They accuse Stephen of blaspheming Moses, yet *all that sat in the council … saw his face as it had been the face of an angel* (Acts 6:15) — the very shining Moses bore when he came down from speaking with Yahuah. The man they charge wears the mark of one who has been with Elohim (God).'),
  -- thread: acts-7-the-god-of-glory-and-the-promise-to-abrahams-seed
  ('canon', 'acts', 7, 3, 'canon', 'genesis', 12, 1, 'free', E'*Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee:* (Genesis 12:1). Stephen begins where the covenant began — *The Elohim (God) of glory appeared unto our father Abraham … Get thee out of thy country* (Acts 7:2-3). The call that started the seed-line is the foundation of the whole history he is about to recite.'),
  ('canon', 'acts', 7, 6, 'canon', 'genesis', 15, 13, 'free', E'*And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* (Genesis 15:13). *His seed should sojourn in a strange land … four hundred years* (Acts 7:6) is the word spoken to Abraham — the bondage foretold to the seed before ever there was a child, the promise running ahead of the people who would carry it.'),
  ('canon', 'acts', 7, 7, 'canon', 'genesis', 15, 14, 'free', E'*And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance.* (Genesis 15:14). *The nation to whom they shall be in bondage will I judge, said Elohim (God): and after that shall they come forth* (Acts 7:7). The judgment on Egypt and the coming-out were sworn to Abraham generations before the exodus; the deliverer comes because the promise was first.'),
  ('canon', 'acts', 7, 2, 'apocrypha', '1-maccabees', 2, 52, 'extras', E'*Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* (1 Maccabees 2:52). The Hebrew library rehearses the fathers as Stephen does — Mattathias, dying, names *Abraham found faithful.* The God of glory who called Abraham (Acts 7:2) is the One the library''s own deathbed recital begins with.'),
  -- thread: acts-7-the-rejected-deliverer-joseph-sold-and-moses-refused-then-sent
  ('canon', 'acts', 7, 9, 'canon', 'genesis', 37, 28, 'free', E'*Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt.* (Genesis 37:28). *The patriarchs, moved with envy, sold Joseph into Egypt* (Acts 7:9). Stephen sets the pattern: the deliverer rejected by his own brethren, sold for silver, sent ahead by Elohim (God) into the place of saving.'),
  ('canon', 'acts', 7, 9, 'canon', 'genesis', 45, 5, 'free', E'*Now therefore be not grieved, nor angry with yourselves, that ye sold me hither: for Elohim (God) did send me before you to preserve life.* (Genesis 45:5). *But Elohim (God) was with him* (Acts 7:9) — the rejected brother becomes the saver of the brethren who sold him: *Elohim (God) did send me before you to preserve life.* The one cast out is the one through whom the house lives.'),
  ('canon', 'acts', 7, 27, 'canon', 'exodus', 2, 14, 'free', E'*And he said, Who made thee a prince and a judge over us? intendest thou to kill me, as thou killedst the Egyptian? And Moses feared, and said, Surely this thing is known.* (Exodus 2:14). *Who made thee a ruler and a judge over us?* (Acts 7:27) is the same refusal — and *this Moses whom they refused … the same did Elohim (God) send to be a ruler and a deliverer* (Acts 7:35). Twice rejected, then sent: the pattern Joseph began and the Just One completes.'),
  ('canon', 'acts', 7, 9, 'apocrypha', '1-maccabees', 2, 53, 'extras', E'*Joseph in the time of his distress kept the commandment and was made lord of Egypt.* (1 Maccabees 2:53). The library remembers Joseph as Stephen does — distressed, sold, yet faithful, and *made lord of Egypt.* The rejected deliverer kept the commandment in the pit and the prison, and was lifted to save; the pattern of the One the fathers refused.'),
  -- thread: acts-7-the-calf-and-the-host-of-heaven-the-charge-of-amos
  ('canon', 'acts', 7, 40, 'canon', 'exodus', 32, 1, 'free', E'*And when the people saw that Moses delayed to come down out of the mount, the people gathered themselves together unto Aaron, and said unto him, Up, make us gods, which shall go before us; for as for this Moses, the man that brought us up out of the land of Egypt, we wot not what is become of him.* (Exodus 32:1). *Saying unto Aaron, Make us gods to go before us* (Acts 7:40). While Moses received the lively oracles on the mount, the fathers turned to the calf — the rejection of the deliverer and his words shown in the same hour they were given.'),
  ('canon', 'acts', 7, 42, 'canon', 'amos', 5, 25, 'free', E'*Have ye offered unto me sacrifices and offerings in the wilderness forty years, O house of Yashar''el (Israel)?* (Amos 5:25). Stephen reads the wilderness idolatry out of Amos — *O ye house of Yashar''el (Israel), have ye offered to me slain beasts and sacrifices by the space of forty years in the wilderness?* (Acts 7:42). The forty years of sacrifice were shadowed by the worship of the host of heaven the people carried in their hearts.'),
  ('canon', 'acts', 7, 43, 'canon', 'amos', 5, 26, 'free', E'*But ye have borne the tabernacle of your Moloch and Chiun your images, the star of your god, which ye made to yourselves.* (Amos 5:26). *Ye took up the tabernacle of Moloch, and the star of your god Remphan* (Acts 7:43) is Amos''s charge — the star-god carried alongside the tabernacle of witness, the host of heaven worshipped in the place of the One who made it.'),
  ('canon', 'acts', 7, 43, 'canon', 'amos', 5, 27, 'free', E'*Therefore will I cause you to go into captivity beyond Damascus, saith Yahuah (LORD), whose name is The Elohim (God) of hosts.* (Amos 5:27). Amos says *beyond Damascus*; Stephen says *I will carry you away beyond Babylon* (Acts 7:43) — the exile-judgment for the idolatry, the scattering that the star-worship earned. The host-of-heaven worship and the carrying-away are one sentence.'),
  -- thread: acts-7-the-most-high-dwelleth-not-in-temples-made-with-hands
  ('canon', 'acts', 7, 49, 'canon', 'isaiah', 66, 1, 'free', E'*Thus saith Yahuah (LORD), The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me? and where is the place of my rest?* (Isaiah 66:1). Stephen quotes the prophet against the trust in the building — *Heaven is my throne, and earth is my footstool: what house will ye build me?* (Acts 7:49). The El Elyon (most High) is not housed in walls; the temple was never the thing the people made it.'),
  ('canon', 'acts', 7, 50, 'canon', 'isaiah', 66, 2, 'free', E'*For all those things hath mine hand made, and all those things have been, saith Yahuah (LORD): but to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word.* (Isaiah 66:2). *Hath not my hand made all these things?* (Acts 7:50). The Maker of all looks not to the house of stone but to the contrite heart that trembles at his word — the temple he seeks is not made with hands.'),
  ('canon', 'acts', 7, 48, 'canon', '1-kings', 8, 27, 'free', E'*But will Elohim (God) indeed dwell on the earth? behold, the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* (1 Kings 8:27). Even Solomon, dedicating the house, confessed it could not contain Elohim (God) — *the heaven and heaven of heavens cannot contain thee.* *The El Elyon (most High) dwelleth not in temples made with hands* (Acts 7:48); the builder of the temple said so first.'),
  -- thread: acts-7-stiffnecked-and-uncircumcised-in-heart-the-prophets-charge
  ('canon', 'acts', 7, 51, 'canon', 'exodus', 33, 5, 'free', E'*For Yahuah (LORD) had said unto Moses, Say unto the children of Yashar''el (Israel), Ye are a stiffnecked people: I will come up into the midst of thee in a moment, and consume thee: therefore now put off thy ornaments from thee, that I may know what to do unto thee.* (Exodus 33:5). *Ye stiffnecked … as your fathers did, so do ye* (Acts 7:51) is Moses'' own word for the same covenant people — *ye are a stiffnecked people.* Stephen levels no new accusation; he speaks the charge the Torah already named over the fathers.'),
  ('canon', 'acts', 7, 51, 'canon', 'deuteronomy', 10, 16, 'free', E'*Circumcise therefore the foreskin of your heart, and be no more stiffnecked.* (Deuteronomy 10:16). *Uncircumcised in heart and ears* (Acts 7:51) is Moses'' own diagnosis and Moses'' own remedy — *circumcise … the foreskin of your heart, and be no more stiffnecked.* The charge is about the heart that resists, not the flesh; it is the call to return that Moses first gave.'),
  ('canon', 'acts', 7, 51, 'canon', 'isaiah', 63, 10, 'free', E'*But they rebelled, and vexed his holy Spirit: therefore he was turned to be their enemy, and he fought against them.* (Isaiah 63:10). *Ye do always resist the Ruach HaKodesh (Holy Spirit)* (Acts 7:51) is Isaiah''s lament of the wilderness generation — *they rebelled, and vexed his holy Spirit.* The resisting of the Spirit is the recurring sin in every generation that turns, the one Stephen names in his own.'),
  ('canon', 'acts', 7, 52, 'jubilees', 'jubilees', 1, 12, 'extras', E'*And I will send witnesses to them, that I may witness against them, but they will not hear, and will slay the witnesses also, and they will persecute those who seek the law, and they will abrogate and change everything so as to work evil before My eyes.* (Jubilees 1:12). The Hebrew library foretold the very thing Stephen names — *which of the prophets have not your fathers persecuted? and they have slain them* (Acts 7:52). Yahuah (God) said the sent witnesses would be slain and the seekers of the law persecuted; the pattern is the conduct of the faithless in every age, not the mark of a people.'),
  -- thread: acts-7-the-son-of-adam-standing-at-the-right-hand
  ('canon', 'acts', 7, 56, 'canon', 'daniel', 7, 13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13). *I see the heavens opened, and the Son of Adam standing on the right hand of Elohim (God)* (Acts 7:56). The figure Daniel saw — *one like the Son of Adam,* the kaph honoring the incarnation of the Formed cloud-rider — is the One Stephen now beholds glorified at the right hand, risen to receive his witness.'),
  ('canon', 'acts', 7, 56, 'canon', 'luke', 22, 69, 'free', E'*Hereafter shall the Son of Adam sit on the right hand of the power of Elohim (God).* (Luke 22:69). Before the same council Yahusha (Jesus) had said it — *the Son of Adam … on the right hand of the power of Elohim (God)* — and they condemned him for it. Stephen now sees the word made sight: *the Son of Adam standing on the right hand of Elohim (God)* (Acts 7:56), and they stop their ears at the same testimony.'),
  ('canon', 'acts', 7, 60, 'canon', 'luke', 23, 34, 'free', E'*Then said Yahusha (Jesus), Father, forgive them; for they know not what they do. And they parted his raiment, and cast lots.* (Luke 23:34). Stephen dies as his Master died — *Yahuah (Lord), lay not this sin to their charge* (Acts 7:60) echoes *Father, forgive them; for they know not what they do.* The witness follows the One he witnessed to, even into the prayer for those who stone him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a0607_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a0607_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-6-the-seven-chosen-and-the-spirit-of-the-seventy',
       E'The seven chosen — the Spirit shared as with the seventy',
       E'When a murmuring arises and the widows are neglected, the twelve do not abandon the word to serve tables; they say *look ye out among you seven men of honest report, full of the Ruach HaKodesh (Holy Spirit) and wisdom, whom we may appoint over this business* (Acts 6:3). It is Moses'' own pattern. When the burden of the people was too heavy, Yahuah (LORD) told Moses, *Gather unto me seventy men of the elders of Yashar''el (Israel) … that they may stand there with thee* (Numbers 11:16), *and I will take of the spirit which is upon thee, and will put it upon them; and they shall bear the burden of the people with thee, that thou bear it not thyself alone* (Numbers 11:17). The seventy bore the burden by the same Spirit that rested on Moses; the seven bear it by the same Spirit that fills the twelve. The ministry of the word is guarded, and the Spirit distributes the load.',
       sv.verse_id, ev.verse_id, 'free', 5200
  FROM _s217_a0607_lookup sv, _s217_a0607_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-6-tried-like-his-master-the-wisdom-none-could-resist',
       E'Tried like his Master — the wisdom none could resist, the false witnesses, the shining face',
       E'Stephen, *full of faith and power,* does great wonders, and *they were not able to resist the wisdom and the spirit by which he spake* (Acts 6:8-10). This is the Master''s own promise kept: *I will give you a mouth and wisdom, which all your adversaries shall not be able to gainsay nor resist* (Luke 21:15). Unable to answer him, they suborn false witnesses — *this man ceaseth not to speak … against this holy place, and the law … this Yahusha (Jesus) of Nazareth shall destroy this place* (Acts 6:13-14) — the very charge false witnesses laid on the Messiah himself: *This fellow said, I am able to destroy the temple of Elohim (God)* (Matthew 26:61). And while they accuse him of blaspheming Moses, his face shines as Moses'' did: *all that sat in the council … saw his face as it had been the face of an angel* (Acts 6:15), as *the skin of his face shone* when Moses came down from the mount (Exodus 34:29). The servant is tried as his Master was tried, and bears the mark of one who has been with Elohim (God).',
       sv.verse_id, ev.verse_id, 'free', 5210
  FROM _s217_a0607_lookup sv, _s217_a0607_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-7-the-god-of-glory-and-the-promise-to-abrahams-seed',
       E'The Elohim (God) of glory appeared to Abraham — the promise to the seed before the land',
       E'Stephen begins the whole history where the covenant began: *The Elohim (God) of glory appeared unto our father Abraham … Get thee out of thy country* (Acts 7:2-3) — the call of *Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1). And he was given *none inheritance in it … yet he promised that he would give it to him … and to his seed after him, when as yet he had no child* (Acts 7:5) — the promise running ahead of the people who would carry it. The bondage was foretold to the seed before there was a seed: *thy seed shall be a stranger in a land that is not theirs … they shall afflict them four hundred years* (Genesis 15:13), *and also that nation, whom they shall serve, will I judge: and afterward shall they come out* (Genesis 15:14). The Hebrew library rehearses the fathers as Stephen does — Mattathias, dying, begins, *Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* (1 Maccabees 2:52). The God of glory who called Abraham is the One the whole recital hangs on.',
       sv.verse_id, ev.verse_id, 'extras', 5220
  FROM _s217_a0607_lookup sv, _s217_a0607_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=7 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-7-the-rejected-deliverer-joseph-sold-and-moses-refused-then-sent',
       E'The rejected deliverer — Joseph sold, Moses refused, then sent to save',
       E'Stephen builds the pattern beat by beat. *The patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him* (Acts 7:9) — *they drew and lifted up Joseph out of the pit, and sold Joseph … for twenty pieces of silver* (Genesis 37:28), and the brother they rejected became their saver: *be not grieved … that ye sold me hither: for Elohim (God) did send me before you to preserve life* (Genesis 45:5). The library tells it the same way: *Joseph in the time of his distress kept the commandment and was made lord of Egypt* (1 Maccabees 2:53). Then Moses, the same: *Who made thee a prince and a judge over us?* (Exodus 2:14) — *this Moses whom they refused … the same did Elohim (God) send to be a ruler and a deliverer* (Acts 7:35). Twice the deliverer is cast out by his own and twice Elohim (God) sends him back to save. Stephen is laying the rail to the last and greatest instance: *the Just One; of whom ye have been now the betrayers and murderers* (Acts 7:52) — the rejected deliverer the fathers'' whole story foreshadowed.',
       sv.verse_id, ev.verse_id, 'extras', 5230
  FROM _s217_a0607_lookup sv, _s217_a0607_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=7 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-7-the-calf-and-the-host-of-heaven-the-charge-of-amos',
       E'The calf and the host of heaven — the charge of Amos',
       E'While Moses was on the mount receiving *the lively oracles to give unto us* (Acts 7:38), the fathers turned: *Make us gods to go before us: for as for this Moses … we wot not what is become of him* (Exodus 32:1), and *they made a calf … and rejoiced in the works of their own hands* (Acts 7:41). The calf was only the beginning; the deeper idolatry was the worship of the host of heaven, and Stephen reads it out of Amos. *O ye house of Yashar''el (Israel), have ye offered to me slain beasts and sacrifices by the space of forty years in the wilderness?* (Acts 7:42) is Amos''s *Have ye offered unto me sacrifices and offerings in the wilderness forty years, O house of Yashar''el (Israel)?* (Amos 5:25), and the star-god carried alongside the tabernacle: *ye have borne the tabernacle of your Moloch and Chiun your images, the star of your god* (Amos 5:26). The sentence on it is exile — Amos says *captivity beyond Damascus* (Amos 5:27), Stephen says *I will carry you away beyond Babylon* (Acts 7:43). The host-of-heaven worship and the scattering are one judgment: the rejection of the One who made the host, and the carrying-away that follows.',
       sv.verse_id, ev.verse_id, 'free', 5240
  FROM _s217_a0607_lookup sv, _s217_a0607_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=39
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=7 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-7-the-most-high-dwelleth-not-in-temples-made-with-hands',
       E'The Most High dwelleth not in temples made with hands',
       E'Stephen turns to the trust in the building itself: *Howbeit the El Elyon (most High) dwelleth not in temples made with hands; as saith the prophet, Heaven is my throne, and earth is my footstool: what house will ye build me? … or what is the place of my rest? Hath not my hand made all these things?* (Acts 7:48-50). It is Isaiah, word for word: *The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me?* (Isaiah 66:1), and *all those things hath mine hand made … but to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word* (Isaiah 66:2). Even Solomon, the day he dedicated the house, had confessed it: *behold, the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* (1 Kings 8:27). The Maker of heaven and earth is not housed in walls, and he looks not to the stone but to the trembling heart. The temple was never the thing the people had made it — a possession to guard against the Word that judges it.',
       sv.verse_id, ev.verse_id, 'free', 5250
  FROM _s217_a0607_lookup sv, _s217_a0607_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=48
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=7 AND ev.verse_number=50
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-7-stiffnecked-and-uncircumcised-in-heart-the-prophets-charge',
       E'Stiffnecked and uncircumcised in heart — the prophets'' own charge',
       E'Stephen ends not with an attack on a people but with the prophets'' own charge against a faithless generation: *Ye stiffnecked and uncircumcised in heart and ears, ye do always resist the Ruach HaKodesh (Holy Spirit): as your fathers did, so do ye* (Acts 7:51). Every word is Moses'' and the prophets'' own, spoken of the same covenant people. Moses called them *a stiffnecked people* (Exodus 33:5) and gave them the remedy — *Circumcise therefore the foreskin of your heart, and be no more stiffnecked* (Deuteronomy 10:16). Isaiah named the wilderness rebellion: *they rebelled, and vexed his holy Spirit* (Isaiah 63:10). And the Hebrew library foretold the very pattern Stephen names — *Which of the prophets have not your fathers persecuted? and they have slain them* (Acts 7:52) — for Yahuah (God) had said, *I will send witnesses to them … but they will not hear, and will slay the witnesses also, and they will persecute those who seek the law* (Jubilees 1:12). The charge is against the conduct of the heart that resists the Spirit and persecutes the sent ones — the recurring sin in every generation that turns from the covenant, *as your fathers did, so do ye.* It is not a verdict on the seed of Yashar''el (Israel) as a people; it is the prophet''s grief over his own, the lament of one calling his kin home.',
       sv.verse_id, ev.verse_id, 'extras', 5260
  FROM _s217_a0607_lookup sv, _s217_a0607_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=51
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=7 AND ev.verse_number=53
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-7-the-son-of-adam-standing-at-the-right-hand',
       E'The Son of Adam standing at the right hand',
       E'As they gnash on him, Stephen, *full of the Ruach HaKodesh (Holy Spirit),* looks up: *Behold, I see the heavens opened, and the Son of Adam standing on the right hand of Elohim (God)* (Acts 7:56). This is the figure Daniel saw — *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13) — the kaph honoring the incarnation of the Formed cloud-rider, now beheld glorified at the right hand. It is the very testimony for which Yahusha (Jesus) had been condemned before this same council: *Hereafter shall the Son of Adam sit on the right hand of the power of Elohim (God)* (Luke 22:69). What the Master said, the witness now sees — and they stop their ears at the same word, and stone him. And Stephen dies as his Master died, praying for the ones who kill him: *Yahuah (Lord), lay not this sin to their charge* (Acts 7:60) is *Father, forgive them; for they know not what they do* (Luke 23:34). The Son of Adam stands to receive his witness home.',
       sv.verse_id, ev.verse_id, 'free', 5270
  FROM _s217_a0607_lookup sv, _s217_a0607_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=55
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=7 AND ev.verse_number=60
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-6-the-seven-chosen-and-the-spirit-of-the-seventy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 11:16 — *Gather unto me seventy men of the elders of Yashar''el (Israel) … that they may stand there with thee* Moses gathers Spirit-bearers to share the burden, as the twelve gather the seven (Acts 6:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-6-the-seven-chosen-and-the-spirit-of-the-seventy'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 11:17 — *I will take of the spirit which is upon thee, and will put it upon them; and they shall bear the burden … with thee* the Spirit distributes the load so the word is not left (Acts 6:2-4).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-6-the-seven-chosen-and-the-spirit-of-the-seventy'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-6-tried-like-his-master-the-wisdom-none-could-resist
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 21:15 — *I will give you a mouth and wisdom, which all your adversaries shall not be able to gainsay nor resist* the Master''s promise kept in Stephen (Acts 6:10).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-6-tried-like-his-master-the-wisdom-none-could-resist'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=21 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 26:61 — *I am able to destroy the temple of Elohim (God)* the false-witness temple-charge laid on the Master, now laid on Stephen (Acts 6:13-14).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-6-tried-like-his-master-the-wisdom-none-could-resist'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=61
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 34:29 — *the skin of his face shone while he talked with him* they accuse him of blaspheming Moses while his face shines like Moses'' (Acts 6:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-6-tried-like-his-master-the-wisdom-none-could-resist'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-7-the-god-of-glory-and-the-promise-to-abrahams-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:1 — *Get thee out of thy country … unto a land that I will shew thee* the call that began the seed-line, where Stephen begins (Acts 7:2-3).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-god-of-glory-and-the-promise-to-abrahams-seed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:13 — *thy seed shall be a stranger in a land that is not theirs … four hundred years* the bondage foretold to the seed before there was a child (Acts 7:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-god-of-glory-and-the-promise-to-abrahams-seed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:14 — *that nation … will I judge: and afterward shall they come out with great substance* the judgment on Egypt and the coming-out sworn to Abraham (Acts 7:7).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-god-of-glory-and-the-promise-to-abrahams-seed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 2:52 — *Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* the library''s own deathbed recital of the fathers begins, like Stephen, with Abraham (Acts 7:2).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-god-of-glory-and-the-promise-to-abrahams-seed'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-7-the-rejected-deliverer-joseph-sold-and-moses-refused-then-sent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 37:28 — *sold Joseph to the Ishmeelites for twenty pieces of silver* the deliverer rejected by his brethren, sold for silver (Acts 7:9).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-rejected-deliverer-joseph-sold-and-moses-refused-then-sent'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 45:5 — *Elohim (God) did send me before you to preserve life* the rejected brother becomes the saver of those who sold him (Acts 7:9).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-rejected-deliverer-joseph-sold-and-moses-refused-then-sent'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=45 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 2:14 — *Who made thee a prince and a judge over us?* Moses refused, as the fathers refused every deliverer, then was sent (Acts 7:27,35).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-rejected-deliverer-joseph-sold-and-moses-refused-then-sent'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 2:53 — *Joseph in the time of his distress kept the commandment and was made lord of Egypt* the library remembers the rejected deliverer lifted to save (Acts 7:9-10).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-rejected-deliverer-joseph-sold-and-moses-refused-then-sent'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=53
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-7-the-calf-and-the-host-of-heaven-the-charge-of-amos
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 32:1 — *Make us gods, which shall go before us; for as for this Moses … we wot not what is become of him* the calf made while Moses received the oracles (Acts 7:40-41).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-calf-and-the-host-of-heaven-the-charge-of-amos'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Amos 5:25 — *Have ye offered unto me sacrifices and offerings in the wilderness forty years, O house of Yashar''el (Israel)?* the prophet Stephen reads over the forty years (Acts 7:42).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-calf-and-the-host-of-heaven-the-charge-of-amos'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Amos 5:26 — *ye have borne the tabernacle of your Moloch and Chiun your images, the star of your god* the host-of-heaven worship Stephen names as Moloch and Remphan (Acts 7:43).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-calf-and-the-host-of-heaven-the-charge-of-amos'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Amos 5:27 — *I cause you to go into captivity beyond Damascus* the exile-sentence on the idolatry; Stephen intensifies it to *beyond Babylon* (Acts 7:43).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-calf-and-the-host-of-heaven-the-charge-of-amos'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-7-the-most-high-dwelleth-not-in-temples-made-with-hands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 66:1 — *The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me?* the prophet Stephen quotes against trust in the building (Acts 7:49).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-most-high-dwelleth-not-in-temples-made-with-hands'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 66:2 — *all those things hath mine hand made … but to this man will I look … that trembleth at my word* the Maker looks to the contrite heart, not the house of stone (Acts 7:50).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-most-high-dwelleth-not-in-temples-made-with-hands'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 8:27 — *the heaven and heaven of heavens cannot contain thee; how much less this house* Solomon confessed it the day he dedicated the temple (Acts 7:48).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-most-high-dwelleth-not-in-temples-made-with-hands'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-7-stiffnecked-and-uncircumcised-in-heart-the-prophets-charge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 33:5 — *Ye are a stiffnecked people* Moses'' own word for the same covenant people; Stephen levels no new charge (Acts 7:51).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-stiffnecked-and-uncircumcised-in-heart-the-prophets-charge'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=33 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 10:16 — *Circumcise therefore the foreskin of your heart, and be no more stiffnecked* Moses'' diagnosis and remedy; the charge is the heart that resists (Acts 7:51).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-stiffnecked-and-uncircumcised-in-heart-the-prophets-charge'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 63:10 — *they rebelled, and vexed his holy Spirit* the wilderness resisting Stephen names as still operating (Acts 7:51).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-stiffnecked-and-uncircumcised-in-heart-the-prophets-charge'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 1:12 — *I will send witnesses to them … but they will not hear, and will slay the witnesses also, and they will persecute those who seek the law* the library foretold the persecuting of the prophets Stephen names (Acts 7:52).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-stiffnecked-and-uncircumcised-in-heart-the-prophets-charge'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=52
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-7-the-son-of-adam-standing-at-the-right-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:13 — *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* the kaph-honored figure Stephen now beholds glorified at the right hand (Acts 7:56).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-son-of-adam-standing-at-the-right-hand'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=56
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 22:69 — *Hereafter shall the Son of Adam sit on the right hand of the power of Elohim (God)* the testimony for which the Master was condemned, now seen by his witness (Acts 7:56).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-son-of-adam-standing-at-the-right-hand'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=56
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=69
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 23:34 — *Father, forgive them; for they know not what they do* Stephen dies as his Master died, praying for the ones who stone him (Acts 7:60).'
  FROM cross_reference_threads t, cross_references x, _s217_a0607_lookup sv, _s217_a0607_lookup tv
 WHERE t.slug='acts-7-the-son-of-adam-standing-at-the-right-hand'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=7 AND sv.verse_number=60
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=23 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
