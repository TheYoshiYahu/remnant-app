-- ----- fragment: minion_1peter_02.sql (S240 1 Peter 2) -----
-- =====================================================================
-- S240 minion — 1 PETER 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 PETER 2 (25 verses) — THE LIVING STONE / THE PECULIAR PEOPLE / THE STRIPES THAT HEAL.
-- Tag: p240c2 (temp view _s240_p240c2_lookup).
-- Sort band: floor 9630, step 3 (9630, 9633, 9636, 9639, 9642 used; under 9660).
-- Migration (header only): session240_1peter_cross_references.sql
-- Source is ALWAYS the canon 1 Peter verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (1 Peter = the letter to the scattered elect, the dispersed two-house remnant
-- called a chosen generation, a royal priesthood, an holy nation, a peculiar people — Israel's own
-- Sinai vocation [Exodus 19:5-6], NOT a new entity replacing Yashar'el. Same Yahuah, same Torah,
-- the holiness commanded from Leviticus, the living stone for both houses, the suffering Servant
-- of Isaiah 53). Chapter 2 is the heart of the book: the milk of the word and the taste that
-- Yahuah is gracious (Psalm 34); the living stone and the rejected stone welded from Isaiah 28,
-- Psalm 118, and Isaiah 8 (the stone of stumbling *to both the houses of Yashar'el*); the chosen
-- generation / royal priesthood / holy nation / peculiar people of Exodus 19 restored to the
-- scattered seed (Hosea's Lo-ammi made Ammi); fear Elohim, honour the king (Proverbs 24); and the
-- stripes that heal, Isaiah 53 woven verbatim around the suffering Servant. Christology: it is the
-- Formed Son who *did no sin* and *bare our sins in his own body on the tree*, the suffering
-- Servant, leaving an example — keep him the One the Father sent and will raise.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   newborn babes desire the sincere milk; tasted that Yahuah is gracious
--           Tanakh: Psalm 34:8 (O taste and see that Yahuah is good)
--           Extras: none warranted   NT: none warranted (the Psalm root carries it)
--   v.4-8   the living stone, the chief corner stone, the rejected head of the corner, the
--           stone of stumbling and rock of offence
--           Tanakh: Isaiah 28:16 (a tried stone, a precious corner stone), Psalm 118:22 (the stone
--                   the builders refused become the head stone of the corner), Isaiah 8:14 (a stone
--                   of stumbling... to both the houses of Yashar'el)
--           Extras: none warranted
--           NT: Romans 9:33 (the stumblingstone in Sion), Ephesians 2:20 (the chief corner stone),
--                   Matthew 21:42 (the stone which the builders rejected)
--   v.5,9   built up a spiritual house, an holy priesthood; a chosen generation, a royal priesthood,
--           an holy nation, a peculiar people (woven into the peculiar-people thread)
--           Tanakh: Exodus 19:5-6 (a peculiar treasure... a kingdom of priests, and an holy nation),
--                   Deuteronomy 7:6 / 14:2 (a peculiar people), Isaiah 43:21 (this people have I
--                   formed... they shall shew forth my praise)
--           Extras: none warranted   NT: none warranted (the Sinai root and Hosea carry it)
--   v.10    in time past were not a people, but are now the people of Elohim; mercy obtained
--           Tanakh: Hosea 1:10 (Ye are the sons of the living Elohim), Hosea 2:23 (I will say to
--                   them which were not my people, Thou art my people)
--           Extras: none warranted   NT: none warranted
--   v.11-16 strangers and pilgrims; honest conversation; submit to ordinances; as free, servants
--           Tanakh: none warranted (the strangers-and-pilgrims weight carried in the ch1 scattered
--                   thread; v.11-16 are exhortation, not a load-bearing quote of one verse)
--           Extras: none warranted   NT: none warranted
--   v.17    Fear Elohim. Honour the king.
--           Tanakh: Proverbs 24:21 (My son, fear thou Yahuah and the king)
--           Extras: none warranted   NT: none warranted
--   v.18-20 servants be subject; thankworthy to endure grief suffering wrongfully
--           Tanakh: none warranted (folded into the example-of-the-Servant weight at 21-25)
--           Extras: none warranted   NT: none warranted
--   v.21-25 Messiah suffered leaving an example; did no sin, no guile in his mouth; bare our sins
--           on the tree; by whose stripes ye were healed; ye were as sheep going astray
--           Tanakh: Isaiah 53:9 (he had done no violence, neither was any deceit in his mouth),
--                   Isaiah 53:5 (with his stripes we are healed), Isaiah 53:4 (he hath borne our
--                   griefs), Isaiah 53:6 (all we like sheep have gone astray), Isaiah 53:7 (he
--                   opened not his mouth, as a lamb to the slaughter)
--           Extras: none warranted   NT: none warranted (the Servant-song root is the whole weave)
--
-- THREADS (slug -> target libraries):
--   9630 1-peter-2-taste-that-yahuah-is-gracious-the-sincere-milk-psalm-34          (Tanakh)
--   9633 1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8  (Tanakh + NT)
--   9636 1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea  (Tanakh)  [BLESSING]
--   9639 1-peter-2-fear-elohim-honour-the-king-proverbs-24                          (Tanakh)
--   9642 1-peter-2-by-whose-stripes-ye-were-healed-isaiah-53                        (Tanakh)  [BLESSING]
-- =====================================================================

CREATE TEMP VIEW _s240_p240c2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-peter-2-taste-that-yahuah-is-gracious-the-sincere-milk-psalm-34
  ('canon', '1-peter', 2, 3, 'canon', 'psalms', 34, 8, 'free', E'*O taste and see that Yahuah (LORD) is good: blessed is the man that trusteth in him.* (Psalm 34:8). Peter bids the newborn babes *desire the sincere milk of the word, that ye may grow thereby: If so be ye have tasted that Yahuah (Lord) is gracious* (1 Peter 2:2-3). The very figure is David''s — *taste and see that Yahuah (LORD) is good* — the experiential knowing of Yahuah''s goodness that grounds trust. Peter takes the Psalm''s invitation and applies it to the word that feeds the gathered: they have tasted, in the milk of the word, that Yahuah (Lord) is gracious, and so they grow. The whole of Psalm 34 stands under this chapter; here its opening invitation is the root of Peter''s call to grow by the word.'),
  -- thread: 1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8
  ('canon', '1-peter', 2, 6, 'canon', 'isaiah', 28, 16, 'free', E'*Therefore thus saith Adonai Yahuah (the Lord GOD), Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste.* (Isaiah 28:16). Peter quotes this as scripture: *Wherefore also it is contained in the scripture, Behold, I lay in Sion a chief corner stone, elect, precious: and he that believeth on him shall not be confounded* (1 Peter 2:6). The *tried stone, a precious corner stone* Yahuah (LORD) lays in Zion is the Messiah, the living stone *chosen of Elohim (God), and precious* (1 Peter 2:4); and the promise *he that believeth shall not make haste* becomes *he that believeth on him shall not be confounded.* The sure foundation of Isaiah is the One Peter names — the elect, precious corner stone laid in Sion.'),
  ('canon', '1-peter', 2, 7, 'canon', 'psalms', 118, 22, 'free', E'*The stone which the builders refused is become the head stone of the corner.* (Psalm 118:22). Peter weaves this straight into his stone-witness: *the stone which the builders disallowed, the same is made the head of the corner* (1 Peter 2:7). The rejected stone of the Psalm — refused by the builders, yet exalted by Yahuah (LORD) to be the head of the corner — is the Messiah, *disallowed indeed of men, but chosen of Elohim (God), and precious* (1 Peter 2:4). To them that believe he is precious; to the disobedient he is the disallowed stone now crowned. The reversal David sang is the gospel-pattern Peter preaches: the rejected One is made the chief corner stone.'),
  ('canon', '1-peter', 2, 8, 'canon', 'isaiah', 8, 14, 'free', E'*And he shall be for a sanctuary; but for a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel), for a gin and for a snare to the inhabitants of Jerusalem.* (Isaiah 8:14). Peter completes the stone-mosaic with Isaiah''s warning: *And a stone of stumbling, and a rock of offence, even to them which stumble at the word, being disobedient* (1 Peter 2:8). Mark Isaiah''s phrase — *a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel)* — the same stone is sanctuary to those who believe and stumbling to those who refuse, and it stands before *both the houses* of Yashar''el (Israel), Yahudah and Yisra''el alike. The living stone Peter names is precious to the believing and an offence to the disobedient, exactly as Isaiah foretold for the whole house.'),
  ('canon', '1-peter', 2, 8, 'canon', 'romans', 9, 33, 'free', E'*As it is written, Behold, I lay in Sion a stumblingstone and rock of offence: and whosoever believeth on him shall not be ashamed.* (Romans 9:33). Paul welds the same two Isaiah texts Peter welds — *I lay in Sion* (Isaiah 28:16) and *a stumblingstone and rock of offence* (Isaiah 8:14) — into one witness. Peter does likewise: *a chief corner stone, elect, precious* and *a stone of stumbling, and a rock of offence* (1 Peter 2:6,8). Two apostles, reading the same scriptures, name the same stone: precious to the believing, a stumblingstone to the disobedient, yet *whosoever believeth on him shall not be ashamed.* The stone in Sion is the Messiah, and faith in him is the dividing line.'),
  ('canon', '1-peter', 2, 6, 'canon', 'ephesians', 2, 20, 'free', E'*And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone;* (Ephesians 2:20). Paul names the Messiah *the chief corner stone* upon whom the household is built; Peter calls the gathered *lively stones... built up a spiritual house* (1 Peter 2:5) upon *a chief corner stone, elect, precious* (1 Peter 2:6). The same architecture: the Messiah the corner stone, the people the living stones built into a spiritual house, a holy priesthood. What Paul frames as a building fitly framed together, Peter frames as a living temple of stones — one corner stone, one house of Yahuah (LORD).'),
  ('canon', '1-peter', 2, 7, 'canon', 'matthew', 21, 42, 'free', E'*Yahusha (Jesus) saith unto them, Did ye never read in the scriptures, The stone which the builders rejected, the same is become the head of the corner: this is Yahuah''s (Lord''s) doing, and it is marvellous in our eyes?* (Matthew 21:42). Yahusha (Jesus) himself quoted Psalm 118:22 against the builders who rejected him — *The stone which the builders rejected, the same is become the head of the corner.* Peter, who heard him, now writes the same word: *the stone which the builders disallowed, the same is made the head of the corner* (1 Peter 2:7). The Master named himself the rejected-yet-crowned stone; the disciple proclaims it. The builders'' refusal is Yahuah''s (Lord''s) doing, marvellous in the eyes of those who believe.'),
  -- thread: 1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea  [BLESSING]
  ('canon', '1-peter', 2, 9, 'canon', 'exodus', 19, 5, 'free', E'*Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine:* (Exodus 19:5). At Sinai Yahuah (LORD) named Yashar''el (Israel) *a peculiar treasure unto me above all people.* Peter speaks the same calling over the scattered elect: *ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people* (1 Peter 2:9). The *peculiar people* is the *peculiar treasure* of Sinai — and note the condition Yahuah (LORD) sets, *if ye will obey my voice indeed, and keep my covenant.* This is not a new people replacing Yashar''el (Israel) but Yashar''el''s (Israel''s) own covenant vocation, the Torah-keeping treasured nation, restored to the gathered seed.'),
  ('canon', '1-peter', 2, 9, 'canon', 'exodus', 19, 6, 'free', E'*And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel).* (Exodus 19:6). The Sinai charter is exact: *a kingdom of priests, and an holy nation* — and Peter sets it word for word upon the scattered elect, *a royal priesthood, an holy nation* (1 Peter 2:9), even *a spiritual house, an holy priesthood, to offer up spiritual sacrifices* (1 Peter 2:5). What Yahuah (LORD) charged Moses to speak *unto the children of Yashar''el (Israel)* is the very identity Peter declares fulfilled in the gathered. The royal priesthood and holy nation are not a Gentile church displacing Yashar''el (Israel); they are the children of Yashar''el (Israel) restored to the calling spoken at the mountain.'),
  ('canon', '1-peter', 2, 9, 'canon', 'deuteronomy', 14, 2, 'free', E'*For thou art an holy people unto Yahuah Elohayka (the LORD thy God), and Yahuah (LORD) hath chosen thee to be a peculiar people unto himself, above all the nations that are upon the earth.* (Deuteronomy 14:2). Moses says it plainly: Yahuah (LORD) *hath chosen thee to be a peculiar people unto himself.* Peter calls the elect *a peculiar people* (1 Peter 2:9) — the very phrase, the chosen and holy nation set apart unto Yahuah (LORD). And mark the chapter Deuteronomy 14 is: the clean-and-unclean dietary law follows immediately upon *thou art an holy people.* The peculiar people are the holy, Torah-set-apart people; Peter''s word is no abolition of that calling but its restoration in the scattered seed.'),
  ('canon', '1-peter', 2, 9, 'canon', 'deuteronomy', 7, 6, 'free', E'*For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* (Deuteronomy 7:6). Again Moses names the calling: *an holy people... a special people unto himself, above all people.* Peter declares the elect *a chosen generation... an holy nation, a peculiar people* (1 Peter 2:9). The chosenness, the holiness, the set-apartness above all peoples — these are Yashar''el''s (Israel''s) own from the Torah, now spoken over the gathered remnant. The covenant identity is not transferred to another nation; it is the covenant people themselves, called *out of darkness into his marvellous light.*'),
  ('canon', '1-peter', 2, 9, 'canon', 'isaiah', 43, 21, 'free', E'*This people have I formed for myself; they shall shew forth my praise.* (Isaiah 43:21). Yahuah (LORD) says of Yashar''el (Israel), *This people have I formed for myself; they shall shew forth my praise.* Peter names the very purpose: *a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light* (1 Peter 2:9). The people formed to *shew forth my praise* are the people Peter calls to *shew forth the praises* of the One who called them. Isaiah''s formed people and Peter''s peculiar people are one — Yashar''el (Israel) formed for Yahuah''s (LORD''s) own praise, gathered out of darkness.'),
  ('canon', '1-peter', 2, 10, 'canon', 'hosea', 2, 23, 'free', E'*And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God).* (Hosea 2:23). Hosea foretold the reversal of Lo-ammi and Lo-ruhamah: *I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people.* Peter writes it fulfilled: *Which in time past were not a people, but are now the people of Elohim (God): which had not obtained mercy, but now have obtained mercy* (1 Peter 2:10). This is the regathering of scattered Yashar''el (Israel) — the not-my-people made my-people, the not-pitied shown mercy — not a Gentile church but the divorced and scattered house brought home.'),
  ('canon', '1-peter', 2, 10, 'canon', 'hosea', 1, 10, 'free', E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10). Hosea names the very people: *the children of Yashar''el (Israel)... in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* Peter declares the word kept: *were not a people, but are now the people of Elohim (God)* (1 Peter 2:10). The Lo-ammi of Hosea, the scattered children of Yashar''el (Israel), are made Ammi again — the sons of the living Elohim (God). Peter''s peculiar people are this regathered seed, not a new entity.'),
  -- thread: 1-peter-2-fear-elohim-honour-the-king-proverbs-24
  ('canon', '1-peter', 2, 17, 'canon', 'proverbs', 24, 21, 'free', E'*My son, fear thou Yahuah (LORD) and the king: and meddle not with them that are given to change:* (Proverbs 24:21). Peter''s fourfold charge — *Honour all men. Love the brotherhood. Fear Elohim (God). Honour the king* (1 Peter 2:17) — distils the wisdom of Proverbs: *fear thou Yahuah (LORD) and the king.* The two stand together, the fear of Yahuah (LORD) and the honour of the king, with the fear of Elohim (God) governing the honour rendered to the throne. Peter sets the order rightly: fear belongs to Elohim (God); honour is given the king under that fear. The proverb''s pairing is the apostle''s rule of submission for the scattered elect among the nations.'),
  -- thread: 1-peter-2-by-whose-stripes-ye-were-healed-isaiah-53  [BLESSING]
  ('canon', '1-peter', 2, 22, 'canon', 'isaiah', 53, 9, 'free', E'*And he made his grave with the wicked, and with the rich in his death; because he had done no violence, neither was any deceit in his mouth.* (Isaiah 53:9). Peter quotes the Servant-song nearly word for word: *Who did no sin, neither was guile found in his mouth* (1 Peter 2:22). Isaiah''s *he had done no violence, neither was any deceit in his mouth* is the sinless Servant whose innocence is the ground of his suffering. The Messiah Peter sets before suffering servants as their example is the very Servant of Isaiah 53 — guileless, doing no sin, yet bearing the iniquity of others. The pattern of unjust suffering Peter commends is the Servant''s own.'),
  ('canon', '1-peter', 2, 24, 'canon', 'isaiah', 53, 5, 'free', E'*But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* (Isaiah 53:5). This is the verse Peter closes upon: *Who his own self bare our sins in his own body on the tree, that we, being dead to sins, should live unto righteousness: by whose stripes ye were healed* (1 Peter 2:24). Isaiah''s *with his stripes we are healed* becomes Peter''s *by whose stripes ye were healed* — the wounding for transgressions, the bruising for iniquities, the chastisement of peace borne by the Servant. The healing is the forgiveness of sins, the dead-to-sins, alive-to-righteousness life purchased on the tree. Isaiah''s stripes are the stripes Peter preaches.'),
  ('canon', '1-peter', 2, 24, 'canon', 'isaiah', 53, 4, 'free', E'*Surely he hath borne our griefs, and carried our sorrows: yet we did esteem him stricken, smitten of Elohim (God), and afflicted.* (Isaiah 53:4). The Servant *hath borne our griefs, and carried our sorrows* — and Peter says the Messiah *his own self bare our sins in his own body on the tree* (1 Peter 2:24). The bearing-of-our-burden is the heart of both: Isaiah''s Servant carries what was ours, esteemed stricken and smitten though it was for us; Peter''s Messiah bears our sins in his own body. The substitution Isaiah sang — our griefs upon him — is the cross Peter proclaims, the Servant bearing the sin of the scattered that they might live unto righteousness.'),
  ('canon', '1-peter', 2, 25, 'canon', 'isaiah', 53, 6, 'free', E'*All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all.* (Isaiah 53:6). Peter ends the chapter with this exact image: *For ye were as sheep going astray; but are now returned unto the Shepherd and Bishop of your souls* (1 Peter 2:25). Isaiah''s *all we like sheep have gone astray* is Peter''s *ye were as sheep going astray* — and the iniquity Yahuah (LORD) laid on the Servant is the sin the Shepherd bore to bring the straying flock home. The wandering sheep of Isaiah are the returned flock of Peter, gathered to the Shepherd and Bishop of their souls, the suffering Servant himself.'),
  ('canon', '1-peter', 2, 23, 'canon', 'isaiah', 53, 7, 'free', E'*He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* (Isaiah 53:7). Peter describes the Messiah''s silence under reviling: *Who, when he was reviled, reviled not again; when he suffered, he threatened not; but committed himself to him that judgeth righteously* (1 Peter 2:23). Isaiah''s Servant *opened not his mouth... as a sheep before her shearers is dumb* — the silent, non-retaliating sufferer who commits his cause to Yahuah (LORD). The example Peter holds before wronged servants is this Servant''s silence: not threatening, not reviling again, but committing himself to the One who judges righteously.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s240_p240c2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s240_p240c2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-2-taste-that-yahuah-is-gracious-the-sincere-milk-psalm-34',
       E'Taste that Yahuah (Lord) is gracious — the sincere milk of the word (Psalm 34)',
       E'Peter calls the gathered to grow: *As newborn babes, desire the sincere milk of the word, that ye may grow thereby: If so be ye have tasted that Yahuah (Lord) is gracious* (1 Peter 2:2-3). The closing phrase is David''s song: *O taste and see that Yahuah (LORD) is good: blessed is the man that trusteth in him* (Psalm 34:8). The experiential knowing of Yahuah''s (LORD''s) goodness — the *taste and see* — grounds the growth Peter commands; those who have tasted that Yahuah (Lord) is gracious in the milk of the word press on to grow by it. The whole of Psalm 34 stands beneath this chapter (Peter will quote it again at length in chapter 3 — *the eyes of Yahuah are over the righteous*), and here its opening invitation is the root: come, taste, and grow, for Yahuah (Lord) is gracious.',
       sv.verse_id, ev.verse_id, 'free', 9630
  FROM _s240_p240c2_lookup sv, _s240_p240c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8',
       E'The living stone, the chief corner stone, the stone of stumbling (Psalm 118, Isaiah 28, Isaiah 8)',
       E'Peter welds three Tanakh stone-texts into one witness to the Messiah. The corner stone is Isaiah''s: *it is contained in the scripture, Behold, I lay in Sion a chief corner stone, elect, precious: and he that believeth on him shall not be confounded* (1 Peter 2:6) — that is, *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* (Isaiah 28:16). The rejected-yet-crowned stone is David''s: *the stone which the builders disallowed, the same is made the head of the corner* (1 Peter 2:7), the very word of *The stone which the builders refused is become the head stone of the corner* (Psalm 118:22) — the song Yahusha (Jesus) himself turned against the builders, *The stone which the builders rejected, the same is become the head of the corner: this is Yahuah''s (Lord''s) doing* (Matthew 21:42). And the stone of stumbling is Isaiah''s: *a stone of stumbling, and a rock of offence, even to them which stumble at the word* (1 Peter 2:8), which is *for a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel)* (Isaiah 8:14) — mark the phrase, *to both the houses,* Yahudah and Yisra''el alike. The same stone is sanctuary to the believing and an offence to the disobedient. Paul read the same scriptures the same way: *Behold, I lay in Sion a stumblingstone and rock of offence: and whosoever believeth on him shall not be ashamed* (Romans 9:33), joining Isaiah 28 to Isaiah 8 as Peter does. And the building rises upon the stone: the elect are *lively stones... built up a spiritual house* (1 Peter 2:5) upon the One Paul calls *the chief corner stone* (Ephesians 2:20). To them that believe he is precious; to the builders who refused him he is the disallowed stone now crowned head of the corner — Yahuah''s (LORD''s) own doing, foretold in Psalm, Isaiah, and Isaiah, fulfilled in the living stone, the Messiah.',
       sv.verse_id, ev.verse_id, 'free', 9633
  FROM _s240_p240c2_lookup sv, _s240_p240c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea',
       E'A chosen generation, a royal priesthood, an holy nation, a peculiar people (Exodus 19, Deuteronomy 7 & 14, Isaiah 43, Hosea)',
       E'*But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light: Which in time past were not a people, but are now the people of Elohim (God): which had not obtained mercy, but now have obtained mercy* (1 Peter 2:9-10). Every phrase is Yashar''el''s (Israel''s) own, spoken at Sinai and by the prophets — this is the covenant people restored to their own calling, NOT a new entity replacing Yashar''el (Israel). The charter is Exodus: *if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people* (Exodus 19:5), *and ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel)* (Exodus 19:6) — the *royal priesthood* and *holy nation* word for word, with the condition of obeying Yahuah''s (LORD''s) voice and keeping his covenant. Moses repeats it: *thou art an holy people unto Yahuah Elohayka (the LORD thy God), and Yahuah (LORD) hath chosen thee to be a peculiar people unto himself, above all the nations* (Deuteronomy 14:2 — the very chapter of the clean-and-unclean dietary law), and *a special people unto himself, above all people* (Deuteronomy 7:6). The purpose is Isaiah''s: *This people have I formed for myself; they shall shew forth my praise* (Isaiah 43:21) — the formed people that *shew forth my praise* are Peter''s peculiar people that *shew forth the praises* of the One who called them. And the *were not a people, but are now the people of Elohim* is Hosea''s reversal of Lo-ammi: *I will say to them which were not my people, Thou art my people* (Hosea 2:23), *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10) — the divorced and scattered house of Yashar''el (Israel) regathered, the not-pitied shown mercy. This is the exact twin of Titus 2:14, *a peculiar people, zealous of good works.* Do not read it as a Gentile church displacing Yashar''el (Israel): it is the scattered covenant people — the chosen, royal, priestly, holy, peculiar nation of Sinai — gathered out of darkness into his marvellous light and restored to the vocation Yahuah (LORD) gave them at the mountain.',
       sv.verse_id, ev.verse_id, 'free', 9636
  FROM _s240_p240c2_lookup sv, _s240_p240c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=2 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-2-fear-elohim-honour-the-king-proverbs-24',
       E'Fear Elohim (God), honour the king (Proverbs 24)',
       E'Peter gives a fourfold rule for the scattered elect among the nations: *Honour all men. Love the brotherhood. Fear Elohim (God). Honour the king* (1 Peter 2:17). The pairing of the last two is the wisdom of Proverbs: *My son, fear thou Yahuah (LORD) and the king: and meddle not with them that are given to change* (Proverbs 24:21). The two stand together — the fear of Yahuah (LORD) and the honour of the king — yet rightly ordered: fear belongs to Elohim (God); honour is rendered to the king under that fear. Peter''s call to *submit yourselves to every ordinance of man for Yahuah''s (Lord''s) sake* (1 Peter 2:13) is the proverb lived out: the elect honour the throne, but their fear is reserved for Yahuah (LORD) alone. The wisdom that joined the fear of Yahuah (LORD) to the honour of the king is the apostle''s rule of submission for the dispersed.',
       sv.verse_id, ev.verse_id, 'free', 9639
  FROM _s240_p240c2_lookup sv, _s240_p240c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=2 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-2-by-whose-stripes-ye-were-healed-isaiah-53',
       E'By whose stripes ye were healed — the suffering Servant (Isaiah 53)',
       E'Peter closes the chapter by weaving Isaiah''s Servant-song almost verbatim around the suffering Messiah, the example for servants who suffer wrongfully. *Who did no sin, neither was guile found in his mouth* (1 Peter 2:22) is Isaiah''s *he had done no violence, neither was any deceit in his mouth* (Isaiah 53:9) — the sinless, guileless Servant. *Who, when he was reviled, reviled not again; when he suffered, he threatened not; but committed himself to him that judgeth righteously* (1 Peter 2:23) is the silent sufferer, *He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb* (Isaiah 53:7). *Who his own self bare our sins in his own body on the tree, that we, being dead to sins, should live unto righteousness: by whose stripes ye were healed* (1 Peter 2:24) gathers up Isaiah''s heart: *Surely he hath borne our griefs, and carried our sorrows* (Isaiah 53:4) and *he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* (Isaiah 53:5) — the very *stripes that heal,* the wounding for transgressions, the substitution of the Servant. And *For ye were as sheep going astray; but are now returned unto the Shepherd and Bishop of your souls* (1 Peter 2:25) is Isaiah''s *All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all* (Isaiah 53:6). The wandering sheep are gathered home; the iniquity Yahuah (LORD) laid on the Servant is the sin the Shepherd bore to bring the straying flock back. The Christology is the Formed: it is the Son, sent by the Father, who did no sin and bare our sins in his own body, the suffering Servant who committed himself to him that judgeth righteously. Healing is the forgiveness of sins, the dead-to-sins, alive-to-righteousness life purchased on the tree — Isaiah''s Servant, Peter''s Messiah, one and the same.',
       sv.verse_id, ev.verse_id, 'free', 9642
  FROM _s240_p240c2_lookup sv, _s240_p240c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=2 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-peter-2-taste-that-yahuah-is-gracious-the-sincere-milk-psalm-34
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 34:8 — *O taste and see that Yahuah (LORD) is good: blessed is the man that trusteth in him* the experiential knowing of Yahuah''s goodness; *If so be ye have tasted that Yahuah (Lord) is gracious* (1 Peter 2:3), the milk of the word by which they grow.'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-taste-that-yahuah-is-gracious-the-sincere-milk-psalm-34'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 28:16 — *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* the corner stone Yahuah lays in Zion; quoted as scripture, *a chief corner stone, elect, precious* (1 Peter 2:6).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 118:22 — *The stone which the builders refused is become the head stone of the corner* the rejected-yet-crowned stone; *the stone which the builders disallowed, the same is made the head of the corner* (1 Peter 2:7).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 21:42 — *The stone which the builders rejected, the same is become the head of the corner: this is Yahuah''s (Lord''s) doing* Yahusha himself turned Psalm 118:22 against the builders; *the same is made the head of the corner* (1 Peter 2:7).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=21 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 8:14 — *for a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel)* the same stone is sanctuary and stumbling, before both houses; *a stone of stumbling, and a rock of offence... to them which stumble at the word* (1 Peter 2:8).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 9:33 — *Behold, I lay in Sion a stumblingstone and rock of offence: and whosoever believeth on him shall not be ashamed* Paul welds Isaiah 28 and Isaiah 8 as Peter does; *a chief corner stone... a stone of stumbling, and a rock of offence* (1 Peter 2:6,8).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Ephesians 2:20 — *Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* the people built upon the corner stone; *lively stones... built up a spiritual house* upon *a chief corner stone, elect, precious* (1 Peter 2:5-6).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-the-living-stone-and-the-rejected-stone-psalm-118-isaiah-28-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:5 — *ye shall be a peculiar treasure unto me above all people* the Sinai charter of the peculiar treasure, conditioned on obeying Yahuah''s voice and keeping his covenant; *ye are... a peculiar people* (1 Peter 2:9).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 19:6 — *ye shall be unto me a kingdom of priests, and an holy nation... unto the children of Yashar''el (Israel)* the royal priesthood and holy nation word for word; *a royal priesthood, an holy nation* (1 Peter 2:9), even *an holy priesthood* (1 Peter 2:5).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 14:2 — *Yahuah (LORD) hath chosen thee to be a peculiar people unto himself, above all the nations* the very phrase, in the dietary-law chapter; *a peculiar people* (1 Peter 2:9), the holy set-apart nation.'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 7:6 — *an holy people... a special people unto himself, above all people* the chosen, holy, set-apart people; *a chosen generation... an holy nation* (1 Peter 2:9).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 43:21 — *This people have I formed for myself; they shall shew forth my praise* the people formed to shew Yahuah''s praise; *that ye should shew forth the praises of him who hath called you* (1 Peter 2:9).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Hosea 2:23 — *I will say to them which were not my people, Thou art my people* the reversal of Lo-ammi, the scattered house regathered; *were not a people, but are now the people of Elohim (God)* (1 Peter 2:10).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Hosea 1:10 — *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* the children of Yashar''el made sons again; *now have obtained mercy* (1 Peter 2:10).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-a-chosen-generation-a-royal-priesthood-a-peculiar-people-exodus-19-hosea'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-2-fear-elohim-honour-the-king-proverbs-24
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 24:21 — *My son, fear thou Yahuah (LORD) and the king: and meddle not with them that are given to change* the wisdom pairing of fear and honour; *Fear Elohim (God). Honour the king* (1 Peter 2:17), fear to Elohim, honour to the throne under that fear.'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-fear-elohim-honour-the-king-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-2-by-whose-stripes-ye-were-healed-isaiah-53
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:9 — *because he had done no violence, neither was any deceit in his mouth* the sinless, guileless Servant; *Who did no sin, neither was guile found in his mouth* (1 Peter 2:22).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-by-whose-stripes-ye-were-healed-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:7 — *he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth* the silent sufferer; *when he was reviled, reviled not again; when he suffered, he threatened not* (1 Peter 2:23).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-by-whose-stripes-ye-were-healed-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:4 — *Surely he hath borne our griefs, and carried our sorrows* the Servant carries what was ours; *Who his own self bare our sins in his own body on the tree* (1 Peter 2:24).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-by-whose-stripes-ye-were-healed-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 53:5 — *he was wounded for our transgressions, he was bruised for our iniquities... and with his stripes we are healed* the stripes that heal; *by whose stripes ye were healed* (1 Peter 2:24).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-by-whose-stripes-ye-were-healed-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 53:6 — *All we like sheep have gone astray... and Yahuah (LORD) hath laid on him the iniquity of us all* the straying flock and the laid-on iniquity; *ye were as sheep going astray; but are now returned unto the Shepherd and Bishop of your souls* (1 Peter 2:25).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c2_lookup sv, _s240_p240c2_lookup tv
 WHERE t.slug='1-peter-2-by-whose-stripes-ye-were-healed-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=2 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
