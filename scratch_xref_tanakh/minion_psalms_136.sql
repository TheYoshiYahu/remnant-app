-- ----- fragment: minion_psalms_136.sql (Psalm 136) -----
-- Chapter: Psalm 136 — THE GREAT HALLEL (a KEYSTONE: "for his mercy endureth for ever")
-- Tag: ps136   Session prefix: s302   Sort band base: 25375 (25375, 25378, 25381, 25384, 25387, 25390)
-- Source rows ALWAYS 'canon','psalms',136,v.   Thread slug prefix SINGULAR: psalm-136-...
--
-- THREADS (slug — target libraries):
--   T1 psalm-136-give-thanks-for-his-mercy-endureth-for-ever-the-temple-antiphon   [Tanakh + NT]  (free)
--        vv.1-3,26 the chesed-forever refrain = the standing temple liturgy (1Chr16/2Chr5/2Chr7/Ezra3/Jer33/Ps100), Luke1:50 forward
--   T2 psalm-136-by-wisdom-he-made-the-heavens-and-the-great-lights                [Tanakh + NT]  (free)
--        vv.4-9 creation by Wisdom/the Formed Word; lights = appointed-times root (Gen1:14)
--   T3 psalm-136-he-smote-egypt-in-their-firstborn-and-brought-out-israel          [Tanakh + Extras] (extras)
--        vv.10-12 the Passover plague + the exodus (Exod12:29; Jubilees 49:2 the festival night)
--   T4 psalm-136-he-divided-the-red-sea-and-overthrew-pharaoh                      [Tanakh + NT + Extras] (extras)
--        vv.13-15 Red Sea split, Pharaoh overthrown; 1Cor10:1-2 baptism-figure; WisSol 10/19 witnesses
--   T5 psalm-136-he-led-his-people-through-the-wilderness-an-heritage-unto-israel  [Tanakh + NT]  (free)
--        vv.16-22 wilderness + Sihon/Og + the land-heritage of Israel his servant; Rom11:1 guard (not cast away)
--   T6 psalm-136-who-remembered-us-in-our-low-estate-and-giveth-food-to-all-flesh  [Tanakh + NT]  (free)
--        vv.23-25 covenant remembrance + providence to all flesh; Luke1:48 Magnificat forward
--
-- Psalm 136 coverage checklist:
--   v.1-3   NT: Luke1:50 (mercy generation to generation)   Extras: none warranted   Tanakh: 1Chr16:34, 2Chr5:13, 2Chr7:3, Ezra3:11, Jer33:11, Ps100:5  -> T1
--   v.4     NT: none warranted   Extras: none warranted   Tanakh: folded into T2 (great wonders = creation) -- no standalone add
--   v.5-9   NT: John1:3, Col1:16 (all things made by him)   Extras: none warranted   Tanakh: Gen1:1, Gen1:14, Gen1:16, Prov3:19, Prov8:27, Jer31:35  -> T2
--   v.10-12 NT: none warranted (1Cor10 weighed -> placed at Red Sea T4)   Extras: Jubilees 49:2 (Passover night, firstborn)   Tanakh: Exod12:29  -> T3
--   v.13-15 NT: 1Cor10:1-2 (baptism-figure)   Extras: WisSol 10:18, 19:7   Tanakh: Exod14:21,22,27,28  -> T4
--   v.16-22 NT: Rom11:1 (people not cast away)   Extras: none warranted (Sihon/Og clean in canon)   Tanakh: Num21:23, Num21:34, Deut29:7, Josh12:2, Josh12:4  -> T5
--   v.23-25 NT: Luke1:48 (low estate regarded), Matt6:26 (heavenly Father feeds)   Extras: none warranted   Tanakh: Gen8:1, Ps105:8, Ps145:15, Ps145:16  -> T6
--
-- Framework-load-bearing notes:
--   * The refrain is the temple's standing antiphon (Asaph's Levites), not a poetic flourish: it is QUOTED as live
--     liturgy at the ark's enthronement (1Chr16:34,41), at Solomon's dedication (2Chr5:13/7:3), and prophesied to
--     RETURN after the captivity (Jer33:11, Ezra3:11) -> the two-house restoration sung in chesed.
--   * Creation "by wisdom" (v.5) = the Formed Word/Wisdom as the agent of creation (Prov8; John1:3; Col1:16) -- the
--     Formed Son who has a Father, NOT a co-equal trinitarian person. The "great lights" (vv.7-9) are the appointed-
--     times root (Gen1:14, "for signs, and for seasons").
--   * vv.21-22 the land "an heritage unto Yashar'el his servant" -> Rom11:1 guard: Yahuah has NOT cast away the
--     covenant people; the heritage stands. No replacement.

CREATE TEMP VIEW _s302_ps136_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- T1 the temple antiphon -----------------------------------------------------------------
    ('canon','psalms',136,1,'canon','1-chronicles',16,34,'free',
      E'*O give thanks unto Yahuah (LORD); for he is good; for his mercy endureth for ever.* (1 Chronicles 16:34) — the psalm''s opening line *O give thanks unto Yahuah (LORD); for he is good: for his mercy endureth for ever* is word-for-word the antiphon David set in the mouths of the Levites the day the ark came up; the Great Hallel is singing the temple''s own standing liturgy.'),
    ('canon','psalms',136,1,'canon','2-chronicles',5,13,'free',
      E'*…praised Yahuah (LORD), saying, For he is good; for his mercy endureth for ever: that then the house was filled with a cloud, even the house of Yahuah (LORD)* (2 Chronicles 5:13) — when the singers lifted this very refrain at Solomon''s dedication the Glory filled the house. The line *for his mercy endureth for ever* is the note that draws the Presence down.'),
    ('canon','psalms',136,1,'canon','2-chronicles',7,3,'free',
      E'*…they bowed themselves… and worshipped, and praised Yahuah (LORD), saying, For he is good; for his mercy endureth for ever.* (2 Chronicles 7:3) — as the fire fell, all Yashar''el (Israel) answered with the psalm''s refrain. *For his mercy endureth for ever* is the congregation''s antiphonal response, exactly the shape of Psalm 136.'),
    ('canon','psalms',136,1,'canon','ezra',3,11,'free',
      E'*And they sang together by course… because he is good, for his mercy endureth for ever toward Yashar''el (Israel)…* (Ezra 3:11) — when the second temple''s foundation was laid the returned remnant sang this same refrain "by course" (antiphonally). The chesed-forever song outlives the exile; it is the restoration anthem of the gathered people.'),
    ('canon','psalms',136,1,'canon','jeremiah',33,11,'free',
      E'*…the voice of them that shall say, Praise Yahuah Tseva''ot (LORD of hosts): for Yahuah (LORD) is good; for his mercy endureth for ever… For I will cause to return the captivity of the land…* (Jeremiah 33:11) — Yahuah promises that this exact refrain will be heard again in the desolate cities of Yahudah (Judah) when he returns the captivity. The Great Hallel is prophesied to be re-sung at the two-house ingathering.'),
    ('canon','psalms',136,1,'canon','psalms',100,5,'free',
      E'*For Yahuah (LORD) is good; his mercy is everlasting; and his truth endureth to all generations.* (Psalm 100:5) — the thanksgiving-psalm seals the same confession: *he is good*, his *mercy* (chesed) *everlasting*. Psalm 136 simply unfolds that everlasting mercy verse by verse through creation and the exodus.'),
    ('canon','psalms',136,1,'canon','luke',1,50,'free',
      E'*And his mercy is on them that fear him from generation to generation.* (Luke 1:50) — Miryam''s song carries the Hallel''s refrain forward: the *mercy* that *endureth for ever* is the mercy *from generation to generation* on them that fear him. The everlasting chesed of the temple antiphon is the very mercy magnified at the Messiah''s coming.'),
    ('canon','psalms',136,26,'canon','1-chronicles',16,41,'free',
      E'*…to give thanks to Yahuah (LORD), because his mercy endureth for ever* (1 Chronicles 16:41) — Heman and Jeduthun were appointed to sound precisely this clause continually. The psalm''s closing *O give thanks unto the Elohim (God) of heaven: for his mercy endureth for ever* (v.26) is the temple''s perpetual ministry put to song.'),

    -- T2 creation by Wisdom / the great lights ----------------------------------------------
    ('canon','psalms',136,5,'canon','genesis',1,1,'free',
      E'*In the beginning Elohim (God) created the heaven and the earth.* (Genesis 1:1) — the psalm''s *To him that by wisdom made the heavens* sings Genesis 1 back as praise; the heavens and the earth of the first verse are made and spread out (vv.5-6) by the same hand.'),
    ('canon','psalms',136,5,'canon','proverbs',3,19,'free',
      E'*Yahuah (LORD) by wisdom hath founded the earth; by understanding hath he established the heavens.* (Proverbs 3:19) — the phrase *by wisdom made the heavens* is verbatim wisdom-of-creation language: the heavens are *established* by the same wisdom Proverbs names, the Formed Word at the founding of the world.'),
    ('canon','psalms',136,5,'canon','proverbs',8,27,'free',
      E'*When he prepared the heavens, I was there: when he set a compass upon the face of the depth* (Proverbs 8:27) — Wisdom speaks as the One present when the heavens were prepared. The Hallel''s *by wisdom made the heavens* confesses that Formed agent of creation, the Son drawn from the Formless Father, *there* at the founding.'),
    ('canon','psalms',136,5,'canon','john',1,3,'free',
      E'*All things were made by him; and without him was not any thing made that was made.* (John 1:3) — the Word who *by wisdom made the heavens* is the One John names: every made thing was made *by him*. The Formed Word of Psalm 136:5 took flesh; he is the agent, not a second God beside the Father.'),
    ('canon','psalms',136,5,'canon','colossians',1,16,'free',
      E'*For by him were all things created, that are in heaven, and that are in earth, visible and invisible… all things were created by him, and for him* (Colossians 1:16) — the heavens *made by wisdom* are the *all things created by him*. Psalm 136 hymns the Formed Son as the One through whom Yahuah wrought the world.'),
    ('canon','psalms',136,7,'canon','genesis',1,14,'free',
      E'*And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14) — *To him that made great lights* sings the fourth day. The lights are not décor: they are set *for signs, and for seasons* (moedim) — the appointed-times calendar is woven into creation itself.'),
    ('canon','psalms',136,8,'canon','genesis',1,16,'free',
      E'*And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* (Genesis 1:16) — vv.8-9, *the sun to rule by day… the moon and stars to rule by night*, are Genesis 1:16 turned to praise: the greater and lesser lights given dominion to mark Yahuah''s seasons.'),
    ('canon','psalms',136,9,'canon','jeremiah',31,35,'free',
      E'*Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night… Yahuah Tseva''ot (LORD of hosts) is his name* (Jeremiah 31:35) — the same Maker of *the moon and stars to rule by night* binds the fixed *ordinances* of those lights to his unbreakable covenant with Yashar''el (Israel). The creation-order and the covenant-order are one.'),

    -- T3 the firstborn plague + the exodus --------------------------------------------------
    ('canon','psalms',136,10,'canon','exodus',12,29,'free',
      E'*And it came to pass, that at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt, from the firstborn of Pharaoh that sat on his throne unto the firstborn of the captive that was in the dungeon; and all the firstborn of cattle.* (Exodus 12:29) — *To him that smote Egypt in their firstborn* recites the Passover blow exactly: the firstborn from throne to dungeon, the night the covenant people were spared and Egypt struck.'),
    ('canon','psalms',136,10,'jubilees','jubilees',49,2,'extras',
      E'*For on this night–the beginning of the festival and the beginning of the joy–you were eating the passover in Egypt, when all the powers of Mastêmâ had been let loose to slay all the first-born in the land of Egypt, from the firstborn of Pharaoh to the first-born of the captive maidservant in the mill, and to the cattle.* (Jubilees 49:2) — the restored witness names the same firstborn-stroke, throne to mill to cattle, as the festival night of joy. The Hallel''s v.10 is the temple''s memory of the Passover Jubilees preserves.'),
    ('canon','psalms',136,11,'canon','exodus',12,29,'free',
      E'*…at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt… and all the firstborn of cattle.* (Exodus 12:29) — *And brought out Yashar''el (Israel) from among them* (v.11) is the other side of that same midnight: the blow on Egypt''s firstborn is what brought the covenant son out (Exodus 4:22, *Yashar''el is my son, even my firstborn*).'),

    -- T4 the Red Sea ------------------------------------------------------------------------
    ('canon','psalms',136,13,'canon','exodus',14,21,'free',
      E'*And Moses stretched out his hand over the sea; and Yahuah (LORD) caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided.* (Exodus 14:21) — *To him which divided the Red sea into parts* sings this exact dividing: the strong wind, the waters parted, the dry path opened by the hand of Yahuah.'),
    ('canon','psalms',136,14,'canon','exodus',14,22,'free',
      E'*And the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left.* (Exodus 14:22) — *And made Yashar''el (Israel) to pass through the midst of it* is Exodus 14:22 verbatim in praise: the people walked *through the midst*, walled by water on either hand.'),
    ('canon','psalms',136,15,'canon','exodus',14,27,'free',
      E'*And Moses stretched forth his hand over the sea, and the sea returned to his strength when the morning appeared… and Yahuah (LORD) overthrew the Egyptians in the midst of the sea.* (Exodus 14:27) — *But overthrew Pharaoh and his host in the Red sea* is the sea''s return: what was a wall for Yashar''el became the grave of Pharaoh''s host.'),
    ('canon','psalms',136,15,'canon','exodus',14,28,'free',
      E'*And the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them.* (Exodus 14:28) — the totality of the overthrow — *there remained not so much as one of them* — is the mercy sung in v.15: the same sea that delivered the people drowned the oppressor.'),
    ('canon','psalms',136,14,'canon','1-corinthians',10,1,'free',
      E'*Moreover, brethren, I would not that ye should be ignorant, how that all our fathers were under the cloud, and all passed through the sea* (1 Corinthians 10:1) — *all our fathers… passed through the sea* reads the Red Sea crossing of v.14 forward as the figure of baptism. The midst of the sea is where Yashar''el is brought through unto Yahuah.'),
    ('canon','psalms',136,14,'canon','1-corinthians',10,2,'free',
      E'*And were all baptized unto Moses in the cloud and in the sea* (1 Corinthians 10:2) — the passage *through the midst of it* (v.14) is named a baptism *unto Moses*: the deliverance through water that prefigures the deliverance of the gathered people in the Messiah.'),
    ('canon','psalms',136,13,'apocrypha','the-wisdom-of-solomon',10,18,'extras',
      E'*Brought them through the Red sea, and led them through much water* (Wisdom of Solomon 10:18) — the restored witness rehearses the same wonder Wisdom (the Formed agent of v.5) wrought: she *brought them through the Red sea*, dividing the deep that v.13 hymns.'),
    ('canon','psalms',136,14,'apocrypha','the-wisdom-of-solomon',19,7,'extras',
      E'*As namely, a cloud shadowing the camp; and where water stood before, dry land appeared; and out of the Red sea a way without impediment; and out of the violent stream a green field* (Wisdom of Solomon 19:7) — *out of the Red sea a way without impediment* is the dry path of v.14 seen by the same library: where the waters stood, the people of Yahuah passed.'),

    -- T5 wilderness, Sihon & Og, the heritage of Israel -------------------------------------
    ('canon','psalms',136,17,'canon','numbers',21,23,'free',
      E'*And Sihon would not suffer Yashar''el (Israel) to pass through his border… and fought against Yashar''el (Israel).* (Numbers 21:23) — *To him which smote great kings* (v.17) begins with Sihon: the king who barred the way and was given into Yashar''el''s hand. The wilderness victories are Yahuah''s mercy, not Israel''s might.'),
    ('canon','psalms',136,19,'canon','numbers',21,34,'free',
      E'*And Yahuah (LORD) said unto Moses, Fear him not: for I have delivered him into thy hand, and all his people, and his land; and thou shalt do to him as thou didst unto Sihon king of the Amorites…* (Numbers 21:34) — *Sihon king of the Amorites* (v.19) and *Og the king of Bashan* (v.20) are named together because Yahuah delivered Og just as he delivered Sihon; both kings fell by the same delivering hand.'),
    ('canon','psalms',136,19,'canon','deuteronomy',29,7,'free',
      E'*And when ye came unto this place, Sihon the king of Heshbon, and Og the king of Bashan, came out against us unto battle, and we smote them* (Deuteronomy 29:7) — Moses pairs *Sihon… and Og* in the covenant-renewal recital exactly as the Hallel pairs them (vv.19-20): the two kings whose defeat opened the heritage east of Jordan.'),
    ('canon','psalms',136,20,'canon','joshua',12,4,'free',
      E'*And the coast of Og king of Bashan, which was of the remnant of the giants, that dwelt at Ashtaroth and at Edrei* (Joshua 12:4) — *Og the king of Bashan* (v.20) is the giant-king of the conquest list; his fall is part of the land-grant the psalm calls *an heritage unto Yashar''el (Israel)*.'),
    ('canon','psalms',136,21,'canon','joshua',12,2,'free',
      E'*Sihon king of the Amorites, who dwelt in Heshbon, and ruled from Aroer… even unto the river Jabbok…* (Joshua 12:2) — *And gave their land for an heritage* (v.21) is the conquest record of Joshua 12: the territory of the smitten kings handed over as the inheritance of the tribes.'),
    ('canon','psalms',136,22,'canon','romans',11,1,'free',
      E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham…* (Romans 11:1) — *an heritage unto Yashar''el (Israel) his servant* (v.22) is the standing covenant grant. Sha''ul (Paul) holds it fast: the heritage-people have NOT been cast away — the inheritance and the servant-people remain Yahuah''s, never replaced.'),

    -- T6 covenant remembrance + providence -------------------------------------------------
    ('canon','psalms',136,23,'canon','genesis',8,1,'free',
      E'*And Elohim (God) remembered Noah, and every living thing… and Elohim (God) made a wind to pass over the earth, and the waters asswaged* (Genesis 8:1) — *Who remembered us in our low estate* (v.23) sings the covenant-remembrance that runs from the ark onward: when Yahuah "remembers," he acts to deliver. His remembering is rescue.'),
    ('canon','psalms',136,23,'canon','psalms',105,8,'free',
      E'*He hath remembered his covenant for ever, the word which he commanded to a thousand generations.* (Psalm 105:8) — the *remembered us in our low estate* of v.23 is the chesed-forever refrain in narrative: Yahuah *remembered his covenant for ever*; the mercy that *endureth for ever* is covenant-memory that never lapses.'),
    ('canon','psalms',136,23,'canon','luke',1,48,'free',
      E'*For he hath regarded the low estate of his handmaiden: for, behold, from henceforth all generations shall call me blessed.* (Luke 1:48) — *Who remembered us in our low estate* is carried forward in the Magnificat: he *hath regarded the low estate*. The same mercy that remembered Yashar''el in bondage regards the lowly at the Messiah''s coming.'),
    ('canon','psalms',136,25,'canon','psalms',145,15,'free',
      E'*The eyes of all wait upon thee; and thou givest them their meat in due season.* (Psalm 145:15) — *Who giveth food to all flesh* (v.25) is the open-handed providence of Psalm 145: every creature waits, and Yahuah feeds them *in due season*. The God of the exodus is also the daily Sustainer of all flesh.'),
    ('canon','psalms',136,25,'canon','psalms',145,16,'free',
      E'*Thou openest thine hand, and satisfiest the desire of every living thing.* (Psalm 145:16) — *giveth food to all flesh* is the opened hand of Psalm 145:16: Yahuah satisfies *every living thing*. His mercy reaches past the covenant people to sustain the whole creation he made by wisdom (v.5).'),
    ('canon','psalms',136,25,'canon','matthew',6,26,'free',
      E'*Behold the fowls of the air: for they sow not, neither do they reap, nor gather into barns; yet your heavenly Father feedeth them. Are ye not much better than they?* (Matthew 6:26) — the Messiah reads *Who giveth food to all flesh* forward to the *heavenly Father* who *feedeth* the birds. The Hallel''s providence becomes the ground of trust: the Father who feeds all flesh will surely feed his own.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps136_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps136_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-136-give-thanks-for-his-mercy-endureth-for-ever-the-temple-antiphon',
       E'O give thanks; for his mercy endureth for ever — the temple antiphon',
       E'The Great Hallel opens and closes on the same words: *O give thanks unto Yahuah (LORD); for he is good: for his mercy endureth for ever* (Psalm 136:1) … *O give thanks unto the Elohim (God) of heaven: for his mercy endureth for ever* (Psalm 136:26). Twenty-six times the refrain *for his mercy endureth for ever* answers each line — this is not poetic repetition but the temple''s standing antiphon, sung "by course," priest and congregation. It is the line David put in the Levites'' mouths when the ark came up: *O give thanks unto Yahuah (LORD); for he is good; for his mercy endureth for ever* (1 Chronicles 16:34), the clause Heman and Jeduthun were appointed to sound continually (1 Chronicles 16:41). It is the note that drew the Glory down at Solomon''s dedication — *…praised Yahuah (LORD), saying, For he is good; for his mercy endureth for ever: that then the house was filled with a cloud* (2 Chronicles 5:13) — and the cry of all Yashar''el (Israel) when the fire fell: *they bowed themselves… and praised Yahuah (LORD), saying, For he is good; for his mercy endureth for ever* (2 Chronicles 7:3). When the second temple''s foundation was laid the returned remnant sang it again: *they sang together by course… because he is good, for his mercy endureth for ever toward Yashar''el (Israel)* (Ezra 3:11). And Yeremyah (Jeremiah) prophesies it will be heard once more when Yahuah returns the captivity: *the voice of them that shall say… for Yahuah (LORD) is good; for his mercy endureth for ever… For I will cause to return the captivity of the land* (Jeremiah 33:11) — the two-house ingathering sung in the same chesed. *For Yahuah (LORD) is good; his mercy is everlasting* (Psalm 100:5) is the whole confession; Psalm 136 simply unfolds that everlasting mercy through creation and the exodus. Miryam carries it forward: *his mercy is on them that fear him from generation to generation* (Luke 1:50). The mercy (chesed) that *endureth for ever* is the covenant-loyalty of Yahuah that outlives exile and never lapses.',
       sv.verse_id, ev.verse_id, 'free', 25375
  FROM _s302_ps136_lookup sv, _s302_ps136_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=136 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=136 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-136-by-wisdom-he-made-the-heavens-and-the-great-lights',
       E'By wisdom he made the heavens and the great lights',
       E'The Hallel''s first wonder is creation, and it names the means: *To him that by wisdom made the heavens… To him that stretched out the earth above the waters* (Psalm 136:5-6). *Yahuah (LORD) by wisdom hath founded the earth; by understanding hath he established the heavens* (Proverbs 3:19) is the same confession, and Proverbs 8 lets that Wisdom speak: *When he prepared the heavens, I was there: when he set a compass upon the face of the depth* (Proverbs 8:27). This is the Formed Word — the Son drawn from the Formless Father — present and active at the founding of the world, not a second God beside him: *All things were made by him; and without him was not any thing made that was made* (John 1:3); *by him were all things created, that are in heaven, and that are in earth, visible and invisible… all things were created by him, and for him* (Colossians 1:16). The psalm then sings the fourth day: *To him that made great lights… The sun to rule by day… The moon and stars to rule by night* (Psalm 136:7-9), which is Genesis turned to praise — *Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also* (Genesis 1:16). And those lights are not décor: *let them be for signs, and for seasons, and for days, and years* (Genesis 1:14) — the appointed-times (moedim) calendar woven into creation itself. Yeremyah (Jeremiah) binds the fixed order of those lights to the covenant: *which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night… Yahuah Tseva''ot (LORD of hosts) is his name* (Jeremiah 31:35). The Maker of the seasons and the Keeper of the covenant are one.',
       sv.verse_id, ev.verse_id, 'free', 25378
  FROM _s302_ps136_lookup sv, _s302_ps136_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=136 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=136 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-136-he-smote-egypt-in-their-firstborn-and-brought-out-israel',
       E'He smote Egypt in their firstborn and brought out Israel',
       E'The recital turns from creation to redemption: *To him that smote Egypt in their firstborn… And brought out Yashar''el (Israel) from among them… With a strong hand, and with a stretched out arm* (Psalm 136:10-12). The Passover blow is recited exactly: *at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt, from the firstborn of Pharaoh that sat on his throne unto the firstborn of the captive that was in the dungeon; and all the firstborn of cattle* (Exodus 12:29). The restored witness preserves the same night, throne to mill to cattle, and calls it the *beginning of the festival and the beginning of the joy*: *you were eating the passover in Egypt, when all the powers of Mastêmâ had been let loose to slay all the first-born in the land of Egypt, from the firstborn of Pharaoh to the first-born of the captive maidservant in the mill, and to the cattle* (Jubilees 49:2). The smiting of Egypt''s firstborn is the deliverance of the covenant firstborn — *Yashar''el is my son, even my firstborn* (Exodus 4:22) — *brought out… from among them* by the strong hand and outstretched arm. Even judgment is mercy here: *for his mercy endureth for ever* answers the plague, because the same stroke that fell on Egypt set the covenant son free.',
       sv.verse_id, ev.verse_id, 'extras', 25381
  FROM _s302_ps136_lookup sv, _s302_ps136_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=136 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=136 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-136-he-divided-the-red-sea-and-overthrew-pharaoh',
       E'He divided the Red sea and overthrew Pharaoh',
       E'The exodus reaches its crisis at the sea: *To him which divided the Red sea into parts… And made Yashar''el (Israel) to pass through the midst of it… But overthrew Pharaoh and his host in the Red sea* (Psalm 136:13-15). The psalm narrates Exodus 14 line by line. The dividing: *Moses stretched out his hand over the sea; and Yahuah (LORD) caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided* (Exodus 14:21). The passage through: *the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left* (Exodus 14:22). The overthrow: *the sea returned to his strength… and Yahuah (LORD) overthrew the Egyptians in the midst of the sea* (Exodus 14:27), *there remained not so much as one of them* (Exodus 14:28). The restored witnesses sing the same wonder — *Brought them through the Red sea, and led them through much water* (Wisdom of Solomon 10:18); *out of the Red sea a way without impediment* (Wisdom of Solomon 19:7) — the very dry path the psalm hymns. And Sha''ul (Paul) reads the crossing forward as the figure of baptism: *all our fathers were under the cloud, and all passed through the sea; and were all baptized unto Moses in the cloud and in the sea* (1 Corinthians 10:1-2). The same sea is a wall of deliverance for Yashar''el and a grave for the oppressor — mercy and judgment in one act, *for his mercy endureth for ever*.',
       sv.verse_id, ev.verse_id, 'extras', 25384
  FROM _s302_ps136_lookup sv, _s302_ps136_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=136 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=136 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-136-he-led-his-people-through-the-wilderness-an-heritage-unto-israel',
       E'He led his people through the wilderness — an heritage unto Israel his servant',
       E'From the sea the recital follows the people through the desert to the land: *To him which led his people through the wilderness… To him which smote great kings… And slew famous kings: Sihon king of the Amorites… And Og the king of Bashan… And gave their land for an heritage, even an heritage unto Yashar''el (Israel) his servant* (Psalm 136:16-22). The great kings are named from the conquest record. Sihon barred the way: *Sihon would not suffer Yashar''el (Israel) to pass through his border… and fought against Yashar''el (Israel)* (Numbers 21:23), and was given into their hand; then Og fell by the same word — *Fear him not: for I have delivered him into thy hand… as thou didst unto Sihon king of the Amorites* (Numbers 21:34). Moses pairs them in the covenant-renewal recital exactly as the psalm does: *Sihon the king of Heshbon, and Og the king of Bashan, came out against us unto battle, and we smote them* (Deuteronomy 29:7). The conquest list seals the grant — *Sihon king of the Amorites, who dwelt in Heshbon* (Joshua 12:2), *Og king of Bashan, which was of the remnant of the giants* (Joshua 12:4) — their territory *given for an heritage*. And the heritage is the covenant inheritance of *Yashar''el his servant*, which stands forever: *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1). The land-grant of the Hallel is not revoked; the servant-people are not replaced. The mercy that gave the heritage *endureth for ever*.',
       sv.verse_id, ev.verse_id, 'free', 25387
  FROM _s302_ps136_lookup sv, _s302_ps136_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=136 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=136 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-136-who-remembered-us-in-our-low-estate-and-giveth-food-to-all-flesh',
       E'Who remembered us in our low estate and giveth food to all flesh',
       E'The recital ends not in the distant past but in the present mercy that reaches the singer: *Who remembered us in our low estate… And hath redeemed us from our enemies… Who giveth food to all flesh* (Psalm 136:23-25). When Yahuah "remembers," he acts to deliver — as from the flood: *Elohim (God) remembered Noah, and every living thing… and the waters asswaged* (Genesis 8:1). His remembering is covenant-memory that never lapses: *He hath remembered his covenant for ever, the word which he commanded to a thousand generations* (Psalm 105:8) — the chesed-forever refrain told as history. Miryam carries *remembered us in our low estate* forward in her song: *he hath regarded the low estate of his handmaiden* (Luke 1:48); the same mercy that remembered Yashar''el (Israel) in bondage regards the lowly at the Messiah''s coming. And the God of the exodus is also the daily Sustainer of all he made by wisdom: *Who giveth food to all flesh* (v.25) is the open hand of *The eyes of all wait upon thee; and thou givest them their meat in due season* (Psalm 145:15), *Thou openest thine hand, and satisfiest the desire of every living thing* (Psalm 145:16). The Messiah makes it the ground of trust: *Behold the fowls of the air… yet your heavenly Father feedeth them. Are ye not much better than they?* (Matthew 6:26). The Father who feeds all flesh will surely feed his own — *for his mercy endureth for ever*.',
       sv.verse_id, ev.verse_id, 'free', 25390
  FROM _s302_ps136_lookup sv, _s302_ps136_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=136 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=136 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    -- T1
    ('psalm-136-give-thanks-for-his-mercy-endureth-for-ever-the-temple-antiphon','canon','psalms',136,1,'canon','1-chronicles',16,34,1,
      E'*O give thanks unto Yahuah (LORD); for he is good; for his mercy endureth for ever.* (1 Chronicles 16:34) — David''s ark-antiphon, word-for-word the psalm''s opening line.'),
    ('psalm-136-give-thanks-for-his-mercy-endureth-for-ever-the-temple-antiphon','canon','psalms',136,1,'canon','2-chronicles',5,13,2,
      E'*…For he is good; for his mercy endureth for ever: that then the house was filled with a cloud* (2 Chronicles 5:13) — the refrain that drew the Glory down at the dedication.'),
    ('psalm-136-give-thanks-for-his-mercy-endureth-for-ever-the-temple-antiphon','canon','psalms',136,1,'canon','2-chronicles',7,3,3,
      E'*…praised Yahuah (LORD), saying, For he is good; for his mercy endureth for ever.* (2 Chronicles 7:3) — all Yashar''el (Israel) answering antiphonally as the fire fell.'),
    ('psalm-136-give-thanks-for-his-mercy-endureth-for-ever-the-temple-antiphon','canon','psalms',136,1,'canon','ezra',3,11,4,
      E'*…sang together by course… for his mercy endureth for ever toward Yashar''el (Israel)…* (Ezra 3:11) — the same refrain at the second temple''s foundation; the restoration anthem.'),
    ('psalm-136-give-thanks-for-his-mercy-endureth-for-ever-the-temple-antiphon','canon','psalms',136,1,'canon','jeremiah',33,11,5,
      E'*…for his mercy endureth for ever… For I will cause to return the captivity of the land* (Jeremiah 33:11) — the refrain prophesied to be re-sung at the two-house ingathering.'),
    ('psalm-136-give-thanks-for-his-mercy-endureth-for-ever-the-temple-antiphon','canon','psalms',136,1,'canon','psalms',100,5,6,
      E'*For Yahuah (LORD) is good; his mercy is everlasting…* (Psalm 100:5) — the whole confession Psalm 136 unfolds verse by verse.'),
    ('psalm-136-give-thanks-for-his-mercy-endureth-for-ever-the-temple-antiphon','canon','psalms',136,1,'canon','luke',1,50,7,
      E'*And his mercy is on them that fear him from generation to generation.* (Luke 1:50) — the everlasting chesed carried forward in Miryam''s song.'),
    ('psalm-136-give-thanks-for-his-mercy-endureth-for-ever-the-temple-antiphon','canon','psalms',136,26,'canon','1-chronicles',16,41,8,
      E'*…to give thanks to Yahuah (LORD), because his mercy endureth for ever* (1 Chronicles 16:41) — Heman and Jeduthun set to sound this clause continually; the psalm''s closing v.26.'),

    -- T2
    ('psalm-136-by-wisdom-he-made-the-heavens-and-the-great-lights','canon','psalms',136,5,'canon','genesis',1,1,1,
      E'*In the beginning Elohim (God) created the heaven and the earth.* (Genesis 1:1) — the heavens *made by wisdom* are Genesis 1 sung back as praise.'),
    ('psalm-136-by-wisdom-he-made-the-heavens-and-the-great-lights','canon','psalms',136,5,'canon','proverbs',3,19,2,
      E'*Yahuah (LORD) by wisdom hath founded the earth…* (Proverbs 3:19) — verbatim wisdom-of-creation language behind *by wisdom made the heavens*.'),
    ('psalm-136-by-wisdom-he-made-the-heavens-and-the-great-lights','canon','psalms',136,5,'canon','proverbs',8,27,3,
      E'*When he prepared the heavens, I was there…* (Proverbs 8:27) — Wisdom, the Formed agent, present at the founding.'),
    ('psalm-136-by-wisdom-he-made-the-heavens-and-the-great-lights','canon','psalms',136,5,'canon','john',1,3,4,
      E'*All things were made by him; and without him was not any thing made that was made.* (John 1:3) — the Formed Word through whom the heavens were made.'),
    ('psalm-136-by-wisdom-he-made-the-heavens-and-the-great-lights','canon','psalms',136,5,'canon','colossians',1,16,5,
      E'*…by him were all things created… all things were created by him, and for him* (Colossians 1:16) — the Son as the agent of creation, not a second God.'),
    ('psalm-136-by-wisdom-he-made-the-heavens-and-the-great-lights','canon','psalms',136,7,'canon','genesis',1,14,6,
      E'*…let them be for signs, and for seasons, and for days, and years* (Genesis 1:14) — the *great lights* set for the appointed times (moedim).'),
    ('psalm-136-by-wisdom-he-made-the-heavens-and-the-great-lights','canon','psalms',136,8,'canon','genesis',1,16,7,
      E'*…the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* (Genesis 1:16) — vv.8-9 turned to praise.'),
    ('psalm-136-by-wisdom-he-made-the-heavens-and-the-great-lights','canon','psalms',136,9,'canon','jeremiah',31,35,8,
      E'*…the ordinances of the moon and of the stars for a light by night…* (Jeremiah 31:35) — the fixed order of the lights bound to the covenant with Yashar''el (Israel).'),

    -- T3
    ('psalm-136-he-smote-egypt-in-their-firstborn-and-brought-out-israel','canon','psalms',136,10,'canon','exodus',12,29,1,
      E'*…Yahuah (LORD) smote all the firstborn in the land of Egypt, from the firstborn of Pharaoh… unto the firstborn of the captive…* (Exodus 12:29) — the Passover blow recited exactly.'),
    ('psalm-136-he-smote-egypt-in-their-firstborn-and-brought-out-israel','canon','psalms',136,10,'jubilees','jubilees',49,2,2,
      E'*…the beginning of the festival and the beginning of the joy… to slay all the first-born in the land of Egypt, from the firstborn of Pharaoh to the first-born of the captive maidservant in the mill…* (Jubilees 49:2) — the restored witness names the same firstborn-stroke as the festival night.'),
    ('psalm-136-he-smote-egypt-in-their-firstborn-and-brought-out-israel','canon','psalms',136,11,'canon','exodus',12,29,3,
      E'*…at midnight Yahuah (LORD) smote all the firstborn…* (Exodus 12:29) — the blow that *brought out Yashar''el (Israel) from among them* (the covenant firstborn freed).'),

    -- T4
    ('psalm-136-he-divided-the-red-sea-and-overthrew-pharaoh','canon','psalms',136,13,'canon','exodus',14,21,1,
      E'*…Yahuah (LORD) caused the sea to go back by a strong east wind… and the waters were divided.* (Exodus 14:21) — *divided the Red sea into parts* exactly.'),
    ('psalm-136-he-divided-the-red-sea-and-overthrew-pharaoh','canon','psalms',136,14,'canon','exodus',14,22,2,
      E'*…went into the midst of the sea upon the dry ground: and the waters were a wall unto them…* (Exodus 14:22) — *made Yashar''el (Israel) to pass through the midst of it.*'),
    ('psalm-136-he-divided-the-red-sea-and-overthrew-pharaoh','canon','psalms',136,15,'canon','exodus',14,27,3,
      E'*…the sea returned to his strength… and Yahuah (LORD) overthrew the Egyptians in the midst of the sea.* (Exodus 14:27) — *overthrew Pharaoh and his host.*'),
    ('psalm-136-he-divided-the-red-sea-and-overthrew-pharaoh','canon','psalms',136,15,'canon','exodus',14,28,4,
      E'*…there remained not so much as one of them.* (Exodus 14:28) — the totality of the overthrow.'),
    ('psalm-136-he-divided-the-red-sea-and-overthrew-pharaoh','canon','psalms',136,14,'canon','1-corinthians',10,1,5,
      E'*…all our fathers were under the cloud, and all passed through the sea* (1 Corinthians 10:1) — the crossing read forward as baptism-figure.'),
    ('psalm-136-he-divided-the-red-sea-and-overthrew-pharaoh','canon','psalms',136,14,'canon','1-corinthians',10,2,6,
      E'*And were all baptized unto Moses in the cloud and in the sea* (1 Corinthians 10:2) — the passage through the midst named a baptism.'),
    ('psalm-136-he-divided-the-red-sea-and-overthrew-pharaoh','canon','psalms',136,13,'apocrypha','the-wisdom-of-solomon',10,18,7,
      E'*Brought them through the Red sea, and led them through much water* (Wisdom of Solomon 10:18) — the restored witness to the same dividing.'),
    ('psalm-136-he-divided-the-red-sea-and-overthrew-pharaoh','canon','psalms',136,14,'apocrypha','the-wisdom-of-solomon',19,7,8,
      E'*…out of the Red sea a way without impediment…* (Wisdom of Solomon 19:7) — the dry path of v.14 seen by the same library.'),

    -- T5
    ('psalm-136-he-led-his-people-through-the-wilderness-an-heritage-unto-israel','canon','psalms',136,17,'canon','numbers',21,23,1,
      E'*Sihon would not suffer Yashar''el (Israel) to pass through his border… and fought against Yashar''el (Israel).* (Numbers 21:23) — the first of the *great kings* smitten.'),
    ('psalm-136-he-led-his-people-through-the-wilderness-an-heritage-unto-israel','canon','psalms',136,19,'canon','numbers',21,34,2,
      E'*…I have delivered him into thy hand… as thou didst unto Sihon king of the Amorites…* (Numbers 21:34) — Og delivered by the same word as Sihon.'),
    ('psalm-136-he-led-his-people-through-the-wilderness-an-heritage-unto-israel','canon','psalms',136,19,'canon','deuteronomy',29,7,3,
      E'*Sihon the king of Heshbon, and Og the king of Bashan, came out against us… and we smote them* (Deuteronomy 29:7) — Moses pairs them as the psalm does (vv.19-20).'),
    ('psalm-136-he-led-his-people-through-the-wilderness-an-heritage-unto-israel','canon','psalms',136,20,'canon','joshua',12,4,4,
      E'*…Og king of Bashan, which was of the remnant of the giants…* (Joshua 12:4) — the giant-king of the conquest list.'),
    ('psalm-136-he-led-his-people-through-the-wilderness-an-heritage-unto-israel','canon','psalms',136,21,'canon','joshua',12,2,5,
      E'*Sihon king of the Amorites, who dwelt in Heshbon, and ruled from Aroer…* (Joshua 12:2) — the territory *given for an heritage.*'),
    ('psalm-136-he-led-his-people-through-the-wilderness-an-heritage-unto-israel','canon','psalms',136,22,'canon','romans',11,1,6,
      E'*Hath Elohim (God) cast away his people? Elohim (God) forbid…* (Romans 11:1) — the heritage of *Yashar''el his servant* stands; the people are not cast away.'),

    -- T6
    ('psalm-136-who-remembered-us-in-our-low-estate-and-giveth-food-to-all-flesh','canon','psalms',136,23,'canon','genesis',8,1,1,
      E'*And Elohim (God) remembered Noah… and the waters asswaged* (Genesis 8:1) — when Yahuah "remembers," he acts to deliver.'),
    ('psalm-136-who-remembered-us-in-our-low-estate-and-giveth-food-to-all-flesh','canon','psalms',136,23,'canon','psalms',105,8,2,
      E'*He hath remembered his covenant for ever, the word which he commanded to a thousand generations.* (Psalm 105:8) — the chesed-forever refrain told as covenant-memory.'),
    ('psalm-136-who-remembered-us-in-our-low-estate-and-giveth-food-to-all-flesh','canon','psalms',136,23,'canon','luke',1,48,3,
      E'*For he hath regarded the low estate of his handmaiden…* (Luke 1:48) — *remembered us in our low estate* carried forward in the Magnificat.'),
    ('psalm-136-who-remembered-us-in-our-low-estate-and-giveth-food-to-all-flesh','canon','psalms',136,25,'canon','psalms',145,15,4,
      E'*The eyes of all wait upon thee; and thou givest them their meat in due season.* (Psalm 145:15) — the open-handed providence of *food to all flesh.*'),
    ('psalm-136-who-remembered-us-in-our-low-estate-and-giveth-food-to-all-flesh','canon','psalms',136,25,'canon','psalms',145,16,5,
      E'*Thou openest thine hand, and satisfiest the desire of every living thing.* (Psalm 145:16) — mercy that sustains the whole creation made by wisdom (v.5).'),
    ('psalm-136-who-remembered-us-in-our-low-estate-and-giveth-food-to-all-flesh','canon','psalms',136,25,'canon','matthew',6,26,6,
      E'*…yet your heavenly Father feedeth them. Are ye not much better than they?* (Matthew 6:26) — the providence of v.25 made the ground of trust in the Father.')
  ) AS m(slug,src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug=m.slug
  JOIN _s302_ps136_lookup sv ON sv.edition_slug=m.src_edition AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s302_ps136_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
