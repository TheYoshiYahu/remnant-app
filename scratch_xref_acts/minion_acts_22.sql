-- ----- fragment: minion_acts_22.sql (S217 Acts 22) -----
-- =====================================================================
-- S217 minion — ACTS 22 FULL-LIBRARY cross-references
-- =====================================================================
-- Anchor chapter: ACTS 22.  Tag: a22 (temp view _s217_a22_lookup).  Sort band: 5800-5824 (step 3).
-- Source is ALWAYS the canon Acts 22 verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- Acts 22 is Paul RETELLING his Damascus-road call in the Hebrew tongue. Acts<->Acts points to
-- Acts 9 (the narrative) and Acts 26 (the Agrippa retelling) where the same event is told. The
-- Acts-9-ANCHORED threads (acts-9-the-light-and-the-voice..., acts-9-a-chosen-vessel...) already
-- exist in minion_acts_08_09.sql; this fragment anchors on the Acts-22 source verses and builds
-- the Acts-22 retelling weave (no duplication of the Acts-9-anchored threads).
--
-- WATCHPOINTS (Red Lines #2/#7/#10/#11, Christology, son-of-Adam):
--  * v.3 — Paul the Torah-trained Pharisee at the feet of Gamaliel, "taught according to the
--    perfect manner of the law of the fathers, zealous toward Elohim (God)": the DROPPED-PAUL
--    correction. Paul never abandoned the Torah; the antinomian Paul is the horn's construction.
--    Phil 3:5 (a Pharisee, of the tribe of Benjamin) + Acts 26:5,7 (the twelve tribes' hope).
--  * v.6-8 — the light and the voice retold; the Formed himself (drawn from the Formless, the God
--    of the OT interactions, who came in flesh as Yahusha of Nazareth) appears and names himself.
--    Acts<->Acts to 9:3-6 and 26:13-15. NT-Lord governing rule preserved as the pull gives it.
--  * v.14 — "see that Just One": the Righteous One / righteous Servant / righteous Branch (Isaiah
--    53:11, Jeremiah 23:5, 1 John 2:1). The Formed seen — the Just One whose voice Saul hears.
--  * v.16 — "wash away thy sins, calling on the name of Yahuah (Lord)": Joel 2:32 / Acts 2:21 /
--    Romans 10:13 — calling on the name where the underlying Hebrew is YHWH. NOT a sola-fide
--    formula (Red Line #10); the calling is the turning home, baptism the door, the name the
--    name Joel named for deliverance in the remnant whom Yahuah shall call.
--  * v.21 — "send thee far hence unto the Gentiles": the DISPERSED / scattered house of Yashar'el
--    made nigh — the preserved of Yashar'el restored, the afar-off made my-people (Hosea/Lo-Ammi)
--    — NOT a graft of non-seed by faith-confession (Red Lines #7/#11). Isaiah 49:6 is load-bearing:
--    raise the tribes of Jacob AND restore the preserved of Yashar'el AND a light to the Gentiles;
--    Isaiah 57:19 / Ephesians 2:13,17 the far-off made nigh; Acts 2:39 the promise to them afar off.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 22:
--   v.1-2   defence in the Hebrew tongue   Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative frame)
--   v.3     Gamaliel / perfect manner of the law / zealous   Tanakh: none added (Paul's Torah-credential carried in NT targets)  Extras: none warranted  NT: Philippians 3:5, Acts 26:5, Acts 26:7
--   v.4-5   persecuted this way unto death  Tanakh: none warranted  Extras: none warranted  NT: none added (carried in the light-and-voice retelling thread)
--   v.6-8   the light and the voice retold  Tanakh: none added (the Formed appearing carried in NT Acts-retellings)  Extras: none warranted  NT: Acts 9:4, Acts 9:5, Acts 26:14, Acts 26:15
--   v.9-11  the men saw the light / led blind   Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative; carried in light-and-voice thread)
--   v.12-13 Ananias devout according to the law  Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.14    the God of our fathers / see that Just One   Tanakh: Isaiah 53:11, Jeremiah 23:5  Extras: none warranted  NT: 1 John 2:1
--   v.15    his witness unto all men         Tanakh: none warranted  Extras: none warranted  NT: none added (carried in the chosen-vessel Acts-9 thread)
--   v.16    be baptized, wash away thy sins, calling on the name  Tanakh: Joel 2:32  Extras: none warranted  NT: Acts 2:21, Romans 10:13
--   v.17-20 the trance in the temple         Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.21    far hence unto the Gentiles      Tanakh: Isaiah 49:6, Isaiah 57:19  Extras: none warranted  NT: Ephesians 2:13, Ephesians 2:17, Acts 2:39
--   v.22-23 the crowd's rage at the word     Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative; the rage is the false-inclusion-binary defending itself, carried in the v.21 thread prose)
--   v.24-30 scourging / Roman citizenship    Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--
-- THREADS (slug -> target libraries):
--   5800 acts-22-brought-up-at-the-feet-of-gamaliel-the-torah-trained-pharisee   (NT)
--   5803 acts-22-the-light-and-the-voice-retold-i-am-yahusha-of-nazareth         (NT, Acts<->Acts)
--   5806 acts-22-that-just-one-the-righteous-servant-and-branch-seen             (Tanakh + NT)
--   5809 acts-22-wash-away-thy-sins-calling-on-the-name-of-yahuah                (Tanakh + NT)
--   5812 acts-22-far-hence-unto-the-gentiles-the-dispersed-house-made-nigh       (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s217_a22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-22-brought-up-at-the-feet-of-gamaliel-the-torah-trained-pharisee
  ('canon', 'acts', 22, 3, 'canon', 'philippians', 3, 5, 'free', E'*Circumcised the eighth day, of the stock of Yashar''el (Israel), of the tribe of Benjamin, an Hebrew of the Hebrews; as touching the law, a Pharisee;* (Philippians 3:5). Paul tells the crowd the same thing he tells the Philippians: *I am verily a man which am a Yahudi (Jew) … brought up in this city at the feet of Gamaliel, and taught according to the perfect manner of the law of the fathers, and was zealous toward Elohim (God)* (Acts 22:3). This is no man who abandoned the Torah — he is a Pharisee of the tribe of Benjamin, an Hebrew of the Hebrews, trained in the perfect manner of the law. The Paul who threw away the Torah is the horn''s construction; the Paul of the page is the Torah-faithful Yashar''eli (Israelite) the prophets'' hope sent.'),
  ('canon', 'acts', 22, 3, 'canon', 'acts', 26, 5, 'free', E'*Which knew me from the beginning, if they would testify, that after the most straitest sect of our religion I lived a Pharisee.* (Acts 26:5). Before Agrippa, Paul says it the same way he says it to the crowd at Jerusalem — *taught according to the perfect manner of the law of the fathers* (Acts 22:3). He lived *a Pharisee,* after the most straitest sect, observing the law of the fathers; the zeal that drove the persecution was zeal *toward Elohim (God).* The man was always inside the covenant, never outside the Torah.'),
  ('canon', 'acts', 22, 3, 'canon', 'acts', 26, 7, 'free', E'*Unto which promise our twelve tribes, instantly serving Elohim (God) day and night, hope to come. For which hope''s sake, king Agrippa, I am accused of the Yahudim (Jews).* (Acts 26:7). The Torah-trained Pharisee of Acts 22:3 names the hope he stands for: the promise made to the fathers toward which *our twelve tribes* serve day and night. This is the whole of it — not a man who left Yashar''el (Israel) for some new thing, but a man on trial for the twelve-tribe hope, the gathering of all the houses the prophets promised.'),
  -- thread: acts-22-the-light-and-the-voice-retold-i-am-yahusha-of-nazareth
  ('canon', 'acts', 22, 7, 'canon', 'acts', 9, 4, 'free', E'*And he fell to the earth, and heard a voice saying unto him, Saul, Saul, why persecutest thou me?* (Acts 9:4). Paul now retells it in his own mouth: *I fell unto the ground, and heard a voice saying unto me, Saul, Saul, why persecutest thou me?* (Acts 22:7). The same voice, the same words, the same falling — the One who appeared and spoke through all the history of the fathers, now glorified, speaks Saul''s name from the light, counting the persecution of his disciples as persecution of himself.'),
  ('canon', 'acts', 22, 8, 'canon', 'acts', 9, 5, 'free', E'*And he said, Who art thou, Yahuah (Lord)? And Yahuah (Lord) said, I am Yahusha (Jesus) whom thou persecutest: it is hard for thee to kick against the pricks.* (Acts 9:5). Saul cries the same question in the retelling — *Who art thou, Yahuah (Lord)?* — and hears the same answer: *I am Yahusha (Jesus) of Nazareth, whom thou persecutest* (Acts 22:8). The One in the light who answers to the name Yahuah is Yahusha of Nazareth: the Formed who is Yahuah, drawn from the Formless, who came in the flesh and now appears risen and glorified.'),
  ('canon', 'acts', 22, 7, 'canon', 'acts', 26, 14, 'free', E'*And when we were all fallen to the earth, I heard a voice speaking unto me, and saying in the Hebrew tongue, Saul, Saul, why persecutest thou me? it is hard for thee to kick against the pricks.* (Acts 26:14). Before Agrippa, Paul adds the detail he gives the Jerusalem crowd by speaking it: the voice came *in the Hebrew tongue.* The same falling to the ground, the same *Saul, Saul, why persecutest thou me?* (Acts 22:7) — told a third time, the Formed speaking the persecutor''s name in the tongue of the fathers.'),
  ('canon', 'acts', 22, 8, 'canon', 'acts', 26, 15, 'free', E'*And I said, Who art thou, Yahuah (Lord)? And he said, I am Yahusha (Jesus) whom thou persecutest.* (Acts 26:15). The question and the answer are identical across all three tellings — *Who art thou, Yahuah (Lord)? … I am Yahusha (Jesus) of Nazareth, whom thou persecutest* (Acts 22:8). The Name that answers from the light is the Formed himself: he who is Yahuah and came in the flesh as Yahusha of Nazareth, persecuted in his disciples and now calling the one who hunted them.'),
  -- thread: acts-22-that-just-one-the-righteous-servant-and-branch-seen
  ('canon', 'acts', 22, 14, 'canon', 'isaiah', 53, 11, 'free', E'*He shall see of the travail of his soul, and shall be satisfied: by his knowledge shall my righteous servant justify many; for he shall bear their iniquities.* (Isaiah 53:11). Ananias tells Saul that *the Elohim (God) of our fathers hath chosen thee, that thou shouldest know his will, and see that Just One, and shouldest hear the voice of his mouth* (Acts 22:14). The Just One Saul saw in the light is the righteous Servant Isaiah saw — the One who bears the iniquities of many and by his knowledge justifies them. To see the Just One is to see the Servant of the prophet, satisfied in the travail of his soul.'),
  ('canon', 'acts', 22, 14, 'canon', 'jeremiah', 23, 5, 'free', E'*Behold, the days come, saith Yahuah (LORD), that I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth.* (Jeremiah 23:5). The *Just One* Saul was chosen to see (Acts 22:14) is the righteous Branch Jeremiah named — raised unto David, the King who reigns in justice. The One in the glory of the light is the righteous King the prophet promised, the Branch of David come and seen.'),
  ('canon', 'acts', 22, 14, 'canon', '1-john', 2, 1, 'free', E'*My little children, these things write I unto you, that ye sin not. And if any man sin, we have an advocate with the Father, Yahusha HaMashiach (Jesus Christ) the righteous:* (1 John 2:1). The *Just One* Ananias names (Acts 22:14) is *Yahusha HaMashiach (Jesus Christ) the righteous* — the same Righteous One, the advocate with the Father. The Just One Saul saw and whose voice he heard is the righteous One who stands for his own before the Father.'),
  -- thread: acts-22-wash-away-thy-sins-calling-on-the-name-of-yahuah
  ('canon', 'acts', 22, 16, 'canon', 'joel', 2, 32, 'free', E'*And it shall come to pass, that whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance, as Yahuah (LORD) hath said, and in the remnant whom Yahuah (LORD) shall call.* (Joel 2:32). Ananias says, *arise, and be baptized, and wash away thy sins, calling on the name of Yahuah (Lord)* (Acts 22:16). The name Saul is told to call upon is the name Joel named for deliverance — and the deliverance is *in the remnant whom Yahuah (LORD) shall call.* The calling is not a formula that earns; it is the turning home of one already called in the remnant, the washing the door he walks through.'),
  ('canon', 'acts', 22, 16, 'canon', 'acts', 2, 21, 'free', E'*And it shall come to pass, that whosoever shall call on the name of Yahuah (Lord) shall be saved.* (Acts 2:21). At Pentecost Peter quoted Joel''s promise — *whosoever shall call on the name of Yahuah (Lord) shall be saved* — and now Ananias bids Saul do exactly that: *wash away thy sins, calling on the name of Yahuah (Lord)* (Acts 22:16). The same name, the same calling, the same deliverance — the persecutor brought to call on the Name he had set out to stamp out.'),
  ('canon', 'acts', 22, 16, 'canon', 'romans', 10, 13, 'free', E'*For whosoever shall call upon the name of Yahuah (Lord) shall be saved.* (Romans 10:13). Saul, told to *wash away thy sins, calling on the name of Yahuah (Lord)* (Acts 22:16), would later write the same Joel-promise into his letter to the Romans — *whosoever shall call upon the name of Yahuah (Lord) shall be saved.* The one who called on the Name at the water preaches the calling on the Name; the Name is Yahuah''s, the deliverance the remnant''s.'),
  -- thread: acts-22-far-hence-unto-the-gentiles-the-dispersed-house-made-nigh
  ('canon', 'acts', 22, 21, 'canon', 'isaiah', 49, 6, 'free', E'*And he said, It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth.* (Isaiah 49:6). When Yahusha (Jesus) tells Saul *Depart: for I will send thee far hence unto the Gentiles* (Acts 22:21), the sending is the work Isaiah named: the same Servant raises up the tribes of Jacob AND restores the preserved of Yashar''el (Israel) AND is a light to the Gentiles. The dispersion among the nations is where the preserved of Yashar''el are scattered — and the light goes far hence to gather them, not to splice in a new people.'),
  ('canon', 'acts', 22, 21, 'canon', 'isaiah', 57, 19, 'free', E'*I create the fruit of the lips; Peace, peace to him that is far off, and to him that is near, saith Yahuah (LORD); and I will heal him.* (Isaiah 57:19). The sending *far hence unto the Gentiles* (Acts 22:21) carries the peace Isaiah created for *him that is far off, and to him that is near.* The far-off is not a stranger to the covenant but the scattered of the house made distant by the exile; the same Yahuah (LORD) who heals the near heals the far, and the word goes to gather both.'),
  ('canon', 'acts', 22, 21, 'canon', 'ephesians', 2, 13, 'free', E'*But now in HaMashiach Yahusha (Christ Jesus) ye who sometimes were far off are made nigh by the blood of Messiah (Christ).* (Ephesians 2:13). The ones to whom Saul is *sent far hence* (Acts 22:21) are *ye who sometimes were far off* — the dispersed of Yashar''el (Israel), aliens from the commonwealth by the scattering, now *made nigh.* The far-off made nigh is the homecoming of the house that was estranged, the lost sheep brought back to the fold they were always of.'),
  ('canon', 'acts', 22, 21, 'canon', 'ephesians', 2, 17, 'free', E'*And came and preached peace to you which were afar off, and to them that were nigh.* (Ephesians 2:17). The sending *far hence unto the Gentiles* (Acts 22:21) is the preaching of peace *to you which were afar off, and to them that were nigh* — Yosef and Yahudah, the scattered house and the near house, both gathered. The afar-off are the dispersed seed, not the unrelated nations; the peace preached far hence reconciles the two houses into one.'),
  ('canon', 'acts', 22, 21, 'canon', 'acts', 2, 39, 'free', E'*For the promise is unto you, and to your children, and to all that are afar off, even as many as Yahuah Eloheinu (the Lord our God) shall call.* (Acts 2:39). The sending *far hence* (Acts 22:21) reaches *all that are afar off, even as many as Yahuah Eloheinu (the Lord our God) shall call.* The afar-off are within the promise, not added to it — the dispersed children whom Yahuah Eloheinu (the Lord our God) shall call, the hearing revealing what was already true: they are of the called remnant, made nigh.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-22-brought-up-at-the-feet-of-gamaliel-the-torah-trained-pharisee',
       E'Brought up at the feet of Gamaliel — the Torah-trained Pharisee',
       E'Paul opens his defence in the Hebrew tongue with his own credential: *I am verily a man which am a Yahudi (Jew), born in Tarsus, a city in Cilicia, yet brought up in this city at the feet of Gamaliel, and taught according to the perfect manner of the law of the fathers, and was zealous toward Elohim (God), as ye all are this day* (Acts 22:3). This is the man the horn''s pulpit later turns into the abolisher of the Torah — and the page will not bear it. He tells the Philippians the same: *circumcised the eighth day, of the stock of Yashar''el (Israel), of the tribe of Benjamin, an Hebrew of the Hebrews; as touching the law, a Pharisee* (Philippians 3:5). He tells Agrippa the same: *after the most straitest sect of our religion I lived a Pharisee* (Acts 26:5). And he names the hope the whole defence stands on — *unto which promise our twelve tribes, instantly serving Elohim (God) day and night, hope to come* (Acts 26:7). The man was never outside the Torah and never outside Yashar''el (Israel). He is a Pharisee of Benjamin, Torah-trained in the perfect manner of the law, on trial for the twelve-tribe hope the prophets promised. The Paul who threw away the covenant is a construction; the Paul of the page is the Torah-faithful Yashar''eli the gathering sent.',
       sv.verse_id, ev.verse_id, 'free', 5800
  FROM _s217_a22_lookup sv, _s217_a22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=22 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-22-the-light-and-the-voice-retold-i-am-yahusha-of-nazareth',
       E'The light and the voice retold — I am Yahusha (Jesus) of Nazareth',
       E'Paul retells the Damascus road in his own mouth: *as I made my journey, and was come nigh unto Damascus about noon, suddenly there shone from heaven a great light round about me. And I fell unto the ground, and heard a voice saying unto me, Saul, Saul, why persecutest thou me?* (Acts 22:6-7). He cries the question and hears the Name — *Who art thou, Yahuah (Lord)? And he said unto me, I am Yahusha (Jesus) of Nazareth, whom thou persecutest* (Acts 22:8). It is the same event Luke narrates — *he fell to the earth, and heard a voice saying unto him, Saul, Saul, why persecutest thou me? … I am Yahusha (Jesus) whom thou persecutest* (Acts 9:4-5) — and the same event Paul tells Agrippa, adding that the voice came *in the Hebrew tongue, Saul, Saul, why persecutest thou me?* (Acts 26:14), and again the answer, *I am Yahusha (Jesus) whom thou persecutest* (Acts 26:15). Three tellings, one voice. The One in the light who answers to the name Yahuah is Yahusha of Nazareth — the Formed himself, drawn from the Formless, the God of the fathers'' interactions, who came in the flesh and now appears risen and glorified, counting the persecution of his disciples as persecution of himself.',
       sv.verse_id, ev.verse_id, 'free', 5803
  FROM _s217_a22_lookup sv, _s217_a22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=22 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-22-that-just-one-the-righteous-servant-and-branch-seen',
       E'That Just One — the righteous Servant and Branch seen',
       E'Ananias, *a devout man according to the law, having a good report of all the Yahudim (Jews)* (Acts 22:12), tells Saul what he has been chosen for: *The Elohim (God) of our fathers hath chosen thee, that thou shouldest know his will, and see that Just One, and shouldest hear the voice of his mouth* (Acts 22:14). The Just One Saul saw in the light is the Righteous One the prophets named. He is Isaiah''s righteous Servant — *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* (Isaiah 53:11). He is Jeremiah''s righteous Branch — *I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth* (Jeremiah 23:5). He is the advocate John names — *we have an advocate with the Father, Yahusha HaMashiach (Jesus Christ) the righteous* (1 John 2:1). To see the Just One and hear the voice of his mouth is to see and hear the righteous Servant, the Branch of David, the Righteous One who bears iniquities and stands for his own before the Father.',
       sv.verse_id, ev.verse_id, 'free', 5806
  FROM _s217_a22_lookup sv, _s217_a22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=22 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-22-wash-away-thy-sins-calling-on-the-name-of-yahuah',
       E'Wash away thy sins — calling on the name of Yahuah (Lord)',
       E'Ananias''s charge is plain: *And now why tarriest thou? arise, and be baptized, and wash away thy sins, calling on the name of Yahuah (Lord)* (Acts 22:16). The name Saul is told to call upon is the name the prophet named for deliverance: *whosoever shall call on the name of Yahuah (LORD) shall be delivered … and in the remnant whom Yahuah (LORD) shall call* (Joel 2:32). At Pentecost Peter had already quoted it — *whosoever shall call on the name of Yahuah (Lord) shall be saved* (Acts 2:21) — and Saul himself would later write it to the Romans: *whosoever shall call upon the name of Yahuah (Lord) shall be saved* (Romans 10:13). The calling is no formula that purchases what was not; the deliverance is *in the remnant whom Yahuah (LORD) shall call.* The washing is the door the called one walks through, the calling on the Name the turning home of one already named in the remnant. The persecutor who set out to stamp out the Name is brought to call upon it.',
       sv.verse_id, ev.verse_id, 'free', 5809
  FROM _s217_a22_lookup sv, _s217_a22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=22 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-22-far-hence-unto-the-gentiles-the-dispersed-house-made-nigh',
       E'Far hence unto the Gentiles — the dispersed house made nigh',
       E'In the trance in the temple the Master tells Saul, *Depart: for I will send thee far hence unto the Gentiles* (Acts 22:21) — and at the word the crowd erupts, *Away with such a fellow from the earth: for it is not fit that he should live* (Acts 22:22). The rage is the two-category lie defending itself, hearing in *far hence unto the Gentiles* a betrayal it never was. For the sending is the very work Isaiah named for the Servant: *It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth* (Isaiah 49:6). The same Servant raises the tribes of Jacob, restores the preserved of Yashar''el (Israel), and is a light to the Gentiles — because the dispersion among the nations is exactly where the preserved of Yashar''el are scattered. The far-off are not strangers to the covenant: *Peace, peace to him that is far off, and to him that is near, saith Yahuah (LORD); and I will heal him* (Isaiah 57:19). They are *ye who sometimes were far off* now *made nigh* (Ephesians 2:13), the ones to whom he *came and preached peace … which were afar off, and to them that were nigh* (Ephesians 2:17) — Yosef and Yahudah, the scattered house and the near house, the two made one. The promise reaches *all that are afar off, even as many as Yahuah Eloheinu (the Lord our God) shall call* (Acts 2:39). The sending far hence is not a graft of a new people; it is the gathering of the dispersed seed, the lost sheep made nigh, the hearing revealing what was already true.',
       sv.verse_id, ev.verse_id, 'free', 5812
  FROM _s217_a22_lookup sv, _s217_a22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=22 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-22-brought-up-at-the-feet-of-gamaliel-the-torah-trained-pharisee
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 3:5 — *of the tribe of Benjamin, an Hebrew of the Hebrews; as touching the law, a Pharisee* Paul''s own credential, the Torah-trained Yashar''eli (Israelite), no abolisher of the law (Acts 22:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-brought-up-at-the-feet-of-gamaliel-the-torah-trained-pharisee'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 26:5 — *after the most straitest sect of our religion I lived a Pharisee* the same credential before Agrippa; the man always inside the Torah (Acts 22:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-brought-up-at-the-feet-of-gamaliel-the-torah-trained-pharisee'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 26:7 — *unto which promise our twelve tribes … hope to come* the hope the Torah-trained Pharisee stands trial for: the twelve-tribe gathering (Acts 22:3).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-brought-up-at-the-feet-of-gamaliel-the-torah-trained-pharisee'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-22-the-light-and-the-voice-retold-i-am-yahusha-of-nazareth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 9:4 — *Saul, Saul, why persecutest thou me?* the same voice Luke narrates, now retold by Paul himself (Acts 22:7).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-the-light-and-the-voice-retold-i-am-yahusha-of-nazareth'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 9:5 — *I am Yahusha (Jesus) whom thou persecutest* the Name that answers to Yahuah from the light, the Formed in the flesh (Acts 22:8).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-the-light-and-the-voice-retold-i-am-yahusha-of-nazareth'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 26:14 — *saying in the Hebrew tongue, Saul, Saul, why persecutest thou me?* the third telling, the voice in the tongue of the fathers (Acts 22:7).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-the-light-and-the-voice-retold-i-am-yahusha-of-nazareth'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 26:15 — *I am Yahusha (Jesus) whom thou persecutest* the identical answer across all three tellings; he who is Yahuah came in the flesh as Yahusha (Acts 22:8).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-the-light-and-the-voice-retold-i-am-yahusha-of-nazareth'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-22-that-just-one-the-righteous-servant-and-branch-seen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:11 — *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* the Just One Saul saw is Isaiah''s righteous Servant (Acts 22:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-that-just-one-the-righteous-servant-and-branch-seen'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 23:5 — *I will raise unto David a righteous Branch, and a King shall reign and prosper* the Just One is the righteous Branch of David (Acts 22:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-that-just-one-the-righteous-servant-and-branch-seen'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 2:1 — *an advocate with the Father, Yahusha HaMashiach (Jesus Christ) the righteous* the Just One named is the Righteous One, advocate with the Father (Acts 22:14).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-that-just-one-the-righteous-servant-and-branch-seen'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-22-wash-away-thy-sins-calling-on-the-name-of-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:32 — *whosoever shall call on the name of Yahuah (LORD) shall be delivered … in the remnant whom Yahuah (LORD) shall call* the Name Saul is told to call on, the deliverance in the called remnant (Acts 22:16).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-wash-away-thy-sins-calling-on-the-name-of-yahuah'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 2:21 — *whosoever shall call on the name of Yahuah (Lord) shall be saved* Peter''s Pentecost quotation of Joel; the same calling Saul is now bid to do (Acts 22:16).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-wash-away-thy-sins-calling-on-the-name-of-yahuah'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 10:13 — *whosoever shall call upon the name of Yahuah (Lord) shall be saved* Saul who called on the Name later preaches the calling on the Name (Acts 22:16).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-wash-away-thy-sins-calling-on-the-name-of-yahuah'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-22-far-hence-unto-the-gentiles-the-dispersed-house-made-nigh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:6 — *to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles* the Servant''s one work; the dispersed seed gathered, not a new people grafted (Acts 22:21).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-far-hence-unto-the-gentiles-the-dispersed-house-made-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 57:19 — *Peace, peace to him that is far off, and to him that is near* the far-off is the scattered house made distant by exile, not the unrelated nations (Acts 22:21).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-far-hence-unto-the-gentiles-the-dispersed-house-made-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 2:13 — *ye who sometimes were far off are made nigh by the blood of Messiah (Christ)* the dispersed of Yashar''el (Israel) made nigh, the lost sheep brought home (Acts 22:21).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-far-hence-unto-the-gentiles-the-dispersed-house-made-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 2:17 — *preached peace to you which were afar off, and to them that were nigh* Yosef and Yahudah, the two houses reconciled into one (Acts 22:21).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-far-hence-unto-the-gentiles-the-dispersed-house-made-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 2:39 — *the promise is unto you, and to your children, and to all that are afar off, even as many as Yahuah Eloheinu (the Lord our God) shall call* the afar-off within the promise, called and made nigh (Acts 22:21).'
  FROM cross_reference_threads t, cross_references x, _s217_a22_lookup sv, _s217_a22_lookup tv
 WHERE t.slug='acts-22-far-hence-unto-the-gentiles-the-dispersed-house-made-nigh'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=22 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
