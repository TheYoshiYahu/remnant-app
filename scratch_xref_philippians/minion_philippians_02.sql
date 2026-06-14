-- ----- fragment: minion_philippians_02.sql (S231 Philippians 2) -----
-- =====================================================================
-- S231 minion — PHILIPPIANS 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: PHILIPPIANS 2 (30 verses) — THE KENOSIS HYMN (2:5-11), the load-bearing / BLESSING chapter.
-- Tag: ph02 (temp view _s231_ph02_lookup).
-- Sort band: floor 7585, step 3 (7585, 7588, 7591, 7594, 7597 used; under 7610).
-- Source is ALWAYS the canon Philippians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (the Formed): 2:5-11 is the hymn of SUBMISSION — Yahusha (Jesus) is THE FORMED, the
-- Son drawn out of the Formless Father, who bears the Father's own Name. The hymn's whole movement is
-- downward then up by the Father's hand: the Formed *made himself of no reputation* (emptied himself),
-- *humbled himself,* *became obedient unto death* — and then *Elohim (God) also hath highly exalted him,
-- and given him a name which is above every name,* and every knee bows *to the glory of Elohim (God) the
-- Father* (2:11). The *form of Elohim* he was in is the divine glory he shares as the One brought forth;
-- *equal with Elohim* is the thing he did NOT grasp/clutch — he laid it down. The Name above every name
-- is the Father's own Name (YHWH) placed upon the Son. Built on Isaiah 45:23 (*unto me every knee shall
-- bow* — YHWH speaking; the knee bows to the Name the Formed bears), Isaiah 53 (the obedient Servant
-- *brought as a lamb to the slaughter*), and the Father-exalts-the-Son frame; the every-knee is also
-- Romans 14:11, all-things-subjected-to-the-Father is 1 Corinthians 15:27, the form-of-Elohim twin is
-- Colossians 1:15-16 / 2:9; Wisdom 7:25-26 weighed and woven as a Formed witness (the brightness of the
-- everlasting light, brought forth from the Almighty — NOT a second co-equal person). This is NOT a
-- co-equal-persons proof-text, NOT modalism, NOT a created/mere-man Christology. The Formed Son, ordered
-- under the Father, exalted BY the Father, to the Father's glory.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   consolation in Messiah, likeminded, of one accord
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (pastoral exhortation)
--   v.3-4   in lowliness of mind let each esteem other better than themselves
--           Tanakh: none warranted (humility carried with v.8 in the Sirach thread)
--           Extras: Sirach 3:18 (the greater thou art, the more humble thyself)
--           NT: none warranted
--   v.5-11  THE KENOSIS HYMN — form of Elohim, emptied, obedient unto death, exalted, every knee bows
--           Tanakh: Isaiah 45:23 (unto me every knee shall bow, every tongue shall swear), Isaiah 53:7
--                   (brought as a lamb to the slaughter), Isaiah 53:8 (cut off out of the land of the living)
--           Extras: Wisdom 7:25 (the breath of the power of Yahuah), Wisdom 7:26 (brightness of the
--                   everlasting light, the image of his goodness) — the Formed witness, VERIFIED
--           NT: Romans 14:11 (every knee shall bow to me, every tongue confess), 1 Corinthians 15:27
--                   (he hath put all things under his feet... excepted... which did put all things under him),
--                   Colossians 1:15 (the image of the invisible Elohim, the firstborn), Colossians 1:16
--                   (by him were all things created), Colossians 2:9 (in him dwelleth all the fulness)
--   v.12-13 work out your own salvation; Elohim worketh in you to will and to do
--           Tanakh: Ezekiel 36:27 (I will put my spirit within you, and cause you to walk in my statutes)
--           Extras: none warranted   NT: none warranted
--   v.14-16 blameless sons in a crooked and perverse nation, ye shine as lights
--           Tanakh: Deuteronomy 32:5 (a perverse and crooked generation), Daniel 12:3 (they that be wise
--                   shall shine as the brightness of the firmament)
--           Extras: 1 Enoch 104:2 WEIGHED — this edition reads *the light has shone upon me... I have
--                   beheld the books of life,* NOT the shine-as-lights-of-heaven wording; none warranted
--           NT: none warranted
--   v.17    if I be offered upon the sacrifice and service of your faith
--           Tanakh: Numbers 28:7 (the strong wine to be poured for a drink offering), Exodus 29:40
--                   (the fourth part of an hin of wine for a drink offering)
--           Extras: none warranted   NT: none warranted
--   v.18-30 joy/rejoice, Timotheus, Epaphroditus
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (personal/pastoral)
--
-- THREADS (slug -> target libraries):
--   7585 philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45  (Tanakh + Extras + NT)  [KENOSIS-HYMN CENTERPIECE / BLESSING]
--   7588 philippians-2-let-each-esteem-other-better-the-greater-humble-thyself-sirach-3            (Extras)
--   7591 philippians-2-it-is-elohim-which-worketh-in-you-to-will-and-to-do-ezekiel-36              (Tanakh)
--   7594 philippians-2-lights-in-a-crooked-and-perverse-nation-deuteronomy-32-daniel-12            (Tanakh)
--   7597 philippians-2-offered-upon-the-sacrifice-the-drink-offering-poured-out-numbers-28         (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s231_ph02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45  [KENOSIS HYMN]
  ('canon', 'philippians', 2, 10, 'canon', 'isaiah', 45, 23, 'free', E'*I have sworn by myself, the word is gone out of my mouth in righteousness, and shall not return, That unto me every knee shall bow, every tongue shall swear.* (Isaiah 45:23). Yahuah (LORD) himself swore that *unto me every knee shall bow.* Paul speaks the very oath of the exalted Formed: *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth* (Philippians 2:10). The knee does not bow to a second God; it bows to the Name the Formed bears — the Father''s own Name placed upon the Son, *a name which is above every name* (Philippians 2:9). The oath sworn by Yahuah (LORD) in Isaiah is fulfilled when every knee bows at the Name of the Formed, *to the glory of Elohim (God) the Father* (Philippians 2:11).'),
  ('canon', 'philippians', 2, 11, 'canon', 'isaiah', 45, 23, 'free', E'*I have sworn by myself, the word is gone out of my mouth in righteousness, and shall not return, That unto me every knee shall bow, every tongue shall swear.* (Isaiah 45:23). The second half of Yahuah''s (LORD''s) oath — *every tongue shall swear* — is what Paul completes: *that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father* (Philippians 2:11). The swearing of every tongue in Isaiah becomes the confession of every tongue that the Formed is Lord; and mark where it lands — *to the glory of Elohim (God) the Father.* The Son exalted and named bears the divine Name, yet the whole movement ends in the Father''s glory: the Formed ordered under the One who exalted him.'),
  ('canon', 'philippians', 2, 7, 'canon', 'isaiah', 53, 7, 'free', E'*He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* (Isaiah 53:7). Isaiah''s obedient Servant is *brought as a lamb to the slaughter,* silent and submitting — the very shape of the Formed who *made himself of no reputation, and took upon him the form of a servant* (Philippians 2:7). The hymn''s *form of a servant* is the Servant of Isaiah: not grasping at equality but emptying himself, taking the lowest place, the lamb who opened not his mouth.'),
  ('canon', 'philippians', 2, 8, 'canon', 'isaiah', 53, 8, 'free', E'*He was taken from prison and from judgment: and who shall declare his generation? for he was cut off out of the land of the living: for the transgression of my people was he stricken.* (Isaiah 53:8). The Servant was *cut off out of the land of the living* — stricken for the transgression of the people. So the Formed *humbled himself, and became obedient unto death, even the death of the cross* (Philippians 2:8). The death of the cross is the cutting-off of Isaiah''s Servant; the obedience-unto-death of the hymn is the obedient suffering of the One on whom Yahuah (LORD) laid the iniquity of us all.'),
  ('canon', 'philippians', 2, 10, 'canon', 'romans', 14, 11, 'free', E'*For it is written, As I live, saith Yahuah (Lord), every knee shall bow to me, and every tongue shall confess to Elohim (God).* (Romans 14:11). Paul cites the same Isaiah 45:23 oath in Romans, naming it the warrant that all shall stand before the judgment seat: *every knee shall bow to me, and every tongue shall confess to Elohim (God).* It is the twin of the hymn — *every knee should bow... every tongue should confess* (Philippians 2:10-11). The bowing knee and confessing tongue belong to Yahuah (Lord), and they belong to the Formed who bears his Name; the confession runs up to Elohim (God), to the Father''s glory.'),
  ('canon', 'philippians', 2, 9, 'canon', '1-corinthians', 15, 27, 'free', E'*For he hath put all things under his feet. But when he saith all things are put under him, it is manifest that he is excepted, which did put all things under him.* (1 Corinthians 15:27). Paul guards the very point the hymn makes: all things are subjected to the Son, *but... he is excepted, which did put all things under him* — the Father is not subjected, for it is the Father who subjects all to the Son and *highly exalted him, and given him a name which is above every name* (Philippians 2:9). The exaltation is BY the Father; the Formed receives the Name and the dominion from the One who ordered all under his feet, and renders the kingdom back to the Father.'),
  ('canon', 'philippians', 2, 6, 'canon', 'colossians', 1, 15, 'free', E'*Who is the image of the invisible Elohim (God), the firstborn of every creature:* (Colossians 1:15). The twin letter names the Formed as *the image of the invisible Elohim (God), the firstborn* — the One brought forth who shows the unseen Father. This is the *form of Elohim* of the hymn: *Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God)* (Philippians 2:6). The image of the invisible Elohim is the form of Elohim; the Formed Son bears the Father''s glory as the firstborn, not a rival God but the One drawn out of the Formless to be his image.'),
  ('canon', 'philippians', 2, 6, 'canon', 'colossians', 1, 16, 'free', E'*For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* (Colossians 1:16). All things in heaven and earth were created *by him* and *for him* — the same scope as the hymn''s every-knee, *things in heaven, and things in earth, and things under the earth* (Philippians 2:10). The One in *the form of Elohim* (Philippians 2:6) is the One by whom all was made; the creation made through the Formed is the creation that bows to the Formed, the Father working all through the Son he brought forth.'),
  ('canon', 'philippians', 2, 6, 'canon', 'colossians', 2, 9, 'free', E'*For in him dwelleth all the fulness of the Godhead bodily.* (Colossians 2:9). In the Formed *dwelleth all the fulness of the Godhead bodily* — the fulness of the Father poured into the Son who took on flesh. This is the *form of Elohim* of the hymn made plain: *Who, being in the form of Elohim (God)* (Philippians 2:6). The fulness is the Father''s, dwelling bodily in the One brought forth; the Formed is not a second source but the bodily dwelling of the one Elohim (God)''s fulness, who then emptied himself and was exalted.'),
  ('canon', 'philippians', 2, 6, 'apocrypha', 'the-wisdom-of-solomon', 7, 25, 'extras', E'*For she is the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty: therefore can no defiled thing fall into her.* (Wisdom 7:25). The Hebrew library beheld Wisdom as *the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty* — brought forth from the One, sharing his glory, yet not a second God beside him. This is the same posture as the Formed who was *in the form of Elohim (God)* (Philippians 2:6): the glory flows out FROM the Almighty into the One brought forth. Read as the Formed, Wisdom''s breath-of-the-power is the Son who carries the Father''s glory as the One emptied and exalted, not a co-equal rival to the Father.'),
  ('canon', 'philippians', 2, 6, 'apocrypha', 'the-wisdom-of-solomon', 7, 26, 'extras', E'*For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness.* (Wisdom 7:26). Wisdom is *the brightness of the everlasting light... and the image of his goodness* — the radiance that shines out from the Father, the image that shows him. The hymn names the Formed in the same terms of derived glory: *being in the form of Elohim (God)* (Philippians 2:6), the One who is *the image of the invisible Elohim (God)* (Colossians 1:15). The brightness is OF the everlasting light; the image is OF his goodness — the Formed Son drawn from the Formless Father, bearing his glory and his Name, then humbling himself unto death and exalted by the Father.'),
  -- thread: philippians-2-let-each-esteem-other-better-the-greater-humble-thyself-sirach-3
  ('canon', 'philippians', 2, 3, 'apocrypha', 'ecclesiasticus', 3, 18, 'extras', E'*The greater you are, the more humble thyself, and you shall find favour before Yahuah (God).* (Sirach 3:18). The wisdom of the library teaches the very mind Paul commands: *The greater you are, the more humble thyself.* So Paul says, *in lowliness of mind let each esteem other better than themselves* (Philippians 2:3). The path to favour before Yahuah (God) is downward, the lowering of the self — the same descent the Formed himself walked, who being greatest *made himself of no reputation* and *humbled himself* (Philippians 2:7-8).'),
  ('canon', 'philippians', 2, 8, 'apocrypha', 'ecclesiasticus', 3, 18, 'extras', E'*The greater you are, the more humble thyself, and you shall find favour before Yahuah (God).* (Sirach 3:18). *The greater you are, the more humble thyself* — and the greatest of all walked it furthest: the Formed *humbled himself, and became obedient unto death, even the death of the cross* (Philippians 2:8). Sirach''s rule that humbling finds favour before Yahuah (God) is proven in the hymn, for it is precisely after the Formed humbled himself that *Elohim (God) also hath highly exalted him* (Philippians 2:9). The greater he was, the lower he went; the lower he went, the higher the Father raised him.'),
  -- thread: philippians-2-it-is-elohim-which-worketh-in-you-to-will-and-to-do-ezekiel-36
  ('canon', 'philippians', 2, 13, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). The new-covenant promise is that Yahuah (LORD) himself will work the obedience from within: *I will put my spirit within you, and cause you to walk in my statutes.* Paul speaks this fulfilled: *work out your own salvation with fear and trembling. For it is Elohim (God) which worketh in you both to will and to do of his good pleasure* (Philippians 2:12-13). The willing and the doing are Elohim''s (God''s) own work within — the Spirit causing the walk in the statutes, the obedience he gives and then crowns. This is not works-credential earning standing but the covenant-keeping Elohim (God) producing his will in his people.'),
  -- thread: philippians-2-lights-in-a-crooked-and-perverse-nation-deuteronomy-32-daniel-12
  ('canon', 'philippians', 2, 15, 'canon', 'deuteronomy', 32, 5, 'free', E'*They have corrupted themselves, their spot is not the spot of his children: they are a perverse and crooked generation.* (Deuteronomy 32:5). Moses'' song names the faithless among the people *a perverse and crooked generation.* Paul takes the very phrase: *that ye may be blameless and harmless, the sons of Elohim (God), without rebuke, in the midst of a crooked and perverse nation* (Philippians 2:15). The called-out are the true *sons of Elohim (God)* — *his children* whose spot is not the spot of the corrupt — set as light in the midst of the crooked and perverse, the faithful remnant within the generation.'),
  ('canon', 'philippians', 2, 15, 'canon', 'daniel', 12, 3, 'free', E'*And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* (Daniel 12:3). Daniel saw the wise *shine as the brightness of the firmament... as the stars for ever and ever.* Paul says the blameless sons *shine as lights in the world* (Philippians 2:15), *holding forth the word of life* (Philippians 2:16). The shining of Daniel''s wise — those who turn many to righteousness — is the shining of the children of Elohim (God) who hold forth the word of life in the midst of a crooked nation, lights set against the dark.'),
  -- thread: philippians-2-offered-upon-the-sacrifice-the-drink-offering-poured-out-numbers-28
  ('canon', 'philippians', 2, 17, 'canon', 'numbers', 28, 7, 'free', E'*And the drink offering thereof shall be the fourth part of an hin for the one lamb: in the holy place shalt thou cause the strong wine to be poured unto Yahuah (LORD) for a drink offering.* (Numbers 28:7). The Torah of the continual offering pours out wine *unto Yahuah (LORD) for a drink offering* alongside the lamb. Paul casts his own life in these very terms: *if I be offered upon the sacrifice and service of your faith, I joy, and rejoice with you all* (Philippians 2:17). His poured-out life is the drink offering atop the altar; the faith of the Philippians is the sacrifice, and Paul''s labour the wine poured over it unto Yahuah (LORD), with joy.'),
  ('canon', 'philippians', 2, 17, 'canon', 'exodus', 29, 40, 'free', E'*And with the one lamb a tenth deal of flour mingled with the fourth part of an hin of beaten oil; and the fourth part of an hin of wine for a drink offering.* (Exodus 29:40). The consecration offering joined to the daily lamb *the fourth part of an hin of wine for a drink offering* — the wine poured out for a sweet savour. Paul names his life that poured-out wine: *if I be offered upon the sacrifice and service of your faith, I joy, and rejoice with you all* (Philippians 2:17). His being *offered* is the drink offering of Exodus, his life spent over the sacrifice of their faith as the wine poured beside the lamb.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s231_ph02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s231_ph02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45',
       E'Every knee shall bow: the Formed emptied himself and was exalted by the Father (Isaiah 45)',
       E'*Let this mind be in you, which was also in HaMashiach Yahusha (Christ Jesus): Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God): But made himself of no reputation, and took upon him the form of a servant... he humbled himself, and became obedient unto death, even the death of the cross* (Philippians 2:5-8). The hymn is the descent of the Formed — the Son drawn out of the Formless Father, who bears the Father''s own glory. The *form of Elohim* he was in is the divine glory he shares as the One brought forth, named in the twin letter: *Who is the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15); *by him were all things created* (Colossians 1:16); *in him dwelleth all the fulness of the Godhead bodily* (Colossians 2:9). The Hebrew library beheld the same derived glory in Wisdom: *the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty* (Wisdom 7:25), *the brightness of the everlasting light... and the image of his goodness* (Wisdom 7:26) — the brightness flowing FROM the light, the image OF his goodness, never a second God beside the Father. Yet *equal with Elohim* is the very thing the Formed *thought it not robbery* to hold — he did not clutch at it; he laid it down. He took *the form of a servant,* the Servant of Isaiah *brought as a lamb to the slaughter* (Isaiah 53:7), *cut off out of the land of the living* (Isaiah 53:8), obedient unto the death of the cross. Then comes the turn, and it is the FATHER who acts: *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name: That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth; And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father* (Philippians 2:9-11). The Name above every name is the Father''s own Name (YHWH) placed upon the Son; and the bowing of every knee is the oath Yahuah (LORD) swore by himself: *I have sworn by myself, the word is gone out of my mouth in righteousness, and shall not return, That unto me every knee shall bow, every tongue shall swear* (Isaiah 45:23). The knee bows to the Name the Formed bears; Paul cites the same oath again — *As I live, saith Yahuah (Lord), every knee shall bow to me, and every tongue shall confess to Elohim (God)* (Romans 14:11). And mark the guard Paul keeps elsewhere on this exaltation: *he hath put all things under his feet. But... he is excepted, which did put all things under him* (1 Corinthians 15:27) — the Father is not subjected; the Father subjects all to the Son and renders him the Name. The whole movement ends not in the Son''s self-glory but *to the glory of Elohim (God) the Father.* This is the Formed Son, ordered under the Father — emptied, obedient, exalted BY the Father, bearing the Name, every knee bowing to the Father''s glory. Not a co-equal-persons proof-text, not a modalist collapse of Father into Son, not a created or mere-man Christology: the One brought forth from the Formless, who carried the divine glory, laid it down, and was lifted up by the hand of the One who sent him.',
       sv.verse_id, ev.verse_id, 'extras', 7585
  FROM _s231_ph02_lookup sv, _s231_ph02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-2-let-each-esteem-other-better-the-greater-humble-thyself-sirach-3',
       E'Let each esteem other better: the greater thou art, the more humble thyself (Sirach 3)',
       E'Paul commands the mind that the hymn will embody: *Let nothing be done through strife or vainglory; but in lowliness of mind let each esteem other better than themselves* (Philippians 2:3). The wisdom of the library taught the same descent: *The greater you are, the more humble thyself, and you shall find favour before Yahuah (God)* (Sirach 3:18). The way up is down; favour before Yahuah (God) is found by the one who lowers himself. And the greatest of all walked it furthest — the Formed who *made himself of no reputation* and *humbled himself, and became obedient unto death, even the death of the cross* (Philippians 2:7-8). Sirach''s rule is proven in the hymn: it is precisely after the Formed humbled himself that *Elohim (God) also hath highly exalted him* (Philippians 2:9). The greater he was, the lower he went; the lower he went, the higher the Father raised him. So the called-out are to esteem one another better, walking the same downward road that ends in the Father''s exalting hand.',
       sv.verse_id, ev.verse_id, 'extras', 7588
  FROM _s231_ph02_lookup sv, _s231_ph02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-2-it-is-elohim-which-worketh-in-you-to-will-and-to-do-ezekiel-36',
       E'It is Elohim which worketh in you both to will and to do (Ezekiel 36)',
       E'*Wherefore, my beloved, as ye have always obeyed... work out your own salvation with fear and trembling. For it is Elohim (God) which worketh in you both to will and to do of his good pleasure* (Philippians 2:12-13). The working-out is real obedience, but its source is Elohim (God) himself working within — the new-covenant promise Ezekiel spoke: *A new heart also will I give you, and a new spirit will I put within you... And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:26-27). The will and the deed are Yahuah''s (LORD''s) own work in his people — the Spirit causing them to walk in the statutes, the obedience he gives and then crowns. This is no works-credential earning standing before Elohim (God); it is the covenant-keeping Elohim (God) producing his good pleasure from within, so that the obedience the people *do* is the obedience he himself *worketh.* The keeping of the judgments is not abolished but written on the heart and wrought by the Spirit.',
       sv.verse_id, ev.verse_id, 'free', 7591
  FROM _s231_ph02_lookup sv, _s231_ph02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-2-lights-in-a-crooked-and-perverse-nation-deuteronomy-32-daniel-12',
       E'Blameless sons shining as lights in a crooked and perverse nation (Deuteronomy 32, Daniel 12)',
       E'*That ye may be blameless and harmless, the sons of Elohim (God), without rebuke, in the midst of a crooked and perverse nation, among whom ye shine as lights in the world; Holding forth the word of life* (Philippians 2:15-16). Paul lifts the phrase straight from the song of Moses, which named the faithless among the people *a perverse and crooked generation* whose *spot is not the spot of his children* (Deuteronomy 32:5). The called-out are the true *sons of Elohim (God)* — his children — set as light in the midst of the crooked and perverse, the faithful remnant within the generation. And their shining is the shining Daniel saw at the end: *they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* (Daniel 12:3). The blameless sons who *shine as lights in the world,* holding forth the word of life, are Daniel''s wise — those who turn many to righteousness, set as stars against the dark of a crooked nation.',
       sv.verse_id, ev.verse_id, 'free', 7594
  FROM _s231_ph02_lookup sv, _s231_ph02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-2-offered-upon-the-sacrifice-the-drink-offering-poured-out-numbers-28',
       E'Offered upon the sacrifice of your faith: the drink offering poured out (Numbers 28, Exodus 29)',
       E'*Yea, and if I be offered upon the sacrifice and service of your faith, I joy, and rejoice with you all* (Philippians 2:17). Paul casts his own life in the language of the Torah''s continual offering — the drink offering poured out beside the daily lamb. *In the holy place shalt thou cause the strong wine to be poured unto Yahuah (LORD) for a drink offering* (Numbers 28:7); *the fourth part of an hin of wine for a drink offering... for a sweet savour, an offering made by fire unto Yahuah (LORD)* (Exodus 29:40-41). The faith of the Philippians is the sacrifice on the altar; Paul''s poured-out life is the wine poured over it, *offered* unto Yahuah (LORD) as the drink offering atop the lamb. He does not grieve the pouring-out — *I joy, and rejoice with you all* — for a life spent over the sacrifice of their faith is a sweet savour, the drink offering of the Torah fulfilled in a servant poured out for the gathered.',
       sv.verse_id, ev.verse_id, 'free', 7597
  FROM _s231_ph02_lookup sv, _s231_ph02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=2 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 45:23 — *unto me every knee shall bow* Yahuah''s (LORD''s) own oath; *at the name of Yahusha (Jesus) every knee should bow* (Philippians 2:10), the knee bowing to the Name the Formed bears.'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 45:23 — *every tongue shall swear* the second half of the oath; *every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father* (Philippians 2:11).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:7 — *brought as a lamb to the slaughter... so he openeth not his mouth* the obedient Servant; the Formed *took upon him the form of a servant* (Philippians 2:7).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 53:8 — *cut off out of the land of the living... for the transgression of my people* the Servant''s death; the Formed *became obedient unto death, even the death of the cross* (Philippians 2:8).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 14:11 — *As I live, saith Yahuah (Lord), every knee shall bow to me* the same Isaiah-45 oath; the twin of *every knee should bow... every tongue should confess* (Philippians 2:10-11).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=14 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Corinthians 15:27 — *he is excepted, which did put all things under him* the Father not subjected; the Father *highly exalted him, and given him a name which is above every name* (Philippians 2:9).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Colossians 1:15 — *the image of the invisible Elohim (God), the firstborn of every creature* the Formed who shows the unseen Father; *being in the form of Elohim (God)* (Philippians 2:6).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Colossians 1:16 — *by him were all things created... all things were created by him, and for him* the same scope as the every-knee, *things in heaven, and things in earth* (Philippians 2:10).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Colossians 2:9 — *in him dwelleth all the fulness of the Godhead bodily* the Father''s fulness dwelling in the Formed; the *form of Elohim (God)* made plain (Philippians 2:6).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'Wisdom 7:25 — *the breath of the power of Yahuah (God)... flowing from the glory of the Almighty* derived glory, brought forth from the One; the Formed *in the form of Elohim (God)* (Philippians 2:6).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 11, E'Wisdom 7:26 — *the brightness of the everlasting light... and the image of his goodness* the radiance OF the Father, the Formed witness; the *form of Elohim (God)* (Philippians 2:6).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-every-knee-shall-bow-the-formed-emptied-and-exalted-by-the-father-isaiah-45'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-2-let-each-esteem-other-better-the-greater-humble-thyself-sirach-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach 3:18 — *The greater you are, the more humble thyself, and you shall find favour before Yahuah (God)* the wisdom of lowering; *let each esteem other better than themselves* (Philippians 2:3).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-let-each-esteem-other-better-the-greater-humble-thyself-sirach-3'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 3:18 — *the more humble thyself, and you shall find favour before Yahuah (God)* proven in the hymn: the Formed *humbled himself* (Philippians 2:8) and so the Father *highly exalted him* (Philippians 2:9).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-let-each-esteem-other-better-the-greater-humble-thyself-sirach-3'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-2-it-is-elohim-which-worketh-in-you-to-will-and-to-do-ezekiel-36
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* the obedience Yahuah (LORD) works from within; *it is Elohim (God) which worketh in you both to will and to do* (Philippians 2:13).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-it-is-elohim-which-worketh-in-you-to-will-and-to-do-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-2-lights-in-a-crooked-and-perverse-nation-deuteronomy-32-daniel-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:5 — *they are a perverse and crooked generation* the phrase Paul lifts; the sons of Elohim (God) shine *in the midst of a crooked and perverse nation* (Philippians 2:15).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-lights-in-a-crooked-and-perverse-nation-deuteronomy-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:3 — *they that be wise shall shine as the brightness of the firmament... as the stars for ever* the shining of the wise; the blameless sons *shine as lights in the world* (Philippians 2:15).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-lights-in-a-crooked-and-perverse-nation-deuteronomy-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-2-offered-upon-the-sacrifice-the-drink-offering-poured-out-numbers-28
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 28:7 — *the strong wine to be poured unto Yahuah (LORD) for a drink offering* the wine poured beside the lamb; *if I be offered upon the sacrifice... of your faith* (Philippians 2:17).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-offered-upon-the-sacrifice-the-drink-offering-poured-out-numbers-28'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=28 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 29:40 — *the fourth part of an hin of wine for a drink offering* the drink offering of the daily lamb; Paul''s life *offered upon the sacrifice and service of your faith* (Philippians 2:17).'
  FROM cross_reference_threads t, cross_references x, _s231_ph02_lookup sv, _s231_ph02_lookup tv
 WHERE t.slug='philippians-2-offered-upon-the-sacrifice-the-drink-offering-poured-out-numbers-28'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
