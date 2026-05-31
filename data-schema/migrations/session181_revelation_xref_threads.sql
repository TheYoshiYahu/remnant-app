-- =====================================================================
-- Session 181 migration — revelation-anchored cross-reference threads
-- =====================================================================
-- 17 threads with 204 member rows
-- Anchor: Revelation book — companion to any pre-existing
-- revelation-anchored threads from S74 / S110+. All threads at tier='free'.
--
-- Idempotent: every INSERT carries ON CONFLICT DO NOTHING.
-- Run via: psql "$DATABASE_URL" -f data-schema/migrations/session181_revelation_xref_threads.sql
-- =====================================================================

\echo 'Session 181 revelation migration starting...'
BEGIN;

-- Verse-lookup temp view scoped to this transaction.
CREATE TEMP VIEW _s181_revelation_lookup AS
SELECT b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug = 'canon';

-- ---------------------------------------------------------------------
-- Thread 1: like-the-son-of-adam-coming-with-the-clouds
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'like-the-son-of-adam-coming-with-the-clouds',
    E'Like the Son of Adam coming with the clouds',
    E'The opening vision of Revelation arrives in two beats. Verse 7 announces, in Daniel-7 cadence, that he cometh with the clouds and every eye shall see him — the Tanakh''s cloud-rider returning. Verse 13 is where the kaph-comparative appears explicitly: *one like the Son of Adam* in the midst of the seven candlesticks, preserving the *like* that Daniel''s vision preserved before it. The kaph at v.13 honors the incarnation truth — that Yahusha (Jesus) resembled mortal-man because he took on flesh — while keeping the named Standard in view: he remained the Formed cloud-rider, the One who rides the clouds of Yahuah (the LORD).\n\n*Behold, he cometh with clouds; and every eye shall see him, and they also which pierced him: and all kindreds of the earth shall wail because of him. Even so, Amen.* (Revelation 1:7)\n\n*And in the midst of the seven candlesticks one like the Son of Adam, clothed with a garment down to the foot, and girt about the paps with a golden girdle.* (Revelation 1:13)\n\nThe Daniel 7 vision is the source the seer is drawing from. Daniel''s *kbar enash* — *like a son of mortal-man* — comes with the clouds of heaven to the Ancient of Days and receives an everlasting kingdom. The kingdom is the diagnostic: an indestructible, everlasting dominion that *shall not pass away* belongs to Yahusha alone, never to a counterfeit. Read straight, the kaph at Revelation 1:13 appears to leave the identification open — and past commentary has reached for the open trajectories. The canon harmonized closes them. The voice in verses 10-11 is Yahuah''s (the LORD''s) own Alpha-and-Omega self-designation (v.8); the credentials in v.18 — *I am he that liveth, and was dead; and, behold, I am alive for evermore* — belong to Yahusha alone; the seven letters of Revelation 2-3 are his voice to the assemblies.\n\n*I beheld in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him. And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:13-14)\n\nThe same Formed One who rode the clouds in Psalm 104:3, who came riding on a swift cloud in Isaiah 19:1, who walked in the whirlwind in Nahum 1:3, is the one the seer sees in the midst of the candlesticks. The kaph teaches the reading discipline: a strict-literal reading of any single verse in isolation opens trajectories that do not survive when the whole of scripture is brought to bear. The Spirit harmonizes. The destination is Yahusha himself.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1001
  FROM _s181_revelation_lookup sv, _s181_revelation_lookup ev
 WHERE sv.book_slug = 'revelation' AND sv.chapter_number = 1 AND sv.verse_number = 7
   AND ev.book_slug = 'revelation' AND ev.chapter_number = 1 AND ev.verse_number = 18
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('revelation', 1, 7, 'daniel', 7, 13, 1, E'*He cometh with clouds* and *every eye shall see him* pick up Daniel 7:13''s cloud-rider vision; the kaph-comparative itself appears at Revelation 1:13 (*one like the Son of Adam*), not at v.7. Together they frame the same Person — the Formed cloud-rider who came in the flesh.'),
  ('revelation', 1, 7, 'zechariah', 12, 10, 2, E'*They also which pierced him* is Zechariah''s *they shall look upon me whom they pierced, and they shall mourn for him* — the *they* who pierced and the *they* who look are the house of David and the inhabitants of Yerushalayim (Jerusalem), the gathered seed mourning the Yahusha (Jesus) they did not recognize at the first coming.'),
  ('revelation', 1, 13, 'daniel', 7, 13, 3, E'Daniel''s *kbar enash* (Aramaic, *like a son of mortal-man*) is the exact construction Revelation 1:13''s *homoion huion anthrōpou* picks up; the kaph in both is incarnation-honoring, the named Standard is Yahusha (Jesus).'),
  ('revelation', 1, 13, 'daniel', 10, 5, 4, E'The girded figure with eyes as lamps of fire, feet like polished brass, and a voice like the voice of a multitude — Daniel 10''s vision is the closest visual parallel; the framework reads both as the Formed One, the cloud-rider who became flesh in Yahusha (Jesus).'),
  ('revelation', 1, 14, 'daniel', 7, 9, 5, E'The *head and his hairs were white like wool, as white as snow* shares the imagery Daniel 7:9 gave the Ancient of Days — the Father shown in vision-form for the kingdom-transfer scene. The Formed One bears the visible imagery of the Formless because the Son proceeds from the Father; the shared imagery does not collapse the persons, and Daniel 7:13''s *one like the Son of Adam* coming TO the Ancient of Days keeps them distinct in the same vision.'),
  ('revelation', 1, 8, 'isaiah', 44, 6, 6, E'*I am Alpha and Omega, the beginning and the ending* answers Isaiah''s *I am the first, and I am the last; and beside me there is no Elohim (God)* — the self-designation is Yahuah''s (the LORD''s) and the figure speaking is Yahusha (Jesus); the Formless and the Formed in unbroken relationship.'),
  ('revelation', 1, 17, 'isaiah', 41, 4, 7, E'*Fear not; I am the first and the last* in the seer''s vision matches Yahuah''s (the LORD''s) *I Yahuah (the LORD), the first, and with the last; I am he* — the Formed One bears the title because he proceeds from the Formless.'),
  ('revelation', 1, 18, 'hosea', 13, 14, 8, E'*I have the keys of hell and of death* fulfills Yahuah''s (the LORD''s) *I will ransom them from the power of the grave; I will redeem them from death* — the keys are Yahusha''s (Jesus''s) because the ransom of the grave belongs to him.'),
  ('revelation', 1, 7, 'matthew', 24, 30, 9, E'Yahusha''s (Jesus''s) own Olivet announcement — *they shall see the Son of Adam coming in the clouds of heaven* — is the gospel pickup of the same Daniel 7 vision; the seer is hearing what the Messiah preached.'),
  ('revelation', 1, 13, 'ezekiel', 1, 26, 10, E'The throne-vision figure with the appearance of fire from the loins upward and the loins downward is the Formed One in the prophet''s seeing; the Revelation 1:13 description draws on the same vocabulary of the same Person.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:like-the-son-of-adam-coming-with-the-clouds | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_revelation_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_revelation_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for like-the-son-of-adam-coming-with-the-clouds.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'like-the-son-of-adam-coming-with-the-clouds'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:like-the-son-of-adam-coming-with-the-clouds | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 2: i-know-thy-works-and-names-blotted-out
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'i-know-thy-works-and-names-blotted-out',
    E'I know thy works — the seven letters and the names-only-blotted-out warning',
    E'The seven letters to the assemblies are the Messiah''s own diagnostic of his people, and the structure of each letter carries the Tanakh covenant pattern: *I know thy works,* the commendation where there is one, the rebuke where there is one, the call to repentance, and the promise to the overcomer. The standard is Torah-walking, the consequence-system is real, and the warning the Messiah gives at Sardis names the architecture every other letter assumes.\n\n*He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* (Revelation 3:5)\n\nThe verse cannot be read as a threat to the tares. Yahuah (God) does not threaten to remove what was never written. The threat is to the wheat — to names that *are* in the book of life, written from the foundation of the world, who walk into lawlessness and have their names blotted out for it.\n\n*And Yahuah (the LORD) said unto Mosheh (Moses), Whosoever hath sinned against me, him will I blot out of my book.* (Exodus 32:33)\n\n*Let them be blotted out of the book of the living, and not be written with the righteous.* (Psalm 69:28)\n\nThe seven letters apply the same standard in seven local registers. *I know thy works* is the operative verdict in every letter (Revelation 2:2, 2:9, 2:13, 2:19, 3:1, 3:8, 3:15) — not *I know thy belief,* not *I know thy confession,* not *I know thy doctrinal subscription.* The new covenant''s promise — that Yahuah (the LORD) puts his Ruach (Spirit) within his people and *causes them to walk in his statutes* — produces works, and the works are what the Messiah inspects. The post-harvest sifting the prophets named, where the rod of Ezekiel 20 *purges out the rebels* from among the gathered, is the same sifting Revelation 3:5 names at the personal scale — the overcomer is not blotted out, the unfruitful gathered one is.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1002
  FROM _s181_revelation_lookup sv, _s181_revelation_lookup ev
 WHERE sv.book_slug = 'revelation' AND sv.chapter_number = 2 AND sv.verse_number = 1
   AND ev.book_slug = 'revelation' AND ev.chapter_number = 3 AND ev.verse_number = 22
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('revelation', 3, 5, 'exodus', 32, 33, 1, E'*I will not blot out his name out of the book of life* is the direct inversion of Yahuah''s (the LORD''s) Sinai verdict — *whosoever hath sinned against me, him will I blot out* — and the warning is to wheat, never to tares; names that were never written cannot be blotted out.'),
  ('revelation', 3, 5, 'psalms', 69, 28, 2, E'*Let them be blotted out of the book of the living* is the Davidic articulation of the same blotting-out principle the Messiah applies to the overcomer at Sardis.'),
  ('revelation', 2, 7, 'genesis', 2, 9, 3, E'*To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* restores access to the tree Adam was barred from; the overcomer is returned to the garden the seed of Adam was made for.'),
  ('revelation', 2, 14, 'numbers', 25, 1, 4, E'The doctrine of Balaam at Pergamos is the Numbers 25 scandal — Israel committing whoredom with the daughters of Moav (Moab) and eating things sacrificed to idols; the Messiah names the same compromise reactivated in the Pergamos assembly.'),
  ('revelation', 2, 20, '1-kings', 16, 31, 5, E'Jezebel at Thyatira is the Tanakh queen who set up the Baal-worship in Israel; the Messiah names a teaching-spirit in the assembly carrying the same name because it carries the same work.'),
  ('revelation', 2, 9, 'isaiah', 65, 15, 6, E'*Them which say they are Yahudim (Jews), and are not, but are the synagogue of satan* picks up Isaiah''s *ye shall leave your name for a curse unto my chosen* — the diagnostic is the sons-of-Belial pattern operating from within the covenant community, not a Jew-hatred read against the covenant people as a whole.'),
  ('revelation', 3, 9, 'isaiah', 60, 14, 7, E'*Behold, I will make them to come and worship before thy feet, and to know that I have loved thee* echoes Isaiah''s *The sons also of them that afflicted thee shall come bending unto thee* — the same vindication-architecture, in the same place, addressed to the Philadelphia overcomer.'),
  ('revelation', 2, 17, 'exodus', 16, 33, 8, E'*The hidden manna* is the manna laid up before Yahuah (the LORD) in the ark — the bread of the wilderness preserved as testimony, given to the overcomer as the eschatological reward.'),
  ('revelation', 3, 12, 'ezekiel', 48, 35, 9, E'*I will write upon him the name of my Elohim (God), and the name of the city of my Elohim (God), which is new Yerushalayim (Jerusalem)* lands on Yahuah Shammah (The LORD is there) — the city''s name in Ezekiel''s vision is the name the Messiah inscribes on the overcomer at Philadelphia.'),
  ('revelation', 3, 14, 'proverbs', 8, 22, 10, E'*The beginning of the creation of Elohim (God)* — the Laodicean self-designation of the Messiah picks up the Proverbs wisdom-Christology of the Formed One who was set up from everlasting, the expressed Word drawn from the Formless before the works of old.'),
  ('revelation', 2, 26, 'psalms', 2, 8, 11, E'*He shall rule them with a rod of iron* is the Davidic enthronement-psalm given to the overcomer as shared authority in the appointed reign — the rod of iron is Messianic, and the overcomer reigns with him.'),
  ('revelation', 2, 11, 'daniel', 12, 2, 12, E'*Shall not be hurt of the second death* presupposes Daniel''s two-resurrection architecture — *some to everlasting life, and some to shame and everlasting contempt* — the first resurrection is for the worthy of the seed, the second is the judgment Revelation 11:18 and Revelation 20:11-15 show from two angles.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:i-know-thy-works-and-names-blotted-out | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_revelation_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_revelation_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for i-know-thy-works-and-names-blotted-out.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'i-know-thy-works-and-names-blotted-out'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:i-know-thy-works-and-names-blotted-out | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 3: lamb-as-it-had-been-slain-on-the-throne
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'lamb-as-it-had-been-slain-on-the-throne',
    E'The Lamb as it had been slain — the Passover-and-Suffering-Servant on the throne',
    E'The throne-room vision in Revelation 5 puts a slain Lamb at the center of the universe, and the Tanakh substance the image is carrying is Genesis 22, Exodus 12, Isaiah 53, and Psalm 22 all at once. The Lamb is not a metaphor reached for at the end of a New Testament theological argument. The Lamb is the figure the Tanakh laid down from Genesis forward and the figure the seer is now shown enthroned in the place where the Tanakh promised he would stand.\n\n*And I beheld, and, lo, in the midst of the throne and of the four beasts, and in the midst of the elders, stood a Lamb as it had been slain, having seven horns and seven eyes, which are the seven Spirits of Elohim (God) sent forth into all the earth.* (Revelation 5:6)\n\n*And Avraham (Abraham) said, My son, Elohim (God) will provide himself a lamb for a burnt offering: so they went both of them together.* (Genesis 22:8)\n\nThe Akedah on Moriah is the Tanakh''s first explicit *Elohim (God) will provide himself a lamb* — Yitschaq (Isaac) carries the wood up the mountain, the father binds the son, and the substitute is provided. The image lays down the architecture: the lamb provided by Elohim (God) himself, given for the son, on the mountain of Yahuah (the LORD).\n\n*Your lamb shall be without blemish, a male of the first year... And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you.* (Exodus 12:5, 13)\n\nPassover lays the next layer — the blood of the lamb on the doorpost is the sign the destroyer reads, the household is sheltered, the deliverance is from the death-judgment falling on the land. Isaiah 53 lays the third layer, where the suffering Servant is *brought as a lamb to the slaughter* and bears the iniquity of many. Psalm 22 lays the fourth, with the pierced hands and feet, the parted garments, and the cast lots. By the time the seer sees the Lamb on the throne in Revelation 5, every motif the Tanakh laid down is gathered into the figure, and the song the elders sing — *thou hast redeemed us to Elohim (God) by thy blood out of every kindred, and tongue, and people, and nation* — is the gathering-from-among-the-nations the prophets named, accomplished by the blood the Tanakh prefigured.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1003
  FROM _s181_revelation_lookup sv, _s181_revelation_lookup ev
 WHERE sv.book_slug = 'revelation' AND sv.chapter_number = 5 AND sv.verse_number = 1
   AND ev.book_slug = 'revelation' AND ev.chapter_number = 5 AND ev.verse_number = 14
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('revelation', 5, 6, 'genesis', 22, 8, 1, E'*Elohim (God) will provide himself a lamb for a burnt offering* is the Akedah''s lay-down of the architecture the Lamb on the throne fulfills — provided by Elohim (God), given for the son, on the mountain.'),
  ('revelation', 5, 6, 'exodus', 12, 5, 2, E'The lamb *without blemish, a male of the first year* is the Passover-lamb specification the slain Lamb of Revelation 5 satisfies — the deliverance-architecture the blood enacts.'),
  ('revelation', 5, 6, 'isaiah', 53, 7, 3, E'*He is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth* is the Tanakh-prefiguring of the slain Lamb who stands again.'),
  ('revelation', 5, 9, 'psalms', 22, 27, 4, E'*Thou hast redeemed us to Elohim (God) by thy blood out of every kindred, and tongue, and people, and nation* echoes the Davidic *all the ends of the world shall remember and turn unto Yahuah (the LORD): and all the kindreds of the nations shall worship before thee* — the gathering of the scattered seed from the territories of every nation.'),
  ('revelation', 5, 5, 'genesis', 49, 9, 5, E'*The Lion of the tribe of Yahudah (Judah), the Root of David* is the patriarchal Genesis blessing — *Yahudah (Judah) is a lion''s whelp* — and the *sceptre shall not depart from Yahudah (Judah)... until Shiloh come.* The Lion and the Lamb are the same figure: the Tanakh kingship-line and the Tanakh sacrifice-line meeting in Yahusha (Jesus).'),
  ('revelation', 5, 5, 'isaiah', 11, 1, 6, E'The Root of David is *a rod out of the stem of Jesse, and a Branch out of his roots* — the Messianic-shoot prophecy the Lion of Yahudah (Judah) embodies.'),
  ('revelation', 5, 6, 'zechariah', 4, 10, 7, E'*The seven eyes of Yahuah (the LORD), which run to and fro through the whole earth* are the same seven eyes on the Lamb — the Formed One who searches the earth, now seen on the throne.'),
  ('revelation', 5, 8, 'psalms', 141, 2, 8, E'*The prayers of saints* held in golden vials echoes *Let my prayer be set forth before thee as incense* — the prayer-as-incense imagery the temple ritual carried, now performed by the elders in the throne-room.'),
  ('revelation', 5, 10, 'exodus', 19, 6, 9, E'*Hast made us unto our Elohim (God) kings and priests: and we shall reign on the earth* is the Sinai promise — *ye shall be unto me a kingdom of priests, and an holy nation* — fulfilled in the destination of the gathered remnant. The reign is on the earth; the office is priestly to the nations left alive after the dreadful day; the relationship begins *then,* not *now.*'),
  ('revelation', 5, 12, 'isaiah', 53, 12, 10, E'*Worthy is the Lamb that was slain to receive power* answers Isaiah''s *I will divide him a portion with the great, and he shall divide the spoil with the strong; because he hath poured out his soul unto death* — the worthiness flows from the pouring-out.'),
  ('revelation', 5, 6, 'genesis', 22, 13, 11, E'The ram caught in the thicket — the substitute Yahuah (the LORD) provided in Yitschaq''s (Isaac''s) place — is the Tanakh-prefiguring of the Lamb on the throne who takes the death the seed of promise was due.'),
  ('revelation', 5, 9, 'daniel', 7, 14, 12, E'*Thou hast redeemed us... out of every kindred, and tongue, and people, and nation* picks up Daniel''s *all people, nations, and languages, should serve him* — the everlasting kingdom that the Ancient of Days transfers to the Son in Daniel 7 is the kingdom the redeemed reign in.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:lamb-as-it-had-been-slain-on-the-throne | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_revelation_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_revelation_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for lamb-as-it-had-been-slain-on-the-throne.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'lamb-as-it-had-been-slain-on-the-throne'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:lamb-as-it-had-been-slain-on-the-throne | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 4: four-horsemen-and-the-four-sore-judgments
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'four-horsemen-and-the-four-sore-judgments',
    E'The four horsemen and the four sore judgments of Yahuah (the LORD)',
    E'The four horsemen who ride out at the opening of the first four seals are not a Reformation invention or a dispensational chart''s beginning. They are Zechariah''s vision of the four horses going forth into all the earth, paired with Ezekiel''s four sore judgments — sword, famine, beasts, and pestilence — that Yahuah (the LORD) sends against Yerushalayim (Jerusalem) for her abominations. The seer is shown the Tanakh''s own architecture of the day of Yahuah (the LORD), released for the close of the age.\n\n*In the four and twentieth day of the eleventh month... I saw by night, and behold a man riding upon a red horse, and he stood among the myrtle trees that were in the bottom; and behind him were there red horses, speckled, and white. Then said I, O my lord, what are these? And the angel that talked with me said unto me, I will shew thee what these be.* (Zechariah 1:7-9)\n\n*And the angel answered and said unto me, These are the four spirits of the heavens, which go forth from standing before the Sovereign of all the earth.* (Zechariah 6:5)\n\nZechariah sees the four horses going forth. The seer of Revelation sees the same architecture released at the opening of the seals. The colors carry: red for the bloodshed-and-war horse, black for the famine-horse with the balances, pale for the death-horse with hell following. The seer is not introducing new imagery — he is naming the four-judgment release Yahuah (the LORD) has always held in his hand.\n\n*For thus saith Adonai Yahuah (the Lord GOD); How much more when I send my four sore judgments upon Yerushalayim (Jerusalem), the sword, and the famine, and the noisome beast, and the pestilence, to cut off from it man and beast?* (Ezekiel 14:21)\n\nThe four sore judgments line up to the four horsemen: the sword on the red horse, the famine on the black, the beast and the pestilence on the pale (and on the *hell* that follows it). The day of Yahuah (the LORD) the Tanakh prophets named — Joel''s *great and terrible day,* Zephaniah''s *day of wrath, a day of trouble and distress, a day of wasteness and desolation,* Isaiah''s *day of Yahuah (the LORD)* — is the day the four horsemen ride out to enact.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1004
  FROM _s181_revelation_lookup sv, _s181_revelation_lookup ev
 WHERE sv.book_slug = 'revelation' AND sv.chapter_number = 6 AND sv.verse_number = 1
   AND ev.book_slug = 'revelation' AND ev.chapter_number = 6 AND ev.verse_number = 8
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('revelation', 6, 1, 'zechariah', 1, 8, 1, E'*A man riding upon a red horse* — and behind him red, speckled, and white horses — is the Tanakh-source for the four-horseman vision; the seer of Revelation receives the same architecture at the opening of the seals.'),
  ('revelation', 6, 5, 'zechariah', 6, 2, 2, E'Zechariah 6''s four chariots with red, black, white, and grisled-bay horses are the immediate parallel; the colors and the four-fold pattern carry across.'),
  ('revelation', 6, 8, 'ezekiel', 14, 21, 3, E'*Power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death, and with the beasts of the earth* is the verbatim release of Ezekiel''s four sore judgments — sword, famine, beasts, pestilence — held in Yahuah''s (the LORD''s) hand for the day of his wrath.'),
  ('revelation', 6, 12, 'joel', 2, 31, 4, E'*The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (the LORD) come* is the direct Tanakh-source of the sixth-seal cosmic-sign vocabulary; Joel''s *great and terrible day* is the day the seals release.'),
  ('revelation', 6, 14, 'isaiah', 34, 4, 5, E'*The heavens departed as a scroll when it is rolled together* echoes Isaiah''s *all the host of heaven shall be dissolved, and the heavens shall be rolled together as a scroll* — the day-of-Yahuah (the LORD) cosmic-undoing vocabulary.'),
  ('revelation', 6, 15, 'isaiah', 2, 19, 6, E'*The kings of the earth, and the great men, and the rich men... hid themselves in the dens and in the rocks of the mountains* picks up Isaiah''s *they shall go into the holes of the rocks, and into the caves of the earth, for fear of Yahuah (the LORD)* — the same hiding-from-the-day in both.'),
  ('revelation', 6, 16, 'hosea', 10, 8, 7, E'*Fall on us, and hide us from the face of him that sitteth on the throne* is verbatim Hosea — *They shall say to the mountains, Cover us; and to the hills, Fall on us* — the day-of-Yahuah (the LORD) terror named identically.'),
  ('revelation', 6, 17, 'joel', 2, 11, 8, E'*The great day of his wrath is come; and who shall be able to stand?* echoes Joel — *the day of Yahuah (the LORD) is great and very terrible; and who can abide it?* — the rhetorical question is the prophets'' own.'),
  ('revelation', 6, 9, 'genesis', 4, 10, 9, E'*I saw under the altar the souls of them that were slain... they cried with a loud voice, saying, How long, O Sovereign, holy and true, dost thou not judge and avenge our blood?* picks up Abel''s *the voice of thy brother''s blood crieth unto me from the ground* — the crying-blood-from-under-the-altar pattern.'),
  ('revelation', 6, 10, 'zechariah', 1, 12, 10, E'*How long?* is the same question the angel of Yahuah (the LORD) asks in Zechariah''s first vision — *O Yahuah (the LORD) Tseva''ot (of hosts), how long wilt thou not have mercy on Yerushalayim (Jerusalem)?* — the *how long* of the slain saints continues the *how long* of the angelic intercessor.'),
  ('revelation', 6, 8, 'jeremiah', 15, 2, 11, E'The four destinations — *death... sword... famine... captivity* — are Jeremiah''s four-judgment categories, and Jeremiah''s *four kinds, saith Yahuah (the LORD): the sword to slay, and the dogs to tear, and the fowls of the heaven, and the beasts of the earth, to devour and destroy* is the same architecture.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:four-horsemen-and-the-four-sore-judgments | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_revelation_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_revelation_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for four-horsemen-and-the-four-sore-judgments.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'four-horsemen-and-the-four-sore-judgments'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:four-horsemen-and-the-four-sore-judgments | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 5: 144000-sealed-of-the-twelve-tribes
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    '144000-sealed-of-the-twelve-tribes',
    E'The 144,000 sealed of the twelve tribes — the gathering takes literal names',
    E'The 144,000 are not a spiritualized category. They are sealed by tribe and counted by tribe — twelve thousand from Yahudah (Judah), twelve thousand from Reuben, twelve thousand from Gad, and on through the list. The seer is not improvising. He is showing the twelve-tribe-restoration architecture the prophets named, the gathering of the scattered seed of Yashar''el (Israel) the Tanakh promised, being executed at the close of the age. The Christian habit of dissolving the twelve into *the church* — every-believer-from-every-people — collapses the specificity scripture insists on. The Hebrew Roots habit of dissolving the twelve into *whoever Torah-keeps* does the same collapse in a different costume. The text refuses both.\n\n*And I heard the number of them which were sealed: and there were sealed an hundred and forty and four thousand of all the tribes of the children of Yashar''el (Israel). Of the tribe of Yahudah (Judah) were sealed twelve thousand. Of the tribe of Reuben were sealed twelve thousand. Of the tribe of Gad were sealed twelve thousand...* (Revelation 7:4-5)\n\nThe sealing-on-the-foreheads picks up Ezekiel 9 directly — the angel with the writer''s inkhorn who goes through Yerushalayim (Jerusalem) and sets a mark on the foreheads of *the men that sigh and that cry for all the abominations that be done in the midst thereof.* The marked are preserved through the judgment that destroys the unmarked. The same mark, the same architecture, applied at the close of the age to the gathered seed.\n\n*And Yahuah (the LORD) said unto him, Go through the midst of the city, through the midst of Yerushalayim (Jerusalem), and set a mark upon the foreheads of the men that sigh and that cry for all the abominations that be done in the midst thereof... but come not near any man upon whom is the mark; and begin at my sanctuary.* (Ezekiel 9:4, 6)\n\nThe tribes are named because the tribes are real. The number 144,000 carries the completeness-symbolism of twelve-by-twelve-by-a-thousand; the substance the number represents is literal — the gathered seed of the twelve tribes by paternal blood, named tribe-by-tribe, not a spiritualized stand-in for the church or the Torah-keeping community. The next paragraph of the chapter shows the great multitude no man can number, which is the same gathered seed seen from another angle — but the framework holds the two readings together: the twelve thousand from each tribe is the architectural skeleton, and the *multitude which no man could number* is the same gathered seed in its territorial dispersion across every nation where Yahuah (the LORD) scattered them. The names were written in the Lamb''s book from the foundation of the world; the sealing in time is the revealing of what was already true.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1005
  FROM _s181_revelation_lookup sv, _s181_revelation_lookup ev
 WHERE sv.book_slug = 'revelation' AND sv.chapter_number = 7 AND sv.verse_number = 1
   AND ev.book_slug = 'revelation' AND ev.chapter_number = 7 AND ev.verse_number = 8
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('revelation', 7, 3, 'ezekiel', 9, 4, 1, E'The sealing-on-the-foreheads of the servants of Elohim (God) is the same mark-on-the-foreheads Ezekiel 9 puts on the men who sigh and cry for the abominations; the marked are preserved through the judgment-execution.'),
  ('revelation', 7, 4, 'ezekiel', 37, 21, 2, E'*The children of Yashar''el (Israel)* — the explicit identification of the sealed — is the same body Ezekiel names: *I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land.*'),
  ('revelation', 7, 5, 'genesis', 49, 1, 3, E'The twelve-tribe naming structure picks up Ya''aqov''s (Jacob''s) patriarchal blessing-by-tribe in Genesis 49; the tribal identities the seer enumerates are the same tribal identities the patriarch blessed at the founding of the people.'),
  ('revelation', 7, 5, 'numbers', 1, 20, 4, E'The tribe-by-tribe census in Numbers 1 is the Tanakh''s own structural pattern of counting Yashar''el (Israel) tribe-by-tribe; the seer of Revelation receives the same architecture as the closing seal of the people.'),
  ('revelation', 7, 5, 'isaiah', 11, 11, 5, E'*Yahuah (the LORD) shall set his hand again the second time to recover the remnant of his people... and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* — the second-gathering prophecy is the architecture the 144,000 sealing fulfills at the close of the age.'),
  ('revelation', 7, 1, 'zechariah', 6, 5, 6, E'The four angels holding the four winds are the same *four spirits of the heavens, which go forth from standing before the Sovereign of all the earth* — the wind-and-judgment architecture withheld until the sealing is complete.'),
  ('revelation', 7, 3, 'exodus', 12, 13, 7, E'*Till we have sealed the servants of our Elohim (God) in their foreheads* picks up the Passover-blood-on-the-doorpost pattern — the destroyer passes over the marked, and the mark on the foreheads is the second-Exodus blood-token.'),
  ('revelation', 7, 4, 'jeremiah', 31, 1, 8, E'*At the same time, saith Yahuah (the LORD), will I be the Elohim (God) of all the families of Yashar''el (Israel), and they shall be my people... He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* — the all-the-families restoration is the same all-twelve-tribes sealing the seer enumerates.'),
  ('revelation', 7, 5, 'ezekiel', 48, 1, 9, E'Ezekiel''s tribal-allotment in the restored land — the portion for Dan, for Asher, for Naphtali, for Manasheh (Manasseh), through every tribe — is the same twelve-tribe structure the seer''s sealing presupposes. The framework refuses the spiritualization in both directions.'),
  ('revelation', 7, 8, '1-chronicles', 5, 1, 10, E'The non-standard tribal list at Revelation 7 (Yoseph in place of Ephraim, Levi included, Dan absent) tracks Tanakh complexities — Yoseph''s double-portion through Manasheh (Manasseh) and Ephraim, Levi''s priestly carve-out — that 1 Chronicles 5 retains; the framework reads the list as scripture''s own internal cross-checks, not as a flattening of identity.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:144000-sealed-of-the-twelve-tribes | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_revelation_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_revelation_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for 144000-sealed-of-the-twelve-tribes.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = '144000-sealed-of-the-twelve-tribes'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:144000-sealed-of-the-twelve-tribes | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 6: great-multitude-no-man-could-number
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'great-multitude-no-man-could-number',
    E'A great multitude no man could number — the scattered seed gathered from every nation',
    E'The chapter that begins with the 144,000 sealed of the twelve tribes does not switch subjects when it widens to the multitude no man could number. The Christian reading has long taken the second paragraph as a separate and larger group — *the church of every nation,* faith-grafted-pagans alongside the residual sealed-Israel. The framework reads the chapter as one body in two views. The 144,000 are the twelve-tribe architecture sealed by tribe-name. The great multitude is the same gathered seed seen from the angle of their territorial dispersion across the nations where Yahuah (the LORD) scattered them.\n\n*After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands.* (Revelation 7:9)\n\nThe dispersion is the prophets'' substance. Hosea named it: *the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered.* The seer hears the same uncountable substance and sees it gathered.\n\n*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10)\n\n*I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land.* (Ezekiel 37:21)\n\nThe cause-and-effect reversal the framework holds: these came out of the great tribulation, washed their robes, made them white in the blood of the Lamb — past-tense, completed action — because they were sons of the living Elohim (God) before the foundation of the world. Hearing did not make them; hearing revealed them. The white robes are not the credential of a faith-confession event grafting outsiders into a tree they were not from — the Hebrew-Roots *anyone-who-Torah-keeps-counts-as-Israel* substitution is the same architecture in a different costume and falls on the same diagnostic. The white robes are the destination of the journey the prophets named: gathered out of the nations, brought under the rod, brought into the bond of the new covenant, brought into the kingdom of priests. That priestly office — the office Adam was made for — is filled in the millennial reign on the earth (Revelation 5:10, Revelation 20:6), when the gathered seed ministers to the nations left alive after the dreadful day. The multitude before the throne is the gathering accomplished. The priestly relationship to the nations begins *then,* not *now.*',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1006
  FROM _s181_revelation_lookup sv, _s181_revelation_lookup ev
 WHERE sv.book_slug = 'revelation' AND sv.chapter_number = 7 AND sv.verse_number = 9
   AND ev.book_slug = 'revelation' AND ev.chapter_number = 7 AND ev.verse_number = 17
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('revelation', 7, 9, 'hosea', 1, 10, 1, E'*A great multitude, which no man could number* is the verbatim Hosea-substance — *the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered* — the scattered seed in their dispersion, gathered.'),
  ('revelation', 7, 9, 'ezekiel', 37, 21, 2, E'The multitude *of all nations, and kindreds, and people, and tongues* is the same gathered body Ezekiel names: *I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side.* The directional-formula is the gathering of the scattered, not the inclusion of the unrelated.'),
  ('revelation', 7, 9, 'isaiah', 49, 12, 3, E'*Behold, these shall come from far: and, lo, these from the north and from the west; and these from the land of Sinim* — the directional-formula the seer sees fulfilled in the multitude before the throne.'),
  ('revelation', 7, 14, 'daniel', 12, 1, 4, E'*These are they which came out of great tribulation* picks up Daniel — *there shall be a time of trouble, such as never was since there was a nation... and at that time thy people shall be delivered, every one that shall be found written in the book.* The book of life is the precondition of the deliverance, not its product.'),
  ('revelation', 7, 14, 'isaiah', 1, 18, 5, E'*Washed their robes, and made them white in the blood of the Lamb* answers Isaiah''s *though your sins be as scarlet, they shall be as white as snow; though they be red like crimson, they shall be as wool* — the cleansing-by-blood the Tanakh promised.'),
  ('revelation', 7, 15, 'ezekiel', 37, 27, 6, E'*He that sitteth on the throne shall dwell among them* echoes Ezekiel''s covenant-formula — *my tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people* — the destination of the gathering.'),
  ('revelation', 7, 16, 'isaiah', 49, 10, 7, E'*They shall hunger no more, neither thirst any more; neither shall the sun light on them, nor any heat* is verbatim Isaiah — *they shall not hunger nor thirst; neither shall the heat nor sun smite them* — the post-gathering shepherd-care.'),
  ('revelation', 7, 17, 'isaiah', 25, 8, 8, E'*Elohim (God) shall wipe away all tears from their eyes* picks up Isaiah''s *he will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces.*'),
  ('revelation', 7, 17, 'psalms', 23, 1, 9, E'*The Lamb which is in the midst of the throne shall feed them, and shall lead them unto living fountains of waters* is the Davidic shepherd-psalm picked up — *Yahuah (the LORD) is my shepherd... he leadeth me beside the still waters* — with the Lamb identified as the Shepherd.'),
  ('revelation', 7, 9, 'isaiah', 56, 8, 10, E'*Adonai Yahuah (the Lord GOD) which gathereth the outcasts of Yashar''el (Israel) saith, Yet will I gather others to him, beside those that are gathered unto him* — the gathering-of-the-outcasts substance the multitude embodies; the *strangers* of Isaiah 56 are the scattered seed estranged by exile from their covenant identity, gathered home.'),
  ('revelation', 7, 10, 'psalms', 3, 8, 11, E'*Salvation to our Elohim (God) which sitteth upon the throne, and unto the Lamb* picks up *salvation belongeth unto Yahuah (the LORD)* — the doxology rooted in the Davidic confession.'),
  ('revelation', 7, 9, 'zechariah', 14, 16, 12, E'The multitude before the throne anticipates Zechariah''s *every one that is left of all the nations which came against Yerushalayim (Jerusalem) shall even go up from year to year to worship the King, Yahuah (the LORD) Tseva''ot (of hosts), and to keep the feast of tabernacles* — the millennial-reign worship; the multitude is the gathered seed, the *every one that is left* are the nations left alive receiving priestly instruction in the reign.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:great-multitude-no-man-could-number | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_revelation_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_revelation_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for great-multitude-no-man-could-number.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'great-multitude-no-man-could-number'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:great-multitude-no-man-could-number | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 7: trumpets-and-the-day-of-yahuah
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'trumpets-and-the-day-of-yahuah',
    E'The trumpets and the day of Yahuah (the LORD) substance',
    E'The seven trumpets do not introduce new judgment-categories. They release the Tanakh''s day-of-Yahuah (the LORD) architecture in seven movements, and every movement traces back to a prophetic source. Joel''s *day of Yahuah (the LORD) cometh, for it is nigh at hand; a day of darkness and of gloominess, a day of clouds and of thick darkness,* with the locust-army described in plague-detail, is the substance under the fifth trumpet. Zephaniah''s *day of wrath, a day of trouble and distress, a day of wasteness and desolation, a day of darkness and gloominess, a day of clouds and thick darkness, a day of the trumpet and alarm against the fenced cities, and against the high towers* names the trumpet itself.\n\n*Blow ye the trumpet in Tsion (Zion), and sound an alarm in my holy mountain: let all the inhabitants of the land tremble: for the day of Yahuah (the LORD) cometh, for it is nigh at hand; a day of darkness and of gloominess, a day of clouds and of thick darkness, as the morning spread upon the mountains: a great people and a strong; there hath not been ever the like, neither shall be any more after it, even to the years of many generations.* (Joel 2:1-2)\n\n*The great day of Yahuah (the LORD) is near, it is near, and hasteth greatly... That day is a day of wrath, a day of trouble and distress, a day of wasteness and desolation, a day of darkness and gloominess, a day of clouds and thick darkness, a day of the trumpet and alarm against the fenced cities, and against the high towers.* (Zephaniah 1:14-16)\n\nThe trumpets carry the day-of-Yahuah (the LORD) alarm Joel and Zephaniah commanded. The seer is not introducing a new eschatological program. He is showing what the prophets foretold being released in seven movements — the third part of the trees, the third part of the sea, the third part of the rivers, the sun and moon and stars darkened, the locust-army from the abyss, the loosing of the four angels, and the trumpet that announces *the kingdoms of this world are become the kingdoms of our Sovereign, and of his Messiah (Christ).*\n\nThe cyclical Revelation framework holds: the seventh trumpet announces the same kingdom-of-the-Messiah (Christ) the bowls show pouring out, that the harvest of chapter 14 gathers, that chapter 19''s return enacts. The trumpets are one angle on the same close of the age the seals, bowls, harvest, and return show from other angles.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1007
  FROM _s181_revelation_lookup sv, _s181_revelation_lookup ev
 WHERE sv.book_slug = 'revelation' AND sv.chapter_number = 8 AND sv.verse_number = 1
   AND ev.book_slug = 'revelation' AND ev.chapter_number = 9 AND ev.verse_number = 21
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('revelation', 8, 5, 'ezekiel', 10, 2, 1, E'The angel takes the censer, fills it with fire from the altar, and casts it into the earth — picking up Ezekiel''s *go in between the wheels, even under the cherub, and fill thine hand with coals of fire from between the cherubims, and scatter them over the city* — the same temple-fire judgment-architecture.'),
  ('revelation', 8, 7, 'exodus', 9, 24, 2, E'*Hail and fire mingled with blood* casts back to the seventh Egyptian plague — *hail, and fire mingled with the hail, very grievous, such as there was none like it in all the land of Egypt since it became a nation* — the day of Yahuah (the LORD) repeats the Exodus pattern at cosmic scale.'),
  ('revelation', 8, 8, 'jeremiah', 51, 25, 3, E'*A great mountain burning with fire was cast into the sea* picks up Jeremiah on Babylon — *Behold, I am against thee, O destroying mountain, saith Yahuah (the LORD)... and I will roll thee down from the rocks, and will make thee a burnt mountain* — the burning-mountain motif applied to the Babylon-architecture.'),
  ('revelation', 8, 10, 'jeremiah', 9, 15, 4, E'*Wormwood* (Apsinthos) — *I will feed them, even this people, with wormwood, and give them water of gall to drink* is the Tanakh-source for bitter-water-judgment; the third-part-of-the-rivers becomes wormwood as the same judgment-architecture released.'),
  ('revelation', 8, 12, 'joel', 2, 10, 5, E'*The sun and the moon shall be dark, and the stars shall withdraw their shining* is the direct Tanakh-source of the fourth-trumpet cosmic-darkening; the day-of-Yahuah (the LORD) signs Joel named.'),
  ('revelation', 9, 1, 'joel', 1, 4, 6, E'The locust-army from the abyss picks up Joel''s *that which the palmerworm hath left hath the locust eaten; and that which the locust hath left hath the cankerworm eaten* — the locust-plague pattern Joel turned into the eschatological-army of Joel 2.'),
  ('revelation', 9, 7, 'joel', 2, 4, 7, E'*The shapes of the locusts were like unto horses prepared unto battle* matches Joel''s *the appearance of them is as the appearance of horses; and as horsemen, so shall they run. Like the noise of chariots on the tops of mountains shall they leap* — verbatim substance.'),
  ('revelation', 8, 6, 'zephaniah', 1, 14, 8, E'The trumpet-and-alarm architecture is Zephaniah''s *day of the trumpet and alarm against the fenced cities, and against the high towers* — the trumpets of Revelation are the great-day-of-Yahuah (the LORD) trumpets the prophet commanded.'),
  ('revelation', 9, 4, 'ezekiel', 9, 6, 9, E'The locust-army is forbidden to hurt *those men which have the seal of Elohim (God) in their foreheads* — the same Ezekiel 9 mark-on-the-foreheads protection extended through the trumpet-judgments.'),
  ('revelation', 8, 3, 'psalms', 141, 2, 10, E'The incense ascending with the prayers of the saints picks up *let my prayer be set forth before thee as incense* — the prayer-as-incense temple-architecture preserved at the heavenly altar.'),
  ('revelation', 9, 20, 'isaiah', 2, 8, 11, E'*Worshipped devils, and idols of gold, and silver, and brass* answers Isaiah''s *their land also is full of idols; they worship the work of their own hands, that which their own fingers have made* — the same idolatry the prophet named, persisting through the trumpet-judgments and refusing to repent.'),
  ('revelation', 9, 21, 'hosea', 4, 1, 12, E'*Neither repented they of their murders, nor of their sorceries, nor of their fornication, nor of their thefts* echoes Hosea''s controversy: *there is no truth, nor mercy, nor knowledge of Elohim (God) in the land. By swearing, and lying, and killing, and stealing, and committing adultery* — the same lawlessness diagnosed in the same vocabulary.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:trumpets-and-the-day-of-yahuah | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_revelation_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_revelation_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for trumpets-and-the-day-of-yahuah.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'trumpets-and-the-day-of-yahuah'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:trumpets-and-the-day-of-yahuah | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 8: two-witnesses-and-the-two-olive-trees
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'two-witnesses-and-the-two-olive-trees',
    E'The two witnesses — the two olive trees, the two lampstands, the prophets restored',
    E'The two witnesses are *the two olive trees, and the two candlesticks standing before the Sovereign of the earth.* The image is not invented. It is Zechariah''s vision of the golden candlestick with the two olive trees beside it, and Zechariah''s interpretation names the substance.\n\n*Then said he, These are the two anointed ones, that stand by the Sovereign of the whole earth.* (Zechariah 4:14)\n\n*And these are the two olive trees, and the two candlesticks standing before the Sovereign of the earth. And if any man will hurt them, fire proceedeth out of their mouth, and devoureth their enemies.* (Revelation 11:4-5)\n\nThe two witnesses carry priestly-prophetic authority — fire from their mouths (the consuming-fire judgment Mosheh (Moses) called down at Korah''s rebellion, the consuming-fire Elijah called down on the captains of fifty), authority to shut heaven so that it rain not (Elijah''s three-and-a-half-year shutting in 1 Kings 17), authority to turn waters to blood and to smite the earth with all plagues (Mosheh''s signs in Egypt). The pattern is unmistakable: the two witnesses come in the spirit and power of Mosheh (Moses) and Elijah, the two figures Malachi 4:5-6 promised would come *before the coming of the great and dreadful day of Yahuah (the LORD),* the two figures who stood with the Messiah on the mountain of transfiguration.\n\n*Behold, I will send you Eliyahu (Elijah) the prophet before the coming of the great and dreadful day of Yahuah (the LORD): and he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse.* (Malachi 4:5-6)\n\nThe Revelation framework holds: the death of the two witnesses, their three-and-a-half-day vindication, the voice from heaven calling *come up here,* the time of the dead, the wrath, the reward, the destruction of those who destroy the earth — all of it lives in chapter 11 in compressed form, and chapter 11:18 names the verdict the rest of the book retells from other angles. The two olive trees stand because the priestly office stands.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1008
  FROM _s181_revelation_lookup sv, _s181_revelation_lookup ev
 WHERE sv.book_slug = 'revelation' AND sv.chapter_number = 11 AND sv.verse_number = 1
   AND ev.book_slug = 'revelation' AND ev.chapter_number = 11 AND ev.verse_number = 13
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('revelation', 11, 4, 'zechariah', 4, 11, 1, E'*The two olive trees, and the two candlesticks standing before the Sovereign of the earth* is the verbatim Tanakh-source — Zechariah''s *two anointed ones, that stand by the Sovereign of the whole earth.*'),
  ('revelation', 11, 5, '2-kings', 1, 10, 2, E'*Fire proceedeth out of their mouth, and devoureth their enemies* picks up Elijah''s *let fire come down from heaven, and consume thee and thy fifty* — the priestly-fire authority.'),
  ('revelation', 11, 6, '1-kings', 17, 1, 3, E'*Power to shut heaven, that it rain not in the days of their prophecy* is Elijah''s signature — *there shall not be dew nor rain these years, but according to my word* — the same three-and-a-half-year drought-architecture.'),
  ('revelation', 11, 6, 'exodus', 7, 19, 4, E'*Power over waters to turn them to blood, and to smite the earth with all plagues* is Mosheh''s (Moses''s) signature — the turning of the Egyptian rivers to blood and the plague-architecture released through his rod.'),
  ('revelation', 11, 3, 'malachi', 4, 5, 5, E'The two-witness ministry before the day-of-Yahuah (the LORD) is Malachi''s promise — *Behold, I will send you Eliyahu (Elijah) the prophet before the coming of the great and dreadful day of Yahuah (the LORD).*'),
  ('revelation', 11, 3, 'deuteronomy', 18, 15, 6, E'Mosheh''s (Moses''s) own prophecy — *Yahuah (the LORD) thy Elohim (God) will raise up unto thee a Prophet from the midst of thee, of thy brethren, like unto me* — the Mosaic-prophetic continuity the two witnesses extend into the close of the age.'),
  ('revelation', 11, 7, 'daniel', 7, 21, 7, E'*The beast that ascendeth out of the bottomless pit shall make war against them, and shall overcome them, and kill them* picks up Daniel''s *the same horn made war with the saints, and prevailed against them* — the little-horn / beast-architecture making war on the witness-company.'),
  ('revelation', 11, 11, 'ezekiel', 37, 5, 8, E'*The Spirit of life from Elohim (God) entered into them, and they stood upon their feet* matches Ezekiel''s valley-of-dry-bones — *I will cause breath to enter into you, and ye shall live... and the breath came into them, and they lived, and stood up upon their feet, an exceeding great army* — the resurrection-architecture identical.'),
  ('revelation', 11, 12, '2-kings', 2, 11, 9, E'*Come up hither. And they ascended up to heaven in a cloud* picks up Elijah''s translation — *Eliyahu (Elijah) went up by a whirlwind into heaven* — the cloud-ascent the witnesses repeat.'),
  ('revelation', 11, 8, 'isaiah', 1, 9, 10, E'*The great city, which spiritually is called Sodom and Egypt* echoes Isaiah''s address to Yerushalayim (Jerusalem) — *Hear the word of Yahuah (the LORD), ye rulers of Sodom; give ear unto the law of our Elohim (God), ye people of Gomorrah* — the city of the great king named under the abomination-cities'' names when she carries their works.'),
  ('revelation', 11, 18, 'psalms', 2, 1, 11, E'*The nations were angry, and thy wrath is come* is the verbatim substance of Psalm 2''s *Why do the heathen rage... He that sitteth in the heavens shall laugh... Then shall he speak unto them in his wrath* — the Messianic enthronement-psalm fulfilled in the verdict.'),
  ('revelation', 11, 15, 'daniel', 7, 14, 12, E'*The kingdoms of this world are become the kingdoms of our Sovereign, and of his Messiah (Christ); and he shall reign for ever and ever* is the verbatim transfer Daniel 7:14 names — *there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion, which shall not pass away.*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:two-witnesses-and-the-two-olive-trees | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_revelation_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_revelation_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for two-witnesses-and-the-two-olive-trees.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'two-witnesses-and-the-two-olive-trees'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:two-witnesses-and-the-two-olive-trees | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 9: woman-clothed-with-the-sun-and-the-seed-war
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'woman-clothed-with-the-sun-and-the-seed-war',
    E'The woman clothed with the sun and the seed-war from Genesis 3',
    E'Revelation 12 is the Tanakh''s seed-war in compressed form. The woman, the male-child, the dragon, the persecution, the wilderness, the war in heaven, the remnant who *keep the commandments of Elohim (God), and have the testimony of Yahusha (Jesus)* — every motif in the chapter is Tanakh substance reaching its release-point. The Genesis 3:15 enmity between the seed of the woman and the seed of the serpent runs through every chapter of scripture, and Revelation 12 names the closing arc of the war.\n\n*And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15)\n\nThe woman is Yashar''el (Israel), seen in cosmic costume — clothed with the sun, the moon under her feet, a crown of twelve stars on her head — picking up Yoseph''s (Joseph''s) dream of the sun and moon and eleven stars bowing to him in Genesis 37:9. The male-child is the Messiah, caught up to the throne. The dragon is the serpent of Genesis, the *great dragon... that old serpent, called the devil, and satan,* whose seed has warred against the woman''s seed from the garden forward.\n\n*And she brought forth a man child, who was to rule all nations with a rod of iron: and her child was caught up unto Elohim (God), and to his throne.* (Revelation 12:5)\n\nThe rod-of-iron is Psalm 2 — *thou shalt break them with a rod of iron* — given to the male-child who is the seed of the woman. The persecution of the remnant, the wilderness flight, the dragon''s *war with the remnant of her seed,* the diagnostic identification at the end of the chapter — *which keep the commandments of Elohim (God), and have the testimony of Yahusha (Jesus)* — names the remnant by the same two-fold marker the framework holds throughout: Torah-walking and Messiah-trusting, the new-covenant pattern of the Spirit causing the gathered seed to keep his judgments.\n\n*Before she travailed, she brought forth; before her pain came, she was delivered of a man child. Who hath heard such a thing? who hath seen such things? Shall the earth be made to bring forth in one day? or shall a nation be born at once? for as soon as Tsion (Zion) travailed, she brought forth her children.* (Isaiah 66:7-8)\n\nIsaiah''s travail-and-deliverance prophecy is the immediate Tanakh-source — the woman travails, the man-child is born, the nation is brought forth. Revelation 12 reads as the Tanakh''s own seed-war prophecies released for the close of the age, with the diagnostic identification of the remnant kept intact: commandment-keeping and Yahusha-witnessing, both together, never one without the other.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1009
  FROM _s181_revelation_lookup sv, _s181_revelation_lookup ev
 WHERE sv.book_slug = 'revelation' AND sv.chapter_number = 12 AND sv.verse_number = 1
   AND ev.book_slug = 'revelation' AND ev.chapter_number = 12 AND ev.verse_number = 17
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('revelation', 12, 1, 'genesis', 37, 9, 1, E'The woman clothed with the sun, the moon under her feet, a crown of twelve stars — picks up Yoseph''s (Joseph''s) dream of the sun, the moon, and the eleven stars (Yoseph (Joseph) himself being the twelfth) bowing down; the cosmic-figure is Yashar''el (Israel) in patriarchal-dream costume.'),
  ('revelation', 12, 2, 'isaiah', 66, 7, 2, E'*Travailing in birth, and pained to be delivered* is the verbatim Isaiah-substance — *as soon as Tsion (Zion) travailed, she brought forth her children* — the travail-and-deliverance prophecy of Yashar''el (Israel) bringing forth the Messiah and the gathered nation.'),
  ('revelation', 12, 4, 'daniel', 8, 10, 3, E'*His tail drew the third part of the stars of heaven, and did cast them to the earth* picks up Daniel''s vision of the little horn — *it cast down some of the host and of the stars to the ground, and stamped upon them* — the fallen-watcher / corrupted-host architecture.'),
  ('revelation', 12, 5, 'psalms', 2, 9, 4, E'*To rule all nations with a rod of iron* is the verbatim Psalm 2 — *thou shalt break them with a rod of iron* — the Davidic-Messianic enthronement-promise fulfilled in the man-child.'),
  ('revelation', 12, 9, 'genesis', 3, 1, 5, E'*That old serpent, called the devil, and satan* is the identification with the Genesis 3 serpent in the garden — the same enmity, the same seed-war, the same head-bruising trajectory the patriarchal-promise of Genesis 3:15 announced.'),
  ('revelation', 12, 9, 'genesis', 3, 15, 6, E'The seed-war between the woman and the dragon is the verbatim Tanakh-architecture — *I will put enmity between thee and the woman, and between thy seed and her seed* — the patriarchal-promise that runs through every chapter of scripture and closes in Revelation 12.'),
  ('revelation', 12, 7, 'daniel', 10, 13, 7, E'The war in heaven, Michael fighting against the dragon, picks up Daniel 10''s *the prince of the kingdom of Persia withstood me one and twenty days; but, lo, Michael, one of the chief princes, came to help me* — the Michael-as-warring-prince architecture preserved.'),
  ('revelation', 12, 11, 'exodus', 12, 13, 8, E'*They overcame him by the blood of the Lamb, and by the word of their testimony* picks up the Passover-blood-on-the-doorpost deliverance — the Lamb''s blood is the same deliverance-architecture across Exodus and the close of the age.'),
  ('revelation', 12, 14, 'daniel', 7, 25, 9, E'*A time, and times, and half a time* is the verbatim Daniel-architecture for the persecuted-remnant interval — the same three-and-a-half-time the little-horn wars against the saints.'),
  ('revelation', 12, 17, 'genesis', 3, 15, 10, E'*The dragon... went to make war with the remnant of her seed* is the seed-of-the-woman-vs-seed-of-the-serpent enmity from Genesis 3:15, brought forward to the close-of-the-age remnant.'),
  ('revelation', 12, 17, 'exodus', 20, 1, 11, E'*Which keep the commandments of Elohim (God)* — the remnant identified by Torah-walking. The new-covenant promise of Ezekiel 36:27 (*cause you to walk in my statutes*) producing the diagnostic mark of the close-of-the-age remnant.'),
  ('revelation', 12, 6, 'hosea', 2, 14, 12, E'*The woman fled into the wilderness, where she hath a place prepared of Elohim (God)* picks up Hosea — *Behold, I will allure her, and bring her into the wilderness, and speak comfortably unto her* — the wilderness as the place Yahuah (the LORD) prepares for his bride before the restoration. The same Ezekiel 20:35 wilderness-of-the-peoples where the post-harvest sifting happens.'),
  ('revelation', 12, 1, 'jeremiah', 31, 22, 13, E'*A woman shall compass a man* — Jeremiah''s enigmatic new-thing prophecy — sits behind the cosmic-woman bringing forth the man-child; the Tanakh laid down the architecture the seer is now shown enacted.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:woman-clothed-with-the-sun-and-the-seed-war | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_revelation_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_revelation_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for woman-clothed-with-the-sun-and-the-seed-war.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'woman-clothed-with-the-sun-and-the-seed-war'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:woman-clothed-with-the-sun-and-the-seed-war | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 10: beast-from-the-sea-and-daniel-7
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'beast-from-the-sea-and-daniel-7',
    E'The beast from the sea — Daniel 7 in cosmic costume',
    E'The beast that rises from the sea in Revelation 13 is not a new figure. It is Daniel''s fourth beast and the little horn that grew up among the other horns, assembled into a single composite — leopard-bodied (Daniel''s third), bear-footed (Daniel''s second), lion-mouthed (Daniel''s first), with the ten horns of the fourth and the blasphemous mouth of the little horn. The seer is showing the convergence of the four kingdoms of Daniel 7 into one antichrist-system at the close of the age.\n\n*Daniel spake and said, I saw in my vision by night, and, behold, the four winds of the heaven strove upon the great sea. And four great beasts came up from the sea, diverse one from another. The first was like a lion... and behold another beast, a second, like to a bear... another, like a leopard... a fourth beast, dreadful and terrible, and strong exceedingly; and it had great iron teeth... and it had ten horns... another little horn... and, behold, in this horn were eyes like the eyes of man, and a mouth speaking great things.* (Daniel 7:2-8)\n\n*And the beast which I saw was like unto a leopard, and his feet were as the feet of a bear, and his mouth as the mouth of a lion: and the dragon gave him his power, and his seat, and great authority.* (Revelation 13:2)\n\nThe little horn''s signature in Daniel 7:25 — *he shall speak great words against the most High, and shall wear out the saints of the most High, and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time* — is the same signature the beast carries in Revelation 13:5-7. The Christianization of Revelation has long localized the beast to a generic future antichrist figure or to Rome, missing what Daniel 7 named and what the framework holds: the antichrist is the system that has worn out the saints for centuries by wearing four costumes — institutional Christianity, Judaism, Hebrew Roots'' false-inclusion gospel, and Islam — each denying the twelve-tribe gathering, each calling Yahuah (the LORD) a liar for having promised it, each producing victims inside it.\n\n*And he shall speak great words against the most High, and shall wear out the saints of the most High, and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* (Daniel 7:25)\n\nThe beast''s *forty and two months* in Revelation 13:5 is Daniel''s *time and times and the dividing of time.* The book of life from the foundation of the world (v.8) is the Tanakh-architecture the framework holds: names are written from the foundation, not added by post-foundation faith-confession; the sheep hear because they are sheep, and they refuse the mark because the mark is the antichrist-system''s identifier.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1010
  FROM _s181_revelation_lookup sv, _s181_revelation_lookup ev
 WHERE sv.book_slug = 'revelation' AND sv.chapter_number = 13 AND sv.verse_number = 1
   AND ev.book_slug = 'revelation' AND ev.chapter_number = 13 AND ev.verse_number = 10
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('revelation', 13, 1, 'daniel', 7, 3, 1, E'*I saw a beast rise up out of the sea* is the verbatim Daniel-source — *four great beasts came up from the sea* — the chaotic-waters out of which the kingdoms-of-man rise.'),
  ('revelation', 13, 2, 'daniel', 7, 4, 2, E'The composite — leopard-bodied, bear-footed, lion-mouthed — is the convergence of Daniel''s first three beasts (lion, bear, leopard) into a single closing figure.'),
  ('revelation', 13, 1, 'daniel', 7, 7, 3, E'The ten horns are Daniel''s fourth-beast horns — *a fourth beast, dreadful and terrible... and it had ten horns* — the same diadem-bearing horns gathered on the closing-age figure.'),
  ('revelation', 13, 5, 'daniel', 7, 25, 4, E'*A mouth speaking great things and blasphemies; and power was given unto him to continue forty and two months* is the verbatim Daniel-signature — *he shall speak great words against the most High, and shall wear out the saints of the most High, and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* The forty-two months are the three-and-a-half-time of Daniel.'),
  ('revelation', 13, 7, 'daniel', 7, 21, 5, E'*It was given unto him to make war with the saints, and to overcome them* is verbatim Daniel — *the same horn made war with the saints, and prevailed against them.*'),
  ('revelation', 13, 8, 'genesis', 1, 1, 6, E'*The Lamb slain from the foundation of the world* picks up the Genesis 1:1 architecture — the seed-of-the-woman / seed-of-the-serpent enmity laid down with the foundation; the Lamb''s slaying and the names in the book of life were written before the works of creation were finished.'),
  ('revelation', 13, 8, 'psalms', 69, 28, 7, E'*Whose names are not written in the book of life* presupposes the Davidic *let them be blotted out of the book of the living, and not be written with the righteous* — names are written from the foundation, blotted out at the post-harvest sifting; the architecture is consistent across the canon.'),
  ('revelation', 13, 10, 'jeremiah', 15, 2, 8, E'*He that leadeth into captivity shall go into captivity: he that killeth with the sword must be killed with the sword* is verbatim Jeremiah — *such as are for death, to death; and such as are for the sword, to the sword; and such as are for the famine, to the famine; and such as are for the captivity, to the captivity* — the measure-for-measure judgment-architecture.'),
  ('revelation', 13, 2, 'daniel', 7, 6, 9, E'The leopard-body specifically picks up Daniel''s third beast — *another, like a leopard, which had upon the back of it four wings of a fowl; the beast had also four heads; and dominion was given to it* — preserving the four-fold dominion-architecture.'),
  ('revelation', 13, 3, 'daniel', 7, 8, 10, E'The deadly head-wound healed picks up the little-horn''s *eyes like the eyes of man, and a mouth speaking great things* — the architecture of the closing-age antichrist-system bearing both the composite-kingdoms and the little-horn signature.'),
  ('revelation', 13, 1, 'daniel', 7, 24, 11, E'*Upon his horns ten crowns* picks up Daniel''s *the ten horns out of this kingdom are ten kings that shall arise* — the ten-king architecture preserved.'),
  ('revelation', 13, 7, 'daniel', 7, 14, 12, E'The dominion *over all kindreds, and tongues, and nations* is the counterfeit of the dominion given to *one like the Son of Adam* in Daniel 7:14 — the antichrist-system imitates the Messianic kingship-grant, but its dominion is not everlasting; the verdict of v.26 takes it down.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:beast-from-the-sea-and-daniel-7 | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_revelation_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_revelation_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for beast-from-the-sea-and-daniel-7.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'beast-from-the-sea-and-daniel-7'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:beast-from-the-sea-and-daniel-7 | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 11: 144000-on-mount-tsion-and-the-harvest
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    '144000-on-mount-tsion-and-the-harvest',
    E'The 144,000 on Mount Tsion (Zion) — firstfruits, and one like the Son of Adam on the cloud',
    E'Revelation 14 opens with the 144,000 already gathered on Mount Tsion (Zion) with the Lamb, having his Father''s name written in their foreheads. The chapter that began with the sealing-by-tribe at Revelation 7 lands here, on the mountain, the priestly-firstfruits of the great gathering complete. They are *redeemed from the earth,* *redeemed from among men, being the firstfruits unto Elohim (God) and to the Lamb,* and in their mouth was found *no guile: for they are without fault before the throne of Elohim (God).* The Tanakh firstfruits-architecture — the first sheaf brought before Yahuah (the LORD) at the spring harvest — names them: the firstfruits are the pledge of the full harvest still to come.\n\n*And I looked, and, lo, a Lamb stood on the mount Tsion (Zion), and with him an hundred forty and four thousand, having his Father''s name written in their foreheads.* (Revelation 14:1)\n\nThe mid-chapter announcement is the everlasting gospel, the fall of Babylon, and the warning against worshipping the beast — the three angels carrying the close-of-the-age witness. And then the harvest. The seer sees the harvest in two cuts: the grain-harvest gathered by *one like the Son of Adam* with a sharp sickle, and the grape-harvest cut by the angel and trodden in the winepress outside the city.\n\n*And I looked, and behold a white cloud, and upon the cloud one sat like unto the Son of Adam, having on his head a golden crown, and in his hand a sharp sickle.* (Revelation 14:14)\n\nThe kaph-comparative carve-out is preserved: the text says *one sat like unto the Son of Adam,* not *the Son of Adam sat.* The kaph honors Yahusha''s (Jesus''s) incarnation — he resembled mortal-man because he took on flesh — while keeping the named Standard in view: he remained the Formed cloud-rider, the One who rides Yahuah''s (the LORD''s) clouds. Strict-literal reading of v.14 in isolation appears to open trajectories beyond the inherited Christian collapse; the harmonized canon closes them. The chapter opens with the Lamb on Mount Tsion (Zion) with the firstfruits (v.1); the cloud-rider imagery is consistently divine across scripture and across Revelation; the figure has his own agency thrusting his own sickle; the angel from the temple bears the Father''s timing-release the gospel itself named:\n\n*But of that day and that hour knoweth no man, no, not the angels which are in heaven, neither the Son, but the Father.* (Mark 13:32)\n\nThe counterfeit''s gathering is named elsewhere as the three unclean spirits gathering the kings to Armageddon (Revelation 16:13-16). The figure on the cloud at v.14 is Yahusha (Jesus). The kaph preserves the resemblance and the named Standard at the same time.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1011
  FROM _s181_revelation_lookup sv, _s181_revelation_lookup ev
 WHERE sv.book_slug = 'revelation' AND sv.chapter_number = 14 AND sv.verse_number = 1
   AND ev.book_slug = 'revelation' AND ev.chapter_number = 14 AND ev.verse_number = 20
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('revelation', 14, 1, 'joel', 2, 32, 1, E'*A Lamb stood on the mount Tsion (Zion)* picks up Joel — *for in mount Tsion (Zion) and in Yerushalayim (Jerusalem) shall be deliverance, as Yahuah (the LORD) hath said, and in the remnant whom Yahuah (the LORD) shall call* — the mountain-of-deliverance where the remnant is gathered.'),
  ('revelation', 14, 1, 'micah', 4, 7, 2, E'*And Yahuah (the LORD) shall reign over them in mount Tsion (Zion) from henceforth, even for ever* — the same mountain, the same Lamb-King, the same gathered remnant the prophet announced.'),
  ('revelation', 14, 4, 'leviticus', 23, 10, 3, E'*These were redeemed from among men, being the firstfruits unto Elohim (God) and to the Lamb* picks up the Tanakh firstfruits-architecture — the first sheaf brought before Yahuah (the LORD) as the pledge of the full harvest. The 144,000 are the firstfruits, the great-multitude gathering is the full harvest.'),
  ('revelation', 14, 5, 'zephaniah', 3, 13, 4, E'*In their mouth was found no guile: for they are without fault before the throne of Elohim (God)* picks up *the remnant of Yashar''el (Israel) shall not do iniquity, nor speak lies; neither shall a deceitful tongue be found in their mouth* — the remnant-purification the prophet promised.'),
  ('revelation', 14, 8, 'jeremiah', 51, 7, 5, E'*Babylon is fallen, is fallen, that great city* is verbatim Tanakh — *Babylon is suddenly fallen and destroyed* — the second-angel announcement picks up Jeremiah''s Babylon-oracle wholesale.'),
  ('revelation', 14, 10, 'isaiah', 51, 17, 6, E'*Drink of the wine of the wrath of Elohim (God), which is poured out without mixture into the cup of his indignation* picks up Isaiah — *thou hast drunken at the hand of Yahuah (the LORD) the cup of his fury; thou hast drunken the dregs of the cup of trembling* — the cup-of-wrath architecture from the prophets.'),
  ('revelation', 14, 13, 'daniel', 12, 13, 7, E'*Blessed are the dead which die in Yahuah (the LORD) from henceforth* picks up Daniel — *go thou thy way till the end be: for thou shalt rest, and stand in thy lot at the end of the days* — the rest-and-resurrection promise.'),
  ('revelation', 14, 14, 'daniel', 7, 13, 8, E'*One sat like unto the Son of Adam* is the same kaph-comparative as Daniel 7:13''s *one like the Son of Adam.* The kaph honors Yahusha''s (Jesus''s) incarnation; the harmonized identification is Yahusha himself — the figure thrusts his own sickle (v.16), the agency is the King''s; the counterfeit''s gathering is named elsewhere (Revelation 16:13-16, three unclean spirits gathering the kings to Armageddon).'),
  ('revelation', 14, 15, 'joel', 3, 13, 9, E'*Thrust in thy sickle, and reap: for the time is come for thee to reap; for the harvest of the earth is ripe* is verbatim Joel — *Put ye in the sickle, for the harvest is ripe: come, get you down; for the press is full, the fats overflow* — both harvest-figures the seer doubles, grain and grape.'),
  ('revelation', 14, 19, 'isaiah', 63, 3, 10, E'*The great winepress of the wrath of Elohim (God)... and the winepress was trodden without the city* picks up Isaiah — *I have trodden the winepress alone; and of the people there was none with me: for I will tread them in mine anger, and trample them in my fury* — the winepress-of-wrath architecture identical.'),
  ('revelation', 14, 1, 'ezekiel', 9, 4, 11, E'The Father''s name written in the foreheads of the 144,000 is the same mark-on-the-foreheads Ezekiel 9 puts on the men who sigh and cry for the abominations — the gathered-and-marked preserved through the day-of-Yahuah (the LORD) destruction.'),
  ('revelation', 14, 6, 'psalms', 96, 2, 12, E'*The everlasting gospel to preach unto them that dwell on the earth, and to every nation, and kindred, and tongue, and people* picks up the Davidic psalm — *Sing unto Yahuah (the LORD), bless his name; shew forth his salvation from day to day. Declare his glory among the heathen, his wonders among all people* — the proclamation-to-the-nations architecture.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:144000-on-mount-tsion-and-the-harvest | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_revelation_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_revelation_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for 144000-on-mount-tsion-and-the-harvest.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = '144000-on-mount-tsion-and-the-harvest'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:144000-on-mount-tsion-and-the-harvest | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 12: seven-bowls-and-the-exodus-plagues
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'seven-bowls-and-the-exodus-plagues',
    E'The seven bowls — the Exodus plagues at cosmic scale',
    E'The seven bowls do not invent new judgments. They release the Exodus plagues at cosmic scale, against the antichrist-system the seer has been showing in costume after costume. The pattern is unmistakable: noisome and grievous sores on those who have the mark (the Egyptian boil-plague), the sea becoming as the blood of a dead man (the Nile-to-blood), the rivers and fountains of waters becoming blood (the rivers-to-blood), darkness on the kingdom of the beast (the darkness-over-Egypt), the great river Euphrates dried up (the Reed-Sea division, repurposed for the gathering of the kings to the last battle), the great hail (the Egyptian hail-and-fire). Yahuah (the LORD) does what he has always done. The architecture is older than Pharaoh, and the Exodus deliverance is the type the cosmic-scale deliverance echoes.\n\n*And the first went, and poured out his vial upon the earth; and there fell a noisome and grievous sore upon the men which had the mark of the beast, and upon them which worshipped his image.* (Revelation 16:2)\n\n*And the magicians could not stand before Mosheh (Moses) because of the boils; for the boil was upon the magicians, and upon all the Egyptians.* (Exodus 9:11)\n\nThe sixth bowl exposes the counterfeit-gathering. While the angel from the temple at Revelation 14:15 carried the Father''s timing-release to the harvest of the earth, the dragon, the beast, and the false prophet send out three unclean spirits like frogs — *for they are the spirits of devils, working miracles, which go forth unto the kings of the earth and of the whole world, to gather them to the battle of that great day of Elohim (God) Almighty.* The Tanakh''s frog-plague has its release-point: the frogs of Exodus 8 reappear as deceiving-spirits gathering the kings to Armageddon. The counterfeit imitates the gathering — but the gathering is to destruction, not to deliverance. The framework holds the contrast: Yahuah''s (the LORD''s) gathering of the scattered seed at the close of the age, and the dragon''s gathering of the kings to the battle that ends in their destruction at the return of the Messiah (Christ).',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1012
  FROM _s181_revelation_lookup sv, _s181_revelation_lookup ev
 WHERE sv.book_slug = 'revelation' AND sv.chapter_number = 16 AND sv.verse_number = 1
   AND ev.book_slug = 'revelation' AND ev.chapter_number = 16 AND ev.verse_number = 21
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('revelation', 16, 2, 'exodus', 9, 9, 1, E'*A noisome and grievous sore upon the men which had the mark of the beast* picks up the sixth Egyptian plague — *it shall become small dust in all the land of Egypt, and shall be a boil breaking forth with blains upon man, and upon beast* — the boil-on-the-marked, cosmic-scale.'),
  ('revelation', 16, 3, 'exodus', 7, 20, 2, E'*The sea... became as the blood of a dead man: and every living soul died in the sea* picks up the first Egyptian plague — *all the waters that were in the river were turned to blood. And the fish that was in the river died.*'),
  ('revelation', 16, 4, 'exodus', 7, 19, 3, E'*The rivers and fountains of waters; and they became blood* picks up the rivers-and-pools and *all their pools of water* of the first plague — the cosmic-scale release of the same architecture.'),
  ('revelation', 16, 5, 'genesis', 9, 6, 4, E'*Thou hast given them blood to drink; for they are worthy* picks up the Noachian-covenant principle — *whoso sheddeth man''s blood, by man shall his blood be shed* — the measure-for-measure verdict.'),
  ('revelation', 16, 10, 'exodus', 10, 21, 5, E'*His kingdom was full of darkness; and they gnawed their tongues for pain* picks up the ninth Egyptian plague — *that there may be darkness over the land of Egypt, even darkness which may be felt... and there was a thick darkness in all the land of Egypt three days.*'),
  ('revelation', 16, 12, 'isaiah', 11, 15, 6, E'*The great river Euphrates; and the water thereof was dried up, that the way of the kings of the east might be prepared* picks up Isaiah''s gathering-prophecy — *Yahuah (the LORD)... with his mighty wind shall he shake his hand over the river, and shall smite it in the seven streams, and make men go over dryshod* — the Tanakh''s Euphrates-divided-for-the-gathering, repurposed at the sixth bowl for the kings-of-the-east assembly.'),
  ('revelation', 16, 13, 'exodus', 8, 2, 7, E'The three unclean spirits *like frogs* picks up the second Egyptian plague — *the river shall bring forth frogs abundantly* — the deceiving-spirits at the closing-age gathering carry the same frog-architecture as the plague-on-Egypt.'),
  ('revelation', 16, 14, '1-kings', 22, 21, 8, E'*The spirits of devils, working miracles, which go forth unto the kings of the earth and of the whole world, to gather them to the battle* picks up the Micaiah-vision — *I will go forth, and I will be a lying spirit in the mouth of all his prophets* — the lying-spirits-sent-from-Yahuah''s (the LORD''s)-court architecture for the gathering-to-destruction.'),
  ('revelation', 16, 16, 'zechariah', 12, 11, 9, E'*Armageddon* is the mountain of Megiddo — Zechariah''s *in that day shall there be a great mourning in Yerushalayim (Jerusalem), as the mourning of Hadadrimmon in the valley of Megiddon* — the same eschatological-battle-location the Tanakh names.'),
  ('revelation', 16, 18, 'zechariah', 14, 4, 10, E'*There was a great earthquake, such as was not since men were upon the earth... and every island fled away, and the mountains were not found* picks up Zechariah''s *mount of Olives shall cleave in the midst thereof... and ye shall flee, like as ye fled from before the earthquake in the days of Uzziah king of Yahudah (Judah)* — the day-of-Yahuah (the LORD) cosmic-earthquake architecture.'),
  ('revelation', 16, 21, 'exodus', 9, 23, 11, E'*A great hail out of heaven, every stone about the weight of a talent* picks up the seventh Egyptian plague — *Yahuah (the LORD) sent thunder and hail, and the fire ran along upon the ground; and Yahuah (the LORD) rained hail upon the land of Egypt* — the hail-from-heaven cosmic-scale.'),
  ('revelation', 16, 14, 'joel', 3, 2, 12, E'*To gather them to the battle of that great day of Elohim (God) Almighty* picks up Joel — *I will also gather all nations, and will bring them down into the valley of Yehoshaphat (Jehoshaphat), and will plead with them there for my people and for my heritage Yashar''el (Israel)* — the same gathering-of-the-nations-to-judgment architecture.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:seven-bowls-and-the-exodus-plagues | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_revelation_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_revelation_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for seven-bowls-and-the-exodus-plagues.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'seven-bowls-and-the-exodus-plagues'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:seven-bowls-and-the-exodus-plagues | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 13: harlot-babylon-and-come-out-of-her
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'harlot-babylon-and-come-out-of-her',
    E'Babylon the great and the come-out-of-her call',
    E'The harlot Babylon is the framework''s central diagnostic in Revelation. The seer is shown a woman arrayed in purple and scarlet, decked with gold and precious stones and pearls, riding the beast, with a name written on her forehead — *MYSTERY, BABYLON THE GREAT, THE MOTHER OF HARLOTS AND ABOMINATIONS OF THE EARTH* — drunken with the blood of the saints and of the martyrs of Yahusha (Jesus). She is the antichrist-system in seductive costume, *the great whore that sitteth upon many waters* (the *waters... are peoples, and multitudes, and nations, and tongues* the angel explicitly identifies in v.15) — the religious-political system that has worn the saints out through every century by wearing whichever costume the age supplied. The Reformation''s localization of the harlot to Catholic Rome is too narrow; the dispensational localization to a future apostate world-church is too narrow too. The harlot is the antichrist-architecture itself, named in every age by the prophets, and finally exposed.\n\n*Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues.* (Revelation 18:4)\n\nThe come-out-of-her call is the framework''s central diagnostic. It is the verbatim Tanakh-substance — Jeremiah''s *flee out of the midst of Babylon, and deliver every man his soul: be not cut off in her iniquity; for this is the time of Yahuah''s (the LORD''s) vengeance,* Isaiah''s *depart ye, depart ye, go ye out from thence, touch no unclean thing; go ye out of the midst of her; be ye clean.* The call presupposes the existence of *my people* inside Babylon — the scattered seed, the lost sheep, the sons of Adam in every nation whose names are written in the book of life from the foundation of the world, still inside the system, called to come out.\n\n*Flee out of the midst of Babylon, and deliver every man his soul: be not cut off in her iniquity; for this is the time of Yahuah''s (the LORD''s) vengeance; he will render unto her a recompence.* (Jeremiah 51:6)\n\n*Depart ye, depart ye, go ye out from thence, touch no unclean thing; go ye out of the midst of her; be ye clean, that bear the vessels of Yahuah (the LORD).* (Isaiah 52:11)\n\nThe diagnostic that identifies any harlot-costume is the 1 John 2:3-4 standard:\n\n*And hereby we do know that we know him, if we keep his commandments. He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him.* (1 John 2:3-4)\n\nThe four costumes the framework names — institutional Christianity (Constantine''s Sunday law, the antinomian Paul, the abolished-Torah gospel), Judaism (the rabbinic accretions that obscure the prophets'' restoration of the scattered seed), Hebrew Roots'' false-inclusion gospel (the *anyone-who-Torah-keeps-is-Israel* substitution), Islam (the transfer of the covenant to Ishmael, the denial of the twelve-tribe gathering) — all fail the same test in the same direction: each calls Yahuah (the LORD) a liar by denying what he promised about the gathering of the paternal blood remnant of all twelve tribes. Four costumes, one architecture, one contrary-to-Torah signature. The preterist localization to first-century Yerushalayim (Jerusalem) is too narrow as well; the harlot wears centuries of costumes, not a single one. The come-out-of-her call goes to my people in every one of them. The people are not the enemy. The system is. And the gathering of the scattered seed *is* the come-out, executed at the close of the age.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1013
  FROM _s181_revelation_lookup sv, _s181_revelation_lookup ev
 WHERE sv.book_slug = 'revelation' AND sv.chapter_number = 17 AND sv.verse_number = 1
   AND ev.book_slug = 'revelation' AND ev.chapter_number = 18 AND ev.verse_number = 24
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('revelation', 18, 4, 'jeremiah', 51, 6, 1, E'*Come out of her, my people* is verbatim Jeremiah — *Flee out of the midst of Babylon, and deliver every man his soul* — the call presupposes my people inside Babylon, the scattered seed in the system, called to come out.'),
  ('revelation', 18, 4, 'jeremiah', 51, 45, 2, E'*My people, go ye out of the midst of her, and deliver ye every man his soul from the fierce anger of Yahuah (the LORD)* is the verbatim doublet of Jeremiah 51:6 — the call repeated in the same chapter.'),
  ('revelation', 18, 4, 'isaiah', 52, 11, 3, E'*Depart ye, depart ye, go ye out from thence, touch no unclean thing; go ye out of the midst of her* is the parallel-call from Isaiah — addressed to *that bear the vessels of Yahuah (the LORD),* the priestly company called out of the unclean-system.'),
  ('revelation', 17, 1, 'jeremiah', 51, 13, 4, E'*The great whore that sitteth upon many waters* picks up Jeremiah on Babylon — *O thou that dwellest upon many waters, abundant in treasures, thine end is come* — the many-waters identification carried verbatim.'),
  ('revelation', 17, 2, 'jeremiah', 51, 7, 5, E'*With whom the kings of the earth have committed fornication, and the inhabitants of the earth have been made drunk with the wine of her fornication* picks up Jeremiah — *Babylon hath been a golden cup in Yahuah''s (the LORD''s) hand, that made all the earth drunken: the nations have drunken of her wine; therefore the nations are mad.*'),
  ('revelation', 17, 16, 'ezekiel', 23, 25, 6, E'The destruction of the harlot — *they shall make her desolate and naked, and shall eat her flesh, and burn her with fire* — picks up Ezekiel''s oracle against Aholah and Aholibah — *they shall deal furiously with thee, and shall take away thy nose and thine ears... they shall also strip thee out of thy clothes* — the harlot-judgment architecture.'),
  ('revelation', 18, 2, 'isaiah', 21, 9, 7, E'*Babylon the great is fallen, is fallen* is verbatim Isaiah — *Babylon is fallen, is fallen; and all the graven images of her gods he hath broken unto the ground* — the fall-doubled-for-emphasis from the Tanakh-oracle.'),
  ('revelation', 18, 7, 'isaiah', 47, 7, 8, E'*She saith in her heart, I sit a queen, and am no widow, and shall see no sorrow* is verbatim Isaiah — *thou saidst, I shall be a lady for ever... I shall not sit as a widow, neither shall I know the loss of children* — the daughter-of-Babylon''s-self-deception.'),
  ('revelation', 18, 9, 'ezekiel', 27, 1, 9, E'The merchants'' lament over fallen Babylon — wine, oil, fine flour, wheat, beasts, sheep, horses, chariots, and *slaves, and souls of men* — picks up Ezekiel 27''s commodity-lament over Tyre''s fall; the trading-empire architecture carried wholesale.'),
  ('revelation', 18, 23, 'jeremiah', 25, 10, 10, E'*The voice of the bridegroom and of the bride shall be heard no more at all in thee* is verbatim Jeremiah — *I will take from them the voice of mirth, and the voice of gladness, the voice of the bridegroom, and the voice of the bride, the sound of the millstones, and the light of the candle.*'),
  ('revelation', 18, 24, 'jeremiah', 51, 49, 11, E'*In her was found the blood of prophets, and of saints, and of all that were slain upon the earth* picks up Jeremiah — *As Babylon hath caused the slain of Yashar''el (Israel) to fall, so at Babylon shall fall the slain of all the earth* — the harlot''s complicity in the blood of the saints across the ages.'),
  ('revelation', 17, 5, 'genesis', 11, 9, 12, E'*Babylon the Great, the mother of harlots* picks up the Genesis origin — *therefore is the name of it called Babel; because Yahuah (the LORD) did there confound the language of all the earth* — the harlot-system traces its line back to the founding rebellion of Babel.'),
  ('revelation', 17, 14, 'daniel', 7, 9, 13, E'*These shall make war with the Lamb, and the Lamb shall overcome them: for he is Sovereign of sovereigns, and King of kings* picks up Daniel 7''s enthronement-vision — the Ancient of Days seated, the books opened, the kingdom transferred to the Son — the same overthrow Daniel saw, executed in the close-of-the-age war.'),
  ('revelation', 18, 5, 'jeremiah', 51, 9, 14, E'*Her sins have reached unto heaven, and Elohim (God) hath remembered her iniquities* is verbatim Jeremiah — *for her judgment reacheth unto heaven, and is lifted up even to the skies* — the heaven-reaching-iniquity architecture.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:harlot-babylon-and-come-out-of-her | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_revelation_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_revelation_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for harlot-babylon-and-come-out-of-her.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'harlot-babylon-and-come-out-of-her'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:harlot-babylon-and-come-out-of-her | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 14: marriage-supper-and-return-of-the-king
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'marriage-supper-and-return-of-the-king',
    E'The marriage supper and the return of the King with the armies of heaven',
    E'The marriage supper of the Lamb opens chapter 19 — *the marriage of the Lamb is come, and his wife hath made herself ready. And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints.* The bride is the gathered remnant, dressed in the righteousness Ezekiel 36:27 said the Spirit would cause — Spirit-empowered Torah-walking producing the white linen the marriage supper requires. And then the return.\n\n*And I saw heaven opened, and behold a white horse; and he that sat upon him was called Faithful and True, and in righteousness he doth judge and make war. His eyes were as a flame of fire, and on his head were many crowns; and he had a name written, that no man knew, but he himself. And he was clothed with a vesture dipped in blood: and his name is called The Word of Elohim (God).* (Revelation 19:11-13)\n\nThe vesture dipped in blood picks up Isaiah 63 wholesale — the Tanakh''s own picture of Yahuah (the LORD) returning from Edom with garments stained from treading the winepress of the wrath of the nations. The bloody garments are not a Christian theological invention; they are the Formed One''s signature, his clothing as he comes back from the day of vengeance.\n\n*Who is this that cometh from Edom, with dyed garments from Bozrah? this that is glorious in his apparel, travelling in the greatness of his strength? I that speak in righteousness, mighty to save. Wherefore art thou red in thine apparel, and thy garments like him that treadeth in the winefat? I have trodden the winepress alone; and of the people there was none with me: for I will tread them in mine anger, and trample them in my fury; and their blood shall be sprinkled upon my garments, and I will stain all my raiment.* (Isaiah 63:1-3)\n\nThe rider on the white horse is the Formed cloud-rider of Daniel 7, returning to receive the dominion that *shall not pass away.* The rod-of-iron in v.15 is Psalm 2 — *thou shalt break them with a rod of iron.* The wedding-feast and the fowls''-supper are paired contrasts: the bride''s feast at the wedding, the fowls'' feast on the slain kings. The Formed One returns as the King-of-kings, and the antichrist-system''s costumes are stripped off the antichrist-architecture as the beast and the false prophet are taken and cast into the lake of fire.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1014
  FROM _s181_revelation_lookup sv, _s181_revelation_lookup ev
 WHERE sv.book_slug = 'revelation' AND sv.chapter_number = 19 AND sv.verse_number = 1
   AND ev.book_slug = 'revelation' AND ev.chapter_number = 19 AND ev.verse_number = 21
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('revelation', 19, 7, 'ezekiel', 16, 8, 1, E'The bride arrayed in fine linen, *clean and white,* picks up Ezekiel''s marriage-figure — *I spread my skirt over thee, and covered thy nakedness... I clothed thee also with broidered work* — the covenant-marriage architecture restored.'),
  ('revelation', 19, 8, 'ezekiel', 36, 27, 2, E'*The fine linen is the righteousness of saints* lands on the new-covenant promise — *I will put my Ruach (Spirit) within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* — the linen-as-righteous-acts produced by Spirit-empowered Torah-walking.'),
  ('revelation', 19, 11, 'daniel', 7, 13, 3, E'The white-horse rider on the opened heaven picks up Daniel — *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* — the Messianic-return identified, the kingdom-transfer enacted.'),
  ('revelation', 19, 13, 'isaiah', 63, 1, 4, E'*Clothed with a vesture dipped in blood* is verbatim Isaiah — *thy garments like him that treadeth in the winefat... and their blood shall be sprinkled upon my garments, and I will stain all my raiment* — the Tanakh''s own picture of the Formed One returning from the day of vengeance.'),
  ('revelation', 19, 15, 'psalms', 2, 9, 5, E'*He shall rule them with a rod of iron* is verbatim Psalm 2 — *thou shalt break them with a rod of iron* — the Messianic enthronement-psalm fulfilled in the return.'),
  ('revelation', 19, 15, 'isaiah', 11, 4, 6, E'*Out of his mouth goeth a sharp sword, that with it he should smite the nations* picks up Isaiah — *with the rod of his mouth, and with the breath of his lips shall he slay the wicked* — the sword-from-the-mouth architecture from the Messianic prophecy.'),
  ('revelation', 19, 15, 'joel', 3, 13, 7, E'*He treadeth the winepress of the fierceness and wrath of Elohim (God) Almighty* picks up Joel — *come, get you down; for the press is full, the fats overflow; for their wickedness is great* — the winepress-of-wrath the Formed One treads at the return.'),
  ('revelation', 19, 16, 'deuteronomy', 10, 17, 8, E'*KING OF KINGS, AND LORD OF LORDS* picks up Mosheh''s (Moses''s) confession — *for Yahuah (the LORD) your Elohim (God) is Elohim (God) of elohim (gods), and Adon (Lord) of adonim (lords)* — the supreme-sovereign title carried into the return.'),
  ('revelation', 19, 17, 'ezekiel', 39, 17, 9, E'The fowls'' supper — *Come and gather yourselves together unto the supper of the great Elohim (God); that ye may eat the flesh of kings, and the flesh of captains* — is verbatim Ezekiel — *Speak unto every feathered fowl... ye shall eat the flesh of the mighty, and drink the blood of the princes of the earth* — the Gog-and-Magog feast carried into the return-of-the-King.'),
  ('revelation', 19, 9, 'isaiah', 25, 6, 10, E'*Blessed are they which are called unto the marriage supper of the Lamb* picks up Isaiah — *in this mountain shall Yahuah (the LORD) Tseva''ot (of hosts) make unto all people a feast of fat things, a feast of wines on the lees* — the marriage-supper architecture from the Tanakh.'),
  ('revelation', 19, 20, 'daniel', 7, 11, 11, E'*The beast was taken, and with him the false prophet... These both were cast alive into a lake of fire* picks up Daniel — *I beheld even till the beast was slain, and his body destroyed, and given to the burning flame* — the Daniel 7 verdict on the fourth beast enacted at the return.'),
  ('revelation', 19, 1, 'psalms', 113, 1, 12, E'The HalleluYah of the great multitude — *Praise ye Yah* — opens chapter 19 with the Tanakh''s own praise-formula, the doxology of the gathered people.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:marriage-supper-and-return-of-the-king | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_revelation_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_revelation_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for marriage-supper-and-return-of-the-king.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'marriage-supper-and-return-of-the-king'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:marriage-supper-and-return-of-the-king | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 15: appointed-reign-on-the-earth-and-the-priestly-remnant
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'appointed-reign-on-the-earth-and-the-priestly-remnant',
    E'The appointed reign on the earth — the priestly remnant in the kingdom',
    E'The appointed reign of Revelation 20 is the destination of the journey the prophets named. The wheat is gathered out of the nations, sifted in the wilderness of the peoples, brought under the rod, brought into the bond of the new covenant, and brought into the land as a kingdom of priests. The reign is on the earth. The Torah goes forth from Tsion (Zion). The appointed feasts are kept. The remnant reigns with Yahusha (Jesus) HaMashiach (Christ) — not in a heaven that erases the earth, not in a Christian-spiritualized abstraction, and not in the dispensational sub-architecture that quarantines a literal-thousand-year box from the rest of the cycle.\n\n*And I saw thrones, and they sat upon them, and judgment was given unto them: and I saw the souls of them that were beheaded for the witness of Yahusha (Jesus), and for the word of Elohim (God), and which had not worshipped the beast, neither his image, neither had received his mark upon their foreheads, or in their hands; and they lived and reigned with Messiah (Christ) a thousand years.* (Revelation 20:4)\n\nThe thousand years is the appointed reign under symbolic measure — true in substance, not a stopwatch the reader is meant to clock. Multiple witnesses across the canon and the restored extras tell the same reign in different measures: Daniel''s 1,335 days, Hosea''s two days before *the third day he will raise us up,* Jeremiah''s day of Ya''aqov''s (Jacob''s) trouble in a single day, 2 Baruch reading the reign as less than a thousand. Each is true; none is the whole. Single-stranded prophetic time is the chart''s habit, not scripture''s.\n\nThe first resurrection (v.4-6) raises the worthy of the seed — *the rest of the dead lived not again until the thousand years were finished. This is the first resurrection. Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power, but they shall be priests of Elohim (God) and of Messiah (Christ), and shall reign with him a thousand years.* The forefathers who walked the covenant faithfully in their lifetimes — Avraham (Abraham), Yitschaq (Isaac), Ya''aqov (Jacob), Mosheh (Moses), David, the prophets, the faithful unnamed of every generation back — are the natural branches Yahuah (the LORD) is able to graft in again at the first resurrection (Romans 11:24). Even Paul did not presume on attaining it (Philippians 3:11) — the first resurrection is conditional on faithfulness, not automatic on lineage. The priestly company of the reign is the destination, not the entitlement.\n\n*If by any means I might attain unto the resurrection of the dead.* (Philippians 3:11)\n\nThe priestly office Adam was always meant to fill is filled, in the reign, by the gathered and sifted seed — *kings and priests unto our Elohim (God): and we shall reign on the earth* (Revelation 5:10). The Sinai promise that began *ye shall be unto me a kingdom of priests, and an holy nation* (Exodus 19:6) is the destination at which every cyclical retelling of the end arrives.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1015
  FROM _s181_revelation_lookup sv, _s181_revelation_lookup ev
 WHERE sv.book_slug = 'revelation' AND sv.chapter_number = 20 AND sv.verse_number = 1
   AND ev.book_slug = 'revelation' AND ev.chapter_number = 20 AND ev.verse_number = 6
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('revelation', 20, 4, 'daniel', 7, 9, 1, E'The thrones — *I saw thrones, and they sat upon them, and judgment was given unto them* — pick up Daniel 7''s enthronement-vision: *I beheld till the thrones were cast down (set in place), and the Ancient of days did sit* — the same architecture, the same judgment, the same reign.'),
  ('revelation', 20, 4, 'daniel', 7, 22, 2, E'*Judgment was given to the saints of the most High; and the time came that the saints possessed the kingdom* is the verbatim Daniel-source — the saints possessing the kingdom is the reign with the Messiah (Christ).'),
  ('revelation', 20, 6, 'exodus', 19, 6, 3, E'*Priests of Elohim (God) and of Messiah (Christ)* picks up the Sinai promise — *ye shall be unto me a kingdom of priests, and an holy nation* — the destination at which the gathering arrives, the priestly office Adam was always meant to fill.'),
  ('revelation', 20, 6, 'isaiah', 61, 6, 4, E'*Ye shall be named the Priests of Yahuah (the LORD): men shall call you the Ministers of our Elohim (God)* is verbatim Isaiah — the priestly remnant ministering to the nations left alive in the reign.'),
  ('revelation', 20, 4, 'philippians', 3, 11, 5, E'*If by any means I might attain unto the resurrection of the dead* names the first resurrection as conditional on faithfulness — even Paul did not presume; the wheat-among-the-gathered can have its name blotted out at the post-harvest sifting.'),
  ('revelation', 20, 4, '1-thessalonians', 4, 15, 6, E'The first-resurrection architecture — *the dead in Messiah (Christ) shall rise first* — is Paul''s parallel-account of the same raising the seer of Revelation sees enacted; the worthy of the seed gathered into the priestly company of the reign.'),
  ('revelation', 20, 6, 'zechariah', 14, 9, 7, E'*Yahuah (the LORD) shall be king over all the earth: in that day shall there be one Yahuah (the LORD), and his name one* — the reign is on the earth, the kingdom-of-priests minister under the King''s reign over all the earth.'),
  ('revelation', 20, 6, 'isaiah', 2, 3, 8, E'*Out of Tsion (Zion) shall go forth the law, and the word of Yahuah (the LORD) from Yerushalayim (Jerusalem)* — the Torah goes forth from Tsion (Zion) in the reign; the priestly remnant is the instructional company through which the law goes forth to the nations left alive.'),
  ('revelation', 20, 4, 'ezekiel', 20, 35, 9, E'*I will bring you into the wilderness of the people, and there will I plead with you face to face... and I will cause you to pass under the rod, and I will bring you into the bond of the covenant; and I will purge out from among you the rebels* — the post-harvest sifting that precedes the entry into the reign; the wheat is sifted before the priestly office is given.'),
  ('revelation', 20, 6, 'zechariah', 14, 16, 10, E'*Every one that is left of all the nations which came against Yerushalayim (Jerusalem) shall even go up from year to year to worship the King, Yahuah (the LORD) Tseva''ot (of hosts), and to keep the feast of tabernacles* — the nations left alive after the dreadful day receive priestly instruction from the gathered remnant; the framework''s destination-architecture in the reign.'),
  ('revelation', 20, 6, 'hosea', 6, 2, 11, E'*After two days will he revive us: in the third day he will raise us up, and we shall live in his sight* — one of the multiple-witness measures of the appointed reign; the symbolic-measure-not-stopwatch reading the framework holds.'),
  ('revelation', 20, 2, 'genesis', 3, 15, 12, E'*He laid hold on the dragon, that old serpent, which is the devil, and satan, and bound him a thousand years* picks up the Genesis 3:15 head-bruising — the serpent''s seed contained for the reign, loosed for the little season, and finally destroyed; the seed-war finds its closing arc.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:appointed-reign-on-the-earth-and-the-priestly-remnant | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_revelation_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_revelation_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for appointed-reign-on-the-earth-and-the-priestly-remnant.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'appointed-reign-on-the-earth-and-the-priestly-remnant'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:appointed-reign-on-the-earth-and-the-priestly-remnant | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 16: great-white-throne-and-the-one-judgment-from-two-angles
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'great-white-throne-and-the-one-judgment-from-two-angles',
    E'The great white throne — the same one judgment Revelation 11:18 already named',
    E'The great white throne of Revelation 20 is not a separate, sequential judgment laid after the appointed reign. It is the same one judgment of the souls of the dead that Revelation 11:18 already named, shown from another angle. The seer is not adding a fourth bead on a Christian-linear-string. He is showing the cycle close from a fresh face. The Greek-trained habit of beading the chapters end to end and counting them as sequential events is the inherited Christian linear reading; the framework reads Revelation cyclically.\n\n*And the nations were angry, and thy wrath is come, and the time of the dead, that they should be judged, and that thou shouldest give reward unto thy servants the prophets, and to the saints, and them that fear thy name, small and great; and shouldest destroy them which destroy the earth.* (Revelation 11:18)\n\nThat is the verdict. The time of the dead, the wrath, the reward, the destruction of those who destroy the earth — all of it compressed into one verse at the seventh trumpet, with the temple-of-Elohim (God)-opened-in-heaven and the ark-of-his-testament-seen-in-his-temple following. The chapter 11 verdict and the chapter 20 throne are not two reckonings. They are the same reckoning shown twice, so no eye misses it.\n\n*And I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away; and there was found no place for them. And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* (Revelation 20:11-12)\n\nThe books are not the credential-records of an inclusion-gospel that wrote new names in on the basis of post-foundation faith-confession. The books are the works-record judged against the book of life, the names-written-from-the-foundation-of-the-world record (Revelation 13:8; 17:8). Names can only be blotted out (Exodus 32:33, Psalm 69:28, Revelation 3:5) — the warning is to the wheat, and the unfruitful wheat is what *I never knew you* is spoken to (Matthew 7:22-23). Tares are bound and burned at the harvest because they were never wheat (Matthew 13:30). The second death — the lake of fire — is the final destiny of *whosoever was not found written in the book of life,* and the architecture is consistent: written from the foundation, kept by faithful walking, blotted out by lawlessness, judged by the works the books record.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1016
  FROM _s181_revelation_lookup sv, _s181_revelation_lookup ev
 WHERE sv.book_slug = 'revelation' AND sv.chapter_number = 20 AND sv.verse_number = 11
   AND ev.book_slug = 'revelation' AND ev.chapter_number = 20 AND ev.verse_number = 15
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('revelation', 20, 11, 'daniel', 7, 9, 1, E'*I saw a great white throne, and him that sat on it... and the books were opened* is verbatim Daniel — *the Ancient of days did sit, whose garment was white as snow... thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The vision is the same vision.'),
  ('revelation', 20, 12, 'daniel', 12, 1, 2, E'*Every one that shall be found written in the book... and many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* — the two-resurrection architecture and the book of life precondition the seer enacts.'),
  ('revelation', 20, 12, 'malachi', 3, 16, 3, E'*A book of remembrance was written before him for them that feared Yahuah (the LORD), and that thought upon his name* — the books-opened-and-judged architecture preserved from the Tanakh.'),
  ('revelation', 20, 15, 'exodus', 32, 33, 4, E'The book of life is the same book Yahuah (the LORD) told Mosheh (Moses) about — *whosoever hath sinned against me, him will I blot out of my book* — names written from the foundation, blotted out for lawlessness; the not-found-written are those whose names were blotted out, not tares who were never wheat.'),
  ('revelation', 20, 15, 'psalms', 69, 28, 5, E'*Let them be blotted out of the book of the living, and not be written with the righteous* is the Davidic articulation of the same architecture the seer enacts at the lake of fire.'),
  ('revelation', 20, 14, 'hosea', 13, 14, 6, E'*Death and hell were cast into the lake of fire* picks up Hosea — *I will ransom them from the power of the grave; I will redeem them from death: O death, I will be thy plagues; O grave, I will be thy destruction* — death and the grave destroyed in the final verdict.'),
  ('revelation', 20, 12, 'ecclesiastes', 12, 14, 7, E'*For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil* — the works-judgment Solomon named, enacted at the throne.'),
  ('revelation', 20, 13, 'isaiah', 26, 19, 8, E'*Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead* — the sea-and-death-delivering-up-the-dead architecture from the prophet.'),
  ('revelation', 20, 11, 'psalms', 102, 25, 9, E'The fleeing-of-the-earth-and-the-heaven picks up the Davidic — *they shall perish, but thou shalt endure: yea, all of them shall wax old like a garment* — the cosmic-passing-away architecture from the psalm.'),
  ('revelation', 20, 12, 'jeremiah', 17, 10, 10, E'*I Yahuah (the LORD) search the heart, I try the reins, even to give every man according to his ways, and according to the fruit of his doings* — the verbatim works-judgment architecture from the prophet.'),
  ('revelation', 20, 15, 'daniel', 12, 2, 11, E'*Some to everlasting life, and some to shame and everlasting contempt* — the everlasting-contempt destiny is the second-death the seer names at the lake of fire.'),
  ('revelation', 20, 11, 'revelation', 11, 18, 12, E'The great-white-throne reckoning IS the verdict Revelation 11:18 already named — *the time of the dead, that they should be judged, and that thou shouldest give reward unto thy servants the prophets... and shouldest destroy them which destroy the earth.* Two angles, one judgment; the Revelation framework holds the cyclical reading.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:great-white-throne-and-the-one-judgment-from-two-angles | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_revelation_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_revelation_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for great-white-throne-and-the-one-judgment-from-two-angles.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'great-white-throne-and-the-one-judgment-from-two-angles'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:great-white-throne-and-the-one-judgment-from-two-angles | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 17: new-heavens-new-earth-and-the-leaves-for-healing
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'new-heavens-new-earth-and-the-leaves-for-healing',
    E'New heavens, new earth, new Yerushalayim (Jerusalem) — and the leaves for the healing of the nations',
    E'The closing panel of the cycle is the new heavens and new earth — the destination at which every retelling of the end has been arriving. Isaiah 65 and Isaiah 66 lay the architecture down; Ezekiel 40-48 lays down the city the seer sees descending; the tree of life of Genesis 2 reappears in the midst of the street and on either side of the river. The seed of Adam returns to the garden the seed of Adam was made for, and the priestly office is filled.\n\n*For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind.* (Isaiah 65:17)\n\n*And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea. And I John saw the holy city, new Yerushalayim (Jerusalem), coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband.* (Revelation 21:1-2)\n\nThe city has *twelve gates, and at the gates twelve angels, and names written thereon, which are the names of the twelve tribes of the children of Yashar''el (Israel).* The twelve-tribe architecture the framework holds — the same twelve tribes the 144,000 were sealed from, the same twelve tribes Ezekiel 48 apportioned the land to — is inscribed on the gates of the city. The wall has *twelve foundations, and in them the names of the twelve apostles of the Lamb.* The city is built on the witness of the twelve to the twelve, and the architecture refuses to be spiritualized.\n\n*And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb. In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations.* (Revelation 22:1-2)\n\nThe leaves of the tree for the healing of the nations name the priestly-instruction destination of the framework. The nations left alive after the dreadful day — the peoples of Genesis 1 who were never the seed of promise — receive instruction from the gathered remnant of the seed of Adam who fills the priestly office Adam was made for. The reign that began in chapter 20 lands here, in the new city, with the tree of life accessible again and the leaves available for the healing of those the priestly remnant ministers to. The bride is the gathered remnant in marriage-covenant union with the Lamb; the priestly office is filled; the seed of Adam fulfills the destination the patriarchal-promise carried from Genesis forward.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1017
  FROM _s181_revelation_lookup sv, _s181_revelation_lookup ev
 WHERE sv.book_slug = 'revelation' AND sv.chapter_number = 21 AND sv.verse_number = 1
   AND ev.book_slug = 'revelation' AND ev.chapter_number = 22 AND ev.verse_number = 5
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('revelation', 21, 1, 'isaiah', 65, 17, 1, E'*A new heaven and a new earth* is verbatim Isaiah — *Behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind* — the closing-panel architecture from the Tanakh.'),
  ('revelation', 21, 1, 'isaiah', 66, 22, 2, E'*As the new heavens and the new earth, which I will make, shall remain before me, saith Yahuah (the LORD), so shall your seed and your name remain* — the new-creation-permanence architecture the seer enacts.'),
  ('revelation', 21, 2, 'isaiah', 62, 5, 3, E'*Prepared as a bride adorned for her husband* picks up Isaiah — *as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee* — the marriage-covenant architecture the new city embodies.'),
  ('revelation', 21, 4, 'isaiah', 25, 8, 4, E'*Elohim (God) shall wipe away all tears from their eyes* is verbatim Isaiah — *Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces* — the no-more-sorrow architecture from the prophet.'),
  ('revelation', 21, 12, 'ezekiel', 48, 30, 5, E'The twelve gates with the names of the twelve tribes is the verbatim Ezekiel-architecture — *And these are the goings out of the city on the north side... three gates; one gate of Reuben, one gate of Yahudah (Judah), one gate of Levi* — the twelve-tribe restoration inscribed on the city of the close of the age.'),
  ('revelation', 21, 22, 'ezekiel', 48, 35, 6, E'*I saw no temple therein: for Yahuah (the LORD) Elohim (God) Almighty and the Lamb are the temple of it* lands on Ezekiel''s *Yahuah Shammah* — *the name of the city from that day shall be, The LORD is there* — the no-need-for-a-separate-temple architecture, with Yahuah (the LORD) himself the city''s temple.'),
  ('revelation', 21, 23, 'isaiah', 60, 19, 7, E'*The city had no need of the sun, neither of the moon, to shine in it: for the glory of Elohim (God) did lighten it, and the Lamb is the light thereof* is verbatim Isaiah — *the sun shall be no more thy light by day; neither for brightness shall the moon give light unto thee: but Yahuah (the LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory.*'),
  ('revelation', 21, 24, 'isaiah', 60, 3, 8, E'*The nations of them which are saved shall walk in the light of it: and the kings of the earth do bring their glory and honour into it* is verbatim Isaiah — *the nations shall come to thy light, and kings to the brightness of thy rising* — the nations-coming-to-the-light architecture of the closing-panel reign.'),
  ('revelation', 22, 1, 'ezekiel', 47, 1, 9, E'The river of water of life proceeding out of the throne is verbatim Ezekiel — *waters issued out from under the threshold of the house eastward... by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat* — the same river, the same trees on either side, the same healing-of-the-waters architecture.'),
  ('revelation', 22, 2, 'ezekiel', 47, 12, 10, E'*The tree... bare twelve manner of fruits... and the leaves of the tree were for the healing of the nations* is verbatim Ezekiel — *the fruit thereof shall be for meat, and the leaf thereof for medicine* — the priestly-instruction-to-the-nations architecture the framework holds, the destination of the kingdom of priests.'),
  ('revelation', 22, 2, 'genesis', 2, 9, 11, E'The tree of life *in the midst of the street of it* picks up the Genesis 2 garden tree — *the tree of life also in the midst of the garden* — the seed of Adam returns to the garden the seed of Adam was made for.'),
  ('revelation', 22, 14, 'genesis', 3, 24, 12, E'*Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city* reverses Genesis 3:24''s cherubim-guarding the tree of life — the commandment-keeping access the framework names. The right to the tree is conditioned on the commandments; the new-covenant promise of Ezekiel 36:27 producing the walk, the walk producing the right of access.'),
  ('revelation', 21, 3, 'ezekiel', 37, 27, 13, E'*The tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* is verbatim Ezekiel — *my tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people* — the covenant-formula destination.'),
  ('revelation', 21, 7, '2-samuel', 7, 14, 14, E'*I will be his Elohim (God), and he shall be my son* picks up the Davidic-covenant promise — *I will be his father, and he shall be my son* — extended to every overcomer in the new city, the kingdom of priests inheriting the Davidic-son architecture.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:new-heavens-new-earth-and-the-leaves-for-healing | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_revelation_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_revelation_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for new-heavens-new-earth-and-the-leaves-for-healing.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'new-heavens-new-earth-and-the-leaves-for-healing'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:new-heavens-new-earth-and-the-leaves-for-healing | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

COMMIT;
\echo 'Session 181 revelation migration complete.'