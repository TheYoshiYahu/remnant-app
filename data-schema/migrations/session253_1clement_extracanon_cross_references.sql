-- =====================================================================
-- Session 253 — 1 Clement FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session253_1clement_extracanon_cross_references.sql
-- =====================================================================

\echo 'session253 — 1 Clement cross-references starting...'
BEGIN;

-- ----- fragment: minion_1clement_01.sql (session253 1-clement 1) -----
-- Source anchor: lightfoot-apostolic-fathers/1-clement ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1clement1 (view _session253_1clement1_lookup). Sort band base 70000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1clement1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-clement-1-cain-jealousy-death
  ('lightfoot-apostolic-fathers', '1-clement', 1, 4, 'canon', 'genesis', 4, 8, 'free', E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* Clement quotes this Torah scene almost verbatim as the prototype of the jealousy now splitting Corinth (1 Clement 1:4).'),
  ('lightfoot-apostolic-fathers', '1-clement', 1, 4, 'canon', 'genesis', 4, 5, 'free', E'Genesis 4:5 — *But unto Cain and to his offering he had not respect. And Cain was very wroth, and his countenance fell.* The fallen countenance Clement cites is the seedbed of envy he warns the Corinthians against (1 Clement 1:4).'),
  ('lightfoot-apostolic-fathers', '1-clement', 1, 4, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* John, like Clement, makes Cain the type of the brother-hating spirit (1 Clement 1:4).'),
  -- thread: 1-clement-1-rahab-scarlet-thread
  ('lightfoot-apostolic-fathers', '1-clement', 1, 12, 'canon', 'joshua', 2, 21, 'free', E'Joshua 2:21 — *And she said, According unto your words, so be it. And she sent them away, and they departed: and she bound the scarlet line in the window.* Clement quotes Rahab''s scarlet token and reads it as the foreshown blood-redemption (1 Clement 1:12).'),
  ('lightfoot-apostolic-fathers', '1-clement', 1, 12, 'canon', 'joshua', 2, 18, 'free', E'Joshua 2:18 — *Behold, when we come into the land, thou shalt bind this line of scarlet thread in the window which thou didst let us down by: and thou shalt bring thy father, and thy mother, and thy brethren, and all thy father’s household, home unto thee.* The household saved under the scarlet line is the sign Clement calls prophecy of redemption (1 Clement 1:12).'),
  ('lightfoot-apostolic-fathers', '1-clement', 1, 12, 'canon', 'hebrews', 11, 31, 'free', E'Hebrews 11:31 — *By faith the harlot Rahab perished not with them that believed not, when she had received the spies with peace.* Hebrews and Clement both honour Rahab''s faith-and-hospitality as the cause of her deliverance (1 Clement 1:12).'),
  -- thread: 1-clement-1-mercy-measure-yahusha
  ('lightfoot-apostolic-fathers', '1-clement', 1, 12, 'canon', 'matthew', 7, 2, 'free', E'Matthew 7:2 — *For with what judgment ye judge, ye shall be judged: and with what measure ye mete, it shall be measured to you again.* Clement quotes this measure-for-measure word of the Master almost verbatim to summon the Corinthians to forbearance (1 Clement 1:12).'),
  ('lightfoot-apostolic-fathers', '1-clement', 1, 12, 'canon', 'matthew', 5, 7, 'free', E'Matthew 5:7 — *Blessed are the merciful: for they shall obtain mercy.* The beatitude is the very ''have mercy, that ye may receive mercy'' Clement cites as the Master''s command (1 Clement 1:12).'),
  -- thread: 1-clement-1-isaiah53-messiah-humility
  ('lightfoot-apostolic-fathers', '1-clement', 1, 16, 'canon', 'isaiah', 53, 5, 'free', E'Isaiah 53:5 — *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* Clement quotes this verse of Isaiah''s Suffering Servant verbatim as the pattern of the Messiah''s lowliness (1 Clement 1:16).'),
  ('lightfoot-apostolic-fathers', '1-clement', 1, 16, 'canon', 'isaiah', 53, 7, 'free', E'Isaiah 53:7 — *He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* Clement''s ''as a lamb before his shearer is dumb'' is this prophet''s line, applied to the Messiah''s silent suffering (1 Clement 1:16).'),
  ('lightfoot-apostolic-fathers', '1-clement', 1, 16, 'canon', 'philippians', 2, 8, 'free', E'Philippians 2:8 — *And being found in fashion as a man, he humbled himself, and became obedient unto death, even the death of the cross.* Paul''s self-emptying Messiah is the same lowliness Clement urges against the arrogant schismatics (1 Clement 1:16).'),
  ('lightfoot-apostolic-fathers', '1-clement', 1, 16, 'canon', 'matthew', 20, 28, 'free', E'Matthew 20:28 — *Even as the Son of Adam came not to be ministered unto, but to minister, and to give his life a ransom for many.* The Master''s own definition of his ransom-mission undergirds Clement''s portrait of him who came not in pomp but in service (1 Clement 1:16).'),
  -- thread: 1-clement-1-david-contrite-heart
  ('lightfoot-apostolic-fathers', '1-clement', 1, 18, 'canon', 'psalms', 51, 1, 'free', E'Psalms 51:1 — *Have mercy upon me, O Elohim (God), according to thy lovingkindness: according unto the multitude of thy tender mercies blot out my transgressions.* Clement quotes David''s penitential psalm to show that even the man after Elohim''s heart pleads for mercy in lowliness (1 Clement 1:18).'),
  ('lightfoot-apostolic-fathers', '1-clement', 1, 18, 'canon', 'psalms', 51, 3, 'free', E'Psalms 51:3 — *For I acknowledge my transgressions: and my sin is ever before me.* Clement''s ''I acknowledge mine iniquity, and my sin is ever before me'' is this very line, his pattern of humble confession (1 Clement 1:18).'),
  -- thread: 1-clement-1-creation-order-host
  ('lightfoot-apostolic-fathers', '1-clement', 1, 17, 'canon', 'psalms', 19, 1, 'free', E'Psalms 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* Clement''s ordered, obedient heavens echo this psalm of the firmament proclaiming its Maker (1 Clement 1:17).'),
  ('lightfoot-apostolic-fathers', '1-clement', 1, 17, 'canon', 'psalms', 19, 2, 'free', E'Psalms 19:2 — *Day unto day uttereth speech, and night unto night sheweth knowledge.* The day-and-night that ''accomplish the course assigned to them'' in Clement is this psalm''s ceaseless witness (1 Clement 1:17).'),
  ('lightfoot-apostolic-fathers', '1-clement', 1, 17, 'canon', 'job', 38, 7, 'free', E'Job 38:7 — *When the morning stars sang together, and all the sons of Elohim (God) shouted for joy?* The harmony of the dancing stars Clement describes is the founded-creation order of Job''s whirlwind speech (1 Clement 1:17).'),
  -- thread: 1-clement-1-resurrection-seed-firstfruit
  ('lightfoot-apostolic-fathers', '1-clement', 1, 24, 'canon', '1-corinthians', 15, 36, 'free', E'1 Corinthians 15:36 — *Thou fool, that which thou sowest is not quickened, except it die.* Paul''s seed-that-must-die is exactly Clement''s image of the buried grain decaying before it is raised (1 Clement 1:24).'),
  ('lightfoot-apostolic-fathers', '1-clement', 1, 24, 'canon', '1-corinthians', 15, 38, 'free', E'1 Corinthians 15:38 — *But Elohim (God) giveth it a body as it hath pleased him, and to every seed his own body.* The ''out of their decay... raiseth them up, and from being one they increase manifold'' in Clement is Paul''s seed-to-body resurrection (1 Clement 1:24).'),
  ('lightfoot-apostolic-fathers', '1-clement', 1, 24, 'canon', 'john', 12, 24, 'free', E'John 12:24 — *Verily, verily, I say unto you, Except a corn of wheat fall into the ground and die, it abideth alone: but if it die, it bringeth forth much fruit.* The Master''s own grain-parable is the seed-resurrection Clement draws from the sowing (1 Clement 1:24).'),
  -- thread: 1-clement-1-aaron-rod-priesthood
  ('lightfoot-apostolic-fathers', '1-clement', 1, 38, 'canon', 'numbers', 17, 8, 'free', E'Numbers 17:8 — *And it came to pass, that on the morrow Moses went into the tabernacle of witness; and, behold, the rod of Aaron for the house of Levi was budded, and brought forth buds, and bloomed blossoms, and yielded almonds.* Clement recounts this Torah sign of the budding rod to prove that Elohim, not man, appoints the priestly order (1 Clement 1:38).'),
  ('lightfoot-apostolic-fathers', '1-clement', 1, 38, 'canon', 'hebrews', 5, 4, 'free', E'Hebrews 5:4 — *And no man taketh this honour unto himself, but he that is called of Elohim (God), as was Aaron.* Hebrews and Clement share the rule that priestly honour is not self-seized but divinely called, the very lesson of Aaron''s rod (1 Clement 1:38).'),
  -- thread: 1-clement-1-love-covereth-sins
  ('lightfoot-apostolic-fathers', '1-clement', 1, 49, 'canon', '1-corinthians', 13, 4, 'free', E'1 Corinthians 13:4 — *Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up.* Clement''s ''love is long-suffering... nothing arrogant in love'' is Paul''s love-chapter, the cure he offers the envious Corinthians (1 Clement 1:49).'),
  ('lightfoot-apostolic-fathers', '1-clement', 1, 49, 'canon', '1-corinthians', 13, 7, 'free', E'1 Corinthians 13:7 — *Beareth all things, believeth all things, hopeth all things, endureth all things.* Clement''s ''love endureth all things'' quotes Paul nearly word for word (1 Clement 1:49).'),
  ('lightfoot-apostolic-fathers', '1-clement', 1, 49, 'canon', '1-peter', 4, 8, 'free', E'1 Peter 4:8 — *And above all things have fervent charity among yourselves: for charity shall cover the multitude of sins.* Peter''s ''charity shall cover the multitude of sins'' is precisely Clement''s ''love covereth a multitude of sins'' (1 Clement 1:49).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1clement1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1clement1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-clement-1-cain-jealousy-death',
       E'Jealousy slew a brother — it ain''t new',
       E'Clement traces the whole ruin of schism back to one root: *Ye see, brethren, jealousy and envy wrought a brother’s murder.* (1 Clement 1:4) He quotes the Torah account nearly whole — *And Cain said unto Abel his brother, Let us go over unto the plain. And it came to pass, while they were in the plain, that Cain rose up against Abel his brother and slew him.* (1 Clement 1:4) The earliest church-elder is simply re-reading Genesis: *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* (Genesis 4:8) John names the same lineage of envy: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* (1 John 3:12) The sedition at Corinth is Cain''s spirit warmed over.',
       sv.verse_id, ev.verse_id, 'extras', 70000
  FROM _session253_1clement1_lookup sv, _session253_1clement1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='1-clement' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-clement-1-rahab-scarlet-thread',
       E'The scarlet thread of Rahab — redemption by blood',
       E'Clement reads the harlot''s window as a gospel sign: *And moreover they gave her a sign, that she should hang out from her house a scarlet thread, thereby showing beforehand that through the blood of Yahuah (Lord) there shall be redemption unto all them that believe and hope on Elohim (God).* (1 Clement 1:12) The Torah records the token itself: *And she said, According unto your words, so be it. And she sent them away, and they departed: and she bound the scarlet line in the window.* (Joshua 2:21) The writer to the Hebrews counts her among the faithful: *By faith the harlot Rahab perished not with them that believed not, when she had received the spies with peace.* (Hebrews 11:31) Clement adds, *not only faith, but prophecy, is found in the woman* — the scarlet cord prefiguring the blood that redeems.',
       sv.verse_id, ev.verse_id, 'extras', 70003
  FROM _session253_1clement1_lookup sv, _session253_1clement1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=12
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='1-clement' AND ev.chapter_number=1 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-clement-1-mercy-measure-yahusha',
       E'As ye mete, so measured — the Master''s own words',
       E'Clement appeals to the dominical sayings as already-written authority: *most of all remembering the words of Yahuah (Lord) Yahusha (Jesus) which He spake, teaching forbearance and long-suffering: for thus He spake; Have mercy, that ye may receive mercy: forgive, that it may be forgiven to you... With what measure ye mete, it shall be measured withal to you.* (1 Clement 1:12) This is the Sermon on the Mount: *Blessed are the merciful: for they shall obtain mercy.* (Matthew 5:7) And the measure-for-measure law: *For with what judgment ye judge, ye shall be judged: and with what measure ye mete, it shall be measured to you again.* (Matthew 7:2) The elder at Rome holds the Messiah''s teaching as binding rule — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 70006
  FROM _session253_1clement1_lookup sv, _session253_1clement1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=12
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='1-clement' AND ev.chapter_number=1 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-clement-1-isaiah53-messiah-humility',
       E'He was wounded for our sins — Isaiah 53 of the Messiah',
       E'At the heart of the epistle Clement quotes Isaiah 53 in full of the Messiah, against all pride of the schismatics: *The sceptre of the majesty of Elohim (God), even our Yahuah (Lord) Yahusha HaMashiach (Jesus Christ), came not in the pomp of arrogance or of pride... but in lowliness of mind* — then, *And He was wounded for our sins and hath been afflicted for our iniquities. The chastisement of our peace is upon Him. With His bruises we were healed.* (1 Clement 1:16) He is reading the prophet straight: *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* (Isaiah 53:5) The Messiah truly came in the flesh and truly suffered: *As a sheep He was led to slaughter* (1 Clement 1:16) — *he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* (Isaiah 53:7) Paul sounds the same self-emptying: *he humbled himself, and became obedient unto death, even the death of the cross.* (Philippians 2:8) — and the Master Himself: *to give his life a ransom for many.* (Matthew 20:28)',
       sv.verse_id, ev.verse_id, 'extras', 70009
  FROM _session253_1clement1_lookup sv, _session253_1clement1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=16
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='1-clement' AND ev.chapter_number=1 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-clement-1-david-contrite-heart',
       E'A broken and contrite heart — David''s repentance',
       E'Clement holds up the anointed king as a pattern of humility: *of whom Elohim (God) said, I have found a man after My heart, David the son of Jesse... Yet he too saith unto Elohim (God); Have mercy upon me, O Elohim (God), according to Thy great mercy; and according to the multitude of Thy compassions, blot out mine iniquity.* (1 Clement 1:18) He is quoting the penitential Psalm whole: *Have mercy upon me, O Elohim (God), according to thy lovingkindness: according unto the multitude of thy tender mercies blot out my transgressions.* (Psalms 51:1) And he closes with its heart: *A sacrifice unto Elohim (God) is a contrite spirit; a contrite and humbled heart Elohim (God) will not despise.* (1 Clement 1:18) The greatest king bows lowest — a rebuke to the self-willed at Corinth.',
       sv.verse_id, ev.verse_id, 'extras', 70012
  FROM _session253_1clement1_lookup sv, _session253_1clement1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=18
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='1-clement' AND ev.chapter_number=1 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-clement-1-creation-order-host',
       E'Heaven and earth keep their order in peace',
       E'Against sedition Clement points to the harmony of creation: *The heavens are moved by His direction and obey Him in peace. Day and night accomplish the course assigned to them by Him, without hindrance one to another. The sun and the moon and the dancing stars according to His appointment circle in harmony within the bounds assigned to them, without any swerving aside.* (1 Clement 1:17) This is the Psalmist''s witness: *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork. Day unto day uttereth speech, and night unto night sheweth knowledge.* (Psalms 19:1-2) It is Job''s challenge of the founded earth: *When the morning stars sang together, and all the sons of Elohim (God) shouted for joy?* (Job 38:7) And the same ordered cosmos in which the heavenly host cries holy: *and they cried aloud, Holy, holy, holy is Yahuah (Lord) of Sabaoth; all creation is full of His glory.* (1 Clement 1:34) If the stars keep rank, how much more should brethren.',
       sv.verse_id, ev.verse_id, 'extras', 70015
  FROM _session253_1clement1_lookup sv, _session253_1clement1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=17
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='1-clement' AND ev.chapter_number=1 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-clement-1-resurrection-seed-firstfruit',
       E'The grain that dies and rises — the resurrection',
       E'Clement preaches the resurrection from the seasons and the seed: *the Master continually showeth unto us the resurrection that shall be hereafter; whereof He made Yahuah (Lord) Yahusha HaMashiach (Jesus Christ) the firstfruit, when He raised Him from the dead... The sower goeth forth and casteth into the earth each of the seeds; and these falling into the earth dry and bare decay: then out of their decay the mightiness of the Master’s providence raiseth them up.* (1 Clement 1:24) This is Paul''s grain-of-resurrection: *Thou fool, that which thou sowest is not quickened, except it die.* (1 Corinthians 15:36) — *But Elohim (God) giveth it a body as it hath pleased him, and to every seed his own body.* (1 Corinthians 15:38) And the Master''s own parable: *Except a corn of wheat fall into the ground and die, it abideth alone: but if it die, it bringeth forth much fruit.* (John 12:24) The hope is one — the firstfruit raised, then they that are His.',
       sv.verse_id, ev.verse_id, 'extras', 70018
  FROM _session253_1clement1_lookup sv, _session253_1clement1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=24
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='1-clement' AND ev.chapter_number=1 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-clement-1-aaron-rod-priesthood',
       E'Aaron''s budding rod — the appointed priestly order',
       E'Clement defends ordered ministry from the Torah''s own settling of the priesthood: *when jealousy arose concerning the priesthood... he commanded the twelve chiefs of the tribes to bring to him rods... And the rod of Aaron was found not only with buds, but also bearing fruit... that disorder might not arise in Yashar''el (Israel).* (1 Clement 1:38) This is Numbers: *And it came to pass, that on the morrow Moses went into the tabernacle of witness; and, behold, the rod of Aaron for the house of Levi was budded, and brought forth buds, and bloomed blossoms, and yielded almonds.* (Numbers 17:8) And the principle that no man seizes the office unsent: *And no man taketh this honour unto himself, but he that is called of Elohim (God), as was Aaron.* (Hebrews 5:4) Clement upholds the ordained order against the schismatics who thrust out their presbyters — the appointed seasons and ministrations stand.',
       sv.verse_id, ev.verse_id, 'extras', 70021
  FROM _session253_1clement1_lookup sv, _session253_1clement1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=38
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='1-clement' AND ev.chapter_number=1 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-clement-1-love-covereth-sins',
       E'Love covereth a multitude of sins',
       E'Clement crowns his appeal with a hymn to love: *Love joineth us unto Elohim (God); love covereth a multitude of sins; love endureth all things, is long-suffering in all things. There is nothing coarse, nothing arrogant in love. Love hath no divisions, love maketh no seditions, love doeth all things in concord.* (1 Clement 1:49) This is Paul''s anthem: *Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up.* (1 Corinthians 13:4) — *Beareth all things, believeth all things, hopeth all things, endureth all things.* (1 Corinthians 13:7) And Peter''s word: *And above all things have fervent charity among yourselves: for charity shall cover the multitude of sins.* (1 Peter 4:8) The remedy for schism is the love that makes no sedition.',
       sv.verse_id, ev.verse_id, 'extras', 70024
  FROM _session253_1clement1_lookup sv, _session253_1clement1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=49
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='1-clement' AND ev.chapter_number=1 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-clement-1-cain-jealousy-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* Clement quotes this Torah scene almost verbatim as the prototype of the jealousy now splitting Corinth (1 Clement 1:4).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-cain-jealousy-death'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:5 — *But unto Cain and to his offering he had not respect. And Cain was very wroth, and his countenance fell.* The fallen countenance Clement cites is the seedbed of envy he warns the Corinthians against (1 Clement 1:4).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-cain-jealousy-death'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* John, like Clement, makes Cain the type of the brother-hating spirit (1 Clement 1:4).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-cain-jealousy-death'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-clement-1-rahab-scarlet-thread
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 2:21 — *And she said, According unto your words, so be it. And she sent them away, and they departed: and she bound the scarlet line in the window.* Clement quotes Rahab''s scarlet token and reads it as the foreshown blood-redemption (1 Clement 1:12).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-rahab-scarlet-thread'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 2:18 — *Behold, when we come into the land, thou shalt bind this line of scarlet thread in the window which thou didst let us down by: and thou shalt bring thy father, and thy mother, and thy brethren, and all thy father’s household, home unto thee.* The household saved under the scarlet line is the sign Clement calls prophecy of redemption (1 Clement 1:12).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-rahab-scarlet-thread'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:31 — *By faith the harlot Rahab perished not with them that believed not, when she had received the spies with peace.* Hebrews and Clement both honour Rahab''s faith-and-hospitality as the cause of her deliverance (1 Clement 1:12).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-rahab-scarlet-thread'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-clement-1-mercy-measure-yahusha
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:2 — *For with what judgment ye judge, ye shall be judged: and with what measure ye mete, it shall be measured to you again.* Clement quotes this measure-for-measure word of the Master almost verbatim to summon the Corinthians to forbearance (1 Clement 1:12).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-mercy-measure-yahusha'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 5:7 — *Blessed are the merciful: for they shall obtain mercy.* The beatitude is the very ''have mercy, that ye may receive mercy'' Clement cites as the Master''s command (1 Clement 1:12).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-mercy-measure-yahusha'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-clement-1-isaiah53-messiah-humility
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:5 — *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* Clement quotes this verse of Isaiah''s Suffering Servant verbatim as the pattern of the Messiah''s lowliness (1 Clement 1:16).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-isaiah53-messiah-humility'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:7 — *He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* Clement''s ''as a lamb before his shearer is dumb'' is this prophet''s line, applied to the Messiah''s silent suffering (1 Clement 1:16).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-isaiah53-messiah-humility'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Philippians 2:8 — *And being found in fashion as a man, he humbled himself, and became obedient unto death, even the death of the cross.* Paul''s self-emptying Messiah is the same lowliness Clement urges against the arrogant schismatics (1 Clement 1:16).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-isaiah53-messiah-humility'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 20:28 — *Even as the Son of Adam came not to be ministered unto, but to minister, and to give his life a ransom for many.* The Master''s own definition of his ransom-mission undergirds Clement''s portrait of him who came not in pomp but in service (1 Clement 1:16).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-isaiah53-messiah-humility'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=20 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-clement-1-david-contrite-heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 51:1 — *Have mercy upon me, O Elohim (God), according to thy lovingkindness: according unto the multitude of thy tender mercies blot out my transgressions.* Clement quotes David''s penitential psalm to show that even the man after Elohim''s heart pleads for mercy in lowliness (1 Clement 1:18).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-david-contrite-heart'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 51:3 — *For I acknowledge my transgressions: and my sin is ever before me.* Clement''s ''I acknowledge mine iniquity, and my sin is ever before me'' is this very line, his pattern of humble confession (1 Clement 1:18).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-david-contrite-heart'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-clement-1-creation-order-host
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* Clement''s ordered, obedient heavens echo this psalm of the firmament proclaiming its Maker (1 Clement 1:17).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-creation-order-host'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 19:2 — *Day unto day uttereth speech, and night unto night sheweth knowledge.* The day-and-night that ''accomplish the course assigned to them'' in Clement is this psalm''s ceaseless witness (1 Clement 1:17).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-creation-order-host'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 38:7 — *When the morning stars sang together, and all the sons of Elohim (God) shouted for joy?* The harmony of the dancing stars Clement describes is the founded-creation order of Job''s whirlwind speech (1 Clement 1:17).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-creation-order-host'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-clement-1-resurrection-seed-firstfruit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 15:36 — *Thou fool, that which thou sowest is not quickened, except it die.* Paul''s seed-that-must-die is exactly Clement''s image of the buried grain decaying before it is raised (1 Clement 1:24).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-resurrection-seed-firstfruit'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:38 — *But Elohim (God) giveth it a body as it hath pleased him, and to every seed his own body.* The ''out of their decay... raiseth them up, and from being one they increase manifold'' in Clement is Paul''s seed-to-body resurrection (1 Clement 1:24).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-resurrection-seed-firstfruit'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 12:24 — *Verily, verily, I say unto you, Except a corn of wheat fall into the ground and die, it abideth alone: but if it die, it bringeth forth much fruit.* The Master''s own grain-parable is the seed-resurrection Clement draws from the sowing (1 Clement 1:24).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-resurrection-seed-firstfruit'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-clement-1-aaron-rod-priesthood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 17:8 — *And it came to pass, that on the morrow Moses went into the tabernacle of witness; and, behold, the rod of Aaron for the house of Levi was budded, and brought forth buds, and bloomed blossoms, and yielded almonds.* Clement recounts this Torah sign of the budding rod to prove that Elohim, not man, appoints the priestly order (1 Clement 1:38).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-aaron-rod-priesthood'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=17 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 5:4 — *And no man taketh this honour unto himself, but he that is called of Elohim (God), as was Aaron.* Hebrews and Clement share the rule that priestly honour is not self-seized but divinely called, the very lesson of Aaron''s rod (1 Clement 1:38).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-aaron-rod-priesthood'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-clement-1-love-covereth-sins
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 13:4 — *Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up.* Clement''s ''love is long-suffering... nothing arrogant in love'' is Paul''s love-chapter, the cure he offers the envious Corinthians (1 Clement 1:49).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-love-covereth-sins'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=13 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 13:7 — *Beareth all things, believeth all things, hopeth all things, endureth all things.* Clement''s ''love endureth all things'' quotes Paul nearly word for word (1 Clement 1:49).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-love-covereth-sins'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 4:8 — *And above all things have fervent charity among yourselves: for charity shall cover the multitude of sins.* Peter''s ''charity shall cover the multitude of sins'' is precisely Clement''s ''love covereth a multitude of sins'' (1 Clement 1:49).'
  FROM cross_reference_threads t, cross_references x, _session253_1clement1_lookup sv, _session253_1clement1_lookup tv
 WHERE t.slug='1-clement-1-love-covereth-sins'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='1-clement' AND sv.chapter_number=1 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session253 — 1 Clement cross-references complete.'
