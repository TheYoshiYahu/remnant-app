-- ----- fragment: minion_ecclesiasticus_38.sql (session253 ecclesiasticus 38) -----
-- Source anchor: apocrypha/ecclesiasticus ch38. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir38 (view _session253_sir38_lookup). Sort band base 59225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir38_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-38-honour-the-physician
  ('apocrypha', 'ecclesiasticus', 38, 1, 'canon', 'exodus', 15, 26, 'free', E'Exodus 15:26 — *And said, If thou wilt diligently hearken to the voice of Yahuah Elohayka (the LORD thy God), and wilt do that which is right in his sight, and wilt give ear to his commandments, and keep all his statutes, I will put none of these diseases upon thee, which I have brought upon the Egyptians: for I am Yahuah Rapha (the LORD that healeth thee).* The physician Sirach bids us honour serves the One who at Marah revealed Himself as Yahuah-Rapha, the healer behind all healing.'),
  ('apocrypha', 'ecclesiasticus', 38, 2, 'canon', 'psalms', 103, 3, 'free', E'Psalms 103:3 — *Who forgiveth all thine iniquities; who healeth all thy diseases;* David anchors what Sirach 38:2 confesses — that healing *comes* from the Most High, joined to the forgiveness of sin.'),
  ('apocrypha', 'ecclesiasticus', 38, 2, 'canon', 'jeremiah', 17, 14, 'free', E'Jeremiah 17:14 — *Heal me, O Yahuah (LORD), and I shall be healed; save me, and I shall be saved: for thou art my praise.* Jeremiah''s prayer says with Sirach 38:2 that the cure descends *of the Most High*, not from the healer''s own power.'),
  ('apocrypha', 'ecclesiasticus', 38, 4, 'apocrypha', 'the-wisdom-of-solomon', 16, 12, 'extras', E'Wisdom of Solomon 16:12 — *For it was neither herb, nor mollifying plaister, that restored them to health: but your word, O Yahuah (God), which healeth all things.* The companion wisdom book names the Word behind the medicines Sirach 38:4 says Yahuah *created out of the earth*.'),
  -- thread: ecclesiasticus-38-pray-in-sickness-leave-off-sin
  ('apocrypha', 'ecclesiasticus', 38, 9, 'canon', 'james', 5, 14, 'free', E'James 5:14 — *Is any sick among you? let him call for the elders of the church; and let them pray over him, anointing him with oil in the name of Yahuah (Lord):* James keeps Sirach 38:9''s order — in sickness, first call on Yahuah in prayer.'),
  ('apocrypha', 'ecclesiasticus', 38, 9, 'canon', 'james', 5, 15, 'free', E'James 5:15 — *And the prayer of faith shall save the sick, and Yahuah (Lord) shall raise him up; and if he have committed sins, they shall be forgiven him.* The healing-with-forgiveness of James joins Sirach 38:9-10''s pairing of being made whole with leaving off sin.'),
  ('apocrypha', 'ecclesiasticus', 38, 10, 'canon', 'proverbs', 3, 8, 'free', E'Proverbs 3:8 — *It shall be health to thy navel, and marrow to thy bones.* The proverb promises bodily health to the one who fears Yahuah and departs from evil — exactly Sirach 38:10''s call to cleanse the heart from all wickedness.'),
  ('apocrypha', 'ecclesiasticus', 38, 15, 'canon', '2-chronicles', 16, 12, 'free', E'2 Chronicles 16:12 — *And Asa in the thirty and ninth year of his reign was diseased in his feet, until his disease was exceeding great: yet in his disease he sought not to Yahuah (LORD), but to the physicians.* Asa is the warning beneath Sirach 38:15 — the sinner who runs to the physician''s hand while refusing to seek his Maker.'),
  -- thread: ecclesiasticus-38-mourn-the-dead-then-be-comforted
  ('apocrypha', 'ecclesiasticus', 38, 16, 'canon', 'genesis', 50, 10, 'free', E'Genesis 50:10 — *And they came to the threshingfloor of Atad, which is beyond Jordan, and there they mourned with a great and very sore lamentation: and he made a mourning for his father seven days.* Joseph''s seven-day mourning for Jacob is the burial custom Sirach 38:16 bids the son keep — tears, lament, and not neglecting the burial.'),
  ('apocrypha', 'ecclesiasticus', 38, 17, 'canon', '1-thessalonians', 4, 13, 'free', E'1 Thessalonians 4:13 — *But I would not have you to be ignorant, brethren, concerning them which are asleep, that ye sorrow not, even as others which have no hope.* Paul gives the reason Sirach 38:17 bids us be comforted after a day or two — the dead are asleep, and the believer''s sorrow is bounded by hope.'),
  ('apocrypha', 'ecclesiasticus', 38, 23, 'canon', 'john', 11, 35, 'free', E'John 11:35 — *Yahusha (Jesus) wept.* The shortest verse shows the Master weeping at Lazarus'' tomb, yet about to call him forth — grief honoured, then overtaken by comfort, as Sirach 38:23 counsels when the dead is at rest.'),
  ('apocrypha', 'ecclesiasticus', 38, 17, 'apocrypha', 'ecclesiasticus', 22, 11, 'extras', E'Ecclesiasticus 22:11 — *Weep for the dead, for he has lost the light: and weep for the fool, for he wanteth understanding: make little weeping for the dead, for he is at rest: but the life of the fool is worse than death.* Ben Sira''s own self-link doubles Sirach 38:17 — make little weeping, for the dead is at rest.'),
  ('apocrypha', 'ecclesiasticus', 38, 16, 'apocrypha', 'ecclesiasticus', 7, 34, 'extras', E'Ecclesiasticus 7:34 — *Fail not to be with them that weep, and mourn with them that mourn.* Sirach''s earlier word on shared mourning underwrites the lament he commands the son in 38:16, and prefigures Romans 12:15.'),
  -- thread: ecclesiasticus-38-craftsman-smith-potter-wise-in-his-work
  ('apocrypha', 'ecclesiasticus', 38, 28, 'canon', 'genesis', 4, 22, 'free', E'Genesis 4:22 — *And Zillah, she also bare Tubal-cain, an instructer of every artificer in brass and iron: and the sister of Tubal-cain was Naamah.* Tubal-cain the first smith stands behind Sirach 38:28''s smith at the anvil — it ain''t new; the artificer''s craft reaches back to Lamech''s line.'),
  ('apocrypha', 'ecclesiasticus', 38, 27, 'canon', 'exodus', 31, 3, 'free', E'Exodus 31:3 — *And I have filled him with the spirit of Elohim (God), in wisdom, and in understanding, and in knowledge, and in all manner of workmanship,* Bezalel''s Spirit-given skill shows the source of the craftsman''s wisdom Sirach 38:27 praises — every one wise in his work by Yahuah''s gift.'),
  ('apocrypha', 'ecclesiasticus', 38, 29, 'canon', 'isaiah', 64, 8, 'free', E'Isaiah 64:8 — *But now, O Yahuah (LORD), thou art our father; we are the clay, and thou our potter; and we all are the work of thy hand.* The potter at the wheel in Sirach 38:29 is also Yahuah''s parable of His sovereign hand over Israel the clay.'),
  ('apocrypha', 'ecclesiasticus', 38, 29, 'apocrypha', 'the-wisdom-of-solomon', 15, 7, 'extras', E'Wisdom of Solomon 15:7 — *For the potter, tempering soft earth, fashioneth every vessel with much labour for our service: yes, of the same clay he makes both the vessels that serve for clean uses, and likewise also all such as serve to the contrary: but what is the use of either sort, the potter himself is the judge.* The sister wisdom book takes Sirach 38:29''s potter into the figure of Yahuah''s sovereign making — one clay, vessels to honour and dishonour.'),
  -- thread: ecclesiasticus-38-leisure-of-the-scribe-for-wisdom
  ('apocrypha', 'ecclesiasticus', 38, 24, 'canon', 'proverbs', 22, 29, 'free', E'Proverbs 22:29 — *Seest thou a man diligent in his business? he shall stand before kings; he shall not stand before mean men.* The diligent man who stands before kings matches Sirach 38:24''s learned man whose wisdom comes by the leisure to apply his whole mind.'),
  ('apocrypha', 'ecclesiasticus', 38, 24, 'canon', 'proverbs', 3, 7, 'free', E'Proverbs 3:7 — *Be not wise in thine own eyes: fear Yahuah (LORD), and depart from evil.* The wisdom Sirach 38:24 prizes is the Torah kind — not self-conceit, but the fear of Yahuah, which chapter 39''s scribe seeks in the law.'),
  ('apocrypha', 'ecclesiasticus', 38, 34, 'canon', '1-peter', 5, 6, 'free', E'1 Peter 5:6 — *Humble yourselves therefore under the mighty hand of Elohim (God), that he may exalt you in due time:* Sirach 38:34 honours the lowly craftsmen who maintain the world though they sit not on the judges'' seat — the humble whom Yahuah exalts in His time.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir38_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir38_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-38-honour-the-physician',
       E'Honour the physician — for Yahuah created him',
       E'Ben Sira sets the physician inside the covenant, not against it: *Honour a physician with the honour due to him for the uses which you may have of him: for Yahuah (God) has created him* (Ecclesiasticus 38:1), *For of the Most High comes healing, and he shall receive honour of the king* (Ecclesiasticus 38:2), *Yahuah (God) has created medicines out of the earth; and he that is wise will not abhor them* (Ecclesiasticus 38:4). The healer''s skill is a gift of the Most High, never a rival to Him — the same Torah confession Yahuah made at Marah: *And said, If thou wilt diligently hearken to the voice of Yahuah Elohayka (the LORD thy God)... I will put none of these diseases upon thee, which I have brought upon the Egyptians: for I am Yahuah Rapha (the LORD that healeth thee)* (Exodus 15:26). David blesses Him *Who forgiveth all thine iniquities; who healeth all thy diseases* (Psalms 103:3); Jeremiah prays *Heal me, O Yahuah (LORD), and I shall be healed* (Jeremiah 17:14). The sister apocryphal Wisdom names the true Physician behind every remedy: *For it was neither herb, nor mollifying plaister, that restored them to health: but your word, O Yahuah (God), which healeth all things* (Wisdom of Solomon 16:12). It ain''t new — the medicines come *out of the earth* Yahuah made, and the cure is always His.',
       sv.verse_id, ev.verse_id, 'extras', 59225
  FROM _session253_sir38_lookup sv, _session253_sir38_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=38 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-38-pray-in-sickness-leave-off-sin',
       E'In sickness, pray and leave off sin — repentance before the remedy',
       E'Ben Sira will not let the patient skip the heart: *My son, in your sickness be not negligent: but pray to Yahuah (God), and he will make you whole* (Ecclesiasticus 38:9), *Leave off from sin, and order yours hands aright, and cleanse your heart from all wickedness* (Ecclesiasticus 38:10), *Then give place to the physician, for Yahuah (God) has created him: let him not go from you, for you have need of him* (Ecclesiasticus 38:12). Prayer and repentance first; then the God-given physician — the two held together. James gives the same order to the assembly: *Is any sick among you? let him call for the elders of the church; and let them pray over him, anointing him with oil in the name of Yahuah (Lord):* (James 5:14), *And the prayer of faith shall save the sick, and Yahuah (Lord) shall raise him up; and if he have committed sins, they shall be forgiven him* (James 5:15). Hezekiah turned his face and *prayed* and was healed (Isaiah 38:21, the lump of figs laid on the boil), and the proverb seals it: *Be not wise in thine own eyes: fear Yahuah (LORD), and depart from evil* (Proverbs 3:7), for then *It shall be health to thy navel, and marrow to thy bones* (Proverbs 3:8). Sirach 38 and James teach one Torah ethic — healing is sought on bent knee, with cleansed hands.',
       sv.verse_id, ev.verse_id, 'extras', 59228
  FROM _session253_sir38_lookup sv, _session253_sir38_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=38 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-38-mourn-the-dead-then-be-comforted',
       E'Weep for the dead a day or two — then be comforted',
       E'Ben Sira honours real grief and then bounds it: *My son, let tears fall down over the dead, and begin to lament, as if you had suffered great harm thyself; and then cover his body according to the custom, and neglect not his burial* (Ecclesiasticus 38:16), *Weep bitterly, and make great moan, and use lamentation, as he is worthy, and that a day or two, lest you be evil spoken of: and then comfort thyself for your heaviness* (Ecclesiasticus 38:17), *When the dead is at rest, let his remembrance rest; and be comforted for him, when his Spirit is departed from him* (Ecclesiasticus 38:23). The patriarchs wept and buried so: *and there they mourned with a great and very sore lamentation: and he made a mourning for his father seven days* (Genesis 50:10). Paul gives the bound of grief its hope: *But I would not have you to be ignorant, brethren, concerning them which are asleep, that ye sorrow not, even as others which have no hope* (1 Thessalonians 4:13). Even the Master *wept* at a grave (John 11:35) — yet to raise the dead. Sirach''s own counsel is echoed in his sister-text: *make little weeping for the dead, for he is at rest* (Ecclesiasticus 22:11) and *Fail not to be with them that weep, and mourn with them that mourn* (Ecclesiasticus 7:34). Lament fully — then be comforted, for the dead are at rest in hope.',
       sv.verse_id, ev.verse_id, 'extras', 59231
  FROM _session253_sir38_lookup sv, _session253_sir38_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=38 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-38-craftsman-smith-potter-wise-in-his-work',
       E'The carpenter, the smith, the potter — every one wise in his work',
       E'Ben Sira blesses honest labour: the carpenter and workmaster *that laboureth night and day* (Ecclesiasticus 38:27), *The smith also sitting by the anvil... his eyes look still upon the pattern of the thing that he makes; he sets his mind to finish his work* (Ecclesiasticus 38:28), *So does the potter sitting at his work, and turning the wheel about with his feet... and makes all his work by number* (Ecclesiasticus 38:29), *All these trust to their hands: and every one is wise in his work* (Ecclesiasticus 38:31). The crafts are old as Eden''s east: *And Zillah, she also bare Tubal-cain, an instructer of every artificer in brass and iron* (Genesis 4:22), and the wisdom for the work is the Spirit''s gift — *And I have filled him with the spirit of Elohim (God), in wisdom, and in understanding, and in knowledge, and in all manner of workmanship* (Exodus 31:3). The potter at his wheel is also Yahuah''s own parable of His sovereign hand — *But now, O Yahuah (LORD), thou art our father; we are the clay, and thou our potter; and we all are the work of thy hand* (Isaiah 64:8) — a figure the sister wisdom unfolds: *For the potter, tempering soft earth, fashioneth every vessel with much labour for our service... but what is the use of either sort, the potter himself is the judge* (Wisdom of Solomon 15:7). The honest craft maintains the world (38:34); and the Potter over all is Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 59234
  FROM _session253_sir38_lookup sv, _session253_sir38_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=27
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=38 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-38-leisure-of-the-scribe-for-wisdom',
       E'The wisdom of the learned comes by leisure — but who shall maintain the world?',
       E'Ben Sira turns from the crafts to his own calling: *The wisdom of a learned man comes by opportunity of leisure: and he that has little business shall become wise* (Ecclesiasticus 38:24). The ploughman, smith, and potter cannot sit in counsel — *They shall not be sought for in publick counsel, nor sit high in the congregation: they shall not sit on the judges'' seat* (Ecclesiasticus 38:33) — yet they are honoured still, for *they will maintain the state of the world, and all their desire is in the work of their craft* (Ecclesiasticus 38:34). This is the doorway into chapter 39''s portrait of the scribe who *gives his mind to the law of the Most High*. The freed mind that gains wisdom is the diligent one Proverbs commends: *Seest thou a man diligent in his business? he shall stand before kings; he shall not stand before mean men* (Proverbs 22:29). And the wisdom so gained is bent toward the fear of Yahuah and a low heart: *Be not wise in thine own eyes: fear Yahuah (LORD), and depart from evil* (Proverbs 3:7), *Humble yourselves therefore under the mighty hand of Elohim (God), that he may exalt you in due time:* (1 Peter 5:6). Leisure is not idleness here — it is the room to meditate, the scribe''s labour for the law (Sirach 39).',
       sv.verse_id, ev.verse_id, 'extras', 59237
  FROM _session253_sir38_lookup sv, _session253_sir38_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=38 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-38-honour-the-physician
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 15:26 — *And said, If thou wilt diligently hearken to the voice of Yahuah Elohayka (the LORD thy God), and wilt do that which is right in his sight, and wilt give ear to his commandments, and keep all his statutes, I will put none of these diseases upon thee, which I have brought upon the Egyptians: for I am Yahuah Rapha (the LORD that healeth thee).* The physician Sirach bids us honour serves the One who at Marah revealed Himself as Yahuah-Rapha, the healer behind all healing.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-honour-the-physician'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 103:3 — *Who forgiveth all thine iniquities; who healeth all thy diseases;* David anchors what Sirach 38:2 confesses — that healing *comes* from the Most High, joined to the forgiveness of sin.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-honour-the-physician'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 17:14 — *Heal me, O Yahuah (LORD), and I shall be healed; save me, and I shall be saved: for thou art my praise.* Jeremiah''s prayer says with Sirach 38:2 that the cure descends *of the Most High*, not from the healer''s own power.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-honour-the-physician'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 16:12 — *For it was neither herb, nor mollifying plaister, that restored them to health: but your word, O Yahuah (God), which healeth all things.* The companion wisdom book names the Word behind the medicines Sirach 38:4 says Yahuah *created out of the earth*.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-honour-the-physician'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=16 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-38-pray-in-sickness-leave-off-sin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 5:14 — *Is any sick among you? let him call for the elders of the church; and let them pray over him, anointing him with oil in the name of Yahuah (Lord):* James keeps Sirach 38:9''s order — in sickness, first call on Yahuah in prayer.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-pray-in-sickness-leave-off-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 5:15 — *And the prayer of faith shall save the sick, and Yahuah (Lord) shall raise him up; and if he have committed sins, they shall be forgiven him.* The healing-with-forgiveness of James joins Sirach 38:9-10''s pairing of being made whole with leaving off sin.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-pray-in-sickness-leave-off-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 3:8 — *It shall be health to thy navel, and marrow to thy bones.* The proverb promises bodily health to the one who fears Yahuah and departs from evil — exactly Sirach 38:10''s call to cleanse the heart from all wickedness.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-pray-in-sickness-leave-off-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Chronicles 16:12 — *And Asa in the thirty and ninth year of his reign was diseased in his feet, until his disease was exceeding great: yet in his disease he sought not to Yahuah (LORD), but to the physicians.* Asa is the warning beneath Sirach 38:15 — the sinner who runs to the physician''s hand while refusing to seek his Maker.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-pray-in-sickness-leave-off-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=16 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-38-mourn-the-dead-then-be-comforted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 50:10 — *And they came to the threshingfloor of Atad, which is beyond Jordan, and there they mourned with a great and very sore lamentation: and he made a mourning for his father seven days.* Joseph''s seven-day mourning for Jacob is the burial custom Sirach 38:16 bids the son keep — tears, lament, and not neglecting the burial.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-mourn-the-dead-then-be-comforted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Thessalonians 4:13 — *But I would not have you to be ignorant, brethren, concerning them which are asleep, that ye sorrow not, even as others which have no hope.* Paul gives the reason Sirach 38:17 bids us be comforted after a day or two — the dead are asleep, and the believer''s sorrow is bounded by hope.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-mourn-the-dead-then-be-comforted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 11:35 — *Yahusha (Jesus) wept.* The shortest verse shows the Master weeping at Lazarus'' tomb, yet about to call him forth — grief honoured, then overtaken by comfort, as Sirach 38:23 counsels when the dead is at rest.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-mourn-the-dead-then-be-comforted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 22:11 — *Weep for the dead, for he has lost the light: and weep for the fool, for he wanteth understanding: make little weeping for the dead, for he is at rest: but the life of the fool is worse than death.* Ben Sira''s own self-link doubles Sirach 38:17 — make little weeping, for the dead is at rest.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-mourn-the-dead-then-be-comforted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=22 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiasticus 7:34 — *Fail not to be with them that weep, and mourn with them that mourn.* Sirach''s earlier word on shared mourning underwrites the lament he commands the son in 38:16, and prefigures Romans 12:15.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-mourn-the-dead-then-be-comforted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=7 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-38-craftsman-smith-potter-wise-in-his-work
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:22 — *And Zillah, she also bare Tubal-cain, an instructer of every artificer in brass and iron: and the sister of Tubal-cain was Naamah.* Tubal-cain the first smith stands behind Sirach 38:28''s smith at the anvil — it ain''t new; the artificer''s craft reaches back to Lamech''s line.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-craftsman-smith-potter-wise-in-his-work'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 31:3 — *And I have filled him with the spirit of Elohim (God), in wisdom, and in understanding, and in knowledge, and in all manner of workmanship,* Bezalel''s Spirit-given skill shows the source of the craftsman''s wisdom Sirach 38:27 praises — every one wise in his work by Yahuah''s gift.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-craftsman-smith-potter-wise-in-his-work'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=31 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 64:8 — *But now, O Yahuah (LORD), thou art our father; we are the clay, and thou our potter; and we all are the work of thy hand.* The potter at the wheel in Sirach 38:29 is also Yahuah''s parable of His sovereign hand over Israel the clay.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-craftsman-smith-potter-wise-in-his-work'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=64 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 15:7 — *For the potter, tempering soft earth, fashioneth every vessel with much labour for our service: yes, of the same clay he makes both the vessels that serve for clean uses, and likewise also all such as serve to the contrary: but what is the use of either sort, the potter himself is the judge.* The sister wisdom book takes Sirach 38:29''s potter into the figure of Yahuah''s sovereign making — one clay, vessels to honour and dishonour.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-craftsman-smith-potter-wise-in-his-work'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=29
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-38-leisure-of-the-scribe-for-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 22:29 — *Seest thou a man diligent in his business? he shall stand before kings; he shall not stand before mean men.* The diligent man who stands before kings matches Sirach 38:24''s learned man whose wisdom comes by the leisure to apply his whole mind.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-leisure-of-the-scribe-for-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 3:7 — *Be not wise in thine own eyes: fear Yahuah (LORD), and depart from evil.* The wisdom Sirach 38:24 prizes is the Torah kind — not self-conceit, but the fear of Yahuah, which chapter 39''s scribe seeks in the law.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-leisure-of-the-scribe-for-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:6 — *Humble yourselves therefore under the mighty hand of Elohim (God), that he may exalt you in due time:* Sirach 38:34 honours the lowly craftsmen who maintain the world though they sit not on the judges'' seat — the humble whom Yahuah exalts in His time.'
  FROM cross_reference_threads t, cross_references x, _session253_sir38_lookup sv, _session253_sir38_lookup tv
 WHERE t.slug='ecclesiasticus-38-leisure-of-the-scribe-for-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=38 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

