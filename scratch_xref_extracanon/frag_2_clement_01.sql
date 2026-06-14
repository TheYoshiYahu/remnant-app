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

