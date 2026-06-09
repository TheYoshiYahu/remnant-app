-- ----- fragment: minion_acts_08_09.sql (S217 Acts 8-9) -----
-- =====================================================================
-- S217 minion — ACTS 8-9 FULL-LIBRARY cross-references
-- =====================================================================
-- Range:  ACTS 8-9.  Tag: a0809 (temp view _s217_a0809_lookup).  Sort band: 5300-5360.
-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- WATCHPOINTS (Red Lines #7/#11, Christology, son-of-Adam):
--  * Philip in Samaria (8:5-25): the Samaritans are the remnant of the half-house of the
--    north — the lost sheep of the house of Yashar'el (Israel), the scattered seed being
--    gathered as the dispersion preaches the word. NEVER a graft of non-seed by confession;
--    the harvest the Master named at the well (John 4) is the same field now reaped.
--  * The eunuch (8:26-39): the suffering-servant Lamb of Isaiah 53:7-8 (load-bearing, quoted
--    verbatim) read by one who came to Yerushalayim to worship — the estranged brought into
--    the house, given a name better than sons (Isaiah 56:3-5,8), the OUTCASTS OF YASHAR'EL
--    gathered. Read as the scattered/estranged seed gathered home, NOT false-inclusion of
--    non-seed by confession.
--  * Saul's call (9:3-6): the Formed appearing — the light from heaven and the voice
--    *I am Yahusha (Jesus) whom thou persecutest.* The God of the OT interactions, the Formed
--    drawn from the Formless, who came in flesh, now glorified, appears and calls. The chosen
--    vessel formed from the womb (Jeremiah 1:5) and called by grace (Galatians 1:15-16) — and
--    grace as the means of his being SENT, not a freedom-from-Torah formula (Red Line #10).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 8:
--   v.1-4   scattered abroad preach Tanakh: Genesis 50:20 (the meant-for-evil/turned-to-good of dispersion); Ezekiel 11:16 weighed (sanctuary in scattering — carried thematically, not added)  Extras: none warranted  NT: none warranted (narrative)
--   v.5-13  Philip in Samaria        Tanakh: none added (the northern-house gathering carried in John 4 NT target)  Extras: none warranted  NT: John 4:22, John 4:35, John 4:39
--   v.9-11  Simon the sorcerer       Tanakh: none added  Extras: none warranted  NT: none warranted (narrative; rebuke threaded at v.20-23)
--   v.14-17 Peter/John, the Spirit   Tanakh: none warranted  Extras: none warranted  NT: none added (the Shavuot outpouring carried in Acts 2 threads, not re-added)
--   v.18-24 buy the gift / gall      Tanakh: Deuteronomy 29:18 (root that beareth gall and wormwood)  Extras: none warranted  NT: none added
--   v.26-33 eunuch reads Isaiah 53   Tanakh: Isaiah 53:7, Isaiah 53:8  Extras: none warranted  NT: none added (Lamb-of-Elohim carried in John 1 threads)
--   v.27,38-39 the eunuch himself    Tanakh: Isaiah 56:3, Isaiah 56:5, Isaiah 56:8  Extras: none warranted  NT: none warranted
--   v.40    Philip at Azotus/Caesarea Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--  ACTS 9:
--   v.3-6   the light and the voice  Tanakh: none added (the Formed appearing carried by NT Acts-retellings)  Extras: none warranted  NT: Acts 22:8, Acts 26:14
--   v.10-16 chosen vessel           Tanakh: Jeremiah 1:5  Extras: none warranted  NT: Galatians 1:15, Galatians 1:16
--   v.17-19 scales fall / baptized   Tanakh: none warranted  Extras: none warranted  NT: Acts 26:18 weighed (open-eyes/turn-from-darkness — carried thematically in chosen-vessel thread, not added)
--   v.20-31 preaches/confounds       Tanakh: none warranted  Extras: none warranted  NT: none added (Galatians 1:23 weighed; narrative re-tell, not load-bearing)
--   v.32-43 Aeneas / Tabitha raised  Tanakh: 1 Kings 17:21 weighed (Elijah raises the widow's son); 2 Kings 4:34-35 weighed (Elisha) — narrative-parallel, framework weight thin, not added  Extras: none warranted  NT: none warranted
--
-- THREADS (slug -> target libraries):
--   5300 acts-8-scattered-abroad-they-went-everywhere-preaching-the-word     (Tanakh)
--   5310 acts-8-philip-in-samaria-the-lost-sheep-of-the-northern-house-reaped (NT)
--   5320 acts-8-thy-money-perish-with-thee-the-gift-of-god-and-the-root-of-gall (Tanakh)
--   5330 acts-8-led-as-a-lamb-to-the-slaughter-the-eunuch-reading-isaiah     (Tanakh)
--   5340 acts-8-a-name-better-than-sons-the-estranged-gathered-into-the-house (Tanakh)
--   5350 acts-9-the-light-and-the-voice-i-am-yahusha-whom-thou-persecutest   (NT, Acts<->Acts)
--   5360 acts-9-a-chosen-vessel-formed-from-the-womb-and-called-by-grace     (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s217_a0809_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-8-scattered-abroad-they-went-everywhere-preaching-the-word
  ('canon', 'acts', 8, 4, 'canon', 'genesis', 50, 20, 'free', E'*But as for you, ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive.* (Genesis 50:20). The persecution scatters the assembly — *they were all scattered abroad throughout the regions of Judæa and Samaria* (Acts 8:1) — yet *they that were scattered abroad went every where preaching the word* (Acts 8:4). What was meant to break the assembly Elohim (God) means unto good, as he did with Joseph: the scattering itself becomes the sowing, the dispersed seed carrying the word into the regions where the lost sheep are.'),
  -- thread: acts-8-philip-in-samaria-the-lost-sheep-of-the-northern-house-reaped
  ('canon', 'acts', 8, 5, 'canon', 'john', 4, 39, 'free', E'*And many of the Samaritans of that city believed on him for the saying of the woman, which testified, He told me all that ever I did.* (John 4:39). *Then Philip went down to the city of Samaria, and preached Messiah (Christ) unto them* (Acts 8:5), and *the people with one accord gave heed* (Acts 8:6). The Master had already begun the harvest in Samaria — the half-house of the north, the lost sheep of the house of Yashar''el (Israel) — and Philip now reaps the field the Master sowed. These are not strangers added; they are the scattered of Yashar''el receiving back the word.'),
  ('canon', 'acts', 8, 6, 'canon', 'john', 4, 35, 'free', E'*Say not ye, There are yet four months, and then cometh harvest? behold, I say unto you, Lift up your eyes, and look on the fields; for they are white already to harvest.* (John 4:35). At the well in Samaria the Master told the disciples the fields were *white already to harvest;* now in the same Samaria *the people with one accord gave heed unto those things which Philip spake* (Acts 8:6). The field the Master named white is the field now reaped — the gathering of the northern house begun.'),
  ('canon', 'acts', 8, 14, 'canon', 'john', 4, 22, 'free', E'*Ye worship ye know not what: we know what we worship: for salvation is of the Yahudim (Jews).* (John 4:22). *Now when the apostles which were at Jerusalem heard that Samaria had received the word of Elohim (God), they sent unto them Peter and John* (Acts 8:14). The Master told the Samaritan woman *salvation is of the Yahudim (Jews)* — the deliverance comes through the house of Yahudah; and now the two houses are knit, the apostles from Yerushalayim laying hands on the believing remnant of the north. Yahudah and Yosef joined, the two sticks made one.'),
  -- thread: acts-8-thy-money-perish-with-thee-the-gift-of-god-and-the-root-of-gall
  ('canon', 'acts', 8, 23, 'canon', 'deuteronomy', 29, 18, 'free', E'*Lest there should be among you man, or woman, or family, or tribe, whose heart turneth away this day from Yahuah Eloheinu (the LORD our God), to go and serve the gods of these nations; lest there should be among you a root that beareth gall and wormwood;* (Deuteronomy 29:18). Peter sees in Simon the very thing Moses warned of within the covenant assembly: *I perceive that thou art in the gall of bitterness, and in the bond of iniquity* (Acts 8:23). The sorcerer who thought *the gift of Elohim (God) may be purchased with money* (Acts 8:20) is the root of gall springing up among the gathered — a heart not right, called to repent, not a people condemned.'),
  -- thread: acts-8-led-as-a-lamb-to-the-slaughter-the-eunuch-reading-isaiah
  ('canon', 'acts', 8, 32, 'canon', 'isaiah', 53, 7, 'free', E'*He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* (Isaiah 53:7). The very place the eunuch read was this: *He was led as a sheep to the slaughter; and like a lamb dumb before his shearer, so opened he not his mouth* (Acts 8:32). The suffering servant of Isaiah is the Lamb led silent to the slaughter — and *Philip … began at the same scripture, and preached unto him Yahusha (Jesus)* (Acts 8:35), naming the Lamb the prophet saw.'),
  ('canon', 'acts', 8, 33, 'canon', 'isaiah', 53, 8, 'free', E'*He was taken from prison and from judgment: and who shall declare his generation? for he was cut off out of the land of the living: for the transgression of my people was he stricken.* (Isaiah 53:8). *In his humiliation his judgment was taken away: and who shall declare his generation? for his life is taken from the earth* (Acts 8:33). The eunuch asks *of whom speaketh the prophet this?* (Acts 8:34), and the answer is the One *cut off out of the land of the living* for the transgression of his people — the servant who poured out his soul, of whom Philip preaches Yahusha (Jesus).'),
  -- thread: acts-8-a-name-better-than-sons-the-estranged-gathered-into-the-house
  ('canon', 'acts', 8, 27, 'canon', 'isaiah', 56, 3, 'free', E'*Neither let the son of the stranger, that hath joined himself to Yahuah (LORD), speak, saying, Yahuah (LORD) hath utterly separated me from his people: neither let the eunuch say, Behold, I am a dry tree.* (Isaiah 56:3). *A man of Ethiopia, an eunuch … had come to Jerusalem for to worship* (Acts 8:27) — one who feared he was cut off, a dry tree, separated from the people. Isaiah forbade that fear: the eunuch joined to Yahuah (LORD) is not separated. The estranged who comes to worship is being brought back, not kept out.'),
  ('canon', 'acts', 8, 38, 'canon', 'isaiah', 56, 5, 'free', E'*Even unto them will I give in mine house and within my walls a place and a name better than of sons and of daughters: I will give them an everlasting name, that shall not be cut off.* (Isaiah 56:5). The eunuch comes to the water — *they went down both into the water … and he baptized him* (Acts 8:38) — and *went on his way rejoicing* (Acts 8:39). The one who feared he was a dry tree, cut off, receives the very thing Isaiah promised the eunuchs who take hold of the covenant: a place and a name in the house, an everlasting name that shall not be cut off.'),
  ('canon', 'acts', 8, 39, 'canon', 'isaiah', 56, 8, 'free', E'*Adonai Yahuah (The Lord GOD) which gathereth the outcasts of Yashar''el (Israel) saith, Yet will I gather others to him, beside those that are gathered unto him.* (Isaiah 56:8). The eunuch *went on his way rejoicing* (Acts 8:39) — gathered. This is the work Isaiah named: Adonai Yahuah (The Lord GOD) who *gathereth the outcasts of Yashar''el (Israel),* still gathering others beside those already gathered. The estranged of the scattered seed brought home, the joy of the outcast made nigh.'),
  -- thread: acts-9-the-light-and-the-voice-i-am-yahusha-whom-thou-persecutest
  ('canon', 'acts', 9, 5, 'canon', 'acts', 26, 14, 'free', E'*And when we were all fallen to the earth, I heard a voice speaking unto me, and saying in the Hebrew tongue, Saul, Saul, why persecutest thou me? it is hard for thee to kick against the pricks.* (Acts 26:14). *And he fell to the earth, and heard a voice saying unto him, Saul, Saul, why persecutest thou me?* (Acts 9:4). Saul retells it before Agrippa in the Hebrew tongue — the Formed himself, the One drawn from the Formless who appeared and spoke through all the history of the fathers, now glorified, speaks Saul''s name from the light.'),
  ('canon', 'acts', 9, 5, 'canon', 'acts', 22, 8, 'free', E'*And I answered, Who art thou, Yahuah (Lord)? And he said unto me, I am Yahusha (Jesus) of Nazareth, whom thou persecutest.* (Acts 22:8). *And he said, Who art thou, Yahuah (Lord)? And Yahuah (Lord) said, I am Yahusha (Jesus) whom thou persecutest* (Acts 9:5). The One in the light answers to the name Saul cried — *Who art thou, Yahuah (Lord)?* — with *I am Yahusha (Jesus).* The Formed who is Yahuah, who came in the flesh as Yahusha of Nazareth, is the One persecuted in his disciples and the One who now calls.'),
  -- thread: acts-9-a-chosen-vessel-formed-from-the-womb-and-called-by-grace
  ('canon', 'acts', 9, 15, 'canon', 'jeremiah', 1, 5, 'free', E'*Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto the nations.* (Jeremiah 1:5). *He is a chosen vessel unto me, to bear my name before the Gentiles, and kings, and the children of Yashar''el (Israel)* (Acts 9:15). As Yahuah (LORD) formed and ordained Jeremiah before the womb and sent him to the nations, so the chosen vessel is set apart before he knew it — the calling precedes the man, the ordaining runs ahead of the response.'),
  ('canon', 'acts', 9, 15, 'canon', 'galatians', 1, 15, 'free', E'*But when it pleased Elohim (God), who separated me from my mother''s womb, and called me by his grace,* (Galatians 1:15). Saul, made the chosen vessel *to bear my name* (Acts 9:15), tells it himself: he was *separated from my mother''s womb, and called by his grace.* The grace is not a release from the commandments but the means by which the persecutor is set apart and sent — the calling reaching back before the womb, revealing what was already true.'),
  ('canon', 'acts', 9, 15, 'canon', 'galatians', 1, 16, 'free', E'*To reveal his Son in me, that I might preach him among the heathen; immediately I conferred not with flesh and blood:* (Galatians 1:16). The chosen vessel is set apart *to bear my name before the Gentiles* (Acts 9:15) — and Saul names the purpose: Elohim (God) was pleased *to reveal his Son in me, that I might preach him.* The vessel is chosen to carry the name to the scattered among the nations; grace is the sending, the revealing of the Son its whole content.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a0809_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a0809_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-8-scattered-abroad-they-went-everywhere-preaching-the-word',
       E'Scattered abroad — they went every where preaching the word',
       E'The death of Stephen breaks open a great persecution, and *they were all scattered abroad throughout the regions of Judæa and Samaria, except the apostles* (Acts 8:1). The enemy means to break the assembly; instead the scattering becomes the sowing: *therefore they that were scattered abroad went every where preaching the word* (Acts 8:4). It is the pattern Joseph named to the brothers who sold him — *ye thought evil against me; but Elohim (God) meant it unto good, to bring to pass, as it is this day, to save much people alive* (Genesis 50:20). What is meant to scatter the seed sows it, and the word goes into the very regions — Samaria, the half-house of the north — where the lost sheep are. The dispersion is not the defeat of the gathering; it is its means.',
       sv.verse_id, ev.verse_id, 'free', 5300
  FROM _s217_a0809_lookup sv, _s217_a0809_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=8 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-8-philip-in-samaria-the-lost-sheep-of-the-northern-house-reaped',
       E'Philip in Samaria — the lost sheep of the northern house reaped',
       E'*Then Philip went down to the city of Samaria, and preached Messiah (Christ) unto them* (Acts 8:5), and *the people with one accord gave heed unto those things which Philip spake* (Acts 8:6). Samaria is the remnant of the half-house of the north — the lost sheep of the house of Yashar''el (Israel), the scattered seed of the ten tribes who were divorced and dispersed. The Master had already begun this harvest at the well: *behold, I say unto you, Lift up your eyes, and look on the fields; for they are white already to harvest* (John 4:35), and *many of the Samaritans of that city believed on him for the saying of the woman* (John 4:39). What the Master sowed in Samaria, Philip now reaps. And the two houses are knit: the Master had told the woman *salvation is of the Yahudim (Jews)* (John 4:22), and now *when the apostles which were at Jerusalem heard that Samaria had received the word of Elohim (God), they sent unto them Peter and John* (Acts 8:14). Yahudah and Yosef joined — the deliverance through the house of Yahudah received by the remnant of the north. These are not strangers added; they are the scattered of Yashar''el receiving back the word that was always theirs.',
       sv.verse_id, ev.verse_id, 'free', 5310
  FROM _s217_a0809_lookup sv, _s217_a0809_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=8 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-8-thy-money-perish-with-thee-the-gift-of-god-and-the-root-of-gall',
       E'Thy money perish with thee — the gift of Elohim (God) and the root of gall',
       E'Simon the sorcerer believes and is baptized, yet when he sees the Spirit given through the laying on of hands he offers money: *Give me also this power, that on whomsoever I lay hands, he may receive the Ruach HaKodesh (Holy Spirit)* (Acts 8:19). Peter''s answer is sharp: *Thy money perish with thee, because thou hast thought that the gift of Elohim (God) may be purchased with money* (Acts 8:20), *for I perceive that thou art in the gall of bitterness, and in the bond of iniquity* (Acts 8:23). This is the very thing Moses warned could spring up within the covenant assembly itself — *lest there should be among you a root that beareth gall and wormwood* (Deuteronomy 29:18), a heart that turns away to serve other gods. Simon is that root of gall among the gathered, a heart not right in the sight of Elohim (God). And yet the word to him is not a verdict but a call: *Repent therefore of this thy wickedness, and pray Elohim (God), if perhaps the thought of thine heart may be forgiven thee* (Acts 8:22).',
       sv.verse_id, ev.verse_id, 'free', 5320
  FROM _s217_a0809_lookup sv, _s217_a0809_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=8 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-8-led-as-a-lamb-to-the-slaughter-the-eunuch-reading-isaiah',
       E'Led as a lamb to the slaughter — the eunuch reading Isaiah',
       E'The angel of Yahuah (Lord) sends Philip to the desert road, and there he finds the Ethiopian eunuch *sitting in his chariot* reading the prophet (Acts 8:28). The place of the scripture he read was the suffering servant: *He was led as a sheep to the slaughter; and like a lamb dumb before his shearer, so opened he not his mouth* (Acts 8:32), and *in his humiliation his judgment was taken away: and who shall declare his generation? for his life is taken from the earth* (Acts 8:33). It is Isaiah, word for word: *he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth* (Isaiah 53:7), *he was taken from prison and from judgment … for he was cut off out of the land of the living: for the transgression of my people was he stricken* (Isaiah 53:8). The eunuch asks *of whom speaketh the prophet this? of himself, or of some other man?* (Acts 8:34), and *Philip opened his mouth, and began at the same scripture, and preached unto him Yahusha (Jesus)* (Acts 8:35). The silent Lamb the prophet saw, cut off for the transgression of his people, is Yahusha (Jesus) — the servant who opened not his mouth.',
       sv.verse_id, ev.verse_id, 'free', 5330
  FROM _s217_a0809_lookup sv, _s217_a0809_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=8 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-8-a-name-better-than-sons-the-estranged-gathered-into-the-house',
       E'A name better than sons — the estranged gathered into the house',
       E'The eunuch *had come to Jerusalem for to worship* (Acts 8:27) — one who, under the old reckoning, might fear he was cut off, a dry tree, separated from the people. But Isaiah had forbidden that fear long before: *Neither let the son of the stranger, that hath joined himself to Yahuah (LORD), speak, saying, Yahuah (LORD) hath utterly separated me from his people: neither let the eunuch say, Behold, I am a dry tree* (Isaiah 56:3). To the eunuch who takes hold of the covenant the promise is *a place and a name better than of sons and of daughters … an everlasting name, that shall not be cut off* (Isaiah 56:5). And so when *they went down both into the water … and he baptized him* (Acts 8:38), and the eunuch *went on his way rejoicing* (Acts 8:39), he receives the very thing Isaiah promised — for it is Adonai Yahuah (The Lord GOD) *which gathereth the outcasts of Yashar''el (Israel)* who saith *Yet will I gather others to him, beside those that are gathered unto him* (Isaiah 56:8). The estranged who came to worship is gathered, not kept out: the scattered and the cut-off brought home and given a name that shall not be cut off.',
       sv.verse_id, ev.verse_id, 'free', 5340
  FROM _s217_a0809_lookup sv, _s217_a0809_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=8 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-9-the-light-and-the-voice-i-am-yahusha-whom-thou-persecutest',
       E'The light and the voice — I am Yahusha (Jesus) whom thou persecutest',
       E'Saul, breathing out threatenings, journeys toward Damascus, and *suddenly there shined round about him a light from heaven: and he fell to the earth, and heard a voice saying unto him, Saul, Saul, why persecutest thou me?* (Acts 9:3-4). He cries *Who art thou, Yahuah (Lord)? And Yahuah (Lord) said, I am Yahusha (Jesus) whom thou persecutest* (Acts 9:5). This is the Formed himself — the One drawn from the Formless who appeared and spoke through all the history of the fathers, now risen and glorified — appearing in light and naming himself. Saul retells it twice more: before the people, *I am Yahusha (Jesus) of Nazareth, whom thou persecutest* (Acts 22:8); and before Agrippa, the voice *in the Hebrew tongue, Saul, Saul, why persecutest thou me? it is hard for thee to kick against the pricks* (Acts 26:14). The One in the light answers to the name Saul cried — *Who art thou, Yahuah (Lord)?* — with *I am Yahusha (Jesus).* He who is Yahuah and came in the flesh as Yahusha of Nazareth is the One persecuted in his disciples and the One who now calls.',
       sv.verse_id, ev.verse_id, 'free', 5350
  FROM _s217_a0809_lookup sv, _s217_a0809_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-9-a-chosen-vessel-formed-from-the-womb-and-called-by-grace',
       E'A chosen vessel — formed from the womb and called by grace',
       E'When Ananias fears the persecutor, Yahuah (Lord) answers, *Go thy way: for he is a chosen vessel unto me, to bear my name before the Gentiles, and kings, and the children of Yashar''el (Israel)* (Acts 9:15). The choosing reaches back before the man knew it — as Yahuah (LORD) said to Jeremiah, *Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto the nations* (Jeremiah 1:5). Saul tells it the same way: it pleased Elohim (God) *who separated me from my mother''s womb, and called me by his grace* (Galatians 1:15), *to reveal his Son in me, that I might preach him among the heathen* (Galatians 1:16). The grace is not a release from the commandments but the means by which the persecutor is set apart and sent — the calling running ahead of the womb, the chosen vessel made to carry the name to the scattered among the nations and to the children of Yashar''el (Israel). The choosing precedes the man; the grace is the sending.',
       sv.verse_id, ev.verse_id, 'free', 5360
  FROM _s217_a0809_lookup sv, _s217_a0809_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=9 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-8-scattered-abroad-they-went-everywhere-preaching-the-word
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 50:20 — *ye thought evil against me; but Elohim (God) meant it unto good … to save much people alive* the scattering meant to break the assembly becomes the sowing of the word (Acts 8:4).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-scattered-abroad-they-went-everywhere-preaching-the-word'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-8-philip-in-samaria-the-lost-sheep-of-the-northern-house-reaped
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 4:39 — *many of the Samaritans of that city believed on him for the saying of the woman* the Master''s harvest in Samaria, now reaped by Philip (Acts 8:5-6).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-philip-in-samaria-the-lost-sheep-of-the-northern-house-reaped'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 4:35 — *Lift up your eyes, and look on the fields; for they are white already to harvest* the field the Master named white is the field Philip now reaps (Acts 8:6).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-philip-in-samaria-the-lost-sheep-of-the-northern-house-reaped'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 4:22 — *salvation is of the Yahudim (Jews)* the deliverance through the house of Yahudah received by the remnant of the north; the two sticks joined (Acts 8:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-philip-in-samaria-the-lost-sheep-of-the-northern-house-reaped'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-8-thy-money-perish-with-thee-the-gift-of-god-and-the-root-of-gall
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 29:18 — *lest there should be among you a root that beareth gall and wormwood* Moses'' warning of the heart that turns within the assembly; Peter sees it in Simon (Acts 8:23).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-thy-money-perish-with-thee-the-gift-of-god-and-the-root-of-gall'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-8-led-as-a-lamb-to-the-slaughter-the-eunuch-reading-isaiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:7 — *he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb* the exact place the eunuch read, the silent suffering servant (Acts 8:32).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-led-as-a-lamb-to-the-slaughter-the-eunuch-reading-isaiah'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:8 — *he was cut off out of the land of the living: for the transgression of my people was he stricken* the One of whom the prophet speaks, whom Philip names Yahusha (Jesus) (Acts 8:33-35).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-led-as-a-lamb-to-the-slaughter-the-eunuch-reading-isaiah'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-8-a-name-better-than-sons-the-estranged-gathered-into-the-house
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 56:3 — *neither let the eunuch say, Behold, I am a dry tree* the fear Isaiah forbids; the eunuch who came to worship is not separated (Acts 8:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-a-name-better-than-sons-the-estranged-gathered-into-the-house'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 56:5 — *a place and a name better than of sons and of daughters … an everlasting name, that shall not be cut off* the promise the baptized eunuch receives (Acts 8:38).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-a-name-better-than-sons-the-estranged-gathered-into-the-house'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 56:8 — *Adonai Yahuah (The Lord GOD) which gathereth the outcasts of Yashar''el (Israel)* the eunuch goes rejoicing, an outcast gathered home (Acts 8:39).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-8-a-name-better-than-sons-the-estranged-gathered-into-the-house'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=8 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-9-the-light-and-the-voice-i-am-yahusha-whom-thou-persecutest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 26:14 — *Saul, Saul, why persecutest thou me? it is hard for thee to kick against the pricks* the voice in the Hebrew tongue, the Formed speaking from the light (Acts 9:4).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-9-the-light-and-the-voice-i-am-yahusha-whom-thou-persecutest'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 22:8 — *I am Yahusha (Jesus) of Nazareth, whom thou persecutest* the One in the light names himself; he who is Yahuah came in the flesh as Yahusha (Acts 9:5).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-9-the-light-and-the-voice-i-am-yahusha-whom-thou-persecutest'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=22 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-9-a-chosen-vessel-formed-from-the-womb-and-called-by-grace
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 1:5 — *Before I formed thee in the belly I knew thee … I ordained thee a prophet unto the nations* the choosing reaching back before the womb, as with the chosen vessel (Acts 9:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-9-a-chosen-vessel-formed-from-the-womb-and-called-by-grace'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 1:15 — *who separated me from my mother''s womb, and called me by his grace* Saul''s own telling; grace is the means of his being set apart and sent (Acts 9:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-9-a-chosen-vessel-formed-from-the-womb-and-called-by-grace'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 1:16 — *To reveal his Son in me, that I might preach him among the heathen* the vessel chosen to carry the name to the scattered among the nations (Acts 9:15).'
  FROM cross_reference_threads t, cross_references x, _s217_a0809_lookup sv, _s217_a0809_lookup tv
 WHERE t.slug='acts-9-a-chosen-vessel-formed-from-the-womb-and-called-by-grace'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
