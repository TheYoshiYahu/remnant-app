-- ----- fragment: minion_matthew_15.sql (S260 Matthew depth) -----
-- ============================================================================
-- Matthew 15 — full-library cross-reference threads (NT DEPTH pass)
-- 4 threads, band 11420 step +3
-- ============================================================================

-- 3a. Temp view --------------------------------------------------------------
CREATE TEMP VIEW _mt15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows ---------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1: 15:1-9 tradition vs commandment / Corban -----------------------
  ('canon','matthew',15,4,'canon','exodus',20,12, 'free', E'*Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Exodus 20:12). This is the very commandment Corban voided — the fifth word of the Ten. Yahusha does not loosen it; he wields it AGAINST the tradition that nullified it. The law is upheld, the tradition rebuked.'),
  ('canon','matthew',15,4,'canon','exodus',21,17, 'free', E'*And he that curseth his father, or his mother, shall surely be put to death* (Exodus 21:17). Yahusha quotes the Torah''s own gravity: dishonouring a parent is a capital matter before Elohim. By their Corban rule the Pharisees taught men to do precisely this and call it piety.'),
  ('canon','matthew',15,4,'canon','leviticus',20,9, 'free', E'*For every one that curseth his father or his mother shall be surely put to death: he hath cursed his father or his mother; his blood shall be upon him* (Leviticus 20:9). The second witness from the Torah to how heavily Elohim weighs the honour of father and mother — the commandment the tradition of the elders made void.'),
  ('canon','matthew',15,6,'canon','isaiah',29,13, 'free', E'*Forasmuch as this people draw near me with their mouth, and with their lips do honour me, but have removed their heart far from me, and their fear toward me is taught by the precept of men* (Isaiah 29:13). Yahusha quotes Isaiah and lays the charge: worship governed by the commandments of men, while the commandment of Elohim is set aside. This is the indictment of TRADITION, never of Torah.'),
  ('canon','matthew',15,4,'apocrypha','ecclesiasticus',3,8, 'extras', E'*Honour your father and mother both in word and deed, that a blessing may come upon you from them* (Sirach 3:8). The wisdom of the fathers pressed the fifth commandment home long before — honour in DEED, not in a vow that withholds support. The Corban evasion is the very opposite of what the elders themselves had taught.'),
  ('canon','matthew',15,5,'apocrypha','ecclesiasticus',3,16, 'extras', E'*He that forsaketh his father is as a blasphemer; and he that angereth his mother is cursed: of Yahuah (God)* (Sirach 3:16). To withhold from a parent under cover of "It is a gift" is to forsake him — and the fathers called that blasphemy. The tradition dressed dishonour in the robes of devotion.'),
  ('canon','matthew',15,8,'canon','mark',7,9, 'free', E'*Full well ye reject the commandment of Elohim (God), that ye may keep your own tradition* (Mark 7:9). Mark sets it bare: the choice was between the commandment of Elohim and the tradition of men, and they chose the tradition. Yahusha stands for the commandment.'),
  -- THREAD 2: 15:10-20 what defiles a man (unwashed hands, NOT dietary law) ---
  ('canon','matthew',15,19,'canon','genesis',6,5, 'free', E'*And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually* (Genesis 6:5). The defilement Yahusha names is the heart''s — the same evil imagination that brought the flood. *Out of the heart proceed evil thoughts, murders, adulteries* — not the dust on unwashed hands.'),
  ('canon','matthew',15,19,'canon','jeremiah',17,9, 'free', E'*The heart is deceitful above all things, and desperately wicked: who can know it?* (Jeremiah 17:9). The prophet long ago located man''s true uncleanness — not in what enters the mouth but in the deceitful heart. This is the whole point: the source of defilement is within.'),
  ('canon','matthew',15,18,'canon','psalms',51,6, 'free', E'*Behold, thou desirest truth in the inward parts: and in the hidden part thou shalt make me to know wisdom* (Psalm 51:6). David knew Elohim looks to the inward parts, not the ceremonially washed hand. *Create in me a clean heart* — the cleansing that matters is of the heart, the very thing the hand-washing tradition could never touch.'),
  ('canon','matthew',15,19,'canon','proverbs',4,23, 'free', E'*Keep thy heart with all diligence; for out of it are the issues of life* (Proverbs 4:23). The wisdom of Proverbs is the key to the saying: the heart is the wellspring, and what flows OUT of it is what defiles. Guard the heart, for that is where defilement is born — not at the dinner table over unwashen hands.'),
  ('canon','matthew',15,20,'canon','mark',7,20, 'free', E'*And he said, That which cometh out of the man, that defileth the man. For from within, out of the heart of men, proceed evil thoughts* (Mark 7:20-21). Mark gives the same teaching and the same subject — *eat bread with unwashen hands* (Mark 7:5). The matter is the Pharisees'' hand-washing tradition, not the clean and unclean of Leviticus.'),
  -- THREAD 3: 15:21-28 the Canaanite woman / children first, stranger grafted -
  ('canon','matthew',15,24,'canon','isaiah',56,8, 'free', E'*Adonai Yahuah (The Lord GOD) which gathereth the outcasts of Yashar''el (Israel) saith, Yet will I gather others to him, beside those that are gathered unto him* (Isaiah 56:8). The order is Isaiah''s own: the outcasts of Yashar''el gathered FIRST, and then *others beside* — the stranger brought in. *I am not sent but unto the lost sheep* is the first half of that promise, not the cancelling of the second.'),
  ('canon','matthew',15,27,'canon','isaiah',56,6, 'free', E'*Also the sons of the stranger, that join themselves to Yahuah (LORD), to serve him, and to love the name of Yahuah (LORD)... every one that keepeth the sabbath from polluting it, and taketh hold of my covenant* (Isaiah 56:6). The Canaanite woman is this very stranger joined to Yahuah — pleading for the crumbs, taking hold by faith. Israel is never cast off; the stranger is grafted in beside her.'),
  ('canon','matthew',15,28,'canon','psalms',22,27, 'free', E'*All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee* (Psalm 22:27). The believing woman of Canaan is a firstfruit of this promise — the kindreds of the nations turning to the Elohim of Yashar''el. The children''s bread is enough that the dogs may eat the crumbs and live.'),
  ('canon','matthew',15,22,'canon','1-kings',17,9, 'free', E'*Arise, get thee to Zarephath, which belongeth to Zidon, and dwell there: behold, I have commanded a widow woman there to sustain thee* (1 Kings 17:9). A gentile widow of Sidon once fed Elijah and saw her dead son raised — the same coasts of Tyre and Sidon where this woman cries out. The faith of the stranger in the borders of Sidon is no new thing in the library.'),
  -- THREAD 4: 15:29-39 the Servant's signs / the table in the wilderness ------
  ('canon','matthew',15,31,'canon','isaiah',35,5, 'free', E'*Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped* (Isaiah 35:5). Matthew lists the very signs Isaiah foretold of the coming of Elohim to save — and the multitude *glorified the Elohim of Yashar''el* when they saw them. The works prove the Servant by the prophet''s own catalogue.'),
  ('canon','matthew',15,31,'canon','isaiah',35,6, 'free', E'*Then shall the lame man leap as an hart, and the tongue of the dumb sing: for in the wilderness shall waters break out, and streams in the desert* (Isaiah 35:6). The dumb speaking, the lame walking, the maimed made whole — Isaiah''s desert blossoming, fulfilled on the mountain by the sea of Galilee. *Behold, your Elohim will come... he will come and save you.*'),
  ('canon','matthew',15,32,'canon','psalms',107,9, 'free', E'*For he satisfieth the longing soul, and filleth the hungry soul with goodness* (Psalm 107:9). The Shepherd who will not send the multitude away fasting is the Yahuah of the psalm who fills the hungry soul — the same who *gathered them out of the lands* and led them in the wilderness, satisfying their hunger by his own hand.'),
  ('canon','matthew',15,33,'canon','exodus',16,4, 'free', E'*Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them* (Exodus 16:4). *Whence should we have so much bread in the wilderness?* — the disciples'' very question is Israel''s old question, and the answer is the same: the One who rained manna spreads a table in the wilderness again.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. Threads ----------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-15-ye-made-the-commandment-of-none-effect-by-tradition-exodus-20-isaiah-29-sirach-3',
       E'Ye made the commandment of Elohim of none effect by your tradition (Exodus 20; Exodus 21; Leviticus 20; Isaiah 29; Sirach 3; Mark 7)',
       E'When the scribes charge his disciples with transgressing *the tradition of the elders*, Yahusha turns the question back upon them: *Why do ye also transgress the commandment of Elohim (God) by your tradition?* This is the heart of it — he stands FOR the Torah AGAINST the traditions of men. The commandment in question is the fifth word: *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Exodus 20:12). The Torah weighs its dishonour as a capital matter — *he that curseth his father, or his mother, shall surely be put to death* (Exodus 21:17), and again *every one that curseth his father or his mother shall be surely put to death... his blood shall be upon him* (Leviticus 20:9). Yet by the rule of Corban — *It is a gift, by whatsoever thou mightest be profited by me* — they taught a man to withhold support from his aged parents and call it devotion: *Thus have ye made the commandment of Elohim (God) of none effect by your tradition.* The fathers themselves had pressed the opposite: *Honour your father and mother both in word and deed, that a blessing may come upon you from them* (Sirach 3:8), and *He that forsaketh his father is as a blasphemer; and he that angereth his mother is cursed: of Yahuah (God)* (Sirach 3:16). So Yahusha seals the charge with Isaiah: *Forasmuch as this people draw near me with their mouth, and with their lips do honour me, but have removed their heart far from me, and their fear toward me is taught by the precept of men* (Isaiah 29:13) — *in vain they do worship me, teaching for doctrines the commandments of men.* Mark sets it barest of all: *Full well ye reject the commandment of Elohim (God), that ye may keep your own tradition* (Mark 7:9). This is the anchor against the lie that here Jesus loosens the law — it is the law UPHELD against the traditions of men, the commandment defended, the precept of men rebuked.',
       sv.verse_id, ev.verse_id, 'extras', 11420
  FROM _mt15_lookup sv, _mt15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=15 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-15-out-of-the-heart-proceed-evil-thoughts-unwashen-hands-genesis-6-jeremiah-17-psalm-51',
       E'Out of the heart proceed evil thoughts — to eat with unwashen hands defileth not (Genesis 6; Jeremiah 17; Psalm 51; Proverbs 4; Mark 7)',
       E'Hear carefully what is — and is NOT — being said. The question on the table is hand-washing: *they wash not their hands when they eat bread* (15:2), and the saying closes on exactly that point: *these are the things which defile a man: but to eat with unwashen hands defileth not a man* (15:20). This is the Pharisees'' ritual tradition, not the clean and unclean foods of Leviticus 11 and Deuteronomy 14, which stand unmoved. The subject is moral defilement versus a ceremonial rinse. *Not that which goeth into the mouth defileth a man; but that which cometh out of the mouth, this defileth a man* — and the source is the heart, just as the Tanakh has always taught. *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually* (Genesis 6:5) — the heart''s evil imagination that brought the flood is the true uncleanness. *The heart is deceitful above all things, and desperately wicked: who can know it?* (Jeremiah 17:9). David knew where Elohim looks: *Behold, thou desirest truth in the inward parts: and in the hidden part thou shalt make me to know wisdom* (Psalm 51:6) — *create in me a clean heart, O Elohim.* And the wisdom of Proverbs is the very key to the parable: *Keep thy heart with all diligence; for out of it are the issues of life* (Proverbs 4:23) — out of the heart flow the things that defile. Mark teaches the identical lesson with the identical setting: *That which cometh out of the man, that defileth the man. For from within, out of the heart of men, proceed evil thoughts* (Mark 7:20-21), the answer to those who *eat bread with unwashen hands.* Guard this well: it is not the dietary law repealed — it is the heart unmasked, the hand-washing tradition put in its place.',
       sv.verse_id, ev.verse_id, 'free', 11423
  FROM _mt15_lookup sv, _mt15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=15 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17',
       E'The lost sheep of Israel first, then the believing stranger — the Canaanite woman (Isaiah 56; Psalm 22; 1 Kings 17)',
       E'A woman of Canaan cries out in the coasts of Tyre and Sidon, *Have mercy on me, O Yahuah (Lord), thou Son of David*, and Yahusha says, *I am not sent but unto the lost sheep of the house of Yashar''el (Israel).* This is not Israel cast off and the stranger put in her place — it is the order of the prophets, the children FIRST. Isaiah set it down exactly so: *Adonai Yahuah (The Lord GOD) which gathereth the outcasts of Yashar''el (Israel) saith, Yet will I gather others to him, beside those that are gathered unto him* (Isaiah 56:8) — the outcasts of Yashar''el gathered, and then *others beside.* And who are the others? *Also the sons of the stranger, that join themselves to Yahuah (LORD), to serve him, and to love the name of Yahuah (LORD)... and taketh hold of my covenant* (Isaiah 56:6) — the very woman, joining herself by faith, pleading for the crumbs that fall from the children''s table. *O woman, great is thy faith.* She is a firstfruit of the psalm''s great promise: *All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee* (Psalm 22:27). Nor is the faith of a gentile woman in these coasts a new thing — *Arise, get thee to Zarephath, which belongeth to Zidon... behold, I have commanded a widow woman there to sustain thee* (1 Kings 17:9): a Sidonian widow once fed Elijah and saw her son raised. The children''s bread is so abundant that the dogs eat the crumbs and live. Israel is never disinherited; the stranger is grafted in beside her — two houses and the nations, gathered home.',
       sv.verse_id, ev.verse_id, 'free', 11426
  FROM _mt15_lookup sv, _mt15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=15 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-15-the-dumb-speak-the-lame-walk-feeding-the-four-thousand-isaiah-35-psalm-107-exodus-16',
       E'The dumb to speak, the lame to walk — feeding the four thousand (Isaiah 35; Psalm 107; Exodus 16)',
       E'On the mountain by the sea of Galilee the multitudes lay the lame, blind, dumb, and maimed at his feet, and he heals them — *insomuch that the multitude wondered, when they saw the dumb to speak, the maimed to be whole, the lame to walk, and the blind to see: and they glorified the Elohim of Yashar''el.* These are precisely the signs Isaiah foretold of the coming of Elohim to save: *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped* (Isaiah 35:5); *Then shall the lame man leap as an hart, and the tongue of the dumb sing: for in the wilderness shall waters break out, and streams in the desert* (Isaiah 35:6) — *behold, your Elohim will come... he will come and save you.* The desert blossoms; the Servant''s works testify to the Servant. Then the Shepherd will not send them away fasting: *I have compassion on the multitude... I will not send them away fasting, lest they faint in the way.* He is the Yahuah of the psalm: *For he satisfieth the longing soul, and filleth the hungry soul with goodness* (Psalm 107:9), who *gathered them out of the lands* and fed them in their wandering. And when the disciples ask, *Whence should we have so much bread in the wilderness, as to fill so great a multitude?* — it is Israel''s ancient question, answered as it was answered then: *Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you* (Exodus 16:4). The One who rained manna spreads a table in the wilderness again — seven loaves multiplied, seven baskets left over, four thousand filled.',
       sv.verse_id, ev.verse_id, 'free', 11429
  FROM _mt15_lookup sv, _mt15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=15 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- 3d. Thread members ---------------------------------------------------------
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:12 — *Honour thy father and thy mother* — the fifth commandment, the very word Corban voided.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-ye-made-the-commandment-of-none-effect-by-tradition-exodus-20-isaiah-29-sirach-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 21:17 — *he that curseth his father, or his mother, shall surely be put to death* — the Torah''s own gravity on dishonour.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-ye-made-the-commandment-of-none-effect-by-tradition-exodus-20-isaiah-29-sirach-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=21 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 20:9 — the second Torah witness: cursing father or mother is a capital matter; the tradition made it void.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-ye-made-the-commandment-of-none-effect-by-tradition-exodus-20-isaiah-29-sirach-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 29:13 — *their fear toward me is taught by the precept of men* — Yahusha''s indictment of TRADITION, never of Torah.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-ye-made-the-commandment-of-none-effect-by-tradition-exodus-20-isaiah-29-sirach-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=29 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 3:8 — *Honour your father and mother both in word and deed* — the fathers pressed the fifth commandment; Corban is its opposite.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-ye-made-the-commandment-of-none-effect-by-tradition-exodus-20-isaiah-29-sirach-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 3:16 — *He that forsaketh his father is as a blasphemer* — withholding under cover of a vow is forsaking; the fathers called it blasphemy.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-ye-made-the-commandment-of-none-effect-by-tradition-exodus-20-isaiah-29-sirach-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Mark 7:9 — *Full well ye reject the commandment of Elohim, that ye may keep your own tradition* — the choice laid bare; Yahusha stands for the commandment.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-ye-made-the-commandment-of-none-effect-by-tradition-exodus-20-isaiah-29-sirach-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:5 — *every imagination of the thoughts of his heart was only evil continually* — the heart''s evil that brought the flood is the true uncleanness.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-out-of-the-heart-proceed-evil-thoughts-unwashen-hands-genesis-6-jeremiah-17-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 17:9 — *The heart is deceitful above all things* — the prophet locates uncleanness within, not in what enters the mouth.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-out-of-the-heart-proceed-evil-thoughts-unwashen-hands-genesis-6-jeremiah-17-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 51:6 — *thou desirest truth in the inward parts* — Elohim looks to the heart, not the ceremonially washed hand.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-out-of-the-heart-proceed-evil-thoughts-unwashen-hands-genesis-6-jeremiah-17-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 4:23 — *Keep thy heart with all diligence; for out of it are the issues of life* — the heart is the wellspring of what defiles.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-out-of-the-heart-proceed-evil-thoughts-unwashen-hands-genesis-6-jeremiah-17-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Mark 7:20-21 — the same teaching, the same subject (*eat bread with unwashen hands*) — the hand-washing tradition, not the clean/unclean of Leviticus.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-out-of-the-heart-proceed-evil-thoughts-unwashen-hands-genesis-6-jeremiah-17-psalm-51'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 56:8 — *gathereth the outcasts of Yashar''el... Yet will I gather others to him, beside* — the children first, the stranger beside.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 56:6 — *the sons of the stranger, that join themselves to Yahuah* — the woman joining herself by faith, grafted in beside Israel.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 22:27 — *all the kindreds of the nations shall worship before thee* — the believing woman a firstfruit of the nations turning.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Kings 17:9 — the Sidonian widow who fed Elijah and saw her son raised — the faith of the stranger in these coasts is no new thing.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-psalm-22-1-kings-17'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 35:5 — *the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped* — the signs of Elohim come to save.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-the-dumb-speak-the-lame-walk-feeding-the-four-thousand-isaiah-35-psalm-107-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 35:6 — *the lame man leap as an hart, and the tongue of the dumb sing* — the desert blossoming, the Servant''s works.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-the-dumb-speak-the-lame-walk-feeding-the-four-thousand-isaiah-35-psalm-107-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 107:9 — *he satisfieth the longing soul, and filleth the hungry soul with goodness* — the Shepherd who will not send them away fasting.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-the-dumb-speak-the-lame-walk-feeding-the-four-thousand-isaiah-35-psalm-107-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 16:4 — *I will rain bread from heaven for you* — the disciples'' wilderness question answered as it was answered then; the table spread again.'
  FROM cross_reference_threads t, cross_references x, _mt15_lookup sv, _mt15_lookup tv
 WHERE t.slug='matthew-15-the-dumb-speak-the-lame-walk-feeding-the-four-thousand-isaiah-35-psalm-107-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=15 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
