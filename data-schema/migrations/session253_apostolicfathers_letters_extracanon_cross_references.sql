-- =====================================================================
-- Session 253 — 2 Clement (Apostolic Fathers) FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session253_apostolicfathers_letters_extracanon_cross_references.sql
-- =====================================================================

\echo 'session253 — 2 Clement (Apostolic Fathers) cross-references starting...'
BEGIN;

-- ----- fragment: minion_2clement_01.sql (session253 2-clement 1) -----
-- Source anchor: lightfoot-apostolic-fathers/2-clement ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2clement1 (view _session253_2clement1_lookup). Sort band base 70100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2clement1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-clement-1-repent-while-time
  ('lightfoot-apostolic-fathers', '2-clement', 1, 8, 'canon', 'joel', 2, 12, 'free', E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* The homilist''s call to repent with the whole heart while we yet live is Joel''s prophetic summons exactly.'),
  ('lightfoot-apostolic-fathers', '2-clement', 1, 8, 'canon', 'joel', 2, 13, 'free', E'Joel 2:13 — *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil.* The mercy that receives the penitent in 2 Clement 1:16 is the very kindness Joel proclaims.'),
  ('lightfoot-apostolic-fathers', '2-clement', 1, 13, 'canon', 'luke', 13, 3, 'free', E'Luke 13:3 — *I tell you, Nay: but, except ye repent, ye shall all likewise perish.* The urgency of repenting forthwith in 2 Clement 1:13 is the Master''s own warning.'),
  ('lightfoot-apostolic-fathers', '2-clement', 1, 16, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The ''time'' and the ''One that receiveth us'' in 2 Clement 1:16 is the Lord''s longsuffering holding the door open.'),
  -- thread: 2-clement-1-potter-reshapes-clay
  ('lightfoot-apostolic-fathers', '2-clement', 1, 8, 'canon', 'jeremiah', 18, 4, 'free', E'Jeremiah 18:4 — *And the vessel that he made of clay was marred in the hand of the potter: so he made it again another vessel, as seemed good to the potter to make it.* The homilist''s twisted-then-reshaped vessel in 2 Clement 1:8 is Yirmeyahu''s parable verbatim.'),
  ('lightfoot-apostolic-fathers', '2-clement', 1, 8, 'canon', 'jeremiah', 18, 6, 'free', E'Jeremiah 18:6 — *O house of Yashar''el (Israel), cannot I do with you as this potter? saith Yahuah (LORD). Behold, as the clay is in the potter''s hand, so are ye in mine hand, O house of Yashar''el (Israel).* The clay-under-the-craftsman of 2 Clement 1:8 is the LORD''s word to the house of Israel — the reshaping mercy stands.'),
  ('lightfoot-apostolic-fathers', '2-clement', 1, 8, 'canon', 'isaiah', 64, 8, 'free', E'Isaiah 64:8 — *But now, O Yahuah (LORD), thou art our father; we are the clay, and thou our potter; and we all are the work of thy hand.* The homily''s plea to be remade before the oven echoes Yeshayahu''s confession of the Father as potter.'),
  -- thread: 2-clement-1-resurrection-of-the-flesh-judgment
  ('lightfoot-apostolic-fathers', '2-clement', 1, 8, 'canon', '1-corinthians', 15, 42, 'free', E'1 Corinthians 15:42 — *So also is the resurrection of the dead. It is sown in corruption; it is raised in incorruption:* The homilist''s insistence that the flesh riseth again in 2 Clement 1:9 is Sha''ul''s resurrection of the body.'),
  ('lightfoot-apostolic-fathers', '2-clement', 1, 8, 'canon', '1-corinthians', 15, 44, 'free', E'1 Corinthians 15:44 — *It is sown a natural body; it is raised a spiritual body. There is a natural body, and there is a spiritual body.* The flesh that is ''guarded as a temple'' and raised again (2 Clement 1:9) is Sha''ul''s body raised spiritual, not abolished.'),
  ('lightfoot-apostolic-fathers', '2-clement', 1, 8, 'canon', 'john', 5, 28, 'free', E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* The denied-then-affirmed resurrection of the flesh in 2 Clement 1:9 is the Master''s own promise of the graves opened.'),
  ('lightfoot-apostolic-fathers', '2-clement', 1, 16, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The day when the secret and open works of men appear (2 Clement 1:16) is Daniel''s twofold awakening to life or to contempt.'),
  ('lightfoot-apostolic-fathers', '2-clement', 1, 16, 'canon', 'malachi', 4, 1, 'free', E'Malachi 4:1 — *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* The ''day of judgment as a burning oven'' in 2 Clement 1:16 is Malachi''s oven verbatim.'),
  -- thread: 2-clement-1-not-righteous-but-sinners
  ('lightfoot-apostolic-fathers', '2-clement', 1, 2, 'canon', 'matthew', 9, 13, 'free', E'Matthew 9:13 — *But go ye and learn what that meaneth, I will have mercy, and not sacrifice: for I am not come to call the righteous, but sinners to repentance.* The ''scripture'' the homilist quotes in 2 Clement 1:2 is this very word of the Master at Matthew''s table.'),
  ('lightfoot-apostolic-fathers', '2-clement', 1, 2, 'canon', 'luke', 5, 32, 'free', E'Luke 5:32 — *I came not to call the righteous, but sinners to repentance.* The saving of ''the things which were perishing'' in 2 Clement 1:2 is the Master''s stated mission, recorded also by Luke.'),
  -- thread: 2-clement-1-confess-in-works-not-lips
  ('lightfoot-apostolic-fathers', '2-clement', 1, 2, 'canon', 'isaiah', 29, 13, 'free', E'Isaiah 29:13 — *Wherefore Yahuah (Lord) said, Forasmuch as this people draw near me with their mouth, and with their lips do honour me, but have removed their heart far from me, and their fear toward me is taught by the precept of men:* The homilist''s own citation ''in Isaiah'' at 2 Clement 1:3 is this verse, against lip-service without the heart.'),
  ('lightfoot-apostolic-fathers', '2-clement', 1, 4, 'canon', 'matthew', 7, 21, 'free', E'Matthew 7:21 — *Not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* The warning that calling Him ''Lord'' will not save in 2 Clement 1:4 is the Master''s own word, quoted nearly verbatim.'),
  ('lightfoot-apostolic-fathers', '2-clement', 1, 4, 'canon', '1-john', 2, 17, 'free', E'1 John 2:17 — *And the world passeth away, and the lust thereof: but he that doeth the will of Elohim (God) abideth for ever.* The homilist''s demand to confess Him ''in our works... by doing righteousness'' (2 Clement 1:4) is Yochanan''s doer of the Father''s will who abides.'),
  -- thread: 2-clement-1-two-masters-noah-daniel-job
  ('lightfoot-apostolic-fathers', '2-clement', 1, 6, 'canon', 'matthew', 6, 24, 'free', E'Matthew 6:24 — *No man can serve two masters: for either he will hate the one, and love the other; or else he will hold to the one, and despise the other. Ye cannot serve Elohim (God) and mammon.* The homilist''s quoted word that no servant can serve two masters in 2 Clement 1:6 is the Master''s saying verbatim.'),
  ('lightfoot-apostolic-fathers', '2-clement', 1, 6, 'canon', 'ezekiel', 14, 14, 'free', E'Ezekiel 14:14 — *Though these three men, Noah, Daniel, and Job, were in it, they should deliver but their own souls by their righteousness, saith Adonai Yahuah (the Lord GOD).* The homilist''s own citation ''in Ezekiel'' of Noah, Daniel, and Job at 2 Clement 1:6 is this verse.'),
  ('lightfoot-apostolic-fathers', '2-clement', 1, 6, 'canon', 'ezekiel', 14, 20, 'free', E'Ezekiel 14:20 — *Though Noah, Daniel, and Job, were in it, as I live, saith Adonai Yahuah (the Lord GOD), they shall deliver neither son nor daughter; they shall but deliver their own souls by their righteousness.* The warning that even the righteous cannot deliver their children (2 Clement 1:6) is Yechezkel''s word that each delivers but his own soul.'),
  -- thread: 2-clement-1-almsgiving-love-covers-sins
  ('lightfoot-apostolic-fathers', '2-clement', 1, 16, 'canon', 'proverbs', 10, 12, 'free', E'Proverbs 10:12 — *Hatred stirreth up strifes: but love covereth all sins.* The homilist''s ''love covereth a multitude of sins'' in 2 Clement 1:16 is Solomon''s proverb.'),
  ('lightfoot-apostolic-fathers', '2-clement', 1, 16, 'canon', '1-peter', 4, 8, 'free', E'1 Peter 4:8 — *And above all things have fervent charity among yourselves: for charity shall cover the multitude of sins.* The same saying the homilist uses at 2 Clement 1:16 stands in Kepha''s letter.'),
  ('lightfoot-apostolic-fathers', '2-clement', 1, 16, 'apocrypha', 'tobit', 4, 10, 'extras', E'Tobit 4:10 — *Because that alms do deliver from death, and suffers not to come into darkness.* The homilist''s claim that almsgiving lifteth off the burden of sin (2 Clement 1:16) is Tobit''s counsel that alms deliver from death.'),
  -- thread: 2-clement-1-gathered-all-nations-everlasting-torah
  ('lightfoot-apostolic-fathers', '2-clement', 1, 17, 'canon', 'isaiah', 66, 18, 'free', E'Isaiah 66:18 — *For I know their works and their thoughts: it shall come, that I will gather all nations and tongues; and they shall come, and see my glory.* The homilist''s quoted promise ''I come to gather together all the nations, tribes, and languages'' at 2 Clement 1:17 is Yeshayahu''s ingathering of all nations and tongues.'),
  ('lightfoot-apostolic-fathers', '2-clement', 1, 17, 'canon', 'isaiah', 66, 23, 'free', E'Isaiah 66:23 — *And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD).* The gathered nations of 2 Clement 1:17 are the all-flesh that worships under the everlasting Sabbath — the commandments stand.'),
  ('lightfoot-apostolic-fathers', '2-clement', 1, 17, 'canon', 'malachi', 4, 4, 'free', E'Malachi 4:4 — *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments.* The homilist''s call to ''go forward in the commandments of Yahuah'' (2 Clement 1:17) is Malachi''s charge to remember the law of Moses.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2clement1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2clement1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-clement-1-repent-while-time',
       E'Repent while we have time — for the door of repentance closes at death',
       E'The homilist returns again and again to one urgent note: *While we are on earth then, let us repent... so also let us, while we are in this world, repent with our whole heart of the evil things which we have done in the flesh, that we may be saved by Yahuah (Lord), while we have yet time for repentance* (2 Clement 1:8) — and again *Therefore, brethren, let us repent forthwith... and let us repent with a whole soul and be saved* (2 Clement 1:13), and once more *seeing that we have time, let us turn again unto Elohim (God) that called us, while we have still One that receiveth us* (2 Clement 1:16). It ain''t new. The same summons is in the Prophets, in the Gospel, and in the Apostle. Joel cries *turn ye even to me with all your heart* (Joel 2:12) and *rend your heart, and not your garments* (Joel 2:13); the Master warns *except ye repent, ye shall all likewise perish* (Luke 13:3); and Kepha unveils the mercy that holds the door open — *not willing that any should perish, but that all should come to repentance* (2 Peter 3:9). The window is the longsuffering of Elohim, not a new gospel.',
       sv.verse_id, ev.verse_id, 'extras', 70100
  FROM _session253_2clement1_lookup sv, _session253_2clement1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='2-clement' AND ev.chapter_number=1 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-clement-1-potter-reshapes-clay',
       E'Clay in the potter''s hand — reshaped before the oven hardens us',
       E'The homilist grounds his call to repent in a Prophet''s image: *for we are clay under the craftsman''s hand. For in like manner as the potter, if he be making a vessel, and it get twisted or crushed in his hands, reshapeth it again; but if he have once put it into the fiery oven, he shall no longer mend it* (2 Clement 1:8). This is not his own coinage — it is Yirmeyahu''s parable lifted whole. The marred vessel: *And the vessel that he made of clay was marred in the hand of the potter: so he made it again another vessel, as seemed good to the potter to make it* (Jeremiah 18:4); and the LORD''s word over the house of Israel: *O house of Yashar''el (Israel), cannot I do with you as this potter? saith Yahuah (LORD)* (Jeremiah 18:6). Yeshayahu confesses the same posture: *we are the clay, and thou our potter; and we all are the work of thy hand* (Isaiah 64:8). The homily simply presses the Prophet''s mercy: be reshaped now, while the clay is still soft.',
       sv.verse_id, ev.verse_id, 'extras', 70103
  FROM _session253_2clement1_lookup sv, _session253_2clement1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='2-clement' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-clement-1-resurrection-of-the-flesh-judgment',
       E'This flesh is judged and riseth again — the resurrection of the body and the day of fire',
       E'Against any who deny the body, the homilist insists: *And let not any one of you say that this flesh is not judged neither riseth again... We ought therefore to guard the flesh as a temple of Elohim (God): for in like manner as ye were called in the flesh, ye shall come also in the flesh* (2 Clement 1:9). And the day is set: *the day of judgment cometh even now as a burning oven, and the powers of the heavens shall melt... and then shall appear the secret and open works of men* (2 Clement 1:16). It ain''t new — the resurrection of the flesh is the Apostle''s gospel and the Prophets'' hope. Sha''ul: *It is sown in corruption; it is raised in incorruption* (1 Corinthians 15:42), *it is sown a natural body; it is raised a spiritual body* (1 Corinthians 15:44). The Master: *all that are in the graves shall hear his voice* (John 5:28), some *unto the resurrection of life* and some *unto the resurrection of damnation* (John 5:29). Daniel saw it: *many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). And the burning oven is Malachi''s: *the day cometh, that shall burn as an oven* (Malachi 4:1).',
       sv.verse_id, ev.verse_id, 'extras', 70106
  FROM _session253_2clement1_lookup sv, _session253_2clement1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='2-clement' AND ev.chapter_number=1 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-clement-1-not-righteous-but-sinners',
       E'I came not to call the righteous, but sinners — the physician of the perishing',
       E'The homilist quotes the Master directly: *another scripture saith, I came not to call the righteous, but sinners. He meaneth this; that it is right to save them that are perishing... So also Messiah (Christ) willed to save the things which were perishing* (2 Clement 1:2). It ain''t new — he is reading from the Gospel itself. At Matthew''s table the Master answers the scoffing Pharisees, *They that be whole need not a physician, but they that are sick... for I am not come to call the righteous, but sinners to repentance* (Matthew 9:13); and Luke records the same word: *I came not to call the righteous, but sinners to repentance* (Luke 5:32). The homily''s whole appeal — that the great and marvellous work is to establish the falling, not the standing — is the Physician''s own purpose.',
       sv.verse_id, ev.verse_id, 'extras', 70109
  FROM _session253_2clement1_lookup sv, _session253_2clement1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='2-clement' AND ev.chapter_number=1 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-clement-1-confess-in-works-not-lips',
       E'Confess Him in works, not lips only — he that doeth the will of the Father',
       E'True confession, the homilist insists, is not speech but obedience: *not only honour Him with our lips, but with our whole heart and with our whole mind. Now He saith also in Isaiah, This people honoureth Me with their lips, but their heart is far from Me* (2 Clement 1:3); and again *let us therefore not only call Him Yahuah (Lord)... for He saith, Not every one that saith unto Me, Yahuah (Lord), Yahuah (Lord), shall be saved, but he that doeth righteousness* (2 Clement 1:4). It ain''t new. He quotes Yeshayahu and the Master both. Isaiah: *this people draw near me with their mouth, and with their lips do honour me, but have removed their heart far from me* (Isaiah 29:13). The Sermon: *Not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven* (Matthew 7:21). And Yochanan seals it: *he that doeth the will of Elohim (God) abideth for ever* (1 John 2:17). Confession is the keeping of His commandments.',
       sv.verse_id, ev.verse_id, 'extras', 70112
  FROM _session253_2clement1_lookup sv, _session253_2clement1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='2-clement' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-clement-1-two-masters-noah-daniel-job',
       E'No servant can serve two masters — and no man''s righteousness saves another',
       E'The homilist sets this age against the age to come and forbids a divided heart: *But Yahuah (Lord) saith, No servant can serve two masters. If we desire to serve both Elohim (God) and mammon, it is unprofitable for us... Now this age and the future are two enemies* (2 Clement 1:6); and he warns that no one else''s merit will rescue us — *the scripture also saith in Ezekiel, Though Noah and Job and Daniel should rise up, they shall not deliver their children in the captivity* (2 Clement 1:6). It ain''t new on either count. The two masters is the Master''s own: *No man can serve two masters... Ye cannot serve Elohim (God) and mammon* (Matthew 6:24). And the Noah-Daniel-Job saying is Yechezkel''s word verbatim: *Though these three men, Noah, Daniel, and Job, were in it, they should deliver but their own souls by their righteousness* (Ezekiel 14:14), *they shall deliver neither son nor daughter; they shall but deliver their own souls by their righteousness* (Ezekiel 14:20). Each must keep his own baptism pure.',
       sv.verse_id, ev.verse_id, 'extras', 70115
  FROM _session253_2clement1_lookup sv, _session253_2clement1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='2-clement' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-clement-1-almsgiving-love-covers-sins',
       E'Almsgiving and love cover a multitude of sins',
       E'The homilist commends mercy as the fruit of repentance: *Almsgiving therefore is a good thing, even as repentance from sin... And love covereth a multitude of sins, but prayer out of a good conscience delivereth from death. Blessed is every man that is found full of these. For almsgiving lifteth off the burden of sin* (2 Clement 1:16). It ain''t new — this saying weaves Mishlei, Kepha, and the Apocrypha into one cord. Solomon: *Hatred stirreth up strifes: but love covereth all sins* (Proverbs 10:12). Kepha: *above all things have fervent charity among yourselves: for charity shall cover the multitude of sins* (1 Peter 4:8). And Tobit, of almsgiving: *alms do deliver from death, and suffers not to come into darkness* (Tobit 4:10). The homily gathers the whole covenant witness that mercy shown is mercy received.',
       sv.verse_id, ev.verse_id, 'extras', 70118
  FROM _session253_2clement1_lookup sv, _session253_2clement1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=16
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='2-clement' AND ev.chapter_number=1 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-clement-1-gathered-all-nations-everlasting-torah',
       E'I come to gather all nations — the regathering under the everlasting commandments',
       E'Looking to the day of His appearing, the homilist quotes the LORD''s promise of an ingathering: *let us strive to go forward in the commandments of Yahuah (Lord), that we all having the same mind may be gathered together unto life. For Yahuah (Lord) said, I come to gather together all the nations, tribes, and languages. Herein He speaketh of the day of His appearing, when He shall come and redeem us, each man according to his works* (2 Clement 1:17). It ain''t new — this is Yeshayahu''s closing vision, and it is bound to the everlasting Torah, not loosed from it. Isaiah: *I will gather all nations and tongues; and they shall come, and see my glory* (Isaiah 66:18) — and that gathered all-flesh worships under the abiding Sabbath: *from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23). So the homily''s own call to ''go forward in the commandments'' stands with Malachi''s charge, *Remember ye the law of Moses my servant... with the statutes and judgments* (Malachi 4:4). The gathering is of every tribe and tongue into the one redeemed people — the commandments kept, not abolished.',
       sv.verse_id, ev.verse_id, 'extras', 70121
  FROM _session253_2clement1_lookup sv, _session253_2clement1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=17
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='2-clement' AND ev.chapter_number=1 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-clement-1-repent-while-time
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* The homilist''s call to repent with the whole heart while we yet live is Joel''s prophetic summons exactly.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-repent-while-time'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 2:13 — *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil.* The mercy that receives the penitent in 2 Clement 1:16 is the very kindness Joel proclaims.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-repent-while-time'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 13:3 — *I tell you, Nay: but, except ye repent, ye shall all likewise perish.* The urgency of repenting forthwith in 2 Clement 1:13 is the Master''s own warning.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-repent-while-time'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=13 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The ''time'' and the ''One that receiveth us'' in 2 Clement 1:16 is the Lord''s longsuffering holding the door open.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-repent-while-time'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-clement-1-potter-reshapes-clay
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 18:4 — *And the vessel that he made of clay was marred in the hand of the potter: so he made it again another vessel, as seemed good to the potter to make it.* The homilist''s twisted-then-reshaped vessel in 2 Clement 1:8 is Yirmeyahu''s parable verbatim.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-potter-reshapes-clay'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=18 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 18:6 — *O house of Yashar''el (Israel), cannot I do with you as this potter? saith Yahuah (LORD). Behold, as the clay is in the potter''s hand, so are ye in mine hand, O house of Yashar''el (Israel).* The clay-under-the-craftsman of 2 Clement 1:8 is the LORD''s word to the house of Israel — the reshaping mercy stands.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-potter-reshapes-clay'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=18 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 64:8 — *But now, O Yahuah (LORD), thou art our father; we are the clay, and thou our potter; and we all are the work of thy hand.* The homily''s plea to be remade before the oven echoes Yeshayahu''s confession of the Father as potter.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-potter-reshapes-clay'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=64 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-clement-1-resurrection-of-the-flesh-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 15:42 — *So also is the resurrection of the dead. It is sown in corruption; it is raised in incorruption:* The homilist''s insistence that the flesh riseth again in 2 Clement 1:9 is Sha''ul''s resurrection of the body.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-resurrection-of-the-flesh-judgment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:44 — *It is sown a natural body; it is raised a spiritual body. There is a natural body, and there is a spiritual body.* The flesh that is ''guarded as a temple'' and raised again (2 Clement 1:9) is Sha''ul''s body raised spiritual, not abolished.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-resurrection-of-the-flesh-judgment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* The denied-then-affirmed resurrection of the flesh in 2 Clement 1:9 is the Master''s own promise of the graves opened.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-resurrection-of-the-flesh-judgment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The day when the secret and open works of men appear (2 Clement 1:16) is Daniel''s twofold awakening to life or to contempt.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-resurrection-of-the-flesh-judgment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Malachi 4:1 — *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* The ''day of judgment as a burning oven'' in 2 Clement 1:16 is Malachi''s oven verbatim.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-resurrection-of-the-flesh-judgment'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-clement-1-not-righteous-but-sinners
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 9:13 — *But go ye and learn what that meaneth, I will have mercy, and not sacrifice: for I am not come to call the righteous, but sinners to repentance.* The ''scripture'' the homilist quotes in 2 Clement 1:2 is this very word of the Master at Matthew''s table.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-not-righteous-but-sinners'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 5:32 — *I came not to call the righteous, but sinners to repentance.* The saving of ''the things which were perishing'' in 2 Clement 1:2 is the Master''s stated mission, recorded also by Luke.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-not-righteous-but-sinners'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=5 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-clement-1-confess-in-works-not-lips
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 29:13 — *Wherefore Yahuah (Lord) said, Forasmuch as this people draw near me with their mouth, and with their lips do honour me, but have removed their heart far from me, and their fear toward me is taught by the precept of men:* The homilist''s own citation ''in Isaiah'' at 2 Clement 1:3 is this verse, against lip-service without the heart.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-confess-in-works-not-lips'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=29 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:21 — *Not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* The warning that calling Him ''Lord'' will not save in 2 Clement 1:4 is the Master''s own word, quoted nearly verbatim.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-confess-in-works-not-lips'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 2:17 — *And the world passeth away, and the lust thereof: but he that doeth the will of Elohim (God) abideth for ever.* The homilist''s demand to confess Him ''in our works... by doing righteousness'' (2 Clement 1:4) is Yochanan''s doer of the Father''s will who abides.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-confess-in-works-not-lips'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-clement-1-two-masters-noah-daniel-job
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 6:24 — *No man can serve two masters: for either he will hate the one, and love the other; or else he will hold to the one, and despise the other. Ye cannot serve Elohim (God) and mammon.* The homilist''s quoted word that no servant can serve two masters in 2 Clement 1:6 is the Master''s saying verbatim.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-two-masters-noah-daniel-job'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 14:14 — *Though these three men, Noah, Daniel, and Job, were in it, they should deliver but their own souls by their righteousness, saith Adonai Yahuah (the Lord GOD).* The homilist''s own citation ''in Ezekiel'' of Noah, Daniel, and Job at 2 Clement 1:6 is this verse.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-two-masters-noah-daniel-job'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 14:20 — *Though Noah, Daniel, and Job, were in it, as I live, saith Adonai Yahuah (the Lord GOD), they shall deliver neither son nor daughter; they shall but deliver their own souls by their righteousness.* The warning that even the righteous cannot deliver their children (2 Clement 1:6) is Yechezkel''s word that each delivers but his own soul.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-two-masters-noah-daniel-job'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=14 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-clement-1-almsgiving-love-covers-sins
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 10:12 — *Hatred stirreth up strifes: but love covereth all sins.* The homilist''s ''love covereth a multitude of sins'' in 2 Clement 1:16 is Solomon''s proverb.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-almsgiving-love-covers-sins'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 4:8 — *And above all things have fervent charity among yourselves: for charity shall cover the multitude of sins.* The same saying the homilist uses at 2 Clement 1:16 stands in Kepha''s letter.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-almsgiving-love-covers-sins'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 4:10 — *Because that alms do deliver from death, and suffers not to come into darkness.* The homilist''s claim that almsgiving lifteth off the burden of sin (2 Clement 1:16) is Tobit''s counsel that alms deliver from death.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-almsgiving-love-covers-sins'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-clement-1-gathered-all-nations-everlasting-torah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 66:18 — *For I know their works and their thoughts: it shall come, that I will gather all nations and tongues; and they shall come, and see my glory.* The homilist''s quoted promise ''I come to gather together all the nations, tribes, and languages'' at 2 Clement 1:17 is Yeshayahu''s ingathering of all nations and tongues.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-gathered-all-nations-everlasting-torah'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 66:23 — *And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD).* The gathered nations of 2 Clement 1:17 are the all-flesh that worships under the everlasting Sabbath — the commandments stand.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-gathered-all-nations-everlasting-torah'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:4 — *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments.* The homilist''s call to ''go forward in the commandments of Yahuah'' (2 Clement 1:17) is Malachi''s charge to remember the law of Moses.'
  FROM cross_reference_threads t, cross_references x, _session253_2clement1_lookup sv, _session253_2clement1_lookup tv
 WHERE t.slug='2-clement-1-gathered-all-nations-everlasting-torah'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='2-clement' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ignatiusephesians_01.sql (session253 ignatius-ephesians 1) -----
-- Source anchor: lightfoot-apostolic-fathers/ignatius-ephesians ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: igeph1 (view _session253_igeph1_lookup). Sort band base 70200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_igeph1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ignatius-ephesians-1-seed-of-david
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 18, 'canon', 'romans', 1, 3, 'free', E'Romans 1:3 — *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh;* Paul names the very thing Ignatius defends in 1:18 — the Messiah truly of David''s seed in the flesh.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 20, 'canon', '2-timothy', 2, 8, 'free', E'2 Timothy 2:8 — *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel:* matches Ignatius 1:20, who calls him the one who after the flesh was of David''s race and points to his passion and resurrection.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 18, 'canon', 'isaiah', 7, 14, 'free', E'Isaiah 7:14 — *Therefore Yahuah (Lord) himself shall give you a sign; Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel.* The virgin-conception Ignatius affirms in 1:18 was promised by the prophet centuries before.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 18, 'canon', 'matthew', 1, 23, 'free', E'Matthew 1:23 — *Behold, a virgin shall be with child, and shall bring forth a son, and they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us.* Matthew records the fulfilment of the virgin-birth Ignatius confesses in 1:18.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 18, 'canon', '1-john', 4, 2, 'free', E'1 John 4:2 — *Hereby know ye the Spirit of Elohim (God): Every spirit that confesseth that Yahusha HaMashiach (Jesus Christ) is come in the flesh is of Elohim (God):* John gives the very test of true confession that Ignatius wields in 1:18 against those who deny the Messiah''s flesh.'),
  -- thread: ignatius-ephesians-1-star-at-his-birth
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 19, 'canon', 'matthew', 2, 2, 'free', E'Matthew 2:2 — *Saying, Where is he that is born King of the Yahudim (Jews)? for we have seen his star in the east, and are come to worship him.* The star Ignatius describes in 1:19 is the very star the magi followed to the newborn King.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 19, 'canon', 'matthew', 2, 9, 'free', E'Matthew 2:9 — *When they had heard the king, they departed; and, lo, the star, which they saw in the east, went before them, till it came and stood over where the young child was.* Matthew confirms the heavenly sign at the nativity that Ignatius exalts in 1:19.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 19, 'canon', 'numbers', 24, 17, 'free', E'Numbers 24:17 — *I shall see him, but not now: I shall behold him, but not nigh: there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel), and shall smite the corners of Moab, and destroy all the children of Sheth.* Balaam''s Star out of Jacob is the ancient prophecy behind the outshining star of Ignatius 1:19.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 19, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* the lights were ordained for signs from creation, and one such sign heralded the King in Ignatius 1:19.'),
  -- thread: ignatius-ephesians-1-temple-of-elohim
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 9, 'canon', 'ephesians', 2, 21, 'free', E'Ephesians 2:21 — *In whom all the building fitly framed together groweth unto an holy temple in Yahuah (Lord):* Paul''s holy temple of living stones is the image Ignatius takes up in 1:9 for the Ephesians built into Elohim''s house.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 9, 'canon', 'ephesians', 2, 22, 'free', E'Ephesians 2:22 — *In whom ye also are builded together for an habitation of Elohim (God) through the Spirit.* The Ephesians being built into a habitation of Elohim is exactly Ignatius''s stones-of-a-temple in 1:9.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 15, 'canon', 'matthew', 18, 20, 'free', E'Matthew 18:20 — *For where two or three are gathered together in my name, there am I in the midst of them.* The indwelling Ignatius desires in 1:15, that we be His temples, is the Messiah''s own promise to the gathered.'),
  -- thread: ignatius-ephesians-1-one-faith-one-body
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 4, 'canon', 'ephesians', 4, 3, 'free', E'Ephesians 4:3 — *Endeavouring to keep the unity of the Spirit in the bond of peace.* Paul''s charge to keep the Spirit''s unity is the very concord Ignatius urges on the Ephesians in 1:4.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 5, 'canon', 'ephesians', 4, 4, 'free', E'Ephesians 4:4 — *There is one body, and one Spirit, even as ye are called in one hope of your calling;* the one body and one hope is the harmonious unity Ignatius seeks in 1:5.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 20, 'canon', 'ephesians', 4, 5, 'free', E'Ephesians 4:5 — *One Yahuah (Lord), one faith, one baptism,* echoes Ignatius''s call in 1:20 to assemble in one faith and one Messiah.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 4, 'canon', 'ephesians', 4, 6, 'free', E'Ephesians 4:6 — *One Elohim (God) and Father of all, who is above all, and through all, and in you all.* The one Father unto whom Ignatius would have them sing with one voice in 1:4.'),
  -- thread: ignatius-ephesians-1-elohim-resisteth-the-proud
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 5, 'canon', 'james', 4, 6, 'free', E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* The exact saying Ignatius quotes as Scripture in 1:5 stands written in James.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 5, 'canon', '1-peter', 5, 5, 'free', E'1 Peter 5:5 — *Likewise, ye younger, submit yourselves unto the elder. Yea, all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble.* Peter joins submission to elders with the same word Ignatius cites in 1:5 against the proud who separate.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 5, 'canon', 'proverbs', 3, 34, 'free', E'Proverbs 3:34 — *Surely he scorneth the scorners: but he giveth grace unto the lowly.* The Tanakh root of the proverb Ignatius quotes in 1:5, carried forward by James and Peter.'),
  -- thread: ignatius-ephesians-1-one-physician
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 7, 'canon', 'matthew', 9, 12, 'free', E'Matthew 9:12 — *But when Yahusha (Jesus) heard that, he said unto them, They that be whole need not a physician, but they that are sick.* The Messiah calls himself the physician of the sick, the one only physician Ignatius confesses in 1:7.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 7, 'canon', 'exodus', 15, 26, 'free', E'Exodus 15:26 — *And said, If thou wilt diligently hearken to the voice of Yahuah Elohayka (the LORD thy God), and wilt do that which is right in his sight, and wilt give ear to his commandments, and keep all his statutes, I will put none of these diseases upon thee, which I have brought upon the Egyptians: for I am Yahuah Rapha (the LORD that healeth thee).* The LORD who heals, bound to His commandments, is the one physician of flesh and spirit named in Ignatius 1:7.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_igeph1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_igeph1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-ephesians-1-seed-of-david',
       E'Of the seed of David, born of the virgin — the real incarnation',
       E'Ignatius writes against those who would empty the Messiah of his flesh: *For our Elohim (God), Yahusha (Jesus) the Messiah (Christ), was conceived in the womb by Mary according to a dispensation, of the seed of David but also of the Ruach HaKodesh (Holy Spirit); and He was born and was baptized that by His passion He might cleanse water* (Ignatius to the Ephesians 1:18). It ain''t new — Paul preached the same gospel *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh* (Romans 1:3), and bade Timothy *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel* (2 Timothy 2:8). The virgin-birth was sworn long before through Isaiah, *Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel* (Isaiah 7:14), fulfilled in Matthew, *they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us* (Matthew 1:23). And the test Ignatius applies is John''s own: *Every spirit that confesseth that Yahusha HaMashiach (Jesus Christ) is come in the flesh is of Elohim (God)* (1 John 4:2). The Messiah truly came in the flesh, of David''s seed.',
       sv.verse_id, ev.verse_id, 'extras', 70200
  FROM _session253_igeph1_lookup sv, _session253_igeph1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=18
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-ephesians' AND ev.chapter_number=1 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-ephesians-1-star-at-his-birth',
       E'A star far outshining them all — the star out of Jacob',
       E'Ignatius tells of the sign in the heavens at the nativity: *A star shone forth in the heaven above all the stars; and its light was unutterable... and all the rest of the constellations with the sun and moon formed themselves into a chorus about the star; but the star itself far outshone them all* (Ignatius to the Ephesians 1:19). It ain''t new — the wise men followed it: *Where is he that is born King of the Yahudim (Jews)? for we have seen his star in the east, and are come to worship him* (Matthew 2:2), and *lo, the star, which they saw in the east, went before them, till it came and stood over where the young child was* (Matthew 2:9). Balaam foresaw that very star in the wilderness: *there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel)* (Numbers 24:17). The lights were appointed for signs from the fourth day: *let them be for signs, and for seasons, and for days, and years* (Genesis 1:14). The whole host bowed to the King.',
       sv.verse_id, ev.verse_id, 'extras', 70203
  FROM _session253_igeph1_lookup sv, _session253_igeph1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=19
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-ephesians' AND ev.chapter_number=1 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-ephesians-1-temple-of-elohim',
       E'Stones of a temple, fitly framed — His temples',
       E'Ignatius calls the saints living stones: *ye are stones of a temple, which were prepared beforehand for a building of Elohim (God) the Father, being hoisted up to the heights through the engine of Yahusha HaMashiach (Jesus Christ), which is the Cross* (Ignatius to the Ephesians 1:9), and bids them be *His temples and He Himself may be in us as our Elohim (God)* (Ignatius to the Ephesians 1:15). It ain''t new — Paul wrote to these same Ephesians of the building *In whom all the building fitly framed together groweth unto an holy temple in Yahuah (Lord)* (Ephesians 2:21), *In whom ye also are builded together for an habitation of Elohim (God) through the Spirit* (Ephesians 2:22). And the gathered stones are never alone, for *where two or three are gathered together in my name, there am I in the midst of them* (Matthew 18:20). The dwelling-place of Elohim is His assembled people.',
       sv.verse_id, ev.verse_id, 'extras', 70206
  FROM _session253_igeph1_lookup sv, _session253_igeph1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-ephesians' AND ev.chapter_number=1 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-ephesians-1-one-faith-one-body',
       E'Harmonious in one — one body, one faith',
       E'Ignatius longs for the saints to sing as one: *being harmonious in concord and taking the key note of Elohim (God) ye may in unison sing with one voice through Yahusha HaMashiach (Jesus Christ) unto the Father* (Ignatius to the Ephesians 1:4), and again to be *closely joined with him... that all things may be harmonious in unity* (Ignatius to the Ephesians 1:5), gathered at last *in one faith and one Yahusha HaMashiach (Jesus Christ)* (Ignatius to the Ephesians 1:20). It ain''t new — Paul charged these very Ephesians, *Endeavouring to keep the unity of the Spirit in the bond of peace* (Ephesians 4:3), *There is one body, and one Spirit, even as ye are called in one hope of your calling* (Ephesians 4:4), *One Yahuah (Lord), one faith, one baptism* (Ephesians 4:5), *One Elohim (God) and Father of all, who is above all, and through all, and in you all* (Ephesians 4:6). The one body keeps the one faith.',
       sv.verse_id, ev.verse_id, 'extras', 70209
  FROM _session253_igeph1_lookup sv, _session253_igeph1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-ephesians' AND ev.chapter_number=1 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-ephesians-1-elohim-resisteth-the-proud',
       E'It is written, Elohim resisteth the proud',
       E'Ignatius quotes the Scripture outright: *Whosoever therefore cometh not to the congregation, he doth thereby show his pride and hath separated himself; for it is written, Elohim (God) resisteth the proud* (Ignatius to the Ephesians 1:5). It ain''t new — he is citing the apostles word for word. James wrote, *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6), and Peter, *be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5). Both draw it from the proverb, *Surely he scorneth the scorners: but he giveth grace unto the lowly* (Proverbs 3:34). Ignatius shows his "it is written" reaches back through the apostles into the Tanakh — the same canon, unbroken.',
       sv.verse_id, ev.verse_id, 'extras', 70212
  FROM _session253_igeph1_lookup sv, _session253_igeph1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-ephesians' AND ev.chapter_number=1 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-ephesians-1-one-physician',
       E'One only physician, of flesh and of spirit',
       E'Ignatius confesses the Healer: *There is one only physician, of flesh and of spirit, generate and ingenerate, Elohim (God)... Son of Mary and Son of Elohim (God), first passible and then impassible, Yahusha HaMashiach (Jesus Christ) our Lord* (Ignatius to the Ephesians 1:7). It ain''t new — the Messiah named himself the physician of the sick: *They that be whole need not a physician, but they that are sick* (Matthew 9:12). And the office is the LORD''s from of old, declared at the waters of Marah: *I am Yahuah Rapha (the LORD that healeth thee)* (Exodus 15:26) — bound there to keeping His commandments and statutes. The one physician of flesh and spirit is none other than Yahuah Rapha come in the flesh.',
       sv.verse_id, ev.verse_id, 'extras', 70215
  FROM _session253_igeph1_lookup sv, _session253_igeph1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-ephesians' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ignatius-ephesians-1-seed-of-david
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:3 — *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh;* Paul names the very thing Ignatius defends in 1:18 — the Messiah truly of David''s seed in the flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-seed-of-david'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Timothy 2:8 — *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel:* matches Ignatius 1:20, who calls him the one who after the flesh was of David''s race and points to his passion and resurrection.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-seed-of-david'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 7:14 — *Therefore Yahuah (Lord) himself shall give you a sign; Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel.* The virgin-conception Ignatius affirms in 1:18 was promised by the prophet centuries before.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-seed-of-david'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 1:23 — *Behold, a virgin shall be with child, and shall bring forth a son, and they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us.* Matthew records the fulfilment of the virgin-birth Ignatius confesses in 1:18.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-seed-of-david'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 John 4:2 — *Hereby know ye the Spirit of Elohim (God): Every spirit that confesseth that Yahusha HaMashiach (Jesus Christ) is come in the flesh is of Elohim (God):* John gives the very test of true confession that Ignatius wields in 1:18 against those who deny the Messiah''s flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-seed-of-david'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-ephesians-1-star-at-his-birth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 2:2 — *Saying, Where is he that is born King of the Yahudim (Jews)? for we have seen his star in the east, and are come to worship him.* The star Ignatius describes in 1:19 is the very star the magi followed to the newborn King.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-star-at-his-birth'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 2:9 — *When they had heard the king, they departed; and, lo, the star, which they saw in the east, went before them, till it came and stood over where the young child was.* Matthew confirms the heavenly sign at the nativity that Ignatius exalts in 1:19.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-star-at-his-birth'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 24:17 — *I shall see him, but not now: I shall behold him, but not nigh: there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel), and shall smite the corners of Moab, and destroy all the children of Sheth.* Balaam''s Star out of Jacob is the ancient prophecy behind the outshining star of Ignatius 1:19.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-star-at-his-birth'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=24 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* the lights were ordained for signs from creation, and one such sign heralded the King in Ignatius 1:19.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-star-at-his-birth'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-ephesians-1-temple-of-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 2:21 — *In whom all the building fitly framed together groweth unto an holy temple in Yahuah (Lord):* Paul''s holy temple of living stones is the image Ignatius takes up in 1:9 for the Ephesians built into Elohim''s house.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-temple-of-elohim'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 2:22 — *In whom ye also are builded together for an habitation of Elohim (God) through the Spirit.* The Ephesians being built into a habitation of Elohim is exactly Ignatius''s stones-of-a-temple in 1:9.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-temple-of-elohim'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 18:20 — *For where two or three are gathered together in my name, there am I in the midst of them.* The indwelling Ignatius desires in 1:15, that we be His temples, is the Messiah''s own promise to the gathered.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-temple-of-elohim'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-ephesians-1-one-faith-one-body
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 4:3 — *Endeavouring to keep the unity of the Spirit in the bond of peace.* Paul''s charge to keep the Spirit''s unity is the very concord Ignatius urges on the Ephesians in 1:4.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-one-faith-one-body'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 4:4 — *There is one body, and one Spirit, even as ye are called in one hope of your calling;* the one body and one hope is the harmonious unity Ignatius seeks in 1:5.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-one-faith-one-body'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 4:5 — *One Yahuah (Lord), one faith, one baptism,* echoes Ignatius''s call in 1:20 to assemble in one faith and one Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-one-faith-one-body'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 4:6 — *One Elohim (God) and Father of all, who is above all, and through all, and in you all.* The one Father unto whom Ignatius would have them sing with one voice in 1:4.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-one-faith-one-body'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-ephesians-1-elohim-resisteth-the-proud
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* The exact saying Ignatius quotes as Scripture in 1:5 stands written in James.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-elohim-resisteth-the-proud'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:5 — *Likewise, ye younger, submit yourselves unto the elder. Yea, all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble.* Peter joins submission to elders with the same word Ignatius cites in 1:5 against the proud who separate.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-elohim-resisteth-the-proud'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 3:34 — *Surely he scorneth the scorners: but he giveth grace unto the lowly.* The Tanakh root of the proverb Ignatius quotes in 1:5, carried forward by James and Peter.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-elohim-resisteth-the-proud'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-ephesians-1-one-physician
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 9:12 — *But when Yahusha (Jesus) heard that, he said unto them, They that be whole need not a physician, but they that are sick.* The Messiah calls himself the physician of the sick, the one only physician Ignatius confesses in 1:7.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-one-physician'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=9 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 15:26 — *And said, If thou wilt diligently hearken to the voice of Yahuah Elohayka (the LORD thy God), and wilt do that which is right in his sight, and wilt give ear to his commandments, and keep all his statutes, I will put none of these diseases upon thee, which I have brought upon the Egyptians: for I am Yahuah Rapha (the LORD that healeth thee).* The LORD who heals, bound to His commandments, is the one physician of flesh and spirit named in Ignatius 1:7.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-one-physician'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ignatiusmagnesians_01.sql (session253 ignatius-magnesians 1) -----
-- Source anchor: lightfoot-apostolic-fathers/ignatius-magnesians ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: igmag1 (view _session253_igmag1_lookup). Sort band base 70300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_igmag1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ignatius-magnesians-1-prophets-lived-by-messiah
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'hebrews', 1, 1, 'free', E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* the one Elohim who spoke through the prophets is the same who manifested Himself through the Son, exactly Ignatius''s claim that the divine prophets lived after the Messiah.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', '1-peter', 1, 11, 'free', E'1 Peter 1:11 — *Searching what, or what manner of time the Spirit of Messiah (Christ) which was in them did signify, when it testified beforehand the sufferings of Messiah (Christ), and the glory that should follow.* Peter names the very grace by which Ignatius says the prophets were inspired — the Spirit of Messiah testifying in them beforehand.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'luke', 24, 27, 'free', E'Luke 24:27 — *And beginning at Moses and all the prophets, he expounded unto them in all the scriptures the things concerning himself.* The Messiah reading Himself out of Moses and the prophets is the ground of Ignatius''s word that the prophets were His disciples expecting Him.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'john', 5, 46, 'free', E'John 5:46 — *For had ye believed Moses, ye would have believed me: for he wrote of me.* That Moses wrote of Him answers Ignatius''s point that the prophets, being His disciples, awaited Him as their teacher.'),
  -- thread: ignatius-magnesians-1-one-elohim-through-the-son
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'john', 1, 18, 'free', E'John 1:18 — *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* The Son who declares the unseen Father is Ignatius''s one Elohim manifesting Himself through Yahusha His Son, the Word from silence.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'john', 14, 9, 'free', E'John 14:9 — *Yahusha (Jesus) saith unto him, Have I been so long time with you, and yet hast thou not known me, Philip? he that hath seen me hath seen the Father; and how sayest thou then, Shew us the Father?* To see the Son is to see the Father — the manifestation Ignatius means by the one Elohim revealed through the Son.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 6, 'canon', 'colossians', 1, 16, 'free', E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* the Son by whom all things were made is the One Ignatius says was with the Father before the worlds and appeared at the end of time.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'john', 8, 29, 'free', E'John 8:29 — *And he that sent me is with me: the Father hath not left me alone; for I do always those things that please him.* The Son always doing the Father''s pleasure is Ignatius''s Word who in all things was well-pleasing unto Him that sent Him.'),
  -- thread: ignatius-magnesians-1-real-birth-passion-resurrection
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 11, 'canon', 'romans', 1, 3, 'free', E'Romans 1:3 — *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh;* the real flesh of David''s seed is exactly the birth Ignatius says was truly and certainly done.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 11, 'canon', 'romans', 1, 4, 'free', E'Romans 1:4 — *And declared to be the Son of Elohim (God) with power, according to the spirit of holiness, by the resurrection from the dead:* the resurrection that declares Him Son matches the resurrection Ignatius binds to the birth and passion under Pilate.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 11, 'canon', '2-timothy', 2, 8, 'free', E'2 Timothy 2:8 — *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel:* Paul''s “remember” of David''s seed raised is the same persuasion Ignatius urges concerning the birth, passion, and resurrection.'),
  -- thread: ignatius-magnesians-1-two-coinages-two-ways
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 4, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Moses'' two set before Israel is the very pair Ignatius names — life and death set before us together.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 4, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* the call to choose life answers Ignatius''s free choice between the two coinages of Elohim and of the world.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 4, 'canon', 'matthew', 7, 13, 'free', E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* the Messiah''s two gates are Ignatius''s two ways, each man going to his own place.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 4, 'canon', 'matthew', 7, 14, 'free', E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The narrow way unto life is the stamp of Elohim the Father which Ignatius bids the faithful bear.'),
  -- thread: ignatius-magnesians-1-the-law-is-not-abolished
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'matthew', 5, 17, 'free', E'Matthew 5:17 — *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil.* Against the anti-sabbath gloss of 1:9, the Messiah''s own word upholds the law and the prophets — the apparatus shows the canon underneath the error.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'mark', 2, 27, 'free', E'Mark 2:27 — *And he said unto them, The sabbath was made for man, and not man for the sabbath:* the sabbath is a gift made for man, not a thing to be discarded as 1:9 would have it.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'mark', 2, 28, 'free', E'Mark 2:28 — *Therefore the Son of Adam is Yahuah (Lord) also of the sabbath.* The Messiah is the sabbath''s Lord, not its abolisher — the truth that corrects the antinomian turn of 1:9.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 8, 'canon', 'isaiah', 66, 23, 'free', E'Isaiah 66:23 — *And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD).* The everlasting sabbath worship of all flesh refutes the notion of no longer observing sabbaths.'),
  ('lightfoot-apostolic-fathers', 'ignatius-magnesians', 1, 10, 'canon', '1-corinthians', 5, 8, 'free', E'1 Corinthians 5:8 — *Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth.* Paul''s leaven figure purges malice while keeping the feast — the leaven of 1:10 is the leaven of wickedness, not the appointed times themselves.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_igmag1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_igmag1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-magnesians-1-prophets-lived-by-messiah',
       E'The divine prophets lived after the Messiah — it ain''t new',
       E'Ignatius will not have the witness of the Messiah severed from the witness of the prophets: *“For if even unto this day we live after the manner of Judaism, we avow that we have not received grace: for the divine prophets lived after HaMashiach Yahusha (Christ Jesus). For this cause also they were perse-cuted, being inspired by His grace... seeing that even the prophets, being His disciples, were expecting Him as their teacher through the Spirit”* (Ignatius to the Magnesians 1:8-9). This is the apostolic confession exactly: the Spirit of Messiah spoke in the prophets before ever He came in flesh. *“Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets”* (Hebrews 1:1). Peter says the prophets *“prophesied of the grace that should come unto you”*, *“Searching what... the Spirit of Messiah (Christ) which was in them did signify, when it testified beforehand the sufferings of Messiah”* (1 Peter 1:10-11). And the risen Messiah Himself, *“beginning at Moses and all the prophets, he expounded unto them in all the scriptures the things concerning himself”* (Luke 24:27) — for, as He told them, Moses *“wrote of me”* (John 5:46). The prophets were never a discarded scaffolding; they were His disciples awaiting their Teacher.',
       sv.verse_id, ev.verse_id, 'extras', 70300
  FROM _session253_igmag1_lookup sv, _session253_igmag1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-magnesians' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-magnesians-1-one-elohim-through-the-son',
       E'One Elohim manifested through the Son, the Word from silence',
       E'Against strange doctrines Ignatius confesses the one Elohim made known through His Son: *“there is one Elohim (God) who mani-fested Himself through Yahusha HaMashiach (Jesus Christ) His Son, who is His Word that proceeded from silence, who in all things was well-pleasing unto Him that sent Him”* (Ignatius to the Magnesians 1:8); the Son *“who was with the Father before the worlds and appeared at the end of time”* (1:6), *“who came forth from One Father and is with One and departed unto One”* (1:7). This is the Logos of the apostle: *“No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him”* (John 1:18) — and *“he that hath seen me hath seen the Father”* (John 14:9). The Son by whom all was made: *“For by him were all things created, that are in heaven, and that are in earth, visible and invisible”* (Colossians 1:16), and *“he is before all things, and by him all things consist”* (Colossians 1:17). The Word ever well-pleasing: *“he that sent me is with me: the Father hath not left me alone; for I do always those things that please him”* (John 8:29).',
       sv.verse_id, ev.verse_id, 'extras', 70303
  FROM _session253_igmag1_lookup sv, _session253_igmag1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-magnesians' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-magnesians-1-real-birth-passion-resurrection',
       E'Truly born, truly suffered, truly raised — under Pontius Pilate',
       E'Ignatius guards the real incarnation against every emptying gloss: *“be ye fully persuaded concerning the birth and the passion and the resurrection, which took place in the time of the governorship of Pontius Pilate; for these things were truly and certainly done by Yahusha HaMashiach (Jesus Christ) our hope”* (Ignatius to the Magnesians 1:11). The Messiah is the Son truly come in David''s flesh and truly raised: *“Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh”* (Romans 1:3), *“And declared to be the Son of Elohim (God) with power, according to the spirit of holiness, by the resurrection from the dead”* (Romans 1:4). Paul presses the same anchored gospel: *“Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel”* (2 Timothy 2:8). The birth, the passion, the resurrection — truly and certainly done, never a phantom.',
       sv.verse_id, ev.verse_id, 'extras', 70306
  FROM _session253_igmag1_lookup sv, _session253_igmag1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=11
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-magnesians' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-magnesians-1-two-coinages-two-ways',
       E'Two coinages, two ways — life and death set before us',
       E'Ignatius sets the ancient choice of the Two Ways before the assembly: *“all things have an end, and these two—life and death—are set before us together, and each man shall go to his own place; for just as there are two coinages, the one of Elohim (God) and the other of the world, and each of them hath its proper stamp impressed upon it”* (Ignatius to the Magnesians 1:5). This is Moses'' covenant summons: *“See, I have set before thee this day life and good, and death and evil”* (Deuteronomy 30:15), *“I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live”* (Deuteronomy 30:19). The Messiah set the same two gates: *“Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction”* (Matthew 7:13), *“strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it”* (Matthew 7:14). And the faithful stamp is the one undivided love for which Ignatius prays — *“That they all may be one; as thou, Father, art in me, and I in thee”* (John 17:21).',
       sv.verse_id, ev.verse_id, 'extras', 70309
  FROM _session253_igmag1_lookup sv, _session253_igmag1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-magnesians' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-magnesians-1-the-law-is-not-abolished',
       E'The everlasting Torah stands — the Son of Adam is Lord of the sabbath',
       E'Here the reader must weigh carefully. Ignatius, pressing for the real Messiah against those who would Judaize *away* from Him, lets fall a line — *“no longer observing sabbaths but fashioning their lives after Yahuah''s (Lord''s) day”* (Ignatius to the Magnesians 1:9) — and a Passover figure, *“put away the vile leaven which hath waxed stale and sour, and betake yourselves to the new leaven, which is Yahusha HaMashiach”* (1:10). We do not build a thread that endorses setting aside the sabbath; that gloss runs contrary to the everlasting Torah, and the apparatus shows the canon underneath, never the error. For the Messiah Himself said, *“Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil”* (Matthew 5:17); *“Whosoever therefore shall break one of these least commandments, and shall teach men so, he shall be called the least in the kingdom of heaven”* (Matthew 5:19). He is no abolisher of the sabbath but its Lord: *“The sabbath was made for man, and not man for the sabbath”* (Mark 2:27), *“Therefore the Son of Adam is Yahuah (Lord) also of the sabbath”* (Mark 2:28). And the prophet sets the everlasting horizon — *“from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah”* (Isaiah 66:23). The leaven to purge is malice; the feast to keep abides: *“let us keep the feast... with the unleavened bread of sincerity and truth”* (1 Corinthians 5:8).',
       sv.verse_id, ev.verse_id, 'extras', 70312
  FROM _session253_igmag1_lookup sv, _session253_igmag1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-magnesians' AND ev.chapter_number=1 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ignatius-magnesians-1-prophets-lived-by-messiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* the one Elohim who spoke through the prophets is the same who manifested Himself through the Son, exactly Ignatius''s claim that the divine prophets lived after the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-prophets-lived-by-messiah'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 1:11 — *Searching what, or what manner of time the Spirit of Messiah (Christ) which was in them did signify, when it testified beforehand the sufferings of Messiah (Christ), and the glory that should follow.* Peter names the very grace by which Ignatius says the prophets were inspired — the Spirit of Messiah testifying in them beforehand.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-prophets-lived-by-messiah'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 24:27 — *And beginning at Moses and all the prophets, he expounded unto them in all the scriptures the things concerning himself.* The Messiah reading Himself out of Moses and the prophets is the ground of Ignatius''s word that the prophets were His disciples expecting Him.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-prophets-lived-by-messiah'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 5:46 — *For had ye believed Moses, ye would have believed me: for he wrote of me.* That Moses wrote of Him answers Ignatius''s point that the prophets, being His disciples, awaited Him as their teacher.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-prophets-lived-by-messiah'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-magnesians-1-one-elohim-through-the-son
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:18 — *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* The Son who declares the unseen Father is Ignatius''s one Elohim manifesting Himself through Yahusha His Son, the Word from silence.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-one-elohim-through-the-son'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 14:9 — *Yahusha (Jesus) saith unto him, Have I been so long time with you, and yet hast thou not known me, Philip? he that hath seen me hath seen the Father; and how sayest thou then, Shew us the Father?* To see the Son is to see the Father — the manifestation Ignatius means by the one Elohim revealed through the Son.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-one-elohim-through-the-son'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* the Son by whom all things were made is the One Ignatius says was with the Father before the worlds and appeared at the end of time.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-one-elohim-through-the-son'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 8:29 — *And he that sent me is with me: the Father hath not left me alone; for I do always those things that please him.* The Son always doing the Father''s pleasure is Ignatius''s Word who in all things was well-pleasing unto Him that sent Him.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-one-elohim-through-the-son'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-magnesians-1-real-birth-passion-resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:3 — *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh;* the real flesh of David''s seed is exactly the birth Ignatius says was truly and certainly done.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-real-birth-passion-resurrection'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 1:4 — *And declared to be the Son of Elohim (God) with power, according to the spirit of holiness, by the resurrection from the dead:* the resurrection that declares Him Son matches the resurrection Ignatius binds to the birth and passion under Pilate.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-real-birth-passion-resurrection'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Timothy 2:8 — *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel:* Paul''s “remember” of David''s seed raised is the same persuasion Ignatius urges concerning the birth, passion, and resurrection.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-real-birth-passion-resurrection'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-magnesians-1-two-coinages-two-ways
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Moses'' two set before Israel is the very pair Ignatius names — life and death set before us together.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-two-coinages-two-ways'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* the call to choose life answers Ignatius''s free choice between the two coinages of Elohim and of the world.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-two-coinages-two-ways'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* the Messiah''s two gates are Ignatius''s two ways, each man going to his own place.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-two-coinages-two-ways'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The narrow way unto life is the stamp of Elohim the Father which Ignatius bids the faithful bear.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-two-coinages-two-ways'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-magnesians-1-the-law-is-not-abolished
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 5:17 — *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil.* Against the anti-sabbath gloss of 1:9, the Messiah''s own word upholds the law and the prophets — the apparatus shows the canon underneath the error.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-the-law-is-not-abolished'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Mark 2:27 — *And he said unto them, The sabbath was made for man, and not man for the sabbath:* the sabbath is a gift made for man, not a thing to be discarded as 1:9 would have it.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-the-law-is-not-abolished'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=2 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Mark 2:28 — *Therefore the Son of Adam is Yahuah (Lord) also of the sabbath.* The Messiah is the sabbath''s Lord, not its abolisher — the truth that corrects the antinomian turn of 1:9.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-the-law-is-not-abolished'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=2 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 66:23 — *And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD).* The everlasting sabbath worship of all flesh refutes the notion of no longer observing sabbaths.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-the-law-is-not-abolished'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Corinthians 5:8 — *Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth.* Paul''s leaven figure purges malice while keeping the feast — the leaven of 1:10 is the leaven of wickedness, not the appointed times themselves.'
  FROM cross_reference_threads t, cross_references x, _session253_igmag1_lookup sv, _session253_igmag1_lookup tv
 WHERE t.slug='ignatius-magnesians-1-the-law-is-not-abolished'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-magnesians' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ignatiustrallians_01.sql (session253 ignatius-trallians 1) -----
-- Source anchor: lightfoot-apostolic-fathers/ignatius-trallians ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: igtra1 (view _session253_igtra1_lookup). Sort band base 70400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_igtra1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ignatius-trallians-1-truly-born-truly-suffered
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 9, 'canon', '1-john', 4, 2, 'free', E'1 John 4:2 — *Hereby know ye the Spirit of Elohim (God): Every spirit that confesseth that Yahusha HaMashiach (Jesus Christ) is come in the flesh is of Elohim (God):* John''s test of the spirits is the very root of Ignatius''s insistence that the Messiah was truly born and truly in the flesh.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 9, 'canon', '1-john', 4, 3, 'free', E'1 John 4:3 — *And every spirit that confesseth not that Yahusha HaMashiach (Jesus Christ) is come in the flesh is not of Elohim (God): and this is that spirit of antichrist, whereof ye have heard that it should come; and even now already is it in the world.* The docetism Ignatius warns the Trallians against is named by John the spirit of antichrist.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 9, 'canon', 'luke', 24, 39, 'free', E'Luke 24:39 — *Behold my hands and my feet, that it is I myself: handle me, and see; for a spirit hath not flesh and bones, as ye see me have.* The risen Messiah refutes the semblance-doctrine in His own words, vindicating Ignatius''s ''truly raised from the dead.'''),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 9, 'canon', '1-corinthians', 15, 3, 'free', E'1 Corinthians 15:3 — *For I delivered unto you first of all that which I also received, how that Messiah (Christ) died for our sins according to the scriptures;* Paul''s received deposit is the same creed Ignatius hands the Trallians: died, buried, raised.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 9, 'canon', 'john', 19, 34, 'free', E'John 19:34 — *But one of the soldiers with a spear pierced his side, and forthwith came there out blood and water.* The pierced side under Pilate is the bodily proof that He was truly crucified and died, not in semblance only.'),
  -- thread: ignatius-trallians-1-not-in-vain-i-die
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 9, 'canon', '1-corinthians', 15, 32, 'free', E'1 Corinthians 15:32 — *If after the manner of men I have fought with beasts at Ephesus, what advantageth it me, if the dead rise not? let us eat and drink; for to morrow we die.* Paul''s beast-fighting logic is precisely Ignatius''s: a martyrdom for a Messiah who only seemed to suffer would be in vain.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 9, 'canon', '1-corinthians', 15, 14, 'free', E'1 Corinthians 15:14 — *And if Messiah (Christ) be not risen, then is our preaching vain, and your faith is also vain.* If the docetists are right, Ignatius dies for nothing — the same ''vain'' Paul names.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 9, 'canon', '1-peter', 5, 1, 'free', E'1 Peter 5:1 — *The elders which are among you I exhort, who am also an elder, and a witness of the sufferings of Messiah (Christ), and also a partaker of the glory that shall be revealed:* Peter the witness of the real sufferings undergirds Ignatius the bishop who eagerly shares them in his bonds.'),
  -- thread: ignatius-trallians-1-strange-herbage-poison-heresy
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 11, 'canon', 'matthew', 15, 13, 'free', E'Matthew 15:13 — *But he answered and said, Every plant, which my heavenly Father hath not planted, shall be rooted up.* Ignatius''s ''these men are not the Father''s planting'' is a direct echo of the Messiah''s word on every plant the Father planted not.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 6, 'canon', '2-peter', 2, 1, 'free', E'2 Peter 2:1 — *But there were false prophets also among the people, even as there shall be false teachers among you, who privily shall bring in damnable heresies, even denying Yahuah (Lord) that bought them, and bring upon themselves swift destruction.* Peter''s privily-smuggled heresies are the very poison-mingled-with-honied-wine Ignatius bids the Trallians refuse.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 6, 'canon', '2-peter', 2, 19, 'free', E'2 Peter 2:19 — *While they promise them liberty, they themselves are the servants of corruption: for of whom a man is overcome, of the same is he brought in bondage.* The heretics'' ''show of honesty'' is Peter''s false promise of liberty masking corruption.'),
  -- thread: ignatius-trallians-1-subject-to-presbytery-one-body
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 2, 'canon', 'ephesians', 4, 4, 'free', E'Ephesians 4:4 — *There is one body, and one Spirit, even as ye are called in one hope of your calling;* Paul''s one body grounds Ignatius''s call to be subject to the presbytery ''as to the Apostles of our hope.'''),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 2, 'canon', 'ephesians', 4, 5, 'free', E'Ephesians 4:5 — *One Yahuah (Lord), one faith, one baptism,* The single faith and Lord is the unity Ignatius guards against the schismatic poison of heresy.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 3, 'canon', '1-peter', 5, 3, 'free', E'1 Peter 5:3 — *Neither as being lords over Elohim''s (God''s) heritage, but being ensamples to the flock.* Peter''s ensample-not-lordship is the gentle, exemplary bishop whose demeanour Ignatius calls a great lesson.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 3, 'canon', '1-peter', 5, 5, 'free', E'1 Peter 5:5 — *Likewise, ye younger, submit yourselves unto the elder. Yea, all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble.* Mutual submission clothed with humility is the order Ignatius commends to the Trallians.'),
  -- thread: ignatius-trallians-1-my-name-blasphemed
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 8, 'canon', 'isaiah', 52, 5, 'free', E'Isaiah 52:5 — *Now therefore, what have I here, saith Yahuah (LORD), that my people is taken away for nought? they that rule over them make them to howl, saith Yahuah (LORD); and my name continually every day is blasphemed.* Ignatius''s ''Woe unto him through whom My name is vainly blasphemed'' draws straight from Yahuah''s complaint in Isaiah.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 8, 'canon', 'romans', 2, 24, 'free', E'Romans 2:24 — *For the name of Elohim (God) is blasphemed among the Gentiles through you, as it is written.* Paul applies the same Isaiah-rooted warning Ignatius gives: a careless few cause the Name to be blasphemed among the Gentiles.'),
  ('lightfoot-apostolic-fathers', 'ignatius-trallians', 1, 8, 'canon', '1-john', 4, 21, 'free', E'1 John 4:21 — *And this commandment have we from him, That he who loveth Elohim (God) love his brother also.* The grudge Ignatius forbids is countered by the abiding commandment to love the brother.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_igtra1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_igtra1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-trallians-1-truly-born-truly-suffered',
       E'Truly Born, Truly Crucified, Truly Raised — Against the Semblance',
       E'Ignatius arms the Trallians against the docetic lie: *Be ye deaf therefore, when any man speaketh to you apart from Yahusha HaMashiach, who was of the race of David, who was the Son of Mary, who was truly born and ate and drank, was truly persecuted under Pontius Pilate, was truly crucified and died... who moreover was truly raised from the dead, His Father having raised Him* (Ignatius to the Trallians 1:9). It ain''t new — John laid the test first: *Hereby know ye the Spirit of Elohim: Every spirit that confesseth that Yahusha HaMashiach is come in the flesh is of Elohim* (1 John 4:2), and *every spirit that confesseth not that Yahusha HaMashiach is come in the flesh is not of Elohim: and this is that spirit of antichrist* (1 John 4:3). The risen Messiah Himself overthrew the *semblance* charge: *handle me, and see; for a spirit hath not flesh and bones, as ye see me have* (Luke 24:39), and *he took it, and did eat before them* (Luke 24:43) — He truly ate, as Ignatius says. Paul delivers the same deposit: *how that Messiah died for our sins according to the scriptures; And that he was buried, and that he rose again the third day according to the scriptures* (1 Corinthians 15:3-4). And the spear under Pilate proves the real flesh: *one of the soldiers with a spear pierced his side, and forthwith came there out blood and water* (John 19:34).',
       sv.verse_id, ev.verse_id, 'extras', 70400
  FROM _session253_igtra1_lookup sv, _session253_igtra1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-trallians' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-trallians-1-not-in-vain-i-die',
       E'If He Suffered Only in Semblance, Why Am I in Bonds?',
       E'Ignatius answers docetism with his own chains: *But if it were as certain persons who are godless... say, that He suffered only in semblance, being themselves mere semblance, why am I in bonds? And why also do I desire to fight with wild beasts? So I die in vain* (Ignatius to the Trallians 1:9-10). A martyrdom for a phantom-Messiah would be empty — and Paul reasoned exactly so: *If after the manner of men I have fought with beasts at Ephesus, what advantageth it me, if the dead rise not?* (1 Corinthians 15:32). The whole hope hangs on a real death and a real rising: *And if Messiah be not risen, then is our preaching vain, and your faith is also vain* (1 Corinthians 15:14). Ignatius''s longing to suffer rests on the chief Shepherd who truly suffered before him: *who am also an elder, and a witness of the sufferings of Messiah, and also a partaker of the glory that shall be revealed* (1 Peter 5:1).',
       sv.verse_id, ev.verse_id, 'extras', 70403
  FROM _session253_igtra1_lookup sv, _session253_igtra1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-trallians' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-trallians-1-strange-herbage-poison-heresy',
       E'Abstain From the Strange Herbage — the Poison of Heresy',
       E'Ignatius warns of the deadly drug mingled with honied wine: *take ye only Christian food, and abstain from strange herbage, which is heresy: for these men do even mingle poison with Yahusha HaMashiach, imposing upon others by a show of honesty* (Ignatius to the Trallians 1:6), and *Shun ye therefore those vile offshoots that gender a deadly fruit... For these men are not the Father''s planting* (Ignatius to the Trallians 1:11). It ain''t new — the Messiah named the standard: *Every plant, which my heavenly Father hath not planted, shall be rooted up* (Matthew 15:13). Peter foretold the smuggled poison: *there shall be false teachers among you, who privily shall bring in damnable heresies, even denying Yahuah that bought them* (2 Peter 2:1) — denying the Master is the very docetism Ignatius fights. And the *show of honesty* is exposed: *For when they speak great swelling words of vanity, they allure through the lusts of the flesh... While they promise them liberty, they themselves are the servants of corruption* (2 Peter 2:18-19).',
       sv.verse_id, ev.verse_id, 'extras', 70406
  FROM _session253_igtra1_lookup sv, _session253_igtra1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-trallians' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-trallians-1-subject-to-presbytery-one-body',
       E'Subject as to the Apostles — One Body, One Hope',
       E'Ignatius binds the Trallians into ordered unity: *be ye obedient also to the presbytery, as to the Apostles of Yahusha HaMashiach our hope; for if we live in Him, we shall also be found in Him* (Ignatius to the Trallians 1:2), for *Apart from these there is not even the name of a church* (Ignatius to the Trallians 1:3). It ain''t new — Paul set the one-body charge: *There is one body, and one Spirit, even as ye are called in one hope of your calling* (Ephesians 4:4), *One Yahuah, one faith, one baptism* (Ephesians 4:5). The under-shepherds are to lead not as lords: *Feed the flock of Elohim which is among you, taking the oversight thereof... Neither as being lords over Elohim''s heritage, but being ensamples to the flock* (1 Peter 5:2-3) — the gentle bishop Ignatius praises, *whose very demeanour is a great lesson, while his gentleness is power.* And the younger submit in humility: *Likewise, ye younger, submit yourselves unto the elder* (1 Peter 5:5).',
       sv.verse_id, ev.verse_id, 'extras', 70409
  FROM _session253_igtra1_lookup sv, _session253_igtra1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-trallians' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-trallians-1-my-name-blasphemed',
       E'Give No Occasion — Lest the Name Be Blasphemed',
       E'Ignatius exhorts to love that guards the witness: *Let none of you bear a grudge against his neighbour. Give no occasion to the Gentiles, lest by reason of a few foolish men the godly multitude be blasphemed: for Woe unto him through whom My name is vainly blasphemed before some* (Ignatius to the Trallians 1:8). It ain''t new — the saying is Isaiah''s, spoken by Yahuah Himself: *they that rule over them make them to howl, saith Yahuah; and my name continually every day is blasphemed* (Isaiah 52:5). Paul lays the same charge on those whose walk dishonors the Name: *For the name of Elohim is blasphemed among the Gentiles through you, as it is written* (Romans 2:24). The forbidden grudge is answered by the love-the-neighbour commandment kept whole: *And this commandment have we from him, That he who loveth Elohim love his brother also* (1 John 4:21).',
       sv.verse_id, ev.verse_id, 'extras', 70412
  FROM _session253_igtra1_lookup sv, _session253_igtra1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-trallians' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ignatius-trallians-1-truly-born-truly-suffered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 4:2 — *Hereby know ye the Spirit of Elohim (God): Every spirit that confesseth that Yahusha HaMashiach (Jesus Christ) is come in the flesh is of Elohim (God):* John''s test of the spirits is the very root of Ignatius''s insistence that the Messiah was truly born and truly in the flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-truly-born-truly-suffered'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 4:3 — *And every spirit that confesseth not that Yahusha HaMashiach (Jesus Christ) is come in the flesh is not of Elohim (God): and this is that spirit of antichrist, whereof ye have heard that it should come; and even now already is it in the world.* The docetism Ignatius warns the Trallians against is named by John the spirit of antichrist.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-truly-born-truly-suffered'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 24:39 — *Behold my hands and my feet, that it is I myself: handle me, and see; for a spirit hath not flesh and bones, as ye see me have.* The risen Messiah refutes the semblance-doctrine in His own words, vindicating Ignatius''s ''truly raised from the dead.'''
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-truly-born-truly-suffered'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 15:3 — *For I delivered unto you first of all that which I also received, how that Messiah (Christ) died for our sins according to the scriptures;* Paul''s received deposit is the same creed Ignatius hands the Trallians: died, buried, raised.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-truly-born-truly-suffered'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'John 19:34 — *But one of the soldiers with a spear pierced his side, and forthwith came there out blood and water.* The pierced side under Pilate is the bodily proof that He was truly crucified and died, not in semblance only.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-truly-born-truly-suffered'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-trallians-1-not-in-vain-i-die
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 15:32 — *If after the manner of men I have fought with beasts at Ephesus, what advantageth it me, if the dead rise not? let us eat and drink; for to morrow we die.* Paul''s beast-fighting logic is precisely Ignatius''s: a martyrdom for a Messiah who only seemed to suffer would be in vain.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-not-in-vain-i-die'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:14 — *And if Messiah (Christ) be not risen, then is our preaching vain, and your faith is also vain.* If the docetists are right, Ignatius dies for nothing — the same ''vain'' Paul names.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-not-in-vain-i-die'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:1 — *The elders which are among you I exhort, who am also an elder, and a witness of the sufferings of Messiah (Christ), and also a partaker of the glory that shall be revealed:* Peter the witness of the real sufferings undergirds Ignatius the bishop who eagerly shares them in his bonds.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-not-in-vain-i-die'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-trallians-1-strange-herbage-poison-heresy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 15:13 — *But he answered and said, Every plant, which my heavenly Father hath not planted, shall be rooted up.* Ignatius''s ''these men are not the Father''s planting'' is a direct echo of the Messiah''s word on every plant the Father planted not.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-strange-herbage-poison-heresy'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:1 — *But there were false prophets also among the people, even as there shall be false teachers among you, who privily shall bring in damnable heresies, even denying Yahuah (Lord) that bought them, and bring upon themselves swift destruction.* Peter''s privily-smuggled heresies are the very poison-mingled-with-honied-wine Ignatius bids the Trallians refuse.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-strange-herbage-poison-heresy'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:19 — *While they promise them liberty, they themselves are the servants of corruption: for of whom a man is overcome, of the same is he brought in bondage.* The heretics'' ''show of honesty'' is Peter''s false promise of liberty masking corruption.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-strange-herbage-poison-heresy'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-trallians-1-subject-to-presbytery-one-body
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 4:4 — *There is one body, and one Spirit, even as ye are called in one hope of your calling;* Paul''s one body grounds Ignatius''s call to be subject to the presbytery ''as to the Apostles of our hope.'''
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-subject-to-presbytery-one-body'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 4:5 — *One Yahuah (Lord), one faith, one baptism,* The single faith and Lord is the unity Ignatius guards against the schismatic poison of heresy.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-subject-to-presbytery-one-body'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:3 — *Neither as being lords over Elohim''s (God''s) heritage, but being ensamples to the flock.* Peter''s ensample-not-lordship is the gentle, exemplary bishop whose demeanour Ignatius calls a great lesson.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-subject-to-presbytery-one-body'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 5:5 — *Likewise, ye younger, submit yourselves unto the elder. Yea, all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble.* Mutual submission clothed with humility is the order Ignatius commends to the Trallians.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-subject-to-presbytery-one-body'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-trallians-1-my-name-blasphemed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 52:5 — *Now therefore, what have I here, saith Yahuah (LORD), that my people is taken away for nought? they that rule over them make them to howl, saith Yahuah (LORD); and my name continually every day is blasphemed.* Ignatius''s ''Woe unto him through whom My name is vainly blasphemed'' draws straight from Yahuah''s complaint in Isaiah.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-my-name-blasphemed'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 2:24 — *For the name of Elohim (God) is blasphemed among the Gentiles through you, as it is written.* Paul applies the same Isaiah-rooted warning Ignatius gives: a careless few cause the Name to be blasphemed among the Gentiles.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-my-name-blasphemed'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 4:21 — *And this commandment have we from him, That he who loveth Elohim (God) love his brother also.* The grudge Ignatius forbids is countered by the abiding commandment to love the brother.'
  FROM cross_reference_threads t, cross_references x, _session253_igtra1_lookup sv, _session253_igtra1_lookup tv
 WHERE t.slug='ignatius-trallians-1-my-name-blasphemed'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-trallians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=4 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ignatiusromans_01.sql (session253 ignatius-romans 1) -----
-- Source anchor: lightfoot-apostolic-fathers/ignatius-romans ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: igrom1 (view _session253_igrom1_lookup). Sort band base 70500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_igrom1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ignatius-romans-1-wheat-pure-bread
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 4, 'canon', 'john', 12, 24, 'free', E'John 12:24 — *Verily, verily, I say unto you, Except a corn of wheat fall into the ground and die, it abideth alone: but if it die, it bringeth forth much fruit.* Ignatius''s wheat ground to pure bread is the Master''s own grain that must die to bear fruit.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 4, 'canon', '1-corinthians', 15, 35, 'free', E'1 Corinthians 15:35 — *But some man will say, How are the dead raised up? and with what body do they come?* The ground grain looks to the resurrection body, so the teeth of the beasts are not the end but the sowing.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 4, 'canon', 'romans', 12, 1, 'free', E'Romans 12:1 — *I beseech you therefore, brethren, by the mercies of Elohim (God), that ye present your bodies a living sacrifice, holy, acceptable unto Elohim (God), which is your reasonable service.* Ignatius asks to be found a sacrifice, the very living offering Sha''ul commands.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 4, 'canon', '2-timothy', 4, 6, 'free', E'2 Timothy 4:6 — *For I am now ready to be offered, and the time of my departure is at hand.* The poured-out libation of v2 and the sacrifice of v4 echo Sha''ul facing his own death as an offering.'),
  -- thread: ignatius-romans-1-to-die-is-gain
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 6, 'canon', 'philippians', 1, 21, 'free', E'Philippians 1:21 — *For to me to live is Messiah (Christ), and to die is gain.* Ignatius''s preference for death over reigning over the earth is Sha''ul''s gain-in-dying word for word in spirit.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 6, 'canon', 'philippians', 1, 23, 'free', E'Philippians 1:23 — *For I am in a strait betwixt two, having a desire to depart, and to be with Messiah (Christ); which is far better.* Him I seek, Him I desire — Ignatius''s longing to depart and be with the Master mirrors Sha''ul''s.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 5, 'canon', 'philippians', 3, 8, 'free', E'Philippians 3:8 — *Yea doubtless, and I count all things but loss for the excellency of the knowledge of HaMashiach Yahusha (Christ Jesus) my Lord: for whom I have suffered the loss of all things, and do count them but dung, that I may win Messiah (Christ).* To attain unto Messiah Ignatius counts the visible and invisible nothing, as Sha''ul counts all loss.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 6, 'canon', 'galatians', 2, 20, 'free', E'Galatians 2:20 — *I am crucified with Messiah (Christ): nevertheless I live; yet not I, but Messiah (Christ) liveth in me: and the life which I now live in the flesh I live by the faith of the Son of Elohim (God), who loved me, and gave himself for me.* Ignatius desires Him who died and rose for us, the same crucified-yet-living life Sha''ul confesses.'),
  -- thread: ignatius-romans-1-living-water-come-to-the-father
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 7, 'canon', 'john', 4, 14, 'free', E'John 4:14 — *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* The living water speaking within Ignatius is the springing well the Master gives.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 7, 'canon', 'john', 7, 37, 'free', E'John 7:37 — *In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink.* Ignatius''s inward water that says Come answers the Master''s feast-day cry to come and drink.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 7, 'canon', 'john', 7, 38, 'free', E'John 7:38 — *He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water.* The water living and speaking in Ignatius is the river the Master promised would flow from the believer.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 7, 'canon', 'revelation', 22, 17, 'free', E'Revelation 22:17 — *And the Spirit and the bride say, Come. And let him that heareth say, Come. And let him that is athirst come. And whosoever will, let him take the water of life freely.* The voice within Ignatius saying Come to the Father is the Spirit and the Bride''s closing call.'),
  -- thread: ignatius-romans-1-flesh-seed-of-david
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 7, 'canon', 'romans', 1, 3, 'free', E'Romans 1:3 — *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh.* Ignatius''s flesh of Messiah who was of the seed of David is Sha''ul''s opening gospel verbatim in substance.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 7, 'canon', '2-timothy', 2, 8, 'free', E'2 Timothy 2:8 — *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel.* The seed-of-David flesh Ignatius confesses is the same risen Messiah Sha''ul bids Timothy remember.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 7, 'canon', 'john', 6, 51, 'free', E'John 6:51 — *I am the living bread which came down from heaven: if any man eat of this bread, he shall live for ever: and the bread that I will give is my flesh, which I will give for the life of the world.* The bread of Elohim that is the flesh of Messiah is the Master''s own living bread.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 7, 'canon', 'john', 6, 55, 'free', E'John 6:55 — *For my flesh is meat indeed, and my blood is drink indeed.* Ignatius desires the flesh for bread and the blood for a draught, the very meat and drink the Master named.'),
  -- thread: ignatius-romans-1-rise-free-suffer-reign
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 4, 'canon', 'romans', 6, 5, 'free', E'Romans 6:5 — *For if we have been planted together in the likeness of his death, we shall be also in the likeness of his resurrection.* Ignatius''s promise to rise free in Him is the planting-into-death-and-resurrection Sha''ul lays out.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 4, 'canon', 'romans', 6, 4, 'free', E'Romans 6:4 — *Therefore we are buried with him by baptism into death: that like as Messiah (Christ) was raised up from the dead by the glory of the Father, even so we also should walk in newness of life.* The freed-man who shall rise in Him walks the buried-and-raised path Sha''ul describes.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 4, 'canon', '2-timothy', 2, 11, 'free', E'2 Timothy 2:11 — *It is a faithful saying: For if we be dead with him, we shall also live with him.* Ignatius the slave who will rise free leans on the faithful saying that dying with Him is living with Him.'),
  ('lightfoot-apostolic-fathers', 'ignatius-romans', 1, 4, 'canon', '2-timothy', 2, 12, 'free', E'2 Timothy 2:12 — *If we suffer, we shall also reign with him: if we deny him, he also will deny us.* If I shall suffer, then am I a freed-man — Ignatius''s suffering-unto-freedom is the suffering-unto-reigning Sha''ul names.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_igrom1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_igrom1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-romans-1-wheat-pure-bread',
       E'The wheat of Elohim, ground into pure bread',
       E'Ignatius longs for the arena: *I am Elohim''s (God''s) wheat, and I am ground by the teeth of wild beasts that I may be found pure bread [of Messiah (Christ)]... that through these instruments I may be found a sacrifice to Elohim (God)* (Ignatius to the Romans 1:4). It ain''t new — he is reaching for the Master''s own grain-of-wheat parable: *Verily, verily, I say unto you, Except a corn of wheat fall into the ground and die, it abideth alone: but if it die, it bringeth forth much fruit* (John 12:24), and Sha''ul''s seed-of-resurrection answer, *But some man will say, How are the dead raised up? and with what body do they come?* (1 Corinthians 15:35). The martyr''s body becomes the bread because it is first a living sacrifice — *that ye present your bodies a living sacrifice, holy, acceptable unto Elohim (God), which is your reasonable service* (Romans 12:1) — and a poured-out offering: *For I am now ready to be offered, and the time of my departure is at hand* (2 Timothy 4:6).',
       sv.verse_id, ev.verse_id, 'extras', 70500
  FROM _session253_igrom1_lookup sv, _session253_igrom1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-romans' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-romans-1-to-die-is-gain',
       E'To attain the Messiah, and to die is gain',
       E'Ignatius will not be robbed of his death: *It is good for me to die for Yahusha HaMashiach (Jesus Christ) rather than to reign over the farthest bounds of the earth. Him I seek, who died on our behalf; Him I desire, who rose again* (Ignatius to the Romans 1:6); *Only be it mine to attain unto Yahusha HaMashiach (Jesus Christ)* (1:5). This is Sha''ul to the letter: *For to me to live is Messiah (Christ), and to die is gain* (Philippians 1:21); *having a desire to depart, and to be with Messiah (Christ); which is far better* (Philippians 1:23); *I count all things but loss... that I may win Messiah (Christ)* (Philippians 3:8). The life he now lives is already a crucified one: *I am crucified with Messiah (Christ): nevertheless I live; yet not I, but Messiah (Christ) liveth in me* (Galatians 2:20). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 70503
  FROM _session253_igrom1_lookup sv, _session253_igrom1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-romans' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-romans-1-living-water-come-to-the-father',
       E'Living water saying, Come to the Father',
       E'Ignatius''s earthly longings are crucified, and another spring rises: *My lust hath been crucified, and there is no fire of material longing in me, but only water living and speaking in me, saying within me, Come to the Father* (Ignatius to the Romans 1:7). This is the well the Master promised the woman at Sychar — *the water that I shall give him shall be in him a well of water springing up into everlasting life* (John 4:14) — and the rivers He cried out at the feast: *If any man thirst, let him come unto me, and drink* (John 7:37); *out of his belly shall flow rivers of living water* (John 7:38). And the Bride''s last invitation closes the canon with the same word Ignatius hears within: *And let him that is athirst come. And whosoever will, let him take the water of life freely* (Revelation 22:17). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 70506
  FROM _session253_igrom1_lookup sv, _session253_igrom1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-romans' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-romans-1-flesh-seed-of-david',
       E'The flesh of Messiah, of the seed of David',
       E'Against every spirit that would empty the incarnation, Ignatius confesses a real body and real blood: *I desire the bread of Elohim (God), which is the flesh of Messiah (Christ) who was of the seed of David; and for a draught I desire His blood, which is love incorruptible* (Ignatius to the Romans 1:7). This is the apostolic gospel, not a new one — *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh* (Romans 1:3); *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel* (2 Timothy 2:8). The flesh he hungers for is the living bread: *the bread that I will give is my flesh, which I will give for the life of the world* (John 6:51); *For my flesh is meat indeed, and my blood is drink indeed* (John 6:55). The Messiah truly born of David''s seed, truly in the flesh — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 70509
  FROM _session253_igrom1_lookup sv, _session253_igrom1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-romans' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-romans-1-rise-free-suffer-reign',
       E'If I suffer, I shall rise free in Him',
       E'Ignatius binds suffering to resurrection: *Yet if I shall suffer, then am I a freed-man of Yahusha HaMashiach (Jesus Christ), and I shall rise free in Him* (Ignatius to the Romans 1:4); *Suffer me to receive the pure light. When I am come thither, then shall I be a man* (1:6). This is the buried-and-raised pattern of immersion — *Therefore we are buried with him by baptism into death... even so we also should walk in newness of life* (Romans 6:4); *if we have been planted together in the likeness of his death, we shall be also in the likeness of his resurrection* (Romans 6:5) — and the faithful saying Ignatius lives out: *For if we be dead with him, we shall also live with him: If we suffer, we shall also reign with him* (2 Timothy 2:11-12). The slave becomes a freed-man, the dying becomes reigning — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 70512
  FROM _session253_igrom1_lookup sv, _session253_igrom1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-romans' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ignatius-romans-1-wheat-pure-bread
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 12:24 — *Verily, verily, I say unto you, Except a corn of wheat fall into the ground and die, it abideth alone: but if it die, it bringeth forth much fruit.* Ignatius''s wheat ground to pure bread is the Master''s own grain that must die to bear fruit.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-wheat-pure-bread'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:35 — *But some man will say, How are the dead raised up? and with what body do they come?* The ground grain looks to the resurrection body, so the teeth of the beasts are not the end but the sowing.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-wheat-pure-bread'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 12:1 — *I beseech you therefore, brethren, by the mercies of Elohim (God), that ye present your bodies a living sacrifice, holy, acceptable unto Elohim (God), which is your reasonable service.* Ignatius asks to be found a sacrifice, the very living offering Sha''ul commands.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-wheat-pure-bread'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Timothy 4:6 — *For I am now ready to be offered, and the time of my departure is at hand.* The poured-out libation of v2 and the sacrifice of v4 echo Sha''ul facing his own death as an offering.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-wheat-pure-bread'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-romans-1-to-die-is-gain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 1:21 — *For to me to live is Messiah (Christ), and to die is gain.* Ignatius''s preference for death over reigning over the earth is Sha''ul''s gain-in-dying word for word in spirit.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-to-die-is-gain'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=1 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 1:23 — *For I am in a strait betwixt two, having a desire to depart, and to be with Messiah (Christ); which is far better.* Him I seek, Him I desire — Ignatius''s longing to depart and be with the Master mirrors Sha''ul''s.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-to-die-is-gain'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=1 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Philippians 3:8 — *Yea doubtless, and I count all things but loss for the excellency of the knowledge of HaMashiach Yahusha (Christ Jesus) my Lord: for whom I have suffered the loss of all things, and do count them but dung, that I may win Messiah (Christ).* To attain unto Messiah Ignatius counts the visible and invisible nothing, as Sha''ul counts all loss.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-to-die-is-gain'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 2:20 — *I am crucified with Messiah (Christ): nevertheless I live; yet not I, but Messiah (Christ) liveth in me: and the life which I now live in the flesh I live by the faith of the Son of Elohim (God), who loved me, and gave himself for me.* Ignatius desires Him who died and rose for us, the same crucified-yet-living life Sha''ul confesses.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-to-die-is-gain'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-romans-1-living-water-come-to-the-father
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 4:14 — *But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* The living water speaking within Ignatius is the springing well the Master gives.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-living-water-come-to-the-father'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 7:37 — *In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink.* Ignatius''s inward water that says Come answers the Master''s feast-day cry to come and drink.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-living-water-come-to-the-father'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 7:38 — *He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water.* The water living and speaking in Ignatius is the river the Master promised would flow from the believer.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-living-water-come-to-the-father'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:17 — *And the Spirit and the bride say, Come. And let him that heareth say, Come. And let him that is athirst come. And whosoever will, let him take the water of life freely.* The voice within Ignatius saying Come to the Father is the Spirit and the Bride''s closing call.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-living-water-come-to-the-father'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-romans-1-flesh-seed-of-david
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:3 — *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh.* Ignatius''s flesh of Messiah who was of the seed of David is Sha''ul''s opening gospel verbatim in substance.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-flesh-seed-of-david'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Timothy 2:8 — *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel.* The seed-of-David flesh Ignatius confesses is the same risen Messiah Sha''ul bids Timothy remember.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-flesh-seed-of-david'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 6:51 — *I am the living bread which came down from heaven: if any man eat of this bread, he shall live for ever: and the bread that I will give is my flesh, which I will give for the life of the world.* The bread of Elohim that is the flesh of Messiah is the Master''s own living bread.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-flesh-seed-of-david'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 6:55 — *For my flesh is meat indeed, and my blood is drink indeed.* Ignatius desires the flesh for bread and the blood for a draught, the very meat and drink the Master named.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-flesh-seed-of-david'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=55
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-romans-1-rise-free-suffer-reign
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 6:5 — *For if we have been planted together in the likeness of his death, we shall be also in the likeness of his resurrection.* Ignatius''s promise to rise free in Him is the planting-into-death-and-resurrection Sha''ul lays out.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-rise-free-suffer-reign'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 6:4 — *Therefore we are buried with him by baptism into death: that like as Messiah (Christ) was raised up from the dead by the glory of the Father, even so we also should walk in newness of life.* The freed-man who shall rise in Him walks the buried-and-raised path Sha''ul describes.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-rise-free-suffer-reign'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Timothy 2:11 — *It is a faithful saying: For if we be dead with him, we shall also live with him.* Ignatius the slave who will rise free leans on the faithful saying that dying with Him is living with Him.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-rise-free-suffer-reign'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Timothy 2:12 — *If we suffer, we shall also reign with him: if we deny him, he also will deny us.* If I shall suffer, then am I a freed-man — Ignatius''s suffering-unto-freedom is the suffering-unto-reigning Sha''ul names.'
  FROM cross_reference_threads t, cross_references x, _session253_igrom1_lookup sv, _session253_igrom1_lookup tv
 WHERE t.slug='ignatius-romans-1-rise-free-suffer-reign'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-romans' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ignatiusphiladelphians_01.sql (session253 ignatius-philadelphians 1) -----
-- Source anchor: lightfoot-apostolic-fathers/ignatius-philadelphians ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: igphil1 (view _session253_igphil1_lookup). Sort band base 70600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_igphil1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ignatius-philadelphians-1-one-altar-one-cup
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 3, 'canon', '1-corinthians', 10, 16, 'free', E'1 Corinthians 10:16 — *The cup of blessing which we bless, is it not the communion of the blood of Messiah (Christ)? The bread which we break, is it not the communion of the body of Messiah (Christ)?* Ignatius''s one cup unto union in His blood is exactly the communion of the blood Sha''ul names.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 3, 'canon', '1-corinthians', 10, 17, 'free', E'1 Corinthians 10:17 — *For we being many are one bread, and one body: for we are all partakers of that one bread.* The one flesh and one altar of Ignatius 1:3 is the one bread, one body of the many made one.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 3, 'canon', 'ephesians', 4, 4, 'free', E'Ephesians 4:4 — *There is one body, and one Spirit, even as ye are called in one hope of your calling.* Ignatius''s one altar, one bishop, one cup is the one body of one hope already taught by Sha''ul.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 3, 'canon', 'ephesians', 4, 5, 'free', E'Ephesians 4:5 — *One Yahuah (Lord), one faith, one baptism.* The oneness Ignatius presses in the eucharist stands on the one Yahuah and one faith confessed before him.'),
  -- thread: ignatius-philadelphians-1-prophets-pointed-to-the-gospel
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 5, 'canon', 'luke', 24, 25, 'free', E'Luke 24:25 — *Then he said unto them, O fools, and slow of heart to believe all that the prophets have spoken:* Ignatius loves the prophets because they pointed to the Gospel — exactly what the risen Messiah rebukes the disciples for missing.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 5, 'canon', 'luke', 24, 27, 'free', E'Luke 24:27 — *And beginning at Moses and all the prophets, he expounded unto them in all the scriptures the things concerning himself.* The prophets pointed to the Gospel because all the scriptures, Moses included, are concerning Him.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 5, 'canon', '1-peter', 1, 11, 'free', E'1 Peter 1:11 — *Searching what, or what manner of time the Spirit of Messiah (Christ) which was in them did signify, when it testified beforehand the sufferings of Messiah (Christ), and the glory that should follow.* Ignatius''s prophets who set their hope on Him are Kepha''s prophets in whom the Spirit of Messiah testified beforehand.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 5, 'canon', 'john', 8, 56, 'free', E'John 8:56 — *Your father Abraham rejoiced to see my day: and he saw it, and was glad.* The prophets who awaited Him are joined by Avraham who saw His day afar off and rejoiced.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 5, 'canon', 'matthew', 5, 17, 'free', E'Matthew 5:17 — *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil.* Because the prophets point to the Gospel, they are fulfilled in Messiah and never abolished — the Torah and Prophets stand.'),
  -- thread: ignatius-philadelphians-1-the-door-of-the-father
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 8, 'canon', 'john', 10, 9, 'free', E'John 10:9 — *I am the door: by me if any man enter in, he shall be saved, and shall go in and out, and find pasture.* Ignatius''s door of the Father, through which the patriarchs and prophets enter, is the Messiah''s own I am the door.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 8, 'canon', 'hebrews', 11, 13, 'free', E'Hebrews 11:13 — *These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth.* Abraham, Isaac and Jacob enter Ignatius''s door by the same faith that saw the promise afar off.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 8, 'canon', 'hebrews', 11, 16, 'free', E'Hebrews 11:16 — *But now they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city.* The patriarchs who enter the door of the Father seek the city Elohim prepared — the unity of Elohim Ignatius proclaims.'),
  -- thread: ignatius-philadelphians-1-shun-division-follow-the-shepherd
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 2, 'canon', 'john', 17, 21, 'free', E'John 17:21 — *That they all may be one; as thou, Father, art in me, and I in thee, that they also may be one in us: that the world may believe that thou hast sent me.* Ignatius''s where ye are at one, they will find no place is the Messiah''s own prayer that they all may be one.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 2, 'canon', '1-corinthians', 1, 10, 'free', E'1 Corinthians 1:10 — *Now I beseech you, brethren, by the name of our Lord Yahusha HaMashiach (Lord Jesus Christ), that ye all speak the same thing, and that there be no divisions among you; but that ye be perfectly joined together in the same mind and in the same judgment.* Ignatius''s shun division echoes Sha''ul''s plea that there be no divisions among you.'),
  ('lightfoot-apostolic-fathers', 'ignatius-philadelphians', 1, 2, 'canon', 'ephesians', 4, 3, 'free', E'Ephesians 4:3 — *Endeavouring to keep the unity of the Spirit in the bond of peace.* Where ye are at one the wolves find no place — the unity Ignatius commands is the unity of the Spirit in the bond of peace.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_igphil1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_igphil1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-philadelphians-1-one-altar-one-cup',
       E'One eucharist, one cup, one altar — the body not divided',
       E'Ignatius exhorts the Philadelphians to the unity of the one table: *Be ye careful therefore to observe one eucharist (for there is one flesh of our Yahuah (Lord) Yahusha HaMashiach (Jesus Christ) and one cup unto union in His blood; there is one altar, as there is one bishop, together with the presbytery and the deacons my fellow-servants), that whatsoever ye do, ye may do it after Elohim (God)* (Ignatius to the Philadelphians 1:3). It ain''t new — Sha''ul had already named the cup and the bread as the one communion of the one body: *The cup of blessing which we bless, is it not the communion of the blood of Messiah (Christ)? The bread which we break, is it not the communion of the body of Messiah (Christ)?* (1 Corinthians 10:16), and *For we being many are one bread, and one body: for we are all partakers of that one bread* (1 Corinthians 10:17). And the sevenfold oneness of Ephesians is the very frame Ignatius preaches: *There is one body, and one Spirit, even as ye are called in one hope of your calling* (Ephesians 4:4); *One Yahuah (Lord), one faith, one baptism* (Ephesians 4:5).',
       sv.verse_id, ev.verse_id, 'extras', 70600
  FROM _session253_igphil1_lookup sv, _session253_igphil1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-philadelphians' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-philadelphians-1-prophets-pointed-to-the-gospel',
       E'The prophets pointed to the Gospel, hoped in Him, and awaited Him',
       E'Ignatius binds the prophets to the Messiah they foretold: *Yea, and we love the prophets also, because they too pointed to the Gospel in their preaching and set their hope on Him and awaited Him; in whom also having faith they were saved in the unity of Yahusha HaMashiach (Jesus Christ)* (Ignatius to the Philadelphians 1:5). This is the risen Messiah''s own teaching on the Emmaus road — that Moses and the prophets are all of Him: *Then he said unto them, O fools, and slow of heart to believe all that the prophets have spoken: Ought not Messiah (Christ) to have suffered these things, and to enter into his glory?* (Luke 24:25-26); and Kepha says the prophets searched out the very sufferings and glory: *Searching what, or what manner of time the Spirit of Messiah (Christ) which was in them did signify, when it testified beforehand the sufferings of Messiah (Christ), and the glory that should follow* (1 Peter 1:11). Avraham himself looked ahead and rejoiced: *Your father Abraham rejoiced to see my day: and he saw it, and was glad* (John 8:56). And because the prophets point to Him, they are never abolished but fulfilled: *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil* (Matthew 5:17) — the Torah and the Prophets stand, and they preach Messiah. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 70603
  FROM _session253_igphil1_lookup sv, _session253_igphil1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-philadelphians' AND ev.chapter_number=1 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-philadelphians-1-the-door-of-the-father',
       E'The door of the Father — Abraham, Isaac, Jacob, and the prophets enter in',
       E'Ignatius names the Messiah as the one gate of the patriarchs and the prophets: *He Himself being the door of the Father, through which Abraham and Isaac and Jacob enter in, and the Prophets and the Apostles and the whole Church; all these things combine in the unity of Elohim (God)* (Ignatius to the Philadelphians 1:9), adding *For the beloved Prophets in their preaching pointed to Him* (Ignatius to the Philadelphians 1:9). This is the Good Shepherd''s own word: *I am the door: by me if any man enter in, he shall be saved, and shall go in and out, and find pasture* (John 10:9). And the patriarchs Ignatius names entered that door by faith from afar, awaiting the city to come: *These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth* (Hebrews 11:13); *But now they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city* (Hebrews 11:16). Avraham, Yitschaq, and Ya''aqov enter the one door — election and the seed kept, not replaced.',
       sv.verse_id, ev.verse_id, 'extras', 70606
  FROM _session253_igphil1_lookup sv, _session253_igphil1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-philadelphians' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-philadelphians-1-shun-division-follow-the-shepherd',
       E'Shun division — where the Shepherd is, follow as sheep',
       E'Ignatius warns against schism and the wolves that scatter: *As children therefore [of the light] of the truth, shun division and wrong doctrines; and where the shepherd is, there follow ye as sheep. For many specious wolves with baneful delights lead captive the runners in Elohim''s (God''s) race; but, where ye are at one, they will find no place* (Ignatius to the Philadelphians 1:2). This is the Messiah''s high-priestly prayer for oneness: *That they all may be one; as thou, Father, art in me, and I in thee, that they also may be one in us: that the world may believe that thou hast sent me* (John 17:21); and Sha''ul''s first plea to Corinth: *Now I beseech you, brethren, by the name of our Lord Yahusha HaMashiach (Lord Jesus Christ), that ye all speak the same thing, and that there be no divisions among you; but that ye be perfectly joined together in the same mind and in the same judgment* (1 Corinthians 1:10). The bond is the one Spirit: *Endeavouring to keep the unity of the Spirit in the bond of peace* (Ephesians 4:3). The plea against division ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 70609
  FROM _session253_igphil1_lookup sv, _session253_igphil1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-philadelphians' AND ev.chapter_number=1 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ignatius-philadelphians-1-one-altar-one-cup
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 10:16 — *The cup of blessing which we bless, is it not the communion of the blood of Messiah (Christ)? The bread which we break, is it not the communion of the body of Messiah (Christ)?* Ignatius''s one cup unto union in His blood is exactly the communion of the blood Sha''ul names.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-one-altar-one-cup'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 10:17 — *For we being many are one bread, and one body: for we are all partakers of that one bread.* The one flesh and one altar of Ignatius 1:3 is the one bread, one body of the many made one.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-one-altar-one-cup'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 4:4 — *There is one body, and one Spirit, even as ye are called in one hope of your calling.* Ignatius''s one altar, one bishop, one cup is the one body of one hope already taught by Sha''ul.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-one-altar-one-cup'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 4:5 — *One Yahuah (Lord), one faith, one baptism.* The oneness Ignatius presses in the eucharist stands on the one Yahuah and one faith confessed before him.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-one-altar-one-cup'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-philadelphians-1-prophets-pointed-to-the-gospel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 24:25 — *Then he said unto them, O fools, and slow of heart to believe all that the prophets have spoken:* Ignatius loves the prophets because they pointed to the Gospel — exactly what the risen Messiah rebukes the disciples for missing.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-prophets-pointed-to-the-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 24:27 — *And beginning at Moses and all the prophets, he expounded unto them in all the scriptures the things concerning himself.* The prophets pointed to the Gospel because all the scriptures, Moses included, are concerning Him.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-prophets-pointed-to-the-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:11 — *Searching what, or what manner of time the Spirit of Messiah (Christ) which was in them did signify, when it testified beforehand the sufferings of Messiah (Christ), and the glory that should follow.* Ignatius''s prophets who set their hope on Him are Kepha''s prophets in whom the Spirit of Messiah testified beforehand.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-prophets-pointed-to-the-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 8:56 — *Your father Abraham rejoiced to see my day: and he saw it, and was glad.* The prophets who awaited Him are joined by Avraham who saw His day afar off and rejoiced.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-prophets-pointed-to-the-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=56
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 5:17 — *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil.* Because the prophets point to the Gospel, they are fulfilled in Messiah and never abolished — the Torah and Prophets stand.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-prophets-pointed-to-the-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-philadelphians-1-the-door-of-the-father
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 10:9 — *I am the door: by me if any man enter in, he shall be saved, and shall go in and out, and find pasture.* Ignatius''s door of the Father, through which the patriarchs and prophets enter, is the Messiah''s own I am the door.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-the-door-of-the-father'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:13 — *These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth.* Abraham, Isaac and Jacob enter Ignatius''s door by the same faith that saw the promise afar off.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-the-door-of-the-father'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:16 — *But now they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city.* The patriarchs who enter the door of the Father seek the city Elohim prepared — the unity of Elohim Ignatius proclaims.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-the-door-of-the-father'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-philadelphians-1-shun-division-follow-the-shepherd
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 17:21 — *That they all may be one; as thou, Father, art in me, and I in thee, that they also may be one in us: that the world may believe that thou hast sent me.* Ignatius''s where ye are at one, they will find no place is the Messiah''s own prayer that they all may be one.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-shun-division-follow-the-shepherd'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=17 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 1:10 — *Now I beseech you, brethren, by the name of our Lord Yahusha HaMashiach (Lord Jesus Christ), that ye all speak the same thing, and that there be no divisions among you; but that ye be perfectly joined together in the same mind and in the same judgment.* Ignatius''s shun division echoes Sha''ul''s plea that there be no divisions among you.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-shun-division-follow-the-shepherd'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 4:3 — *Endeavouring to keep the unity of the Spirit in the bond of peace.* Where ye are at one the wolves find no place — the unity Ignatius commands is the unity of the Spirit in the bond of peace.'
  FROM cross_reference_threads t, cross_references x, _session253_igphil1_lookup sv, _session253_igphil1_lookup tv
 WHERE t.slug='ignatius-philadelphians-1-shun-division-follow-the-shepherd'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-philadelphians' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ignatiussmyrnaeans_01.sql (session253 ignatius-smyrnaeans 1) -----
-- Source anchor: lightfoot-apostolic-fathers/ignatius-smyrnaeans ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: igsmy1 (view _session253_igsmy1_lookup). Sort band base 70700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_igsmy1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ignatius-smyrnaeans-1-seed-of-david-flesh
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 1, 'canon', 'romans', 1, 3, 'free', E'Romans 1:3 — *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh;* Ignatius''s "truly of the race of David according to the flesh" (1:1) is Paul''s very confession against any who deny the real incarnation.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 1, 'canon', 'romans', 1, 4, 'free', E'Romans 1:4 — *And declared to be the Son of Elohim (God) with power, according to the spirit of holiness, by the resurrection from the dead:* the "Son of Elohim by the Divine will and power" of Smyrnaeans 1:1 is the Son declared with power by the resurrection.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 1, 'canon', 'isaiah', 53, 5, 'free', E'Isaiah 53:5 — *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* The "most blessed passion" Ignatius names in 1:1 was wounded-in-the-flesh, foretold by the prophet.'),
  -- thread: ignatius-smyrnaeans-1-handle-me-risen-flesh
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 3, 'canon', 'luke', 24, 39, 'free', E'Luke 24:39 — *Behold my hands and my feet, that it is I myself: handle me, and see; for a spirit hath not flesh and bones, as ye see me have.* Ignatius''s "Lay hold and handle me, and see that I am not a demon without body" (1:3) quotes the risen Messiah''s own proof of flesh.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 3, 'canon', 'luke', 24, 43, 'free', E'Luke 24:43 — *And he took it, and did eat before them.* That "after His resurrection He [both] ate with them and drank with them" (1:3) is the same eating-in-the-flesh that confounds every docetic semblance.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 3, 'canon', 'john', 20, 27, 'free', E'John 20:27 — *Then saith he to Thomas, Reach hither thy finger, and behold my hands; and reach hither thy hand, and thrust it into my side: and be not faithless, but believing.* The disciples who "touched Him" in Smyrnaeans 1:3 did as Thomas did, handling the risen flesh.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 3, 'canon', 'acts', 10, 41, 'free', E'Acts 10:41 — *Not to all the people, but unto witnesses chosen before of Elohim (God), even to us, who did eat and drink with him after he rose from the dead.* Peter names the very eating-and-drinking with the risen Lord that Ignatius rehearses in 1:3.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 3, 'canon', '1-john', 1, 1, 'free', E'1 John 1:1 — *That which was from the beginning, which we have heard, which we have seen with our eyes, which we have looked upon, and our hands have handled, of the Word of life;* John''s hands-have-handled witness undergirds Ignatius''s "they touched Him" in 1:3.'),
  -- thread: ignatius-smyrnaeans-1-suffered-truly-raised
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 2, 'canon', 'isaiah', 53, 7, 'free', E'Isaiah 53:7 — *He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* Ignatius''s "He suffered truly" (1:2) is the lamb''s real affliction the prophet saw, not semblance.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 2, 'canon', 'isaiah', 53, 8, 'free', E'Isaiah 53:8 — *He was taken from prison and from judgment: and who shall declare his generation? for he was cut off out of the land of the living: for the transgression of my people was he stricken.* The true death Ignatius defends in 1:2 was foretold as a real cutting-off from the land of the living.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 2, 'canon', 'acts', 10, 40, 'free', E'Acts 10:40 — *Him Elohim (God) raised up the third day, and shewed him openly;* "He raised Himself truly" (1:2) and was shewn openly, the bodily resurrection over against every docetic semblance.'),
  -- thread: ignatius-smyrnaeans-1-prophets-law-moses-gospel
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 5, 'canon', 'matthew', 5, 17, 'free', E'Matthew 5:17 — *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil.* When Ignatius faults the deniers for spurning "the law of Moses" (1:5), he stands with the Messiah who came to fulfil, not destroy, the Torah.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 5, 'canon', 'matthew', 5, 18, 'free', E'Matthew 5:18 — *For verily I say unto you, Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law, till all be fulfilled.* The law of Moses Ignatius commends in 1:5 endures to the last jot and tittle.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 5, 'canon', 'malachi', 4, 4, 'free', E'Malachi 4:4 — *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments.* The prophets'' closing charge is the very "law of Moses" Ignatius says the unbelievers refused (1:5).'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 7, 'canon', 'isaiah', 53, 5, 'free', E'Isaiah 53:5 — *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* The "passion shown unto us" in the Prophets (1:7) is just this wounded-for-us oracle of Isaiah.'),
  -- thread: ignatius-smyrnaeans-1-eucharist-flesh-suffered
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 6, 'canon', '1-corinthians', 11, 23, 'free', E'1 Corinthians 11:23 — *For I have received of Yahusha (the Lord) that which also I delivered unto you, That Yahusha (the Lord Jesus) the same night in which he was betrayed took bread:* Ignatius''s eucharist that is "the flesh of our Saviour" (1:6) is the supper Paul received and delivered.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 6, 'canon', '1-corinthians', 11, 24, 'free', E'1 Corinthians 11:24 — *And when he had given thanks, he brake it, and said, Take, eat: this is my body, which is broken for you: this do in remembrance of me.* The bread that is His broken body grounds Ignatius''s claim in 1:6 that the eucharist is the flesh that suffered for our sins.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 8, 'canon', '1-corinthians', 11, 26, 'free', E'1 Corinthians 11:26 — *For as often as ye eat this bread, and drink this cup, ye do shew the death of Yahusha (the Lord) till he come.* The one valid love-feast Ignatius guards in 1:8 shews forth the very death-and-return the docetists denied.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_igsmy1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_igsmy1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-smyrnaeans-1-seed-of-david-flesh',
       E'Truly of the seed of David, truly in the flesh',
       E'Against the docetists who said the Messiah only *seemed* to come, Ignatius confesses Him whole: *fully persuaded as touching our Lord that He is truly of the race of David according to the flesh, but Son of Elohim (God) by the Divine will and power, truly born of a virgin and baptized by John... truly nailed up in the flesh for our sakes under Pontius Pilate.* It ain''t new — Paul preached the same double witness: *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh;* (Romans 1:3) *And declared to be the Son of Elohim (God) with power, according to the spirit of holiness, by the resurrection from the dead:* (Romans 1:4). And the suffering of that flesh was written long before by the prophet: *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* (Isaiah 53:5). The gathering He raises is no church-replacing-Israel but the one body drawn *whether among Yahudim (Jews) or among Gentiles* — the two-house ensign of His resurrection.',
       sv.verse_id, ev.verse_id, 'extras', 70700
  FROM _session253_igsmy1_lookup sv, _session253_igsmy1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-smyrnaeans' AND ev.chapter_number=1 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-smyrnaeans-1-handle-me-risen-flesh',
       E'Lay hold and handle me — the risen flesh',
       E'Ignatius answers the docetists with the upper-room scene: *when He came to Peter and his company, He said to them, Lay hold and handle me, and see that I am not a demon without body. And straightway they touched Him, and they believed... And after His resurrection He [both] ate with them and drank with them as one in the flesh.* It ain''t new — this is the risen Yahusha verbatim: *Behold my hands and my feet, that it is I myself: handle me, and see; for a spirit hath not flesh and bones, as ye see me have.* (Luke 24:39), and *And he took it, and did eat before them.* (Luke 24:43). To doubting Thomas: *Reach hither thy finger, and behold my hands; and reach hither thy hand, and thrust it into my side: and be not faithless, but believing.* (John 20:27). The witnesses who shared His table testified: *Not to all the people, but unto witnesses chosen before of Elohim (God), even to us, who did eat and drink with him after he rose from the dead.* (Acts 10:41). And John, who handled Him: *which we have looked upon, and our hands have handled, of the Word of life;* (1 John 1:1).',
       sv.verse_id, ev.verse_id, 'extras', 70703
  FROM _session253_igsmy1_lookup sv, _session253_igsmy1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-smyrnaeans' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-smyrnaeans-1-suffered-truly-raised',
       E'He suffered truly, not in semblance',
       E'The docetists held that the Messiah only *seemed* to suffer; Ignatius will have none of it: *He suffered truly, as also He raised Himself truly; not... certain unbelievers say, that He suffered in semblance, being themselves mere semblance.* And of his own martyrdom he reasons: *if these things were done by our Lord in semblance, then am I also a prisoner in semblance. And why then have I delivered myself over to death, unto fire, unto sword, unto wild beasts?* It ain''t new — the prophets had testified to the real death: *He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter...* (Isaiah 53:7); *he was cut off out of the land of the living: for the transgression of my people was he stricken.* (Isaiah 53:8). And the Father raised that same flesh: *Him Elohim (God) raised up the third day, and shewed him openly;* (Acts 10:40).',
       sv.verse_id, ev.verse_id, 'extras', 70706
  FROM _session253_igsmy1_lookup sv, _session253_igsmy1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-smyrnaeans' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-smyrnaeans-1-prophets-law-moses-gospel',
       E'Persuaded by the prophets and the law of Moses',
       E'Ignatius rebukes the deniers precisely because they will not heed the whole counsel: *they have not been persuaded by the prophecies nor by the law of Moses, nay nor even to this very hour by the Gospel.* He sends the faithful instead to *give heed to the Prophets, and especially to the Gospel, wherein the passion is shown unto us and the resurrection is accomplished.* The Torah and prophets are honoured, not abolished — it ain''t new. The Messiah Himself bound the law and the prophets to His own person: *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil.* (Matthew 5:17); *For verily I say unto you, Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law, till all be fulfilled.* (Matthew 5:18). And the closing word of the prophets keeps the same charge: *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments.* (Malachi 4:4).',
       sv.verse_id, ev.verse_id, 'extras', 70709
  FROM _session253_igsmy1_lookup sv, _session253_igsmy1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-smyrnaeans' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-smyrnaeans-1-eucharist-flesh-suffered',
       E'The Eucharist is the flesh that suffered and was raised',
       E'The docetists *abstain from eucharist (thanksgiving) and prayer, because they allow not that the eucharist is the flesh of our Saviour Yahusha HaMashiach (Jesus Christ), which flesh suffered for our sins, and which the Father of His goodness raised up.* For Ignatius the one bread and one cup are no empty sign but the body broken and the blood poured — and so it is *not lawful apart from the bishop either to baptize or to hold a love-feast.* It ain''t new — Paul delivered the same supper: *That Yahusha (the Lord Jesus) the same night in which he was betrayed took bread:* (1 Corinthians 11:23); *And when he had given thanks, he brake it, and said, Take, eat: this is my body, which is broken for you: this do in remembrance of me.* (1 Corinthians 11:24); *For as often as ye eat this bread, and drink this cup, ye do shew the death of Yahusha (the Lord) till he come.* (1 Corinthians 11:26).',
       sv.verse_id, ev.verse_id, 'extras', 70712
  FROM _session253_igsmy1_lookup sv, _session253_igsmy1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-smyrnaeans' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ignatius-smyrnaeans-1-seed-of-david-flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:3 — *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh;* Ignatius''s "truly of the race of David according to the flesh" (1:1) is Paul''s very confession against any who deny the real incarnation.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-seed-of-david-flesh'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 1:4 — *And declared to be the Son of Elohim (God) with power, according to the spirit of holiness, by the resurrection from the dead:* the "Son of Elohim by the Divine will and power" of Smyrnaeans 1:1 is the Son declared with power by the resurrection.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-seed-of-david-flesh'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:5 — *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* The "most blessed passion" Ignatius names in 1:1 was wounded-in-the-flesh, foretold by the prophet.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-seed-of-david-flesh'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-smyrnaeans-1-handle-me-risen-flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 24:39 — *Behold my hands and my feet, that it is I myself: handle me, and see; for a spirit hath not flesh and bones, as ye see me have.* Ignatius''s "Lay hold and handle me, and see that I am not a demon without body" (1:3) quotes the risen Messiah''s own proof of flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-handle-me-risen-flesh'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 24:43 — *And he took it, and did eat before them.* That "after His resurrection He [both] ate with them and drank with them" (1:3) is the same eating-in-the-flesh that confounds every docetic semblance.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-handle-me-risen-flesh'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 20:27 — *Then saith he to Thomas, Reach hither thy finger, and behold my hands; and reach hither thy hand, and thrust it into my side: and be not faithless, but believing.* The disciples who "touched Him" in Smyrnaeans 1:3 did as Thomas did, handling the risen flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-handle-me-risen-flesh'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=20 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 10:41 — *Not to all the people, but unto witnesses chosen before of Elohim (God), even to us, who did eat and drink with him after he rose from the dead.* Peter names the very eating-and-drinking with the risen Lord that Ignatius rehearses in 1:3.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-handle-me-risen-flesh'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=10 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 John 1:1 — *That which was from the beginning, which we have heard, which we have seen with our eyes, which we have looked upon, and our hands have handled, of the Word of life;* John''s hands-have-handled witness undergirds Ignatius''s "they touched Him" in 1:3.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-handle-me-risen-flesh'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-smyrnaeans-1-suffered-truly-raised
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:7 — *He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* Ignatius''s "He suffered truly" (1:2) is the lamb''s real affliction the prophet saw, not semblance.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-suffered-truly-raised'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:8 — *He was taken from prison and from judgment: and who shall declare his generation? for he was cut off out of the land of the living: for the transgression of my people was he stricken.* The true death Ignatius defends in 1:2 was foretold as a real cutting-off from the land of the living.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-suffered-truly-raised'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 10:40 — *Him Elohim (God) raised up the third day, and shewed him openly;* "He raised Himself truly" (1:2) and was shewn openly, the bodily resurrection over against every docetic semblance.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-suffered-truly-raised'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=10 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-smyrnaeans-1-prophets-law-moses-gospel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 5:17 — *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil.* When Ignatius faults the deniers for spurning "the law of Moses" (1:5), he stands with the Messiah who came to fulfil, not destroy, the Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-prophets-law-moses-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 5:18 — *For verily I say unto you, Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law, till all be fulfilled.* The law of Moses Ignatius commends in 1:5 endures to the last jot and tittle.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-prophets-law-moses-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:4 — *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments.* The prophets'' closing charge is the very "law of Moses" Ignatius says the unbelievers refused (1:5).'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-prophets-law-moses-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 53:5 — *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* The "passion shown unto us" in the Prophets (1:7) is just this wounded-for-us oracle of Isaiah.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-prophets-law-moses-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-smyrnaeans-1-eucharist-flesh-suffered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 11:23 — *For I have received of Yahusha (the Lord) that which also I delivered unto you, That Yahusha (the Lord Jesus) the same night in which he was betrayed took bread:* Ignatius''s eucharist that is "the flesh of our Saviour" (1:6) is the supper Paul received and delivered.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-eucharist-flesh-suffered'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=11 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 11:24 — *And when he had given thanks, he brake it, and said, Take, eat: this is my body, which is broken for you: this do in remembrance of me.* The bread that is His broken body grounds Ignatius''s claim in 1:6 that the eucharist is the flesh that suffered for our sins.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-eucharist-flesh-suffered'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=11 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 11:26 — *For as often as ye eat this bread, and drink this cup, ye do shew the death of Yahusha (the Lord) till he come.* The one valid love-feast Ignatius guards in 1:8 shews forth the very death-and-return the docetists denied.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-eucharist-flesh-suffered'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=11 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ignatiuspolycarp_01.sql (session253 ignatius-polycarp 1) -----
-- Source anchor: lightfoot-apostolic-fathers/ignatius-polycarp ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: igpol1 (view _session253_igpol1_lookup). Sort band base 70800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_igpol1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ignatius-polycarp-1-perfect-athlete
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 1, 'canon', 'galatians', 6, 2, 'free', E'Galatians 6:2 — *Bear ye one another’s burdens, and so fulfil the law of Messiah (Christ).* Ignatius’ “bear the maladies of all” is Sha’ul’s burden-bearing that fulfils—not abolishes—the law (Ignatius-Polycarp 1:1).'),
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 1, 'canon', '1-thessalonians', 5, 14, 'free', E'1 Thessalonians 5:14 — *Now we exhort you, brethren, warn them that are unruly, comfort the feebleminded, support the weak, be patient toward all men.* The athlete who bears all maladies is the patient pastor supporting the weak (Ignatius-Polycarp 1:1).'),
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 1, 'canon', '1-peter', 5, 2, 'free', E'1 Peter 5:2 — *Feed the flock of Elohim (God) which is among you, taking the oversight thereof, not by constraint, but willingly; not for filthy lucre, but of a ready mind.* The diligent oversight Ignatius urges is Kepha’s willing, ungrudging shepherding (Ignatius-Polycarp 1:1).'),
  -- thread: ignatius-polycarp-1-serpent-and-dove
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 2, 'canon', 'matthew', 10, 16, 'free', E'Matthew 10:16 — *Behold, I send you forth as sheep in the midst of wolves: be ye therefore wise as serpents, and harmless as doves.* Ignatius is quoting the Messiah word-for-word—the serpent’s prudence and the dove’s guilelessness for the shepherd among wolves (Ignatius-Polycarp 1:2).'),
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 2, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The wisdom and watchfulness Ignatius commands answer the prowling adversary Kepha warns of (Ignatius-Polycarp 1:2).'),
  -- thread: ignatius-polycarp-1-anvil-smitten
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 3, 'canon', '1-corinthians', 15, 58, 'free', E'1 Corinthians 15:58 — *Therefore, my beloved brethren, be ye stedfast, unmoveable, always abounding in the work of Yahuah (Lord), forasmuch as ye know that your labour is not in vain in Yahuah (Lord).* The smitten anvil that stands firm is Sha’ul’s stedfast, unmoveable saint (Ignatius-Polycarp 1:3).'),
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 3, 'canon', '2-timothy', 2, 3, 'free', E'2 Timothy 2:3 — *Thou therefore endure hardness, as a good soldier of Yahusha HaMashiach (Jesus Christ).* Ignatius’ great athlete who receives blows and is victorious is the good soldier enduring hardness (Ignatius-Polycarp 1:3).'),
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 3, 'canon', '1-peter', 5, 4, 'free', E'1 Peter 5:4 — *And when the chief Shepherd shall appear, ye shall receive a crown of glory that fadeth not away.* The athlete who is victorious through blows wins the unfading crown of the chief Shepherd (Ignatius-Polycarp 1:3).'),
  -- thread: ignatius-polycarp-1-await-him-who-became-visible
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 3, 'canon', '1-corinthians', 15, 3, 'free', E'1 Corinthians 15:3 — *For I delivered unto you first of all that which I also received, how that Messiah (Christ) died for our sins according to the scriptures.* Ignatius’ Impassible who suffered for our sake is the Messiah who truly died for sins (Ignatius-Polycarp 1:3).'),
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 3, 'canon', '2-timothy', 2, 8, 'free', E'2 Timothy 2:8 — *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel.* The Eternal who became visible is the Messiah of David’s seed, truly in the flesh and truly raised (Ignatius-Polycarp 1:3).'),
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 3, 'canon', 'ephesians', 5, 16, 'free', E'Ephesians 5:16 — *Redeeming the time, because the days are evil.* “Mark the seasons... await Him that is above every season” echoes the charge to redeem the time in evil days (Ignatius-Polycarp 1:3).'),
  -- thread: ignatius-polycarp-1-love-wives-as-the-master
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 5, 'canon', 'ephesians', 5, 25, 'free', E'Ephesians 5:25 — *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it.* Ignatius’ charge to love wives “as Yahuah loved the Church” is verbatim Sha’ul’s self-giving love (Ignatius-Polycarp 1:5).'),
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 5, 'canon', 'ephesians', 5, 2, 'free', E'Ephesians 5:2 — *And walk in love, as Messiah (Christ) also hath loved us, and hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour.* The sacrificial love that measures marriage is the Messiah’s self-offering (Ignatius-Polycarp 1:5).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_igpol1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_igpol1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-polycarp-1-perfect-athlete',
       E'Bear the maladies of all, as a perfect athlete',
       E'Ignatius exhorts the shepherd to shoulder the weakness of the whole flock: *Bear the maladies of all, as a perfect athlete. Where there is more toil, there is much gain.* It ain''t new — this is Sha''ul''s own charge: *Bear ye one another’s burdens, and so fulfil the law of Messiah (Christ)* (Galatians 6:2), and *Now we exhort you, brethren, warn them that are unruly, comfort the feebleminded, support the weak, be patient toward all men* (1 Thessalonians 5:14). The faithful elder feeds, not fleeces: *Feed the flock of Elohim (God) which is among you, taking the oversight thereof, not by constraint, but willingly* (1 Peter 5:2).',
       sv.verse_id, ev.verse_id, 'extras', 70800
  FROM _session253_igpol1_lookup sv, _session253_igpol1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-polycarp' AND ev.chapter_number=1 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-polycarp-1-serpent-and-dove',
       E'Wise as the serpent, guileless as the dove',
       E'Against false teachers Ignatius gives the shepherd the Master’s own watchword: *Be thou prudent as the serpent in all things and guileless always as the dove.* It ain''t new—it is verbatim from Yahusha sending out the twelve: *Behold, I send you forth as sheep in the midst of wolves: be ye therefore wise as serpents, and harmless as doves* (Matthew 10:16). And the wolves are real: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8).',
       sv.verse_id, ev.verse_id, 'extras', 70803
  FROM _session253_igpol1_lookup sv, _session253_igpol1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-polycarp' AND ev.chapter_number=1 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-polycarp-1-anvil-smitten',
       E'Stand firm, as an anvil when it is smitten',
       E'Of strange doctrine Ignatius says: *Let not those that seem to be plausible and yet teach strange doctrine dismay thee. Stand thou firm, as an anvil when it is smitten. It is the part of a great athlete to receive blows and be victorious.* It ain''t new—this is Sha’ul’s closing charge: *Therefore, my beloved brethren, be ye stedfast, unmoveable, always abounding in the work of Yahuah (Lord), forasmuch as ye know that your labour is not in vain in Yahuah (Lord)* (1 Corinthians 15:58); and *Thou therefore endure hardness, as a good soldier of Yahusha HaMashiach (Jesus Christ)* (2 Timothy 2:3). The crown comes to the steadfast: *And when the chief Shepherd shall appear, ye shall receive a crown of glory that fadeth not away* (1 Peter 5:4).',
       sv.verse_id, ev.verse_id, 'extras', 70806
  FROM _session253_igpol1_lookup sv, _session253_igpol1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-polycarp' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-polycarp-1-await-him-who-became-visible',
       E'Await Him who became visible and suffered for our sake',
       E'The anti-docetic core: *Await Him that is above every season, the Eternal, the Invisible, who became visible for our sake, the Impalpable, the Impassible, who suffered for our sake, who endured in all ways for our sake.* It ain''t new—the Eternal truly took flesh and truly suffered: *For I delivered unto you first of all that which I also received, how that Messiah (Christ) died for our sins according to the scriptures* (1 Corinthians 15:3); *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel* (2 Timothy 2:8). And the shepherd must mark the times wisely: *Redeeming the time, because the days are evil* (Ephesians 5:16).',
       sv.verse_id, ev.verse_id, 'extras', 70809
  FROM _session253_igpol1_lookup sv, _session253_igpol1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-polycarp' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-polycarp-1-love-wives-as-the-master',
       E'Love your wives as Yahuah loved His own',
       E'On marriage Ignatius charges: *charge my brothers in the name of Yahusha HaMashiach (Jesus Christ) to love their wives, as Yahuah (Lord) loved the Church.* It ain''t new—it is Sha’ul to the Ephesians: *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25), and *And walk in love, as Messiah (Christ) also hath loved us, and hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2).',
       sv.verse_id, ev.verse_id, 'extras', 70812
  FROM _session253_igpol1_lookup sv, _session253_igpol1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-polycarp' AND ev.chapter_number=1 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ignatius-polycarp-1-perfect-athlete
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 6:2 — *Bear ye one another’s burdens, and so fulfil the law of Messiah (Christ).* Ignatius’ “bear the maladies of all” is Sha’ul’s burden-bearing that fulfils—not abolishes—the law (Ignatius-Polycarp 1:1).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-perfect-athlete'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Thessalonians 5:14 — *Now we exhort you, brethren, warn them that are unruly, comfort the feebleminded, support the weak, be patient toward all men.* The athlete who bears all maladies is the patient pastor supporting the weak (Ignatius-Polycarp 1:1).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-perfect-athlete'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:2 — *Feed the flock of Elohim (God) which is among you, taking the oversight thereof, not by constraint, but willingly; not for filthy lucre, but of a ready mind.* The diligent oversight Ignatius urges is Kepha’s willing, ungrudging shepherding (Ignatius-Polycarp 1:1).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-perfect-athlete'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-polycarp-1-serpent-and-dove
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 10:16 — *Behold, I send you forth as sheep in the midst of wolves: be ye therefore wise as serpents, and harmless as doves.* Ignatius is quoting the Messiah word-for-word—the serpent’s prudence and the dove’s guilelessness for the shepherd among wolves (Ignatius-Polycarp 1:2).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-serpent-and-dove'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The wisdom and watchfulness Ignatius commands answer the prowling adversary Kepha warns of (Ignatius-Polycarp 1:2).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-serpent-and-dove'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-polycarp-1-anvil-smitten
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 15:58 — *Therefore, my beloved brethren, be ye stedfast, unmoveable, always abounding in the work of Yahuah (Lord), forasmuch as ye know that your labour is not in vain in Yahuah (Lord).* The smitten anvil that stands firm is Sha’ul’s stedfast, unmoveable saint (Ignatius-Polycarp 1:3).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-anvil-smitten'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=58
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Timothy 2:3 — *Thou therefore endure hardness, as a good soldier of Yahusha HaMashiach (Jesus Christ).* Ignatius’ great athlete who receives blows and is victorious is the good soldier enduring hardness (Ignatius-Polycarp 1:3).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-anvil-smitten'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:4 — *And when the chief Shepherd shall appear, ye shall receive a crown of glory that fadeth not away.* The athlete who is victorious through blows wins the unfading crown of the chief Shepherd (Ignatius-Polycarp 1:3).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-anvil-smitten'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-polycarp-1-await-him-who-became-visible
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 15:3 — *For I delivered unto you first of all that which I also received, how that Messiah (Christ) died for our sins according to the scriptures.* Ignatius’ Impassible who suffered for our sake is the Messiah who truly died for sins (Ignatius-Polycarp 1:3).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-await-him-who-became-visible'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Timothy 2:8 — *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel.* The Eternal who became visible is the Messiah of David’s seed, truly in the flesh and truly raised (Ignatius-Polycarp 1:3).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-await-him-who-became-visible'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 5:16 — *Redeeming the time, because the days are evil.* “Mark the seasons... await Him that is above every season” echoes the charge to redeem the time in evil days (Ignatius-Polycarp 1:3).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-await-him-who-became-visible'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-polycarp-1-love-wives-as-the-master
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 5:25 — *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it.* Ignatius’ charge to love wives “as Yahuah loved the Church” is verbatim Sha’ul’s self-giving love (Ignatius-Polycarp 1:5).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-love-wives-as-the-master'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 5:2 — *And walk in love, as Messiah (Christ) also hath loved us, and hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour.* The sacrificial love that measures marriage is the Messiah’s self-offering (Ignatius-Polycarp 1:5).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-love-wives-as-the-master'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_martyrdompolycarp_01.sql (session253 martyrdom-polycarp 1) -----
-- Source anchor: lightfoot-apostolic-fathers/martyrdom-polycarp ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: martyrdo1 (view _session253_martyrdo1_lookup). Sort band base 70900, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_martyrdo1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: martyrdom-polycarp-1-conformable-to-the-gospel
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 1, 'canon', 'philippians', 3, 10, 'free', E'Philippians 3:10 -- *That I may know him, and the power of his resurrection, and the fellowship of his sufferings, being made conformable unto his death.* Polycarp''s death "conformable to the Gospel" is Paul''s same word for being conformed to the Messiah''s death.'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 1, 'canon', '1-peter', 1, 11, 'free', E'1 Peter 1:11 -- *Searching what, or what manner of time the Spirit of Messiah (Christ) which was in them did signify, when it testified beforehand the sufferings of Messiah (Christ), and the glory that should follow.* The suffering-then-glory pattern Peter names is the very Gospel the martyrdom is said to be conformable to in 1:1.'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 19, 'canon', 'matthew', 20, 22, 'free', E'Matthew 20:22 -- *But Yahusha (Jesus) answered and said, Ye know not what ye ask. Are ye able to drink of the cup that I shall drink of, and to be baptized with the baptism that I am baptized with? They say unto him, We are able.* Polycarp''s martyrdom "after the pattern of the Gospel" (1:19) is the drinking of the cup the Master held out to His own.'),
  -- thread: martyrdom-polycarp-1-my-king-who-saved-me
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 8, 'canon', 'revelation', 2, 10, 'free', E'Revelation 2:10 -- *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* The Messiah spoke this to the church in Smyrna -- Polycarp''s own city -- and Polycarp''s "how can I blaspheme my King who saved me?" (1:8) is that faithfulness unto death.'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 8, 'canon', 'romans', 8, 35, 'free', E'Romans 8:35 -- *Who shall separate us from the love of Messiah (Christ)? shall tribulation, or distress, or persecution, or famine, or nakedness, or peril, or sword?* Neither the proconsul''s threats nor the fire could separate Polycarp from the King he had served eighty-six years (1:8).'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 8, 'canon', 'acts', 7, 60, 'free', E'Acts 7:60 -- *And he kneeled down, and cried with a loud voice, Yahuah (Lord), lay not this sin to their charge. And when he had said this, he fell asleep.* Stephen the first martyr dies blessing his killers, the same constancy with which Polycarp faced his accusers (1:8).'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 8, 'canon', 'luke', 23, 34, 'free', E'Luke 23:34 -- *Then said Yahusha (Jesus), Father, forgive them; for they know not what they do. And they parted his raiment, and cast lots.* The Master''s own forbearance toward His executioners is the pattern of the witness Polycarp keeps in refusing to blaspheme his King (1:8).'),
  -- thread: martyrdom-polycarp-1-the-cup-unto-resurrection
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 14, 'canon', 'matthew', 20, 23, 'free', E'Matthew 20:23 -- *And he saith unto them, Ye shall drink indeed of my cup, and be baptized with the baptism that I am baptized with: but to sit on my right hand, and on my left, is not mine to give, but it shall be given to them for whom it is prepared of my Father.* Polycarp''s prayer to receive "a portion... in the cup of [Thy] Messiah" (1:14) is the very cup the Master said His own would drink.'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 14, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 -- *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Polycarp''s hope of "resurrection of eternal life, both of soul and of body" (1:14) rests on Daniel''s promise of the awakening of the dead.'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 14, 'canon', 'romans', 8, 17, 'free', E'Romans 8:17 -- *And if children, then heirs; heirs of Elohim (God), and joint-heirs with Messiah (Christ); if so be that we suffer with him, that we may be also glorified together.* Polycarp offered as "a burnt sacrifice acceptable to Elohim" (1:14) is the suffering-with that Paul says ends in being glorified together.'),
  -- thread: martyrdom-polycarp-1-gold-refined-in-the-furnace
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 15, 'canon', '1-peter', 1, 7, 'free', E'1 Peter 1:7 -- *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ).* The body in the flame "like gold and silver refined in a furnace" (1:15) is Peter''s trial-by-fire of faith more precious than gold.'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 15, 'canon', 'zechariah', 13, 9, 'free', E'Zechariah 13:9 -- *And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people: and they shall say, Yahuah (LORD) is my Elohim (God).* The refining of the faithful through fire is the same picture the witnesses saw in Polycarp''s flame (1:15).'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 15, 'canon', 'malachi', 3, 3, 'free', E'Malachi 3:3 -- *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* Polycarp refined "like gold and silver in a furnace" (1:15) is the offering in righteousness the Refiner purges out.'),
  -- thread: martyrdom-polycarp-1-precious-bones-crown-of-immortality
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 18, 'canon', 'psalms', 116, 15, 'free', E'Psalms 116:15 -- *Precious in the sight of Yahuah (LORD) is the death of his saints.* The bones "more valuable than precious stones and finer than refined gold" (1:18) are precious because the saint''s death is precious to Yahuah Himself.'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 17, 'canon', 'revelation', 2, 10, 'free', E'Revelation 2:10 -- *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* Polycarp "crowned with the crown of immortality" (1:17) receives the very crown of life promised to faithful Smyrna.'),
  ('lightfoot-apostolic-fathers', 'martyrdom-polycarp', 1, 20, 'canon', '1-peter', 1, 4, 'free', E'1 Peter 1:4 -- *To an inheritance incorruptible, and undefiled, and that fadeth not away, reserved in heaven for you.* The Elohim "who maketh election from His own servants" (1:20) keeps for His elect this incorruptible inheritance reserved in heaven.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_martyrdo1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_martyrdo1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'martyrdom-polycarp-1-conformable-to-the-gospel',
       E'A martyrdom conformable to the Gospel',
       E'The Smyrnaeans set the whole account under one banner: *For nearly all the foregoing events came to pass that Yahuah (Lord) might show us once more an example of martyrdom which is conformable to the Gospel. For he lingered that he might be delivered up, even as Yahuah (Lord) did, to the end that we too might be imitators of him* (Martyrdom of Polycarp 1:1) -- and they close it the same way: *whose martyrdom all desire to imitate, seeing that it was after the pattern of the Gospel of Messiah (Christ)* (Martyrdom of Polycarp 1:19). It ain''t new -- this is Paul''s own longing: *That I may know him, and the power of his resurrection, and the fellowship of his sufferings, being made conformable unto his death* (Philippians 3:10). Peter had already named the pattern the prophets searched out -- *the sufferings of Messiah (Christ), and the glory that should follow* (1 Peter 1:11) -- and the Master Himself asked whether His own could drink it: *Are ye able to drink of the cup that I shall drink of* (Matthew 20:22). The witness is not a new religion; it is the Gospel re-enacted in the faithful.',
       sv.verse_id, ev.verse_id, 'extras', 70900
  FROM _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='martyrdom-polycarp' AND ev.chapter_number=1 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'martyrdom-polycarp-1-my-king-who-saved-me',
       E'My King who saved me -- faithful unto death',
       E'Pressed to revile the Messiah and go free, the old bishop answers: *Fourscore and six years have I been His servant, and He hath done me no wrong. How then can I blaspheme my King who saved me?* (Martyrdom of Polycarp 1:8). It ain''t new -- this is the crown the risen Messiah promised Smyrna by name: *be thou faithful unto death, and I will give thee a crown of life* (Revelation 2:10). Nothing could pry him loose, just as Paul vowed: *Who shall separate us from the love of Messiah (Christ)? shall tribulation, or distress, or persecution, or famine, or nakedness, or peril, or sword?* (Romans 8:35) -- *Nay, in all these things we are more than conquerors through him that loved us* (Romans 8:37). And his dying posture is the Master''s and Stephen''s: where Yahusha prayed *Father, forgive them; for they know not what they do* (Luke 23:34), and Stephen *kneeled down, and cried with a loud voice, Yahuah (Lord), lay not this sin to their charge* (Acts 7:60), Polycarp too remembered and blessed to the end.',
       sv.verse_id, ev.verse_id, 'extras', 70903
  FROM _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='martyrdom-polycarp' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'martyrdom-polycarp-1-the-cup-unto-resurrection',
       E'The cup of the Messiah unto resurrection of eternal life',
       E'Bound to the stake, Polycarp prays as a willing offering: *like a noble ram out of a great flock for an offering, a burnt sacrifice made ready and acceptable to Elohim (God)... that I might receive a portion amongst the number of martyrs in the cup of [Thy] Messiah (Christ) unto resurrection of eternal life, both of soul and of body* (Martyrdom of Polycarp 1:14). It ain''t new -- the cup is the Master''s: *Ye shall drink indeed of my cup, and be baptized with the baptism that I am baptized with* (Matthew 20:23). The hope of body-and-soul resurrection is Daniel''s: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). And the suffering-then-glory is Paul''s inheritance clause: *if so be that we suffer with him, that we may be also glorified together* (Romans 8:17).',
       sv.verse_id, ev.verse_id, 'extras', 70906
  FROM _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=14
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='martyrdom-polycarp' AND ev.chapter_number=1 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'martyrdom-polycarp-1-gold-refined-in-the-furnace',
       E'Gold and silver refined in a furnace -- the trial of faith',
       E'The eyewitnesses see no ordinary burning: *it was there in the midst, not like flesh burning, but like [a loaf in the oven or like] gold and silver refined in a furnace. For we perceived such a fragrant smell, as if it were the wafted odour of frankincense or some other precious spice* (Martyrdom of Polycarp 1:15). It ain''t new -- Peter named the trial: *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory* (1 Peter 1:7). The prophets had long shown the refining furnace of the faithful remnant: *And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them* (Zechariah 13:9); *And he shall sit as a refiner and purifier of silver... that they may offer unto Yahuah (LORD) an offering in righteousness* (Malachi 3:3). The fire that would not consume him was a refining, not a destroying.',
       sv.verse_id, ev.verse_id, 'extras', 70909
  FROM _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=15
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='martyrdom-polycarp' AND ev.chapter_number=1 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'martyrdom-polycarp-1-precious-bones-crown-of-immortality',
       E'More precious than gold -- the crown of immortality and the elect',
       E'The Evil One could not keep the saints from honouring him: *crowned with the crown of immortality and had won a reward which none could gainsay* (Martyrdom of Polycarp 1:17); and his remains were *bones which are more valuable than precious stones and finer than refined gold* (Martyrdom of Polycarp 1:18), kept for the day Yahuah *who maketh election from His own servants* (Martyrdom of Polycarp 1:20) would gather them. It ain''t new -- the death of such a one is no waste to Heaven: *Precious in the sight of Yahuah (LORD) is the death of his saints* (Psalm 116:15). The crown of immortality is the very crown the Messiah pledged to Smyrna: *be thou faithful unto death, and I will give thee a crown of life* (Revelation 2:10). And election precedes confession -- the inheritance kept *incorruptible, and undefiled, and that fadeth not away, reserved in heaven for you* (1 Peter 1:4).',
       sv.verse_id, ev.verse_id, 'extras', 70912
  FROM _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=17
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='martyrdom-polycarp' AND ev.chapter_number=1 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: martyrdom-polycarp-1-conformable-to-the-gospel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 3:10 -- *That I may know him, and the power of his resurrection, and the fellowship of his sufferings, being made conformable unto his death.* Polycarp''s death "conformable to the Gospel" is Paul''s same word for being conformed to the Messiah''s death.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-conformable-to-the-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 1:11 -- *Searching what, or what manner of time the Spirit of Messiah (Christ) which was in them did signify, when it testified beforehand the sufferings of Messiah (Christ), and the glory that should follow.* The suffering-then-glory pattern Peter names is the very Gospel the martyrdom is said to be conformable to in 1:1.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-conformable-to-the-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 20:22 -- *But Yahusha (Jesus) answered and said, Ye know not what ye ask. Are ye able to drink of the cup that I shall drink of, and to be baptized with the baptism that I am baptized with? They say unto him, We are able.* Polycarp''s martyrdom "after the pattern of the Gospel" (1:19) is the drinking of the cup the Master held out to His own.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-conformable-to-the-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=20 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: martyrdom-polycarp-1-my-king-who-saved-me
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 2:10 -- *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* The Messiah spoke this to the church in Smyrna -- Polycarp''s own city -- and Polycarp''s "how can I blaspheme my King who saved me?" (1:8) is that faithfulness unto death.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-my-king-who-saved-me'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 8:35 -- *Who shall separate us from the love of Messiah (Christ)? shall tribulation, or distress, or persecution, or famine, or nakedness, or peril, or sword?* Neither the proconsul''s threats nor the fire could separate Polycarp from the King he had served eighty-six years (1:8).'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-my-king-who-saved-me'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:60 -- *And he kneeled down, and cried with a loud voice, Yahuah (Lord), lay not this sin to their charge. And when he had said this, he fell asleep.* Stephen the first martyr dies blessing his killers, the same constancy with which Polycarp faced his accusers (1:8).'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-my-king-who-saved-me'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=60
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 23:34 -- *Then said Yahusha (Jesus), Father, forgive them; for they know not what they do. And they parted his raiment, and cast lots.* The Master''s own forbearance toward His executioners is the pattern of the witness Polycarp keeps in refusing to blaspheme his King (1:8).'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-my-king-who-saved-me'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=23 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: martyrdom-polycarp-1-the-cup-unto-resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 20:23 -- *And he saith unto them, Ye shall drink indeed of my cup, and be baptized with the baptism that I am baptized with: but to sit on my right hand, and on my left, is not mine to give, but it shall be given to them for whom it is prepared of my Father.* Polycarp''s prayer to receive "a portion... in the cup of [Thy] Messiah" (1:14) is the very cup the Master said His own would drink.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-the-cup-unto-resurrection'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=20 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 -- *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Polycarp''s hope of "resurrection of eternal life, both of soul and of body" (1:14) rests on Daniel''s promise of the awakening of the dead.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-the-cup-unto-resurrection'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:17 -- *And if children, then heirs; heirs of Elohim (God), and joint-heirs with Messiah (Christ); if so be that we suffer with him, that we may be also glorified together.* Polycarp offered as "a burnt sacrifice acceptable to Elohim" (1:14) is the suffering-with that Paul says ends in being glorified together.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-the-cup-unto-resurrection'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: martyrdom-polycarp-1-gold-refined-in-the-furnace
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Peter 1:7 -- *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ).* The body in the flame "like gold and silver refined in a furnace" (1:15) is Peter''s trial-by-fire of faith more precious than gold.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-gold-refined-in-the-furnace'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 13:9 -- *And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people: and they shall say, Yahuah (LORD) is my Elohim (God).* The refining of the faithful through fire is the same picture the witnesses saw in Polycarp''s flame (1:15).'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-gold-refined-in-the-furnace'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=13 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 3:3 -- *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* Polycarp refined "like gold and silver in a furnace" (1:15) is the offering in righteousness the Refiner purges out.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-gold-refined-in-the-furnace'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: martyrdom-polycarp-1-precious-bones-crown-of-immortality
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 116:15 -- *Precious in the sight of Yahuah (LORD) is the death of his saints.* The bones "more valuable than precious stones and finer than refined gold" (1:18) are precious because the saint''s death is precious to Yahuah Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-precious-bones-crown-of-immortality'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=116 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 2:10 -- *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* Polycarp "crowned with the crown of immortality" (1:17) receives the very crown of life promised to faithful Smyrna.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-precious-bones-crown-of-immortality'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:4 -- *To an inheritance incorruptible, and undefiled, and that fadeth not away, reserved in heaven for you.* The Elohim "who maketh election from His own servants" (1:20) keeps for His elect this incorruptible inheritance reserved in heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_martyrdo1_lookup sv, _session253_martyrdo1_lookup tv
 WHERE t.slug='martyrdom-polycarp-1-precious-bones-crown-of-immortality'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='martyrdom-polycarp' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session253 — 2 Clement (Apostolic Fathers) cross-references complete.'
