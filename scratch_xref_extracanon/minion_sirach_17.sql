-- ----- fragment: minion_ecclesiasticus_17.sql (session253 ecclesiasticus 17) -----
-- Source anchor: apocrypha/ecclesiasticus ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir17 (view _session253_sir17_lookup). Sort band base 58700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-17-man-in-the-image
  ('apocrypha', 'ecclesiasticus', 17, 3, 'canon', 'genesis', 1, 26, 'free', E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* Sirach 17:3-4 names the very image-and-dominion grant of the sixth day.'),
  ('apocrypha', 'ecclesiasticus', 17, 1, 'canon', 'genesis', 2, 7, 'free', E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Sirach 17:1 ''created man of the earth, and turned him into it again'' is Genesis 2:7 read with Genesis 3:19.'),
  ('apocrypha', 'ecclesiasticus', 17, 4, 'canon', 'genesis', 9, 2, 'free', E'Genesis 9:2 — *And the fear of you and the dread of you shall be upon every beast of the earth, and upon every fowl of the air, upon all that moveth upon the earth, and upon all the fishes of the sea; into your hand are they delivered.* Sirach 17:4 ''put the fear of man upon all flesh'' is the Noahic dominion-grant verbatim.'),
  ('apocrypha', 'ecclesiasticus', 17, 4, 'canon', 'psalms', 8, 6, 'free', E'Psalms 8:6 — *Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet:* the dominion Sirach 17:4 gives over beasts and fowls is the dominion David sings.'),
  ('apocrypha', 'ecclesiasticus', 17, 3, 'canon', 'psalms', 8, 5, 'free', E'Psalms 8:5 — *For thou hast made him a little lower than the angels, and hast crowned him with glory and honour.* The man made ''according to his image'' (Sirach 17:3) is the man crowned with glory and honour.'),
  -- thread: ecclesiasticus-17-the-law-of-life-everlasting-covenant
  ('apocrypha', 'ecclesiasticus', 17, 12, 'canon', 'exodus', 19, 5, 'free', E'Exodus 19:5 — *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine:* the ''everlasting covenant'' of Sirach 17:12 is the Sinai covenant offered to Israel.'),
  ('apocrypha', 'ecclesiasticus', 17, 12, 'canon', 'exodus', 24, 8, 'free', E'Exodus 24:8 — *And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words.* The covenant Sirach 17:12 calls everlasting is the blood-ratified covenant of Sinai.'),
  ('apocrypha', 'ecclesiasticus', 17, 11, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* the ''law of life'' of Sirach 17:11 is Moses'' choose-life Torah.'),
  ('apocrypha', 'ecclesiasticus', 17, 12, 'canon', 'jeremiah', 31, 33, 'free', E'Jeremiah 31:33 — *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* The everlasting covenant of Sirach 17:12 is the law written on the heart — same Torah, kept inwardly.'),
  ('apocrypha', 'ecclesiasticus', 17, 11, 'apocrypha', 'ecclesiasticus', 24, 23, 'extras', E'Ecclesiasticus 24:23 — *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* Ben Sira''s own crown-chapter identifies the ''law of life for an heritage'' (Sirach 17:11) as the Torah and the book of the covenant.'),
  -- thread: ecclesiasticus-17-law-written-in-the-heart
  ('apocrypha', 'ecclesiasticus', 17, 7, 'canon', 'romans', 2, 14, 'free', E'Romans 2:14 — *For when the Gentiles, which have not the law, do by nature the things contained in the law, these, having not the law, are a law unto themselves:* the heart ''shewed... good and evil'' in Sirach 17:7 is Paul''s law written in the conscience.'),
  ('apocrypha', 'ecclesiasticus', 17, 11, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 1, 'extras', E'Baruch 4:1 — *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die.* Baruch names the ''law of life for an heritage'' (Sirach 17:11) the enduring commandment by which one lives.'),
  ('apocrypha', 'ecclesiasticus', 17, 6, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* the heart and counsel given to understand good and evil (Sirach 17:6) equip man for Moses'' life-and-death choice.'),
  -- thread: ecclesiasticus-17-israel-the-portion-bounds-of-nations
  ('apocrypha', 'ecclesiasticus', 17, 17, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* Sirach 17:17''s division of the nations with Israel kept apart is the Song of Moses verbatim.'),
  ('apocrypha', 'ecclesiasticus', 17, 17, 'canon', 'deuteronomy', 32, 9, 'free', E'Deuteronomy 32:9 — *For the LORD''S portion is his people; Jacob is the lot of his inheritance.* ''Israel is the portion of Yahuah'' (Sirach 17:17) repeats Moses'' word for word.'),
  ('apocrypha', 'ecclesiasticus', 17, 17, 'canon', 'acts', 17, 26, 'free', E'Acts 17:26 — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation;* Paul preaches the same set bounds of the nations Sirach 17:17 names.'),
  -- thread: ecclesiasticus-17-all-works-before-him-recompense
  ('apocrypha', 'ecclesiasticus', 17, 15, 'canon', 'hebrews', 4, 13, 'free', E'Hebrews 4:13 — *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do.* Sirach 17:15 ''their ways... shall not be hid from his eyes'' is the same all-seeing scrutiny.'),
  ('apocrypha', 'ecclesiasticus', 17, 23, 'canon', 'matthew', 16, 27, 'free', E'Matthew 16:27 — *For the Son of Adam shall come in the glory of his Father with his angels; and then he shall reward every man according to his works.* The Messiah''s coming recompense matches Sirach 17:23, ''render their recompence upon their heads.'''),
  ('apocrypha', 'ecclesiasticus', 17, 23, 'canon', 'revelation', 22, 12, 'free', E'Revelation 22:12 — *And, behold, I come quickly; and my reward is with me, to give every man according as his work shall be.* The reward rendered upon every head in Sirach 17:23 is the reward carried at the Coming.'),
  -- thread: ecclesiasticus-17-call-to-repentance-turn-and-live
  ('apocrypha', 'ecclesiasticus', 17, 26, 'canon', 'ezekiel', 18, 30, 'free', E'Ezekiel 18:30 — *Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* Sirach 17:26 ''turn away from iniquity'' is Ezekiel''s turn-and-be-saved call.'),
  ('apocrypha', 'ecclesiasticus', 17, 24, 'canon', 'ezekiel', 18, 32, 'free', E'Ezekiel 18:32 — *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* The mercy granting return in Sirach 17:24 is Yahuah''s no-pleasure-in-death heart.'),
  ('apocrypha', 'ecclesiasticus', 17, 29, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The great lovingkindness toward those that turn (Sirach 17:29) is Peter''s longsuffering unto repentance.'),
  ('apocrypha', 'ecclesiasticus', 17, 25, 'canon', 'james', 4, 8, 'free', E'James 4:8 — *Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded.* ''Make your prayer before his face, and offend less'' (Sirach 17:25) is James'' draw-nigh-and-cleanse summons.'),
  ('apocrypha', 'ecclesiasticus', 17, 24, 'canon', 'luke', 15, 7, 'free', E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The return granted to them that repent (Sirach 17:24) is the heaven-joy over one sinner turning.'),
  -- thread: ecclesiasticus-17-no-praise-in-the-grave
  ('apocrypha', 'ecclesiasticus', 17, 27, 'canon', 'psalms', 6, 5, 'free', E'Psalms 6:5 — *For in death there is no remembrance of thee: in the grave who shall give thee thanks?* Sirach 17:27 ''who shall praise the Most High in the grave'' is David''s question word for word.'),
  ('apocrypha', 'ecclesiasticus', 17, 28, 'canon', 'psalms', 115, 17, 'free', E'Psalms 115:17 — *The dead praise not Yahuah (LORD), neither any that go down into silence.* Sirach 17:28 ''thanksgiving perishes from the dead'' is the same silence of the grave.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-17-man-in-the-image',
       E'Man created of the earth, made after his image, given dominion',
       E'Ben Sira opens with the making of Adam — *Yahuah (God) created man of the earth, and turned him into it again* (Ecclesiasticus 17:1), *and made them according to his image* (Ecclesiasticus 17:3), and *put the fear of man upon all flesh, and gave him dominion over beasts and fowls* (Ecclesiasticus 17:4). It ain''t new: he is retelling Genesis. *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air* (Genesis 1:26); *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7). The fear set upon the beasts is the Noahic grant — *And the fear of you and the dread of you shall be upon every beast of the earth* (Genesis 9:2), *Every moving thing that liveth shall be meat for you* (Genesis 9:3). And the crown of dominion is sung in Psalm 8: *For thou hast made him a little lower than the angels, and hast crowned him with glory and honour* (Psalms 8:5); *Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet* (Psalms 8:6).',
       sv.verse_id, ev.verse_id, 'extras', 58700
  FROM _session253_sir17_lookup sv, _session253_sir17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=17 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-17-the-law-of-life-everlasting-covenant',
       E'The law of life for an heritage, the everlasting covenant',
       E'The heart of the chapter: *Beside this he gave them knowledge, and the law of life for an heritage* (Ecclesiasticus 17:11); *He made an everlasting covenant with them, and shewed them his judgments* (Ecclesiasticus 17:12); *Their eyes saw the majesty of his glory, and their ears heard his glorious voice* (Ecclesiasticus 17:13). This is Sinai — the law given as life, not as curse. *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine* (Exodus 19:5); the covenant ratified in blood, *Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words* (Exodus 24:8). Moses set the same choice Ben Sira sets: *I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). And the everlasting covenant is the law written within — *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33). Ben Sira''s own crown-chapter names it plainly: the law that endureth IS Wisdom — *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob* (Ecclesiasticus 24:23).',
       sv.verse_id, ev.verse_id, 'extras', 58703
  FROM _session253_sir17_lookup sv, _session253_sir17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=17 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-17-law-written-in-the-heart',
       E'Counsel, a heart to understand, good and evil shewn — the law in the heart',
       E'Before Sinai''s tablets, Yahuah wrote on the man himself: *Counsel, and a tongue, and eyes, ears, and a heart, gave he them to understand* (Ecclesiasticus 17:6); *Withal he filled them with the knowledge of understanding, and shewed them good and evil* (Ecclesiasticus 17:7). The faculty to know good and evil and the heart that discerns is the law written within — exactly Paul''s argument: *For when the Gentiles, which have not the law, do by nature the things contained in the law, these, having not the law, are a law unto themselves* (Romans 2:14). This is why even the heathen are without excuse — the law of life (Sirach 17:11) is first inscribed in the conscience. Ben Sira''s Wisdom-chapter and Baruch both seal it: Wisdom is the enduring law — *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die* (Baruch 4:1).',
       sv.verse_id, ev.verse_id, 'extras', 58706
  FROM _session253_sir17_lookup sv, _session253_sir17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=17 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-17-israel-the-portion-bounds-of-nations',
       E'Israel the portion of Yahuah, the bounds of the nations set',
       E'*For in the division of the nations of the whole earth he set a ruler over every people; but Yashar''el (Israel) is the portion of Yahuah (God)* (Ecclesiasticus 17:17). It ain''t new — this is the Song of Moses: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8); *For the LORD''S portion is his people; Jacob is the lot of his inheritance* (Deuteronomy 32:9). Paul preaches the same allotment on Mars'' Hill — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26). The nations get rulers; Israel is kept as Yahuah''s own portion. Election stands.',
       sv.verse_id, ev.verse_id, 'extras', 58709
  FROM _session253_sir17_lookup sv, _session253_sir17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=17 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-17-all-works-before-him-recompense',
       E'Their ways ever before him; he renders recompence upon their heads',
       E'Nothing is hidden, and every work is repaid: *Their ways are ever before him, and shall not be hid from his eyes* (Ecclesiasticus 17:15); *Therefore all their works are as the sun before him, and his eyes are continually upon their ways* (Ecclesiasticus 17:19); *Afterwards he will rise up and reward them, and render their recompence upon their heads* (Ecclesiasticus 17:23). The all-seeing eye is Hebrews'' word — *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13). And the recompense is the Messiah''s own promise: *For the Son of Adam shall come in the glory of his Father with his angels; and then he shall reward every man according to his works* (Matthew 16:27); *And, behold, I come quickly; and my reward is with me, to give every man according as his work shall be* (Revelation 22:12).',
       sv.verse_id, ev.verse_id, 'extras', 58712
  FROM _session253_sir17_lookup sv, _session253_sir17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=17 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-17-call-to-repentance-turn-and-live',
       E'Return to Yahuah, forsake your sins, turn and live',
       E'The chapter turns to the altar call: *But to them that repent, he granted them return, and comforted those that failed in patience* (Ecclesiasticus 17:24); *Return to Yahuah (God), and forsake your sins, make your prayer before his face, and offend less* (Ecclesiasticus 17:25); *Turn again to the Most High, and turn away from iniquity* (Ecclesiasticus 17:26); *How great is the lovingkindness of Yahuah (God), our Elohim (God), and his compassion to such as turn to him in holiness!* (Ecclesiasticus 17:29). This is Ezekiel''s plea — *Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin* (Ezekiel 18:30); *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye* (Ezekiel 18:32). Peter carries the same patience — *is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance* (2 Peter 3:9) — James the same nearness — *Draw nigh to Elohim (God), and he will draw nigh to you* (James 4:8) — and heaven the same joy — *joy shall be in heaven over one sinner that repenteth* (Luke 15:7).',
       sv.verse_id, ev.verse_id, 'extras', 58715
  FROM _session253_sir17_lookup sv, _session253_sir17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=17 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-17-no-praise-in-the-grave',
       E'The dead praise not; the living and sound in heart give thanks',
       E'Ben Sira presses repentance now, for the grave is silent: *Who shall praise the Most High in the grave, instead of them which live and give thanks?* (Ecclesiasticus 17:27); *Thanksgiving perishes from the dead, as from one that is not: the living and sound in heart shall praise Yahuah (God)* (Ecclesiasticus 17:28). This is David''s plea verbatim — *For in death there is no remembrance of thee: in the grave who shall give thee thanks?* (Psalms 6:5); *The dead praise not Yahuah (LORD), neither any that go down into silence* (Psalms 115:17). The urgency is the same: turn while you live, for praise belongs to the living.',
       sv.verse_id, ev.verse_id, 'extras', 58718
  FROM _session253_sir17_lookup sv, _session253_sir17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=27
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=17 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-17-man-in-the-image
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* Sirach 17:3-4 names the very image-and-dominion grant of the sixth day.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-man-in-the-image'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Sirach 17:1 ''created man of the earth, and turned him into it again'' is Genesis 2:7 read with Genesis 3:19.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-man-in-the-image'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 9:2 — *And the fear of you and the dread of you shall be upon every beast of the earth, and upon every fowl of the air, upon all that moveth upon the earth, and upon all the fishes of the sea; into your hand are they delivered.* Sirach 17:4 ''put the fear of man upon all flesh'' is the Noahic dominion-grant verbatim.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-man-in-the-image'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 8:6 — *Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet:* the dominion Sirach 17:4 gives over beasts and fowls is the dominion David sings.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-man-in-the-image'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalms 8:5 — *For thou hast made him a little lower than the angels, and hast crowned him with glory and honour.* The man made ''according to his image'' (Sirach 17:3) is the man crowned with glory and honour.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-man-in-the-image'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-17-the-law-of-life-everlasting-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:5 — *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine:* the ''everlasting covenant'' of Sirach 17:12 is the Sinai covenant offered to Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-the-law-of-life-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 24:8 — *And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words.* The covenant Sirach 17:12 calls everlasting is the blood-ratified covenant of Sinai.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-the-law-of-life-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* the ''law of life'' of Sirach 17:11 is Moses'' choose-life Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-the-law-of-life-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 31:33 — *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* The everlasting covenant of Sirach 17:12 is the law written on the heart — same Torah, kept inwardly.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-the-law-of-life-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiasticus 24:23 — *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* Ben Sira''s own crown-chapter identifies the ''law of life for an heritage'' (Sirach 17:11) as the Torah and the book of the covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-the-law-of-life-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-17-law-written-in-the-heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 2:14 — *For when the Gentiles, which have not the law, do by nature the things contained in the law, these, having not the law, are a law unto themselves:* the heart ''shewed... good and evil'' in Sirach 17:7 is Paul''s law written in the conscience.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-law-written-in-the-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Baruch 4:1 — *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die.* Baruch names the ''law of life for an heritage'' (Sirach 17:11) the enduring commandment by which one lives.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-law-written-in-the-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* the heart and counsel given to understand good and evil (Sirach 17:6) equip man for Moses'' life-and-death choice.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-law-written-in-the-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-17-israel-the-portion-bounds-of-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* Sirach 17:17''s division of the nations with Israel kept apart is the Song of Moses verbatim.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-israel-the-portion-bounds-of-nations'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:9 — *For the LORD''S portion is his people; Jacob is the lot of his inheritance.* ''Israel is the portion of Yahuah'' (Sirach 17:17) repeats Moses'' word for word.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-israel-the-portion-bounds-of-nations'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 17:26 — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation;* Paul preaches the same set bounds of the nations Sirach 17:17 names.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-israel-the-portion-bounds-of-nations'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-17-all-works-before-him-recompense
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 4:13 — *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do.* Sirach 17:15 ''their ways... shall not be hid from his eyes'' is the same all-seeing scrutiny.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-all-works-before-him-recompense'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 16:27 — *For the Son of Adam shall come in the glory of his Father with his angels; and then he shall reward every man according to his works.* The Messiah''s coming recompense matches Sirach 17:23, ''render their recompence upon their heads.'''
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-all-works-before-him-recompense'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=16 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:12 — *And, behold, I come quickly; and my reward is with me, to give every man according as his work shall be.* The reward rendered upon every head in Sirach 17:23 is the reward carried at the Coming.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-all-works-before-him-recompense'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-17-call-to-repentance-turn-and-live
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 18:30 — *Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* Sirach 17:26 ''turn away from iniquity'' is Ezekiel''s turn-and-be-saved call.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-call-to-repentance-turn-and-live'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:32 — *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* The mercy granting return in Sirach 17:24 is Yahuah''s no-pleasure-in-death heart.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-call-to-repentance-turn-and-live'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The great lovingkindness toward those that turn (Sirach 17:29) is Peter''s longsuffering unto repentance.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-call-to-repentance-turn-and-live'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 4:8 — *Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded.* ''Make your prayer before his face, and offend less'' (Sirach 17:25) is James'' draw-nigh-and-cleanse summons.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-call-to-repentance-turn-and-live'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The return granted to them that repent (Sirach 17:24) is the heaven-joy over one sinner turning.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-call-to-repentance-turn-and-live'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-17-no-praise-in-the-grave
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 6:5 — *For in death there is no remembrance of thee: in the grave who shall give thee thanks?* Sirach 17:27 ''who shall praise the Most High in the grave'' is David''s question word for word.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-no-praise-in-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 115:17 — *The dead praise not Yahuah (LORD), neither any that go down into silence.* Sirach 17:28 ''thanksgiving perishes from the dead'' is the same silence of the grave.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-no-praise-in-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

